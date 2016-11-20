/*
Navicat MySQL Data Transfer

Source Server         : MYSQL
Source Server Version : 50634
Source Host           : localhost:3306
Source Database       : shiro

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2016-11-20 22:55:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `building_name` varchar(100) DEFAULT NULL,
  `building_address` varchar(100) DEFAULT NULL,
  `building_own` varchar(50) DEFAULT NULL,
  `own_phone` decimal(14,0) DEFAULT NULL,
  `building_manager` varchar(50) DEFAULT NULL,
  `manager_phone` decimal(14,0) DEFAULT NULL,
  `room_count` int(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO `building` VALUES ('1', 'TEST', 'testtesttesttesttest', 'testtesttest', '123123123', 'testtest', '23123123', '1212', 'test');
INSERT INTO `building` VALUES ('2', 'test2', 'test2', 'xxxxx', '121231', 'zzzz', '112121', '1212', 'testtset');
INSERT INTO `building` VALUES ('3', '海岸花园', '顺德北滘', '张三', '14567832222', '李四', '12312312', '12', 'test');

-- ----------------------------
-- Table structure for cost
-- ----------------------------
DROP TABLE IF EXISTS `cost`;
CREATE TABLE `cost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `electric_charge` double DEFAULT NULL,
  `water_charge` double DEFAULT NULL,
  `internet_charge` double DEFAULT NULL,
  `tv_charge` double DEFAULT NULL,
  `gas_charge` double DEFAULT NULL,
  `equally_charge` double DEFAULT NULL,
  `other_charge` double DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_icelandic_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='cost';

-- ----------------------------
-- Records of cost
-- ----------------------------

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '组织名',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `code` varchar(64) NOT NULL COMMENT '编号',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级主键',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', '总经办', '', '01', 'icon-company', null, '0', '2014-02-19 01:00:00');
INSERT INTO `organization` VALUES ('3', '技术部', '', '02', 'icon-company', null, '1', '2015-10-01 13:10:42');
INSERT INTO `organization` VALUES ('5', '产品部', '', '03', 'icon-company', null, '2', '2015-12-06 12:15:30');
INSERT INTO `organization` VALUES ('6', '测试组', '', '04', 'icon-folder', '3', '0', '2015-12-06 13:12:18');
INSERT INTO `organization` VALUES ('7', '水琴海岸', '广东省佛山市顺德区北滘水琴海岸', '05', 'icon-folder', null, '0', '2016-11-11 18:05:19');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '资源名称',
  `url` varchar(100) DEFAULT NULL COMMENT '资源路径',
  `description` varchar(255) DEFAULT NULL COMMENT '资源介绍',
  `icon` varchar(32) DEFAULT NULL COMMENT '资源图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级资源id',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `resource_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '资源类别',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '权限管理', '', '系统管理', 'icon-company', null, '0', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('11', '资源管理', '/resource/manager', '资源管理', 'menu_icon_datadeal', '1', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('12', '角色管理', '/role/manager', '角色管理', 'menu_icon_datadeal', '1', '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('13', '用户管理', '/user/manager', '用户管理', 'menu_icon_datadeal', '1', '3', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('14', '部门管理', '/organization/manager', '部门管理', 'menu_icon_datadeal', '1', '4', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('111', '列表', '/resource/treeGrid', '资源列表', 'icon-list', '11', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('112', '添加', '/resource/add', '资源添加', 'icon-add', '11', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('113', '编辑', '/resource/edit', '资源编辑', 'icon-edit', '11', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('114', '删除', '/resource/delete', '资源删除', 'icon-del', '11', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('121', '列表', '/role/dataGrid', '角色列表', 'icon-list', '12', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('122', '添加', '/role/add', '角色添加', 'icon-add', '12', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('123', '编辑', '/role/edit', '角色编辑', 'icon-edit', '12', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('124', '删除', '/role/delete', '角色删除', 'icon-del', '12', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('125', '授权', '/role/grant', '角色授权', 'icon-ok', '12', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('131', '列表', '/user/dataGrid', '用户列表', 'icon-list', '13', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('132', '添加', '/user/add', '用户添加', 'icon-add', '13', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('133', '编辑', '/user/edit', '用户编辑', 'icon-edit', '13', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('134', '删除', '/user/delete', '用户删除', 'icon-del', '13', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('141', '列表', '/organization/treeGrid', '用户列表', 'icon-list', '14', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('142', '添加', '/organization/add', '部门添加', 'icon-add', '14', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('143', '编辑', '/organization/edit', '部门编辑', 'icon-edit', '14', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('144', '删除', '/organization/delete', '部门删除', 'icon-del', '14', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('221', '日志监控', '', null, 'icon-company', null, '2', '0', '0', '2015-12-01 11:44:20');
INSERT INTO `resource` VALUES ('222', '设置管理', '', null, 'icon-company', null, '1', '0', '0', '2015-12-06 12:40:42');
INSERT INTO `resource` VALUES ('223', '房间管理', '/room/roomPage', null, 'menu_icon_datadeal', '222', '0', '0', '0', '2016-11-19 17:03:27');
INSERT INTO `resource` VALUES ('224', '楼房管理', '/building/BuildingPage', null, 'menu_icon_datadeal', '222', '1', '0', '0', '2016-11-17 22:03:47');
INSERT INTO `resource` VALUES ('226', '修改密码', '/user/editPwdPage', null, 'icon-edit', null, '3', '0', '1', '2015-12-07 20:23:06');
INSERT INTO `resource` VALUES ('227', '登录日志', '/sysLog/manager', null, 'menu_icon_datadeal', '221', '0', '0', '0', '2016-09-30 22:10:53');
INSERT INTO `resource` VALUES ('228', 'Druid监控', '/druid', null, 'menu_icon_datadeal', '221', '0', '0', '0', '2016-09-30 22:12:50');
INSERT INTO `resource` VALUES ('229', '菜单测试', '', null, 'icon-company', null, '0', '0', '0', '2016-11-12 15:44:09');
INSERT INTO `resource` VALUES ('230', '添加', '/building/add', null, 'icon-add', '224', '0', '0', '1', '2016-11-19 16:15:38');
INSERT INTO `resource` VALUES ('231', '编辑', '/building/edit', null, 'icon-edit', '224', '1', '0', '1', '2016-11-19 16:21:55');
INSERT INTO `resource` VALUES ('232', '删除', '/building/delete', null, 'icon-del', '224', '2', '0', '1', '2016-11-19 16:22:49');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '角色名',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序号',
  `description` varchar(255) DEFAULT NULL COMMENT '简介',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '0', '超级管理员', '0');
INSERT INTO `role` VALUES ('2', '技术部经理', '0', '技术部经理', '0');
INSERT INTO `role` VALUES ('7', '产品部经理', '0', '产品部经理', '0');
INSERT INTO `role` VALUES ('8', '测试账户', '0', '测试账户', '0');

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  `resource_id` bigint(19) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=596 DEFAULT CHARSET=utf8 COMMENT='角色资源';

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('158', '3', '1');
INSERT INTO `role_resource` VALUES ('159', '3', '11');
INSERT INTO `role_resource` VALUES ('160', '3', '111');
INSERT INTO `role_resource` VALUES ('161', '3', '112');
INSERT INTO `role_resource` VALUES ('162', '3', '113');
INSERT INTO `role_resource` VALUES ('163', '3', '114');
INSERT INTO `role_resource` VALUES ('164', '3', '12');
INSERT INTO `role_resource` VALUES ('165', '3', '121');
INSERT INTO `role_resource` VALUES ('166', '3', '122');
INSERT INTO `role_resource` VALUES ('167', '3', '123');
INSERT INTO `role_resource` VALUES ('168', '3', '124');
INSERT INTO `role_resource` VALUES ('169', '3', '125');
INSERT INTO `role_resource` VALUES ('170', '3', '13');
INSERT INTO `role_resource` VALUES ('171', '3', '131');
INSERT INTO `role_resource` VALUES ('172', '3', '132');
INSERT INTO `role_resource` VALUES ('173', '3', '133');
INSERT INTO `role_resource` VALUES ('174', '3', '134');
INSERT INTO `role_resource` VALUES ('175', '3', '14');
INSERT INTO `role_resource` VALUES ('176', '3', '141');
INSERT INTO `role_resource` VALUES ('177', '3', '142');
INSERT INTO `role_resource` VALUES ('178', '3', '143');
INSERT INTO `role_resource` VALUES ('179', '3', '144');
INSERT INTO `role_resource` VALUES ('359', '7', '1');
INSERT INTO `role_resource` VALUES ('360', '7', '14');
INSERT INTO `role_resource` VALUES ('361', '7', '141');
INSERT INTO `role_resource` VALUES ('362', '7', '142');
INSERT INTO `role_resource` VALUES ('363', '7', '143');
INSERT INTO `role_resource` VALUES ('364', '7', '222');
INSERT INTO `role_resource` VALUES ('365', '7', '223');
INSERT INTO `role_resource` VALUES ('366', '7', '224');
INSERT INTO `role_resource` VALUES ('367', '7', '221');
INSERT INTO `role_resource` VALUES ('368', '7', '226');
INSERT INTO `role_resource` VALUES ('437', '2', '1');
INSERT INTO `role_resource` VALUES ('438', '2', '13');
INSERT INTO `role_resource` VALUES ('439', '2', '131');
INSERT INTO `role_resource` VALUES ('440', '2', '132');
INSERT INTO `role_resource` VALUES ('441', '2', '133');
INSERT INTO `role_resource` VALUES ('442', '2', '222');
INSERT INTO `role_resource` VALUES ('443', '2', '223');
INSERT INTO `role_resource` VALUES ('444', '2', '224');
INSERT INTO `role_resource` VALUES ('445', '2', '221');
INSERT INTO `role_resource` VALUES ('446', '2', '227');
INSERT INTO `role_resource` VALUES ('447', '2', '228');
INSERT INTO `role_resource` VALUES ('463', '8', '1');
INSERT INTO `role_resource` VALUES ('464', '8', '11');
INSERT INTO `role_resource` VALUES ('465', '8', '111');
INSERT INTO `role_resource` VALUES ('466', '8', '12');
INSERT INTO `role_resource` VALUES ('467', '8', '121');
INSERT INTO `role_resource` VALUES ('468', '8', '13');
INSERT INTO `role_resource` VALUES ('469', '8', '131');
INSERT INTO `role_resource` VALUES ('470', '8', '14');
INSERT INTO `role_resource` VALUES ('471', '8', '141');
INSERT INTO `role_resource` VALUES ('472', '8', '223');
INSERT INTO `role_resource` VALUES ('473', '8', '224');
INSERT INTO `role_resource` VALUES ('474', '8', '227');
INSERT INTO `role_resource` VALUES ('475', '8', '228');
INSERT INTO `role_resource` VALUES ('565', '1', '1');
INSERT INTO `role_resource` VALUES ('566', '1', '11');
INSERT INTO `role_resource` VALUES ('567', '1', '111');
INSERT INTO `role_resource` VALUES ('568', '1', '112');
INSERT INTO `role_resource` VALUES ('569', '1', '113');
INSERT INTO `role_resource` VALUES ('570', '1', '114');
INSERT INTO `role_resource` VALUES ('571', '1', '12');
INSERT INTO `role_resource` VALUES ('572', '1', '121');
INSERT INTO `role_resource` VALUES ('573', '1', '122');
INSERT INTO `role_resource` VALUES ('574', '1', '123');
INSERT INTO `role_resource` VALUES ('575', '1', '124');
INSERT INTO `role_resource` VALUES ('576', '1', '125');
INSERT INTO `role_resource` VALUES ('577', '1', '13');
INSERT INTO `role_resource` VALUES ('578', '1', '131');
INSERT INTO `role_resource` VALUES ('579', '1', '132');
INSERT INTO `role_resource` VALUES ('580', '1', '133');
INSERT INTO `role_resource` VALUES ('581', '1', '134');
INSERT INTO `role_resource` VALUES ('582', '1', '14');
INSERT INTO `role_resource` VALUES ('583', '1', '141');
INSERT INTO `role_resource` VALUES ('584', '1', '142');
INSERT INTO `role_resource` VALUES ('585', '1', '143');
INSERT INTO `role_resource` VALUES ('586', '1', '144');
INSERT INTO `role_resource` VALUES ('587', '1', '222');
INSERT INTO `role_resource` VALUES ('588', '1', '223');
INSERT INTO `role_resource` VALUES ('589', '1', '224');
INSERT INTO `role_resource` VALUES ('590', '1', '230');
INSERT INTO `role_resource` VALUES ('591', '1', '231');
INSERT INTO `role_resource` VALUES ('592', '1', '232');
INSERT INTO `role_resource` VALUES ('593', '1', '221');
INSERT INTO `role_resource` VALUES ('594', '1', '227');
INSERT INTO `role_resource` VALUES ('595', '1', '228');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `mon_rent` double DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `liver` int(11) DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of room
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(255) DEFAULT NULL COMMENT '登陆名',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `opt_content` varchar(1024) DEFAULT NULL COMMENT '内容',
  `client_ip` varchar(255) DEFAULT NULL COMMENT '客户端ip',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=496 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('391', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:login,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('392', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('393', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:login,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('394', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:loginPost,[参数]:username=admin&password=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('395', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:login,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('396', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:login,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('397', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('398', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:loginPost,[参数]:username=admin&password=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('399', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:login,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('400', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('401', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:login,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('402', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('403', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('404', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('405', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:editPage,[参数]:id=5&_=1478691532803&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('406', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:edit,[参数]:id=5&code=03&name=产品部&seq=2&icon=icon-company&address=&pid=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('407', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:edit,[参数]:id=5&code=03&name=产品部&seq=2&icon=icon-company&address=&pid=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('408', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:editPage,[参数]:id=5&_=1478691532804&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('409', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:edit,[参数]:id=5&code=03&name=产品部&seq=2&icon=icon-company&address=&pid=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('410', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('411', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:add,[参数]:loginName=test01&name=test&password=123&sex=0&age=&userType=1&organizationId=6&roleIds=8&phone=&status=0&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('412', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:add,[参数]:loginName=test01&name=test&password=123&sex=0&age=&userType=1&organizationId=6&roleIds=8&phone=&status=0&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('413', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:add,[参数]:loginName=test01&name=test&password=123&sex=0&age=&userType=1&organizationId=6&roleIds=8&phone=&status=0&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('414', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('415', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:add,[参数]:loginName=test02&name=test02&password=123&sex=0&age=&userType=1&organizationId=6&roleIds=8&phone=&status=0&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('416', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:delete,[参数]:id=17&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('417', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:delete,[参数]:id=16&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('418', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('419', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('420', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('421', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=8&_=1478844969846&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('422', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=8&resourceIds=1,11,111,12,121,13,131,14,141,223,224,227,228&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('423', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=8&_=1478844969847&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('424', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:edit,[参数]:id=8&name=测试账户&seq=0&status=0&description=测试账户&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('425', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('426', 'test', 'test', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('427', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('428', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:login,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('429', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=1&_=1478857110678&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('430', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=15&_=1478857110679&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('431', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:edit,[参数]:id=15&loginName=test&name=test&password=&sex=0&age=25&userType=1&organizationId=6&roleIds=8&phone=18707173376&status=0&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('432', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('433', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:add,[参数]:code=05&name=水琴海岸&seq=3&icon=icon-folder&address=广东省佛山市顺德区北滘水琴海岸&pid=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('434', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:add,[参数]:code=05&name=水琴海岸&seq=3&icon=icon-folder&address=广东省佛山市顺德区北滘水琴海岸&pid=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('435', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('436', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:add,[参数]:code=05&name=水琴海岸&seq=0&icon=icon-folder&address=广东省佛山市顺德区北滘水琴海岸&pid=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('437', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:editPage,[参数]:id=7&_=1478857110682&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('438', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:login,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('439', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:loginPost,[参数]:username=admin&password=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('440', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('441', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=菜单测试&resourceType=0&url=&seq=0&icon=&status=0&pid=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('442', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=菜单测试&resourceType=0&url=&seq=0&icon=&status=0&pid=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('443', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=229&_=1478936301765&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('444', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=229&name=菜单测试&resourceType=0&url=&seq=0&icon=icon-company&status=0&pid=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('445', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addBuilding,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('446', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addBuilding,[参数]:buildingName=测试&buildingAddress=佛山顺德&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('447', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addBuilding,[参数]:buildingName=测试&buildingAddress=佛山顺德&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('448', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('449', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:add,[参数]:loginName=test2&name=test2&password=123&sex=0&age=&userType=1&organizationId=7&roleIds=8&phone=&status=0&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('450', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('451', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=1&_=1479521603949&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('452', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&name=testtesttesttesttest&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('453', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&name=测试&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('454', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=16&_=1479522761419&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('455', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:edit,[参数]:id=16&loginName=test211&name=test2&password=&sex=0&age=&userType=1&organizationId=7&roleIds=8&phone=&status=0&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('456', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&name=testtesttesttesttest&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('457', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&name=测试&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('458', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&buildingName=测试&buildingAddress=testtesttesttesttest&buildingOwn=testtesttest&ownPhone=123123123&buildingManager=testtest&managerPhone=23123123&roomCount=1212&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('459', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&buildingName=TEST&buildingAddress=testtesttesttesttest&buildingOwn=testtesttest&ownPhone=123123123&buildingManager=testtest&managerPhone=23123123&roomCount=1212&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('460', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('461', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('462', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('463', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('464', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:add,[参数]:id=&buildingName=test2&buildingAddress=test2&buildingOwn=xxxxx&ownPhone=121231&buildingManager=zzzz&managerPhone=112121&roomCount=1212&remark=testtset&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('465', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=2&buildingName=test2&buildingAddress=test2&buildingOwn=xxxxx&ownPhone=121231&buildingManager=zzzz&managerPhone=112121&roomCount=1212&remark=testtset&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('466', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=224&_=1479542953406&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('467', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('468', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=添加&resourceType=1&url=/building/add&seq=0&icon=icon-add&status=0&pid=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('469', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=230&_=1479542953408&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('470', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=230&name=添加&resourceType=1&url=/building/add&seq=0&icon=icon-add&status=0&pid=224&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('471', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1479543413862&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('472', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,222,223,224,230,221,227,228&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('473', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=122&_=1479543460330&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('474', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=230&_=1479543460331&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('475', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=1&_=1479543460332&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('476', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1479543460333&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('477', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,222,223,224,230,221,227,228&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('478', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('479', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:add,[参数]:id=&buildingName=test3&buildingAddress=test3&buildingOwn=test33&ownPhone=123231&buildingManager=xxx&managerPhone=123123221312&roomCount=12&remark=121212&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('480', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('481', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=编辑&resourceType=1&url=/building/edit&seq=1&icon=icon-edit&status=0&pid=224&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('482', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('483', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=删除&resourceType=1&url=/building/delete&seq=2&icon=icon-del&status=0&pid=224&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('484', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1479543822454&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('485', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,222,223,224,230,231,232,221,227,228&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('486', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=1&_=1479543859692&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('487', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1479543859693&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('488', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,222,223,224,230,231,232,221,227,228&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('489', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:delete,[参数]:id=3&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('490', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:editPage,[参数]:id=3&_=1479547898517&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('491', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('492', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('493', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:add,[参数]:id=&buildingName=海岸花园&buildingAddress=顺德北滘&buildingOwn=张三&ownPhone=14567832222&buildingManager=李四&managerPhone=12312312&roomCount=12&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('494', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:loginPost,[参数]:username=admin&password=test&', '127.0.0.1', null);
INSERT INTO `sys_log` VALUES ('495', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:login,[参数]:', null, null);

-- ----------------------------
-- Table structure for tenant
-- ----------------------------
DROP TABLE IF EXISTS `tenant`;
CREATE TABLE `tenant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `sex` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `tel` decimal(10,0) DEFAULT NULL,
  `identity_card` decimal(10,0) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tenant';

-- ----------------------------
-- Records of tenant
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(64) NOT NULL COMMENT '登陆名',
  `name` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `age` tinyint(2) DEFAULT '0' COMMENT '年龄',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `user_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户类别',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `organization_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属机构',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '098f6bcd4621d373cade4e832627b4f6', '0', '25', '18707173376', '0', '0', '1', '2015-12-06 13:14:05');
INSERT INTO `user` VALUES ('13', 'snoopy', 'snoopy', '098f6bcd4621d373cade4e832627b4f6', '0', '25', '18707173376', '1', '0', '3', '2015-10-01 13:12:07');
INSERT INTO `user` VALUES ('14', 'dreamlu', 'dreamlu', '098f6bcd4621d373cade4e832627b4f6', '0', '25', '18707173376', '1', '0', '5', '2015-10-11 23:12:58');
INSERT INTO `user` VALUES ('15', 'test', 'test', '', '0', '25', '18707173376', '1', '0', '6', '2016-11-11 17:53:18');
INSERT INTO `user` VALUES ('16', 'test211', 'test2', '', '0', null, '', '1', '0', '7', '2016-11-19 10:34:33');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(19) NOT NULL COMMENT '用户id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('60', '1', '1');
INSERT INTO `user_role` VALUES ('61', '1', '2');
INSERT INTO `user_role` VALUES ('62', '1', '7');
INSERT INTO `user_role` VALUES ('63', '13', '2');
INSERT INTO `user_role` VALUES ('64', '14', '7');
INSERT INTO `user_role` VALUES ('65', '15', '8');
INSERT INTO `user_role` VALUES ('67', '16', '8');
SET FOREIGN_KEY_CHECKS=1;
