<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
class UserController extends HomeBaseController {

    // 第三方平台登录
    public function oauth_login(){
        $type=I('get.type');
        import("Org.ThinkSDK.ThinkOauth");
        $sdk=\ThinkOauth::getInstance($type);
        redirect($sdk->getRequestCodeURL());
    }

    // 本系统的登录
    public function user_login(){
        $data=I('post.');
    
        $users=D('OauthUser')->checkLogin($data['nickname'],$data['user_pass']);
      
        
        if(isset($users))
        {
           
            session('user',$users);
     
           $this->success('登录成功',U('Home/Index/index'));
        }
        else{
            $this->success('用户名或密码错误!',U('Home/Index/index'));
        }
    }
    

    // 第三方平台退出
    public function logout(){
        session('user',null);
        session('admin',null);
    }

    // 判断是否登录
    public function check_login(){
        if(isset($_SESSION['user']['id'])){
            echo 1;
        }else{
            echo 0;
        }
    }


}
