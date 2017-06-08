<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
/**
 * 网站首页
 */
class IndexController extends HomeBaseController {

    // 首页
    public function index(){
        $articles=D('Article')->getPageData();
        $assign=array(
            'articles'=>$articles['data'],
            'page'=>$articles['page'],
            'cid'=>'index'
            );
        $this->assign($assign);
        $this->display();
    }
 

    // 分类
    public function category(){
        $cid=I('get.cid',0,'intval');
        // 获取分类数据
        $category=D('Category')->getDataByCid($cid);
        // 如果分类不存在；则返回404页面
        if (empty($category)) {
            header("HTTP/1.0  404  Not Found");
            $this->display('./Template/default/Home/Public/404.html');
            exit(0);
        }
        // 获取分类下的文章数据
        $articles=D('Article')->getPageData($cid);
        $assign=array(
            'category'=>$category,
            'articles'=>$articles['data'],
            'page'=>$articles['page'],
            'cid'=>$cid
            );
        $this->assign($assign);
        $this->display();
    }

    // 标签
    public function tag(){
        $tid=I('get.tid',0,'intval');
        // 获取标签名
        $tname=D('Tag')->getFieldByTid($tid,'tname');
        // 如果标签不存在；则返回404页面
        if (empty($tname)) {
            header("HTTP/1.0  404  Not Found");
            $this->display('./Template/default/Home/Public/404.html');
            exit(0);
        }
        // 获取文章数据
        $articles=D('Article')->getPageData('all',$tid);
        $assign=array(
            'articles'=>$articles['data'],
            'page'=>$articles['page'],
            'title'=>$tname,
            'title_word'=>'拥有<span class="b-highlight">'.$tname.'</span>标签的文章',
            'cid'=>'index'
            );
        $this->assign($assign);
        $this->display();
    }

    // 文章内容
    public function article(){
        $aid=I('get.aid',0,'intval');
        $cid=intval(cookie('cid'));
        $tid=intval(cookie('tid'));
        $search_word=cookie('search_word');
        $search_word=empty($search_word) ? 0 : $search_word;
        $read=cookie('read');
        // 判断是否已经记录过aid
        if (array_key_exists($aid, $read)) {
            // 判断点击本篇文章的时间是否已经超过一天
            if ($read[$aid]-time()>=86400) {
                $read[$aid]=time();
                // 文章点击量+1
                M('Article')->where(array('aid'=>$aid))->setInc('click',1);
            }
        }else{
            $read[$aid]=time();
            // 文章点击量+1
            M('Article')->where(array('aid'=>$aid))->setInc('click',1);
        }
        cookie('read',$read,864000);
        switch(true){
            case $cid==0 && $tid==0 && $search_word==(string)0:
                $map=array();
                break;
            case $cid!=0:
                $map=array('cid'=>$cid);
                break;
            case $tid!=0:
                $map=array('tid'=>$tid);
                break;
            case $search_word!==0:
                $map=array('title'=>$search_word);
                break;
        }
        // 获取文章数据
        $article=D('Article')->getDataByAid($aid,$map);
        // 如果文章不存在；则返回404页面
        if (empty($article['current']['aid'])) {
            header("HTTP/1.0  404  Not Found");
            $this->display('./Template/default/Home/Public/404.html');
            exit(0);
        }
        // 获取评论数据
        $comment=D('Comment')->getChildData($aid);
        $assign=array(
            'article'=>$article,
            'comment'=>$comment,
            'cid'=>$article['current']['cid']
            );
        if (!empty($_SESSION['user']['id'])) {
            $assign['user_email']=M('Oauth_user')->getFieldById($_SESSION['user']['id'],'email');
        }
        $this->assign($assign);
        $this->display();
    }

    // 随言碎语
    public function chat(){
        $assign=array(
            'data'=>D('Chat')->getDataByState(0,1),
            'cid'=>'chat'
            );
        $this->assign($assign);
        $this->display();
    }

 

    // 站内搜索
    public function search(){
        $search_word=I('get.search_word');
        $articles=D('Article')->getDataByTitle($search_word);
        $assign=array(
            'articles'=>$articles['data'],
            'page'=>$articles['page'],
            'title'=>$search_word,
            'title_word'=>'搜索到的与<span class="b-highlight">'.$search_word.'</span>相关的文章',
            'cid'=>'index'
            );
        $this->assign($assign);
        $this->display('tag');
    }

    // ajax评论文章
    public function ajax_comment(){
        $data=I('post.');
        if(empty($data['content']) || !isset($_SESSION['user']['id'])){
            die('未登录,或内容为空');
        }else{
            $cmtid=D('Comment')->addData(1);
            echo $cmtid;
        }
    }


    
    
    // 文章内容
    public function myarticle(){
     
       $user= session('user');
     
         $data=D('Article')->getDataByAuthor($user['nickname']);
        $this->assign('data',$data['data']);
        $this->assign('page',$data['page']);
        $this->display();
        
    }
    // 修改文章
    public function myarticleupdate(){
        if(IS_POST){
            if(D('Article')->editData()){
                $this->success('修改成功');
            }
            else
            {
                $this->error('修改失败');
            }
        }else{
            $aid=I('aid');
            $data=D('Article')->getDataByAid($aid);
            $allCategory=D('Category')->getAllData();
            $allTag=D('Tag')->getAllData();
            $this->assign('allCategory',$allCategory);
            $this->assign('allTag',$allTag);
            $this->assign('data',$data);
            $this->display();
        }
    }
    
    
    // 添加文章
  
    public function myarticleadd(){
        if(IS_POST)
        {
            if($aid=D('Article')->addData())
            {
                $baidu_site_url=C('BAIDU_SITE_URL');
                if(!empty($baidu_site_url))
                {
                    //$this->baidu_site($aid);
                }
                $this->success('文章添加成功',U('Home/Index/myarticle'));
            }else{
                $this->error(D('Article')->getError());
            }
        }else{
            $allCategory=D('Category')->getAllData();
            if(empty($allCategory)){
                $this->error('请先添加分类');
            }
            $allTag=D('Tag')->getAllData();
            $this->assign('allCategory',$allCategory);
            $this->assign('allTag',$allTag);
            $this->display();
        }
    
    }
   
    
    // 根据$_GET数组放入回收站
    public function recycle(){
        $data=I('get.');
        M($data['table_name'])->where(array($data['id_name']=>$data['id_number']))->setField('is_delete',1);
        $this->success('放入回收站成功');
    }
    // 添加用户
    public function reg(){
        if(IS_POST){
             
            if(D('OauthUser')->addData()){
                $this->success('用户添加成功',U('Home/Index/index'));
            }else{
                $this->error(D('OauthUser')->getError());
            }
        }
        else{
            $this->display();
        }
    }

}
