/*
Navicat MySQL Data Transfer

Source Server         : local_mysql
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : shiro

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2017-01-08 19:00:21
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO `building` VALUES ('13', '颐和居', '大石穗中路63号', '梁秀凤', '13682222283', '梁秀凤', '13682222283', '200', '这里是备注');
INSERT INTO `building` VALUES ('14', '万达公寓', '大山村北基坊被2巷7号', '梁秀凤', '13682222283', '梁秀凤', '13682222283', '200', '这里是备注');
INSERT INTO `building` VALUES ('15', '粤森楼', '大山村群星二路', '梁秀凤', '13682222283', '梁秀凤', '13682222283', '200', '这里是备注');

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
  `tenant_id` bigint(11) DEFAULT NULL,
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
  `is_pay` int(11) DEFAULT '0' COMMENT '0、未付；1、已付',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `copy_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1 COMMENT='cost';

-- ----------------------------
-- Records of cost
-- ----------------------------
INSERT INTO `cost` VALUES ('53', '182', '24', '1332', '0', '12', '24', '123', '12', '2017', '1', '12', '2017-01-08 18:56:22', '27', '123', '12', '123', '121', '123.00', '121.00', '12.00', '12.00', '12.00', '3039.00', '12.00', '00000000001', '1500', '0', '2017-01-01', '2017-01-31', '2017-01-09');

-- ----------------------------
-- Table structure for dict_entry
-- ----------------------------
DROP TABLE IF EXISTS `dict_entry`;
CREATE TABLE `dict_entry` (
  `dicttypeid` varchar(255) CHARACTER SET utf8 NOT NULL,
  `dictid` varchar(255) NOT NULL,
  `dictname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sortno` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `value` double DEFAULT '0',
  `dictlevel` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `dictcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dictid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dict_entry
-- ----------------------------
INSERT INTO `dict_entry` VALUES ('COST', 'ECOST', '电费', '1', '1', '1', '12', '度/元', 'ECOST');
INSERT INTO `dict_entry` VALUES ('COST', 'GCOST', '', null, null, null, '12', '方/元', '');
INSERT INTO `dict_entry` VALUES ('COST', 'WCOST', '电费', null, null, null, '14', '吨/元', 'WCOST');

-- ----------------------------
-- Table structure for dict_type
-- ----------------------------
DROP TABLE IF EXISTS `dict_type`;
CREATE TABLE `dict_type` (
  `dicttypeid` varchar(255) NOT NULL,
  `dicttypename` varchar(255) DEFAULT NULL,
  `rank` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT '0',
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
INSERT INTO `dict_type` VALUES ('COST', '费用', '11', null, '11', null, null, 'COST', null, '费用');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', '总经办', '', '01', 'icon-company', null, '0', '2014-02-19 01:00:00');
INSERT INTO `organization` VALUES ('3', '技术部', '', '02', 'icon-company', null, '1', '2015-10-01 13:10:42');
INSERT INTO `organization` VALUES ('5', '产品部', '', '03', 'icon-company', null, '2', '2015-12-06 12:15:30');
INSERT INTO `organization` VALUES ('6', '测试组', '', '04', 'icon-folder', '3', '0', '2015-12-06 13:12:18');
INSERT INTO `organization` VALUES ('9', '管理部', '', 'GLB', 'icon-folder', '1', '0', '2017-01-07 21:27:25');

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
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COMMENT='资源';

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
INSERT INTO `resource` VALUES ('229', '数据字典', '', null, 'icon-company', null, '0', '0', '0', '2016-12-25 10:14:35');
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
INSERT INTO `resource` VALUES ('242', '添加', '/dict/add', null, 'icon-add', '245', '0', '0', '1', '2016-12-25 10:10:18');
INSERT INTO `resource` VALUES ('243', '编辑', '/dictType/edit', null, 'icon-edit', '245', '0', '0', '1', '2016-12-25 10:10:32');
INSERT INTO `resource` VALUES ('244', '添加', '/dictType/delete', null, 'icon-del', '245', '0', '0', '1', '2016-12-25 10:10:25');
INSERT INTO `resource` VALUES ('245', '数据字典', '/dictType/dict', null, 'menu_icon_datadeal', '229', '0', '0', '0', '2016-12-25 10:14:24');
INSERT INTO `resource` VALUES ('246', '确认缴费', '/tenant/confirm', null, 'icon-ok', '236', '0', '0', '1', '2016-12-31 12:37:15');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '0', '超级管理员', '0');
INSERT INTO `role` VALUES ('2', '技术部经理', '0', '技术部经理', '0');
INSERT INTO `role` VALUES ('7', '产品部经理', '0', '产品部经理', '0');
INSERT INTO `role` VALUES ('8', '测试账户', '0', '测试账户', '0');
INSERT INTO `role` VALUES ('9', '管理员', '0', '管理员', '0');
INSERT INTO `role` VALUES ('10', '租房部', '0', '122', '0');
INSERT INTO `role` VALUES ('11', '销售部', '0', '', '0');
INSERT INTO `role` VALUES ('12', '客户部', '0', '', '0');

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  `resource_id` bigint(19) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=991 DEFAULT CHARSET=utf8 COMMENT='角色资源';

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
INSERT INTO `role_resource` VALUES ('828', '1', '1');
INSERT INTO `role_resource` VALUES ('829', '1', '11');
INSERT INTO `role_resource` VALUES ('830', '1', '111');
INSERT INTO `role_resource` VALUES ('831', '1', '112');
INSERT INTO `role_resource` VALUES ('832', '1', '113');
INSERT INTO `role_resource` VALUES ('833', '1', '114');
INSERT INTO `role_resource` VALUES ('834', '1', '12');
INSERT INTO `role_resource` VALUES ('835', '1', '121');
INSERT INTO `role_resource` VALUES ('836', '1', '122');
INSERT INTO `role_resource` VALUES ('837', '1', '123');
INSERT INTO `role_resource` VALUES ('838', '1', '124');
INSERT INTO `role_resource` VALUES ('839', '1', '125');
INSERT INTO `role_resource` VALUES ('840', '1', '13');
INSERT INTO `role_resource` VALUES ('841', '1', '131');
INSERT INTO `role_resource` VALUES ('842', '1', '132');
INSERT INTO `role_resource` VALUES ('843', '1', '133');
INSERT INTO `role_resource` VALUES ('844', '1', '134');
INSERT INTO `role_resource` VALUES ('845', '1', '14');
INSERT INTO `role_resource` VALUES ('846', '1', '141');
INSERT INTO `role_resource` VALUES ('847', '1', '142');
INSERT INTO `role_resource` VALUES ('848', '1', '143');
INSERT INTO `role_resource` VALUES ('849', '1', '144');
INSERT INTO `role_resource` VALUES ('850', '1', '229');
INSERT INTO `role_resource` VALUES ('851', '1', '245');
INSERT INTO `role_resource` VALUES ('852', '1', '242');
INSERT INTO `role_resource` VALUES ('853', '1', '243');
INSERT INTO `role_resource` VALUES ('854', '1', '244');
INSERT INTO `role_resource` VALUES ('855', '1', '222');
INSERT INTO `role_resource` VALUES ('856', '1', '223');
INSERT INTO `role_resource` VALUES ('857', '1', '233');
INSERT INTO `role_resource` VALUES ('858', '1', '234');
INSERT INTO `role_resource` VALUES ('859', '1', '235');
INSERT INTO `role_resource` VALUES ('860', '1', '236');
INSERT INTO `role_resource` VALUES ('861', '1', '237');
INSERT INTO `role_resource` VALUES ('862', '1', '238');
INSERT INTO `role_resource` VALUES ('863', '1', '239');
INSERT INTO `role_resource` VALUES ('864', '1', '240');
INSERT INTO `role_resource` VALUES ('865', '1', '241');
INSERT INTO `role_resource` VALUES ('866', '1', '246');
INSERT INTO `role_resource` VALUES ('867', '1', '224');
INSERT INTO `role_resource` VALUES ('868', '1', '230');
INSERT INTO `role_resource` VALUES ('869', '1', '231');
INSERT INTO `role_resource` VALUES ('870', '1', '232');
INSERT INTO `role_resource` VALUES ('871', '1', '221');
INSERT INTO `role_resource` VALUES ('872', '1', '227');
INSERT INTO `role_resource` VALUES ('873', '1', '228');
INSERT INTO `role_resource` VALUES ('874', '8', '1');
INSERT INTO `role_resource` VALUES ('875', '8', '11');
INSERT INTO `role_resource` VALUES ('876', '8', '111');
INSERT INTO `role_resource` VALUES ('877', '8', '12');
INSERT INTO `role_resource` VALUES ('878', '8', '121');
INSERT INTO `role_resource` VALUES ('879', '8', '13');
INSERT INTO `role_resource` VALUES ('880', '8', '131');
INSERT INTO `role_resource` VALUES ('881', '8', '14');
INSERT INTO `role_resource` VALUES ('882', '8', '141');
INSERT INTO `role_resource` VALUES ('883', '8', '223');
INSERT INTO `role_resource` VALUES ('884', '8', '224');
INSERT INTO `role_resource` VALUES ('885', '8', '227');
INSERT INTO `role_resource` VALUES ('886', '8', '228');
INSERT INTO `role_resource` VALUES ('932', '9', '222');
INSERT INTO `role_resource` VALUES ('933', '9', '223');
INSERT INTO `role_resource` VALUES ('934', '9', '233');
INSERT INTO `role_resource` VALUES ('935', '9', '234');
INSERT INTO `role_resource` VALUES ('936', '9', '235');
INSERT INTO `role_resource` VALUES ('937', '9', '236');
INSERT INTO `role_resource` VALUES ('938', '9', '237');
INSERT INTO `role_resource` VALUES ('939', '9', '238');
INSERT INTO `role_resource` VALUES ('940', '9', '239');
INSERT INTO `role_resource` VALUES ('941', '9', '240');
INSERT INTO `role_resource` VALUES ('942', '9', '241');
INSERT INTO `role_resource` VALUES ('943', '9', '246');
INSERT INTO `role_resource` VALUES ('944', '9', '224');
INSERT INTO `role_resource` VALUES ('945', '9', '230');
INSERT INTO `role_resource` VALUES ('946', '9', '231');
INSERT INTO `role_resource` VALUES ('947', '9', '232');
INSERT INTO `role_resource` VALUES ('958', '12', '1');
INSERT INTO `role_resource` VALUES ('959', '12', '13');
INSERT INTO `role_resource` VALUES ('960', '12', '131');
INSERT INTO `role_resource` VALUES ('961', '12', '132');
INSERT INTO `role_resource` VALUES ('962', '12', '133');
INSERT INTO `role_resource` VALUES ('963', '12', '134');
INSERT INTO `role_resource` VALUES ('964', '12', '224');
INSERT INTO `role_resource` VALUES ('965', '12', '230');
INSERT INTO `role_resource` VALUES ('966', '12', '231');
INSERT INTO `role_resource` VALUES ('967', '12', '232');
INSERT INTO `role_resource` VALUES ('968', '11', '13');
INSERT INTO `role_resource` VALUES ('969', '11', '131');
INSERT INTO `role_resource` VALUES ('970', '11', '132');
INSERT INTO `role_resource` VALUES ('971', '11', '133');
INSERT INTO `role_resource` VALUES ('972', '11', '134');
INSERT INTO `role_resource` VALUES ('973', '11', '222');
INSERT INTO `role_resource` VALUES ('974', '11', '236');
INSERT INTO `role_resource` VALUES ('975', '11', '237');
INSERT INTO `role_resource` VALUES ('976', '11', '238');
INSERT INTO `role_resource` VALUES ('977', '11', '239');
INSERT INTO `role_resource` VALUES ('978', '11', '240');
INSERT INTO `role_resource` VALUES ('979', '11', '241');
INSERT INTO `role_resource` VALUES ('980', '11', '246');
INSERT INTO `role_resource` VALUES ('986', '10', '222');
INSERT INTO `role_resource` VALUES ('987', '10', '223');
INSERT INTO `role_resource` VALUES ('988', '10', '233');
INSERT INTO `role_resource` VALUES ('989', '10', '234');
INSERT INTO `role_resource` VALUES ('990', '10', '235');

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
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('40', '15', '粤森楼B座-102', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('41', '15', '粤森楼B座-103', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('42', '15', '粤森楼B座-103', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('43', '15', '粤森楼B座-104', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('44', '15', '粤森楼B座-105', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('45', '15', '粤森楼B座-106', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('46', '15', '粤森楼B座-201', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('47', '15', '粤森楼B座-202', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('48', '15', '粤森楼B座-203', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('49', '15', '粤森楼B座-204', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('50', '15', '粤森楼B座-205', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('51', '15', '粤森楼B座-206', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('52', '15', '粤森楼B座-207', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('53', '15', '粤森楼B座-301', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('54', '15', '粤森楼B座-302', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('55', '15', '粤森楼B座-303', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('56', '15', '粤森楼B座-304', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('57', '15', '粤森楼B座-305', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('58', '15', '粤森楼B座-306', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('59', '15', '粤森楼B座-307', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('60', '15', '粤森楼B座-308', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('61', '15', '粤森楼B座-309', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('62', '15', '粤森楼B座-401', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('63', '15', '粤森楼B座-402', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('64', '15', '粤森楼B座-403', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('65', '15', '粤森楼B座-404', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('66', '15', '粤森楼B座-405', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('67', '15', '粤森楼B座-406', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('68', '15', '粤森楼B座-407', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('69', '15', '粤森楼B座-408', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('70', '15', '粤森楼B座-409', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('71', '15', '粤森楼B座-501', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('72', '15', '粤森楼B座-502', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('73', '15', '粤森楼B座-503', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('74', '15', '粤森楼B座-504', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('75', '15', '粤森楼B座-505', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('76', '15', '粤森楼B座-506', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('77', '15', '粤森楼B座-507', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('78', '15', '粤森楼B座-508', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('79', '15', '粤森楼B座-509', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('80', '15', '粤森楼B座-601', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('81', '15', '粤森楼B座-602', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('82', '15', '粤森楼B座-603', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('83', '15', '粤森楼B座-604', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('84', '15', '粤森楼B座-605', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('85', '15', '粤森楼B座-606', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('86', '15', '粤森楼B座-607', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('87', '15', '粤森楼B座-608', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('88', '15', '粤森楼A座-102', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('89', '15', '粤森楼A座-103', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('90', '15', '粤森楼A座-103', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('91', '15', '粤森楼A座-104', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('92', '15', '粤森楼A座-105', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('93', '15', '粤森楼A座-106', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('94', '15', '粤森楼A座-201', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('95', '15', '粤森楼A座-202', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('96', '15', '粤森楼A座-203', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('97', '15', '粤森楼A座-204', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('98', '15', '粤森楼A座-205', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('99', '15', '粤森楼A座-206', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('100', '15', '粤森楼A座-207', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('101', '15', '粤森楼A座-301', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('102', '15', '粤森楼A座-302', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('103', '15', '粤森楼A座-303', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('104', '15', '粤森楼A座-304', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('105', '15', '粤森楼A座-305', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('106', '15', '粤森楼A座-306', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('107', '15', '粤森楼A座-307', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('108', '15', '粤森楼A座-308', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('109', '15', '粤森楼A座-309', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('110', '15', '粤森楼A座-401', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('111', '15', '粤森楼A座-402', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('112', '15', '粤森楼A座-403', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('113', '15', '粤森楼A座-404', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('114', '15', '粤森楼A座-405', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('115', '15', '粤森楼A座-406', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('116', '15', '粤森楼A座-407', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('117', '15', '粤森楼A座-408', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('118', '15', '粤森楼A座-409', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('119', '15', '粤森楼A座-501', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('120', '15', '粤森楼A座-502', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('121', '15', '粤森楼A座-503', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('122', '15', '粤森楼A座-504', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('123', '15', '粤森楼A座-505', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('124', '15', '粤森楼A座-506', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('125', '15', '粤森楼A座-507', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('126', '15', '粤森楼A座-508', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('127', '15', '粤森楼A座-509', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('128', '15', '粤森楼A座-601', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('129', '15', '粤森楼A座-602', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('130', '15', '粤森楼A座-603', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('131', '15', '粤森楼A座-604', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('132', '15', '粤森楼A座-605', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('133', '15', '粤森楼A座-606', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('134', '15', '粤森楼A座-607', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('135', '15', '粤森楼A座-608', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('136', '14', '万达公寓-201', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('137', '14', '万达公寓-202', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('138', '14', '万达公寓-203', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('139', '14', '万达公寓-204', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('140', '14', '万达公寓-205', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('141', '14', '万达公寓-206', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('142', '14', '万达公寓-207', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('143', '14', '万达公寓-208', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('144', '14', '万达公寓-209', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('145', '14', '万达公寓-301', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('146', '14', '万达公寓-302', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('147', '14', '万达公寓-303', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('148', '14', '万达公寓-304', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('149', '14', '万达公寓-305', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('150', '14', '万达公寓-306', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('151', '14', '万达公寓-307', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('152', '14', '万达公寓-308', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('153', '14', '万达公寓-309', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('154', '14', '万达公寓-401', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('155', '14', '万达公寓-402', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('156', '14', '万达公寓-403', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('157', '14', '万达公寓-404', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('158', '14', '万达公寓-405', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('159', '14', '万达公寓-406', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('160', '14', '万达公寓-407', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('161', '14', '万达公寓-408', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('162', '14', '万达公寓-409', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('163', '14', '万达公寓-501', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('164', '14', '万达公寓-502', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('165', '14', '万达公寓-503', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('166', '14', '万达公寓-504', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('167', '14', '万达公寓-505', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('168', '14', '万达公寓-505', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('169', '14', '万达公寓-506', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('170', '14', '万达公寓-507', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('171', '14', '万达公寓-508', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('172', '14', '万达公寓-509', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('173', '14', '万达公寓-601', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('174', '14', '万达公寓-602', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('175', '14', '万达公寓-603', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('176', '14', '万达公寓-604', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('177', '14', '万达公寓-605', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('178', '14', '万达公寓-606', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('179', '14', '万达公寓-607', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('180', '14', '万达公寓-608', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('181', '14', '万达公寓-609', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('182', '13', '颐和居-2A', '0', '1500', '0', '2017-01-01', '2017-01-31', '260001781116729', '', null);
INSERT INTO `room` VALUES ('183', '13', '颐和居-2B', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('184', '13', '颐和居-2C', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('185', '13', '颐和居-2E', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('186', '13', '颐和居-2F', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('187', '13', '颐和居-2G', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('188', '13', '颐和居-1-1', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('189', '13', '颐和居-1-2', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('190', '13', '颐和居-1-3', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('191', '13', '颐和居-1-4', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('192', '13', '颐和居-1-5', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('193', '13', '颐和居-1-6', '0', '1500', '0', null, null, '260001781116729', '', null);
INSERT INTO `room` VALUES ('194', '13', '颐和居-1-7', '0', '1500', '0', null, null, '260001781116729', '', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sms_log
-- ----------------------------
INSERT INTO `sms_log` VALUES ('41', 'lxf', '1', '成功', '865', '{rec_num=13450761833, sms_param={\"cost\":\"3039\",\"name\":\"张先生\",\"mon\":\"1\",\"room\":\"颐和居-2A\"}, sms_template_code=SMS_37555054, sms_type=normal, sms_free_sign_name=房租}', '{\"alibaba_aliqin_fc_sms_num_send_response\":{\"result\":{\"err_code\":\"0\",\"model\":\"105539979715^1107540752569\",\"success\":true},\"request_id\":\"z28cvd9lt8yp\"}}', '2017-01-08 18:56:22');

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
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=947 DEFAULT CHARSET=utf8 COMMENT='系统日志';

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
INSERT INTO `sys_log` VALUES ('196', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=229&_=1482630400962&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('197', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('198', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=添加&resourceType=1&url=/dict/add&seq=0&icon=icon-add&status=0&pid=229&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('199', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('200', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=编辑&resourceType=1&url=/dictType/edit&seq=0&icon=icon-edit&status=0&pid=229&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('201', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('202', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=添加&resourceType=1&url=/dictType/delete&seq=0&icon=icon-del&status=0&pid=229&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('203', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('204', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1482631329621&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('205', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1482631329622&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('206', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,229,222,223,233,234,235,236,237,238,239,240,241,224,230,231,232,221,227,228&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('207', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=1&_=1482631329623&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('208', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1482631329624&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('209', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('210', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=数据字典&resourceType=0&url=//dictType/dict&seq=0&icon=icon-company&status=0&pid=229&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('211', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=242&_=1482631329626&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('212', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=242&name=添加&resourceType=1&url=/dict/add&seq=0&icon=icon-add&status=0&pid=245&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('213', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=244&_=1482631329627&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('214', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=244&name=添加&resourceType=1&url=/dictType/delete&seq=0&icon=icon-del&status=0&pid=245&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('215', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=243&_=1482631329628&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('216', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=243&name=编辑&resourceType=1&url=/dictType/edit&seq=0&icon=icon-edit&status=0&pid=245&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('217', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=245&_=1482631329629&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('218', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=14&_=1482631329630&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('219', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=245&_=1482631329631&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('220', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=245&name=数据字典&resourceType=0&url=//dictType/dict&seq=0&icon=menu_icon_datadeal&status=0&pid=229&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('221', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1482631858298&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('222', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,229,245,242,243,244,222,223,233,234,235,236,237,238,239,240,241,224,230,231,232,221,227,228&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('223', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=444444&dicttypename=44&dicttypecode=44444&seqno=444&rank=44444&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('224', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=444444&dicttypename=44&dicttypecode=44444&seqno=444&rank=44444&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('225', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=77777777&dicttypename=7777&dicttypecode=777777777&seqno=7777&rank=777&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('226', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=8&dicttypename=6&dicttypecode=9&seqno=5&rank=4&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('227', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=1&dicttypename=4&dicttypecode=2&seqno=5&rank=3&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('228', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('229', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:add,[参数]:roomName=A01&type=0&status=0&buildingId=3&monRent=1000&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('230', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=32&tenantName=张四&monRent=400&_=1482655484709&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('231', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=张四&monRent=400&manageCharge=1&currentElectricNum=19.00&lastElectricNum=13.00&electricNum=6.00&electricUnitPrice=1.00&electricCharge=6.00&currentWaterNum=16.00&lastWaterNum=12.00&waterNum=4.00&waterUnitPrice=1.00&waterCharge=4.00&currentGasNum=9.00&lastGasNum=10.00&gasNum=0.00&gasUnitPrice=1.00&gasCharge=0.00&internetCharge=0.00&tvCharge=0.00&equallyCharge=0.00&otherCharge=0.00&total=10.00&roomId=32&sendCount=0&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('232', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=32&tenantName=张四&monRent=400&_=1482655484711&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('233', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张四&sex=1&tel=13450761833&identityCard=121212121121212211&remark=蔡小章&roomId=32&id=18&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('234', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张四&sex=1&tel=15919064667&identityCard=121212121121212211&remark=蔡小章&roomId=32&id=18&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('235', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=31&roomName=A101&liver=刘女士&beginDate=2016-12-01 17:00:45&endDate=2018-12-25 17:00:37&type=0&status=0&buildingId=1&monRent=300.0&remark=啊啊啊啊啊&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('236', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=32&roomName=A102&liver=张先生&beginDate=2016-12-25 17:01:13&endDate=2017-12-25 17:01:16&type=0&status=0&buildingId=2&monRent=400.0&remark=押一付一&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('237', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=33&roomName=A01&liver=王先生&beginDate=2016-12-25 17:01:43&endDate=2017-12-25 17:01:54&type=0&status=0&buildingId=3&monRent=1000.0&remark=押二付一&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('238', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=33&roomName=A003&liver=王先生&beginDate=2016-12-25 14:00:00&endDate=2017-12-25 14:00:00&type=0&status=0&buildingId=3&monRent=1000.0&remark=押二付一&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('239', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=33&roomName=A003&liver=王先生&beginDate=2016-12-25 14:00:00&endDate=2017-12-25 14:00:00&type=0&status=0&buildingId=3&monRent=1000.0&remark=押二付一&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('240', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=31&roomName=A101&liver=刘女士&beginDate=2016-12-01 14:00:00&endDate=2018-12-25 14:00:00&type=0&status=0&buildingId=1&monRent=300.0&remark=押一付一&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('241', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&buildingName=碧桂园&buildingAddress=testtesttesttesttest&buildingOwn=testtesttest&ownPhone=123123123&buildingManager=testtest&managerPhone=23123123&roomCount=1212&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('242', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&buildingName=碧桂园&buildingAddress=佛山北滘碧桂园&buildingOwn=testtesttest&ownPhone=123123123&buildingManager=testtest&managerPhone=23123123&roomCount=1212&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('243', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&buildingName=碧桂园&buildingAddress=佛山北滘碧桂园&buildingOwn=碧桂园女士&ownPhone=121231&buildingManager=testtest&managerPhone=23123123&roomCount=1212&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('244', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&buildingName=碧桂园&buildingAddress=佛山北滘碧桂园&buildingOwn=碧桂园女士&ownPhone=121231&buildingManager=碧桂园&managerPhone=23123123&roomCount=1212&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('245', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&buildingName=碧桂园&buildingAddress=佛山北滘碧桂园&buildingOwn=碧桂园女士&ownPhone=121231&buildingManager=碧桂园&managerPhone=112121&roomCount=1212&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('246', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&buildingName=碧桂园&buildingAddress=佛山北滘碧桂园&buildingOwn=碧桂园女士&ownPhone=121231&buildingManager=碧桂园&managerPhone=2&roomCount=1212&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('247', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&buildingName=碧桂园&buildingAddress=佛山北滘碧桂园&buildingOwn=碧桂园女士&ownPhone=121231&buildingManager=碧桂园&managerPhone=3&roomCount=1212&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('248', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&buildingName=碧桂园&buildingAddress=佛山北滘碧桂园&buildingOwn=碧桂园女士&ownPhone=121231&buildingManager=碧桂园&managerPhone=186&roomCount=1212&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('249', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&buildingName=碧桂园&buildingAddress=佛山北滘碧桂园&buildingOwn=碧桂园女士&ownPhone=15988888888&buildingManager=碧桂园&managerPhone=186&roomCount=1212&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('250', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&buildingName=碧桂园&buildingAddress=佛山北滘碧桂园&buildingOwn=碧桂园女士&ownPhone=15998888888&buildingManager=碧桂园&managerPhone=186&roomCount=1212&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('251', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&buildingName=碧桂园&buildingAddress=佛山北滘碧桂园&buildingOwn=碧桂园女士&ownPhone=15998888888&buildingManager=碧桂园&managerPhone=18688888888&roomCount=1000&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('252', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=2&buildingName=海蓝地产&buildingAddress=湛江市&buildingOwn=xxxxx&ownPhone=121231&buildingManager=zzzz&managerPhone=112121&roomCount=1212&remark=testtset&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('253', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=2&buildingName=海蓝地产&buildingAddress=湛江市&buildingOwn=哦哦哦&ownPhone=121231&buildingManager=zzzz&managerPhone=112121&roomCount=1212&remark=testtset&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('254', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=2&buildingName=海蓝地产&buildingAddress=湛江市&buildingOwn=海蓝&ownPhone=18888888888&buildingManager=蔡小章&managerPhone=13499999999&roomCount=1212&remark=出租&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('255', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('256', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:add,[参数]:id=&buildingName=1&buildingAddress=1&buildingOwn=1&ownPhone=1&buildingManager=1&managerPhone=1&roomCount=1&remark=1&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('257', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('258', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:add,[参数]:id=&buildingName=2&buildingAddress=2&buildingOwn=2&ownPhone=2&buildingManager=2&managerPhone=2&roomCount=2&remark=2&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('259', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('260', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:add,[参数]:id=&buildingName=3&buildingAddress=3&buildingOwn=3&ownPhone=3&buildingManager=4&managerPhone=5&roomCount=6&remark=6&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('261', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:delete,[参数]:id=4&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('262', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:delete,[参数]:id=6&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('263', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:delete,[参数]:id=5&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('264', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('265', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:add,[参数]:id=&buildingName=1&buildingAddress=2&buildingOwn=3&ownPhone=3&buildingManager=4&managerPhone=5&roomCount=6&remark=5&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('266', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=7&buildingName=133&buildingAddress=233&buildingOwn=333&ownPhone=33333&buildingManager=43333&managerPhone=5&roomCount=6&remark=5&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('267', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:delete,[参数]:id=7&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('268', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('269', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:add,[参数]:id=&buildingName=秀凤楼盘&buildingAddress=广州市番禺区群贤路&buildingOwn=梁秀凤&ownPhone=13888888888&buildingManager=梁秀凤&managerPhone=13888888888&roomCount=200&remark=出租&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('270', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('271', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:add,[参数]:id=&buildingName=腾飞楼房&buildingAddress=广州市番禺区群贤路&buildingOwn=梁秀凤&ownPhone=13888888888&buildingManager=梁秀凤&managerPhone=13888888888&roomCount=1000&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('272', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('273', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:add,[参数]:roomName=秀凤-北京&type=0&status=0&buildingId=8&monRent=1500&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('274', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('275', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:add,[参数]:roomName=秀凤-上海&type=0&status=0&buildingId=8&monRent=2000&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('276', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('277', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:add,[参数]:roomName=秀凤-广州&type=1&status=1&buildingId=8&monRent=3000&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('278', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('279', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:add,[参数]:roomName=秀凤-重庆&type=1&status=0&buildingId=8&monRent=3000&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('280', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=梁先生&sex=0&tel=13688888888&identityCard=360026888888888888&remark=&roomId=8&id=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('281', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=梁先生&sex=0&tel=13688888888&identityCard=360026888888888888&remark=&roomId=8&id=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('282', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=周先生&sex=0&tel=15699999999&identityCard=360022000000001119&remark=&roomId=9&id=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('283', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=周先生&sex=0&tel=15699999999&identityCard=360022000000001119&remark=&roomId=9&id=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('284', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('285', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=37&roomName=秀凤-重庆&liver=周先生&beginDate=2016-12-25 17:24:40&endDate=2017-12-25 17:24:43&type=0&status=0&buildingId=8&monRent=3000.0&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('286', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=31&roomName=A101&liver=刘女士&beginDate=2016-12-01 14:00:00&endDate=2018-12-25 14:00:00&type=0&status=1&buildingId=1&monRent=300.0&remark=押一付一&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('287', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=32&roomName=A102&liver=张先生&beginDate=2016-12-25 14:00:00&endDate=2017-12-25 14:00:00&type=0&status=1&buildingId=2&monRent=400.0&remark=押一付一&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('288', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=33&roomName=A003&liver=王先生&beginDate=2016-12-25 14:00:00&endDate=2017-12-25 14:00:00&type=0&status=1&buildingId=3&monRent=1000.0&remark=押二付一&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('289', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=34&roomName=秀凤-北京&liver=李先生&beginDate=2016-12-25 17:33:53&endDate=2017-12-25 17:33:56&type=0&status=1&buildingId=8&monRent=1500.0&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('290', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=35&roomName=秀凤-上海&liver=刘女士&beginDate=2016-12-25 17:34:18&endDate=2017-12-25 17:34:21&type=0&status=1&buildingId=8&monRent=2000.0&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('291', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=36&roomName=秀凤-广州&liver=张女士&beginDate=2016-12-25 17:34:44&endDate=2017-12-25 17:34:47&type=0&status=1&buildingId=8&monRent=3000.0&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('292', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=37&roomName=秀凤-重庆&liver=周先生&beginDate=2016-12-25 14:00:00&endDate=2017-12-25 14:00:00&type=0&status=1&buildingId=8&monRent=3000.0&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('293', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=0&tel=13450761833&identityCard=121223123111123111&remark=啊啊啊啊啊啊啊啊啊啊啊啊啊啊&roomId=31&id=17&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('294', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=0&tel=13450761833&identityCard=121223123111123111&remark=出租&roomId=31&id=17&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('295', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张女士&sex=1&tel=15919064667&identityCard=121212121121212211&remark=出租&roomId=32&id=18&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('296', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=木女士&sex=1&tel=15919064667&identityCard=360022000000001119&remark=出差&roomId=33&id=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('297', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=木女士&monRent=1000&_=1482657495804&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('298', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=木女士&monRent=1000&_=1482657495805&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('299', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=木女士&monRent=1000&manageCharge=0&currentElectricNum=100.00&lastElectricNum=1.00&electricNum=99.00&electricUnitPrice=1.00&electricCharge=99.00&currentWaterNum=100.00&lastWaterNum=1.00&waterNum=99.00&waterUnitPrice=100.00&waterCharge=9900.00&currentGasNum=100.00&lastGasNum=1.00&gasNum=99.00&gasUnitPrice=100.00&gasCharge=9900.00&internetCharge=10.00&tvCharge=0.00&equallyCharge=0.00&otherCharge=1.00&total=19910.00&roomId=33&sendCount=0&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('300', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:edit,[参数]:year=2016&month=12&tenantName=木女士&monRent=1000.0&manageCharge=0.0&currentElectricNum=100.00&lastElectricNum=1.00&electricNum=99.00&electricUnitPrice=1.00&electricCharge=99.00&currentWaterNum=100.00&lastWaterNum=1.00&waterNum=99.00&waterUnitPrice=100.00&waterCharge=9900.00&currentGasNum=100.00&lastGasNum=1.00&gasNum=99.00&gasUnitPrice=100.00&gasCharge=9900.00&internetCharge=10.00&tvCharge=0.00&equallyCharge=0.00&otherCharge=1.00&total=19910.00&remark=&roomId=33&sendCount=1&id=45&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('301', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=木女士&sex=1&tel=15919064667&identityCard=360022000000001119&remark=出差&roomId=33&id=19&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('302', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=37&roomName=秀凤-重庆&liver=周先生&beginDate=2016-12-25 14:00:00&endDate=2017-12-25 14:00:00&type=0&status=0&buildingId=8&monRent=3000.0&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('303', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=36&roomName=秀凤-广州&liver=张女士&beginDate=2016-12-25 14:00:00&endDate=2017-12-25 14:00:00&type=0&status=0&buildingId=8&monRent=3000.0&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('304', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=35&roomName=秀凤-上海&liver=刘女士&beginDate=2016-12-25 14:00:00&endDate=2017-12-25 14:00:00&type=0&status=0&buildingId=8&monRent=2000.0&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('305', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=32&roomName=A102&liver=李先生&beginDate=2016-12-25 14:00:00&endDate=2017-12-25 14:00:00&type=0&status=0&buildingId=2&monRent=400.0&remark=押一付一&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('306', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=31&roomName=A101&liver=周先生&beginDate=2016-12-01 14:00:00&endDate=2018-12-25 14:00:00&type=0&status=1&buildingId=1&monRent=300.0&remark=押一付一&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('307', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=33&roomName=A003&liver=刘女士&beginDate=2016-12-25 14:00:00&endDate=2017-12-25 14:00:00&type=0&status=1&buildingId=3&monRent=1000.0&remark=押二付一&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('308', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=3&buildingName=海岸花园&buildingAddress=顺德北滘&buildingOwn=张三&ownPhone=14567832222&buildingManager=李四&managerPhone=15899999999&roomCount=12&remark=test&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('309', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=1&buildingName=碧桂园&buildingAddress=佛山北滘碧桂园&buildingOwn=碧桂园女士&ownPhone=15998888888&buildingManager=碧桂园&managerPhone=18688888888&roomCount=1000&remark=出租&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('310', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=3&buildingName=海岸花园&buildingAddress=顺德北滘&buildingOwn=张三&ownPhone=14567832222&buildingManager=李四&managerPhone=15899999999&roomCount=12&remark=出售&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('311', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=9&buildingName=腾飞楼房&buildingAddress=广州市番禺区群贤路&buildingOwn=梁秀凤&ownPhone=13888888888&buildingManager=梁秀凤&managerPhone=13888888888&roomCount=1000&remark=出售&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('312', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=9&buildingName=腾飞楼房&buildingAddress=广州市番禺区群贤路&buildingOwn=梁秀凤&ownPhone=13888888888&buildingManager=梁秀凤&managerPhone=13888888888&roomCount=1000&remark=出售&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('313', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=666&dicttypename=69&dicttypecode=668&seqno=68&rank=67&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('314', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=66&dicttypename=66&dicttypecode=66&seqno=66&rank=66&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('315', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=6&dicttypename=6&dicttypecode=6&seqno=6&rank=6&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('316', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=8&dicttypename=8&dicttypecode=8&seqno=8&rank=8&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('317', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=5&dicttypename=5&dicttypecode=5&seqno=5&rank=5&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('318', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=666&dicttypename=66&dicttypecode=666&seqno=66&rank=666&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('319', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=666&dicttypename=66&dicttypecode=666&seqno=66&rank=666&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('320', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=666&dicttypename=66&dicttypecode=666&seqno=66&rank=666&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('321', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=888&dicttypename=888&dicttypecode=888&seqno=888&rank=888&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('322', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=9999&dicttypename=999&dicttypecode=999&seqno=999&rank=999&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('323', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=000&dicttypename=00&dicttypecode=00&seqno=00&rank=0&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('324', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=311&dicttypename=1212&dicttypecode=2121&seqno=1212&rank=1212&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('325', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=2121&dicttypename=212&dicttypecode=2121&seqno=121&rank=1212&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('326', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:dicttypeid=44&dicttypename=4&dicttypecode=4&seqno=4&rank=4&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('327', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('328', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('329', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('330', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('331', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('332', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('333', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('334', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('335', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('336', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('337', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('338', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('339', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('340', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('341', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('342', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('343', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('344', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:delete,[参数]:id=COST&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('345', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('346', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:delete,[参数]:id=COST&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('347', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('348', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:add,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('349', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('350', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('351', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('352', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('353', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('354', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictEntryController,[方法]:delete,[参数]:id=WWWW&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('355', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictEntryController,[方法]:delete,[参数]:id=WWWW&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('356', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictEntryController,[方法]:delete,[参数]:id=WCOST1&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('357', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictEntryController,[方法]:delete,[参数]:id=ECOST1&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('358', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('359', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictEntryController,[方法]:delete,[参数]:id=WCOST&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('360', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictEntryController,[方法]:delete,[参数]:id=undefined&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('361', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('362', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('363', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('364', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('365', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('366', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('367', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('368', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('369', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('370', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('371', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('372', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=34&tenantName=&monRent=1500&_=1482830273809&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('373', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=木女士&monRent=1000&_=1482830273810&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('374', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=32&tenantName=张女士&monRent=400&_=1482836297711&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('375', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=张先生&monRent=300&_=1482836388120&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('376', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=32&tenantName=张女士&monRent=400&_=1482836520747&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('377', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=木女士&monRent=1000&_=1482837503456&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('378', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=木女士&monRent=1000&_=1482837503457&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('379', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=张先生&monRent=300&_=1482885807743&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('380', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:delete,[参数]:id=19&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('381', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:delete,[参数]:id=18&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('382', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=222222&sex=0&tel=13450761833&identityCard=121223123111123111&remark=&roomId=32&id=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('383', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=222222&sex=0&tel=13450761833&identityCard=121223123111123111&remark=1111&roomId=32&id=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('384', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:delete,[参数]:id=20&roomId=32&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('385', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=77777&sex=1&tel=15919064667&identityCard=121223123111123111&remark=7777&roomId=32&id=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('386', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:delete,[参数]:id=22&roomId=32&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('387', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=222222&sex=0&tel=13450761833&identityCard=121223123111123111&remark=1111&roomId=32&id=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('388', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:delete,[参数]:id=23&roomId=32&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('389', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=33333&sex=0&tel=13450761833&identityCard=360026888888888888&remark=333333333&roomId=33&id=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('390', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482933346575&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('391', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482933773582&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('392', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482933773583&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('393', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482933773584&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('394', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482933773585&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('395', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482933773586&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('396', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482934055626&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('397', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482934055627&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('398', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482934109888&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('399', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482934154226&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('400', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482934222702&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('401', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482934250768&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('402', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482934396137&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('403', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482934562070&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('404', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictTypeController,[方法]:edit,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('405', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482934562073&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('406', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482934562074&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('407', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482934704254&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('408', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482934803441&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('409', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482934982735&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('410', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482935132977&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('411', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482935295115&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('412', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482935409261&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('413', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482935470480&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('414', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482935537088&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('415', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482935583321&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('416', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482935682277&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('417', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482935781194&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('418', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482935823125&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('419', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482935905123&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('420', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482935965265&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('421', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482936192281&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('422', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=33&tenantName=33333&monRent=1000&_=1482936292251&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('423', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=33333&monRent=1000&manageCharge=0&currentElectricNum=2.00&lastElectricNum=1.00&electricNum=1.00&electricUnitPrice=12.00&electricCharge=12.00&currentWaterNum=2.00&lastWaterNum=1.00&waterNum=1.00&waterUnitPrice=14.00&waterCharge=14.00&currentGasNum=2.00&lastGasNum=1.00&gasNum=1.00&gasUnitPrice=12.00&gasCharge=12.00&internetCharge=2.00&tvCharge=2.00&equallyCharge=2.00&otherCharge=2.00&total=46.00&roomId=33&sendCount=0&remark=11111&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('424', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('425', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:add,[参数]:name=确认缴费&resourceType=1&url=/tenant/confirm&seq=0&icon=icon-ok&status=0&pid=223&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('426', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=246&_=1483158907039&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('427', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:edit,[参数]:id=246&name=确认缴费&resourceType=1&url=/tenant/confirm&seq=0&icon=icon-ok&status=0&pid=236&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('428', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1483159041343&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('429', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,229,245,242,243,244,222,223,233,234,235,236,237,238,239,240,241,246,224,230,231,232,221,227,228&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('430', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1483159074957&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('431', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('432', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:edit,[参数]:year=2016&month=12&tenantName=张先生&monRent=300.0&manageCharge=35&currentElectricNum=121.00&lastElectricNum=110.00&electricNum=11.00&electricUnitPrice=12.00&electricCharge=132.00&currentWaterNum=11.00&lastWaterNum=1.00&waterNum=10.00&waterUnitPrice=14.00&waterCharge=140.00&currentGasNum=11.00&lastGasNum=12.00&gasNum=0.00&gasUnitPrice=12.00&gasCharge=0.00&internetCharge=1.00&tvCharge=1.00&equallyCharge=1.00&otherCharge=12.00&total=622.00&remark=3333333333&roomId=31&sendCount=0&id=42&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('433', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:edit,[参数]:year=2016&month=12&tenantName=张先生&monRent=300.0&manageCharge=35&currentElectricNum=121.00&lastElectricNum=110.00&electricNum=11.00&electricUnitPrice=12.00&electricCharge=132.00&currentWaterNum=11.00&lastWaterNum=1.00&waterNum=10.00&waterUnitPrice=14.00&waterCharge=140.00&currentGasNum=11.00&lastGasNum=10.00&gasNum=1.00&gasUnitPrice=12.00&gasCharge=12.00&internetCharge=1.00&tvCharge=1.00&equallyCharge=1.00&otherCharge=12.00&total=634.00&remark=3333333333&roomId=31&sendCount=0&id=42&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('434', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=张先生&monRent=300&tenantId=17&_=1483240035866&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('435', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=张先生&monRent=300&tenantId=17&_=1483240035867&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('436', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=张先生&monRent=300&tenantId=17&_=1483240035868&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('437', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=张先生&monRent=300&tenantId=17&_=1483240035871&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('438', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=31&tenantName=张先生&monRent=300&tenantId=17&_=1483240035872&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('439', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:delete,[参数]:id=42&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('440', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:delete,[参数]:id=42&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('441', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:delete,[参数]:id=42&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('442', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:delete,[参数]:id=43&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('443', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:delete,[参数]:id=33&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('444', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('445', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('446', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('447', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('448', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:add,[参数]:code=1&name=1&seq=0&icon=icon-folder&address=&pid=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('449', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('450', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:add,[参数]:loginName=1&name=1&password=1&sex=0&age=&userType=1&organizationId=8&roleIds=2&phone=&status=0&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('451', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=17&_=1483241475913&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('452', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:edit,[参数]:id=17&loginName=lxf&name=梁秀凤&password=123&sex=1&age=&userType=1&organizationId=8&roleIds=2&phone=&status=0&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('453', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('454', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('455', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=17&_=1483241740662&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('456', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=17&_=1483241740663&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('457', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:edit,[参数]:id=17&loginName=lxf&name=梁秀凤&password=&sex=1&age=&userType=1&organizationId=8&roleIds=7&phone=&status=0&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('458', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=7&_=1483241740664&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('459', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=8&_=1483241740665&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('460', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=8&resourceIds=1,11,111,12,121,13,131,14,141,223,224,227,228&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('461', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=8&_=1483241740666&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('462', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:edit,[参数]:id=8&name=测试账户&seq=0&status=0&description=测试账户&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('463', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('464', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=17&_=1483241879417&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('465', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:edit,[参数]:id=17&loginName=lxf&name=梁秀凤&password=123&sex=1&age=&userType=1&organizationId=8&roleIds=7&phone=&status=0&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('466', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('467', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('468', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('469', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:add,[参数]:id=&buildingName=颐和居&buildingAddress=大石穗中路63号&buildingOwn=梁秀凤&ownPhone=13682222283&buildingManager=梁秀凤&managerPhone=13682222283&roomCount=200&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('470', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('471', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:add,[参数]:roomName=颐和居-2A&type=0&status=1&buildingId=10&monRent=1500&remark=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('472', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=张先生&sex=0&tel=13682222283&identityCard=260001781116729&remark=&roomId=38&id=&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('473', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=undefined&_=1483241918994&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('474', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483241918995&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('475', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2017&month=1&tenantName=张先生&monRent=1500&manageCharge=0&currentElectricNum=111.00&lastElectricNum=1.00&electricNum=110.00&electricUnitPrice=12.00&electricCharge=1320.00&currentWaterNum=111.00&lastWaterNum=1.00&waterNum=110.00&waterUnitPrice=14.00&waterCharge=1540.00&currentGasNum=111.00&lastGasNum=1.00&gasNum=110.00&gasUnitPrice=12.00&gasCharge=1320.00&internetCharge=0.00&tvCharge=0.00&equallyCharge=0.00&otherCharge=0.00&total=5680.00&roomId=38&tenantId=25&sendCount=0&remark=111&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('476', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:delete,[参数]:id=46&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('477', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483241918996&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('478', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2017&month=1&tenantName=张先生&monRent=1500&manageCharge=80&currentElectricNum=123.00&lastElectricNum=12.00&electricNum=111.00&electricUnitPrice=12.00&electricCharge=1332.00&currentWaterNum=121.00&lastWaterNum=12.00&waterNum=109.00&waterUnitPrice=14.00&waterCharge=1526.00&currentGasNum=122.00&lastGasNum=12.00&gasNum=110.00&gasUnitPrice=12.00&gasCharge=1320.00&internetCharge=0.00&tvCharge=0.00&equallyCharge=0.00&otherCharge=0.00&total=5758.00&roomId=38&tenantId=25&sendCount=0&remark=1231&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('479', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=0&tel=13450761833&identityCard=260001781116729&remark=13682222283&roomId=38&id=25&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('480', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=0&tel=13682222283&identityCard=260001781116729&remark=&roomId=38&id=25&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('481', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=0&tel=13450761833&identityCard=260001781116729&remark=13682222283&roomId=38&id=25&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('482', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=1&tel=13450761833&identityCard=260001781116729&remark=13682222283&roomId=38&id=25&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('483', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('484', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('485', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483251915051&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('486', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('487', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:addPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('488', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=13&_=1483251915054&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('489', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=1&_=1483251915055&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('490', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483251915056&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('491', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483252223781&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('492', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483253489648&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('493', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483253489649&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('494', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483253489650&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('495', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483253489651&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('496', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483254093759&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('497', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483254093760&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('498', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483254142503&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('499', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483254142504&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('500', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483254299547&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('501', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483254299548&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('502', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483254299549&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('503', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483254299550&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('504', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483254299551&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('505', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483254299552&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('506', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483254723685&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('507', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483254723686&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('508', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483254723687&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('509', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483254723688&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('510', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483254723689&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('511', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483255160482&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('512', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483255160483&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('513', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483255182038&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('514', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483255182039&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('515', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483255182040&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('516', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483255182041&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('517', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2017&month=1&tenantName=张先生&monRent=1500&equallyCharge=11.00&startDate=2017-01-03&endDate=2017-01-18&copyDate=2017-01-13&manageCharge=11&internetCharge=11.00&currentElectricNum=123.00&lastElectricNum=11.00&electricNum=112.00&electricUnitPrice=12.00&electricCharge=1344.00&currentWaterNum=111.00&lastWaterNum=11.00&waterNum=100.00&waterUnitPrice=14.00&waterCharge=1400.00&currentGasNum=111.00&lastGasNum=11.00&gasNum=100.00&gasUnitPrice=12.00&gasCharge=1200.00&tvCharge=11.00&otherCharge=11.00&roomId=38&tenantId=25&sendCount=0&total=5499.00&remark=1111&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('518', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2017&month=2&tenantName=张先生&monRent=1500&equallyCharge=11.00&startDate=2017-01-03&endDate=2017-01-18&copyDate=2017-01-13&manageCharge=11&internetCharge=11.00&currentElectricNum=123.00&lastElectricNum=11.00&electricNum=112.00&electricUnitPrice=12.00&electricCharge=1344.00&currentWaterNum=111.00&lastWaterNum=11.00&waterNum=100.00&waterUnitPrice=14.00&waterCharge=1400.00&currentGasNum=111.00&lastGasNum=11.00&gasNum=100.00&gasUnitPrice=12.00&gasCharge=1200.00&tvCharge=11.00&otherCharge=11.00&roomId=38&tenantId=25&sendCount=0&total=5499.00&remark=1111&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('519', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483255966785&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('520', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483256084268&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('521', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483322760646&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('522', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483324851589&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('523', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483325447811&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('524', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483325878920&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('525', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483326129852&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('526', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483326129853&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('527', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483327111465&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('528', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483328602731&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('529', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483329054485&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('530', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483331337635&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('531', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483331446704&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('532', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483332763381&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('533', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483332822651&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('534', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483332913801&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('535', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483332953932&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('536', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483333063286&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('537', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483334099132&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('538', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483334130494&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('539', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483334189502&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('540', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483334324906&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('541', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483334500412&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('542', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483334569740&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('543', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2017&month=1&tenantName=张先生&monRent=1500&equallyCharge=0.00&manageCharge=0&internetCharge=0.00&currentElectricNum=12.00&lastElectricNum=1.00&electricNum=11.00&electricUnitPrice=12.00&electricCharge=132.00&currentWaterNum=12.00&lastWaterNum=1.00&waterNum=11.00&waterUnitPrice=14.00&waterCharge=154.00&currentGasNum=12.00&lastGasNum=1.00&gasNum=11.00&gasUnitPrice=12.00&gasCharge=132.00&tvCharge=0.00&otherCharge=0.00&roomId=38&tenantId=25&sendCount=0&total=1918.00&remark=12&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('544', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:edit,[参数]:year=2017&month=2&tenantName=张先生&monRent=1500.0&equallyCharge=11.00&startDate=2017-01-02&endDate=2017-01-04&copyDate=2017-01-02&manageCharge=11&internetCharge=11.00&currentElectricNum=123.00&lastElectricNum=11.00&electricNum=112.00&electricUnitPrice=12.00&electricCharge=1344.00&currentWaterNum=111.00&lastWaterNum=11.00&waterNum=100.00&waterUnitPrice=14.00&waterCharge=1400.00&currentGasNum=111.00&lastGasNum=11.00&gasNum=100.00&gasUnitPrice=12.00&gasCharge=1200.00&tvCharge=11.00&otherCharge=11.00&roomId=38&sendCount=1&id=48&total=5499.00&remark=1111&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('545', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:delete,[参数]:id=47&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('546', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483445171040&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('547', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2017&month=1&tenantName=张先生&monRent=1500&equallyCharge=0.00&startDate=2017-01-03&endDate=2017-01-05&copyDate=2017-01-03&manageCharge=0&internetCharge=0.00&currentElectricNum=123.00&lastElectricNum=12.00&electricNum=111.00&electricUnitPrice=12.00&electricCharge=1332.00&currentWaterNum=123.00&lastWaterNum=12.00&waterNum=111.00&waterUnitPrice=14.00&waterCharge=1554.00&currentGasNum=1231.00&lastGasNum=12.00&gasNum=1219.00&gasUnitPrice=12.00&gasCharge=14628.00&tvCharge=0.00&otherCharge=0.00&roomId=38&tenantId=25&sendCount=0&isPay=0&total=19014.00&remark=123&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('548', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('549', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-05 19:05:29');
INSERT INTO `sys_log` VALUES ('550', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:page=1&rows=20&', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('551', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('552', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, null);
INSERT INTO `sys_log` VALUES ('553', 'test', 'test', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-05 19:07:34');
INSERT INTO `sys_log` VALUES ('554', 'test', 'test', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('555', 'test', 'test', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', null);
INSERT INTO `sys_log` VALUES ('556', 'test', 'test', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-05 19:12:35');
INSERT INTO `sys_log` VALUES ('557', 'test', 'test', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-05 19:12:51');
INSERT INTO `sys_log` VALUES ('558', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-05 19:12:57');
INSERT INTO `sys_log` VALUES ('559', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-05 19:13:54');
INSERT INTO `sys_log` VALUES ('560', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 13:04:21');
INSERT INTO `sys_log` VALUES ('561', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 13:09:55');
INSERT INTO `sys_log` VALUES ('562', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 13:12:51');
INSERT INTO `sys_log` VALUES ('563', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 13:17:05');
INSERT INTO `sys_log` VALUES ('564', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 13:28:31');
INSERT INTO `sys_log` VALUES ('565', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 13:28:39');
INSERT INTO `sys_log` VALUES ('566', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 13:29:04');
INSERT INTO `sys_log` VALUES ('567', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 13:33:38');
INSERT INTO `sys_log` VALUES ('568', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 13:34:42');
INSERT INTO `sys_log` VALUES ('569', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 13:43:38');
INSERT INTO `sys_log` VALUES ('570', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 14:00:14');
INSERT INTO `sys_log` VALUES ('571', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 14:00:48');
INSERT INTO `sys_log` VALUES ('572', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 14:01:33');
INSERT INTO `sys_log` VALUES ('573', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 14:02:21');
INSERT INTO `sys_log` VALUES ('574', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 14:03:02');
INSERT INTO `sys_log` VALUES ('575', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 14:03:22');
INSERT INTO `sys_log` VALUES ('576', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 14:03:46');
INSERT INTO `sys_log` VALUES ('577', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 14:04:18');
INSERT INTO `sys_log` VALUES ('578', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 14:04:31');
INSERT INTO `sys_log` VALUES ('579', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 14:04:48');
INSERT INTO `sys_log` VALUES ('580', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 14:11:31');
INSERT INTO `sys_log` VALUES ('581', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 14:12:01');
INSERT INTO `sys_log` VALUES ('582', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 14:12:43');
INSERT INTO `sys_log` VALUES ('583', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 14:13:17');
INSERT INTO `sys_log` VALUES ('584', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 15:23:38');
INSERT INTO `sys_log` VALUES ('585', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 15:24:07');
INSERT INTO `sys_log` VALUES ('586', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 15:24:19');
INSERT INTO `sys_log` VALUES ('587', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 15:24:38');
INSERT INTO `sys_log` VALUES ('588', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 15:24:54');
INSERT INTO `sys_log` VALUES ('589', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 15:25:20');
INSERT INTO `sys_log` VALUES ('590', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 15:25:40');
INSERT INTO `sys_log` VALUES ('591', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 15:25:53');
INSERT INTO `sys_log` VALUES ('592', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 15:42:30');
INSERT INTO `sys_log` VALUES ('593', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 15:52:41');
INSERT INTO `sys_log` VALUES ('594', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 16:13:58');
INSERT INTO `sys_log` VALUES ('595', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 16:14:34');
INSERT INTO `sys_log` VALUES ('596', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 16:15:40');
INSERT INTO `sys_log` VALUES ('597', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 16:16:59');
INSERT INTO `sys_log` VALUES ('598', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 16:18:03');
INSERT INTO `sys_log` VALUES ('599', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 16:18:26');
INSERT INTO `sys_log` VALUES ('600', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 16:18:47');
INSERT INTO `sys_log` VALUES ('601', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 16:19:11');
INSERT INTO `sys_log` VALUES ('602', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-06 16:27:01');
INSERT INTO `sys_log` VALUES ('603', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 09:24:01');
INSERT INTO `sys_log` VALUES ('604', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 10:41:01');
INSERT INTO `sys_log` VALUES ('605', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 10:41:45');
INSERT INTO `sys_log` VALUES ('606', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 10:45:00');
INSERT INTO `sys_log` VALUES ('607', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 10:55:42');
INSERT INTO `sys_log` VALUES ('608', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 10:56:19');
INSERT INTO `sys_log` VALUES ('609', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 10:56:56');
INSERT INTO `sys_log` VALUES ('610', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 10:57:12');
INSERT INTO `sys_log` VALUES ('611', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 10:57:34');
INSERT INTO `sys_log` VALUES ('612', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 10:57:52');
INSERT INTO `sys_log` VALUES ('613', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 10:59:07');
INSERT INTO `sys_log` VALUES ('614', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 10:59:34');
INSERT INTO `sys_log` VALUES ('615', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 10:59:43');
INSERT INTO `sys_log` VALUES ('616', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 10:59:57');
INSERT INTO `sys_log` VALUES ('617', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 11:00:19');
INSERT INTO `sys_log` VALUES ('618', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 11:00:58');
INSERT INTO `sys_log` VALUES ('619', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 11:01:34');
INSERT INTO `sys_log` VALUES ('620', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 11:07:34');
INSERT INTO `sys_log` VALUES ('621', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 11:08:38');
INSERT INTO `sys_log` VALUES ('622', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483758517576&', '0:0:0:0:0:0:0:1', '2017-01-07 11:09:24');
INSERT INTO `sys_log` VALUES ('623', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2016&month=12&tenantName=张先生&monRent=1500&equallyCharge=12.00&startDate=2017-01-07&endDate=2017-01-08&copyDate=2017-01-13&manageCharge=1&internetCharge=123.00&currentElectricNum=123.00&lastElectricNum=12.00&electricNum=111.00&electricUnitPrice=12.00&electricCharge=1332.00&currentWaterNum=123.00&lastWaterNum=12.00&waterNum=111.00&waterUnitPrice=14.00&waterCharge=1554.00&currentGasNum=123.00&lastGasNum=12.00&gasNum=111.00&gasUnitPrice=12.00&gasCharge=1332.00&tvCharge=12.00&otherCharge=12.00&roomId=38&tenantId=25&sendCount=0&isPay=0&total=5878.00&remark=阿斯蒂芬斯蒂芬&', '0:0:0:0:0:0:0:1', '2017-01-07 11:15:57');
INSERT INTO `sys_log` VALUES ('624', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:delete,[参数]:id=49&', '0:0:0:0:0:0:0:1', '2017-01-07 11:16:06');
INSERT INTO `sys_log` VALUES ('625', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:07:47');
INSERT INTO `sys_log` VALUES ('626', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:07:53');
INSERT INTO `sys_log` VALUES ('627', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:20:24');
INSERT INTO `sys_log` VALUES ('628', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:21:03');
INSERT INTO `sys_log` VALUES ('629', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:21:47');
INSERT INTO `sys_log` VALUES ('630', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:25:50');
INSERT INTO `sys_log` VALUES ('631', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:30:34');
INSERT INTO `sys_log` VALUES ('632', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:33:15');
INSERT INTO `sys_log` VALUES ('633', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:39:37');
INSERT INTO `sys_log` VALUES ('634', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:40:27');
INSERT INTO `sys_log` VALUES ('635', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:41:25');
INSERT INTO `sys_log` VALUES ('636', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:42:21');
INSERT INTO `sys_log` VALUES ('637', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:43:04');
INSERT INTO `sys_log` VALUES ('638', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:43:36');
INSERT INTO `sys_log` VALUES ('639', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:43:49');
INSERT INTO `sys_log` VALUES ('640', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:44:02');
INSERT INTO `sys_log` VALUES ('641', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:45:10');
INSERT INTO `sys_log` VALUES ('642', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:45:41');
INSERT INTO `sys_log` VALUES ('643', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:46:02');
INSERT INTO `sys_log` VALUES ('644', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:46:39');
INSERT INTO `sys_log` VALUES ('645', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:46:49');
INSERT INTO `sys_log` VALUES ('646', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:47:01');
INSERT INTO `sys_log` VALUES ('647', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:47:16');
INSERT INTO `sys_log` VALUES ('648', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:47:27');
INSERT INTO `sys_log` VALUES ('649', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:48:53');
INSERT INTO `sys_log` VALUES ('650', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:56:44');
INSERT INTO `sys_log` VALUES ('651', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483768603630&', '0:0:0:0:0:0:0:1', '2017-01-07 13:56:49');
INSERT INTO `sys_log` VALUES ('652', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 13:57:41');
INSERT INTO `sys_log` VALUES ('653', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 14:08:42');
INSERT INTO `sys_log` VALUES ('654', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 14:09:07');
INSERT INTO `sys_log` VALUES ('655', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 14:09:49');
INSERT INTO `sys_log` VALUES ('656', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 14:10:53');
INSERT INTO `sys_log` VALUES ('657', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 14:11:24');
INSERT INTO `sys_log` VALUES ('658', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 14:15:00');
INSERT INTO `sys_log` VALUES ('659', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 14:31:50');
INSERT INTO `sys_log` VALUES ('660', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 14:32:27');
INSERT INTO `sys_log` VALUES ('661', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 14:32:43');
INSERT INTO `sys_log` VALUES ('662', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 14:33:28');
INSERT INTO `sys_log` VALUES ('663', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 14:34:11');
INSERT INTO `sys_log` VALUES ('664', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 14:35:00');
INSERT INTO `sys_log` VALUES ('665', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 14:35:56');
INSERT INTO `sys_log` VALUES ('666', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 14:38:13');
INSERT INTO `sys_log` VALUES ('667', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 15:12:34');
INSERT INTO `sys_log` VALUES ('668', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 15:12:46');
INSERT INTO `sys_log` VALUES ('669', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 15:13:40');
INSERT INTO `sys_log` VALUES ('670', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 15:14:55');
INSERT INTO `sys_log` VALUES ('671', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 15:15:17');
INSERT INTO `sys_log` VALUES ('672', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 15:15:29');
INSERT INTO `sys_log` VALUES ('673', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 15:16:09');
INSERT INTO `sys_log` VALUES ('674', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 15:16:30');
INSERT INTO `sys_log` VALUES ('675', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 15:16:36');
INSERT INTO `sys_log` VALUES ('676', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 15:17:43');
INSERT INTO `sys_log` VALUES ('677', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 15:17:52');
INSERT INTO `sys_log` VALUES ('678', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 15:21:06');
INSERT INTO `sys_log` VALUES ('679', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 15:21:19');
INSERT INTO `sys_log` VALUES ('680', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 15:28:32');
INSERT INTO `sys_log` VALUES ('681', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 15:41:30');
INSERT INTO `sys_log` VALUES ('682', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 16:10:34');
INSERT INTO `sys_log` VALUES ('683', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 16:13:39');
INSERT INTO `sys_log` VALUES ('684', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 16:16:33');
INSERT INTO `sys_log` VALUES ('685', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 16:17:06');
INSERT INTO `sys_log` VALUES ('686', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 17:32:23');
INSERT INTO `sys_log` VALUES ('687', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 17:32:32');
INSERT INTO `sys_log` VALUES ('688', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 17:44:10');
INSERT INTO `sys_log` VALUES ('689', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 17:47:50');
INSERT INTO `sys_log` VALUES ('690', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 18:00:00');
INSERT INTO `sys_log` VALUES ('691', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 18:02:03');
INSERT INTO `sys_log` VALUES ('692', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 18:03:17');
INSERT INTO `sys_log` VALUES ('693', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 18:04:04');
INSERT INTO `sys_log` VALUES ('694', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 18:05:34');
INSERT INTO `sys_log` VALUES ('695', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 18:07:04');
INSERT INTO `sys_log` VALUES ('696', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 18:08:03');
INSERT INTO `sys_log` VALUES ('697', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 18:09:09');
INSERT INTO `sys_log` VALUES ('698', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 18:09:12');
INSERT INTO `sys_log` VALUES ('699', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483783751474&', '0:0:0:0:0:0:0:1', '2017-01-07 18:10:34');
INSERT INTO `sys_log` VALUES ('700', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:delete,[参数]:id=48&', '0:0:0:0:0:0:0:1', '2017-01-07 18:21:16');
INSERT INTO `sys_log` VALUES ('701', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 18:21:23');
INSERT INTO `sys_log` VALUES ('702', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483784482742&', '0:0:0:0:0:0:0:1', '2017-01-07 18:21:29');
INSERT INTO `sys_log` VALUES ('703', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483784482743&', '0:0:0:0:0:0:0:1', '2017-01-07 18:22:24');
INSERT INTO `sys_log` VALUES ('704', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483784482744&', '0:0:0:0:0:0:0:1', '2017-01-07 18:23:13');
INSERT INTO `sys_log` VALUES ('705', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 18:29:48');
INSERT INTO `sys_log` VALUES ('706', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 18:30:25');
INSERT INTO `sys_log` VALUES ('707', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483785024844&', '0:0:0:0:0:0:0:1', '2017-01-07 18:30:34');
INSERT INTO `sys_log` VALUES ('708', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 18:36:40');
INSERT INTO `sys_log` VALUES ('709', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483785399986&', '0:0:0:0:0:0:0:1', '2017-01-07 18:36:54');
INSERT INTO `sys_log` VALUES ('710', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483785399987&', '0:0:0:0:0:0:0:1', '2017-01-07 18:37:18');
INSERT INTO `sys_log` VALUES ('711', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 21:04:22');
INSERT INTO `sys_log` VALUES ('712', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 21:09:14');
INSERT INTO `sys_log` VALUES ('713', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483794553597&', '0:0:0:0:0:0:0:1', '2017-01-07 21:09:21');
INSERT INTO `sys_log` VALUES ('714', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483794553598&', '0:0:0:0:0:0:0:1', '2017-01-07 21:09:42');
INSERT INTO `sys_log` VALUES ('715', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 21:11:05');
INSERT INTO `sys_log` VALUES ('716', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483794664235&', '0:0:0:0:0:0:0:1', '2017-01-07 21:11:13');
INSERT INTO `sys_log` VALUES ('717', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483794664236&', '0:0:0:0:0:0:0:1', '2017-01-07 21:12:05');
INSERT INTO `sys_log` VALUES ('718', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483794664237&', '0:0:0:0:0:0:0:1', '2017-01-07 21:14:50');
INSERT INTO `sys_log` VALUES ('719', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483794664239&', '0:0:0:0:0:0:0:1', '2017-01-07 21:15:55');
INSERT INTO `sys_log` VALUES ('720', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:20:20');
INSERT INTO `sys_log` VALUES ('721', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:21:12');
INSERT INTO `sys_log` VALUES ('722', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictEntryController,[方法]:delete,[参数]:id=undefined&', '192.168.191.1', '2017-01-07 21:22:45');
INSERT INTO `sys_log` VALUES ('723', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictEntryController,[方法]:delete,[参数]:id=undefined&', '192.168.191.1', '2017-01-07 21:22:50');
INSERT INTO `sys_log` VALUES ('724', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictEntryController,[方法]:delete,[参数]:id=undefined&', '192.168.191.1', '2017-01-07 21:22:51');
INSERT INTO `sys_log` VALUES ('725', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictEntryController,[方法]:delete,[参数]:id=undefined&', '192.168.191.1', '2017-01-07 21:22:52');
INSERT INTO `sys_log` VALUES ('726', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.DictEntryController,[方法]:delete,[参数]:id=undefined&', '192.168.191.1', '2017-01-07 21:22:56');
INSERT INTO `sys_log` VALUES ('727', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-07 21:23:48');
INSERT INTO `sys_log` VALUES ('728', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:23:53');
INSERT INTO `sys_log` VALUES ('729', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-07 21:24:00');
INSERT INTO `sys_log` VALUES ('730', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:24:06');
INSERT INTO `sys_log` VALUES ('731', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=17&_=1483795441847&', '192.168.191.1', '2017-01-07 21:24:18');
INSERT INTO `sys_log` VALUES ('732', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:edit,[参数]:id=17&loginName=lxf&name=梁秀凤&password=&sex=1&age=&userType=1&organizationId=8&roleIds=7&phone=&status=0&', '192.168.191.1', '2017-01-07 21:24:21');
INSERT INTO `sys_log` VALUES ('733', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:editPage,[参数]:id=112&_=1483795441849&', '192.168.191.1', '2017-01-07 21:24:35');
INSERT INTO `sys_log` VALUES ('734', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=8&_=1483795441850&', '192.168.191.1', '2017-01-07 21:24:42');
INSERT INTO `sys_log` VALUES ('735', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=17&_=1483795441851&', '192.168.191.1', '2017-01-07 21:24:46');
INSERT INTO `sys_log` VALUES ('736', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:edit,[参数]:id=17&loginName=lxf&name=梁秀凤&password=&sex=1&age=&userType=1&organizationId=8&roleIds=7&phone=&status=0&', '192.168.191.1', '2017-01-07 21:24:48');
INSERT INTO `sys_log` VALUES ('737', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:addPage,[参数]:', null, '2017-01-07 21:25:24');
INSERT INTO `sys_log` VALUES ('738', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:add,[参数]:name=管理员&seq=0&status=0&description=管理员&', '192.168.191.1', '2017-01-07 21:25:43');
INSERT INTO `sys_log` VALUES ('739', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=9&_=1483795441853&', '192.168.191.1', '2017-01-07 21:25:47');
INSERT INTO `sys_log` VALUES ('740', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:edit,[参数]:id=9&name=管理员&seq=0&status=0&description=管理员&', '192.168.191.1', '2017-01-07 21:25:49');
INSERT INTO `sys_log` VALUES ('741', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=9&_=1483795441854&', '192.168.191.1', '2017-01-07 21:25:49');
INSERT INTO `sys_log` VALUES ('742', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=9&resourceIds=223,233,234,235,236,237,238,239,240,241,246,224,230,231,232&', '192.168.191.1', '2017-01-07 21:26:25');
INSERT INTO `sys_log` VALUES ('743', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2017-01-07 21:26:29');
INSERT INTO `sys_log` VALUES ('744', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:add,[参数]:loginName=cbs&name=陈保汕&password=123&sex=0&age=&userType=1&organizationId=5&roleIds=9&phone=&status=0&', '192.168.191.1', '2017-01-07 21:27:02');
INSERT INTO `sys_log` VALUES ('745', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2017-01-07 21:27:10');
INSERT INTO `sys_log` VALUES ('746', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:add,[参数]:code=GLB&name=管理部&seq=0&icon=icon-folder&address=&pid=1&', '192.168.191.1', '2017-01-07 21:27:25');
INSERT INTO `sys_log` VALUES ('747', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:delete,[参数]:id=7&', '192.168.191.1', '2017-01-07 21:27:37');
INSERT INTO `sys_log` VALUES ('748', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:delete,[参数]:id=7&', '192.168.191.1', '2017-01-07 21:27:45');
INSERT INTO `sys_log` VALUES ('749', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:delete,[参数]:id=8&', '192.168.191.1', '2017-01-07 21:27:56');
INSERT INTO `sys_log` VALUES ('750', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:delete,[参数]:id=8&', '192.168.191.1', '2017-01-07 21:28:04');
INSERT INTO `sys_log` VALUES ('751', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:delete,[参数]:id=7&', '192.168.191.1', '2017-01-07 21:28:07');
INSERT INTO `sys_log` VALUES ('752', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:addPage,[参数]:', null, '2017-01-07 21:28:14');
INSERT INTO `sys_log` VALUES ('753', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:delete,[参数]:id=7&', '192.168.191.1', '2017-01-07 21:28:22');
INSERT INTO `sys_log` VALUES ('754', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:28:45');
INSERT INTO `sys_log` VALUES ('755', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:delete,[参数]:id=8&', '192.168.191.1', '2017-01-07 21:28:51');
INSERT INTO `sys_log` VALUES ('756', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:addPage,[参数]:', null, '2017-01-07 21:28:59');
INSERT INTO `sys_log` VALUES ('757', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:add,[参数]:name=1&seq=0&status=0&description=1&', '192.168.191.1', '2017-01-07 21:29:02');
INSERT INTO `sys_log` VALUES ('758', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=10&_=1483795720686&', '192.168.191.1', '2017-01-07 21:29:04');
INSERT INTO `sys_log` VALUES ('759', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:edit,[参数]:id=10&name=111&seq=0&status=0&description=122&', '192.168.191.1', '2017-01-07 21:29:08');
INSERT INTO `sys_log` VALUES ('760', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:31:54');
INSERT INTO `sys_log` VALUES ('761', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:delete,[参数]:id=8&', '192.168.191.1', '2017-01-07 21:32:59');
INSERT INTO `sys_log` VALUES ('762', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:delete,[参数]:id=16&', '192.168.191.1', '2017-01-07 21:33:09');
INSERT INTO `sys_log` VALUES ('763', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:delete,[参数]:id=17&', '192.168.191.1', '2017-01-07 21:33:18');
INSERT INTO `sys_log` VALUES ('764', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2017-01-07 21:33:30');
INSERT INTO `sys_log` VALUES ('765', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:add,[参数]:loginName=cbs&name=陈保汕&password=123&sex=0&age=&userType=1&organizationId=9&roleIds=9&phone=&status=0&', '192.168.191.1', '2017-01-07 21:33:51');
INSERT INTO `sys_log` VALUES ('766', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2017-01-07 21:35:09');
INSERT INTO `sys_log` VALUES ('767', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:add,[参数]:loginName=chenbs&name=陈&password=123&sex=0&age=&userType=1&organizationId=9&roleIds=9&phone=&status=0&', '192.168.191.1', '2017-01-07 21:35:27');
INSERT INTO `sys_log` VALUES ('768', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=9&_=1483795909483&', '192.168.191.1', '2017-01-07 21:35:39');
INSERT INTO `sys_log` VALUES ('769', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=9&resourceIds=223,233,234,235,236,237,238,239,240,241,246,224,230,231,232&', '192.168.191.1', '2017-01-07 21:35:43');
INSERT INTO `sys_log` VALUES ('770', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:delete,[参数]:id=8&', '192.168.191.1', '2017-01-07 21:35:50');
INSERT INTO `sys_log` VALUES ('771', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-07 21:36:14');
INSERT INTO `sys_log` VALUES ('772', 'chenbs', 'chenbs', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:36:21');
INSERT INTO `sys_log` VALUES ('773', 'chenbs', 'chenbs', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-07 21:36:29');
INSERT INTO `sys_log` VALUES ('774', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:36:35');
INSERT INTO `sys_log` VALUES ('775', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=9&_=1483796191197&', '192.168.191.1', '2017-01-07 21:36:55');
INSERT INTO `sys_log` VALUES ('776', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=9&resourceIds=223,233,234,235,236,237,238,239,240,241,246,224,230,231,232&', '192.168.191.1', '2017-01-07 21:37:01');
INSERT INTO `sys_log` VALUES ('777', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=9&_=1483796191198&', '192.168.191.1', '2017-01-07 21:37:05');
INSERT INTO `sys_log` VALUES ('778', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=9&resourceIds=222,223,233,234,235,236,237,238,239,240,241,246,224,230,231,232&', '192.168.191.1', '2017-01-07 21:37:31');
INSERT INTO `sys_log` VALUES ('779', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-07 21:37:35');
INSERT INTO `sys_log` VALUES ('780', 'chenbs', 'chenbs', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:37:40');
INSERT INTO `sys_log` VALUES ('781', 'chenbs', 'chenbs', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-07 21:37:52');
INSERT INTO `sys_log` VALUES ('782', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:37:58');
INSERT INTO `sys_log` VALUES ('783', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483794664240&', '0:0:0:0:0:0:0:1', '2017-01-07 21:38:10');
INSERT INTO `sys_log` VALUES ('784', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=10&_=1483796273915&', '192.168.191.1', '2017-01-07 21:38:17');
INSERT INTO `sys_log` VALUES ('785', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:edit,[参数]:id=10&name=租房部&seq=0&status=0&description=122&', '192.168.191.1', '2017-01-07 21:38:28');
INSERT INTO `sys_log` VALUES ('786', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=10&_=1483796273916&', '192.168.191.1', '2017-01-07 21:38:29');
INSERT INTO `sys_log` VALUES ('787', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=10&resourceIds=222,223,233,234,235&', '192.168.191.1', '2017-01-07 21:38:44');
INSERT INTO `sys_log` VALUES ('788', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:addPage,[参数]:', null, '2017-01-07 21:38:46');
INSERT INTO `sys_log` VALUES ('789', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:add,[参数]:name=销售部&seq=0&status=0&description=&', '192.168.191.1', '2017-01-07 21:38:56');
INSERT INTO `sys_log` VALUES ('790', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=11&_=1483796273918&', '192.168.191.1', '2017-01-07 21:39:01');
INSERT INTO `sys_log` VALUES ('791', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=11&resourceIds=13,131,132,133,134&', '192.168.191.1', '2017-01-07 21:39:08');
INSERT INTO `sys_log` VALUES ('792', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:addPage,[参数]:', null, '2017-01-07 21:39:10');
INSERT INTO `sys_log` VALUES ('793', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:add,[参数]:name=客户部&seq=0&status=0&description=&', '192.168.191.1', '2017-01-07 21:39:16');
INSERT INTO `sys_log` VALUES ('794', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=12&_=1483796273920&', '192.168.191.1', '2017-01-07 21:39:19');
INSERT INTO `sys_log` VALUES ('795', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=12&resourceIds=1,13,131,132,133,134,224,230,231,232&', '192.168.191.1', '2017-01-07 21:39:55');
INSERT INTO `sys_log` VALUES ('796', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=11&_=1483796273921&', '192.168.191.1', '2017-01-07 21:39:58');
INSERT INTO `sys_log` VALUES ('797', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=11&resourceIds=13,131,132,133,134,222,236,237,238,239,240,241,246&', '192.168.191.1', '2017-01-07 21:40:11');
INSERT INTO `sys_log` VALUES ('798', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2017-01-07 21:40:28');
INSERT INTO `sys_log` VALUES ('799', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:add,[参数]:loginName=chenbs1&name=陈1&password=123&sex=0&age=&userType=1&organizationId=9&roleIds=10&phone=&status=0&', '192.168.191.1', '2017-01-07 21:40:50');
INSERT INTO `sys_log` VALUES ('800', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2017-01-07 21:40:52');
INSERT INTO `sys_log` VALUES ('801', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:add,[参数]:loginName=chen2&name=陈2&password=123&sex=0&age=&userType=1&organizationId=9&roleIds=11&phone=&status=0&', '192.168.191.1', '2017-01-07 21:41:06');
INSERT INTO `sys_log` VALUES ('802', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2017-01-07 21:41:08');
INSERT INTO `sys_log` VALUES ('803', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:add,[参数]:loginName=chen3&name=陈3&password=123&sex=0&age=&userType=1&organizationId=9&roleIds=12&phone=&status=0&', '192.168.191.1', '2017-01-07 21:41:30');
INSERT INTO `sys_log` VALUES ('804', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=20&_=1483796273925&', '192.168.191.1', '2017-01-07 21:41:34');
INSERT INTO `sys_log` VALUES ('805', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:edit,[参数]:id=20&loginName=chen1&name=陈1&password=123&sex=0&age=&userType=1&organizationId=9&roleIds=10&phone=&status=0&', '192.168.191.1', '2017-01-07 21:41:41');
INSERT INTO `sys_log` VALUES ('806', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-07 21:41:45');
INSERT INTO `sys_log` VALUES ('807', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 21:41:51');
INSERT INTO `sys_log` VALUES ('808', 'chen1', 'chen1', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:41:52');
INSERT INTO `sys_log` VALUES ('809', 'chen1', 'chen1', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, '2017-01-07 21:41:56');
INSERT INTO `sys_log` VALUES ('810', 'chen1', 'chen1', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-07 21:42:02');
INSERT INTO `sys_log` VALUES ('811', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483796510444&', '0:0:0:0:0:0:0:1', '2017-01-07 21:42:06');
INSERT INTO `sys_log` VALUES ('812', 'chen2', 'chen2', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:42:08');
INSERT INTO `sys_log` VALUES ('813', 'chen2', 'chen2', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-07 21:42:13');
INSERT INTO `sys_log` VALUES ('814', 'chen3', 'chen3', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:42:19');
INSERT INTO `sys_log` VALUES ('815', 'chen3', 'chen3', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-07 21:42:30');
INSERT INTO `sys_log` VALUES ('816', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:42:34');
INSERT INTO `sys_log` VALUES ('817', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=10&_=1483796550228&', '192.168.191.1', '2017-01-07 21:42:53');
INSERT INTO `sys_log` VALUES ('818', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=10&resourceIds=222,223,233,234,235&', '192.168.191.1', '2017-01-07 21:43:57');
INSERT INTO `sys_log` VALUES ('819', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=10&_=1483796550229&', '192.168.191.1', '2017-01-07 21:43:59');
INSERT INTO `sys_log` VALUES ('820', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grant,[参数]:id=10&resourceIds=222,223,233,234,235&', '192.168.191.1', '2017-01-07 21:44:32');
INSERT INTO `sys_log` VALUES ('821', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-07 21:44:42');
INSERT INTO `sys_log` VALUES ('822', 'chen1', 'chen1', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:44:48');
INSERT INTO `sys_log` VALUES ('823', 'chen1', 'chen1', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-07 21:44:59');
INSERT INTO `sys_log` VALUES ('824', 'chen2', 'chen2', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:45:05');
INSERT INTO `sys_log` VALUES ('825', 'chen2', 'chen2', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-07 21:45:08');
INSERT INTO `sys_log` VALUES ('826', 'chen3', 'chen3', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:45:14');
INSERT INTO `sys_log` VALUES ('827', 'chen3', 'chen3', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-07 21:45:29');
INSERT INTO `sys_log` VALUES ('828', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 21:45:34');
INSERT INTO `sys_log` VALUES ('829', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:edit,[参数]:id=12&buildingName=颐和居&buildingAddress=大石穗中路63号&buildingOwn=梁秀凤&ownPhone=13682222283&buildingManager=梁秀凤&managerPhone=13682222283&roomCount=200&remark=这里是备注&', '192.168.191.1', '2017-01-07 21:46:56');
INSERT INTO `sys_log` VALUES ('830', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 21:49:51');
INSERT INTO `sys_log` VALUES ('831', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483796990128&', '0:0:0:0:0:0:0:1', '2017-01-07 21:49:58');
INSERT INTO `sys_log` VALUES ('832', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 21:51:23');
INSERT INTO `sys_log` VALUES ('833', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483797082697&', '0:0:0:0:0:0:0:1', '2017-01-07 21:51:30');
INSERT INTO `sys_log` VALUES ('834', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483797082699&', '0:0:0:0:0:0:0:1', '2017-01-07 21:56:31');
INSERT INTO `sys_log` VALUES ('835', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:delete,[参数]:id=19&', '0:0:0:0:0:0:0:1', '2017-01-07 21:58:38');
INSERT INTO `sys_log` VALUES ('836', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:delete,[参数]:id=18&', '0:0:0:0:0:0:0:1', '2017-01-07 21:58:45');
INSERT INTO `sys_log` VALUES ('837', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:delete,[参数]:id=20&', '0:0:0:0:0:0:0:1', '2017-01-07 21:59:07');
INSERT INTO `sys_log` VALUES ('838', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:delete,[参数]:id=8&', '0:0:0:0:0:0:0:1', '2017-01-07 21:59:34');
INSERT INTO `sys_log` VALUES ('839', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 22:01:12');
INSERT INTO `sys_log` VALUES ('840', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:delete,[参数]:id=15&', '0:0:0:0:0:0:0:1', '2017-01-07 22:01:35');
INSERT INTO `sys_log` VALUES ('841', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:delete,[参数]:id=6&', '0:0:0:0:0:0:0:1', '2017-01-07 22:01:55');
INSERT INTO `sys_log` VALUES ('842', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:delete,[参数]:id=21&', '192.168.191.1', '2017-01-07 22:02:23');
INSERT INTO `sys_log` VALUES ('843', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2017-01-07 22:02:25');
INSERT INTO `sys_log` VALUES ('844', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:add,[参数]:loginName=chen2&name=陈2&password=123&sex=0&age=&userType=1&organizationId=9&roleIds=11&phone=&status=0&', '192.168.191.1', '2017-01-07 22:02:42');
INSERT INTO `sys_log` VALUES ('845', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:delete,[参数]:id=8&', '192.168.191.1', '2017-01-07 22:05:16');
INSERT INTO `sys_log` VALUES ('846', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:delete,[参数]:id=8&', '192.168.191.1', '2017-01-07 22:05:27');
INSERT INTO `sys_log` VALUES ('847', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:editPage,[参数]:id=8&_=1483796730514&', '192.168.191.1', '2017-01-07 22:07:30');
INSERT INTO `sys_log` VALUES ('848', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2017-01-07 22:07:30');
INSERT INTO `sys_log` VALUES ('849', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-07 22:07:33');
INSERT INTO `sys_log` VALUES ('850', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 22:07:35');
INSERT INTO `sys_log` VALUES ('851', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:delete,[参数]:id=8&', '192.168.191.1', '2017-01-07 22:08:40');
INSERT INTO `sys_log` VALUES ('852', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:delete,[参数]:id=7&', '192.168.191.1', '2017-01-07 22:08:47');
INSERT INTO `sys_log` VALUES ('853', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 22:09:50');
INSERT INTO `sys_log` VALUES ('854', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:addPage,[参数]:', null, '2017-01-07 22:09:55');
INSERT INTO `sys_log` VALUES ('855', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=1&_=1483798185869&', '192.168.191.1', '2017-01-07 22:09:58');
INSERT INTO `sys_log` VALUES ('856', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2017-01-07 22:10:04');
INSERT INTO `sys_log` VALUES ('857', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2017-01-07 22:10:16');
INSERT INTO `sys_log` VALUES ('858', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:editPage,[参数]:id=9&_=1483798185872&', '192.168.191.1', '2017-01-07 22:10:19');
INSERT INTO `sys_log` VALUES ('859', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:editPage,[参数]:id=6&_=1483798185873&', '192.168.191.1', '2017-01-07 22:10:26');
INSERT INTO `sys_log` VALUES ('860', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, '2017-01-07 22:10:35');
INSERT INTO `sys_log` VALUES ('861', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.BuildingController,[方法]:addPage,[参数]:', null, '2017-01-07 22:10:40');
INSERT INTO `sys_log` VALUES ('862', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 22:14:17');
INSERT INTO `sys_log` VALUES ('863', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 22:15:15');
INSERT INTO `sys_log` VALUES ('864', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 22:15:15');
INSERT INTO `sys_log` VALUES ('865', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:addPage,[参数]:', null, '2017-01-07 22:15:21');
INSERT INTO `sys_log` VALUES ('866', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=1&_=1483798511407&', '192.168.191.1', '2017-01-07 22:15:23');
INSERT INTO `sys_log` VALUES ('867', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:addPage,[参数]:', null, '2017-01-07 22:15:29');
INSERT INTO `sys_log` VALUES ('868', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:add,[参数]:name=111&seq=0&status=0&description=&', '192.168.191.1', '2017-01-07 22:15:32');
INSERT INTO `sys_log` VALUES ('869', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=13&_=1483798511409&', '192.168.191.1', '2017-01-07 22:15:35');
INSERT INTO `sys_log` VALUES ('870', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:edit,[参数]:id=13&name=111222&seq=0&status=0&description=&', '192.168.191.1', '2017-01-07 22:15:37');
INSERT INTO `sys_log` VALUES ('871', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2017-01-07 22:15:47');
INSERT INTO `sys_log` VALUES ('872', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:delete,[参数]:id=23&', '192.168.191.1', '2017-01-07 22:16:17');
INSERT INTO `sys_log` VALUES ('873', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 22:18:16');
INSERT INTO `sys_log` VALUES ('874', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 22:19:46');
INSERT INTO `sys_log` VALUES ('875', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 22:19:52');
INSERT INTO `sys_log` VALUES ('876', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:delete,[参数]:id=13&', '192.168.191.1', '2017-01-07 22:19:58');
INSERT INTO `sys_log` VALUES ('877', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 22:20:06');
INSERT INTO `sys_log` VALUES ('878', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2017-01-07 22:20:22');
INSERT INTO `sys_log` VALUES ('879', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:add,[参数]:code=11&name=1111111&seq=0&icon=icon-folder&address=&pid=&', '192.168.191.1', '2017-01-07 22:20:27');
INSERT INTO `sys_log` VALUES ('880', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.OrganizationController,[方法]:delete,[参数]:id=10&', '192.168.191.1', '2017-01-07 22:20:31');
INSERT INTO `sys_log` VALUES ('881', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2017-01-07 22:20:41');
INSERT INTO `sys_log` VALUES ('882', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483798802658&', '192.168.191.1', '2017-01-07 22:21:05');
INSERT INTO `sys_log` VALUES ('883', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2017&month=1&tenantName=张先生&monRent=1500&equallyCharge=10.00&startDate=2017-01-07&endDate=2017-02-07&copyDate=2017-01-03&manageCharge=10&internetCharge=0.00&currentElectricNum=125.00&lastElectricNum=123.00&electricNum=2.00&electricUnitPrice=12.00&electricCharge=24.00&currentWaterNum=125.00&lastWaterNum=123.00&waterNum=2.00&waterUnitPrice=14.00&waterCharge=28.00&currentGasNum=125.00&lastGasNum=123.00&gasNum=2.00&gasUnitPrice=12.00&gasCharge=24.00&tvCharge=0.00&otherCharge=0.00&roomId=38&tenantId=25&sendCount=0&isPay=0&total=1596.00&remark=&', '192.168.191.1', '2017-01-07 22:22:35');
INSERT INTO `sys_log` VALUES ('884', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=1&tel=15919064667&identityCard=260001781116729&remark=13682222283&roomId=38&id=25&', '192.168.191.1', '2017-01-07 22:23:06');
INSERT INTO `sys_log` VALUES ('885', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-07 22:24:13');
INSERT INTO `sys_log` VALUES ('886', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '192.168.191.1', '2017-01-07 22:28:10');
INSERT INTO `sys_log` VALUES ('887', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2017-01-07 22:28:18');
INSERT INTO `sys_log` VALUES ('888', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:add,[参数]:loginName=lxf&name=梁秀凤&password=123&sex=1&age=&userType=1&organizationId=1&roleIds=10&phone=&status=0&', '192.168.191.1', '2017-01-07 22:28:57');
INSERT INTO `sys_log` VALUES ('889', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-07 22:29:25');
INSERT INTO `sys_log` VALUES ('890', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 11:41:17');
INSERT INTO `sys_log` VALUES ('891', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=24&_=1483846875935&', '0:0:0:0:0:0:0:1', '2017-01-08 11:42:03');
INSERT INTO `sys_log` VALUES ('892', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:edit,[参数]:id=24&loginName=lxf&name=梁秀凤&password=123&sex=1&age=&userType=1&organizationId=1&roleIds=10&phone=&status=0&', '0:0:0:0:0:0:0:1', '2017-01-08 11:42:09');
INSERT INTO `sys_log` VALUES ('893', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-01-08 11:42:15');
INSERT INTO `sys_log` VALUES ('894', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 11:42:25');
INSERT INTO `sys_log` VALUES ('895', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 11:47:52');
INSERT INTO `sys_log` VALUES ('896', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=38&roomName=颐和居-2A&beginDate=2017-01-08 11:48:40&endDate=2017-01-31 11:48:42&type=0&status=0&buildingId=10&monRent=1500.0&remark=&', '0:0:0:0:0:0:0:1', '2017-01-08 11:48:46');
INSERT INTO `sys_log` VALUES ('897', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 11:53:56');
INSERT INTO `sys_log` VALUES ('898', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 11:54:48');
INSERT INTO `sys_log` VALUES ('899', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 11:55:21');
INSERT INTO `sys_log` VALUES ('900', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=1&tel=15919064667&identityCard=260001781116729&startDate=2017-01-08&endDate=2017-01-27&remark=13682222283&roomId=38&id=25&', '0:0:0:0:0:0:0:1', '2017-01-08 11:56:29');
INSERT INTO `sys_log` VALUES ('901', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=1&tel=15919064667&identityCard=260001781116729&startDate=2017-01-09&endDate=2017-01-27&remark=13682222283&roomId=38&id=25&', '0:0:0:0:0:0:0:1', '2017-01-08 11:56:55');
INSERT INTO `sys_log` VALUES ('902', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=1&tel=15919064667&identityCard=260001781116729&startDate=2017-01-08&endDate=2017-01-27&remark=13682222283&roomId=38&id=25&', '0:0:0:0:0:0:0:1', '2017-01-08 12:05:35');
INSERT INTO `sys_log` VALUES ('903', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 12:05:37');
INSERT INTO `sys_log` VALUES ('904', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=1&tel=15919064667&identityCard=260001781116729&startDate=2017-01-08&endDate=2017-01-11&remark=13682222283&roomId=38&id=25&', '0:0:0:0:0:0:0:1', '2017-01-08 12:05:47');
INSERT INTO `sys_log` VALUES ('905', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 12:10:40');
INSERT INTO `sys_log` VALUES ('906', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 12:17:28');
INSERT INTO `sys_log` VALUES ('907', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 12:23:20');
INSERT INTO `sys_log` VALUES ('908', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 12:27:27');
INSERT INTO `sys_log` VALUES ('909', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 12:34:41');
INSERT INTO `sys_log` VALUES ('910', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 12:35:40');
INSERT INTO `sys_log` VALUES ('911', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=1&tel=15919064667&identityCard=260001781116729&startDate=2017-01-09&endDate=2017-01-11&remark=13682222283&roomId=38&id=25&', '0:0:0:0:0:0:0:1', '2017-01-08 12:35:52');
INSERT INTO `sys_log` VALUES ('912', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 12:36:33');
INSERT INTO `sys_log` VALUES ('913', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:edit,[参数]:id=38&roomName=颐和居-2A&type=0&status=1&buildingId=10&monRent=1500.0&remark=&', '0:0:0:0:0:0:0:1', '2017-01-08 12:36:50');
INSERT INTO `sys_log` VALUES ('914', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=1&tel=15919064667&identityCard=260001781116729&startDate=2017-01-09&endDate=2017-01-13&remark=13682222283&roomId=38&id=25&', '0:0:0:0:0:0:0:1', '2017-01-08 12:37:06');
INSERT INTO `sys_log` VALUES ('915', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=1&tel=15919064667&identityCard=260001781116729&startDate=2017-01-10&endDate=2017-01-31&remark=13682222283 eee&roomId=38&id=25&', '0:0:0:0:0:0:0:1', '2017-01-08 12:38:00');
INSERT INTO `sys_log` VALUES ('916', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 12:44:29');
INSERT INTO `sys_log` VALUES ('917', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=1&tel=15919064667&identityCard=260001781116729&startDate=2017-01-11&endDate=2017-01-30&remark=13682222283 eee&roomId=38&id=25&', '0:0:0:0:0:0:0:1', '2017-01-08 12:44:42');
INSERT INTO `sys_log` VALUES ('918', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=1&tel=15919064667&identityCard=260001781116729&startDate=2017-01-01&endDate=2017-01-31&remark=13682222283 eee&roomId=38&id=25&', '0:0:0:0:0:0:0:1', '2017-01-08 12:45:09');
INSERT INTO `sys_log` VALUES ('919', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=张先生&sex=0&tel=13450761833&identityCard=121212121121212211&startDate=2017-01-01&endDate=2017-01-31&remark=aaaaaaaaaaa&roomId=11&id=&', '0:0:0:0:0:0:0:1', '2017-01-08 12:46:31');
INSERT INTO `sys_log` VALUES ('920', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:addRoomPage,[参数]:', null, '2017-01-08 12:46:51');
INSERT INTO `sys_log` VALUES ('921', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.RoomController,[方法]:add,[参数]:roomName=A003&type=0&status=0&buildingId=10&monRent=2000&remark=11111&', '0:0:0:0:0:0:0:1', '2017-01-08 12:47:13');
INSERT INTO `sys_log` VALUES ('922', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=张先生&sex=0&tel=13450761833&identityCard=121223123111123&startDate=2017-01-01&endDate=2017-01-28&remark=222222222&roomId=39&id=&', '0:0:0:0:0:0:0:1', '2017-01-08 12:47:37');
INSERT INTO `sys_log` VALUES ('923', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 12:52:49');
INSERT INTO `sys_log` VALUES ('924', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 12:53:00');
INSERT INTO `sys_log` VALUES ('925', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 12:53:39');
INSERT INTO `sys_log` VALUES ('926', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 12:56:10');
INSERT INTO `sys_log` VALUES ('927', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 12:58:16');
INSERT INTO `sys_log` VALUES ('928', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 12:58:38');
INSERT INTO `sys_log` VALUES ('929', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 13:00:14');
INSERT INTO `sys_log` VALUES ('930', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 13:01:29');
INSERT INTO `sys_log` VALUES ('931', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 13:03:01');
INSERT INTO `sys_log` VALUES ('932', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=39&tenantName=张先生&monRent=2000&tenantId=26&_=1483851780657&', '0:0:0:0:0:0:0:1', '2017-01-08 13:03:19');
INSERT INTO `sys_log` VALUES ('933', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2017&month=1&tenantName=张先生&monRent=2000&equallyCharge=12.00&startDate=2017-01-08&endDate=2017-01-31&copyDate=2017-01-09&manageCharge=2&internetCharge=12.00&currentElectricNum=12.00&lastElectricNum=1.00&electricNum=11.00&electricUnitPrice=12.00&electricCharge=132.00&currentWaterNum=12.00&lastWaterNum=1.00&waterNum=11.00&waterUnitPrice=14.00&waterCharge=154.00&currentGasNum=12.00&lastGasNum=1.00&gasNum=11.00&gasUnitPrice=15.00&gasCharge=165.00&tvCharge=0.00&otherCharge=0.00&roomId=39&tenantId=26&sendCount=0&isPay=0&total=2477.00&remark=1111&', '0:0:0:0:0:0:0:1', '2017-01-08 13:03:55');
INSERT INTO `sys_log` VALUES ('934', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 13:04:14');
INSERT INTO `sys_log` VALUES ('935', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 13:47:08');
INSERT INTO `sys_log` VALUES ('936', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=38&tenantName=张先生&monRent=1500&tenantId=25&_=1483854427017&', '0:0:0:0:0:0:0:1', '2017-01-08 13:49:15');
INSERT INTO `sys_log` VALUES ('937', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2017&month=1&tenantName=张先生&monRent=1500&equallyCharge=12.00&startDate=2017-01-08&endDate=2017-01-27&copyDate=2017-01-18&manageCharge=14&internetCharge=12.00&currentElectricNum=126.00&lastElectricNum=123.00&electricNum=3.00&electricUnitPrice=12.00&electricCharge=36.00&currentWaterNum=1242.00&lastWaterNum=123.00&waterNum=1119.00&waterUnitPrice=14.00&waterCharge=15666.00&currentGasNum=2323.00&lastGasNum=123.00&gasNum=2200.00&gasUnitPrice=12.00&gasCharge=26400.00&tvCharge=0.00&otherCharge=0.00&roomId=38&tenantId=25&sendCount=0&isPay=0&total=43640.00&remark=qwqwq&', '0:0:0:0:0:0:0:1', '2017-01-08 13:49:55');
INSERT INTO `sys_log` VALUES ('938', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=1&tel=13450761833&identityCard=260001781116729&startDate=2017-01-01&endDate=2017-01-31&remark=13682222283 eee&roomId=38&id=25&', '0:0:0:0:0:0:0:1', '2017-01-08 13:50:23');
INSERT INTO `sys_log` VALUES ('939', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 18:31:26');
INSERT INTO `sys_log` VALUES ('940', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 18:45:37');
INSERT INTO `sys_log` VALUES ('941', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=张先生&sex=0&tel=13450761833&identityCard=260001781116729&startDate=2017-01-01&endDate=2017-01-31&deposit=2000.00&remark=啊发发&roomId=182&id=&', '0:0:0:0:0:0:0:1', '2017-01-08 18:48:32');
INSERT INTO `sys_log` VALUES ('942', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:add,[参数]:tenantName=张先生&sex=0&tel=13450761833&identityCard=260001781116729&startDate=2017-01-01&endDate=2017-01-31&deposit=2000.00&remark=啊发发&roomId=182&id=&', '0:0:0:0:0:0:0:1', '2017-01-08 18:52:30');
INSERT INTO `sys_log` VALUES ('943', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.CostController,[方法]:addRoomPage,[参数]:id=182&tenantName=张先生&monRent=1500&tenantId=27&_=1483872336307&', '0:0:0:0:0:0:0:1', '2017-01-08 18:52:46');
INSERT INTO `sys_log` VALUES ('944', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.CostController,[方法]:add,[参数]:year=2017&month=1&tenantName=张先生&monRent=1500&equallyCharge=123.00&startDate=2017-01-01&endDate=2017-01-31&copyDate=2017-01-09&manageCharge=12&internetCharge=0.00&currentElectricNum=123.00&lastElectricNum=121.00&electricNum=2.00&electricUnitPrice=12.00&electricCharge=24.00&currentWaterNum=123.00&lastWaterNum=12.00&waterNum=111.00&waterUnitPrice=12.00&waterCharge=1332.00&currentGasNum=123.00&lastGasNum=121.00&gasNum=2.00&gasUnitPrice=12.00&gasCharge=24.00&tvCharge=12.00&otherCharge=12.00&roomId=182&tenantId=27&sendCount=0&isPay=0&total=3039.00&remark=12&', '0:0:0:0:0:0:0:1', '2017-01-08 18:53:20');
INSERT INTO `sys_log` VALUES ('945', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.SysLogController,[方法]:loginLog,[参数]:null', '0:0:0:0:0:0:0:1', '2017-01-08 18:55:51');
INSERT INTO `sys_log` VALUES ('946', 'lxf', 'lxf', '[类名]:com.wangzhixuan.controller.TenantController,[方法]:edit,[参数]:tenantName=张先生&sex=0&tel=13450761833&identityCard=260001781116729&startDate=2017-01-01&endDate=2017-01-31&deposit=2000.00&remark=啊发发1&roomId=182&id=27&', '0:0:0:0:0:0:0:1', '2017-01-08 18:56:10');

-- ----------------------------
-- Table structure for tenant
-- ----------------------------
DROP TABLE IF EXISTS `tenant`;
CREATE TABLE `tenant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `room_id` int(11) NOT NULL,
  `sex` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `tel` decimal(11,0) DEFAULT NULL,
  `identity_card` varchar(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `is_del` int(255) unsigned zerofill DEFAULT '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  PRIMARY KEY (`id`,`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='tenant';

-- ----------------------------
-- Records of tenant
-- ----------------------------
INSERT INTO `tenant` VALUES ('27', '张先生', '182', '0', '13450761833', '260001781116729', '啊发发1', '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2017-01-01', '2017-01-31', '2000');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '202cb962ac59075b964b07152d234b70', '1', '25', '18707173376', '0', '0', '1', '2016-12-18 11:18:53');
INSERT INTO `user` VALUES ('13', 'snoopy', 'snoopy', '098f6bcd4621d373cade4e832627b4f6', '0', '25', '18707173376', '1', '0', '3', '2015-10-01 13:12:07');
INSERT INTO `user` VALUES ('14', 'dreamlu', 'dreamlu', '098f6bcd4621d373cade4e832627b4f6', '0', '25', '18707173376', '1', '0', '5', '2015-10-11 23:12:58');
INSERT INTO `user` VALUES ('22', 'chen3', '陈3', '202cb962ac59075b964b07152d234b70', '0', null, '', '1', '0', '9', '2017-01-07 21:41:29');
INSERT INTO `user` VALUES ('24', 'lxf', '梁秀凤', '202cb962ac59075b964b07152d234b70', '1', null, '', '1', '0', '1', '2017-01-07 22:28:56');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(19) NOT NULL COMMENT '用户id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('63', '13', '2');
INSERT INTO `user_role` VALUES ('64', '14', '7');
INSERT INTO `user_role` VALUES ('71', '1', '1');
INSERT INTO `user_role` VALUES ('72', '1', '2');
INSERT INTO `user_role` VALUES ('73', '1', '7');
INSERT INTO `user_role` VALUES ('84', '22', '12');
INSERT INTO `user_role` VALUES ('90', '24', '10');
INSERT INTO `user_role` VALUES ('91', '24', '11');
INSERT INTO `user_role` VALUES ('92', '24', '12');

-- ----------------------------
-- View structure for rentroom
-- ----------------------------
DROP VIEW IF EXISTS `rentroom`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `rentroom` AS select `b`.`id` AS `id`,`b`.`building_name` AS `building_name`,`b`.`building_address` AS `building_address`,`b`.`building_own` AS `building_own`,`b`.`own_phone` AS `own_phone`,`b`.`building_manager` AS `building_manager`,`b`.`manager_phone` AS `manager_phone`,`b`.`room_count` AS `room_count`,`b`.`remark` AS `remark`,`r`.`room_name` AS `room_name`,`t`.`tenant_name` AS `tenant_name` from ((`building` `b` left join `room` `r` on((`b`.`id` = `r`.`building_id`))) left join `tenant` `t` on((`r`.`id` = `t`.`room_id`))) ;
