/*
Navicat MySQL Data Transfer

Source Server         : xamp
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : bjy

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-05-22 08:16:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bjy_article`
-- ----------------------------
DROP TABLE IF EXISTS `bjy_article`;
CREATE TABLE `bjy_article` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章表主键',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '标题',
  `author` varchar(15) NOT NULL DEFAULT '' COMMENT '作者',
  `content` mediumtext NOT NULL COMMENT '文章内容',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` char(255) NOT NULL DEFAULT '' COMMENT '描述',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章是否显示 1是 0否',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除 1是 0否',
  `is_top` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶 1是 0否',
  `is_original` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否原创',
  `click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `cid` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bjy_article
-- ----------------------------
INSERT INTO `bjy_article` VALUES ('17', '测试文章标题', '谁啊', '&lt;p&gt;测试文章内容&lt;/p&gt;', '关键词,多个', '测试文章描述', '1', '0', '1', '1', '377', '1432649909', '28');
INSERT INTO `bjy_article` VALUES ('18', '第一个php技术', '你好', '&lt;p&gt;文章要这么样才能写好，我怎么会直达呢&lt;/p&gt;', '', '文章要这么样才能写好', '1', '0', '1', '1', '1', '1494287756', '29');
INSERT INTO `bjy_article` VALUES ('19', '不知道上传什么东西', '上传人', '&lt;p&gt;&lt;span style=&quot;color: rgb(79, 129, 189);&quot;&gt;&lt;strong&gt;范德萨范德萨范德萨范德萨werewolf热污染奋斗史&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(79, 129, 189);&quot;&gt;&lt;strong&gt;&lt;br/&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/bjy2/Upload/image/ueditor/20170510/1494373976101331.jpg&quot; title=&quot;白俊遥博客&quot; alt=&quot;白俊遥博客&quot;/&gt;&lt;span style=&quot;color: rgb(79, 129, 189);&quot;&gt;&lt;strong&gt;&lt;br/&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(79, 129, 189);&quot;&gt;&lt;strong&gt;&lt;br/&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(79, 129, 189);&quot;&gt;&lt;strong&gt;发大水发生的&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(79, 129, 189);&quot;&gt;&lt;strong&gt;fdsa&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(79, 129, 189);&quot;&gt;&lt;/span&gt;&lt;img src=&quot;/bjy2/Upload/image/ueditor/20170510/1494374017115505.jpg&quot; title=&quot;白俊遥博客&quot; alt=&quot;白俊遥博客&quot;/&gt;&lt;/p&gt;', '上传人', '范德萨范德萨范德萨范德萨werewolf热污染奋斗史发大水发生的fdsa', '1', '0', '0', '0', '1', '1494374043', '29');
INSERT INTO `bjy_article` VALUES ('20', '天天发小说', '默认作者', '&lt;p&gt;&lt;img width=&quot;809&quot; height=&quot;382&quot; src=&quot;http://api.map.baidu.com/staticimage?center=119.022429,33.616272&amp;zoom=13&amp;width=530&amp;height=340&amp;markers=119.022429,33.616272&quot; style=&quot;width: 809px; height: 382px;&quot;/&gt;&lt;/p&gt;', '', '', '1', '0', '1', '1', '1', '1494404731', '28');

-- ----------------------------
-- Table structure for `bjy_article_pic`
-- ----------------------------
DROP TABLE IF EXISTS `bjy_article_pic`;
CREATE TABLE `bjy_article_pic` (
  `ap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `path` varchar(100) NOT NULL DEFAULT '' COMMENT '图片路径',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属文章id',
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bjy_article_pic
-- ----------------------------
INSERT INTO `bjy_article_pic` VALUES ('15', '/Upload/image/ueditor/20170510/1494373976101331.jpg', '19');
INSERT INTO `bjy_article_pic` VALUES ('16', '/Upload/image/ueditor/20170510/1494374017115505.jpg', '19');

-- ----------------------------
-- Table structure for `bjy_article_tag`
-- ----------------------------
DROP TABLE IF EXISTS `bjy_article_tag`;
CREATE TABLE `bjy_article_tag` (
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bjy_article_tag
-- ----------------------------
INSERT INTO `bjy_article_tag` VALUES ('20', '22');
INSERT INTO `bjy_article_tag` VALUES ('19', '21');
INSERT INTO `bjy_article_tag` VALUES ('19', '22');
INSERT INTO `bjy_article_tag` VALUES ('18', '21');
INSERT INTO `bjy_article_tag` VALUES ('17', '20');

-- ----------------------------
-- Table structure for `bjy_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `bjy_attachment`;
CREATE TABLE `bjy_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '原文件名',
  `filepath` varchar(200) NOT NULL DEFAULT '',
  `filetype` smallint(6) NOT NULL DEFAULT '1',
  `filesize` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `haslitpic` tinyint(1) NOT NULL DEFAULT '1',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bjy_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `bjy_category`
-- ----------------------------
DROP TABLE IF EXISTS `bjy_category`;
CREATE TABLE `bjy_category` (
  `cid` tinyint(2) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类主键id',
  `cname` varchar(15) NOT NULL DEFAULT '' COMMENT '分类名称',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键词',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `sort` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `pid` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '父级栏目id',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bjy_category
-- ----------------------------
INSERT INTO `bjy_category` VALUES ('28', '小说', '测试分类关键词', '测试分类描述', '1', '0');
INSERT INTO `bjy_category` VALUES ('29', 'php技术', '', '', '3', '0');

-- ----------------------------
-- Table structure for `bjy_chat`
-- ----------------------------
DROP TABLE IF EXISTS `bjy_chat`;
CREATE TABLE `bjy_chat` (
  `chid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '碎言id',
  `date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表时间',
  `content` text NOT NULL COMMENT '内容',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`chid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bjy_chat
-- ----------------------------
INSERT INTO `bjy_chat` VALUES ('4', '1494287616', '这是碎言的功能，我添加一下。', '1', '0');
INSERT INTO `bjy_chat` VALUES ('5', '1495411946', '今天再次测试', '1', '0');
INSERT INTO `bjy_chat` VALUES ('6', '1495411983', '今天好吗', '1', '0');

-- ----------------------------
-- Table structure for `bjy_comment`
-- ----------------------------
DROP TABLE IF EXISTS `bjy_comment`;
CREATE TABLE `bjy_comment` (
  `cmtid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ouid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论用户id 关联oauth_user表的id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1：文章评论',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `aid` int(10) unsigned NOT NULL COMMENT '文章id',
  `content` text NOT NULL COMMENT '内容',
  `date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论日期',
  `status` tinyint(1) unsigned NOT NULL COMMENT '1:已审核 0：未审核',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`cmtid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bjy_comment
-- ----------------------------
INSERT INTO `bjy_comment` VALUES ('19', '1', '1', '0', '17', '测试评论&lt;img src=&quot;/Public/emote/tuzki/t_0002.gif&quot; title=&quot;Love&quot; alt=&quot;白俊遥博客&quot;&gt;', '1445747059', '1', '0');
INSERT INTO `bjy_comment` VALUES ('21', '1', '1', '19', '17', '测试回复', '1447943018', '1', '0');

-- ----------------------------
-- Table structure for `bjy_config`
-- ----------------------------
DROP TABLE IF EXISTS `bjy_config`;
CREATE TABLE `bjy_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置项键名',
  `value` text COMMENT '配置项键值 1表示开启 0 关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bjy_config
-- ----------------------------
INSERT INTO `bjy_config` VALUES ('1', 'WEB_NAME', '博客');
INSERT INTO `bjy_config` VALUES ('2', 'WEB_KEYWORDS', '技术博客,个人博客');
INSERT INTO `bjy_config` VALUES ('3', 'WEB_DESCRIPTION', '技术博客');
INSERT INTO `bjy_config` VALUES ('4', 'WEB_STATUS', '1');
INSERT INTO `bjy_config` VALUES ('5', 'ADMIN_PASSWORD', '21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `bjy_config` VALUES ('6', 'WATER_TYPE', '1');
INSERT INTO `bjy_config` VALUES ('7', 'TEXT_WATER_WORD', 'admin.com');
INSERT INTO `bjy_config` VALUES ('8', 'TEXT_WATER_TTF_PTH', './Public/static/font/ariali.ttf');
INSERT INTO `bjy_config` VALUES ('9', 'TEXT_WATER_FONT_SIZE', '15');
INSERT INTO `bjy_config` VALUES ('10', 'TEXT_WATER_COLOR', '#008CBA');
INSERT INTO `bjy_config` VALUES ('11', 'TEXT_WATER_ANGLE', '0');
INSERT INTO `bjy_config` VALUES ('12', 'TEXT_WATER_LOCATE', '9');
INSERT INTO `bjy_config` VALUES ('13', 'IMAGE_WATER_PIC_PTAH', './Upload/image/logo/logo.png');
INSERT INTO `bjy_config` VALUES ('14', 'IMAGE_WATER_LOCATE', '9');
INSERT INTO `bjy_config` VALUES ('15', 'IMAGE_WATER_ALPHA', '60');
INSERT INTO `bjy_config` VALUES ('16', 'WEB_CLOSE_WORD', '网站升级中，请稍后访问。');
INSERT INTO `bjy_config` VALUES ('17', 'WEB_ICP_NUMBER', '豫ICP备0000001号-2');
INSERT INTO `bjy_config` VALUES ('18', 'ADMIN_EMAIL', 'admin@admin.com');
INSERT INTO `bjy_config` VALUES ('19', 'COPYRIGHT_WORD', '文章保留版权提示');
INSERT INTO `bjy_config` VALUES ('20', 'QQ_APP_ID', '');
INSERT INTO `bjy_config` VALUES ('21', 'CHANGYAN_APP_ID', 'cyrKRbJ5N');
INSERT INTO `bjy_config` VALUES ('22', 'CHANGYAN_CONF', 'prod_c654661caf5ab6da98742d040413815b');
INSERT INTO `bjy_config` VALUES ('23', 'WEB_STATISTICS', '');
INSERT INTO `bjy_config` VALUES ('24', 'CHANGEYAN_RETURN_COMMENT', '');
INSERT INTO `bjy_config` VALUES ('25', 'AUTHOR', '默认作者');
INSERT INTO `bjy_config` VALUES ('26', 'QQ_APP_KEY', '');
INSERT INTO `bjy_config` VALUES ('27', 'CHANGYAN_COMMENT', '');
INSERT INTO `bjy_config` VALUES ('28', 'BAIDU_SITE_URL', '');
INSERT INTO `bjy_config` VALUES ('29', 'DOUBAN_API_KEY', '');
INSERT INTO `bjy_config` VALUES ('30', 'DOUBAN_SECRET', '');
INSERT INTO `bjy_config` VALUES ('31', 'RENREN_API_KEY', '');
INSERT INTO `bjy_config` VALUES ('32', 'RENREN_SECRET', '');
INSERT INTO `bjy_config` VALUES ('33', 'SINA_API_KEY', '');
INSERT INTO `bjy_config` VALUES ('34', 'SINA_SECRET', '');
INSERT INTO `bjy_config` VALUES ('35', 'KAIXIN_API_KEY', '');
INSERT INTO `bjy_config` VALUES ('36', 'KAIXIN_SECRET', '');
INSERT INTO `bjy_config` VALUES ('37', 'SOHU_API_KEY', '');
INSERT INTO `bjy_config` VALUES ('38', 'SOHU_SECRET', '');
INSERT INTO `bjy_config` VALUES ('39', 'GITHUB_CLIENT_ID', '');
INSERT INTO `bjy_config` VALUES ('40', 'GITHUB_CLIENT_SECRET', '');
INSERT INTO `bjy_config` VALUES ('41', 'IMAGE_TITLE_ALT_WORD', '博客');
INSERT INTO `bjy_config` VALUES ('42', 'EMAIL_SMTP', 'smtp.qq.com');
INSERT INTO `bjy_config` VALUES ('43', 'EMAIL_USERNAME', 'xrt2@qq.com');
INSERT INTO `bjy_config` VALUES ('44', 'EMAIL_PASSWORD', '123');
INSERT INTO `bjy_config` VALUES ('45', 'EMAIL_FROM_NAME', 'xiang');
INSERT INTO `bjy_config` VALUES ('46', 'COMMENT_REVIEW', '1');
INSERT INTO `bjy_config` VALUES ('47', 'COMMENT_SEND_EMAIL', '0');
INSERT INTO `bjy_config` VALUES ('48', 'EMAIL_RECEIVE', '');

-- ----------------------------
-- Table structure for `bjy_link`
-- ----------------------------
DROP TABLE IF EXISTS `bjy_link`;
CREATE TABLE `bjy_link` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `lname` varchar(50) NOT NULL DEFAULT '' COMMENT '链接名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章是否显示 1是 0否',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除 1是 0否',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bjy_link
-- ----------------------------
INSERT INTO `bjy_link` VALUES ('2', '百度', 'http://www.baidu.com', '1', '1', '0');

-- ----------------------------
-- Table structure for `bjy_oauth_user`
-- ----------------------------
DROP TABLE IF EXISTS `bjy_oauth_user`;
CREATE TABLE `bjy_oauth_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联的本站用户id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1：QQ  2：新浪微博 3：豆瓣 4：人人 5：开心网',
  `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '第三方昵称',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `access_token` varchar(255) NOT NULL DEFAULT '' COMMENT 'access_token token',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `login_times` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bjy_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `bjy_tag`
-- ----------------------------
DROP TABLE IF EXISTS `bjy_tag`;
CREATE TABLE `bjy_tag` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签主键',
  `tname` varchar(10) NOT NULL DEFAULT '' COMMENT '标签名',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bjy_tag
-- ----------------------------
INSERT INTO `bjy_tag` VALUES ('20', '测试标签');
INSERT INTO `bjy_tag` VALUES ('21', '技术');
INSERT INTO `bjy_tag` VALUES ('22', '生活');
