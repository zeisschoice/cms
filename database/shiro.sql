/*
Navicat MySQL Data Transfer

Source Server         : local_mysql
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : shiro

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-12-13 18:48:47
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 COMMENT='cost';

-- ----------------------------
-- Records of cost
-- ----------------------------
INSERT INTO `cost` VALUES ('32', '1', null, null, null, null, null, null, '444', '2016', '11', '666666666666', '2016-12-13 15:26:08', null, '113', '11', '112', '11', '113.00', '11.00', '3.00', '3.00', '3.00', null);
INSERT INTO `cost` VALUES ('34', '1', '3', '6', null, null, '12', null, '111', '2016', '12', '55555555555555', '2016-12-13 16:02:11', null, '115', '113', '116', '112', '114.00', '113.00', '3.00', '3.00', '3.00', null);

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
  `liver` int(11) DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', '1', 'xxx', '0', '300', '0', '2016-11-24', '2016-11-25', '4444', '888888');
INSERT INTO `room` VALUES ('2', '2', 'xx33444', '0', '22', '0', '2016-11-23', '2016-11-23', '111', '66666');
INSERT INTO `room` VALUES ('3', '3', 'rrrr', '1', '22', '0', '2016-11-23', '2016-11-23', '4444', 'sssss');
INSERT INTO `room` VALUES ('4', '2', '22宿舍', '1', '200', '1', '2016-11-24', '2016-11-25', '111', '问问');
INSERT INTO `room` VALUES ('5', '2', '123', null, null, '1', null, null, null, null);
INSERT INTO `room` VALUES ('6', '2', '1234', null, null, '1', null, null, null, null);
INSERT INTO `room` VALUES ('7', '2', '333', null, null, '0', null, null, null, null);
INSERT INTO `room` VALUES ('8', '2', '444', null, null, '1', null, null, null, null);
INSERT INTO `room` VALUES ('9', '2', '555', null, null, '1', null, null, null, null);
INSERT INTO `room` VALUES ('10', '2', '666', null, null, '1', null, null, null, null);
INSERT INTO `room` VALUES ('11', '2', '777', null, null, '1', null, null, null, null);
INSERT INTO `room` VALUES ('12', '2', '888', null, null, '1', null, null, null, null);
INSERT INTO `room` VALUES ('13', '2', '999', null, null, '1', null, null, null, null);
INSERT INTO `room` VALUES ('14', '2', '1212', null, null, '1', null, null, null, null);
INSERT INTO `room` VALUES ('15', '2', '1313', null, null, '1', null, null, null, null);
INSERT INTO `room` VALUES ('16', '2', '1414', null, null, '1', null, null, null, null);
INSERT INTO `room` VALUES ('17', '2', '1515', null, null, '0', null, null, null, null);
INSERT INTO `room` VALUES ('18', '2', '1616', null, null, '0', null, null, null, null);
INSERT INTO `room` VALUES ('19', '2', '1717', null, null, '0', null, null, null, null);
INSERT INTO `room` VALUES ('20', '2', '1818', null, null, '0', null, null, null, null);
INSERT INTO `room` VALUES ('21', '2', '1919', null, null, '0', null, null, null, null);
INSERT INTO `room` VALUES ('22', '2', '111222', null, null, '0', null, null, null, null);
INSERT INTO `room` VALUES ('23', '2', '2121', null, null, '0', null, null, null, null);
INSERT INTO `room` VALUES ('24', '2', '112233', null, null, '0', null, null, null, null);
INSERT INTO `room` VALUES ('25', '2', '13141', null, null, '0', null, null, null, null);
INSERT INTO `room` VALUES ('26', '2', '12323', null, null, '0', null, null, null, null);
INSERT INTO `room` VALUES ('27', '2', '223344', null, null, '0', null, null, null, null);
INSERT INTO `room` VALUES ('28', '2', '5555', null, null, '0', null, null, null, null);
INSERT INTO `room` VALUES ('29', '2', '666', null, null, '0', null, null, null, null);
INSERT INTO `room` VALUES ('30', '2', '777999', null, null, '0', null, null, null, null);

-- ----------------------------
-- Table structure for sms_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_log`;
CREATE TABLE `sms_log` (
  `id` bigint(20) NOT NULL,
  `login_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录名称',
  `login_role` varchar(255) DEFAULT NULL COMMENT '角色',
  `is_success` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `time_consuming` bigint(20) DEFAULT NULL,
  `params` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '发送参数',
  `resp_body` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sms_log
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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='系统日志';

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
  `identity_card` decimal(20,0) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `is_del` int(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='tenant';

-- ----------------------------
-- Records of tenant
-- ----------------------------
INSERT INTO `tenant` VALUES ('1', '张三', '1', '1', '13450761834', '121223123111123', 'test 呃呃呃 3333 99 33 444', '0');
INSERT INTO `tenant` VALUES ('6', '1', '2', '', null, null, '1', '0');
INSERT INTO `tenant` VALUES ('7', '321', '4', '', null, null, '222', '0');
INSERT INTO `tenant` VALUES ('8', '555555', '5', '1', '1', '2', '222', '0');
INSERT INTO `tenant` VALUES ('9', '33334444', '6', '1', '444', '4', '444', '0');
INSERT INTO `tenant` VALUES ('10', '88', '14', '1', '888', '888', '88', '0');
INSERT INTO `tenant` VALUES ('11', '9', '15', '9', '9', '9', '9', '0');
INSERT INTO `tenant` VALUES ('12', '7', '12', '7', '7', '7', '7', '0');
INSERT INTO `tenant` VALUES ('13', '556', '8', '5', '5', '5', '5', '0');
INSERT INTO `tenant` VALUES ('14', '2121', '10', '2', '1', '1', '1', '0');
INSERT INTO `tenant` VALUES ('15', '1414', '16', '1', '1', '1', '1414', '0');

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

-- ----------------------------
-- View structure for rentroom
-- ----------------------------
DROP VIEW IF EXISTS `rentroom`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `rentroom` AS select `b`.`id` AS `id`,`b`.`building_name` AS `building_name`,`b`.`building_address` AS `building_address`,`b`.`building_own` AS `building_own`,`b`.`own_phone` AS `own_phone`,`b`.`building_manager` AS `building_manager`,`b`.`manager_phone` AS `manager_phone`,`b`.`room_count` AS `room_count`,`b`.`remark` AS `remark`,`r`.`room_name` AS `room_name`,`t`.`tenant_name` AS `tenant_name` from ((`building` `b` left join `room` `r` on((`b`.`id` = `r`.`building_id`))) left join `tenant` `t` on((`r`.`id` = `t`.`room_id`))) ;
