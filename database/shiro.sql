/*
Navicat MySQL Data Transfer

Source Server         : MYSQL
Source Server Version : 50634
Source Host           : localhost:3306
Source Database       : shiro

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2016-12-18 23:33:57
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
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(11) DEFAULT NULL,
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
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` int(11) DEFAULT NULL,
  `current_water_num` double(20,0) DEFAULT NULL COMMENT '当月水表数',
  `last_water_num` double(20,0) DEFAULT NULL COMMENT '上个月水表数',
  `current_gas_num` double(20,0) DEFAULT NULL,
  `last_gas_num` double(20,0) DEFAULT NULL,
  `current_electric_num` double(20,2) DEFAULT NULL,
  `last_electric_num` double(20,2) DEFAULT NULL,
  `water_unit_price` double(20,2) DEFAULT NULL,
  `gas_unit_price` double(20,2) DEFAULT '0.00',
  `electric_unit_price` double(20,2) DEFAULT '0.00',
  `total` double(20,2) DEFAULT NULL COMMENT '总费用',
  `manage_charge` double(20,2) DEFAULT NULL COMMENT '管理费',
  `send_count` int(11) unsigned zerofill DEFAULT '00000000000',
  `mon_rent` double(20,0) DEFAULT '0' COMMENT '月租',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 COMMENT='cost';

-- ----------------------------
-- Records of cost
-- ----------------------------
INSERT INTO `cost` VALUES ('42', '31', '132', '0', '1', '1', '0', '1', '12', '2016', '12', '3333333333', '2016-12-18 10:06:55', null, '11', '12', '11', '12', '121.00', '110.00', '12.00', '12.00', '12.00', '147.00', '35.00', '00000000000', '300');
INSERT INTO `cost` VALUES ('43', '31', '0', '0', '0', '0', '0', '0', '0', '2016', '11', '卡卡卡卡卡卡卡不不不', '2016-12-18 21:29:01', null, '2', '1', '2', '1', '2.00', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '00000000000', '300');

-- ----------------------------
-- Table structure for dict_entry
-- ----------------------------
DROP TABLE IF EXISTS `dict_entry`;
CREATE TABLE `dict_entry` (
  `dicttypeid` varchar(255) NOT NULL,
  `dictid` varchar(255) DEFAULT NULL,
  `dictname` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sortno` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `parentid` varchar(255) DEFAULT NULL,
  `dictlevel` varchar(255) DEFAULT NULL,
  `dictcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dicttypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dict_entry
-- ----------------------------

-- ----------------------------
-- Table structure for dict_type
-- ----------------------------
DROP TABLE IF EXISTS `dict_type`;
CREATE TABLE `dict_type` (
  `dicttypeid` varchar(255) NOT NULL,
  `dicttypename` varchar(255) DEFAULT NULL,
  `rank` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `seqno` int(11) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `catalog_id` int(11) DEFAULT NULL,
  `dicttypecode` varchar(255) DEFAULT NULL,
  `dictlevel` int(11) DEFAULT NULL,
  `dictcat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dicttypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict_type
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
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 COMMENT='资源';

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
INSERT INTO `resource` VALUES ('233', '添加', '/room/add', null, 'icon-add', '223', '0', '0', '1', '2016-11-23 22:18:52');
INSERT INTO `resource` VALUES ('234', '编辑', '/room/edit', null, 'icon-edit', '223', '0', '0', '1', '2016-11-23 22:22:28');
INSERT INTO `resource` VALUES ('235', '删除', '/room/delete', null, 'icon-del', '223', '0', '0', '1', '2016-11-23 22:32:38');
INSERT INTO `resource` VALUES ('236', '租户管理', '/tenant/tenantPage', null, 'menu_icon_datadeal', '222', '0', '0', '0', '2016-11-26 22:45:34');
INSERT INTO `resource` VALUES ('237', '添加', '/tenant/add', null, 'icon-add', '236', '0', '0', '1', '2016-12-03 10:52:32');
INSERT INTO `resource` VALUES ('238', '编辑', '/tenant/edit', null, 'icon-edit', '236', '0', '0', '1', '2016-12-03 10:53:22');
INSERT INTO `resource` VALUES ('239', '删除', '/tenant/delete', null, 'icon-del', '236', '0', '0', '1', '2016-12-03 10:54:01');
INSERT INTO `resource` VALUES ('240', '打印', '/tenant/print', null, 'icon-print', '236', '0', '0', '1', '2016-12-03 13:42:57');
INSERT INTO `resource` VALUES ('241', '短信', '/tenant/sendMsg', null, 'icon-redo', '236', '0', '0', '1', '2016-12-03 13:44:13');

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
) ENGINE=InnoDB AUTO_INCREMENT=742 DEFAULT CHARSET=utf8 COMMENT='角色资源';

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
INSERT INTO `role_resource` VALUES ('702', '1', '1');
INSERT INTO `role_resource` VALUES ('703', '1', '11');
INSERT INTO `role_resource` VALUES ('704', '1', '111');
INSERT INTO `role_resource` VALUES ('705', '1', '112');
INSERT INTO `role_resource` VALUES ('706', '1', '113');
INSERT INTO `role_resource` VALUES ('707', '1', '114');
INSERT INTO `role_resource` VALUES ('708', '1', '12');
INSERT INTO `role_resource` VALUES ('709', '1', '121');
INSERT INTO `role_resource` VALUES ('710', '1', '122');
INSERT INTO `role_resource` VALUES ('711', '1', '123');
INSERT INTO `role_resource` VALUES ('712', '1', '124');
INSERT INTO `role_resource` VALUES ('713', '1', '125');
INSERT INTO `role_resource` VALUES ('714', '1', '13');
INSERT INTO `role_resource` VALUES ('715', '1', '131');
INSERT INTO `role_resource` VALUES ('716', '1', '132');
INSERT INTO `role_resource` VALUES ('717', '1', '133');
INSERT INTO `role_resource` VALUES ('718', '1', '134');
INSERT INTO `role_resource` VALUES ('719', '1', '14');
INSERT INTO `role_resource` VALUES ('720', '1', '141');
INSERT INTO `role_resource` VALUES ('721', '1', '142');
INSERT INTO `role_resource` VALUES ('722', '1', '143');
INSERT INTO `role_resource` VALUES ('723', '1', '144');
INSERT INTO `role_resource` VALUES ('724', '1', '222');
INSERT INTO `role_resource` VALUES ('725', '1', '223');
INSERT INTO `role_resource` VALUES ('726', '1', '233');
INSERT INTO `role_resource` VALUES ('727', '1', '234');
INSERT INTO `role_resource` VALUES ('728', '1', '235');
INSERT INTO `role_resource` VALUES ('729', '1', '236');
INSERT INTO `role_resource` VALUES ('730', '1', '237');
INSERT INTO `role_resource` VALUES ('731', '1', '238');
INSERT INTO `role_resource` VALUES ('732', '1', '239');
INSERT INTO `role_resource` VALUES ('733', '1', '240');
INSERT INTO `role_resource` VALUES ('734', '1', '241');
INSERT INTO `role_resource` VALUES ('735', '1', '224');
INSERT INTO `role_resource` VALUES ('736', '1', '230');
INSERT INTO `role_resource` VALUES ('737', '1', '231');
INSERT INTO `role_resource` VALUES ('738', '1', '232');
INSERT INTO `role_resource` VALUES ('739', '1', '221');
INSERT INTO `role_resource` VALUES ('740', '1', '227');
INSERT INTO `role_resource` VALUES ('741', '1', '228');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_id` bigint(20) NOT NULL,
  `room_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `mon_rent` double DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `liver` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `area` double(255,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('31', '3', 'A101', '0', '300', '1', null, null, null, '啊啊啊啊啊', null);
INSERT INTO `room` VALUES ('32', '3', 'A102', '1', '400', '1', null, null, '121212121121212211', 'AAAAAAAA', null);

-- ----------------------------
-- Table structure for sms_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_log`;
CREATE TABLE `sms_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录名称',
  `login_role` varchar(255) DEFAULT NULL COMMENT '角色',
  `is_success` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `time_consuming` bigint(20) DEFAULT NULL,
  `params` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '发送参数',
  `resp_body` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sms_log
-- ----------------------------
INSERT INTO `sms_log` VALUES ('1', 'admin', '0', '失败', '-11190', null, 'errMsg:null errCode:null message:java.net.UnknownHostException: gw.api.taobao.com', null);
INSERT INTO `sms_log` VALUES ('2', 'admin', '0', '失败', '11377', null, 'errMsg:null errCode:null message:java.net.UnknownHostException: gw.api.taobao.com', '2016-12-14 12:29:07');
INSERT INTO `sms_log` VALUES ('3', 'admin', '0', '成功', '311', '{rec_num=13450761833, sms_param={name:\'张三\',room:\'108\',cost:\'100\'}, sms_template_code=SMS_25620786, sms_type=normal, sms_free_sign_name=交租短信}', '{\"alibaba_aliqin_fc_sms_num_send_response\":{\"result\":{\"err_code\":\"0\",\"model\":\"105032787213^1106967970823\",\"success\":true},\"request_id\":\"2rdaf6g3lr28\"}}', '2016-12-14 16:04:00');
INSERT INTO `sms_log` VALUES ('4', 'admin', '0', '成功', '180', '{rec_num=13450761833, sms_param={name:\'张三\',room:\'108\',cost:\'100\'}, sms_template_code=SMS_25620786, sms_type=normal, sms_free_sign_name=交租短信}', '{\"alibaba_aliqin_fc_sms_num_send_response\":{\"result\":{\"err_code\":\"0\",\"model\":\"105032783750^1106967977283\",\"success\":true},\"request_id\":\"qm3q2jbvqiu1\"}}', '2016-12-14 16:08:14');
INSERT INTO `sms_log` VALUES ('5', 'admin', '0', '成功', '237', '{rec_num=13450761833, sms_param={name:\'张三\',room:\'108\',cost:\'100\'}, sms_template_code=SMS_25620786, sms_type=normal, sms_free_sign_name=交租短信}', '{\"alibaba_aliqin_fc_sms_num_send_response\":{\"result\":{\"err_code\":\"0\",\"model\":\"105033007332^1106968171004\",\"success\":true},\"request_id\":\"eony9lcwig47\"}}', '2016-12-14 16:10:13');
INSERT INTO `sms_log` VALUES ('6', 'admin', '0', '成功', '144', '{rec_num=13450761833, sms_param={name:\'张三\',room:\'108\',cost:\'100\'}, sms_template_code=SMS_25620786, sms_type=normal, sms_free_sign_name=交租短信}', '{\"alibaba_aliqin_fc_sms_num_send_response\":{\"result\":{\"err_code\":\"0\",\"model\":\"105032848807^1106968003711\",\"success\":true},\"request_id\":\"iv0w79z6431r\"}}', '2016-12-14 16:10:33');
INSERT INTO `sms_log` VALUES ('7', 'admin', '0', '成功', '22165', '{rec_num=13450761833, sms_param={name:\'张三\',room:\'108\',cost:\'100\'}, sms_template_code=SMS_25620786, sms_type=normal, sms_free_sign_name=交租短信}', '{\"alibaba_aliqin_fc_sms_num_send_response\":{\"result\":{\"err_code\":\"0\",\"model\":\"105033288301^1106968490232\",\"success\":true},\"request_id\":\"xmxnuros9zc\"}}', '2016-12-14 16:28:28');
INSERT INTO `sms_log` VALUES ('8', 'admin', '0', '成功', '19495', '{rec_num=13450761833, sms_param={name:\'张三\',room:\'108\',cost:\'100\'}, sms_template_code=SMS_25620786, sms_type=normal, sms_free_sign_name=交租短信}', '{\"alibaba_aliqin_fc_sms_num_send_response\":{\"result\":{\"err_code\":\"0\",\"model\":\"105033466262^1106968404677\",\"success\":true},\"request_id\":\"z2a8og7tt7c0\"}}', '2016-12-14 16:32:11');
INSERT INTO `sms_log` VALUES ('9', 'admin', '0', '成功', '34183', '{rec_num=13450761833, sms_param={name:\'张三\',room:\'108\',cost:\'100\'}, sms_template_code=SMS_25620786, sms_type=normal, sms_free_sign_name=交租短信}', '{\"alibaba_aliqin_fc_sms_num_send_response\":{\"result\":{\"err_code\":\"0\",\"model\":\"105033463320^1106968666581\",\"success\":true},\"request_id\":\"z274fl2w7p4s\"}}', '2016-12-14 16:37:50');
INSERT INTO `sms_log` VALUES ('10', 'admin', '0', '成功', '331', '{rec_num=13450761834, sms_param={\"cost\":\"335\",\"name\":\"张三\",\"room\":\"xxx\"}, sms_template_code=SMS_25620786, sms_type=normal, sms_free_sign_name=交租短信}', '{\"alibaba_aliqin_fc_sms_num_send_response\":{\"result\":{\"err_code\":\"0\",\"model\":\"105036772698^1106972115391\",\"success\":true},\"request_id\":\"z2bgc4i08e27\"}}', '2016-12-14 21:19:35');
INSERT INTO `sms_log` VALUES ('11', 'admin', '0', '成功', '113', '{rec_num=13450761833, sms_param={\"cost\":\"335\",\"name\":\"张三\",\"room\":\"xxx\"}, sms_template_code=SMS_25620786, sms_type=normal, sms_free_sign_name=交租短信}', '{\"alibaba_aliqin_fc_sms_num_send_response\":{\"result\":{\"err_code\":\"0\",\"model\":\"105036733194^1106971899459\",\"success\":true},\"request_id\":\"qm2y0kbt3uz9\"}}', '2016-12-14 21:20:48');
INSERT INTO `sms_log` VALUES ('12', 'admin', '0', '成功', '466', '{rec_num=15919064667, sms_param={\"cost\":\"291\",\"name\":\"保爷\",\"room\":\"xx33444\"}, sms_template_code=SMS_25620786, sms_type=normal, sms_free_sign_name=交租短信}', '{\"alibaba_aliqin_fc_sms_num_send_response\":{\"result\":{\"err_code\":\"0\",\"model\":\"105064352622^1107000355819\",\"success\":true},\"request_id\":\"11ifz2h3oc2fk\"}}', '2016-12-16 11:18:39');
INSERT INTO `sms_log` VALUES ('13', 'admin', '0', '成功', '525', '{rec_num=13450761833, sms_param={\"cost\":\"335\",\"name\":\"张三\",\"room\":\"xxx\"}, sms_template_code=SMS_25620786, sms_type=normal, sms_free_sign_name=交租短信}', '{\"alibaba_aliqin_fc_sms_num_send_response\":{\"result\":{\"err_code\":\"0\",\"model\":\"105070061367^1107006166630\",\"success\":true},\"request_id\":\"3gsl11su4ow8\"}}', '2016-12-16 15:20:44');
INSERT INTO `sms_log` VALUES ('14', 'admin', '0', '成功', '67218', '{rec_num=13450761833, sms_param={\"cost\":\"11\",\"name\":\"张三\",\"room\":\"xxx\"}, sms_template_code=SMS_25620786, sms_type=normal, sms_free_sign_name=交租短信}', '{\"alibaba_aliqin_fc_sms_num_send_response\":{\"result\":{\"err_code\":\"0\",\"model\":\"105070138958^1107006144771\",\"success\":true},\"request_id\":\"43w1e7r2spcz\"}}', '2016-12-16 15:28:15');
INSERT INTO `sms_log` VALUES ('15', 'admin', '0', '成功', '8977', '{rec_num=13450761833, sms_param={\"cost\":\"291\",\"name\":\"张三\",\"room\":\"xxx\"}, sms_template_code=SMS_25620786, sms_type=normal, sms_free_sign_name=交租短信}', '{\"alibaba_aliqin_fc_sms_num_send_response\":{\"result\":{\"err_code\":\"0\",\"model\":\"105070846683^1107006942218\",\"success\":true},\"request_id\":\"qm4rjqtp0syr\"}}', '2016-12-16 16:00:14');
INSERT INTO `sms_log` VALUES ('16', 'admin', '0', '成功', '628', '{rec_num=13450761833, sms_param={\"cost\":\"291\",\"name\":\"张三\",\"room\":\"xxx\"}, sms_template_code=SMS_25620786, sms_type=normal, sms_free_sign_name=交租短信}', '{\"alibaba_aliqin_fc_sms_num_send_response\":{\"result\":{\"err_code\":\"0\",\"model\":\"105071656475^1107007766422\",\"success\":true},\"request_id\":\"44o0huocwe1v\"}}', '2016-12-16 16:42:56');
INSERT INTO `sms_log` VALUES ('17', 'admin', '0', '成功', '205', '{rec_num=13450761833, sms_param={\"cost\":\"291\",\"name\":\"张三\",\"room\":\"xxx\"}, sms_template_code=SMS_25620786, sms_type=normal, sms_free_sign_name=交租短信}', '{\"alibaba_aliqin_fc_sms_num_send_response\":{\"result\":{\"err_code\":\"0\",\"model\":\"105072032834^1107008128156\",\"success\":true},\"request_id\":\"101z9u4wmjc5f\"}}', '2016-12-16 17:02:40');

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
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=6&_=1481381341156&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('2', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481384317194&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('3', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481384851598&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('4', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481384851599&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('5', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&electricCharge=1212&waterCharge=1212&tvCharge=1212&internetCharge=1212&gasCharge=212&equallyCharge=1212&otherCharge=121&roomId=1&remark=1212&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('6', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481429869477&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('7', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481429869478&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('8', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481430695683&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('9', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481430847297&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('10', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481430920959&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('11', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481431063558&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('12', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481431130360&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('13', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481431130361&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('14', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481431157911&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('15', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481431188774&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('16', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481435464764&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('17', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481435557337&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('18', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481435557338&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('19', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481526411201&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('20', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481526411202&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('21', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481528551732&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('22', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481529066767&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('23', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481529822129&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('24', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481530145607&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('25', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481530434092&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('26', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481530487190&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('27', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481530627731&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('28', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481530627732&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('29', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481530810588&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('30', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481530863317&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('31', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481530889618&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('32', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481530889619&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('33', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481530889620&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('34', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481534325164&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('35', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481534387886&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('36', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=&_=1481534522139&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('37', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481534667973&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('38', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481534713463&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('39', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=张三&currentElectricNum=1&lastElectricNum=111&electricCharge=1&currentWaterNum=1&lastWaterNum=111&waterCharge=1&currentGasNum=1&lastGasNum=111&gasCharge=1&otherCharge=1&roomId=1&remark=aa &', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('40', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481534713464&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('41', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张三&sex=1&tel=13450761833&identityCard=121212122121212&remark=test 呃呃呃 3333 99 33 444&roomId=1&id=1&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('42', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张三&sex=1&tel=13450761834&identityCard=121223123111123&remark=test 呃呃呃 3333 99 33 444&roomId=1&id=1&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('43', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481589692351&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('44', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481589692352&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('45', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481589692353&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('46', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481589692354&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('47', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481589692355&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('48', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481589692356&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('49', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481589692357&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('50', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481594505193&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('51', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481594647057&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('52', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481594676508&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('53', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481595985465&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('54', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481597251935&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('55', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481597772590&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('56', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481597772591&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('57', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481598094374&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('58', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481598126391&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('59', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481598444118&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('60', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481598762786&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('61', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481599208994&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('62', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481599268234&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('63', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481599306100&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('64', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481599306101&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('65', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481599550165&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('66', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481599605087&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('67', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481599640387&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('68', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481599725543&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('69', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481605560764&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('70', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481605963189&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('71', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481606112324&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('72', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481606407414&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('73', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481606541708&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('74', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481606644242&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('75', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481606709483&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('76', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481606801359&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('77', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481607049821&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('78', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481607170648&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('79', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481607271739&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('80', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481607573561&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('81', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481607651455&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('82', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481607815409&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('83', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481607973772&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('84', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481608058128&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('85', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481608102568&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('86', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481608611019&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('87', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481608611020&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('88', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481608611021&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('89', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481611691557&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('90', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481611753949&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('91', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481611934510&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('92', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481611934511&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('93', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481611934512&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('94', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481611934513&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('95', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481612135801&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('96', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481612198900&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('97', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481612284758&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('98', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481612344272&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('99', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481612344273&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('100', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481612344274&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('101', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=张三&currentElectricNum=222.00&lastElectricNum=111.00&electricUnitPrice=6.33&currentWaterNum=222.00&lastWaterNum=111.00&waterNum=111.00&waterUnitPrice=6.11&waterCharge=678.21&currentGasNum=222.00&lastGasNum=111.00&gasNum=111.00&gasUnitPrice=6.22&gasCharge=690.42&otherCharge=222.00&roomId=1&remark=555555&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('102', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481612344275&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('103', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481612344276&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('104', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=张三&currentElectricNum=113.00&lastElectricNum=11.00&electricUnitPrice=3.00&currentWaterNum=113.00&lastWaterNum=11.00&waterUnitPrice=3.00&currentGasNum=112.00&lastGasNum=11.00&gasUnitPrice=3.00&otherCharge=444.00&roomId=1&remark=666666666666&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('105', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481613954031&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('106', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=张三&currentElectricNum=124.00&lastElectricNum=113.00&electricNum=11.00&electricUnitPrice=3.00&electricCharge=33.00&currentWaterNum=123.00&lastWaterNum=113.00&waterUnitPrice=3.00&currentGasNum=123.00&lastGasNum=112.00&gasUnitPrice=3.00&otherCharge=44.00&roomId=1&remark=吾问无为谓&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('107', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481613954032&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('108', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481615252275&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('109', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481615252276&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('110', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481615690946&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('111', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481615690947&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('112', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=张三&currentElectricNum=114.00&lastElectricNum=113.00&electricNum=1.00&electricUnitPrice=3.00&electricCharge=3.00&currentWaterNum=115.00&lastWaterNum=113.00&waterNum=2.00&waterUnitPrice=3.00&waterCharge=6.00&currentGasNum=116.00&lastGasNum=112.00&gasNum=4.00&gasUnitPrice=3.00&gasCharge=12.00&otherCharge=111.00&roomId=1&remark=55555555555555&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('113', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481615690948&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('114', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481617020880&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('115', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481617098132&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('116', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481617098133&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('117', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481617098134&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('118', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481617098135&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('119', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=4&tenantName=321&_=1481685965183&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('120', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481685965184&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('121', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=张三&currentElectricNum=121.00&lastElectricNum=113.00&electricNum=8.00&electricUnitPrice=3.00&electricCharge=24.00&currentWaterNum=122.00&lastWaterNum=113.00&waterNum=9.00&waterUnitPrice=3.00&waterCharge=27.00&currentGasNum=122.00&lastGasNum=112.00&gasNum=10.00&gasUnitPrice=3.00&gasCharge=30.00&internetCharge=88.00&tvCharge=9.00&equallyCharge=80.00&otherCharge=77.00&total=335.00&roomId=1&remark=9999999999999999&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('122', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481689198823&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('123', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张三&sex=1&tel=13450761833&identityCard=121223123111123&remark=test 呃呃呃 3333 99 33 444&roomId=1&id=1&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('124', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481850965257&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('125', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481850965258&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('126', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&_=1481852162326&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('127', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=保爷&sex=1&tel=15919064667&identityCard=423232333232323233&remark=交租&roomId=2&id=6&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('128', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=2&_=1481857864625&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('129', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=保爷&currentElectricNum=113.00&lastElectricNum=87.00&electricNum=26.00&electricUnitPrice=5.00&electricCharge=0.00&currentWaterNum=114.00&lastWaterNum=98.00&waterNum=16.00&waterUnitPrice=7.00&waterCharge=112.00&currentGasNum=112.00&lastGasNum=99.00&gasNum=13.00&gasUnitPrice=8.00&gasCharge=104.00&internetCharge=30.00&tvCharge=20.00&equallyCharge=5.00&otherCharge=20.00&total=291.00&roomId=2&remark=测试&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('130', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=1&_=1481876673092&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('131', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=1&_=1481876673093&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('132', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:edit,[参数]:id=1&loginName=admin&name=admin&password=&sex=1&age=25&userType=0&organizationId=1&roleIds=1&phone=18707173376&status=0&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('133', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=1&_=1481876673094&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('134', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=321&sex=0&tel=13450761833&identityCard=121212121121212211&remark=222&roomId=4&id=7&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('135', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=333&sex=0&tel=13450761833&identityCard=121212121121212211&remark=333&roomId=7&id=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('136', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=444&sex=1&tel=13450761833&identityCard=121212121121212211&remark=444&roomId=8&id=13&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('137', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=6&_=1481878947622&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('138', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481879155669&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('139', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481881879537&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('140', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=张三&currentElectricNum=2.00&lastElectricNum=1.00&electricNum=1.00&electricUnitPrice=1.00&electricCharge=1.00&currentWaterNum=2.00&lastWaterNum=1.00&waterNum=1.00&waterUnitPrice=1.00&waterCharge=1.00&currentGasNum=2.00&lastGasNum=1.00&gasNum=1.00&gasUnitPrice=1.00&gasCharge=1.00&internetCharge=2.00&tvCharge=1.00&equallyCharge=1.00&otherCharge=1.00&total=8.00&roomId=1&remark=1111111111&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('141', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481882803312&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('142', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=张三&currentElectricNum=4.00&lastElectricNum=1.00&electricNum=3.00&electricUnitPrice=1.00&electricCharge=3.00&currentWaterNum=4.00&lastWaterNum=1.00&waterNum=3.00&waterUnitPrice=1.00&waterCharge=3.00&currentGasNum=4.00&lastGasNum=1.00&gasNum=3.00&gasUnitPrice=1.00&gasCharge=3.00&internetCharge=4.00&tvCharge=4.00&equallyCharge=5.00&otherCharge=0.00&total=22.00&roomId=1&remark=5555555555&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('143', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=11&tenantName=张三&currentElectricNum=4.00&lastElectricNum=1.00&electricNum=3.00&electricUnitPrice=1.00&electricCharge=3.00&currentWaterNum=4.00&lastWaterNum=1.00&waterNum=3.00&waterUnitPrice=1.00&waterCharge=3.00&currentGasNum=4.00&lastGasNum=1.00&gasNum=3.00&gasUnitPrice=1.00&gasCharge=3.00&internetCharge=4.00&tvCharge=4.00&equallyCharge=5.00&otherCharge=0.00&total=22.00&roomId=1&remark=5555555555&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('144', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481882803314&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('145', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=10&tenantName=张三&currentElectricNum=6.00&lastElectricNum=4.00&electricNum=2.00&electricUnitPrice=1.00&electricCharge=2.00&currentWaterNum=6.00&lastWaterNum=4.00&waterNum=2.00&waterUnitPrice=1.00&waterCharge=2.00&currentGasNum=6.00&lastGasNum=4.00&gasNum=2.00&gasUnitPrice=1.00&gasCharge=2.00&internetCharge=6.00&tvCharge=6.00&equallyCharge=6.00&otherCharge=0.00&total=24.00&roomId=1&remark=6666666666&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('146', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=1&tenantName=张三&_=1481882803315&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('147', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=9&tenantName=张三&currentElectricNum=7.00&lastElectricNum=4.00&electricNum=3.00&electricUnitPrice=1.00&electricCharge=3.00&currentWaterNum=7.00&lastWaterNum=4.00&waterNum=3.00&waterUnitPrice=1.00&waterCharge=3.00&currentGasNum=7.00&lastGasNum=4.00&gasNum=3.00&gasUnitPrice=1.00&gasCharge=3.00&internetCharge=7.00&tvCharge=7.00&equallyCharge=7.00&otherCharge=7.00&total=37.00&roomId=1&sendCount=0&remark=9999999&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('148', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张三&sex=0&tel=13450761833&identityCard=121223123111123&remark=test 呃呃呃 3333 99 33 444&roomId=1&id=1&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('149', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('150', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('151', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('152', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('153', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('154', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:add,[参数]:roomName=A101&type=0&status=0&buildingId=3&monRent=300&remark=啊啊啊啊啊&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('155', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=张三&sex=0&tel=13450761833&identityCard=121223123111123111&remark=啊啊啊啊啊啊啊啊啊啊啊啊啊啊&roomId=31&id=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('156', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&_=1481981145555&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('157', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=å¼ ä¸&currentElectricNum=121.00&lastElectricNum=110.00&electricNum=11.00&electricUnitPrice=12.00&electricCharge=132.00&currentWaterNum=11.00&lastWaterNum=12.00&waterNum=0.00&waterUnitPrice=12.00&waterCharge=0.00&currentGasNum=11.00&lastGasNum=12.00&gasNum=0.00&gasUnitPrice=12.00&gasCharge=0.00&internetCharge=1.00&tvCharge=1.00&equallyCharge=1.00&otherCharge=12.00&total=147.00&roomId=31&sendCount=0&remark=3333333333&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('158', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&_=1481981145556&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('159', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&_=1481981145558&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('160', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张三&sex=0&tel=13450761833&identityCard=121223123111123111&remark=啊啊啊啊啊啊啊啊啊啊啊啊啊啊&roomId=31&id=17&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('161', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&_=1481984202161&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('162', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&monRent=300&_=1481989969347&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('163', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('164', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('165', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:add,[参数]:roomName=A102&type=1&status=0&buildingId=3&monRent=400&remark=AAAAAAAA&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('166', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:add,[参数]:roomName=A102&type=1&status=0&buildingId=3&monRent=400&remark=AAAAAAAA&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('167', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=张四&sex=1&tel=13450761833&identityCard=121212121121212211&remark=日日日日日日日日日日日日日&roomId=32&id=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('168', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&monRent=300&_=1482023056692&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('169', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&monRent=300&_=1482026762634&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('170', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=1&_=1482031111536&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('171', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:edit,[参数]:id=1&loginName=admin&name=admin&password=123&sex=1&age=25&userType=0&organizationId=1&roleIds=1&phone=18707173376&status=0&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('172', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&monRent=300&_=1482031111537&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('173', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:year=2016&month=12&tenantName=å¼ ä¸&monRent=300.0&manageCharge=35.0&currentElectricNum=121.00&lastElectricNum=100.00&electricNum=21.00&electricUnitPrice=12.00&electricCharge=252.00&currentWaterNum=15.00&lastWaterNum=12.00&waterNum=3.00&waterUnitPrice=12.00&waterCharge=36.00&currentGasNum=12.00&lastGasNum=12.00&gasNum=0.00&gasUnitPrice=12.00&gasCharge=0.00&internetCharge=1.00&tvCharge=1.00&equallyCharge=1.00&otherCharge=12.00&total=638.00&roomId=31&sendCount=0&remark=eeeee&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('174', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:year=2016&month=12&tenantName=å¼ ä¸&monRent=300.0&manageCharge=35.0&currentElectricNum=151.00&lastElectricNum=110.00&electricNum=41.00&electricUnitPrice=12.00&electricCharge=492.00&currentWaterNum=14.00&lastWaterNum=12.00&waterNum=2.00&waterUnitPrice=12.00&waterCharge=24.00&currentGasNum=14.00&lastGasNum=12.00&gasNum=2.00&gasUnitPrice=12.00&gasCharge=24.00&internetCharge=6.00&tvCharge=1.00&equallyCharge=1.00&otherCharge=12.00&total=895.00&roomId=31&sendCount=0&remark=888888888&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('175', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:year=2016&month=12&tenantName=å¼ ä¸&monRent=300.0&manageCharge=35.0&currentElectricNum=151.00&lastElectricNum=110.00&electricNum=41.00&electricUnitPrice=12.00&electricCharge=492.00&currentWaterNum=14.00&lastWaterNum=12.00&waterNum=2.00&waterUnitPrice=12.00&waterCharge=24.00&currentGasNum=14.00&lastGasNum=12.00&gasNum=2.00&gasUnitPrice=12.00&gasCharge=24.00&internetCharge=6.00&tvCharge=1.00&equallyCharge=1.00&otherCharge=12.00&total=895.00&roomId=31&sendCount=0&remark=888888888&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('176', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&monRent=300&_=1482032904324&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('177', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&monRent=300&_=1482032904325&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('178', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&monRent=300&_=1482032904326&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('179', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&monRent=300&_=1482033796869&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('180', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=å¼ ä¸&monRent=300&manageCharge=0&currentElectricNum=11.00&lastElectricNum=12.00&electricNum=0.00&electricUnitPrice=5.00&electricCharge=0.00&currentWaterNum=32.00&lastWaterNum=12.00&waterNum=20.00&waterUnitPrice=5.00&waterCharge=100.00&currentGasNum=12.00&lastGasNum=1.00&gasNum=11.00&gasUnitPrice=5.00&gasCharge=55.00&internetCharge=3.00&tvCharge=3.00&equallyCharge=3.00&otherCharge=6.00&total=170.00&roomId=31&sendCount=0&remark=2222222222222&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('181', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&monRent=300&_=1482033993881&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('182', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=å¼ ä¸&monRent=300&manageCharge=0&currentElectricNum=22.00&lastElectricNum=23.00&electricNum=0.00&electricUnitPrice=0.00&electricCharge=0.00&currentWaterNum=1.00&lastWaterNum=1.00&waterNum=0.00&waterUnitPrice=0.00&waterCharge=0.00&currentGasNum=1.00&lastGasNum=1.00&gasNum=0.00&gasUnitPrice=0.00&gasCharge=0.00&internetCharge=0.00&tvCharge=0.00&equallyCharge=0.00&otherCharge=0.00&total=0.00&roomId=31&sendCount=0&remark=啊啊啊啊啊啊啊&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('183', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&monRent=300&_=1482034074371&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('184', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=å¼ ä¸&monRent=300&manageCharge=0&currentElectricNum=1.00&lastElectricNum=2.00&electricNum=0.00&electricUnitPrice=0.00&electricCharge=0.00&currentWaterNum=1.00&lastWaterNum=1.00&waterNum=0.00&waterUnitPrice=0.00&waterCharge=0.00&currentGasNum=1.00&lastGasNum=1.00&gasNum=0.00&gasUnitPrice=0.00&gasCharge=0.00&internetCharge=0.00&tvCharge=0.00&equallyCharge=0.00&otherCharge=0.00&total=0.00&roomId=31&sendCount=0&remark=11111111111&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('185', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&monRent=300&_=1482034287950&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('186', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&monRent=300&_=1482034338683&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('187', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=å¼ ä¸&monRent=300&manageCharge=0&currentElectricNum=2.00&lastElectricNum=1.00&electricNum=1.00&electricUnitPrice=0.00&electricCharge=0.00&currentWaterNum=2.00&lastWaterNum=2.00&waterNum=0.00&waterUnitPrice=0.00&waterCharge=0.00&currentGasNum=2.00&lastGasNum=2.00&gasNum=0.00&gasUnitPrice=0.00&gasCharge=0.00&internetCharge=0.00&tvCharge=0.00&equallyCharge=0.00&otherCharge=0.00&total=0.00&roomId=31&sendCount=0&remark=4444444444&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('188', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=å¼ ä¸&monRent=300&_=1482034338684&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('189', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=11&tenantName=å¼ ä¸&monRent=300&manageCharge=0&currentElectricNum=2.00&lastElectricNum=1.00&electricNum=1.00&electricUnitPrice=0.00&electricCharge=0.00&currentWaterNum=2.00&lastWaterNum=1.00&waterNum=1.00&waterUnitPrice=0.00&waterCharge=0.00&currentGasNum=2.00&lastGasNum=1.00&gasNum=1.00&gasUnitPrice=0.00&gasCharge=0.00&internetCharge=0.00&tvCharge=0.00&equallyCharge=0.00&otherCharge=0.00&total=0.00&roomId=31&sendCount=0&remark=444444444444&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('190', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:edit,[参数]:year=2016&month=11&tenantName=å¼ ä¸&monRent=300.0&manageCharge=0.0&currentElectricNum=2.00&lastElectricNum=1.00&electricNum=1.00&electricUnitPrice=2.00&electricCharge=2.00&currentWaterNum=4.00&lastWaterNum=1.00&waterNum=3.00&waterUnitPrice=2.00&waterCharge=6.00&currentGasNum=5.00&lastGasNum=1.00&gasNum=4.00&gasUnitPrice=2.00&gasCharge=8.00&internetCharge=1.00&tvCharge=1.00&equallyCharge=2.00&otherCharge=2.00&total=322.00&roomId=31&sendCount=0&remark=888888888888888888888888&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('191', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:edit,[参数]:year=2016&month=11&tenantName=å¼ ä¸&monRent=300.0&manageCharge=0.0&currentElectricNum=2.00&lastElectricNum=1.00&electricNum=1.00&electricUnitPrice=0.00&electricCharge=0.00&currentWaterNum=2.00&lastWaterNum=1.00&waterNum=1.00&waterUnitPrice=0.00&waterCharge=0.00&currentGasNum=2.00&lastGasNum=1.00&gasNum=1.00&gasUnitPrice=0.00&gasCharge=0.00&internetCharge=0.00&tvCharge=0.00&equallyCharge=0.00&otherCharge=0.00&total=0.00&roomId=31&sendCount=0&remark=8888888888&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('192', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:edit,[参数]:year=2016&month=11&tenantName=å¼ ä¸&monRent=300.0&manageCharge=0.0&currentElectricNum=2.00&lastElectricNum=1.00&electricNum=1.00&electricUnitPrice=0.00&electricCharge=0.00&currentWaterNum=2.00&lastWaterNum=1.00&waterNum=1.00&waterUnitPrice=0.00&waterCharge=0.00&currentGasNum=2.00&lastGasNum=1.00&gasNum=1.00&gasUnitPrice=0.00&gasCharge=0.00&internetCharge=0.00&tvCharge=0.00&equallyCharge=0.00&otherCharge=0.00&total=0.00&roomId=31&sendCount=0&remark=不白白白白白白白白白白白白&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('193', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:edit,[参数]:year=2016&month=11&tenantName=å¼ ä¸&monRent=300.0&manageCharge=0.0&currentElectricNum=2.00&lastElectricNum=1.00&electricNum=1.00&electricUnitPrice=0.00&electricCharge=0.00&currentWaterNum=2.00&lastWaterNum=1.00&waterNum=1.00&waterUnitPrice=0.00&waterCharge=0.00&currentGasNum=2.00&lastGasNum=1.00&gasNum=1.00&gasUnitPrice=0.00&gasCharge=0.00&internetCharge=0.00&tvCharge=0.00&equallyCharge=0.00&otherCharge=0.00&total=0.00&remark=咳咳咳咳咳咳咳咳咳咳咳咳咳咳咳咳&roomId=31&sendCount=0&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('194', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:edit,[参数]:year=2016&month=11&tenantName=å¼ ä¸&monRent=300.0&manageCharge=0.0&currentElectricNum=2.00&lastElectricNum=1.00&electricNum=1.00&electricUnitPrice=0.00&electricCharge=0.00&currentWaterNum=2.00&lastWaterNum=1.00&waterNum=1.00&waterUnitPrice=0.00&waterCharge=0.00&currentGasNum=2.00&lastGasNum=1.00&gasNum=1.00&gasUnitPrice=0.00&gasCharge=0.00&internetCharge=0.00&tvCharge=0.00&equallyCharge=0.00&otherCharge=0.00&total=0.00&remark=卡卡卡卡卡卡卡&roomId=31&sendCount=0&id=43&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('195', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:edit,[参数]:year=2016&month=11&tenantName=å¼ ä¸&monRent=300.0&manageCharge=0.0&currentElectricNum=2.00&lastElectricNum=1.00&electricNum=1.00&electricUnitPrice=0.00&electricCharge=0.00&currentWaterNum=2.00&lastWaterNum=1.00&waterNum=1.00&waterUnitPrice=0.00&waterCharge=0.00&currentGasNum=2.00&lastGasNum=1.00&gasNum=1.00&gasUnitPrice=0.00&gasCharge=0.00&internetCharge=0.00&tvCharge=0.00&equallyCharge=0.00&otherCharge=0.00&total=0.00&remark=卡卡卡卡卡卡卡不不不&roomId=31&sendCount=0&id=43&', '0:0:0:0:0:0:0:1', null);

-- ----------------------------
-- Table structure for tenant
-- ----------------------------
DROP TABLE IF EXISTS `tenant`;
CREATE TABLE `tenant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `sex` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `tel` decimal(11,0) DEFAULT NULL,
  `identity_card` varchar(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `is_del` int(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='tenant';

-- ----------------------------
-- Records of tenant
-- ----------------------------
INSERT INTO `tenant` VALUES ('17', '张三', '31', '0', '13450761833', '121223123111123111', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '0');
INSERT INTO `tenant` VALUES ('18', '张四', '32', '1', '13450761833', '121212121121212211', '日日日日日日日日日日日日日', '0');

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
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '202cb962ac59075b964b07152d234b70', '1', '25', '18707173376', '0', '0', '1', '2016-12-18 11:18:53');
INSERT INTO `user` VALUES ('13', 'snoopy', 'snoopy', '098f6bcd4621d373cade4e832627b4f6', '0', '25', '18707173376', '1', '0', '3', '2015-10-01 13:12:07');
INSERT INTO `user` VALUES ('14', 'dreamlu', 'dreamlu', '098f6bcd4621d373cade4e832627b4f6', '0', '25', '18707173376', '1', '0', '5', '2015-10-11 23:12:58');
INSERT INTO `user` VALUES ('15', 'test', 'test', '202cb962ac59075b964b07152d234b70', '0', '25', '18707173376', '1', '0', '6', '2016-12-18 11:24:49');
INSERT INTO `user` VALUES ('16', 'test211', 'test2', '202cb962ac59075b964b07152d234b70', '0', null, '', '1', '0', '7', '2016-12-18 11:24:51');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(19) NOT NULL COMMENT '用户id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('63', '13', '2');
INSERT INTO `user_role` VALUES ('64', '14', '7');
INSERT INTO `user_role` VALUES ('65', '15', '8');
INSERT INTO `user_role` VALUES ('67', '16', '8');
INSERT INTO `user_role` VALUES ('71', '1', '1');
INSERT INTO `user_role` VALUES ('72', '1', '2');
INSERT INTO `user_role` VALUES ('73', '1', '7');

-- ----------------------------
-- View structure for rentroom
-- ----------------------------
DROP VIEW IF EXISTS `rentroom`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rentroom` AS select `b`.`id` AS `id`,`b`.`building_name` AS `building_name`,`b`.`building_address` AS `building_address`,`b`.`building_own` AS `building_own`,`b`.`own_phone` AS `own_phone`,`b`.`building_manager` AS `building_manager`,`b`.`manager_phone` AS `manager_phone`,`b`.`room_count` AS `room_count`,`b`.`remark` AS `remark`,`r`.`room_name` AS `room_name`,`t`.`tenant_name` AS `tenant_name` from ((`building` `b` left join `room` `r` on((`b`.`id` = `r`.`building_id`))) left join `tenant` `t` on((`r`.`id` = `t`.`room_id`))) ;
SET FOREIGN_KEY_CHECKS=1;
