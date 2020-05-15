SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ot_app_brand
-- ----------------------------
DROP TABLE IF EXISTS `ot_app_brand`;
CREATE TABLE `ot_app_brand` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `app_name` varchar(100) NOT NULL COMMENT '应用名称',
  `app_no` varchar(40) NOT NULL COMMENT '应用编号',
  `app_desc` varchar(255) DEFAULT NULL COMMENT '应用描述',
  `logo` varchar(100) DEFAULT NULL COMMENT 'Logo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK879lennneme9u4tfbhlsufpfa` (`app_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应用品牌';

-- ----------------------------
-- Table structure for ot_app_ma_config
-- ----------------------------
DROP TABLE IF EXISTS `ot_app_ma_config`;
CREATE TABLE `ot_app_ma_config` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `aes_key` varchar(200) DEFAULT NULL COMMENT '小程序的AESKey',
  `aid` varchar(40) NOT NULL COMMENT '应用ID',
  `app_id` varchar(200) NOT NULL COMMENT '小程序的appid',
  `app_key` varchar(200) DEFAULT NULL COMMENT '小程序的appKey',
  `app_no` varchar(40) NOT NULL COMMENT '应用编号',
  `ma_type` varchar(20) NOT NULL COMMENT '小程序类型(wx|swan|my|tt)',
  `msg_data_format` varchar(20) DEFAULT NULL COMMENT ' 消息格式，XML或者JSON',
  `secret` varchar(200) NOT NULL COMMENT '小程序的secret',
  `token` varchar(200) DEFAULT NULL COMMENT '小程序的token',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKcq9jru1um5h8hdhpxp2w6pu4i` (`app_no`,`ma_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应用小程序配置';

-- ----------------------------
-- Table structure for ot_column_metadata
-- ----------------------------
DROP TABLE IF EXISTS `ot_column_metadata`;
CREATE TABLE `ot_column_metadata` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `column_name` varchar(40) NOT NULL COMMENT '列名',
  `column_size` int(10) DEFAULT NULL COMMENT '长度',
  `decimal_digits` int(10) DEFAULT NULL COMMENT '小数保留位',
  `not_null` bit(1) DEFAULT NULL COMMENT '是否为空',
  `remarks` varchar(400) DEFAULT NULL COMMENT '注释',
  `table_id` varchar(40) NOT NULL COMMENT '字典表ID',
  `type_name` varchar(40) NOT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据字典列';

-- ----------------------------
-- Records of ot_column_metadata
-- ----------------------------
BEGIN;
INSERT INTO `ot_column_metadata` VALUES ('e0b13580943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b09940943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b13581943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b09940943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b13582943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b09940943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b13583943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b09940943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b13584943c11ea82b01e6b7e443566', 'app_name', 100, 0, b'1', '应用名称', 'e0b09940943c11ea82b01e6b7e443566', 'VARCHAR(100)');
INSERT INTO `ot_column_metadata` VALUES ('e0b13585943c11ea82b01e6b7e443566', 'app_no', 40, 0, b'1', '应用编号', 'e0b09940943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b13586943c11ea82b01e6b7e443566', 'app_desc', 255, 0, b'0', '应用描述', 'e0b09940943c11ea82b01e6b7e443566', 'VARCHAR(255)');
INSERT INTO `ot_column_metadata` VALUES ('e0b13587943c11ea82b01e6b7e443566', 'logo', 100, 0, b'0', 'Logo', 'e0b09940943c11ea82b01e6b7e443566', 'VARCHAR(100)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1aab0943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b13588943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1aab1943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b13588943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b1aab2943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b13588943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b1aab3943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b13588943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1aab4943c11ea82b01e6b7e443566', 'aes_key', 200, 0, b'0', '小程序的AESKey', 'e0b13588943c11ea82b01e6b7e443566', 'VARCHAR(200)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1aab5943c11ea82b01e6b7e443566', 'aid', 40, 0, b'1', '应用ID', 'e0b13588943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1aab6943c11ea82b01e6b7e443566', 'app_id', 200, 0, b'1', '小程序的appid', 'e0b13588943c11ea82b01e6b7e443566', 'VARCHAR(200)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1aab7943c11ea82b01e6b7e443566', 'app_key', 200, 0, b'0', '小程序的appKey', 'e0b13588943c11ea82b01e6b7e443566', 'VARCHAR(200)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1aab8943c11ea82b01e6b7e443566', 'app_no', 40, 0, b'1', '应用编号', 'e0b13588943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1aab9943c11ea82b01e6b7e443566', 'ma_type', 20, 0, b'1', '小程序类型(wx|swan|my|tt)', 'e0b13588943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1aaba943c11ea82b01e6b7e443566', 'msg_data_format', 20, 0, b'0', ' 消息格式，XML或者JSON', 'e0b13588943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1aabb943c11ea82b01e6b7e443566', 'secret', 200, 0, b'1', '小程序的secret', 'e0b13588943c11ea82b01e6b7e443566', 'VARCHAR(200)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1aabc943c11ea82b01e6b7e443566', 'token', 200, 0, b'0', '小程序的token', 'e0b13588943c11ea82b01e6b7e443566', 'VARCHAR(200)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1f8d0943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b1aabd943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1f8d1943c11ea82b01e6b7e443566', 'column_name', 40, 0, b'1', '列名', 'e0b1aabd943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1f8d2943c11ea82b01e6b7e443566', 'column_size', 10, 0, b'0', '长度', 'e0b1aabd943c11ea82b01e6b7e443566', 'INT(10)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1f8d3943c11ea82b01e6b7e443566', 'decimal_digits', 10, 0, b'0', '小数保留位', 'e0b1aabd943c11ea82b01e6b7e443566', 'INT(10)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1f8d4943c11ea82b01e6b7e443566', 'not_null', 1, 0, b'0', '是否为空', 'e0b1aabd943c11ea82b01e6b7e443566', 'BIT(1)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1f8d5943c11ea82b01e6b7e443566', 'remarks', 400, 0, b'0', '注释', 'e0b1aabd943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1f8d6943c11ea82b01e6b7e443566', 'table_id', 40, 0, b'1', '字典表ID', 'e0b1aabd943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b1f8d7943c11ea82b01e6b7e443566', 'type_name', 40, 0, b'1', '类型', 'e0b1aabd943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b26e00943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b1f8d8943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b26e01943c11ea82b01e6b7e443566', 'depth', 10, 0, b'1', '级别', 'e0b1f8d8943c11ea82b01e6b7e443566', 'INT(10)');
INSERT INTO `ot_column_metadata` VALUES ('e0b26e02943c11ea82b01e6b7e443566', 'depth_name', 40, 0, b'0', '级别名称', 'e0b1f8d8943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b26e03943c11ea82b01e6b7e443566', 'first_letter', 20, 0, b'0', '首字符', 'e0b1f8d8943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b26e04943c11ea82b01e6b7e443566', 'jian_pin', 100, 0, b'0', '简拼', 'e0b1f8d8943c11ea82b01e6b7e443566', 'VARCHAR(100)');
INSERT INTO `ot_column_metadata` VALUES ('e0b26e05943c11ea82b01e6b7e443566', 'name', 40, 0, b'1', '名称', 'e0b1f8d8943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b26e06943c11ea82b01e6b7e443566', 'parent_id', 40, 0, b'0', '父级ID', 'e0b1f8d8943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b26e07943c11ea82b01e6b7e443566', 'pin_yin', 100, 0, b'0', '拼音', 'e0b1f8d8943c11ea82b01e6b7e443566', 'VARCHAR(100)');
INSERT INTO `ot_column_metadata` VALUES ('e0b2e330943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b26e08943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b2e331943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b26e08943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b2e332943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b26e08943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b2e333943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b26e08943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b2e334943c11ea82b01e6b7e443566', 'api_name', 40, 0, b'1', 'API名称', 'e0b26e08943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b2e335943c11ea82b01e6b7e443566', 'api_tag', 40, 0, b'0', 'API tag', 'e0b26e08943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b2e336943c11ea82b01e6b7e443566', 'api_url', 100, 0, b'1', 'APIUrl', 'e0b26e08943c11ea82b01e6b7e443566', 'VARCHAR(100)');
INSERT INTO `ot_column_metadata` VALUES ('e0b2e337943c11ea82b01e6b7e443566', 'by_order', 10, 0, b'0', '排序', 'e0b26e08943c11ea82b01e6b7e443566', 'INT(10)');
INSERT INTO `ot_column_metadata` VALUES ('e0b2e338943c11ea82b01e6b7e443566', 'parent_id', 40, 0, b'0', '父节点ID', 'e0b26e08943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b2e339943c11ea82b01e6b7e443566', 'shiro_code', 40, 0, b'0', 'Shiro编码', 'e0b26e08943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b33150943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b2e33a943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b33151943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b2e33a943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b33152943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b2e33a943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b33153943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b2e33a943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b33154943c11ea82b01e6b7e443566', 'action', 40, 0, b'0', '动作', 'e0b2e33a943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b33155943c11ea82b01e6b7e443566', 'authority_name', 40, 0, b'1', '权限名称', 'e0b2e33a943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b33156943c11ea82b01e6b7e443566', 'by_order', 10, 0, b'0', '排序', 'e0b2e33a943c11ea82b01e6b7e443566', 'INT(10)');
INSERT INTO `ot_column_metadata` VALUES ('e0b33157943c11ea82b01e6b7e443566', 'domain', 40, 0, b'0', '业务', 'e0b2e33a943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b33158943c11ea82b01e6b7e443566', 'module', 40, 0, b'1', '权限模块', 'e0b2e33a943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b33159943c11ea82b01e6b7e443566', 'parent_id', 40, 0, b'0', '父节点ID', 'e0b2e33a943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b37f70943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b3315a943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b37f71943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b3315a943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b37f72943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b3315a943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b37f73943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b3315a943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b37f74943c11ea82b01e6b7e443566', 'status', 20, 0, b'1', '是否启用（码类：1000）', 'e0b3315a943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b37f75943c11ea82b01e6b7e443566', 'type_code', 20, 0, b'1', '码类编码', 'e0b3315a943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b37f76943c11ea82b01e6b7e443566', 'val_code', 20, 0, b'1', '码值编码', 'e0b3315a943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b37f77943c11ea82b01e6b7e443566', 'val_name', 40, 0, b'1', '码值名称', 'e0b3315a943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b3cd90943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b37f78943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b3cd91943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b37f78943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b3cd92943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b37f78943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b3cd93943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b37f78943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b3cd94943c11ea82b01e6b7e443566', 'clazz_path', 200, 0, b'1', '任务执行方法', 'e0b37f78943c11ea82b01e6b7e443566', 'VARCHAR(200)');
INSERT INTO `ot_column_metadata` VALUES ('e0b3cd95943c11ea82b01e6b7e443566', 'description', 255, 0, b'0', '任务描述', 'e0b37f78943c11ea82b01e6b7e443566', 'VARCHAR(255)');
INSERT INTO `ot_column_metadata` VALUES ('e0b3cd96943c11ea82b01e6b7e443566', 'job_name', 40, 0, b'1', '任务名称', 'e0b37f78943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b3cd97943c11ea82b01e6b7e443566', 'job_params', 1000, 0, b'0', '任务参数', 'e0b37f78943c11ea82b01e6b7e443566', 'VARCHAR(1000)');
INSERT INTO `ot_column_metadata` VALUES ('e0b3cd98943c11ea82b01e6b7e443566', 'status', 20, 0, b'1', '是否启用(1000)', 'e0b37f78943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b442c0943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b3cd99943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b442c1943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b3cd99943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b442c2943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b3cd99943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b442c3943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b3cd99943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b442c4943c11ea82b01e6b7e443566', 'clazz_path', 200, 0, b'0', '任务执行方法', 'e0b3cd99943c11ea82b01e6b7e443566', 'VARCHAR(200)');
INSERT INTO `ot_column_metadata` VALUES ('e0b442c5943c11ea82b01e6b7e443566', 'end_time', 19, 0, b'0', '结束时间', 'e0b3cd99943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b442c6943c11ea82b01e6b7e443566', 'group_name', 40, 0, b'0', '组名称', 'e0b3cd99943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b442c7943c11ea82b01e6b7e443566', 'instance_id', 40, 0, b'1', '任务实例ID', 'e0b3cd99943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b442c8943c11ea82b01e6b7e443566', 'instance_params', 1000, 0, b'0', '任务实例参数', 'e0b3cd99943c11ea82b01e6b7e443566', 'VARCHAR(1000)');
INSERT INTO `ot_column_metadata` VALUES ('e0b442c9943c11ea82b01e6b7e443566', 'job_id', 40, 0, b'1', '任务ID', 'e0b3cd99943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b442ca943c11ea82b01e6b7e443566', 'job_name', 40, 0, b'0', '任务名称', 'e0b3cd99943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b442cb943c11ea82b01e6b7e443566', 'start_time', 19, 0, b'0', '开始时间', 'e0b3cd99943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b442cc943c11ea82b01e6b7e443566', 'status', 20, 0, b'1', '实例状态(1003)', 'e0b3cd99943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b442cd943c11ea82b01e6b7e443566', 'trigger_id', 40, 0, b'1', '触发器ID', 'e0b3cd99943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b442ce943c11ea82b01e6b7e443566', 'trigger_rule', 40, 0, b'0', '触发规则', 'e0b3cd99943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b4b7f0943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b442cf943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b4b7f1943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b442cf943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b4b7f2943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '操作记录', 'e0b442cf943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b4b7f3943c11ea82b01e6b7e443566', 'instance_id', 40, 0, b'1', '任务实例ID', 'e0b442cf943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b4b7f4943c11ea82b01e6b7e443566', 'result', 1000, 0, b'0', '返回结果', 'e0b442cf943c11ea82b01e6b7e443566', 'VARCHAR(1000)');
INSERT INTO `ot_column_metadata` VALUES ('e0b4b7f5943c11ea82b01e6b7e443566', 'status', 20, 0, b'1', '实例状态(1004)', 'e0b442cf943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b50610943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b4b7f6943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b50611943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b4b7f6943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b50612943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b4b7f6943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b50613943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b4b7f6943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b50614943c11ea82b01e6b7e443566', 'cron', 20, 0, b'0', 'Cron', 'e0b4b7f6943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b50615943c11ea82b01e6b7e443566', 'days_of_week', 40, 0, b'0', '需要执行的星期', 'e0b4b7f6943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b50616943c11ea82b01e6b7e443566', 'end_time_of_day', 40, 0, b'0', '每天结束时间', 'e0b4b7f6943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b50617943c11ea82b01e6b7e443566', '_interval', 10, 0, b'0', '间隔', 'e0b4b7f6943c11ea82b01e6b7e443566', 'INT(10)');
INSERT INTO `ot_column_metadata` VALUES ('e0b50618943c11ea82b01e6b7e443566', 'interval_unit', 20, 0, b'0', '间隔单位', 'e0b4b7f6943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b50619943c11ea82b01e6b7e443566', 'repeat_count', 10, 0, b'0', '重复次数', 'e0b4b7f6943c11ea82b01e6b7e443566', 'INT(10)');
INSERT INTO `ot_column_metadata` VALUES ('e0b5061a943c11ea82b01e6b7e443566', 'start_time_of_day', 40, 0, b'0', '每天开始时间', 'e0b4b7f6943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b5061b943c11ea82b01e6b7e443566', 'trigger_name', 40, 0, b'1', '触发器名称', 'e0b4b7f6943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b5061c943c11ea82b01e6b7e443566', 'trigger_type', 40, 0, b'1', '触发类型(1002)', 'e0b4b7f6943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b55430943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b5061d943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b55431943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b5061d943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b55432943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b5061d943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b55433943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b5061d943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b55434943c11ea82b01e6b7e443566', 'by_order', 10, 0, b'0', '排序', 'e0b5061d943c11ea82b01e6b7e443566', 'INT(10)');
INSERT INTO `ot_column_metadata` VALUES ('e0b55435943c11ea82b01e6b7e443566', 'component', 40, 0, b'1', '组件名称', 'e0b5061d943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b55436943c11ea82b01e6b7e443566', 'hidden', 1, 0, b'0', '是否隐藏', 'e0b5061d943c11ea82b01e6b7e443566', 'BIT(1)');
INSERT INTO `ot_column_metadata` VALUES ('e0b55437943c11ea82b01e6b7e443566', 'meta', 1000, 0, b'0', 'Meta', 'e0b5061d943c11ea82b01e6b7e443566', 'VARCHAR(1000)');
INSERT INTO `ot_column_metadata` VALUES ('e0b55438943c11ea82b01e6b7e443566', 'parent_id', 40, 0, b'0', '父节点ID', 'e0b5061d943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b55439943c11ea82b01e6b7e443566', 'path', 40, 0, b'0', '菜单路径', 'e0b5061d943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b5543a943c11ea82b01e6b7e443566', 'redirect', 40, 0, b'0', 'redirect', 'e0b5061d943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b57b40943c11ea82b01e6b7e443566', 'always_show', 1, 0, b'0', '始终显示', 'e0b5061d943c11ea82b01e6b7e443566', 'BIT(1)');
INSERT INTO `ot_column_metadata` VALUES ('e0b5c960943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b57b41943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b5c961943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b57b41943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b5c962943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b57b41943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b5c963943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b57b41943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b5c964943c11ea82b01e6b7e443566', 'authority_id', 40, 0, b'1', '权限ID', 'e0b57b41943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b5c965943c11ea82b01e6b7e443566', 'menu_id', 40, 0, b'1', '菜单ID', 'e0b57b41943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b61780943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b5c966943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b61781943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b5c966943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b61782943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '操作记录', 'e0b5c966943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b61783943c11ea82b01e6b7e443566', 'ip_geo', 80, 0, b'0', 'IP来源', 'e0b5c966943c11ea82b01e6b7e443566', 'VARCHAR(80)');
INSERT INTO `ot_column_metadata` VALUES ('e0b61784943c11ea82b01e6b7e443566', 'operator', 40, 0, b'1', '操作人', 'e0b5c966943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b61785943c11ea82b01e6b7e443566', 'opt_ip', 40, 0, b'0', 'IP', 'e0b5c966943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b61786943c11ea82b01e6b7e443566', 'opt_name', 100, 0, b'0', '操作说明', 'e0b5c966943c11ea82b01e6b7e443566', 'VARCHAR(100)');
INSERT INTO `ot_column_metadata` VALUES ('e0b61787943c11ea82b01e6b7e443566', 'request_data', 2000, 0, b'0', '请求数据', 'e0b5c966943c11ea82b01e6b7e443566', 'VARCHAR(2000)');
INSERT INTO `ot_column_metadata` VALUES ('e0b61788943c11ea82b01e6b7e443566', 'request_url', 100, 0, b'0', '请求地址', 'e0b5c966943c11ea82b01e6b7e443566', 'VARCHAR(100)');
INSERT INTO `ot_column_metadata` VALUES ('e0b665a0943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b61789943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b665a1943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b61789943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b665a2943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b61789943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b665a3943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b61789943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b665a4943c11ea82b01e6b7e443566', 'clazz_path', 200, 0, b'1', '任务执行方法', 'e0b61789943c11ea82b01e6b7e443566', 'VARCHAR(200)');
INSERT INTO `ot_column_metadata` VALUES ('e0b665a5943c11ea82b01e6b7e443566', 'cron', 20, 0, b'1', 'Cron', 'e0b61789943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b665a6943c11ea82b01e6b7e443566', 'job_code', 40, 0, b'1', '任务编号（唯一）', 'e0b61789943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b665a7943c11ea82b01e6b7e443566', 'job_name', 40, 0, b'1', '任务名称', 'e0b61789943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b665a8943c11ea82b01e6b7e443566', 'status', 20, 0, b'1', '状态(1000)', 'e0b61789943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b6b3c0943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b665a9943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b6b3c1943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b665a9943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b6b3c2943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b665a9943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b6b3c3943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b665a9943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b6b3c4943c11ea82b01e6b7e443566', 'role_code', 40, 0, b'1', '角色编码(唯一)', 'e0b665a9943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b6b3c5943c11ea82b01e6b7e443566', 'role_name', 40, 0, b'1', '角色名称', 'e0b665a9943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b6b3c6943c11ea82b01e6b7e443566', 'status', 20, 0, b'1', '是否启用（码类：1000）', 'e0b665a9943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b728f0943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b6b3c7943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b728f1943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b6b3c7943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b728f2943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b6b3c7943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b728f3943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b6b3c7943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b728f4943c11ea82b01e6b7e443566', 'authority_id', 40, 0, b'1', '权限ID', 'e0b6b3c7943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b728f5943c11ea82b01e6b7e443566', 'role_id', 40, 0, b'1', '角色ID', 'e0b6b3c7943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b77710943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b728f6943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b77711943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b728f6943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b77712943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b728f6943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b77713943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b728f6943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b77714943c11ea82b01e6b7e443566', 'half', 1, 0, b'1', '是否半选', 'e0b728f6943c11ea82b01e6b7e443566', 'BIT(1)');
INSERT INTO `ot_column_metadata` VALUES ('e0b77715943c11ea82b01e6b7e443566', 'menu_id', 40, 0, b'1', '菜单ID', 'e0b728f6943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b77716943c11ea82b01e6b7e443566', 'role_id', 40, 0, b'1', '角色ID', 'e0b728f6943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b7c530943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b77717943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b7c531943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b77717943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b7c532943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b77717943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b7c533943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b77717943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b7c534943c11ea82b01e6b7e443566', 'status', 20, 0, b'1', '是否启用（码类：1000）', 'e0b77717943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b7c535943c11ea82b01e6b7e443566', 'type_code', 20, 0, b'1', '码类编码(唯一)', 'e0b77717943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b7c536943c11ea82b01e6b7e443566', 'type_name', 40, 0, b'1', '码类名称', 'e0b77717943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b83a60943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b7c537943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b83a61943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b7c537943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b83a62943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b7c537943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b83a63943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b7c537943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b83a64943c11ea82b01e6b7e443566', 'active', 1, 0, b'1', '是否激活', 'e0b7c537943c11ea82b01e6b7e443566', 'BIT(1)');
INSERT INTO `ot_column_metadata` VALUES ('e0b83a65943c11ea82b01e6b7e443566', 'avatar', 40, 0, b'0', '用户头像', 'e0b7c537943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b83a66943c11ea82b01e6b7e443566', 'email', 40, 0, b'0', '邮箱', 'e0b7c537943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b83a67943c11ea82b01e6b7e443566', 'password', 40, 0, b'0', '用户密码', 'e0b7c537943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b83a68943c11ea82b01e6b7e443566', 'phone_no', 40, 0, b'0', '手机号', 'e0b7c537943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b83a69943c11ea82b01e6b7e443566', 'real_name', 40, 0, b'0', '真实姓名', 'e0b7c537943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b83a6a943c11ea82b01e6b7e443566', 'username', 40, 0, b'1', '用户名(唯一)', 'e0b7c537943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b8af90943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b83a6b943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b8af91943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b83a6b943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b8af92943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b83a6b943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b8af93943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b83a6b943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b8af94943c11ea82b01e6b7e443566', 'role_id', 40, 0, b'1', '角色ID', 'e0b83a6b943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b8af95943c11ea82b01e6b7e443566', 'user_id', 40, 0, b'1', '用户ID', 'e0b83a6b943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b8fdb0943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b8af96943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b8fdb1943c11ea82b01e6b7e443566', 'pk_name', 40, 0, b'0', '主键', 'e0b8af96943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b8fdb2943c11ea82b01e6b7e443566', 'remarks', 400, 0, b'0', '注释', 'e0b8af96943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b8fdb3943c11ea82b01e6b7e443566', 'table_name', 40, 0, b'1', '表名', 'e0b8af96943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b8fdb4943c11ea82b01e6b7e443566', 'table_scheme', 40, 0, b'0', 'Scheme', 'e0b8af96943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b8fdb5943c11ea82b01e6b7e443566', 'table_type', 40, 0, b'0', '表类型', 'e0b8af96943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b972e0943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b8fdb6943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b972e1943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b8fdb6943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b972e2943c11ea82b01e6b7e443566', 'app_no', 20, 0, b'1', '应用编号', 'e0b8fdb6943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b972e3943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b8fdb6943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b972e4943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b8fdb6943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b972e5943c11ea82b01e6b7e443566', 'avatar_url', 255, 0, b'0', '头像', 'e0b8fdb6943c11ea82b01e6b7e443566', 'VARCHAR(255)');
INSERT INTO `ot_column_metadata` VALUES ('e0b972e6943c11ea82b01e6b7e443566', 'city', 40, 0, b'0', '城市', 'e0b8fdb6943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b972e7943c11ea82b01e6b7e443566', 'country', 40, 0, b'0', '国家', 'e0b8fdb6943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b972e8943c11ea82b01e6b7e443566', 'gender', 10, 0, b'0', '性别表示：0,1,2等数字.', 'e0b8fdb6943c11ea82b01e6b7e443566', 'INT(10)');
INSERT INTO `ot_column_metadata` VALUES ('e0b972e9943c11ea82b01e6b7e443566', 'ma_type', 20, 0, b'0', '小程序类型(wx|swan|my|tt|h5)', 'e0b8fdb6943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b972ea943c11ea82b01e6b7e443566', 'nick_name', 100, 0, b'0', '昵称（用于显示）', 'e0b8fdb6943c11ea82b01e6b7e443566', 'VARCHAR(100)');
INSERT INTO `ot_column_metadata` VALUES ('e0b972eb943c11ea82b01e6b7e443566', 'openid', 200, 0, b'0', '小程序openid', 'e0b8fdb6943c11ea82b01e6b7e443566', 'VARCHAR(200)');
INSERT INTO `ot_column_metadata` VALUES ('e0b972ec943c11ea82b01e6b7e443566', 'password', 40, 0, b'0', '用户密码', 'e0b8fdb6943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b972ed943c11ea82b01e6b7e443566', 'phone_no', 40, 0, b'0', '手机号（h5模式）', 'e0b8fdb6943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b972ee943c11ea82b01e6b7e443566', 'province', 40, 0, b'0', '省', 'e0b8fdb6943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b972ef943c11ea82b01e6b7e443566', 'unionid', 200, 0, b'0', '(小程序用户 + 主体维度)id', 'e0b8fdb6943c11ea82b01e6b7e443566', 'VARCHAR(200)');
INSERT INTO `ot_column_metadata` VALUES ('e0b972f0943c11ea82b01e6b7e443566', 'username', 40, 0, b'0', '用户名', 'e0b8fdb6943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b9e810943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b972f1943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b9e811943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b972f1943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0b9e812943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '操作记录', 'e0b972f1943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0b9e813943c11ea82b01e6b7e443566', 'app_no', 20, 0, b'0', '应用编号', 'e0b972f1943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b9e814943c11ea82b01e6b7e443566', 'ip_geo', 80, 0, b'0', 'IP来源', 'e0b972f1943c11ea82b01e6b7e443566', 'VARCHAR(80)');
INSERT INTO `ot_column_metadata` VALUES ('e0b9e815943c11ea82b01e6b7e443566', 'login_ip', 40, 0, b'0', '登录IP', 'e0b972f1943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b9e816943c11ea82b01e6b7e443566', 'ma_type', 20, 0, b'0', '小程序类型(wx|swan|my|tt|h5)', 'e0b972f1943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0b9e817943c11ea82b01e6b7e443566', 'nick_name', 40, 0, b'1', '用户昵称', 'e0b972f1943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b9e818943c11ea82b01e6b7e443566', 'uid', 40, 0, b'1', '用户ID', 'e0b972f1943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0b9e819943c11ea82b01e6b7e443566', 'unique_key', 200, 0, b'0', '唯一值(appNo:maType:(openid|phoneNo))', 'e0b972f1943c11ea82b01e6b7e443566', 'VARCHAR(200)');
INSERT INTO `ot_column_metadata` VALUES ('e0ba3630943c11ea82b01e6b7e443566', 'id', 40, 0, b'1', 'ID', 'e0b9e81a943c11ea82b01e6b7e443566', 'VARCHAR(40)');
INSERT INTO `ot_column_metadata` VALUES ('e0ba3631943c11ea82b01e6b7e443566', 'created_time', 19, 0, b'0', '创建时间', 'e0b9e81a943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0ba3632943c11ea82b01e6b7e443566', 'app_no', 20, 0, b'1', '应用编号', 'e0b9e81a943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0ba3633943c11ea82b01e6b7e443566', 'last_modified_time', 19, 0, b'0', '最后修改时间', 'e0b9e81a943c11ea82b01e6b7e443566', 'DATETIME');
INSERT INTO `ot_column_metadata` VALUES ('e0ba3634943c11ea82b01e6b7e443566', 'remark', 400, 0, b'0', '备注（修改记录)', 'e0b9e81a943c11ea82b01e6b7e443566', 'VARCHAR(400)');
INSERT INTO `ot_column_metadata` VALUES ('e0ba3635943c11ea82b01e6b7e443566', 'ma_type', 20, 0, b'1', '小程序类型(wx|swan|my|tt)', 'e0b9e81a943c11ea82b01e6b7e443566', 'VARCHAR(20)');
INSERT INTO `ot_column_metadata` VALUES ('e0ba3636943c11ea82b01e6b7e443566', 'openid', 200, 0, b'1', '小程序openid', 'e0b9e81a943c11ea82b01e6b7e443566', 'VARCHAR(200)');
INSERT INTO `ot_column_metadata` VALUES ('e0ba3637943c11ea82b01e6b7e443566', 'session_key', 120, 0, b'0', '会话密钥', 'e0b9e81a943c11ea82b01e6b7e443566', 'VARCHAR(120)');
INSERT INTO `ot_column_metadata` VALUES ('e0ba3638943c11ea82b01e6b7e443566', 'uid', 40, 0, b'0', '用户ID', 'e0b9e81a943c11ea82b01e6b7e443566', 'VARCHAR(40)');
COMMIT;

-- ----------------------------
-- Table structure for ot_region
-- ----------------------------
DROP TABLE IF EXISTS `ot_region`;
CREATE TABLE `ot_region` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `depth` int(1) NOT NULL COMMENT '级别',
  `depth_name` varchar(40) DEFAULT NULL COMMENT '级别名称',
  `first_letter` varchar(20) DEFAULT NULL COMMENT '首字符',
  `jian_pin` varchar(100) DEFAULT NULL COMMENT '简拼',
  `name` varchar(40) NOT NULL COMMENT '名称',
  `parent_id` varchar(40) DEFAULT NULL COMMENT '父级ID',
  `pin_yin` varchar(100) DEFAULT NULL COMMENT '拼音',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地区数据';

-- ----------------------------
-- Records of ot_region
-- ----------------------------
BEGIN;
INSERT INTO `ot_region` VALUES ('110100', 2, '城市', 'b', 'bjs', '北京市', '110000', 'beijingshi');
INSERT INTO `ot_region` VALUES ('110101', 3, '区县', 'd', 'dcq', '东城区', '110100', 'dongchengqu');
INSERT INTO `ot_region` VALUES ('110102', 3, '区县', 'x', 'xcq', '西城区', '110100', 'xichengqu');
INSERT INTO `ot_region` VALUES ('110105', 3, '区县', 'c', 'cyq', '朝阳区', '110100', 'chaoyangqu');
INSERT INTO `ot_region` VALUES ('110106', 3, '区县', 'f', 'ftq', '丰台区', '110100', 'fengtaiqu');
INSERT INTO `ot_region` VALUES ('110107', 3, '区县', 's', 'sjsq', '石景山区', '110100', 'shijingshanqu');
INSERT INTO `ot_region` VALUES ('110108', 3, '区县', 'h', 'hdq', '海淀区', '110100', 'haidianqu');
INSERT INTO `ot_region` VALUES ('110109', 3, '区县', 'm', 'mtgq', '门头沟区', '110100', 'mentougouqu');
INSERT INTO `ot_region` VALUES ('110111', 3, '区县', 'f', 'fsq', '房山区', '110100', 'fangshanqu');
INSERT INTO `ot_region` VALUES ('110112', 3, '区县', 't', 'tzq', '通州区', '110100', 'tongzhouqu');
INSERT INTO `ot_region` VALUES ('110113', 3, '区县', 's', 'syq', '顺义区', '110100', 'shunyiqu');
INSERT INTO `ot_region` VALUES ('110114', 3, '区县', 'c', 'cpq', '昌平区', '110100', 'changpingqu');
INSERT INTO `ot_region` VALUES ('110115', 3, '区县', 'd', 'dxq', '大兴区', '110100', 'daxingqu');
INSERT INTO `ot_region` VALUES ('110116', 3, '区县', 'h', 'hrq', '怀柔区', '110100', 'huairouqu');
INSERT INTO `ot_region` VALUES ('110117', 3, '区县', 'p', 'pgq', '平谷区', '110100', 'pingguqu');
INSERT INTO `ot_region` VALUES ('110118', 3, '区县', 'm', 'myq', '密云区', '110100', 'miyunqu');
INSERT INTO `ot_region` VALUES ('110119', 3, '区县', 'y', 'yqq', '延庆区', '110100', 'yanqingqu');
INSERT INTO `ot_region` VALUES ('120100', 2, '城市', 't', 'tjs', '天津市', '120000', 'tianjinshi');
INSERT INTO `ot_region` VALUES ('120101', 3, '区县', 'h', 'hpq', '和平区', '120100', 'hepingqu');
INSERT INTO `ot_region` VALUES ('120102', 3, '区县', 'h', 'hdq', '河东区', '120100', 'hedongqu');
INSERT INTO `ot_region` VALUES ('120103', 3, '区县', 'h', 'hxq', '河西区', '120100', 'hexiqu');
INSERT INTO `ot_region` VALUES ('120104', 3, '区县', 'n', 'nkq', '南开区', '120100', 'nankaiqu');
INSERT INTO `ot_region` VALUES ('120105', 3, '区县', 'h', 'hbq', '河北区', '120100', 'hebeiqu');
INSERT INTO `ot_region` VALUES ('120106', 3, '区县', 'h', 'hqq', '红桥区', '120100', 'hongqiaoqu');
INSERT INTO `ot_region` VALUES ('120110', 3, '区县', 'd', 'dlq', '东丽区', '120100', 'dongliqu');
INSERT INTO `ot_region` VALUES ('120111', 3, '区县', 'x', 'xqq', '西青区', '120100', 'xiqingqu');
INSERT INTO `ot_region` VALUES ('120112', 3, '区县', 'j', 'jnq', '津南区', '120100', 'jinnanqu');
INSERT INTO `ot_region` VALUES ('120113', 3, '区县', 'b', 'bcq', '北辰区', '120100', 'beichenqu');
INSERT INTO `ot_region` VALUES ('120114', 3, '区县', 'w', 'wqq', '武清区', '120100', 'wuqingqu');
INSERT INTO `ot_region` VALUES ('120115', 3, '区县', 'b', 'bcq', '宝坻区', '120100', 'baochiqu');
INSERT INTO `ot_region` VALUES ('120116', 3, '区县', 'b', 'bhxq', '滨海新区', '120100', 'binhaixinqu');
INSERT INTO `ot_region` VALUES ('120117', 3, '区县', 'n', 'nhq', '宁河区', '120100', 'ninghequ');
INSERT INTO `ot_region` VALUES ('120118', 3, '区县', 'j', 'jhq', '静海区', '120100', 'jinghaiqu');
INSERT INTO `ot_region` VALUES ('120119', 3, '区县', 'j', 'jzq', '蓟州区', '120100', 'jizhouqu');
INSERT INTO `ot_region` VALUES ('130100', 2, '城市', 's', 'sjzs', '石家庄市', '130000', 'shijiazhuangshi');
INSERT INTO `ot_region` VALUES ('130102', 3, '区县', 'z', 'zaq', '长安区', '130100', 'zhanganqu');
INSERT INTO `ot_region` VALUES ('130104', 3, '区县', 'q', 'qxq', '桥西区', '130100', 'qiaoxiqu');
INSERT INTO `ot_region` VALUES ('130105', 3, '区县', 'x', 'xhq', '新华区', '130100', 'xinhuaqu');
INSERT INTO `ot_region` VALUES ('130107', 3, '区县', 'j', 'jxkq', '井陉矿区', '130100', 'jingxingkuangqu');
INSERT INTO `ot_region` VALUES ('130108', 3, '区县', 'y', 'yhq', '裕华区', '130100', 'yuhuaqu');
INSERT INTO `ot_region` VALUES ('130109', 3, '区县', 'g', 'gcq', '藁城区', '130100', 'gaochengqu');
INSERT INTO `ot_region` VALUES ('130110', 3, '区县', 'l', 'lqq', '鹿泉区', '130100', 'luquanqu');
INSERT INTO `ot_region` VALUES ('130111', 3, '区县', 'l', 'lcq', '栾城区', '130100', 'luanchengqu');
INSERT INTO `ot_region` VALUES ('130121', 3, '区县', 'j', 'jxx', '井陉县', '130100', 'jingxingxian');
INSERT INTO `ot_region` VALUES ('130123', 3, '区县', 'z', 'zdx', '正定县', '130100', 'zhengdingxian');
INSERT INTO `ot_region` VALUES ('130125', 3, '区县', 'x', 'xtx', '行唐县', '130100', 'xingtangxian');
INSERT INTO `ot_region` VALUES ('130126', 3, '区县', 'l', 'lsx', '灵寿县', '130100', 'lingshouxian');
INSERT INTO `ot_region` VALUES ('130127', 3, '区县', 'g', 'gyx', '高邑县', '130100', 'gaoyixian');
INSERT INTO `ot_region` VALUES ('130128', 3, '区县', 's', 'szx', '深泽县', '130100', 'shenzexian');
INSERT INTO `ot_region` VALUES ('130129', 3, '区县', 'z', 'zhx', '赞皇县', '130100', 'zanhuangxian');
INSERT INTO `ot_region` VALUES ('130130', 3, '区县', 'w', 'wjx', '无极县', '130100', 'wujixian');
INSERT INTO `ot_region` VALUES ('130131', 3, '区县', 'p', 'psx', '平山县', '130100', 'pingshanxian');
INSERT INTO `ot_region` VALUES ('130132', 3, '区县', 'y', 'ysx', '元氏县', '130100', 'yuanshixian');
INSERT INTO `ot_region` VALUES ('130133', 3, '区县', 'z', 'zx', '赵县', '130100', 'zhaoxian');
INSERT INTO `ot_region` VALUES ('130181', 3, '区县', 'x', 'xjs', '辛集市', '130100', 'xinjishi');
INSERT INTO `ot_region` VALUES ('130183', 3, '区县', 'j', 'jzs', '晋州市', '130100', 'jinzhoushi');
INSERT INTO `ot_region` VALUES ('130184', 3, '区县', 'x', 'xls', '新乐市', '130100', 'xinleshi');
INSERT INTO `ot_region` VALUES ('130200', 2, '城市', 't', 'tss', '唐山市', '130000', 'tangshanshi');
INSERT INTO `ot_region` VALUES ('130202', 3, '区县', 'l', 'lnq', '路南区', '130200', 'lunanqu');
INSERT INTO `ot_region` VALUES ('130203', 3, '区县', 'l', 'lbq', '路北区', '130200', 'lubeiqu');
INSERT INTO `ot_region` VALUES ('130204', 3, '区县', 'g', 'gyq', '古冶区', '130200', 'guyequ');
INSERT INTO `ot_region` VALUES ('130205', 3, '区县', 'k', 'kpq', '开平区', '130200', 'kaipingqu');
INSERT INTO `ot_region` VALUES ('130207', 3, '区县', 'f', 'fnq', '丰南区', '130200', 'fengnanqu');
INSERT INTO `ot_region` VALUES ('130208', 3, '区县', 'f', 'frq', '丰润区', '130200', 'fengrunqu');
INSERT INTO `ot_region` VALUES ('130209', 3, '区县', 'c', 'cfdq', '曹妃甸区', '130200', 'caofeidianqu');
INSERT INTO `ot_region` VALUES ('130224', 3, '区县', 'l', 'lnx', '滦南县', '130200', 'luannanxian');
INSERT INTO `ot_region` VALUES ('130225', 3, '区县', 'l', 'ltx', '乐亭县', '130200', 'letingxian');
INSERT INTO `ot_region` VALUES ('130227', 3, '区县', 'q', 'qxx', '迁西县', '130200', 'qianxixian');
INSERT INTO `ot_region` VALUES ('130229', 3, '区县', 'y', 'ytx', '玉田县', '130200', 'yutianxian');
INSERT INTO `ot_region` VALUES ('130281', 3, '区县', 'z', 'zhs', '遵化市', '130200', 'zunhuashi');
INSERT INTO `ot_region` VALUES ('130283', 3, '区县', 'q', 'qas', '迁安市', '130200', 'qiananshi');
INSERT INTO `ot_region` VALUES ('130284', 3, '区县', 'l', 'lzs', '滦州市', '130200', 'luanzhoushi');
INSERT INTO `ot_region` VALUES ('130300', 2, '城市', 'q', 'qhds', '秦皇岛市', '130000', 'qinhuangdaoshi');
INSERT INTO `ot_region` VALUES ('130302', 3, '区县', 'h', 'hgq', '海港区', '130300', 'haigangqu');
INSERT INTO `ot_region` VALUES ('130303', 3, '区县', 's', 'shgq', '山海关区', '130300', 'shanhaiguanqu');
INSERT INTO `ot_region` VALUES ('130304', 3, '区县', 'b', 'bdhq', '北戴河区', '130300', 'beidaihequ');
INSERT INTO `ot_region` VALUES ('130306', 3, '区县', 'f', 'fnq', '抚宁区', '130300', 'funingqu');
INSERT INTO `ot_region` VALUES ('130321', 3, '区县', 'q', 'qlmzzzx', '青龙满族自治县', '130300', 'qinglongmanzuzizhixian');
INSERT INTO `ot_region` VALUES ('130322', 3, '区县', 'c', 'clx', '昌黎县', '130300', 'changlixian');
INSERT INTO `ot_region` VALUES ('130324', 3, '区县', 'l', 'llx', '卢龙县', '130300', 'lulongxian');
INSERT INTO `ot_region` VALUES ('130390', 3, '区县', 'j', 'jjjskfq', '经济技术开发区', '130300', 'jingjijishukaifaqu');
INSERT INTO `ot_region` VALUES ('130400', 2, '城市', 'h', 'hds', '邯郸市', '130000', 'handanshi');
INSERT INTO `ot_region` VALUES ('130402', 3, '区县', 'h', 'hsq', '邯山区', '130400', 'hanshanqu');
INSERT INTO `ot_region` VALUES ('130403', 3, '区县', 'c', 'ctq', '丛台区', '130400', 'congtaiqu');
INSERT INTO `ot_region` VALUES ('130404', 3, '区县', 'f', 'fxq', '复兴区', '130400', 'fuxingqu');
INSERT INTO `ot_region` VALUES ('130406', 3, '区县', 'f', 'ffkq', '峰峰矿区', '130400', 'fengfengkuangqu');
INSERT INTO `ot_region` VALUES ('130407', 3, '区县', 'f', 'fxq', '肥乡区', '130400', 'feixiangqu');
INSERT INTO `ot_region` VALUES ('130408', 3, '区县', 'y', 'ynq', '永年区', '130400', 'yongnianqu');
INSERT INTO `ot_region` VALUES ('130423', 3, '区县', 'l', 'lzx', '临漳县', '130400', 'linzhangxian');
INSERT INTO `ot_region` VALUES ('130424', 3, '区县', 'c', 'cax', '成安县', '130400', 'chenganxian');
INSERT INTO `ot_region` VALUES ('130425', 3, '区县', 'd', 'dmx', '大名县', '130400', 'damingxian');
INSERT INTO `ot_region` VALUES ('130426', 3, '区县', 's', 'sx', '涉县', '130400', 'shexian');
INSERT INTO `ot_region` VALUES ('130427', 3, '区县', 'c', 'cx', '磁县', '130400', 'cixian');
INSERT INTO `ot_region` VALUES ('130430', 3, '区县', 'q', 'qx', '邱县', '130400', 'qiuxian');
INSERT INTO `ot_region` VALUES ('130431', 3, '区县', 'j', 'jzx', '鸡泽县', '130400', 'jizexian');
INSERT INTO `ot_region` VALUES ('130432', 3, '区县', 'g', 'gpx', '广平县', '130400', 'guangpingxian');
INSERT INTO `ot_region` VALUES ('130433', 3, '区县', 'g', 'gtx', '馆陶县', '130400', 'guantaoxian');
INSERT INTO `ot_region` VALUES ('130434', 3, '区县', 'w', 'wx', '魏县', '130400', 'weixian');
INSERT INTO `ot_region` VALUES ('130435', 3, '区县', 'q', 'qzx', '曲周县', '130400', 'quzhouxian');
INSERT INTO `ot_region` VALUES ('130481', 3, '区县', 'w', 'was', '武安市', '130400', 'wuanshi');
INSERT INTO `ot_region` VALUES ('130500', 2, '城市', 'x', 'xts', '邢台市', '130000', 'xingtaishi');
INSERT INTO `ot_region` VALUES ('130502', 3, '区县', 'q', 'qdq', '桥东区', '130500', 'qiaodongqu');
INSERT INTO `ot_region` VALUES ('130503', 3, '区县', 'q', 'qxq', '桥西区', '130500', 'qiaoxiqu');
INSERT INTO `ot_region` VALUES ('130521', 3, '区县', 'x', 'xtx', '邢台县', '130500', 'xingtaixian');
INSERT INTO `ot_region` VALUES ('130522', 3, '区县', 'l', 'lcx', '临城县', '130500', 'linchengxian');
INSERT INTO `ot_region` VALUES ('130523', 3, '区县', 'n', 'nqx', '内丘县', '130500', 'neiqiuxian');
INSERT INTO `ot_region` VALUES ('130524', 3, '区县', 'b', 'bxx', '柏乡县', '130500', 'boxiangxian');
INSERT INTO `ot_region` VALUES ('130525', 3, '区县', 'l', 'lyx', '隆尧县', '130500', 'longyaoxian');
INSERT INTO `ot_region` VALUES ('130526', 3, '区县', 'r', 'rx', '任县', '130500', 'renxian');
INSERT INTO `ot_region` VALUES ('130527', 3, '区县', 'n', 'nhx', '南和县', '130500', 'nanhexian');
INSERT INTO `ot_region` VALUES ('130528', 3, '区县', 'n', 'njx', '宁晋县', '130500', 'ningjinxian');
INSERT INTO `ot_region` VALUES ('130529', 3, '区县', 'j', 'jlx', '巨鹿县', '130500', 'juluxian');
INSERT INTO `ot_region` VALUES ('130530', 3, '区县', 'x', 'xhx', '新河县', '130500', 'xinhexian');
INSERT INTO `ot_region` VALUES ('130531', 3, '区县', 'g', 'gzx', '广宗县', '130500', 'guangzongxian');
INSERT INTO `ot_region` VALUES ('130532', 3, '区县', 'p', 'pxx', '平乡县', '130500', 'pingxiangxian');
INSERT INTO `ot_region` VALUES ('130533', 3, '区县', 'w', 'wx', '威县', '130500', 'weixian');
INSERT INTO `ot_region` VALUES ('130534', 3, '区县', 'q', 'qhx', '清河县', '130500', 'qinghexian');
INSERT INTO `ot_region` VALUES ('130535', 3, '区县', 'l', 'lxx', '临西县', '130500', 'linxixian');
INSERT INTO `ot_region` VALUES ('130581', 3, '区县', 'n', 'ngs', '南宫市', '130500', 'nangongshi');
INSERT INTO `ot_region` VALUES ('130582', 3, '区县', 's', 'shs', '沙河市', '130500', 'shaheshi');
INSERT INTO `ot_region` VALUES ('130600', 2, '城市', 'b', 'bds', '保定市', '130000', 'baodingshi');
INSERT INTO `ot_region` VALUES ('130602', 3, '区县', 'j', 'jxq', '竞秀区', '130600', 'jingxiuqu');
INSERT INTO `ot_region` VALUES ('130606', 3, '区县', 'l', 'lcq', '莲池区', '130600', 'lianchiqu');
INSERT INTO `ot_region` VALUES ('130607', 3, '区县', 'm', 'mcq', '满城区', '130600', 'manchengqu');
INSERT INTO `ot_region` VALUES ('130608', 3, '区县', 'q', 'qyq', '清苑区', '130600', 'qingyuanqu');
INSERT INTO `ot_region` VALUES ('130609', 3, '区县', 'x', 'xsq', '徐水区', '130600', 'xushuiqu');
INSERT INTO `ot_region` VALUES ('130623', 3, '区县', 'l', 'lsx', '涞水县', '130600', 'laishuixian');
INSERT INTO `ot_region` VALUES ('130624', 3, '区县', 'f', 'fpx', '阜平县', '130600', 'fupingxian');
INSERT INTO `ot_region` VALUES ('130626', 3, '区县', 'd', 'dxx', '定兴县', '130600', 'dingxingxian');
INSERT INTO `ot_region` VALUES ('130627', 3, '区县', 't', 'tx', '唐县', '130600', 'tangxian');
INSERT INTO `ot_region` VALUES ('130628', 3, '区县', 'g', 'gyx', '高阳县', '130600', 'gaoyangxian');
INSERT INTO `ot_region` VALUES ('130629', 3, '区县', 'r', 'rcx', '容城县', '130600', 'rongchengxian');
INSERT INTO `ot_region` VALUES ('130630', 3, '区县', 'l', 'lyx', '涞源县', '130600', 'laiyuanxian');
INSERT INTO `ot_region` VALUES ('130631', 3, '区县', 'w', 'wdx', '望都县', '130600', 'wangdouxian');
INSERT INTO `ot_region` VALUES ('130632', 3, '区县', 'a', 'axx', '安新县', '130600', 'anxinxian');
INSERT INTO `ot_region` VALUES ('130633', 3, '区县', 'y', 'yx', '易县', '130600', 'yixian');
INSERT INTO `ot_region` VALUES ('130634', 3, '区县', 'q', 'qyx', '曲阳县', '130600', 'quyangxian');
INSERT INTO `ot_region` VALUES ('130635', 3, '区县', 'l', 'lx', '蠡县', '130600', 'lixian');
INSERT INTO `ot_region` VALUES ('130636', 3, '区县', 's', 'spx', '顺平县', '130600', 'shunpingxian');
INSERT INTO `ot_region` VALUES ('130637', 3, '区县', 'b', 'byx', '博野县', '130600', 'boyexian');
INSERT INTO `ot_region` VALUES ('130638', 3, '区县', 'x', 'xx', '雄县', '130600', 'xiongxian');
INSERT INTO `ot_region` VALUES ('130681', 3, '区县', 'z', 'zzs', '涿州市', '130600', 'zhuozhoushi');
INSERT INTO `ot_region` VALUES ('130682', 3, '区县', 'd', 'dzs', '定州市', '130600', 'dingzhoushi');
INSERT INTO `ot_region` VALUES ('130683', 3, '区县', 'a', 'ags', '安国市', '130600', 'anguoshi');
INSERT INTO `ot_region` VALUES ('130684', 3, '区县', 'g', 'gbds', '高碑店市', '130600', 'gaobeidianshi');
INSERT INTO `ot_region` VALUES ('130700', 2, '城市', 'z', 'zjks', '张家口市', '130000', 'zhangjiakoushi');
INSERT INTO `ot_region` VALUES ('130702', 3, '区县', 'q', 'qdq', '桥东区', '130700', 'qiaodongqu');
INSERT INTO `ot_region` VALUES ('130703', 3, '区县', 'q', 'qxq', '桥西区', '130700', 'qiaoxiqu');
INSERT INTO `ot_region` VALUES ('130705', 3, '区县', 'x', 'xhq', '宣化区', '130700', 'xuanhuaqu');
INSERT INTO `ot_region` VALUES ('130706', 3, '区县', 'x', 'xhyq', '下花园区', '130700', 'xiahuayuanqu');
INSERT INTO `ot_region` VALUES ('130708', 3, '区县', 'w', 'wqq', '万全区', '130700', 'wanquanqu');
INSERT INTO `ot_region` VALUES ('130709', 3, '区县', 'c', 'clq', '崇礼区', '130700', 'chongliqu');
INSERT INTO `ot_region` VALUES ('130722', 3, '区县', 'z', 'zbx', '张北县', '130700', 'zhangbeixian');
INSERT INTO `ot_region` VALUES ('130723', 3, '区县', 'k', 'kbx', '康保县', '130700', 'kangbaoxian');
INSERT INTO `ot_region` VALUES ('130724', 3, '区县', 'g', 'gyx', '沽源县', '130700', 'guyuanxian');
INSERT INTO `ot_region` VALUES ('130725', 3, '区县', 's', 'syx', '尚义县', '130700', 'shangyixian');
INSERT INTO `ot_region` VALUES ('130726', 3, '区县', 'y', 'yx', '蔚县', '130700', 'yuxian');
INSERT INTO `ot_region` VALUES ('130727', 3, '区县', 'y', 'yyx', '阳原县', '130700', 'yangyuanxian');
INSERT INTO `ot_region` VALUES ('130728', 3, '区县', 'h', 'hax', '怀安县', '130700', 'huaianxian');
INSERT INTO `ot_region` VALUES ('130730', 3, '区县', 'h', 'hlx', '怀来县', '130700', 'huailaixian');
INSERT INTO `ot_region` VALUES ('130731', 3, '区县', 'z', 'zlx', '涿鹿县', '130700', 'zhuoluxian');
INSERT INTO `ot_region` VALUES ('130732', 3, '区县', 'c', 'ccx', '赤城县', '130700', 'chichengxian');
INSERT INTO `ot_region` VALUES ('130800', 2, '城市', 'c', 'cds', '承德市', '130000', 'chengdeshi');
INSERT INTO `ot_region` VALUES ('130802', 3, '区县', 's', 'sqq', '双桥区', '130800', 'shuangqiaoqu');
INSERT INTO `ot_region` VALUES ('130803', 3, '区县', 's', 'slq', '双滦区', '130800', 'shuangluanqu');
INSERT INTO `ot_region` VALUES ('130804', 3, '区县', 'y', 'ysyzkq', '鹰手营子矿区', '130800', 'yingshouyingzikuangqu');
INSERT INTO `ot_region` VALUES ('130821', 3, '区县', 'c', 'cdx', '承德县', '130800', 'chengdexian');
INSERT INTO `ot_region` VALUES ('130822', 3, '区县', 'x', 'xlx', '兴隆县', '130800', 'xinglongxian');
INSERT INTO `ot_region` VALUES ('130824', 3, '区县', 'l', 'lpx', '滦平县', '130800', 'luanpingxian');
INSERT INTO `ot_region` VALUES ('130825', 3, '区县', 'l', 'lhx', '隆化县', '130800', 'longhuaxian');
INSERT INTO `ot_region` VALUES ('130826', 3, '区县', 'f', 'fnmzzzx', '丰宁满族自治县', '130800', 'fengningmanzuzizhixian');
INSERT INTO `ot_region` VALUES ('130827', 3, '区县', 'k', 'kcmzzzx', '宽城满族自治县', '130800', 'kuanchengmanzuzizhixian');
INSERT INTO `ot_region` VALUES ('130828', 3, '区县', 'w', 'wcmzmgzzzx', '围场满族蒙古族自治县', '130800', 'weichangmanzumengguzuzizhixian');
INSERT INTO `ot_region` VALUES ('130881', 3, '区县', 'p', 'pqs', '平泉市', '130800', 'pingquanshi');
INSERT INTO `ot_region` VALUES ('130900', 2, '城市', 'c', 'czs', '沧州市', '130000', 'cangzhoushi');
INSERT INTO `ot_region` VALUES ('130902', 3, '区县', 'x', 'xhq', '新华区', '130900', 'xinhuaqu');
INSERT INTO `ot_region` VALUES ('130903', 3, '区县', 'y', 'yhq', '运河区', '130900', 'yunhequ');
INSERT INTO `ot_region` VALUES ('130921', 3, '区县', 'c', 'cx', '沧县', '130900', 'cangxian');
INSERT INTO `ot_region` VALUES ('130922', 3, '区县', 'q', 'qx', '青县', '130900', 'qingxian');
INSERT INTO `ot_region` VALUES ('130923', 3, '区县', 'd', 'dgx', '东光县', '130900', 'dongguangxian');
INSERT INTO `ot_region` VALUES ('130924', 3, '区县', 'h', 'hxx', '海兴县', '130900', 'haixingxian');
INSERT INTO `ot_region` VALUES ('130925', 3, '区县', 'y', 'ysx', '盐山县', '130900', 'yanshanxian');
INSERT INTO `ot_region` VALUES ('130926', 3, '区县', 's', 'snx', '肃宁县', '130900', 'suningxian');
INSERT INTO `ot_region` VALUES ('130927', 3, '区县', 'n', 'npx', '南皮县', '130900', 'nanpixian');
INSERT INTO `ot_region` VALUES ('130928', 3, '区县', 'w', 'wqx', '吴桥县', '130900', 'wuqiaoxian');
INSERT INTO `ot_region` VALUES ('130929', 3, '区县', 'x', 'xx', '献县', '130900', 'xianxian');
INSERT INTO `ot_region` VALUES ('130930', 3, '区县', 'm', 'mchzzzx', '孟村回族自治县', '130900', 'mengcunhuizuzizhixian');
INSERT INTO `ot_region` VALUES ('130981', 3, '区县', 'b', 'bts', '泊头市', '130900', 'botoushi');
INSERT INTO `ot_region` VALUES ('130982', 3, '区县', 'r', 'rqs', '任丘市', '130900', 'renqiushi');
INSERT INTO `ot_region` VALUES ('130983', 3, '区县', 'h', 'hhs', '黄骅市', '130900', 'huanghuashi');
INSERT INTO `ot_region` VALUES ('130984', 3, '区县', 'h', 'hjs', '河间市', '130900', 'hejianshi');
INSERT INTO `ot_region` VALUES ('131000', 2, '城市', 'l', 'lfs', '廊坊市', '130000', 'langfangshi');
INSERT INTO `ot_region` VALUES ('131002', 3, '区县', 'a', 'acq', '安次区', '131000', 'anciqu');
INSERT INTO `ot_region` VALUES ('131003', 3, '区县', 'g', 'gyq', '广阳区', '131000', 'guangyangqu');
INSERT INTO `ot_region` VALUES ('131022', 3, '区县', 'g', 'gax', '固安县', '131000', 'guanxian');
INSERT INTO `ot_region` VALUES ('131023', 3, '区县', 'y', 'yqx', '永清县', '131000', 'yongqingxian');
INSERT INTO `ot_region` VALUES ('131024', 3, '区县', 'x', 'xhx', '香河县', '131000', 'xianghexian');
INSERT INTO `ot_region` VALUES ('131025', 3, '区县', 'd', 'dcx', '大城县', '131000', 'dachengxian');
INSERT INTO `ot_region` VALUES ('131026', 3, '区县', 'w', 'wax', '文安县', '131000', 'wenanxian');
INSERT INTO `ot_region` VALUES ('131028', 3, '区县', 'd', 'dchzzzx', '大厂回族自治县', '131000', 'dachanghuizuzizhixian');
INSERT INTO `ot_region` VALUES ('131081', 3, '区县', 'b', 'bzs', '霸州市', '131000', 'bazhoushi');
INSERT INTO `ot_region` VALUES ('131082', 3, '区县', 's', 'shs', '三河市', '131000', 'sanheshi');
INSERT INTO `ot_region` VALUES ('131090', 3, '区县', 'k', 'kfq', '开发区', '131000', 'kaifaqu');
INSERT INTO `ot_region` VALUES ('131100', 2, '城市', 'h', 'hss', '衡水市', '130000', 'hengshuishi');
INSERT INTO `ot_region` VALUES ('131102', 3, '区县', 't', 'tcq', '桃城区', '131100', 'taochengqu');
INSERT INTO `ot_region` VALUES ('131103', 3, '区县', 'j', 'jzq', '冀州区', '131100', 'jizhouqu');
INSERT INTO `ot_region` VALUES ('131121', 3, '区县', 'z', 'zqx', '枣强县', '131100', 'zaoqiangxian');
INSERT INTO `ot_region` VALUES ('131122', 3, '区县', 'w', 'wyx', '武邑县', '131100', 'wuyixian');
INSERT INTO `ot_region` VALUES ('131123', 3, '区县', 'w', 'wqx', '武强县', '131100', 'wuqiangxian');
INSERT INTO `ot_region` VALUES ('131124', 3, '区县', 'r', 'ryx', '饶阳县', '131100', 'raoyangxian');
INSERT INTO `ot_region` VALUES ('131125', 3, '区县', 'a', 'apx', '安平县', '131100', 'anpingxian');
INSERT INTO `ot_region` VALUES ('131126', 3, '区县', 'g', 'gcx', '故城县', '131100', 'guchengxian');
INSERT INTO `ot_region` VALUES ('131127', 3, '区县', 'j', 'jx', '景县', '131100', 'jingxian');
INSERT INTO `ot_region` VALUES ('131128', 3, '区县', 'f', 'fcx', '阜城县', '131100', 'fuchengxian');
INSERT INTO `ot_region` VALUES ('131182', 3, '区县', 's', 'szs', '深州市', '131100', 'shenzhoushi');
INSERT INTO `ot_region` VALUES ('140100', 2, '城市', 't', 'tys', '太原市', '140000', 'taiyuanshi');
INSERT INTO `ot_region` VALUES ('140105', 3, '区县', 'x', 'xdq', '小店区', '140100', 'xiaodianqu');
INSERT INTO `ot_region` VALUES ('140106', 3, '区县', 'y', 'yzq', '迎泽区', '140100', 'yingzequ');
INSERT INTO `ot_region` VALUES ('140107', 3, '区县', 'x', 'xhlq', '杏花岭区', '140100', 'xinghualingqu');
INSERT INTO `ot_region` VALUES ('140108', 3, '区县', 'j', 'jcpq', '尖草坪区', '140100', 'jiancaopingqu');
INSERT INTO `ot_region` VALUES ('140109', 3, '区县', 'w', 'wblq', '万柏林区', '140100', 'wanbolinqu');
INSERT INTO `ot_region` VALUES ('140110', 3, '区县', 'j', 'jyq', '晋源区', '140100', 'jinyuanqu');
INSERT INTO `ot_region` VALUES ('140121', 3, '区县', 'q', 'qxx', '清徐县', '140100', 'qingxuxian');
INSERT INTO `ot_region` VALUES ('140122', 3, '区县', 'y', 'yqx', '阳曲县', '140100', 'yangquxian');
INSERT INTO `ot_region` VALUES ('140123', 3, '区县', 'l', 'lfx', '娄烦县', '140100', 'loufanxian');
INSERT INTO `ot_region` VALUES ('140181', 3, '区县', 'g', 'gjs', '古交市', '140100', 'gujiaoshi');
INSERT INTO `ot_region` VALUES ('140200', 2, '城市', 'd', 'dts', '大同市', '140000', 'datongshi');
INSERT INTO `ot_region` VALUES ('140212', 3, '区县', 'x', 'xrq', '新荣区', '140200', 'xinrongqu');
INSERT INTO `ot_region` VALUES ('140213', 3, '区县', 'p', 'pcq', '平城区', '140200', 'pingchengqu');
INSERT INTO `ot_region` VALUES ('140214', 3, '区县', 'y', 'ygq', '云冈区', '140200', 'yungangqu');
INSERT INTO `ot_region` VALUES ('140215', 3, '区县', 'y', 'yzq', '云州区', '140200', 'yunzhouqu');
INSERT INTO `ot_region` VALUES ('140221', 3, '区县', 'y', 'ygx', '阳高县', '140200', 'yanggaoxian');
INSERT INTO `ot_region` VALUES ('140222', 3, '区县', 't', 'tzx', '天镇县', '140200', 'tianzhenxian');
INSERT INTO `ot_region` VALUES ('140223', 3, '区县', 'g', 'glx', '广灵县', '140200', 'guanglingxian');
INSERT INTO `ot_region` VALUES ('140224', 3, '区县', 'l', 'lqx', '灵丘县', '140200', 'lingqiuxian');
INSERT INTO `ot_region` VALUES ('140225', 3, '区县', 'h', 'hyx', '浑源县', '140200', 'hunyuanxian');
INSERT INTO `ot_region` VALUES ('140226', 3, '区县', 'z', 'zyx', '左云县', '140200', 'zuoyunxian');
INSERT INTO `ot_region` VALUES ('140300', 2, '城市', 'y', 'yqs', '阳泉市', '140000', 'yangquanshi');
INSERT INTO `ot_region` VALUES ('140302', 3, '区县', 'c', 'cq', '城区', '140300', 'chengqu');
INSERT INTO `ot_region` VALUES ('140303', 3, '区县', 'k', 'kq', '矿区', '140300', 'kuangqu');
INSERT INTO `ot_region` VALUES ('140311', 3, '区县', 'j', 'jq', '郊区', '140300', 'jiaoqu');
INSERT INTO `ot_region` VALUES ('140321', 3, '区县', 'p', 'pdx', '平定县', '140300', 'pingdingxian');
INSERT INTO `ot_region` VALUES ('140322', 3, '区县', 'y', 'yx', '盂县', '140300', 'yuxian');
INSERT INTO `ot_region` VALUES ('140400', 2, '城市', 'z', 'zzs', '长治市', '140000', 'zhangzhishi');
INSERT INTO `ot_region` VALUES ('140403', 3, '区县', 'l', 'lzq', '潞州区', '140400', 'luzhouqu');
INSERT INTO `ot_region` VALUES ('140404', 3, '区县', 's', 'sdq', '上党区', '140400', 'shangdangqu');
INSERT INTO `ot_region` VALUES ('140405', 3, '区县', 't', 'tlq', '屯留区', '140400', 'tunliuqu');
INSERT INTO `ot_region` VALUES ('140406', 3, '区县', 'l', 'lcq', '潞城区', '140400', 'luchengqu');
INSERT INTO `ot_region` VALUES ('140423', 3, '区县', 'x', 'xyx', '襄垣县', '140400', 'xiangyuanxian');
INSERT INTO `ot_region` VALUES ('140425', 3, '区县', 'p', 'psx', '平顺县', '140400', 'pingshunxian');
INSERT INTO `ot_region` VALUES ('140426', 3, '区县', 'l', 'lcx', '黎城县', '140400', 'lichengxian');
INSERT INTO `ot_region` VALUES ('140427', 3, '区县', 'h', 'hgx', '壶关县', '140400', 'huguanxian');
INSERT INTO `ot_region` VALUES ('140428', 3, '区县', 'z', 'zzx', '长子县', '140400', 'zhangzixian');
INSERT INTO `ot_region` VALUES ('140429', 3, '区县', 'w', 'wxx', '武乡县', '140400', 'wuxiangxian');
INSERT INTO `ot_region` VALUES ('140430', 3, '区县', 'q', 'qx', '沁县', '140400', 'qinxian');
INSERT INTO `ot_region` VALUES ('140431', 3, '区县', 'q', 'qyx', '沁源县', '140400', 'qinyuanxian');
INSERT INTO `ot_region` VALUES ('140500', 2, '城市', 'j', 'jcs', '晋城市', '140000', 'jinchengshi');
INSERT INTO `ot_region` VALUES ('140502', 3, '区县', 'c', 'cq', '城区', '140500', 'chengqu');
INSERT INTO `ot_region` VALUES ('140521', 3, '区县', 'q', 'qsx', '沁水县', '140500', 'qinshuixian');
INSERT INTO `ot_region` VALUES ('140522', 3, '区县', 'y', 'ycx', '阳城县', '140500', 'yangchengxian');
INSERT INTO `ot_region` VALUES ('140524', 3, '区县', 'l', 'lcx', '陵川县', '140500', 'lingchuanxian');
INSERT INTO `ot_region` VALUES ('140525', 3, '区县', 'z', 'zzx', '泽州县', '140500', 'zezhouxian');
INSERT INTO `ot_region` VALUES ('140581', 3, '区县', 'g', 'gps', '高平市', '140500', 'gaopingshi');
INSERT INTO `ot_region` VALUES ('140600', 2, '城市', 's', 'szs', '朔州市', '140000', 'shuozhoushi');
INSERT INTO `ot_region` VALUES ('140602', 3, '区县', 's', 'scq', '朔城区', '140600', 'shuochengqu');
INSERT INTO `ot_region` VALUES ('140603', 3, '区县', 'p', 'plq', '平鲁区', '140600', 'pingluqu');
INSERT INTO `ot_region` VALUES ('140621', 3, '区县', 's', 'syx', '山阴县', '140600', 'shanyinxian');
INSERT INTO `ot_region` VALUES ('140622', 3, '区县', 'y', 'yx', '应县', '140600', 'yingxian');
INSERT INTO `ot_region` VALUES ('140623', 3, '区县', 'y', 'yyx', '右玉县', '140600', 'youyuxian');
INSERT INTO `ot_region` VALUES ('140681', 3, '区县', 'h', 'hrs', '怀仁市', '140600', 'huairenshi');
INSERT INTO `ot_region` VALUES ('140700', 2, '城市', 'j', 'jzs', '晋中市', '140000', 'jinzhongshi');
INSERT INTO `ot_region` VALUES ('140702', 3, '区县', 'y', 'ycq', '榆次区', '140700', 'yuciqu');
INSERT INTO `ot_region` VALUES ('140721', 3, '区县', 'y', 'ysx', '榆社县', '140700', 'yushexian');
INSERT INTO `ot_region` VALUES ('140722', 3, '区县', 'z', 'zqx', '左权县', '140700', 'zuoquanxian');
INSERT INTO `ot_region` VALUES ('140723', 3, '区县', 'h', 'hsx', '和顺县', '140700', 'heshunxian');
INSERT INTO `ot_region` VALUES ('140724', 3, '区县', 'x', 'xyx', '昔阳县', '140700', 'xiyangxian');
INSERT INTO `ot_region` VALUES ('140725', 3, '区县', 's', 'syx', '寿阳县', '140700', 'shouyangxian');
INSERT INTO `ot_region` VALUES ('140726', 3, '区县', 't', 'tgx', '太谷县', '140700', 'taiguxian');
INSERT INTO `ot_region` VALUES ('140727', 3, '区县', 'q', 'qx', '祁县', '140700', 'qixian');
INSERT INTO `ot_region` VALUES ('140728', 3, '区县', 'p', 'pyx', '平遥县', '140700', 'pingyaoxian');
INSERT INTO `ot_region` VALUES ('140729', 3, '区县', 'l', 'lsx', '灵石县', '140700', 'lingshixian');
INSERT INTO `ot_region` VALUES ('140781', 3, '区县', 'j', 'jxs', '介休市', '140700', 'jiexiushi');
INSERT INTO `ot_region` VALUES ('140800', 2, '城市', 'y', 'ycs', '运城市', '140000', 'yunchengshi');
INSERT INTO `ot_region` VALUES ('140802', 3, '区县', 'y', 'yhq', '盐湖区', '140800', 'yanhuqu');
INSERT INTO `ot_region` VALUES ('140821', 3, '区县', 'l', 'lyx', '临猗县', '140800', 'linyixian');
INSERT INTO `ot_region` VALUES ('140822', 3, '区县', 'w', 'wrx', '万荣县', '140800', 'wanrongxian');
INSERT INTO `ot_region` VALUES ('140823', 3, '区县', 'w', 'wxx', '闻喜县', '140800', 'wenxixian');
INSERT INTO `ot_region` VALUES ('140824', 3, '区县', 'j', 'jsx', '稷山县', '140800', 'jishanxian');
INSERT INTO `ot_region` VALUES ('140825', 3, '区县', 'x', 'xjx', '新绛县', '140800', 'xinjiangxian');
INSERT INTO `ot_region` VALUES ('140826', 3, '区县', 'j', 'jx', '绛县', '140800', 'jiangxian');
INSERT INTO `ot_region` VALUES ('140827', 3, '区县', 'y', 'yqx', '垣曲县', '140800', 'yuanquxian');
INSERT INTO `ot_region` VALUES ('140828', 3, '区县', 'x', 'xx', '夏县', '140800', 'xiaxian');
INSERT INTO `ot_region` VALUES ('140829', 3, '区县', 'p', 'plx', '平陆县', '140800', 'pingluxian');
INSERT INTO `ot_region` VALUES ('140830', 3, '区县', 'r', 'rcx', '芮城县', '140800', 'ruichengxian');
INSERT INTO `ot_region` VALUES ('140881', 3, '区县', 'y', 'yjs', '永济市', '140800', 'yongjishi');
INSERT INTO `ot_region` VALUES ('140882', 3, '区县', 'h', 'hjs', '河津市', '140800', 'hejinshi');
INSERT INTO `ot_region` VALUES ('140900', 2, '城市', 'x', 'xzs', '忻州市', '140000', 'xinzhoushi');
INSERT INTO `ot_region` VALUES ('140902', 3, '区县', 'x', 'xfq', '忻府区', '140900', 'xinfuqu');
INSERT INTO `ot_region` VALUES ('140921', 3, '区县', 'd', 'dxx', '定襄县', '140900', 'dingxiangxian');
INSERT INTO `ot_region` VALUES ('140922', 3, '区县', 'w', 'wtx', '五台县', '140900', 'wutaixian');
INSERT INTO `ot_region` VALUES ('140923', 3, '区县', 'd', 'dx', '代县', '140900', 'daixian');
INSERT INTO `ot_region` VALUES ('140924', 3, '区县', 'f', 'fzx', '繁峙县', '140900', 'fanzhixian');
INSERT INTO `ot_region` VALUES ('140925', 3, '区县', 'n', 'nwx', '宁武县', '140900', 'ningwuxian');
INSERT INTO `ot_region` VALUES ('140926', 3, '区县', 'j', 'jlx', '静乐县', '140900', 'jinglexian');
INSERT INTO `ot_region` VALUES ('140927', 3, '区县', 's', 'scx', '神池县', '140900', 'shenchixian');
INSERT INTO `ot_region` VALUES ('140928', 3, '区县', 'w', 'wzx', '五寨县', '140900', 'wuzhaixian');
INSERT INTO `ot_region` VALUES ('140929', 3, '区县', 'k', 'klx', '岢岚县', '140900', 'kelanxian');
INSERT INTO `ot_region` VALUES ('140930', 3, '区县', 'h', 'hqx', '河曲县', '140900', 'hequxian');
INSERT INTO `ot_region` VALUES ('140931', 3, '区县', 'b', 'bdx', '保德县', '140900', 'baodexian');
INSERT INTO `ot_region` VALUES ('140932', 3, '区县', 'p', 'pgx', '偏关县', '140900', 'pianguanxian');
INSERT INTO `ot_region` VALUES ('140981', 3, '区县', 'y', 'yps', '原平市', '140900', 'yuanpingshi');
INSERT INTO `ot_region` VALUES ('141000', 2, '城市', 'l', 'lfs', '临汾市', '140000', 'linfenshi');
INSERT INTO `ot_region` VALUES ('141002', 3, '区县', 'y', 'ydq', '尧都区', '141000', 'yaodouqu');
INSERT INTO `ot_region` VALUES ('141021', 3, '区县', 'q', 'qwx', '曲沃县', '141000', 'quwoxian');
INSERT INTO `ot_region` VALUES ('141022', 3, '区县', 'y', 'ycx', '翼城县', '141000', 'yichengxian');
INSERT INTO `ot_region` VALUES ('141023', 3, '区县', 'x', 'xfx', '襄汾县', '141000', 'xiangfenxian');
INSERT INTO `ot_region` VALUES ('141024', 3, '区县', 'h', 'hdx', '洪洞县', '141000', 'hongdongxian');
INSERT INTO `ot_region` VALUES ('141025', 3, '区县', 'g', 'gx', '古县', '141000', 'guxian');
INSERT INTO `ot_region` VALUES ('141026', 3, '区县', 'a', 'azx', '安泽县', '141000', 'anzexian');
INSERT INTO `ot_region` VALUES ('141027', 3, '区县', 'f', 'fsx', '浮山县', '141000', 'fushanxian');
INSERT INTO `ot_region` VALUES ('141028', 3, '区县', 'j', 'jx', '吉县', '141000', 'jixian');
INSERT INTO `ot_region` VALUES ('141029', 3, '区县', 'x', 'xnx', '乡宁县', '141000', 'xiangningxian');
INSERT INTO `ot_region` VALUES ('141030', 3, '区县', 'd', 'dnx', '大宁县', '141000', 'daningxian');
INSERT INTO `ot_region` VALUES ('141031', 3, '区县', 'x', 'xx', '隰县', '141000', 'xixian');
INSERT INTO `ot_region` VALUES ('141032', 3, '区县', 'y', 'yhx', '永和县', '141000', 'yonghexian');
INSERT INTO `ot_region` VALUES ('141033', 3, '区县', 'p', 'px', '蒲县', '141000', 'puxian');
INSERT INTO `ot_region` VALUES ('141034', 3, '区县', 'f', 'fxx', '汾西县', '141000', 'fenxixian');
INSERT INTO `ot_region` VALUES ('141081', 3, '区县', 'h', 'hms', '侯马市', '141000', 'houmashi');
INSERT INTO `ot_region` VALUES ('141082', 3, '区县', 'h', 'hzs', '霍州市', '141000', 'huozhoushi');
INSERT INTO `ot_region` VALUES ('141100', 2, '城市', 'l', 'lls', '吕梁市', '140000', 'lu:liangshi');
INSERT INTO `ot_region` VALUES ('141102', 3, '区县', 'l', 'lsq', '离石区', '141100', 'lishiqu');
INSERT INTO `ot_region` VALUES ('141121', 3, '区县', 'w', 'wsx', '文水县', '141100', 'wenshuixian');
INSERT INTO `ot_region` VALUES ('141122', 3, '区县', 'j', 'jcx', '交城县', '141100', 'jiaochengxian');
INSERT INTO `ot_region` VALUES ('141123', 3, '区县', 'x', 'xx', '兴县', '141100', 'xingxian');
INSERT INTO `ot_region` VALUES ('141124', 3, '区县', 'l', 'lx', '临县', '141100', 'linxian');
INSERT INTO `ot_region` VALUES ('141125', 3, '区县', 'l', 'llx', '柳林县', '141100', 'liulinxian');
INSERT INTO `ot_region` VALUES ('141126', 3, '区县', 's', 'slx', '石楼县', '141100', 'shilouxian');
INSERT INTO `ot_region` VALUES ('141127', 3, '区县', 'l', 'lx', '岚县', '141100', 'lanxian');
INSERT INTO `ot_region` VALUES ('141128', 3, '区县', 'f', 'fsx', '方山县', '141100', 'fangshanxian');
INSERT INTO `ot_region` VALUES ('141129', 3, '区县', 'z', 'zyx', '中阳县', '141100', 'zhongyangxian');
INSERT INTO `ot_region` VALUES ('141130', 3, '区县', 'j', 'jkx', '交口县', '141100', 'jiaokouxian');
INSERT INTO `ot_region` VALUES ('141181', 3, '区县', 'x', 'xys', '孝义市', '141100', 'xiaoyishi');
INSERT INTO `ot_region` VALUES ('141182', 3, '区县', 'f', 'fys', '汾阳市', '141100', 'fenyangshi');
INSERT INTO `ot_region` VALUES ('150100', 2, '城市', 'h', 'hhhts', '呼和浩特市', '150000', 'huhehaoteshi');
INSERT INTO `ot_region` VALUES ('150102', 3, '区县', 'x', 'xcq', '新城区', '150100', 'xinchengqu');
INSERT INTO `ot_region` VALUES ('150103', 3, '区县', 'h', 'hmq', '回民区', '150100', 'huiminqu');
INSERT INTO `ot_region` VALUES ('150104', 3, '区县', 'y', 'yqq', '玉泉区', '150100', 'yuquanqu');
INSERT INTO `ot_region` VALUES ('150105', 3, '区县', 's', 'shq', '赛罕区', '150100', 'saihanqu');
INSERT INTO `ot_region` VALUES ('150121', 3, '区县', 't', 'tmtzq', '土默特左旗', '150100', 'tumotezuoqi');
INSERT INTO `ot_region` VALUES ('150122', 3, '区县', 't', 'tktx', '托克托县', '150100', 'tuoketuoxian');
INSERT INTO `ot_region` VALUES ('150123', 3, '区县', 'h', 'hlgex', '和林格尔县', '150100', 'helingeerxian');
INSERT INTO `ot_region` VALUES ('150124', 3, '区县', 'q', 'qshx', '清水河县', '150100', 'qingshuihexian');
INSERT INTO `ot_region` VALUES ('150125', 3, '区县', 'w', 'wcx', '武川县', '150100', 'wuchuanxian');
INSERT INTO `ot_region` VALUES ('150200', 2, '城市', 'b', 'bts', '包头市', '150000', 'baotoushi');
INSERT INTO `ot_region` VALUES ('150202', 3, '区县', 'd', 'dhq', '东河区', '150200', 'donghequ');
INSERT INTO `ot_region` VALUES ('150203', 3, '区县', 'k', 'kdlq', '昆都仑区', '150200', 'kundoulunqu');
INSERT INTO `ot_region` VALUES ('150204', 3, '区县', 'q', 'qsq', '青山区', '150200', 'qingshanqu');
INSERT INTO `ot_region` VALUES ('150205', 3, '区县', 's', 'sgq', '石拐区', '150200', 'shiguaiqu');
INSERT INTO `ot_region` VALUES ('150206', 3, '区县', 'b', 'byebkq', '白云鄂博矿区', '150200', 'baiyunebokuangqu');
INSERT INTO `ot_region` VALUES ('150207', 3, '区县', 'j', 'jyq', '九原区', '150200', 'jiuyuanqu');
INSERT INTO `ot_region` VALUES ('150221', 3, '区县', 't', 'tmtyq', '土默特右旗', '150200', 'tumoteyouqi');
INSERT INTO `ot_region` VALUES ('150222', 3, '区县', 'g', 'gyx', '固阳县', '150200', 'guyangxian');
INSERT INTO `ot_region` VALUES ('150223', 3, '区县', 'd', 'dehmmalhq', '达尔罕茂明安联合旗', '150200', 'daerhanmaominganlianheqi');
INSERT INTO `ot_region` VALUES ('150300', 2, '城市', 'w', 'whs', '乌海市', '150000', 'wuhaishi');
INSERT INTO `ot_region` VALUES ('150302', 3, '区县', 'h', 'hbwq', '海勃湾区', '150300', 'haibowanqu');
INSERT INTO `ot_region` VALUES ('150303', 3, '区县', 'h', 'hnq', '海南区', '150300', 'hainanqu');
INSERT INTO `ot_region` VALUES ('150304', 3, '区县', 'w', 'wdq', '乌达区', '150300', 'wudaqu');
INSERT INTO `ot_region` VALUES ('150400', 2, '城市', 'c', 'cfs', '赤峰市', '150000', 'chifengshi');
INSERT INTO `ot_region` VALUES ('150402', 3, '区县', 'h', 'hsq', '红山区', '150400', 'hongshanqu');
INSERT INTO `ot_region` VALUES ('150403', 3, '区县', 'y', 'ybsq', '元宝山区', '150400', 'yuanbaoshanqu');
INSERT INTO `ot_region` VALUES ('150404', 3, '区县', 's', 'ssq', '松山区', '150400', 'songshanqu');
INSERT INTO `ot_region` VALUES ('150421', 3, '区县', 'a', 'alkeqq', '阿鲁科尔沁旗', '150400', 'alukeerqinqi');
INSERT INTO `ot_region` VALUES ('150422', 3, '区县', 'b', 'blzq', '巴林左旗', '150400', 'balinzuoqi');
INSERT INTO `ot_region` VALUES ('150423', 3, '区县', 'b', 'blyq', '巴林右旗', '150400', 'balinyouqi');
INSERT INTO `ot_region` VALUES ('150424', 3, '区县', 'l', 'lxx', '林西县', '150400', 'linxixian');
INSERT INTO `ot_region` VALUES ('150425', 3, '区县', 'k', 'ksktq', '克什克腾旗', '150400', 'keshenketengqi');
INSERT INTO `ot_region` VALUES ('150426', 3, '区县', 'w', 'wntq', '翁牛特旗', '150400', 'wengniuteqi');
INSERT INTO `ot_region` VALUES ('150428', 3, '区县', 'k', 'klqq', '喀喇沁旗', '150400', 'kalaqinqi');
INSERT INTO `ot_region` VALUES ('150429', 3, '区县', 'n', 'ncx', '宁城县', '150400', 'ningchengxian');
INSERT INTO `ot_region` VALUES ('150430', 3, '区县', 'a', 'ahq', '敖汉旗', '150400', 'aohanqi');
INSERT INTO `ot_region` VALUES ('150500', 2, '城市', 't', 'tls', '通辽市', '150000', 'tongliaoshi');
INSERT INTO `ot_region` VALUES ('150502', 3, '区县', 'k', 'keqq', '科尔沁区', '150500', 'keerqinqu');
INSERT INTO `ot_region` VALUES ('150521', 3, '区县', 'k', 'keqzyzq', '科尔沁左翼中旗', '150500', 'keerqinzuoyizhongqi');
INSERT INTO `ot_region` VALUES ('150522', 3, '区县', 'k', 'keqzyhq', '科尔沁左翼后旗', '150500', 'keerqinzuoyihouqi');
INSERT INTO `ot_region` VALUES ('150523', 3, '区县', 'k', 'klx', '开鲁县', '150500', 'kailuxian');
INSERT INTO `ot_region` VALUES ('150524', 3, '区县', 'k', 'klq', '库伦旗', '150500', 'kulunqi');
INSERT INTO `ot_region` VALUES ('150525', 3, '区县', 'n', 'nmq', '奈曼旗', '150500', 'naimanqi');
INSERT INTO `ot_region` VALUES ('150526', 3, '区县', 'z', 'zltq', '扎鲁特旗', '150500', 'zhaluteqi');
INSERT INTO `ot_region` VALUES ('150581', 3, '区县', 'h', 'hlgls', '霍林郭勒市', '150500', 'huolinguoleshi');
INSERT INTO `ot_region` VALUES ('150600', 2, '城市', 'e', 'eedss', '鄂尔多斯市', '150000', 'eerduosishi');
INSERT INTO `ot_region` VALUES ('150602', 3, '区县', 'd', 'dsq', '东胜区', '150600', 'dongshengqu');
INSERT INTO `ot_region` VALUES ('150603', 3, '区县', 'k', 'kbsq', '康巴什区', '150600', 'kangbashenqu');
INSERT INTO `ot_region` VALUES ('150621', 3, '区县', 'd', 'dltq', '达拉特旗', '150600', 'dalateqi');
INSERT INTO `ot_region` VALUES ('150622', 3, '区县', 'z', 'zgeq', '准格尔旗', '150600', 'zhungeerqi');
INSERT INTO `ot_region` VALUES ('150623', 3, '区县', 'e', 'etkqq', '鄂托克前旗', '150600', 'etuokeqianqi');
INSERT INTO `ot_region` VALUES ('150624', 3, '区县', 'e', 'etkq', '鄂托克旗', '150600', 'etuokeqi');
INSERT INTO `ot_region` VALUES ('150625', 3, '区县', 'h', 'hjq', '杭锦旗', '150600', 'hangjinqi');
INSERT INTO `ot_region` VALUES ('150626', 3, '区县', 'w', 'wsq', '乌审旗', '150600', 'wushenqi');
INSERT INTO `ot_region` VALUES ('150627', 3, '区县', 'y', 'yjhlq', '伊金霍洛旗', '150600', 'yijinhuoluoqi');
INSERT INTO `ot_region` VALUES ('150700', 2, '城市', 'h', 'hlbes', '呼伦贝尔市', '150000', 'hulunbeiershi');
INSERT INTO `ot_region` VALUES ('150702', 3, '区县', 'h', 'hleq', '海拉尔区', '150700', 'hailaerqu');
INSERT INTO `ot_region` VALUES ('150703', 3, '区县', 'z', 'zlneq', '扎赉诺尔区', '150700', 'zhalainuoerqu');
INSERT INTO `ot_region` VALUES ('150721', 3, '区县', 'a', 'arq', '阿荣旗', '150700', 'arongqi');
INSERT INTO `ot_region` VALUES ('150722', 3, '区县', 'm', 'mldwdwezzzq', '莫力达瓦达斡尔族自治旗', '150700', 'molidawadawoerzuzizhiqi');
INSERT INTO `ot_region` VALUES ('150723', 3, '区县', 'e', 'elczzq', '鄂伦春自治旗', '150700', 'elunchunzizhiqi');
INSERT INTO `ot_region` VALUES ('150724', 3, '区县', 'e', 'ewkzzzq', '鄂温克族自治旗', '150700', 'ewenkezuzizhiqi');
INSERT INTO `ot_region` VALUES ('150725', 3, '区县', 'c', 'cbehq', '陈巴尔虎旗', '150700', 'chenbaerhuqi');
INSERT INTO `ot_region` VALUES ('150726', 3, '区县', 'x', 'xbehzq', '新巴尔虎左旗', '150700', 'xinbaerhuzuoqi');
INSERT INTO `ot_region` VALUES ('150727', 3, '区县', 'x', 'xbehyq', '新巴尔虎右旗', '150700', 'xinbaerhuyouqi');
INSERT INTO `ot_region` VALUES ('150781', 3, '区县', 'm', 'mzls', '满洲里市', '150700', 'manzhoulishi');
INSERT INTO `ot_region` VALUES ('150782', 3, '区县', 'y', 'ykss', '牙克石市', '150700', 'yakeshishi');
INSERT INTO `ot_region` VALUES ('150783', 3, '区县', 'z', 'zlts', '扎兰屯市', '150700', 'zhalantunshi');
INSERT INTO `ot_region` VALUES ('150784', 3, '区县', 'e', 'eegns', '额尔古纳市', '150700', 'eergunashi');
INSERT INTO `ot_region` VALUES ('150785', 3, '区县', 'g', 'ghs', '根河市', '150700', 'genheshi');
INSERT INTO `ot_region` VALUES ('150800', 2, '城市', 'b', 'bynes', '巴彦淖尔市', '150000', 'bayannaoershi');
INSERT INTO `ot_region` VALUES ('150802', 3, '区县', 'l', 'lhq', '临河区', '150800', 'linhequ');
INSERT INTO `ot_region` VALUES ('150821', 3, '区县', 'w', 'wyx', '五原县', '150800', 'wuyuanxian');
INSERT INTO `ot_region` VALUES ('150822', 3, '区县', 'd', 'dkx', '磴口县', '150800', 'dengkouxian');
INSERT INTO `ot_region` VALUES ('150823', 3, '区县', 'w', 'wltqq', '乌拉特前旗', '150800', 'wulateqianqi');
INSERT INTO `ot_region` VALUES ('150824', 3, '区县', 'w', 'wltzq', '乌拉特中旗', '150800', 'wulatezhongqi');
INSERT INTO `ot_region` VALUES ('150825', 3, '区县', 'w', 'wlthq', '乌拉特后旗', '150800', 'wulatehouqi');
INSERT INTO `ot_region` VALUES ('150826', 3, '区县', 'h', 'hjhq', '杭锦后旗', '150800', 'hangjinhouqi');
INSERT INTO `ot_region` VALUES ('150900', 2, '城市', 'w', 'wlcbs', '乌兰察布市', '150000', 'wulanchabushi');
INSERT INTO `ot_region` VALUES ('150902', 3, '区县', 'j', 'jnq', '集宁区', '150900', 'jiningqu');
INSERT INTO `ot_region` VALUES ('150921', 3, '区县', 'z', 'zzx', '卓资县', '150900', 'zhuozixian');
INSERT INTO `ot_region` VALUES ('150922', 3, '区县', 'h', 'hdx', '化德县', '150900', 'huadexian');
INSERT INTO `ot_region` VALUES ('150923', 3, '区县', 's', 'sdx', '商都县', '150900', 'shangdouxian');
INSERT INTO `ot_region` VALUES ('150924', 3, '区县', 'x', 'xhx', '兴和县', '150900', 'xinghexian');
INSERT INTO `ot_region` VALUES ('150925', 3, '区县', 'l', 'lcx', '凉城县', '150900', 'liangchengxian');
INSERT INTO `ot_region` VALUES ('150926', 3, '区县', 'c', 'cheyyqq', '察哈尔右翼前旗', '150900', 'chahaeryouyiqianqi');
INSERT INTO `ot_region` VALUES ('150927', 3, '区县', 'c', 'cheyyzq', '察哈尔右翼中旗', '150900', 'chahaeryouyizhongqi');
INSERT INTO `ot_region` VALUES ('150928', 3, '区县', 'c', 'cheyyhq', '察哈尔右翼后旗', '150900', 'chahaeryouyihouqi');
INSERT INTO `ot_region` VALUES ('150929', 3, '区县', 's', 'szwq', '四子王旗', '150900', 'siziwangqi');
INSERT INTO `ot_region` VALUES ('150981', 3, '区县', 'f', 'fzs', '丰镇市', '150900', 'fengzhenshi');
INSERT INTO `ot_region` VALUES ('152200', 2, '城市', 'x', 'xam', '兴安盟', '150000', 'xinganmeng');
INSERT INTO `ot_region` VALUES ('152201', 3, '区县', 'w', 'wlhts', '乌兰浩特市', '152200', 'wulanhaoteshi');
INSERT INTO `ot_region` VALUES ('152202', 3, '区县', 'a', 'aess', '阿尔山市', '152200', 'aershanshi');
INSERT INTO `ot_region` VALUES ('152221', 3, '区县', 'k', 'keqyyqq', '科尔沁右翼前旗', '152200', 'keerqinyouyiqianqi');
INSERT INTO `ot_region` VALUES ('152222', 3, '区县', 'k', 'keqyyzq', '科尔沁右翼中旗', '152200', 'keerqinyouyizhongqi');
INSERT INTO `ot_region` VALUES ('152223', 3, '区县', 'z', 'zltq', '扎赉特旗', '152200', 'zhalaiteqi');
INSERT INTO `ot_region` VALUES ('152224', 3, '区县', 't', 'tqx', '突泉县', '152200', 'tuquanxian');
INSERT INTO `ot_region` VALUES ('152500', 2, '城市', 'x', 'xlglm', '锡林郭勒盟', '150000', 'xilinguolemeng');
INSERT INTO `ot_region` VALUES ('152501', 3, '区县', 'e', 'elhts', '二连浩特市', '152500', 'erlianhaoteshi');
INSERT INTO `ot_region` VALUES ('152502', 3, '区县', 'x', 'xlhts', '锡林浩特市', '152500', 'xilinhaoteshi');
INSERT INTO `ot_region` VALUES ('152522', 3, '区县', 'a', 'abgq', '阿巴嘎旗', '152500', 'abagaqi');
INSERT INTO `ot_region` VALUES ('152523', 3, '区县', 's', 'sntzq', '苏尼特左旗', '152500', 'sunitezuoqi');
INSERT INTO `ot_region` VALUES ('152524', 3, '区县', 's', 'sntyq', '苏尼特右旗', '152500', 'suniteyouqi');
INSERT INTO `ot_region` VALUES ('152525', 3, '区县', 'd', 'dwzmqq', '东乌珠穆沁旗', '152500', 'dongwuzhumuqinqi');
INSERT INTO `ot_region` VALUES ('152526', 3, '区县', 'x', 'xwzmqq', '西乌珠穆沁旗', '152500', 'xiwuzhumuqinqi');
INSERT INTO `ot_region` VALUES ('152527', 3, '区县', 't', 'tpsq', '太仆寺旗', '152500', 'taipusiqi');
INSERT INTO `ot_region` VALUES ('152528', 3, '区县', 'x', 'xhq', '镶黄旗', '152500', 'xianghuangqi');
INSERT INTO `ot_region` VALUES ('152529', 3, '区县', 'z', 'zxbq', '正镶白旗', '152500', 'zhengxiangbaiqi');
INSERT INTO `ot_region` VALUES ('152530', 3, '区县', 'z', 'zlq', '正蓝旗', '152500', 'zhenglanqi');
INSERT INTO `ot_region` VALUES ('152531', 3, '区县', 'd', 'dlx', '多伦县', '152500', 'duolunxian');
INSERT INTO `ot_region` VALUES ('152900', 2, '城市', 'a', 'alsm', '阿拉善盟', '150000', 'alashanmeng');
INSERT INTO `ot_region` VALUES ('152921', 3, '区县', 'a', 'alszq', '阿拉善左旗', '152900', 'alashanzuoqi');
INSERT INTO `ot_region` VALUES ('152922', 3, '区县', 'a', 'alsyq', '阿拉善右旗', '152900', 'alashanyouqi');
INSERT INTO `ot_region` VALUES ('152923', 3, '区县', 'e', 'ejnq', '额济纳旗', '152900', 'ejinaqi');
INSERT INTO `ot_region` VALUES ('210100', 2, '城市', 's', 'sys', '沈阳市', '210000', 'shenyangshi');
INSERT INTO `ot_region` VALUES ('210102', 3, '区县', 'h', 'hpq', '和平区', '210100', 'hepingqu');
INSERT INTO `ot_region` VALUES ('210103', 3, '区县', 's', 'shq', '沈河区', '210100', 'shenhequ');
INSERT INTO `ot_region` VALUES ('210104', 3, '区县', 'd', 'ddq', '大东区', '210100', 'dadongqu');
INSERT INTO `ot_region` VALUES ('210105', 3, '区县', 'h', 'hgq', '皇姑区', '210100', 'huangguqu');
INSERT INTO `ot_region` VALUES ('210106', 3, '区县', 't', 'txq', '铁西区', '210100', 'tiexiqu');
INSERT INTO `ot_region` VALUES ('210111', 3, '区县', 's', 'sjtq', '苏家屯区', '210100', 'sujiatunqu');
INSERT INTO `ot_region` VALUES ('210112', 3, '区县', 'h', 'hnq', '浑南区', '210100', 'hunnanqu');
INSERT INTO `ot_region` VALUES ('210113', 3, '区县', 's', 'sbxq', '沈北新区', '210100', 'shenbeixinqu');
INSERT INTO `ot_region` VALUES ('210114', 3, '区县', 'y', 'yhq', '于洪区', '210100', 'yuhongqu');
INSERT INTO `ot_region` VALUES ('210115', 3, '区县', 'l', 'lzq', '辽中区', '210100', 'liaozhongqu');
INSERT INTO `ot_region` VALUES ('210123', 3, '区县', 'k', 'kpx', '康平县', '210100', 'kangpingxian');
INSERT INTO `ot_region` VALUES ('210124', 3, '区县', 'f', 'fkx', '法库县', '210100', 'fakuxian');
INSERT INTO `ot_region` VALUES ('210181', 3, '区县', 'x', 'xms', '新民市', '210100', 'xinminshi');
INSERT INTO `ot_region` VALUES ('210190', 3, '区县', 'j', 'jjjskfq', '经济技术开发区', '210100', 'jingjijishukaifaqu');
INSERT INTO `ot_region` VALUES ('210200', 2, '城市', 'd', 'dls', '大连市', '210000', 'dalianshi');
INSERT INTO `ot_region` VALUES ('210202', 3, '区县', 'z', 'zsq', '中山区', '210200', 'zhongshanqu');
INSERT INTO `ot_region` VALUES ('210203', 3, '区县', 'x', 'xgq', '西岗区', '210200', 'xigangqu');
INSERT INTO `ot_region` VALUES ('210204', 3, '区县', 's', 'shkq', '沙河口区', '210200', 'shahekouqu');
INSERT INTO `ot_region` VALUES ('210211', 3, '区县', 'g', 'gjzq', '甘井子区', '210200', 'ganjingziqu');
INSERT INTO `ot_region` VALUES ('210212', 3, '区县', 'l', 'lskq', '旅顺口区', '210200', 'lu:shunkouqu');
INSERT INTO `ot_region` VALUES ('210213', 3, '区县', 'j', 'jzq', '金州区', '210200', 'jinzhouqu');
INSERT INTO `ot_region` VALUES ('210214', 3, '区县', 'p', 'pldq', '普兰店区', '210200', 'pulandianqu');
INSERT INTO `ot_region` VALUES ('210224', 3, '区县', 'z', 'zhx', '长海县', '210200', 'zhanghaixian');
INSERT INTO `ot_region` VALUES ('210281', 3, '区县', 'w', 'wfds', '瓦房店市', '210200', 'wafangdianshi');
INSERT INTO `ot_region` VALUES ('210283', 3, '区县', 'z', 'zhs', '庄河市', '210200', 'zhuangheshi');
INSERT INTO `ot_region` VALUES ('210300', 2, '城市', 'a', 'ass', '鞍山市', '210000', 'anshanshi');
INSERT INTO `ot_region` VALUES ('210302', 3, '区县', 't', 'tdq', '铁东区', '210300', 'tiedongqu');
INSERT INTO `ot_region` VALUES ('210303', 3, '区县', 't', 'txq', '铁西区', '210300', 'tiexiqu');
INSERT INTO `ot_region` VALUES ('210304', 3, '区县', 'l', 'lsq', '立山区', '210300', 'lishanqu');
INSERT INTO `ot_region` VALUES ('210311', 3, '区县', 'q', 'qsq', '千山区', '210300', 'qianshanqu');
INSERT INTO `ot_region` VALUES ('210321', 3, '区县', 't', 'tax', '台安县', '210300', 'taianxian');
INSERT INTO `ot_region` VALUES ('210323', 3, '区县', 'x', 'xymzzzx', '岫岩满族自治县', '210300', 'xiuyanmanzuzizhixian');
INSERT INTO `ot_region` VALUES ('210381', 3, '区县', 'h', 'hcs', '海城市', '210300', 'haichengshi');
INSERT INTO `ot_region` VALUES ('210390', 3, '区县', 'g', 'gxq', '高新区', '210300', 'gaoxinqu');
INSERT INTO `ot_region` VALUES ('210400', 2, '城市', 'f', 'fss', '抚顺市', '210000', 'fushunshi');
INSERT INTO `ot_region` VALUES ('210402', 3, '区县', 'x', 'xfq', '新抚区', '210400', 'xinfuqu');
INSERT INTO `ot_region` VALUES ('210403', 3, '区县', 'd', 'dzq', '东洲区', '210400', 'dongzhouqu');
INSERT INTO `ot_region` VALUES ('210404', 3, '区县', 'w', 'whq', '望花区', '210400', 'wanghuaqu');
INSERT INTO `ot_region` VALUES ('210411', 3, '区县', 's', 'scq', '顺城区', '210400', 'shunchengqu');
INSERT INTO `ot_region` VALUES ('210421', 3, '区县', 'f', 'fsx', '抚顺县', '210400', 'fushunxian');
INSERT INTO `ot_region` VALUES ('210422', 3, '区县', 'x', 'xbmzzzx', '新宾满族自治县', '210400', 'xinbinmanzuzizhixian');
INSERT INTO `ot_region` VALUES ('210423', 3, '区县', 'q', 'qymzzzx', '清原满族自治县', '210400', 'qingyuanmanzuzizhixian');
INSERT INTO `ot_region` VALUES ('210500', 2, '城市', 'b', 'bxs', '本溪市', '210000', 'benxishi');
INSERT INTO `ot_region` VALUES ('210502', 3, '区县', 'p', 'psq', '平山区', '210500', 'pingshanqu');
INSERT INTO `ot_region` VALUES ('210503', 3, '区县', 'x', 'xhq', '溪湖区', '210500', 'xihuqu');
INSERT INTO `ot_region` VALUES ('210504', 3, '区县', 'm', 'msq', '明山区', '210500', 'mingshanqu');
INSERT INTO `ot_region` VALUES ('210505', 3, '区县', 'n', 'nfq', '南芬区', '210500', 'nanfenqu');
INSERT INTO `ot_region` VALUES ('210521', 3, '区县', 'b', 'bxmzzzx', '本溪满族自治县', '210500', 'benximanzuzizhixian');
INSERT INTO `ot_region` VALUES ('210522', 3, '区县', 'h', 'hrmzzzx', '桓仁满族自治县', '210500', 'huanrenmanzuzizhixian');
INSERT INTO `ot_region` VALUES ('210600', 2, '城市', 'd', 'dds', '丹东市', '210000', 'dandongshi');
INSERT INTO `ot_region` VALUES ('210602', 3, '区县', 'y', 'ybq', '元宝区', '210600', 'yuanbaoqu');
INSERT INTO `ot_region` VALUES ('210603', 3, '区县', 'z', 'zxq', '振兴区', '210600', 'zhenxingqu');
INSERT INTO `ot_region` VALUES ('210604', 3, '区县', 'z', 'zaq', '振安区', '210600', 'zhenanqu');
INSERT INTO `ot_region` VALUES ('210624', 3, '区县', 'k', 'kdmzzzx', '宽甸满族自治县', '210600', 'kuandianmanzuzizhixian');
INSERT INTO `ot_region` VALUES ('210681', 3, '区县', 'd', 'dgs', '东港市', '210600', 'donggangshi');
INSERT INTO `ot_region` VALUES ('210682', 3, '区县', 'f', 'fcs', '凤城市', '210600', 'fengchengshi');
INSERT INTO `ot_region` VALUES ('210700', 2, '城市', 'j', 'jzs', '锦州市', '210000', 'jinzhoushi');
INSERT INTO `ot_region` VALUES ('210702', 3, '区县', 'g', 'gtq', '古塔区', '210700', 'gutaqu');
INSERT INTO `ot_region` VALUES ('210703', 3, '区县', 'l', 'lhq', '凌河区', '210700', 'linghequ');
INSERT INTO `ot_region` VALUES ('210711', 3, '区县', 't', 'thq', '太和区', '210700', 'taihequ');
INSERT INTO `ot_region` VALUES ('210726', 3, '区县', 'h', 'hsx', '黑山县', '210700', 'heishanxian');
INSERT INTO `ot_region` VALUES ('210727', 3, '区县', 'y', 'yx', '义县', '210700', 'yixian');
INSERT INTO `ot_region` VALUES ('210781', 3, '区县', 'l', 'lhs', '凌海市', '210700', 'linghaishi');
INSERT INTO `ot_region` VALUES ('210782', 3, '区县', 'b', 'bzs', '北镇市', '210700', 'beizhenshi');
INSERT INTO `ot_region` VALUES ('210793', 3, '区县', 'j', 'jjjskfq', '经济技术开发区', '210700', 'jingjijishukaifaqu');
INSERT INTO `ot_region` VALUES ('210800', 2, '城市', 'y', 'yks', '营口市', '210000', 'yingkoushi');
INSERT INTO `ot_region` VALUES ('210802', 3, '区县', 'z', 'zqq', '站前区', '210800', 'zhanqianqu');
INSERT INTO `ot_region` VALUES ('210803', 3, '区县', 'x', 'xsq', '西市区', '210800', 'xishiqu');
INSERT INTO `ot_region` VALUES ('210804', 3, '区县', 'b', 'byqq', '鲅鱼圈区', '210800', 'bayuquanqu');
INSERT INTO `ot_region` VALUES ('210811', 3, '区县', 'l', 'lbq', '老边区', '210800', 'laobianqu');
INSERT INTO `ot_region` VALUES ('210881', 3, '区县', 'g', 'gzs', '盖州市', '210800', 'gaizhoushi');
INSERT INTO `ot_region` VALUES ('210882', 3, '区县', 'd', 'dsqs', '大石桥市', '210800', 'dashiqiaoshi');
INSERT INTO `ot_region` VALUES ('210900', 2, '城市', 'f', 'fxs', '阜新市', '210000', 'fuxinshi');
INSERT INTO `ot_region` VALUES ('210902', 3, '区县', 'h', 'hzq', '海州区', '210900', 'haizhouqu');
INSERT INTO `ot_region` VALUES ('210903', 3, '区县', 'x', 'xqq', '新邱区', '210900', 'xinqiuqu');
INSERT INTO `ot_region` VALUES ('210904', 3, '区县', 't', 'tpq', '太平区', '210900', 'taipingqu');
INSERT INTO `ot_region` VALUES ('210905', 3, '区县', 'q', 'qhmq', '清河门区', '210900', 'qinghemenqu');
INSERT INTO `ot_region` VALUES ('210911', 3, '区县', 'x', 'xhq', '细河区', '210900', 'xihequ');
INSERT INTO `ot_region` VALUES ('210921', 3, '区县', 'f', 'fxmgzzzx', '阜新蒙古族自治县', '210900', 'fuxinmengguzuzizhixian');
INSERT INTO `ot_region` VALUES ('210922', 3, '区县', 'z', 'zwx', '彰武县', '210900', 'zhangwuxian');
INSERT INTO `ot_region` VALUES ('211000', 2, '城市', 'l', 'lys', '辽阳市', '210000', 'liaoyangshi');
INSERT INTO `ot_region` VALUES ('211002', 3, '区县', 'b', 'btq', '白塔区', '211000', 'baitaqu');
INSERT INTO `ot_region` VALUES ('211003', 3, '区县', 'w', 'wsq', '文圣区', '211000', 'wenshengqu');
INSERT INTO `ot_region` VALUES ('211004', 3, '区县', 'h', 'hwq', '宏伟区', '211000', 'hongweiqu');
INSERT INTO `ot_region` VALUES ('211005', 3, '区县', 'g', 'gzlq', '弓长岭区', '211000', 'gongzhanglingqu');
INSERT INTO `ot_region` VALUES ('211011', 3, '区县', 't', 'tzhq', '太子河区', '211000', 'taizihequ');
INSERT INTO `ot_region` VALUES ('211021', 3, '区县', 'l', 'lyx', '辽阳县', '211000', 'liaoyangxian');
INSERT INTO `ot_region` VALUES ('211081', 3, '区县', 'd', 'dts', '灯塔市', '211000', 'dengtashi');
INSERT INTO `ot_region` VALUES ('211100', 2, '城市', 'p', 'pjs', '盘锦市', '210000', 'panjinshi');
INSERT INTO `ot_region` VALUES ('211102', 3, '区县', 's', 'stzq', '双台子区', '211100', 'shuangtaiziqu');
INSERT INTO `ot_region` VALUES ('211103', 3, '区县', 'x', 'xltq', '兴隆台区', '211100', 'xinglongtaiqu');
INSERT INTO `ot_region` VALUES ('211104', 3, '区县', 'd', 'dwq', '大洼区', '211100', 'dawaqu');
INSERT INTO `ot_region` VALUES ('211122', 3, '区县', 'p', 'psx', '盘山县', '211100', 'panshanxian');
INSERT INTO `ot_region` VALUES ('211200', 2, '城市', 't', 'tls', '铁岭市', '210000', 'tielingshi');
INSERT INTO `ot_region` VALUES ('211202', 3, '区县', 'y', 'yzq', '银州区', '211200', 'yinzhouqu');
INSERT INTO `ot_region` VALUES ('211204', 3, '区县', 'q', 'qhq', '清河区', '211200', 'qinghequ');
INSERT INTO `ot_region` VALUES ('211221', 3, '区县', 't', 'tlx', '铁岭县', '211200', 'tielingxian');
INSERT INTO `ot_region` VALUES ('211223', 3, '区县', 'x', 'xfx', '西丰县', '211200', 'xifengxian');
INSERT INTO `ot_region` VALUES ('211224', 3, '区县', 'c', 'ctx', '昌图县', '211200', 'changtuxian');
INSERT INTO `ot_region` VALUES ('211281', 3, '区县', 'd', 'dbss', '调兵山市', '211200', 'diaobingshanshi');
INSERT INTO `ot_region` VALUES ('211282', 3, '区县', 'k', 'kys', '开原市', '211200', 'kaiyuanshi');
INSERT INTO `ot_region` VALUES ('211300', 2, '城市', 'c', 'cys', '朝阳市', '210000', 'chaoyangshi');
INSERT INTO `ot_region` VALUES ('211302', 3, '区县', 's', 'stq', '双塔区', '211300', 'shuangtaqu');
INSERT INTO `ot_region` VALUES ('211303', 3, '区县', 'l', 'lcq', '龙城区', '211300', 'longchengqu');
INSERT INTO `ot_region` VALUES ('211321', 3, '区县', 'c', 'cyx', '朝阳县', '211300', 'chaoyangxian');
INSERT INTO `ot_region` VALUES ('211322', 3, '区县', 'j', 'jpx', '建平县', '211300', 'jianpingxian');
INSERT INTO `ot_region` VALUES ('211324', 3, '区县', 'k', 'klqzymgzzzx', '喀喇沁左翼蒙古族自治县', '211300', 'kalaqinzuoyimengguzuzizhixian');
INSERT INTO `ot_region` VALUES ('211381', 3, '区县', 'b', 'bps', '北票市', '211300', 'beipiaoshi');
INSERT INTO `ot_region` VALUES ('211382', 3, '区县', 'l', 'lys', '凌源市', '211300', 'lingyuanshi');
INSERT INTO `ot_region` VALUES ('211400', 2, '城市', 'h', 'hlds', '葫芦岛市', '210000', 'huludaoshi');
INSERT INTO `ot_region` VALUES ('211402', 3, '区县', 'l', 'lsq', '连山区', '211400', 'lianshanqu');
INSERT INTO `ot_region` VALUES ('211403', 3, '区县', 'l', 'lgq', '龙港区', '211400', 'longgangqu');
INSERT INTO `ot_region` VALUES ('211404', 3, '区县', 'n', 'npq', '南票区', '211400', 'nanpiaoqu');
INSERT INTO `ot_region` VALUES ('211421', 3, '区县', 's', 'szx', '绥中县', '211400', 'suizhongxian');
INSERT INTO `ot_region` VALUES ('211422', 3, '区县', 'j', 'jcx', '建昌县', '211400', 'jianchangxian');
INSERT INTO `ot_region` VALUES ('211481', 3, '区县', 'x', 'xcs', '兴城市', '211400', 'xingchengshi');
INSERT INTO `ot_region` VALUES ('220100', 2, '城市', 'z', 'zcs', '长春市', '220000', 'zhangchunshi');
INSERT INTO `ot_region` VALUES ('220102', 3, '区县', 'n', 'ngq', '南关区', '220100', 'nanguanqu');
INSERT INTO `ot_region` VALUES ('220103', 3, '区县', 'k', 'kcq', '宽城区', '220100', 'kuanchengqu');
INSERT INTO `ot_region` VALUES ('220104', 3, '区县', 'c', 'cyq', '朝阳区', '220100', 'chaoyangqu');
INSERT INTO `ot_region` VALUES ('220105', 3, '区县', 'e', 'edq', '二道区', '220100', 'erdaoqu');
INSERT INTO `ot_region` VALUES ('220106', 3, '区县', 'l', 'lyq', '绿园区', '220100', 'lu:yuanqu');
INSERT INTO `ot_region` VALUES ('220112', 3, '区县', 's', 'syq', '双阳区', '220100', 'shuangyangqu');
INSERT INTO `ot_region` VALUES ('220113', 3, '区县', 'j', 'jtq', '九台区', '220100', 'jiutaiqu');
INSERT INTO `ot_region` VALUES ('220122', 3, '区县', 'n', 'nax', '农安县', '220100', 'nonganxian');
INSERT INTO `ot_region` VALUES ('220182', 3, '区县', 'y', 'yss', '榆树市', '220100', 'yushushi');
INSERT INTO `ot_region` VALUES ('220183', 3, '区县', 'd', 'dhs', '德惠市', '220100', 'dehuishi');
INSERT INTO `ot_region` VALUES ('220192', 3, '区县', 'j', 'jjjskfq', '经济技术开发区', '220100', 'jingjijishukaifaqu');
INSERT INTO `ot_region` VALUES ('220200', 2, '城市', 'j', 'jls', '吉林市', '220000', 'jilinshi');
INSERT INTO `ot_region` VALUES ('220202', 3, '区县', 'c', 'cyq', '昌邑区', '220200', 'changyiqu');
INSERT INTO `ot_region` VALUES ('220203', 3, '区县', 'l', 'ltq', '龙潭区', '220200', 'longtanqu');
INSERT INTO `ot_region` VALUES ('220204', 3, '区县', 'c', 'cyq', '船营区', '220200', 'chuanyingqu');
INSERT INTO `ot_region` VALUES ('220211', 3, '区县', 'f', 'fmq', '丰满区', '220200', 'fengmanqu');
INSERT INTO `ot_region` VALUES ('220221', 3, '区县', 'y', 'yjx', '永吉县', '220200', 'yongjixian');
INSERT INTO `ot_region` VALUES ('220281', 3, '区县', 'j', 'jhs', '蛟河市', '220200', 'jiaoheshi');
INSERT INTO `ot_region` VALUES ('220282', 3, '区县', 'h', 'hds', '桦甸市', '220200', 'huadianshi');
INSERT INTO `ot_region` VALUES ('220283', 3, '区县', 's', 'sls', '舒兰市', '220200', 'shulanshi');
INSERT INTO `ot_region` VALUES ('220284', 3, '区县', 'p', 'pss', '磐石市', '220200', 'panshishi');
INSERT INTO `ot_region` VALUES ('220300', 2, '城市', 's', 'sps', '四平市', '220000', 'sipingshi');
INSERT INTO `ot_region` VALUES ('220302', 3, '区县', 't', 'txq', '铁西区', '220300', 'tiexiqu');
INSERT INTO `ot_region` VALUES ('220303', 3, '区县', 't', 'tdq', '铁东区', '220300', 'tiedongqu');
INSERT INTO `ot_region` VALUES ('220322', 3, '区县', 'l', 'lsx', '梨树县', '220300', 'lishuxian');
INSERT INTO `ot_region` VALUES ('220323', 3, '区县', 'y', 'ytmzzzx', '伊通满族自治县', '220300', 'yitongmanzuzizhixian');
INSERT INTO `ot_region` VALUES ('220381', 3, '区县', 'g', 'gzls', '公主岭市', '220300', 'gongzhulingshi');
INSERT INTO `ot_region` VALUES ('220382', 3, '区县', 's', 'sls', '双辽市', '220300', 'shuangliaoshi');
INSERT INTO `ot_region` VALUES ('220400', 2, '城市', 'l', 'lys', '辽源市', '220000', 'liaoyuanshi');
INSERT INTO `ot_region` VALUES ('220402', 3, '区县', 'l', 'lsq', '龙山区', '220400', 'longshanqu');
INSERT INTO `ot_region` VALUES ('220403', 3, '区县', 'x', 'xaq', '西安区', '220400', 'xianqu');
INSERT INTO `ot_region` VALUES ('220421', 3, '区县', 'd', 'dfx', '东丰县', '220400', 'dongfengxian');
INSERT INTO `ot_region` VALUES ('220422', 3, '区县', 'd', 'dlx', '东辽县', '220400', 'dongliaoxian');
INSERT INTO `ot_region` VALUES ('220500', 2, '城市', 't', 'ths', '通化市', '220000', 'tonghuashi');
INSERT INTO `ot_region` VALUES ('220502', 3, '区县', 'd', 'dcq', '东昌区', '220500', 'dongchangqu');
INSERT INTO `ot_region` VALUES ('220503', 3, '区县', 'e', 'edjq', '二道江区', '220500', 'erdaojiangqu');
INSERT INTO `ot_region` VALUES ('220521', 3, '区县', 't', 'thx', '通化县', '220500', 'tonghuaxian');
INSERT INTO `ot_region` VALUES ('220523', 3, '区县', 'h', 'hnx', '辉南县', '220500', 'huinanxian');
INSERT INTO `ot_region` VALUES ('220524', 3, '区县', 'l', 'lhx', '柳河县', '220500', 'liuhexian');
INSERT INTO `ot_region` VALUES ('220581', 3, '区县', 'm', 'mhks', '梅河口市', '220500', 'meihekoushi');
INSERT INTO `ot_region` VALUES ('220582', 3, '区县', 'j', 'jas', '集安市', '220500', 'jianshi');
INSERT INTO `ot_region` VALUES ('220600', 2, '城市', 'b', 'bss', '白山市', '220000', 'baishanshi');
INSERT INTO `ot_region` VALUES ('220602', 3, '区县', 'h', 'hjq', '浑江区', '220600', 'hunjiangqu');
INSERT INTO `ot_region` VALUES ('220605', 3, '区县', 'j', 'jyq', '江源区', '220600', 'jiangyuanqu');
INSERT INTO `ot_region` VALUES ('220621', 3, '区县', 'f', 'fsx', '抚松县', '220600', 'fusongxian');
INSERT INTO `ot_region` VALUES ('220622', 3, '区县', 'j', 'jyx', '靖宇县', '220600', 'jingyuxian');
INSERT INTO `ot_region` VALUES ('220623', 3, '区县', 'z', 'zbcxzzzx', '长白朝鲜族自治县', '220600', 'zhangbaichaoxianzuzizhixian');
INSERT INTO `ot_region` VALUES ('220681', 3, '区县', 'l', 'ljs', '临江市', '220600', 'linjiangshi');
INSERT INTO `ot_region` VALUES ('220700', 2, '城市', 's', 'sys', '松原市', '220000', 'songyuanshi');
INSERT INTO `ot_region` VALUES ('220702', 3, '区县', 'n', 'njq', '宁江区', '220700', 'ningjiangqu');
INSERT INTO `ot_region` VALUES ('220721', 3, '区县', 'q', 'qgelsmgzzzx', '前郭尔罗斯蒙古族自治县', '220700', 'qianguoerluosimengguzuzizhixian');
INSERT INTO `ot_region` VALUES ('220722', 3, '区县', 'z', 'zlx', '长岭县', '220700', 'zhanglingxian');
INSERT INTO `ot_region` VALUES ('220723', 3, '区县', 'q', 'qax', '乾安县', '220700', 'qiananxian');
INSERT INTO `ot_region` VALUES ('220781', 3, '区县', 'f', 'fys', '扶余市', '220700', 'fuyushi');
INSERT INTO `ot_region` VALUES ('220800', 2, '城市', 'b', 'bcs', '白城市', '220000', 'baichengshi');
INSERT INTO `ot_region` VALUES ('220802', 3, '区县', 't', 'tbq', '洮北区', '220800', 'taobeiqu');
INSERT INTO `ot_region` VALUES ('220821', 3, '区县', 'z', 'zlx', '镇赉县', '220800', 'zhenlaixian');
INSERT INTO `ot_region` VALUES ('220822', 3, '区县', 't', 'tyx', '通榆县', '220800', 'tongyuxian');
INSERT INTO `ot_region` VALUES ('220881', 3, '区县', 't', 'tns', '洮南市', '220800', 'taonanshi');
INSERT INTO `ot_region` VALUES ('220882', 3, '区县', 'd', 'das', '大安市', '220800', 'daanshi');
INSERT INTO `ot_region` VALUES ('222400', 2, '城市', 'y', 'ybcxzzzz', '延边朝鲜族自治州', '220000', 'yanbianchaoxianzuzizhizhou');
INSERT INTO `ot_region` VALUES ('222401', 3, '区县', 'y', 'yjs', '延吉市', '222400', 'yanjishi');
INSERT INTO `ot_region` VALUES ('222402', 3, '区县', 't', 'tms', '图们市', '222400', 'tumenshi');
INSERT INTO `ot_region` VALUES ('222403', 3, '区县', 'd', 'dhs', '敦化市', '222400', 'dunhuashi');
INSERT INTO `ot_region` VALUES ('222404', 3, '区县', 'h', 'hcs', '珲春市', '222400', 'hunchunshi');
INSERT INTO `ot_region` VALUES ('222405', 3, '区县', 'l', 'ljs', '龙井市', '222400', 'longjingshi');
INSERT INTO `ot_region` VALUES ('222406', 3, '区县', 'h', 'hls', '和龙市', '222400', 'helongshi');
INSERT INTO `ot_region` VALUES ('222424', 3, '区县', 'w', 'wqx', '汪清县', '222400', 'wangqingxian');
INSERT INTO `ot_region` VALUES ('222426', 3, '区县', 'a', 'atx', '安图县', '222400', 'antuxian');
INSERT INTO `ot_region` VALUES ('230100', 2, '城市', 'h', 'hebs', '哈尔滨市', '230000', 'haerbinshi');
INSERT INTO `ot_region` VALUES ('230102', 3, '区县', 'd', 'dlq', '道里区', '230100', 'daoliqu');
INSERT INTO `ot_region` VALUES ('230103', 3, '区县', 'n', 'ngq', '南岗区', '230100', 'nangangqu');
INSERT INTO `ot_region` VALUES ('230104', 3, '区县', 'd', 'dwq', '道外区', '230100', 'daowaiqu');
INSERT INTO `ot_region` VALUES ('230108', 3, '区县', 'p', 'pfq', '平房区', '230100', 'pingfangqu');
INSERT INTO `ot_region` VALUES ('230109', 3, '区县', 's', 'sbq', '松北区', '230100', 'songbeiqu');
INSERT INTO `ot_region` VALUES ('230110', 3, '区县', 'x', 'xfq', '香坊区', '230100', 'xiangfangqu');
INSERT INTO `ot_region` VALUES ('230111', 3, '区县', 'h', 'hlq', '呼兰区', '230100', 'hulanqu');
INSERT INTO `ot_region` VALUES ('230112', 3, '区县', 'a', 'acq', '阿城区', '230100', 'achengqu');
INSERT INTO `ot_region` VALUES ('230113', 3, '区县', 's', 'scq', '双城区', '230100', 'shuangchengqu');
INSERT INTO `ot_region` VALUES ('230123', 3, '区县', 'y', 'ylx', '依兰县', '230100', 'yilanxian');
INSERT INTO `ot_region` VALUES ('230124', 3, '区县', 'f', 'fzx', '方正县', '230100', 'fangzhengxian');
INSERT INTO `ot_region` VALUES ('230125', 3, '区县', 'b', 'bx', '宾县', '230100', 'binxian');
INSERT INTO `ot_region` VALUES ('230126', 3, '区县', 'b', 'byx', '巴彦县', '230100', 'bayanxian');
INSERT INTO `ot_region` VALUES ('230127', 3, '区县', 'm', 'mlx', '木兰县', '230100', 'mulanxian');
INSERT INTO `ot_region` VALUES ('230128', 3, '区县', 't', 'thx', '通河县', '230100', 'tonghexian');
INSERT INTO `ot_region` VALUES ('230129', 3, '区县', 'y', 'ysx', '延寿县', '230100', 'yanshouxian');
INSERT INTO `ot_region` VALUES ('230183', 3, '区县', 's', 'szs', '尚志市', '230100', 'shangzhishi');
INSERT INTO `ot_region` VALUES ('230184', 3, '区县', 'w', 'wcs', '五常市', '230100', 'wuchangshi');
INSERT INTO `ot_region` VALUES ('230200', 2, '城市', 'q', 'qqhes', '齐齐哈尔市', '230000', 'qiqihaershi');
INSERT INTO `ot_region` VALUES ('230202', 3, '区县', 'l', 'lsq', '龙沙区', '230200', 'longshaqu');
INSERT INTO `ot_region` VALUES ('230203', 3, '区县', 'j', 'jhq', '建华区', '230200', 'jianhuaqu');
INSERT INTO `ot_region` VALUES ('230204', 3, '区县', 't', 'tfq', '铁锋区', '230200', 'tiefengqu');
INSERT INTO `ot_region` VALUES ('230205', 3, '区县', 'a', 'aaxq', '昂昂溪区', '230200', 'angangxiqu');
INSERT INTO `ot_region` VALUES ('230206', 3, '区县', 'f', 'flejq', '富拉尔基区', '230200', 'fulaerjiqu');
INSERT INTO `ot_region` VALUES ('230207', 3, '区县', 'n', 'nzsq', '碾子山区', '230200', 'nianzishanqu');
INSERT INTO `ot_region` VALUES ('230208', 3, '区县', 'm', 'mlsdwezq', '梅里斯达斡尔族区', '230200', 'meilisidawoerzuqu');
INSERT INTO `ot_region` VALUES ('230221', 3, '区县', 'l', 'ljx', '龙江县', '230200', 'longjiangxian');
INSERT INTO `ot_region` VALUES ('230223', 3, '区县', 'y', 'yax', '依安县', '230200', 'yianxian');
INSERT INTO `ot_region` VALUES ('230224', 3, '区县', 't', 'tlx', '泰来县', '230200', 'tailaixian');
INSERT INTO `ot_region` VALUES ('230225', 3, '区县', 'g', 'gnx', '甘南县', '230200', 'gannanxian');
INSERT INTO `ot_region` VALUES ('230227', 3, '区县', 'f', 'fyx', '富裕县', '230200', 'fuyuxian');
INSERT INTO `ot_region` VALUES ('230229', 3, '区县', 'k', 'ksx', '克山县', '230200', 'keshanxian');
INSERT INTO `ot_region` VALUES ('230230', 3, '区县', 'k', 'kdx', '克东县', '230200', 'kedongxian');
INSERT INTO `ot_region` VALUES ('230231', 3, '区县', 'b', 'bqx', '拜泉县', '230200', 'baiquanxian');
INSERT INTO `ot_region` VALUES ('230281', 3, '区县', 'n', 'nhs', '讷河市', '230200', 'neheshi');
INSERT INTO `ot_region` VALUES ('230300', 2, '城市', 'j', 'jxs', '鸡西市', '230000', 'jixishi');
INSERT INTO `ot_region` VALUES ('230302', 3, '区县', 'j', 'jgq', '鸡冠区', '230300', 'jiguanqu');
INSERT INTO `ot_region` VALUES ('230303', 3, '区县', 'h', 'hsq', '恒山区', '230300', 'hengshanqu');
INSERT INTO `ot_region` VALUES ('230304', 3, '区县', 'd', 'ddq', '滴道区', '230300', 'didaoqu');
INSERT INTO `ot_region` VALUES ('230305', 3, '区县', 'l', 'lsq', '梨树区', '230300', 'lishuqu');
INSERT INTO `ot_region` VALUES ('230306', 3, '区县', 'c', 'czhq', '城子河区', '230300', 'chengzihequ');
INSERT INTO `ot_region` VALUES ('230307', 3, '区县', 'm', 'msq', '麻山区', '230300', 'mashanqu');
INSERT INTO `ot_region` VALUES ('230321', 3, '区县', 'j', 'jdx', '鸡东县', '230300', 'jidongxian');
INSERT INTO `ot_region` VALUES ('230381', 3, '区县', 'h', 'hls', '虎林市', '230300', 'hulinshi');
INSERT INTO `ot_region` VALUES ('230382', 3, '区县', 'm', 'mss', '密山市', '230300', 'mishanshi');
INSERT INTO `ot_region` VALUES ('230400', 2, '城市', 'h', 'hgs', '鹤岗市', '230000', 'hegangshi');
INSERT INTO `ot_region` VALUES ('230402', 3, '区县', 'x', 'xyq', '向阳区', '230400', 'xiangyangqu');
INSERT INTO `ot_region` VALUES ('230403', 3, '区县', 'g', 'gnq', '工农区', '230400', 'gongnongqu');
INSERT INTO `ot_region` VALUES ('230404', 3, '区县', 'n', 'nsq', '南山区', '230400', 'nanshanqu');
INSERT INTO `ot_region` VALUES ('230405', 3, '区县', 'x', 'xaq', '兴安区', '230400', 'xinganqu');
INSERT INTO `ot_region` VALUES ('230406', 3, '区县', 'd', 'dsq', '东山区', '230400', 'dongshanqu');
INSERT INTO `ot_region` VALUES ('230407', 3, '区县', 'x', 'xsq', '兴山区', '230400', 'xingshanqu');
INSERT INTO `ot_region` VALUES ('230421', 3, '区县', 'l', 'lbx', '萝北县', '230400', 'luobeixian');
INSERT INTO `ot_region` VALUES ('230422', 3, '区县', 's', 'sbx', '绥滨县', '230400', 'suibinxian');
INSERT INTO `ot_region` VALUES ('230500', 2, '城市', 's', 'syss', '双鸭山市', '230000', 'shuangyashanshi');
INSERT INTO `ot_region` VALUES ('230502', 3, '区县', 'j', 'jsq', '尖山区', '230500', 'jianshanqu');
INSERT INTO `ot_region` VALUES ('230503', 3, '区县', 'l', 'ldq', '岭东区', '230500', 'lingdongqu');
INSERT INTO `ot_region` VALUES ('230505', 3, '区县', 's', 'sftq', '四方台区', '230500', 'sifangtaiqu');
INSERT INTO `ot_region` VALUES ('230506', 3, '区县', 'b', 'bsq', '宝山区', '230500', 'baoshanqu');
INSERT INTO `ot_region` VALUES ('230521', 3, '区县', 'j', 'jxx', '集贤县', '230500', 'jixianxian');
INSERT INTO `ot_region` VALUES ('230522', 3, '区县', 'y', 'yyx', '友谊县', '230500', 'youyixian');
INSERT INTO `ot_region` VALUES ('230523', 3, '区县', 'b', 'bqx', '宝清县', '230500', 'baoqingxian');
INSERT INTO `ot_region` VALUES ('230524', 3, '区县', 'r', 'rhx', '饶河县', '230500', 'raohexian');
INSERT INTO `ot_region` VALUES ('230600', 2, '城市', 'd', 'dqs', '大庆市', '230000', 'daqingshi');
INSERT INTO `ot_region` VALUES ('230602', 3, '区县', 's', 'setq', '萨尔图区', '230600', 'saertuqu');
INSERT INTO `ot_region` VALUES ('230603', 3, '区县', 'l', 'lfq', '龙凤区', '230600', 'longfengqu');
INSERT INTO `ot_region` VALUES ('230604', 3, '区县', 'r', 'rhlq', '让胡路区', '230600', 'ranghuluqu');
INSERT INTO `ot_region` VALUES ('230605', 3, '区县', 'h', 'hgq', '红岗区', '230600', 'honggangqu');
INSERT INTO `ot_region` VALUES ('230606', 3, '区县', 'd', 'dtq', '大同区', '230600', 'datongqu');
INSERT INTO `ot_region` VALUES ('230621', 3, '区县', 'z', 'zzx', '肇州县', '230600', 'zhaozhouxian');
INSERT INTO `ot_region` VALUES ('230622', 3, '区县', 'z', 'zyx', '肇源县', '230600', 'zhaoyuanxian');
INSERT INTO `ot_region` VALUES ('230623', 3, '区县', 'l', 'ldx', '林甸县', '230600', 'lindianxian');
INSERT INTO `ot_region` VALUES ('230624', 3, '区县', 'd', 'debtmgzzzx', '杜尔伯特蒙古族自治县', '230600', 'duerbotemengguzuzizhixian');
INSERT INTO `ot_region` VALUES ('230700', 2, '城市', 'y', 'ycs', '伊春市', '230000', 'yichunshi');
INSERT INTO `ot_region` VALUES ('230702', 3, '区县', 'y', 'ycq', '伊春区', '230700', 'yichunqu');
INSERT INTO `ot_region` VALUES ('230703', 3, '区县', 'n', 'ncq', '南岔区', '230700', 'nanchaqu');
INSERT INTO `ot_region` VALUES ('230704', 3, '区县', 'y', 'yhq', '友好区', '230700', 'youhaoqu');
INSERT INTO `ot_region` VALUES ('230705', 3, '区县', 'x', 'xlq', '西林区', '230700', 'xilinqu');
INSERT INTO `ot_region` VALUES ('230706', 3, '区县', 'c', 'clq', '翠峦区', '230700', 'cuiluanqu');
INSERT INTO `ot_region` VALUES ('230707', 3, '区县', 'x', 'xqq', '新青区', '230700', 'xinqingqu');
INSERT INTO `ot_region` VALUES ('230708', 3, '区县', 'm', 'mxq', '美溪区', '230700', 'meixiqu');
INSERT INTO `ot_region` VALUES ('230709', 3, '区县', 'j', 'jstq', '金山屯区', '230700', 'jinshantunqu');
INSERT INTO `ot_region` VALUES ('230710', 3, '区县', 'w', 'wyq', '五营区', '230700', 'wuyingqu');
INSERT INTO `ot_region` VALUES ('230711', 3, '区县', 'w', 'wmhq', '乌马河区', '230700', 'wumahequ');
INSERT INTO `ot_region` VALUES ('230712', 3, '区县', 't', 'twhq', '汤旺河区', '230700', 'tangwanghequ');
INSERT INTO `ot_region` VALUES ('230713', 3, '区县', 'd', 'dlq', '带岭区', '230700', 'dailingqu');
INSERT INTO `ot_region` VALUES ('230714', 3, '区县', 'w', 'wylq', '乌伊岭区', '230700', 'wuyilingqu');
INSERT INTO `ot_region` VALUES ('230715', 3, '区县', 'h', 'hxq', '红星区', '230700', 'hongxingqu');
INSERT INTO `ot_region` VALUES ('230716', 3, '区县', 's', 'sglq', '上甘岭区', '230700', 'shangganlingqu');
INSERT INTO `ot_region` VALUES ('230722', 3, '区县', 'j', 'jyx', '嘉荫县', '230700', 'jiayinxian');
INSERT INTO `ot_region` VALUES ('230781', 3, '区县', 't', 'tls', '铁力市', '230700', 'tielishi');
INSERT INTO `ot_region` VALUES ('230800', 2, '城市', 'j', 'jmss', '佳木斯市', '230000', 'jiamusishi');
INSERT INTO `ot_region` VALUES ('230803', 3, '区县', 'x', 'xyq', '向阳区', '230800', 'xiangyangqu');
INSERT INTO `ot_region` VALUES ('230804', 3, '区县', 'q', 'qjq', '前进区', '230800', 'qianjinqu');
INSERT INTO `ot_region` VALUES ('230805', 3, '区县', 'd', 'dfq', '东风区', '230800', 'dongfengqu');
INSERT INTO `ot_region` VALUES ('230811', 3, '区县', 'j', 'jq', '郊区', '230800', 'jiaoqu');
INSERT INTO `ot_region` VALUES ('230822', 3, '区县', 'h', 'hnx', '桦南县', '230800', 'huananxian');
INSERT INTO `ot_region` VALUES ('230826', 3, '区县', 'h', 'hcx', '桦川县', '230800', 'huachuanxian');
INSERT INTO `ot_region` VALUES ('230828', 3, '区县', 't', 'tyx', '汤原县', '230800', 'tangyuanxian');
INSERT INTO `ot_region` VALUES ('230881', 3, '区县', 't', 'tjs', '同江市', '230800', 'tongjiangshi');
INSERT INTO `ot_region` VALUES ('230882', 3, '区县', 'f', 'fjs', '富锦市', '230800', 'fujinshi');
INSERT INTO `ot_region` VALUES ('230883', 3, '区县', 'f', 'fys', '抚远市', '230800', 'fuyuanshi');
INSERT INTO `ot_region` VALUES ('230900', 2, '城市', 'q', 'qths', '七台河市', '230000', 'qitaiheshi');
INSERT INTO `ot_region` VALUES ('230902', 3, '区县', 'x', 'xxq', '新兴区', '230900', 'xinxingqu');
INSERT INTO `ot_region` VALUES ('230903', 3, '区县', 't', 'tsq', '桃山区', '230900', 'taoshanqu');
INSERT INTO `ot_region` VALUES ('230904', 3, '区县', 'q', 'qzhq', '茄子河区', '230900', 'qiezihequ');
INSERT INTO `ot_region` VALUES ('230921', 3, '区县', 'b', 'blx', '勃利县', '230900', 'bolixian');
INSERT INTO `ot_region` VALUES ('231000', 2, '城市', 'm', 'mdjs', '牡丹江市', '230000', 'mudanjiangshi');
INSERT INTO `ot_region` VALUES ('231002', 3, '区县', 'd', 'daq', '东安区', '231000', 'donganqu');
INSERT INTO `ot_region` VALUES ('231003', 3, '区县', 'y', 'ymq', '阳明区', '231000', 'yangmingqu');
INSERT INTO `ot_region` VALUES ('231004', 3, '区县', 'a', 'amq', '爱民区', '231000', 'aiminqu');
INSERT INTO `ot_region` VALUES ('231005', 3, '区县', 'x', 'xaq', '西安区', '231000', 'xianqu');
INSERT INTO `ot_region` VALUES ('231025', 3, '区县', 'l', 'lkx', '林口县', '231000', 'linkouxian');
INSERT INTO `ot_region` VALUES ('231081', 3, '区县', 's', 'sfhs', '绥芬河市', '231000', 'suifenheshi');
INSERT INTO `ot_region` VALUES ('231083', 3, '区县', 'h', 'hls', '海林市', '231000', 'hailinshi');
INSERT INTO `ot_region` VALUES ('231084', 3, '区县', 'n', 'nas', '宁安市', '231000', 'ninganshi');
INSERT INTO `ot_region` VALUES ('231085', 3, '区县', 'm', 'mls', '穆棱市', '231000', 'mulengshi');
INSERT INTO `ot_region` VALUES ('231086', 3, '区县', 'd', 'dns', '东宁市', '231000', 'dongningshi');
INSERT INTO `ot_region` VALUES ('231100', 2, '城市', 'h', 'hhs', '黑河市', '230000', 'heiheshi');
INSERT INTO `ot_region` VALUES ('231102', 3, '区县', 'a', 'ahq', '爱辉区', '231100', 'aihuiqu');
INSERT INTO `ot_region` VALUES ('231121', 3, '区县', 'n', 'njx', '嫩江县', '231100', 'nenjiangxian');
INSERT INTO `ot_region` VALUES ('231123', 3, '区县', 'x', 'xkx', '逊克县', '231100', 'xunkexian');
INSERT INTO `ot_region` VALUES ('231124', 3, '区县', 's', 'swx', '孙吴县', '231100', 'sunwuxian');
INSERT INTO `ot_region` VALUES ('231181', 3, '区县', 'b', 'bas', '北安市', '231100', 'beianshi');
INSERT INTO `ot_region` VALUES ('231182', 3, '区县', 'w', 'wdlcs', '五大连池市', '231100', 'wudalianchishi');
INSERT INTO `ot_region` VALUES ('231200', 2, '城市', 's', 'shs', '绥化市', '230000', 'suihuashi');
INSERT INTO `ot_region` VALUES ('231202', 3, '区县', 'b', 'blq', '北林区', '231200', 'beilinqu');
INSERT INTO `ot_region` VALUES ('231221', 3, '区县', 'w', 'wkx', '望奎县', '231200', 'wangkuixian');
INSERT INTO `ot_region` VALUES ('231222', 3, '区县', 'l', 'lxx', '兰西县', '231200', 'lanxixian');
INSERT INTO `ot_region` VALUES ('231223', 3, '区县', 'q', 'qgx', '青冈县', '231200', 'qinggangxian');
INSERT INTO `ot_region` VALUES ('231224', 3, '区县', 'q', 'qax', '庆安县', '231200', 'qinganxian');
INSERT INTO `ot_region` VALUES ('231225', 3, '区县', 'm', 'msx', '明水县', '231200', 'mingshuixian');
INSERT INTO `ot_region` VALUES ('231226', 3, '区县', 's', 'slx', '绥棱县', '231200', 'suilengxian');
INSERT INTO `ot_region` VALUES ('231281', 3, '区县', 'a', 'ads', '安达市', '231200', 'andashi');
INSERT INTO `ot_region` VALUES ('231282', 3, '区县', 'z', 'zds', '肇东市', '231200', 'zhaodongshi');
INSERT INTO `ot_region` VALUES ('231283', 3, '区县', 'h', 'hls', '海伦市', '231200', 'hailunshi');
INSERT INTO `ot_region` VALUES ('232700', 2, '城市', 'd', 'dxaldq', '大兴安岭地区', '230000', 'daxinganlingdiqu');
INSERT INTO `ot_region` VALUES ('232701', 3, '区县', 'm', 'mhs', '漠河市', '232700', 'moheshi');
INSERT INTO `ot_region` VALUES ('232721', 3, '区县', 'h', 'hmx', '呼玛县', '232700', 'humaxian');
INSERT INTO `ot_region` VALUES ('232722', 3, '区县', 't', 'thx', '塔河县', '232700', 'tahexian');
INSERT INTO `ot_region` VALUES ('232790', 3, '区县', 's', 'slq', '松岭区', '232700', 'songlingqu');
INSERT INTO `ot_region` VALUES ('232791', 3, '区县', 'h', 'hzq', '呼中区', '232700', 'huzhongqu');
INSERT INTO `ot_region` VALUES ('232792', 3, '区县', 'j', 'jgdqq', '加格达奇区', '232700', 'jiagedaqiqu');
INSERT INTO `ot_region` VALUES ('232793', 3, '区县', 'x', 'xlq', '新林区', '232700', 'xinlinqu');
INSERT INTO `ot_region` VALUES ('310100', 2, '城市', 's', 'shs', '上海市', '310000', 'shanghaishi');
INSERT INTO `ot_region` VALUES ('310101', 3, '区县', 'h', 'hpq', '黄浦区', '310100', 'huangpuqu');
INSERT INTO `ot_region` VALUES ('310104', 3, '区县', 'x', 'xhq', '徐汇区', '310100', 'xuhuiqu');
INSERT INTO `ot_region` VALUES ('310105', 3, '区县', 'z', 'znq', '长宁区', '310100', 'zhangningqu');
INSERT INTO `ot_region` VALUES ('310106', 3, '区县', 'j', 'jaq', '静安区', '310100', 'jinganqu');
INSERT INTO `ot_region` VALUES ('310107', 3, '区县', 'p', 'ptq', '普陀区', '310100', 'putuoqu');
INSERT INTO `ot_region` VALUES ('310109', 3, '区县', 'h', 'hkq', '虹口区', '310100', 'hongkouqu');
INSERT INTO `ot_region` VALUES ('310110', 3, '区县', 'y', 'ypq', '杨浦区', '310100', 'yangpuqu');
INSERT INTO `ot_region` VALUES ('310112', 3, '区县', 'm', 'mxq', '闵行区', '310100', 'minxingqu');
INSERT INTO `ot_region` VALUES ('310113', 3, '区县', 'b', 'bsq', '宝山区', '310100', 'baoshanqu');
INSERT INTO `ot_region` VALUES ('310114', 3, '区县', 'j', 'jdq', '嘉定区', '310100', 'jiadingqu');
INSERT INTO `ot_region` VALUES ('310115', 3, '区县', 'p', 'pdxq', '浦东新区', '310100', 'pudongxinqu');
INSERT INTO `ot_region` VALUES ('310116', 3, '区县', 'j', 'jsq', '金山区', '310100', 'jinshanqu');
INSERT INTO `ot_region` VALUES ('310117', 3, '区县', 's', 'sjq', '松江区', '310100', 'songjiangqu');
INSERT INTO `ot_region` VALUES ('310118', 3, '区县', 'q', 'qpq', '青浦区', '310100', 'qingpuqu');
INSERT INTO `ot_region` VALUES ('310120', 3, '区县', 'f', 'fxq', '奉贤区', '310100', 'fengxianqu');
INSERT INTO `ot_region` VALUES ('310151', 3, '区县', 'c', 'cmq', '崇明区', '310100', 'chongmingqu');
INSERT INTO `ot_region` VALUES ('320100', 2, '城市', 'n', 'njs', '南京市', '320000', 'nanjingshi');
INSERT INTO `ot_region` VALUES ('320102', 3, '区县', 'x', 'xwq', '玄武区', '320100', 'xuanwuqu');
INSERT INTO `ot_region` VALUES ('320104', 3, '区县', 'q', 'qhq', '秦淮区', '320100', 'qinhuaiqu');
INSERT INTO `ot_region` VALUES ('320105', 3, '区县', 'j', 'jyq', '建邺区', '320100', 'jianyequ');
INSERT INTO `ot_region` VALUES ('320106', 3, '区县', 'g', 'glq', '鼓楼区', '320100', 'gulouqu');
INSERT INTO `ot_region` VALUES ('320111', 3, '区县', 'p', 'pkq', '浦口区', '320100', 'pukouqu');
INSERT INTO `ot_region` VALUES ('320113', 3, '区县', 'q', 'qxq', '栖霞区', '320100', 'qixiaqu');
INSERT INTO `ot_region` VALUES ('320114', 3, '区县', 'y', 'yhtq', '雨花台区', '320100', 'yuhuataiqu');
INSERT INTO `ot_region` VALUES ('320115', 3, '区县', 'j', 'jnq', '江宁区', '320100', 'jiangningqu');
INSERT INTO `ot_region` VALUES ('320116', 3, '区县', 'l', 'lhq', '六合区', '320100', 'liuhequ');
INSERT INTO `ot_region` VALUES ('320117', 3, '区县', 'l', 'lsq', '溧水区', '320100', 'lishuiqu');
INSERT INTO `ot_region` VALUES ('320118', 3, '区县', 'g', 'gcq', '高淳区', '320100', 'gaochunqu');
INSERT INTO `ot_region` VALUES ('320200', 2, '城市', 'w', 'wxs', '无锡市', '320000', 'wuxishi');
INSERT INTO `ot_region` VALUES ('320205', 3, '区县', 'x', 'xsq', '锡山区', '320200', 'xishanqu');
INSERT INTO `ot_region` VALUES ('320206', 3, '区县', 'h', 'hsq', '惠山区', '320200', 'huishanqu');
INSERT INTO `ot_region` VALUES ('320211', 3, '区县', 'b', 'bhq', '滨湖区', '320200', 'binhuqu');
INSERT INTO `ot_region` VALUES ('320213', 3, '区县', 'l', 'lxq', '梁溪区', '320200', 'liangxiqu');
INSERT INTO `ot_region` VALUES ('320214', 3, '区县', 'x', 'xwq', '新吴区', '320200', 'xinwuqu');
INSERT INTO `ot_region` VALUES ('320281', 3, '区县', 'j', 'jys', '江阴市', '320200', 'jiangyinshi');
INSERT INTO `ot_region` VALUES ('320282', 3, '区县', 'y', 'yxs', '宜兴市', '320200', 'yixingshi');
INSERT INTO `ot_region` VALUES ('320300', 2, '城市', 'x', 'xzs', '徐州市', '320000', 'xuzhoushi');
INSERT INTO `ot_region` VALUES ('320302', 3, '区县', 'g', 'glq', '鼓楼区', '320300', 'gulouqu');
INSERT INTO `ot_region` VALUES ('320303', 3, '区县', 'y', 'ylq', '云龙区', '320300', 'yunlongqu');
INSERT INTO `ot_region` VALUES ('320305', 3, '区县', 'j', 'jwq', '贾汪区', '320300', 'jiawangqu');
INSERT INTO `ot_region` VALUES ('320311', 3, '区县', 'q', 'qsq', '泉山区', '320300', 'quanshanqu');
INSERT INTO `ot_region` VALUES ('320312', 3, '区县', 't', 'tsq', '铜山区', '320300', 'tongshanqu');
INSERT INTO `ot_region` VALUES ('320321', 3, '区县', 'f', 'fx', '丰县', '320300', 'fengxian');
INSERT INTO `ot_region` VALUES ('320322', 3, '区县', 'p', 'px', '沛县', '320300', 'peixian');
INSERT INTO `ot_region` VALUES ('320324', 3, '区县', 's', 'snx', '睢宁县', '320300', 'suiningxian');
INSERT INTO `ot_region` VALUES ('320381', 3, '区县', 'x', 'xys', '新沂市', '320300', 'xinyishi');
INSERT INTO `ot_region` VALUES ('320382', 3, '区县', 'p', 'pzs', '邳州市', '320300', 'pizhoushi');
INSERT INTO `ot_region` VALUES ('320391', 3, '区县', 'g', 'gyyq', '工业园区', '320300', 'gongyeyuanqu');
INSERT INTO `ot_region` VALUES ('320400', 2, '城市', 'c', 'czs', '常州市', '320000', 'changzhoushi');
INSERT INTO `ot_region` VALUES ('320402', 3, '区县', 't', 'tnq', '天宁区', '320400', 'tianningqu');
INSERT INTO `ot_region` VALUES ('320404', 3, '区县', 'z', 'zlq', '钟楼区', '320400', 'zhonglouqu');
INSERT INTO `ot_region` VALUES ('320411', 3, '区县', 'x', 'xbq', '新北区', '320400', 'xinbeiqu');
INSERT INTO `ot_region` VALUES ('320412', 3, '区县', 'w', 'wjq', '武进区', '320400', 'wujinqu');
INSERT INTO `ot_region` VALUES ('320413', 3, '区县', 'j', 'jtq', '金坛区', '320400', 'jintanqu');
INSERT INTO `ot_region` VALUES ('320481', 3, '区县', 'l', 'lys', '溧阳市', '320400', 'liyangshi');
INSERT INTO `ot_region` VALUES ('320500', 2, '城市', 's', 'szs', '苏州市', '320000', 'suzhoushi');
INSERT INTO `ot_region` VALUES ('320505', 3, '区县', 'h', 'hqq', '虎丘区', '320500', 'huqiuqu');
INSERT INTO `ot_region` VALUES ('320506', 3, '区县', 'w', 'wzq', '吴中区', '320500', 'wuzhongqu');
INSERT INTO `ot_region` VALUES ('320507', 3, '区县', 'x', 'xcq', '相城区', '320500', 'xiangchengqu');
INSERT INTO `ot_region` VALUES ('320508', 3, '区县', 'g', 'gsq', '姑苏区', '320500', 'gusuqu');
INSERT INTO `ot_region` VALUES ('320509', 3, '区县', 'w', 'wjq', '吴江区', '320500', 'wujiangqu');
INSERT INTO `ot_region` VALUES ('320581', 3, '区县', 'c', 'css', '常熟市', '320500', 'changshushi');
INSERT INTO `ot_region` VALUES ('320582', 3, '区县', 'z', 'zjgs', '张家港市', '320500', 'zhangjiagangshi');
INSERT INTO `ot_region` VALUES ('320583', 3, '区县', 'k', 'kss', '昆山市', '320500', 'kunshanshi');
INSERT INTO `ot_region` VALUES ('320585', 3, '区县', 't', 'tcs', '太仓市', '320500', 'taicangshi');
INSERT INTO `ot_region` VALUES ('320590', 3, '区县', 'g', 'gyyq', '工业园区', '320500', 'gongyeyuanqu');
INSERT INTO `ot_region` VALUES ('320591', 3, '区县', 'g', 'gxq', '高新区', '320500', 'gaoxinqu');
INSERT INTO `ot_region` VALUES ('320600', 2, '城市', 'n', 'nts', '南通市', '320000', 'nantongshi');
INSERT INTO `ot_region` VALUES ('320602', 3, '区县', 'c', 'ccq', '崇川区', '320600', 'chongchuanqu');
INSERT INTO `ot_region` VALUES ('320611', 3, '区县', 'g', 'gzq', '港闸区', '320600', 'gangzhaqu');
INSERT INTO `ot_region` VALUES ('320612', 3, '区县', 't', 'tzq', '通州区', '320600', 'tongzhouqu');
INSERT INTO `ot_region` VALUES ('320623', 3, '区县', 'r', 'rdx', '如东县', '320600', 'rudongxian');
INSERT INTO `ot_region` VALUES ('320681', 3, '区县', 'q', 'qds', '启东市', '320600', 'qidongshi');
INSERT INTO `ot_region` VALUES ('320682', 3, '区县', 'r', 'rgs', '如皋市', '320600', 'rugaoshi');
INSERT INTO `ot_region` VALUES ('320684', 3, '区县', 'h', 'hms', '海门市', '320600', 'haimenshi');
INSERT INTO `ot_region` VALUES ('320685', 3, '区县', 'h', 'has', '海安市', '320600', 'haianshi');
INSERT INTO `ot_region` VALUES ('320691', 3, '区县', 'g', 'gxq', '高新区', '320600', 'gaoxinqu');
INSERT INTO `ot_region` VALUES ('320700', 2, '城市', 'l', 'lygs', '连云港市', '320000', 'lianyungangshi');
INSERT INTO `ot_region` VALUES ('320703', 3, '区县', 'l', 'lyq', '连云区', '320700', 'lianyunqu');
INSERT INTO `ot_region` VALUES ('320706', 3, '区县', 'h', 'hzq', '海州区', '320700', 'haizhouqu');
INSERT INTO `ot_region` VALUES ('320707', 3, '区县', 'g', 'gyq', '赣榆区', '320700', 'ganyuqu');
INSERT INTO `ot_region` VALUES ('320722', 3, '区县', 'd', 'dhx', '东海县', '320700', 'donghaixian');
INSERT INTO `ot_region` VALUES ('320723', 3, '区县', 'g', 'gyx', '灌云县', '320700', 'guanyunxian');
INSERT INTO `ot_region` VALUES ('320724', 3, '区县', 'g', 'gnx', '灌南县', '320700', 'guannanxian');
INSERT INTO `ot_region` VALUES ('320800', 2, '城市', 'h', 'has', '淮安市', '320000', 'huaianshi');
INSERT INTO `ot_region` VALUES ('320803', 3, '区县', 'h', 'haq', '淮安区', '320800', 'huaianqu');
INSERT INTO `ot_region` VALUES ('320804', 3, '区县', 'h', 'hyq', '淮阴区', '320800', 'huaiyinqu');
INSERT INTO `ot_region` VALUES ('320812', 3, '区县', 'q', 'qjpq', '清江浦区', '320800', 'qingjiangpuqu');
INSERT INTO `ot_region` VALUES ('320813', 3, '区县', 'h', 'hzq', '洪泽区', '320800', 'hongzequ');
INSERT INTO `ot_region` VALUES ('320826', 3, '区县', 'l', 'lsx', '涟水县', '320800', 'lianshuixian');
INSERT INTO `ot_region` VALUES ('320830', 3, '区县', 'x', 'xyx', '盱眙县', '320800', 'xuyixian');
INSERT INTO `ot_region` VALUES ('320831', 3, '区县', 'j', 'jhx', '金湖县', '320800', 'jinhuxian');
INSERT INTO `ot_region` VALUES ('320890', 3, '区县', 'j', 'jjkfq', '经济开发区', '320800', 'jingjikaifaqu');
INSERT INTO `ot_region` VALUES ('320900', 2, '城市', 'y', 'ycs', '盐城市', '320000', 'yanchengshi');
INSERT INTO `ot_region` VALUES ('320902', 3, '区县', 't', 'thq', '亭湖区', '320900', 'tinghuqu');
INSERT INTO `ot_region` VALUES ('320903', 3, '区县', 'y', 'ydq', '盐都区', '320900', 'yandouqu');
INSERT INTO `ot_region` VALUES ('320904', 3, '区县', 'd', 'dfq', '大丰区', '320900', 'dafengqu');
INSERT INTO `ot_region` VALUES ('320921', 3, '区县', 'x', 'xsx', '响水县', '320900', 'xiangshuixian');
INSERT INTO `ot_region` VALUES ('320922', 3, '区县', 'b', 'bhx', '滨海县', '320900', 'binhaixian');
INSERT INTO `ot_region` VALUES ('320923', 3, '区县', 'f', 'fnx', '阜宁县', '320900', 'funingxian');
INSERT INTO `ot_region` VALUES ('320924', 3, '区县', 's', 'syx', '射阳县', '320900', 'sheyangxian');
INSERT INTO `ot_region` VALUES ('320925', 3, '区县', 'j', 'jhx', '建湖县', '320900', 'jianhuxian');
INSERT INTO `ot_region` VALUES ('320981', 3, '区县', 'd', 'dts', '东台市', '320900', 'dongtaishi');
INSERT INTO `ot_region` VALUES ('321000', 2, '城市', 'y', 'yzs', '扬州市', '320000', 'yangzhoushi');
INSERT INTO `ot_region` VALUES ('321002', 3, '区县', 'g', 'glq', '广陵区', '321000', 'guanglingqu');
INSERT INTO `ot_region` VALUES ('321003', 3, '区县', 'h', 'hjq', '邗江区', '321000', 'hanjiangqu');
INSERT INTO `ot_region` VALUES ('321012', 3, '区县', 'j', 'jdq', '江都区', '321000', 'jiangdouqu');
INSERT INTO `ot_region` VALUES ('321023', 3, '区县', 'b', 'byx', '宝应县', '321000', 'baoyingxian');
INSERT INTO `ot_region` VALUES ('321081', 3, '区县', 'y', 'yzs', '仪征市', '321000', 'yizhengshi');
INSERT INTO `ot_region` VALUES ('321084', 3, '区县', 'g', 'gys', '高邮市', '321000', 'gaoyoushi');
INSERT INTO `ot_region` VALUES ('321090', 3, '区县', 'j', 'jjkfq', '经济开发区', '321000', 'jingjikaifaqu');
INSERT INTO `ot_region` VALUES ('321100', 2, '城市', 'z', 'zjs', '镇江市', '320000', 'zhenjiangshi');
INSERT INTO `ot_region` VALUES ('321102', 3, '区县', 'j', 'jkq', '京口区', '321100', 'jingkouqu');
INSERT INTO `ot_region` VALUES ('321111', 3, '区县', 'r', 'rzq', '润州区', '321100', 'runzhouqu');
INSERT INTO `ot_region` VALUES ('321112', 3, '区县', 'd', 'dtq', '丹徒区', '321100', 'dantuqu');
INSERT INTO `ot_region` VALUES ('321181', 3, '区县', 'd', 'dys', '丹阳市', '321100', 'danyangshi');
INSERT INTO `ot_region` VALUES ('321182', 3, '区县', 'y', 'yzs', '扬中市', '321100', 'yangzhongshi');
INSERT INTO `ot_region` VALUES ('321183', 3, '区县', 'j', 'jrs', '句容市', '321100', 'jurongshi');
INSERT INTO `ot_region` VALUES ('321200', 2, '城市', 't', 'tzs', '泰州市', '320000', 'taizhoushi');
INSERT INTO `ot_region` VALUES ('321202', 3, '区县', 'h', 'hlq', '海陵区', '321200', 'hailingqu');
INSERT INTO `ot_region` VALUES ('321203', 3, '区县', 'g', 'ggq', '高港区', '321200', 'gaogangqu');
INSERT INTO `ot_region` VALUES ('321204', 3, '区县', 'j', 'jyq', '姜堰区', '321200', 'jiangyanqu');
INSERT INTO `ot_region` VALUES ('321281', 3, '区县', 'x', 'xhs', '兴化市', '321200', 'xinghuashi');
INSERT INTO `ot_region` VALUES ('321282', 3, '区县', 'j', 'jjs', '靖江市', '321200', 'jingjiangshi');
INSERT INTO `ot_region` VALUES ('321283', 3, '区县', 't', 'txs', '泰兴市', '321200', 'taixingshi');
INSERT INTO `ot_region` VALUES ('321300', 2, '城市', 's', 'sqs', '宿迁市', '320000', 'suqianshi');
INSERT INTO `ot_region` VALUES ('321302', 3, '区县', 's', 'scq', '宿城区', '321300', 'suchengqu');
INSERT INTO `ot_region` VALUES ('321311', 3, '区县', 's', 'syq', '宿豫区', '321300', 'suyuqu');
INSERT INTO `ot_region` VALUES ('321322', 3, '区县', 's', 'syx', '沭阳县', '321300', 'shuyangxian');
INSERT INTO `ot_region` VALUES ('321323', 3, '区县', 's', 'syx', '泗阳县', '321300', 'siyangxian');
INSERT INTO `ot_region` VALUES ('321324', 3, '区县', 's', 'shx', '泗洪县', '321300', 'sihongxian');
INSERT INTO `ot_region` VALUES ('330100', 2, '城市', 'h', 'hzs', '杭州市', '330000', 'hangzhoushi');
INSERT INTO `ot_region` VALUES ('330102', 3, '区县', 's', 'scq', '上城区', '330100', 'shangchengqu');
INSERT INTO `ot_region` VALUES ('330103', 3, '区县', 'x', 'xcq', '下城区', '330100', 'xiachengqu');
INSERT INTO `ot_region` VALUES ('330104', 3, '区县', 'j', 'jgq', '江干区', '330100', 'jiangganqu');
INSERT INTO `ot_region` VALUES ('330105', 3, '区县', 'g', 'gsq', '拱墅区', '330100', 'gongshuqu');
INSERT INTO `ot_region` VALUES ('330106', 3, '区县', 'x', 'xhq', '西湖区', '330100', 'xihuqu');
INSERT INTO `ot_region` VALUES ('330108', 3, '区县', 'b', 'bjq', '滨江区', '330100', 'binjiangqu');
INSERT INTO `ot_region` VALUES ('330109', 3, '区县', 'x', 'xsq', '萧山区', '330100', 'xiaoshanqu');
INSERT INTO `ot_region` VALUES ('330110', 3, '区县', 'y', 'yhq', '余杭区', '330100', 'yuhangqu');
INSERT INTO `ot_region` VALUES ('330111', 3, '区县', 'f', 'fyq', '富阳区', '330100', 'fuyangqu');
INSERT INTO `ot_region` VALUES ('330112', 3, '区县', 'l', 'laq', '临安区', '330100', 'linanqu');
INSERT INTO `ot_region` VALUES ('330122', 3, '区县', 't', 'tlx', '桐庐县', '330100', 'tongluxian');
INSERT INTO `ot_region` VALUES ('330127', 3, '区县', 'c', 'cax', '淳安县', '330100', 'chunanxian');
INSERT INTO `ot_region` VALUES ('330182', 3, '区县', 'j', 'jds', '建德市', '330100', 'jiandeshi');
INSERT INTO `ot_region` VALUES ('330200', 2, '城市', 'n', 'nbs', '宁波市', '330000', 'ningboshi');
INSERT INTO `ot_region` VALUES ('330203', 3, '区县', 'h', 'hsq', '海曙区', '330200', 'haishuqu');
INSERT INTO `ot_region` VALUES ('330205', 3, '区县', 'j', 'jbq', '江北区', '330200', 'jiangbeiqu');
INSERT INTO `ot_region` VALUES ('330206', 3, '区县', 'b', 'blq', '北仑区', '330200', 'beilunqu');
INSERT INTO `ot_region` VALUES ('330211', 3, '区县', 'z', 'zhq', '镇海区', '330200', 'zhenhaiqu');
INSERT INTO `ot_region` VALUES ('330212', 3, '区县', 'y', 'yzq', '鄞州区', '330200', 'yinzhouqu');
INSERT INTO `ot_region` VALUES ('330213', 3, '区县', 'f', 'fhq', '奉化区', '330200', 'fenghuaqu');
INSERT INTO `ot_region` VALUES ('330225', 3, '区县', 'x', 'xsx', '象山县', '330200', 'xiangshanxian');
INSERT INTO `ot_region` VALUES ('330226', 3, '区县', 'n', 'nhx', '宁海县', '330200', 'ninghaixian');
INSERT INTO `ot_region` VALUES ('330281', 3, '区县', 'y', 'yys', '余姚市', '330200', 'yuyaoshi');
INSERT INTO `ot_region` VALUES ('330282', 3, '区县', 'c', 'cxs', '慈溪市', '330200', 'cixishi');
INSERT INTO `ot_region` VALUES ('330300', 2, '城市', 'w', 'wzs', '温州市', '330000', 'wenzhoushi');
INSERT INTO `ot_region` VALUES ('330302', 3, '区县', 'l', 'lcq', '鹿城区', '330300', 'luchengqu');
INSERT INTO `ot_region` VALUES ('330303', 3, '区县', 'l', 'lwq', '龙湾区', '330300', 'longwanqu');
INSERT INTO `ot_region` VALUES ('330304', 3, '区县', 'o', 'ohq', '瓯海区', '330300', 'ouhaiqu');
INSERT INTO `ot_region` VALUES ('330305', 3, '区县', 'd', 'dtq', '洞头区', '330300', 'dongtouqu');
INSERT INTO `ot_region` VALUES ('330324', 3, '区县', 'y', 'yjx', '永嘉县', '330300', 'yongjiaxian');
INSERT INTO `ot_region` VALUES ('330326', 3, '区县', 'p', 'pyx', '平阳县', '330300', 'pingyangxian');
INSERT INTO `ot_region` VALUES ('330327', 3, '区县', 'c', 'cnx', '苍南县', '330300', 'cangnanxian');
INSERT INTO `ot_region` VALUES ('330328', 3, '区县', 'w', 'wcx', '文成县', '330300', 'wenchengxian');
INSERT INTO `ot_region` VALUES ('330329', 3, '区县', 't', 'tsx', '泰顺县', '330300', 'taishunxian');
INSERT INTO `ot_region` VALUES ('330381', 3, '区县', 'r', 'ras', '瑞安市', '330300', 'ruianshi');
INSERT INTO `ot_region` VALUES ('330382', 3, '区县', 'l', 'lqs', '乐清市', '330300', 'leqingshi');
INSERT INTO `ot_region` VALUES ('330400', 2, '城市', 'j', 'jxs', '嘉兴市', '330000', 'jiaxingshi');
INSERT INTO `ot_region` VALUES ('330402', 3, '区县', 'n', 'nhq', '南湖区', '330400', 'nanhuqu');
INSERT INTO `ot_region` VALUES ('330411', 3, '区县', 'x', 'xzq', '秀洲区', '330400', 'xiuzhouqu');
INSERT INTO `ot_region` VALUES ('330421', 3, '区县', 'j', 'jsx', '嘉善县', '330400', 'jiashanxian');
INSERT INTO `ot_region` VALUES ('330424', 3, '区县', 'h', 'hyx', '海盐县', '330400', 'haiyanxian');
INSERT INTO `ot_region` VALUES ('330481', 3, '区县', 'h', 'hns', '海宁市', '330400', 'hainingshi');
INSERT INTO `ot_region` VALUES ('330482', 3, '区县', 'p', 'phs', '平湖市', '330400', 'pinghushi');
INSERT INTO `ot_region` VALUES ('330483', 3, '区县', 't', 'txs', '桐乡市', '330400', 'tongxiangshi');
INSERT INTO `ot_region` VALUES ('330500', 2, '城市', 'h', 'hzs', '湖州市', '330000', 'huzhoushi');
INSERT INTO `ot_region` VALUES ('330502', 3, '区县', 'w', 'wxq', '吴兴区', '330500', 'wuxingqu');
INSERT INTO `ot_region` VALUES ('330503', 3, '区县', 'n', 'nxq', '南浔区', '330500', 'nanxunqu');
INSERT INTO `ot_region` VALUES ('330521', 3, '区县', 'd', 'dqx', '德清县', '330500', 'deqingxian');
INSERT INTO `ot_region` VALUES ('330522', 3, '区县', 'z', 'zxx', '长兴县', '330500', 'zhangxingxian');
INSERT INTO `ot_region` VALUES ('330523', 3, '区县', 'a', 'ajx', '安吉县', '330500', 'anjixian');
INSERT INTO `ot_region` VALUES ('330600', 2, '城市', 's', 'sxs', '绍兴市', '330000', 'shaoxingshi');
INSERT INTO `ot_region` VALUES ('330602', 3, '区县', 'y', 'ycq', '越城区', '330600', 'yuechengqu');
INSERT INTO `ot_region` VALUES ('330603', 3, '区县', 'k', 'kqq', '柯桥区', '330600', 'keqiaoqu');
INSERT INTO `ot_region` VALUES ('330604', 3, '区县', 's', 'syq', '上虞区', '330600', 'shangyuqu');
INSERT INTO `ot_region` VALUES ('330624', 3, '区县', 'x', 'xcx', '新昌县', '330600', 'xinchangxian');
INSERT INTO `ot_region` VALUES ('330681', 3, '区县', 'z', 'zjs', '诸暨市', '330600', 'zhujishi');
INSERT INTO `ot_region` VALUES ('330683', 3, '区县', 's', 'szs', '嵊州市', '330600', 'shengzhoushi');
INSERT INTO `ot_region` VALUES ('330700', 2, '城市', 'j', 'jhs', '金华市', '330000', 'jinhuashi');
INSERT INTO `ot_region` VALUES ('330702', 3, '区县', 'w', 'wcq', '婺城区', '330700', 'wuchengqu');
INSERT INTO `ot_region` VALUES ('330703', 3, '区县', 'j', 'jdq', '金东区', '330700', 'jindongqu');
INSERT INTO `ot_region` VALUES ('330723', 3, '区县', 'w', 'wyx', '武义县', '330700', 'wuyixian');
INSERT INTO `ot_region` VALUES ('330726', 3, '区县', 'p', 'pjx', '浦江县', '330700', 'pujiangxian');
INSERT INTO `ot_region` VALUES ('330727', 3, '区县', 'p', 'pax', '磐安县', '330700', 'pananxian');
INSERT INTO `ot_region` VALUES ('330781', 3, '区县', 'l', 'lxs', '兰溪市', '330700', 'lanxishi');
INSERT INTO `ot_region` VALUES ('330782', 3, '区县', 'y', 'yws', '义乌市', '330700', 'yiwushi');
INSERT INTO `ot_region` VALUES ('330783', 3, '区县', 'd', 'dys', '东阳市', '330700', 'dongyangshi');
INSERT INTO `ot_region` VALUES ('330784', 3, '区县', 'y', 'yks', '永康市', '330700', 'yongkangshi');
INSERT INTO `ot_region` VALUES ('330800', 2, '城市', 'q', 'qzs', '衢州市', '330000', 'quzhoushi');
INSERT INTO `ot_region` VALUES ('330802', 3, '区县', 'k', 'kcq', '柯城区', '330800', 'kechengqu');
INSERT INTO `ot_region` VALUES ('330803', 3, '区县', 'q', 'qjq', '衢江区', '330800', 'qujiangqu');
INSERT INTO `ot_region` VALUES ('330822', 3, '区县', 'c', 'csx', '常山县', '330800', 'changshanxian');
INSERT INTO `ot_region` VALUES ('330824', 3, '区县', 'k', 'khx', '开化县', '330800', 'kaihuaxian');
INSERT INTO `ot_region` VALUES ('330825', 3, '区县', 'l', 'lyx', '龙游县', '330800', 'longyouxian');
INSERT INTO `ot_region` VALUES ('330881', 3, '区县', 'j', 'jss', '江山市', '330800', 'jiangshanshi');
INSERT INTO `ot_region` VALUES ('330900', 2, '城市', 'z', 'zss', '舟山市', '330000', 'zhoushanshi');
INSERT INTO `ot_region` VALUES ('330902', 3, '区县', 'd', 'dhq', '定海区', '330900', 'dinghaiqu');
INSERT INTO `ot_region` VALUES ('330903', 3, '区县', 'p', 'ptq', '普陀区', '330900', 'putuoqu');
INSERT INTO `ot_region` VALUES ('330921', 3, '区县', 'd', 'dsx', '岱山县', '330900', 'daishanxian');
INSERT INTO `ot_region` VALUES ('330922', 3, '区县', 's', 'ssx', '嵊泗县', '330900', 'shengsixian');
INSERT INTO `ot_region` VALUES ('331000', 2, '城市', 't', 'tzs', '台州市', '330000', 'taizhoushi');
INSERT INTO `ot_region` VALUES ('331002', 3, '区县', 'j', 'jjq', '椒江区', '331000', 'jiaojiangqu');
INSERT INTO `ot_region` VALUES ('331003', 3, '区县', 'h', 'hyq', '黄岩区', '331000', 'huangyanqu');
INSERT INTO `ot_region` VALUES ('331004', 3, '区县', 'l', 'lqq', '路桥区', '331000', 'luqiaoqu');
INSERT INTO `ot_region` VALUES ('331022', 3, '区县', 's', 'smx', '三门县', '331000', 'sanmenxian');
INSERT INTO `ot_region` VALUES ('331023', 3, '区县', 't', 'ttx', '天台县', '331000', 'tiantaixian');
INSERT INTO `ot_region` VALUES ('331024', 3, '区县', 'x', 'xjx', '仙居县', '331000', 'xianjuxian');
INSERT INTO `ot_region` VALUES ('331081', 3, '区县', 'w', 'wls', '温岭市', '331000', 'wenlingshi');
INSERT INTO `ot_region` VALUES ('331082', 3, '区县', 'l', 'lhs', '临海市', '331000', 'linhaishi');
INSERT INTO `ot_region` VALUES ('331083', 3, '区县', 'y', 'yhs', '玉环市', '331000', 'yuhuanshi');
INSERT INTO `ot_region` VALUES ('331100', 2, '城市', 'l', 'lss', '丽水市', '330000', 'lishuishi');
INSERT INTO `ot_region` VALUES ('331102', 3, '区县', 'l', 'ldq', '莲都区', '331100', 'liandouqu');
INSERT INTO `ot_region` VALUES ('331121', 3, '区县', 'q', 'qtx', '青田县', '331100', 'qingtianxian');
INSERT INTO `ot_region` VALUES ('331122', 3, '区县', 'j', 'jyx', '缙云县', '331100', 'jinyunxian');
INSERT INTO `ot_region` VALUES ('331123', 3, '区县', 's', 'scx', '遂昌县', '331100', 'suichangxian');
INSERT INTO `ot_region` VALUES ('331124', 3, '区县', 's', 'syx', '松阳县', '331100', 'songyangxian');
INSERT INTO `ot_region` VALUES ('331125', 3, '区县', 'y', 'yhx', '云和县', '331100', 'yunhexian');
INSERT INTO `ot_region` VALUES ('331126', 3, '区县', 'q', 'qyx', '庆元县', '331100', 'qingyuanxian');
INSERT INTO `ot_region` VALUES ('331127', 3, '区县', 'j', 'jnszzzx', '景宁畲族自治县', '331100', 'jingningshezuzizhixian');
INSERT INTO `ot_region` VALUES ('331181', 3, '区县', 'l', 'lqs', '龙泉市', '331100', 'longquanshi');
INSERT INTO `ot_region` VALUES ('340100', 2, '城市', 'h', 'hfs', '合肥市', '340000', 'hefeishi');
INSERT INTO `ot_region` VALUES ('340102', 3, '区县', 'y', 'yhq', '瑶海区', '340100', 'yaohaiqu');
INSERT INTO `ot_region` VALUES ('340103', 3, '区县', 'l', 'lyq', '庐阳区', '340100', 'luyangqu');
INSERT INTO `ot_region` VALUES ('340104', 3, '区县', 's', 'ssq', '蜀山区', '340100', 'shushanqu');
INSERT INTO `ot_region` VALUES ('340111', 3, '区县', 'b', 'bhq', '包河区', '340100', 'baohequ');
INSERT INTO `ot_region` VALUES ('340121', 3, '区县', 'z', 'zfx', '长丰县', '340100', 'zhangfengxian');
INSERT INTO `ot_region` VALUES ('340122', 3, '区县', 'f', 'fdx', '肥东县', '340100', 'feidongxian');
INSERT INTO `ot_region` VALUES ('340123', 3, '区县', 'f', 'fxx', '肥西县', '340100', 'feixixian');
INSERT INTO `ot_region` VALUES ('340124', 3, '区县', 'l', 'ljx', '庐江县', '340100', 'lujiangxian');
INSERT INTO `ot_region` VALUES ('340181', 3, '区县', 'c', 'chs', '巢湖市', '340100', 'chaohushi');
INSERT INTO `ot_region` VALUES ('340190', 3, '区县', 'g', 'gxjskfq', '高新技术开发区', '340100', 'gaoxinjishukaifaqu');
INSERT INTO `ot_region` VALUES ('340191', 3, '区县', 'j', 'jjjskfq', '经济技术开发区', '340100', 'jingjijishukaifaqu');
INSERT INTO `ot_region` VALUES ('340200', 2, '城市', 'w', 'whs', '芜湖市', '340000', 'wuhushi');
INSERT INTO `ot_region` VALUES ('340202', 3, '区县', 'j', 'jhq', '镜湖区', '340200', 'jinghuqu');
INSERT INTO `ot_region` VALUES ('340203', 3, '区县', 'y', 'yjq', '弋江区', '340200', 'yijiangqu');
INSERT INTO `ot_region` VALUES ('340207', 3, '区县', 'j', 'jjq', '鸠江区', '340200', 'jiujiangqu');
INSERT INTO `ot_region` VALUES ('340208', 3, '区县', 's', 'ssq', '三山区', '340200', 'sanshanqu');
INSERT INTO `ot_region` VALUES ('340221', 3, '区县', 'w', 'whx', '芜湖县', '340200', 'wuhuxian');
INSERT INTO `ot_region` VALUES ('340222', 3, '区县', 'f', 'fcx', '繁昌县', '340200', 'fanchangxian');
INSERT INTO `ot_region` VALUES ('340223', 3, '区县', 'n', 'nlx', '南陵县', '340200', 'nanlingxian');
INSERT INTO `ot_region` VALUES ('340225', 3, '区县', 'w', 'wwx', '无为县', '340200', 'wuweixian');
INSERT INTO `ot_region` VALUES ('340300', 2, '城市', 'b', 'bbs', '蚌埠市', '340000', 'bangbushi');
INSERT INTO `ot_region` VALUES ('340302', 3, '区县', 'l', 'lzhq', '龙子湖区', '340300', 'longzihuqu');
INSERT INTO `ot_region` VALUES ('340303', 3, '区县', 'b', 'bsq', '蚌山区', '340300', 'bangshanqu');
INSERT INTO `ot_region` VALUES ('340304', 3, '区县', 'y', 'yhq', '禹会区', '340300', 'yuhuiqu');
INSERT INTO `ot_region` VALUES ('340311', 3, '区县', 'h', 'hsq', '淮上区', '340300', 'huaishangqu');
INSERT INTO `ot_region` VALUES ('340321', 3, '区县', 'h', 'hyx', '怀远县', '340300', 'huaiyuanxian');
INSERT INTO `ot_region` VALUES ('340322', 3, '区县', 'w', 'whx', '五河县', '340300', 'wuhexian');
INSERT INTO `ot_region` VALUES ('340323', 3, '区县', 'g', 'gzx', '固镇县', '340300', 'guzhenxian');
INSERT INTO `ot_region` VALUES ('340400', 2, '城市', 'h', 'hns', '淮南市', '340000', 'huainanshi');
INSERT INTO `ot_region` VALUES ('340402', 3, '区县', 'd', 'dtq', '大通区', '340400', 'datongqu');
INSERT INTO `ot_region` VALUES ('340403', 3, '区县', 't', 'tjaq', '田家庵区', '340400', 'tianjiaanqu');
INSERT INTO `ot_region` VALUES ('340404', 3, '区县', 'x', 'xjjq', '谢家集区', '340400', 'xiejiajiqu');
INSERT INTO `ot_region` VALUES ('340405', 3, '区县', 'b', 'bgsq', '八公山区', '340400', 'bagongshanqu');
INSERT INTO `ot_region` VALUES ('340406', 3, '区县', 'p', 'pjq', '潘集区', '340400', 'panjiqu');
INSERT INTO `ot_region` VALUES ('340421', 3, '区县', 'f', 'ftx', '凤台县', '340400', 'fengtaixian');
INSERT INTO `ot_region` VALUES ('340422', 3, '区县', 's', 'sx', '寿县', '340400', 'shouxian');
INSERT INTO `ot_region` VALUES ('340500', 2, '城市', 'm', 'mass', '马鞍山市', '340000', 'maanshanshi');
INSERT INTO `ot_region` VALUES ('340503', 3, '区县', 'h', 'hsq', '花山区', '340500', 'huashanqu');
INSERT INTO `ot_region` VALUES ('340504', 3, '区县', 'y', 'ysq', '雨山区', '340500', 'yushanqu');
INSERT INTO `ot_region` VALUES ('340506', 3, '区县', 'b', 'bwq', '博望区', '340500', 'bowangqu');
INSERT INTO `ot_region` VALUES ('340521', 3, '区县', 'd', 'dtx', '当涂县', '340500', 'dangtuxian');
INSERT INTO `ot_region` VALUES ('340522', 3, '区县', 'h', 'hsx', '含山县', '340500', 'hanshanxian');
INSERT INTO `ot_region` VALUES ('340523', 3, '区县', 'h', 'hx', '和县', '340500', 'hexian');
INSERT INTO `ot_region` VALUES ('340600', 2, '城市', 'h', 'hbs', '淮北市', '340000', 'huaibeishi');
INSERT INTO `ot_region` VALUES ('340602', 3, '区县', 'd', 'djq', '杜集区', '340600', 'dujiqu');
INSERT INTO `ot_region` VALUES ('340603', 3, '区县', 'x', 'xsq', '相山区', '340600', 'xiangshanqu');
INSERT INTO `ot_region` VALUES ('340604', 3, '区县', 'l', 'lsq', '烈山区', '340600', 'lieshanqu');
INSERT INTO `ot_region` VALUES ('340621', 3, '区县', 's', 'sxx', '濉溪县', '340600', 'suixixian');
INSERT INTO `ot_region` VALUES ('340700', 2, '城市', 't', 'tls', '铜陵市', '340000', 'tonglingshi');
INSERT INTO `ot_region` VALUES ('340705', 3, '区县', 't', 'tgq', '铜官区', '340700', 'tongguanqu');
INSERT INTO `ot_region` VALUES ('340706', 3, '区县', 'y', 'yaq', '义安区', '340700', 'yianqu');
INSERT INTO `ot_region` VALUES ('340711', 3, '区县', 'j', 'jq', '郊区', '340700', 'jiaoqu');
INSERT INTO `ot_region` VALUES ('340722', 3, '区县', 'z', 'zyx', '枞阳县', '340700', 'zongyangxian');
INSERT INTO `ot_region` VALUES ('340800', 2, '城市', 'a', 'aqs', '安庆市', '340000', 'anqingshi');
INSERT INTO `ot_region` VALUES ('340802', 3, '区县', 'y', 'yjq', '迎江区', '340800', 'yingjiangqu');
INSERT INTO `ot_region` VALUES ('340803', 3, '区县', 'd', 'dgq', '大观区', '340800', 'daguanqu');
INSERT INTO `ot_region` VALUES ('340811', 3, '区县', 'y', 'yxq', '宜秀区', '340800', 'yixiuqu');
INSERT INTO `ot_region` VALUES ('340822', 3, '区县', 'h', 'hnx', '怀宁县', '340800', 'huainingxian');
INSERT INTO `ot_region` VALUES ('340824', 3, '区县', 'q', 'qsx', '潜山县', '340800', 'qianshanxian');
INSERT INTO `ot_region` VALUES ('340825', 3, '区县', 't', 'thx', '太湖县', '340800', 'taihuxian');
INSERT INTO `ot_region` VALUES ('340826', 3, '区县', 's', 'ssx', '宿松县', '340800', 'susongxian');
INSERT INTO `ot_region` VALUES ('340827', 3, '区县', 'w', 'wjx', '望江县', '340800', 'wangjiangxian');
INSERT INTO `ot_region` VALUES ('340828', 3, '区县', 'y', 'yxx', '岳西县', '340800', 'yuexixian');
INSERT INTO `ot_region` VALUES ('340881', 3, '区县', 't', 'tcs', '桐城市', '340800', 'tongchengshi');
INSERT INTO `ot_region` VALUES ('341000', 2, '城市', 'h', 'hss', '黄山市', '340000', 'huangshanshi');
INSERT INTO `ot_region` VALUES ('341002', 3, '区县', 't', 'txq', '屯溪区', '341000', 'tunxiqu');
INSERT INTO `ot_region` VALUES ('341003', 3, '区县', 'h', 'hsq', '黄山区', '341000', 'huangshanqu');
INSERT INTO `ot_region` VALUES ('341004', 3, '区县', 'h', 'hzq', '徽州区', '341000', 'huizhouqu');
INSERT INTO `ot_region` VALUES ('341021', 3, '区县', 's', 'sx', '歙县', '341000', 'shexian');
INSERT INTO `ot_region` VALUES ('341022', 3, '区县', 'x', 'xnx', '休宁县', '341000', 'xiuningxian');
INSERT INTO `ot_region` VALUES ('341023', 3, '区县', 'y', 'yx', '黟县', '341000', 'yixian');
INSERT INTO `ot_region` VALUES ('341024', 3, '区县', 'q', 'qmx', '祁门县', '341000', 'qimenxian');
INSERT INTO `ot_region` VALUES ('341100', 2, '城市', 'c', 'czs', '滁州市', '340000', 'chuzhoushi');
INSERT INTO `ot_region` VALUES ('341102', 3, '区县', 'l', 'lyq', '琅琊区', '341100', 'langyaqu');
INSERT INTO `ot_region` VALUES ('341103', 3, '区县', 'n', 'nqq', '南谯区', '341100', 'nanqiaoqu');
INSERT INTO `ot_region` VALUES ('341122', 3, '区县', 'l', 'lax', '来安县', '341100', 'laianxian');
INSERT INTO `ot_region` VALUES ('341124', 3, '区县', 'q', 'qjx', '全椒县', '341100', 'quanjiaoxian');
INSERT INTO `ot_region` VALUES ('341125', 3, '区县', 'd', 'dyx', '定远县', '341100', 'dingyuanxian');
INSERT INTO `ot_region` VALUES ('341126', 3, '区县', 'f', 'fyx', '凤阳县', '341100', 'fengyangxian');
INSERT INTO `ot_region` VALUES ('341181', 3, '区县', 't', 'tzs', '天长市', '341100', 'tianzhangshi');
INSERT INTO `ot_region` VALUES ('341182', 3, '区县', 'm', 'mgs', '明光市', '341100', 'mingguangshi');
INSERT INTO `ot_region` VALUES ('341200', 2, '城市', 'f', 'fys', '阜阳市', '340000', 'fuyangshi');
INSERT INTO `ot_region` VALUES ('341202', 3, '区县', 'y', 'yzq', '颍州区', '341200', 'yingzhouqu');
INSERT INTO `ot_region` VALUES ('341203', 3, '区县', 'y', 'ydq', '颍东区', '341200', 'yingdongqu');
INSERT INTO `ot_region` VALUES ('341204', 3, '区县', 'y', 'yqq', '颍泉区', '341200', 'yingquanqu');
INSERT INTO `ot_region` VALUES ('341221', 3, '区县', 'l', 'lqx', '临泉县', '341200', 'linquanxian');
INSERT INTO `ot_region` VALUES ('341222', 3, '区县', 't', 'thx', '太和县', '341200', 'taihexian');
INSERT INTO `ot_region` VALUES ('341225', 3, '区县', 'f', 'fnx', '阜南县', '341200', 'funanxian');
INSERT INTO `ot_region` VALUES ('341226', 3, '区县', 'y', 'ysx', '颍上县', '341200', 'yingshangxian');
INSERT INTO `ot_region` VALUES ('341282', 3, '区县', 'j', 'jss', '界首市', '341200', 'jieshoushi');
INSERT INTO `ot_region` VALUES ('341300', 2, '城市', 's', 'szs', '宿州市', '340000', 'suzhoushi');
INSERT INTO `ot_region` VALUES ('341302', 3, '区县', 'y', 'yqq', '埇桥区', '341300', 'yongqiaoqu');
INSERT INTO `ot_region` VALUES ('341321', 3, '区县', 'd', 'dsx', '砀山县', '341300', 'dangshanxian');
INSERT INTO `ot_region` VALUES ('341322', 3, '区县', 'x', 'xx', '萧县', '341300', 'xiaoxian');
INSERT INTO `ot_region` VALUES ('341323', 3, '区县', 'l', 'lbx', '灵璧县', '341300', 'lingbixian');
INSERT INTO `ot_region` VALUES ('341324', 3, '区县', 's', 'sx', '泗县', '341300', 'sixian');
INSERT INTO `ot_region` VALUES ('341390', 3, '区县', 'j', 'jjkfq', '经济开发区', '341300', 'jingjikaifaqu');
INSERT INTO `ot_region` VALUES ('341500', 2, '城市', 'l', 'las', '六安市', '340000', 'liuanshi');
INSERT INTO `ot_region` VALUES ('341502', 3, '区县', 'j', 'jaq', '金安区', '341500', 'jinanqu');
INSERT INTO `ot_region` VALUES ('341503', 3, '区县', 'y', 'yaq', '裕安区', '341500', 'yuanqu');
INSERT INTO `ot_region` VALUES ('341504', 3, '区县', 'y', 'yjq', '叶集区', '341500', 'yejiqu');
INSERT INTO `ot_region` VALUES ('341522', 3, '区县', 'h', 'hqx', '霍邱县', '341500', 'huoqiuxian');
INSERT INTO `ot_region` VALUES ('341523', 3, '区县', 's', 'scx', '舒城县', '341500', 'shuchengxian');
INSERT INTO `ot_region` VALUES ('341524', 3, '区县', 'j', 'jzx', '金寨县', '341500', 'jinzhaixian');
INSERT INTO `ot_region` VALUES ('341525', 3, '区县', 'h', 'hsx', '霍山县', '341500', 'huoshanxian');
INSERT INTO `ot_region` VALUES ('341600', 2, '城市', 'b', 'bzs', '亳州市', '340000', 'bozhoushi');
INSERT INTO `ot_region` VALUES ('341602', 3, '区县', 'q', 'qcq', '谯城区', '341600', 'qiaochengqu');
INSERT INTO `ot_region` VALUES ('341621', 3, '区县', 'w', 'wyx', '涡阳县', '341600', 'woyangxian');
INSERT INTO `ot_region` VALUES ('341622', 3, '区县', 'm', 'mcx', '蒙城县', '341600', 'mengchengxian');
INSERT INTO `ot_region` VALUES ('341623', 3, '区县', 'l', 'lxx', '利辛县', '341600', 'lixinxian');
INSERT INTO `ot_region` VALUES ('341700', 2, '城市', 'c', 'czs', '池州市', '340000', 'chizhoushi');
INSERT INTO `ot_region` VALUES ('341702', 3, '区县', 'g', 'gcq', '贵池区', '341700', 'guichiqu');
INSERT INTO `ot_region` VALUES ('341721', 3, '区县', 'd', 'dzx', '东至县', '341700', 'dongzhixian');
INSERT INTO `ot_region` VALUES ('341722', 3, '区县', 's', 'stx', '石台县', '341700', 'shitaixian');
INSERT INTO `ot_region` VALUES ('341723', 3, '区县', 'q', 'qyx', '青阳县', '341700', 'qingyangxian');
INSERT INTO `ot_region` VALUES ('341800', 2, '城市', 'x', 'xcs', '宣城市', '340000', 'xuanchengshi');
INSERT INTO `ot_region` VALUES ('341802', 3, '区县', 'x', 'xzq', '宣州区', '341800', 'xuanzhouqu');
INSERT INTO `ot_region` VALUES ('341821', 3, '区县', 'l', 'lxx', '郎溪县', '341800', 'langxixian');
INSERT INTO `ot_region` VALUES ('341822', 3, '区县', 'g', 'gdx', '广德县', '341800', 'guangdexian');
INSERT INTO `ot_region` VALUES ('341823', 3, '区县', 'j', 'jx', '泾县', '341800', 'jingxian');
INSERT INTO `ot_region` VALUES ('341824', 3, '区县', 'j', 'jxx', '绩溪县', '341800', 'jixixian');
INSERT INTO `ot_region` VALUES ('341825', 3, '区县', 'j', 'jdx', '旌德县', '341800', 'jingdexian');
INSERT INTO `ot_region` VALUES ('341881', 3, '区县', 'n', 'ngs', '宁国市', '341800', 'ningguoshi');
INSERT INTO `ot_region` VALUES ('350100', 2, '城市', 'f', 'fzs', '福州市', '350000', 'fuzhoushi');
INSERT INTO `ot_region` VALUES ('350102', 3, '区县', 'g', 'glq', '鼓楼区', '350100', 'gulouqu');
INSERT INTO `ot_region` VALUES ('350103', 3, '区县', 't', 'tjq', '台江区', '350100', 'taijiangqu');
INSERT INTO `ot_region` VALUES ('350104', 3, '区县', 'c', 'csq', '仓山区', '350100', 'cangshanqu');
INSERT INTO `ot_region` VALUES ('350105', 3, '区县', 'm', 'mwq', '马尾区', '350100', 'maweiqu');
INSERT INTO `ot_region` VALUES ('350111', 3, '区县', 'j', 'jaq', '晋安区', '350100', 'jinanqu');
INSERT INTO `ot_region` VALUES ('350112', 3, '区县', 'z', 'zlq', '长乐区', '350100', 'zhanglequ');
INSERT INTO `ot_region` VALUES ('350121', 3, '区县', 'm', 'mhx', '闽侯县', '350100', 'minhouxian');
INSERT INTO `ot_region` VALUES ('350122', 3, '区县', 'l', 'ljx', '连江县', '350100', 'lianjiangxian');
INSERT INTO `ot_region` VALUES ('350123', 3, '区县', 'l', 'lyx', '罗源县', '350100', 'luoyuanxian');
INSERT INTO `ot_region` VALUES ('350124', 3, '区县', 'm', 'mqx', '闽清县', '350100', 'minqingxian');
INSERT INTO `ot_region` VALUES ('350125', 3, '区县', 'y', 'ytx', '永泰县', '350100', 'yongtaixian');
INSERT INTO `ot_region` VALUES ('350128', 3, '区县', 'p', 'ptx', '平潭县', '350100', 'pingtanxian');
INSERT INTO `ot_region` VALUES ('350181', 3, '区县', 'f', 'fqs', '福清市', '350100', 'fuqingshi');
INSERT INTO `ot_region` VALUES ('350200', 2, '城市', 's', 'sms', '厦门市', '350000', 'shamenshi');
INSERT INTO `ot_region` VALUES ('350203', 3, '区县', 's', 'smq', '思明区', '350200', 'simingqu');
INSERT INTO `ot_region` VALUES ('350205', 3, '区县', 'h', 'hcq', '海沧区', '350200', 'haicangqu');
INSERT INTO `ot_region` VALUES ('350206', 3, '区县', 'h', 'hlq', '湖里区', '350200', 'huliqu');
INSERT INTO `ot_region` VALUES ('350211', 3, '区县', 'j', 'jmq', '集美区', '350200', 'jimeiqu');
INSERT INTO `ot_region` VALUES ('350212', 3, '区县', 't', 'taq', '同安区', '350200', 'tonganqu');
INSERT INTO `ot_region` VALUES ('350213', 3, '区县', 'x', 'xaq', '翔安区', '350200', 'xianganqu');
INSERT INTO `ot_region` VALUES ('350300', 2, '城市', 'p', 'pts', '莆田市', '350000', 'putianshi');
INSERT INTO `ot_region` VALUES ('350302', 3, '区县', 'c', 'cxq', '城厢区', '350300', 'chengxiangqu');
INSERT INTO `ot_region` VALUES ('350303', 3, '区县', 'h', 'hjq', '涵江区', '350300', 'hanjiangqu');
INSERT INTO `ot_region` VALUES ('350304', 3, '区县', 'l', 'lcq', '荔城区', '350300', 'lichengqu');
INSERT INTO `ot_region` VALUES ('350305', 3, '区县', 'x', 'xyq', '秀屿区', '350300', 'xiuyuqu');
INSERT INTO `ot_region` VALUES ('350322', 3, '区县', 'x', 'xyx', '仙游县', '350300', 'xianyouxian');
INSERT INTO `ot_region` VALUES ('350400', 2, '城市', 's', 'sms', '三明市', '350000', 'sanmingshi');
INSERT INTO `ot_region` VALUES ('350402', 3, '区县', 'm', 'mlq', '梅列区', '350400', 'meiliequ');
INSERT INTO `ot_region` VALUES ('350403', 3, '区县', 's', 'syq', '三元区', '350400', 'sanyuanqu');
INSERT INTO `ot_region` VALUES ('350421', 3, '区县', 'm', 'mxx', '明溪县', '350400', 'mingxixian');
INSERT INTO `ot_region` VALUES ('350423', 3, '区县', 'q', 'qlx', '清流县', '350400', 'qingliuxian');
INSERT INTO `ot_region` VALUES ('350424', 3, '区县', 'n', 'nhx', '宁化县', '350400', 'ninghuaxian');
INSERT INTO `ot_region` VALUES ('350425', 3, '区县', 'd', 'dtx', '大田县', '350400', 'datianxian');
INSERT INTO `ot_region` VALUES ('350426', 3, '区县', 'y', 'yxx', '尤溪县', '350400', 'youxixian');
INSERT INTO `ot_region` VALUES ('350427', 3, '区县', 's', 'sx', '沙县', '350400', 'shaxian');
INSERT INTO `ot_region` VALUES ('350428', 3, '区县', 'j', 'jlx', '将乐县', '350400', 'jianglexian');
INSERT INTO `ot_region` VALUES ('350429', 3, '区县', 't', 'tnx', '泰宁县', '350400', 'tainingxian');
INSERT INTO `ot_region` VALUES ('350430', 3, '区县', 'j', 'jnx', '建宁县', '350400', 'jianningxian');
INSERT INTO `ot_region` VALUES ('350481', 3, '区县', 'y', 'yas', '永安市', '350400', 'yonganshi');
INSERT INTO `ot_region` VALUES ('350500', 2, '城市', 'q', 'qzs', '泉州市', '350000', 'quanzhoushi');
INSERT INTO `ot_region` VALUES ('350502', 3, '区县', 'l', 'lcq', '鲤城区', '350500', 'lichengqu');
INSERT INTO `ot_region` VALUES ('350503', 3, '区县', 'f', 'fzq', '丰泽区', '350500', 'fengzequ');
INSERT INTO `ot_region` VALUES ('350504', 3, '区县', 'l', 'ljq', '洛江区', '350500', 'luojiangqu');
INSERT INTO `ot_region` VALUES ('350505', 3, '区县', 'q', 'qgq', '泉港区', '350500', 'quangangqu');
INSERT INTO `ot_region` VALUES ('350521', 3, '区县', 'h', 'hax', '惠安县', '350500', 'huianxian');
INSERT INTO `ot_region` VALUES ('350524', 3, '区县', 'a', 'axx', '安溪县', '350500', 'anxixian');
INSERT INTO `ot_region` VALUES ('350525', 3, '区县', 'y', 'ycx', '永春县', '350500', 'yongchunxian');
INSERT INTO `ot_region` VALUES ('350526', 3, '区县', 'd', 'dhx', '德化县', '350500', 'dehuaxian');
INSERT INTO `ot_region` VALUES ('350527', 3, '区县', 'j', 'jmx', '金门县', '350500', 'jinmenxian');
INSERT INTO `ot_region` VALUES ('350581', 3, '区县', 's', 'sss', '石狮市', '350500', 'shishishi');
INSERT INTO `ot_region` VALUES ('350582', 3, '区县', 'j', 'jjs', '晋江市', '350500', 'jinjiangshi');
INSERT INTO `ot_region` VALUES ('350583', 3, '区县', 'n', 'nas', '南安市', '350500', 'nananshi');
INSERT INTO `ot_region` VALUES ('350600', 2, '城市', 'z', 'zzs', '漳州市', '350000', 'zhangzhoushi');
INSERT INTO `ot_region` VALUES ('350602', 3, '区县', 'x', 'xcq', '芗城区', '350600', 'xiangchengqu');
INSERT INTO `ot_region` VALUES ('350603', 3, '区县', 'l', 'lwq', '龙文区', '350600', 'longwenqu');
INSERT INTO `ot_region` VALUES ('350622', 3, '区县', 'y', 'yxx', '云霄县', '350600', 'yunxiaoxian');
INSERT INTO `ot_region` VALUES ('350623', 3, '区县', 'z', 'zpx', '漳浦县', '350600', 'zhangpuxian');
INSERT INTO `ot_region` VALUES ('350624', 3, '区县', 'z', 'zax', '诏安县', '350600', 'zhaoanxian');
INSERT INTO `ot_region` VALUES ('350625', 3, '区县', 'z', 'ztx', '长泰县', '350600', 'zhangtaixian');
INSERT INTO `ot_region` VALUES ('350626', 3, '区县', 'd', 'dsx', '东山县', '350600', 'dongshanxian');
INSERT INTO `ot_region` VALUES ('350627', 3, '区县', 'n', 'njx', '南靖县', '350600', 'nanjingxian');
INSERT INTO `ot_region` VALUES ('350628', 3, '区县', 'p', 'phx', '平和县', '350600', 'pinghexian');
INSERT INTO `ot_region` VALUES ('350629', 3, '区县', 'h', 'hax', '华安县', '350600', 'huaanxian');
INSERT INTO `ot_region` VALUES ('350681', 3, '区县', 'l', 'lhs', '龙海市', '350600', 'longhaishi');
INSERT INTO `ot_region` VALUES ('350700', 2, '城市', 'n', 'nps', '南平市', '350000', 'nanpingshi');
INSERT INTO `ot_region` VALUES ('350702', 3, '区县', 'y', 'ypq', '延平区', '350700', 'yanpingqu');
INSERT INTO `ot_region` VALUES ('350703', 3, '区县', 'j', 'jyq', '建阳区', '350700', 'jianyangqu');
INSERT INTO `ot_region` VALUES ('350721', 3, '区县', 's', 'scx', '顺昌县', '350700', 'shunchangxian');
INSERT INTO `ot_region` VALUES ('350722', 3, '区县', 'p', 'pcx', '浦城县', '350700', 'puchengxian');
INSERT INTO `ot_region` VALUES ('350723', 3, '区县', 'g', 'gzx', '光泽县', '350700', 'guangzexian');
INSERT INTO `ot_region` VALUES ('350724', 3, '区县', 's', 'sxx', '松溪县', '350700', 'songxixian');
INSERT INTO `ot_region` VALUES ('350725', 3, '区县', 'z', 'zhx', '政和县', '350700', 'zhenghexian');
INSERT INTO `ot_region` VALUES ('350781', 3, '区县', 's', 'sws', '邵武市', '350700', 'shaowushi');
INSERT INTO `ot_region` VALUES ('350782', 3, '区县', 'w', 'wyss', '武夷山市', '350700', 'wuyishanshi');
INSERT INTO `ot_region` VALUES ('350783', 3, '区县', 'j', 'jos', '建瓯市', '350700', 'jianoushi');
INSERT INTO `ot_region` VALUES ('350800', 2, '城市', 'l', 'lys', '龙岩市', '350000', 'longyanshi');
INSERT INTO `ot_region` VALUES ('350802', 3, '区县', 'x', 'xlq', '新罗区', '350800', 'xinluoqu');
INSERT INTO `ot_region` VALUES ('350803', 3, '区县', 'y', 'ydq', '永定区', '350800', 'yongdingqu');
INSERT INTO `ot_region` VALUES ('350821', 3, '区县', 'z', 'ztx', '长汀县', '350800', 'zhangtingxian');
INSERT INTO `ot_region` VALUES ('350823', 3, '区县', 's', 'shx', '上杭县', '350800', 'shanghangxian');
INSERT INTO `ot_region` VALUES ('350824', 3, '区县', 'w', 'wpx', '武平县', '350800', 'wupingxian');
INSERT INTO `ot_region` VALUES ('350825', 3, '区县', 'l', 'lcx', '连城县', '350800', 'lianchengxian');
INSERT INTO `ot_region` VALUES ('350881', 3, '区县', 'z', 'zps', '漳平市', '350800', 'zhangpingshi');
INSERT INTO `ot_region` VALUES ('350900', 2, '城市', 'n', 'nds', '宁德市', '350000', 'ningdeshi');
INSERT INTO `ot_region` VALUES ('350902', 3, '区县', 'j', 'jcq', '蕉城区', '350900', 'jiaochengqu');
INSERT INTO `ot_region` VALUES ('350921', 3, '区县', 'x', 'xpx', '霞浦县', '350900', 'xiapuxian');
INSERT INTO `ot_region` VALUES ('350922', 3, '区县', 'g', 'gtx', '古田县', '350900', 'gutianxian');
INSERT INTO `ot_region` VALUES ('350923', 3, '区县', 'p', 'pnx', '屏南县', '350900', 'pingnanxian');
INSERT INTO `ot_region` VALUES ('350924', 3, '区县', 's', 'snx', '寿宁县', '350900', 'shouningxian');
INSERT INTO `ot_region` VALUES ('350925', 3, '区县', 'z', 'znx', '周宁县', '350900', 'zhouningxian');
INSERT INTO `ot_region` VALUES ('350926', 3, '区县', 'z', 'zrx', '柘荣县', '350900', 'zherongxian');
INSERT INTO `ot_region` VALUES ('350981', 3, '区县', 'f', 'fas', '福安市', '350900', 'fuanshi');
INSERT INTO `ot_region` VALUES ('350982', 3, '区县', 'f', 'fds', '福鼎市', '350900', 'fudingshi');
INSERT INTO `ot_region` VALUES ('360100', 2, '城市', 'n', 'ncs', '南昌市', '360000', 'nanchangshi');
INSERT INTO `ot_region` VALUES ('360102', 3, '区县', 'd', 'dhq', '东湖区', '360100', 'donghuqu');
INSERT INTO `ot_region` VALUES ('360103', 3, '区县', 'x', 'xhq', '西湖区', '360100', 'xihuqu');
INSERT INTO `ot_region` VALUES ('360104', 3, '区县', 'q', 'qypq', '青云谱区', '360100', 'qingyunpuqu');
INSERT INTO `ot_region` VALUES ('360105', 3, '区县', 'w', 'wlq', '湾里区', '360100', 'wanliqu');
INSERT INTO `ot_region` VALUES ('360111', 3, '区县', 'q', 'qshq', '青山湖区', '360100', 'qingshanhuqu');
INSERT INTO `ot_region` VALUES ('360112', 3, '区县', 'x', 'xjq', '新建区', '360100', 'xinjianqu');
INSERT INTO `ot_region` VALUES ('360121', 3, '区县', 'n', 'ncx', '南昌县', '360100', 'nanchangxian');
INSERT INTO `ot_region` VALUES ('360123', 3, '区县', 'a', 'ayx', '安义县', '360100', 'anyixian');
INSERT INTO `ot_region` VALUES ('360124', 3, '区县', 'j', 'jxx', '进贤县', '360100', 'jinxianxian');
INSERT INTO `ot_region` VALUES ('360190', 3, '区县', 'j', 'jjjskfq', '经济技术开发区', '360100', 'jingjijishukaifaqu');
INSERT INTO `ot_region` VALUES ('360192', 3, '区县', 'g', 'gxq', '高新区', '360100', 'gaoxinqu');
INSERT INTO `ot_region` VALUES ('360200', 2, '城市', 'j', 'jdzs', '景德镇市', '360000', 'jingdezhenshi');
INSERT INTO `ot_region` VALUES ('360202', 3, '区县', 'c', 'cjq', '昌江区', '360200', 'changjiangqu');
INSERT INTO `ot_region` VALUES ('360203', 3, '区县', 'z', 'zsq', '珠山区', '360200', 'zhushanqu');
INSERT INTO `ot_region` VALUES ('360222', 3, '区县', 'f', 'flx', '浮梁县', '360200', 'fuliangxian');
INSERT INTO `ot_region` VALUES ('360281', 3, '区县', 'l', 'lps', '乐平市', '360200', 'lepingshi');
INSERT INTO `ot_region` VALUES ('360300', 2, '城市', 'p', 'pxs', '萍乡市', '360000', 'pingxiangshi');
INSERT INTO `ot_region` VALUES ('360302', 3, '区县', 'a', 'ayq', '安源区', '360300', 'anyuanqu');
INSERT INTO `ot_region` VALUES ('360313', 3, '区县', 'x', 'xdq', '湘东区', '360300', 'xiangdongqu');
INSERT INTO `ot_region` VALUES ('360321', 3, '区县', 'l', 'lhx', '莲花县', '360300', 'lianhuaxian');
INSERT INTO `ot_region` VALUES ('360322', 3, '区县', 's', 'slx', '上栗县', '360300', 'shanglixian');
INSERT INTO `ot_region` VALUES ('360323', 3, '区县', 'l', 'lxx', '芦溪县', '360300', 'luxixian');
INSERT INTO `ot_region` VALUES ('360400', 2, '城市', 'j', 'jjs', '九江市', '360000', 'jiujiangshi');
INSERT INTO `ot_region` VALUES ('360402', 3, '区县', 'l', 'lxq', '濂溪区', '360400', 'lianxiqu');
INSERT INTO `ot_region` VALUES ('360403', 3, '区县', 'x', 'xyq', '浔阳区', '360400', 'xunyangqu');
INSERT INTO `ot_region` VALUES ('360404', 3, '区县', 'c', 'csq', '柴桑区', '360400', 'chaisangqu');
INSERT INTO `ot_region` VALUES ('360423', 3, '区县', 'w', 'wnx', '武宁县', '360400', 'wuningxian');
INSERT INTO `ot_region` VALUES ('360424', 3, '区县', 'x', 'xsx', '修水县', '360400', 'xiushuixian');
INSERT INTO `ot_region` VALUES ('360425', 3, '区县', 'y', 'yxx', '永修县', '360400', 'yongxiuxian');
INSERT INTO `ot_region` VALUES ('360426', 3, '区县', 'd', 'dax', '德安县', '360400', 'deanxian');
INSERT INTO `ot_region` VALUES ('360428', 3, '区县', 'd', 'dcx', '都昌县', '360400', 'douchangxian');
INSERT INTO `ot_region` VALUES ('360429', 3, '区县', 'h', 'hkx', '湖口县', '360400', 'hukouxian');
INSERT INTO `ot_region` VALUES ('360430', 3, '区县', 'p', 'pzx', '彭泽县', '360400', 'pengzexian');
INSERT INTO `ot_region` VALUES ('360481', 3, '区县', 'r', 'rcs', '瑞昌市', '360400', 'ruichangshi');
INSERT INTO `ot_region` VALUES ('360482', 3, '区县', 'g', 'gqcs', '共青城市', '360400', 'gongqingchengshi');
INSERT INTO `ot_region` VALUES ('360483', 3, '区县', 'l', 'lss', '庐山市', '360400', 'lushanshi');
INSERT INTO `ot_region` VALUES ('360490', 3, '区县', 'j', 'jjjskfq', '经济技术开发区', '360400', 'jingjijishukaifaqu');
INSERT INTO `ot_region` VALUES ('360500', 2, '城市', 'x', 'xys', '新余市', '360000', 'xinyushi');
INSERT INTO `ot_region` VALUES ('360502', 3, '区县', 'y', 'ysq', '渝水区', '360500', 'yushuiqu');
INSERT INTO `ot_region` VALUES ('360521', 3, '区县', 'f', 'fyx', '分宜县', '360500', 'fenyixian');
INSERT INTO `ot_region` VALUES ('360600', 2, '城市', 'y', 'yts', '鹰潭市', '360000', 'yingtanshi');
INSERT INTO `ot_region` VALUES ('360602', 3, '区县', 'y', 'yhq', '月湖区', '360600', 'yuehuqu');
INSERT INTO `ot_region` VALUES ('360603', 3, '区县', 'y', 'yjq', '余江区', '360600', 'yujiangqu');
INSERT INTO `ot_region` VALUES ('360681', 3, '区县', 'g', 'gxs', '贵溪市', '360600', 'guixishi');
INSERT INTO `ot_region` VALUES ('360700', 2, '城市', 'g', 'gzs', '赣州市', '360000', 'ganzhoushi');
INSERT INTO `ot_region` VALUES ('360702', 3, '区县', 'z', 'zgq', '章贡区', '360700', 'zhanggongqu');
INSERT INTO `ot_region` VALUES ('360703', 3, '区县', 'n', 'nkq', '南康区', '360700', 'nankangqu');
INSERT INTO `ot_region` VALUES ('360704', 3, '区县', 'g', 'gxq', '赣县区', '360700', 'ganxianqu');
INSERT INTO `ot_region` VALUES ('360722', 3, '区县', 'x', 'xfx', '信丰县', '360700', 'xinfengxian');
INSERT INTO `ot_region` VALUES ('360723', 3, '区县', 'd', 'dyx', '大余县', '360700', 'dayuxian');
INSERT INTO `ot_region` VALUES ('360724', 3, '区县', 's', 'syx', '上犹县', '360700', 'shangyouxian');
INSERT INTO `ot_region` VALUES ('360725', 3, '区县', 'c', 'cyx', '崇义县', '360700', 'chongyixian');
INSERT INTO `ot_region` VALUES ('360726', 3, '区县', 'a', 'ayx', '安远县', '360700', 'anyuanxian');
INSERT INTO `ot_region` VALUES ('360727', 3, '区县', 'l', 'lnx', '龙南县', '360700', 'longnanxian');
INSERT INTO `ot_region` VALUES ('360728', 3, '区县', 'd', 'dnx', '定南县', '360700', 'dingnanxian');
INSERT INTO `ot_region` VALUES ('360729', 3, '区县', 'q', 'qnx', '全南县', '360700', 'quannanxian');
INSERT INTO `ot_region` VALUES ('360730', 3, '区县', 'n', 'ndx', '宁都县', '360700', 'ningdouxian');
INSERT INTO `ot_region` VALUES ('360731', 3, '区县', 'y', 'ydx', '于都县', '360700', 'yudouxian');
INSERT INTO `ot_region` VALUES ('360732', 3, '区县', 'x', 'xgx', '兴国县', '360700', 'xingguoxian');
INSERT INTO `ot_region` VALUES ('360733', 3, '区县', 'h', 'hcx', '会昌县', '360700', 'huichangxian');
INSERT INTO `ot_region` VALUES ('360734', 3, '区县', 'x', 'xwx', '寻乌县', '360700', 'xunwuxian');
INSERT INTO `ot_region` VALUES ('360735', 3, '区县', 's', 'scx', '石城县', '360700', 'shichengxian');
INSERT INTO `ot_region` VALUES ('360781', 3, '区县', 'r', 'rjs', '瑞金市', '360700', 'ruijinshi');
INSERT INTO `ot_region` VALUES ('360800', 2, '城市', 'j', 'jas', '吉安市', '360000', 'jianshi');
INSERT INTO `ot_region` VALUES ('360802', 3, '区县', 'j', 'jzq', '吉州区', '360800', 'jizhouqu');
INSERT INTO `ot_region` VALUES ('360803', 3, '区县', 'q', 'qyq', '青原区', '360800', 'qingyuanqu');
INSERT INTO `ot_region` VALUES ('360821', 3, '区县', 'j', 'jax', '吉安县', '360800', 'jianxian');
INSERT INTO `ot_region` VALUES ('360822', 3, '区县', 'j', 'jsx', '吉水县', '360800', 'jishuixian');
INSERT INTO `ot_region` VALUES ('360823', 3, '区县', 'x', 'xjx', '峡江县', '360800', 'xiajiangxian');
INSERT INTO `ot_region` VALUES ('360824', 3, '区县', 'x', 'xgx', '新干县', '360800', 'xinganxian');
INSERT INTO `ot_region` VALUES ('360825', 3, '区县', 'y', 'yfx', '永丰县', '360800', 'yongfengxian');
INSERT INTO `ot_region` VALUES ('360826', 3, '区县', 't', 'thx', '泰和县', '360800', 'taihexian');
INSERT INTO `ot_region` VALUES ('360827', 3, '区县', 's', 'scx', '遂川县', '360800', 'suichuanxian');
INSERT INTO `ot_region` VALUES ('360828', 3, '区县', 'w', 'wax', '万安县', '360800', 'wananxian');
INSERT INTO `ot_region` VALUES ('360829', 3, '区县', 'a', 'afx', '安福县', '360800', 'anfuxian');
INSERT INTO `ot_region` VALUES ('360830', 3, '区县', 'y', 'yxx', '永新县', '360800', 'yongxinxian');
INSERT INTO `ot_region` VALUES ('360881', 3, '区县', 'j', 'jgss', '井冈山市', '360800', 'jinggangshanshi');
INSERT INTO `ot_region` VALUES ('360900', 2, '城市', 'y', 'ycs', '宜春市', '360000', 'yichunshi');
INSERT INTO `ot_region` VALUES ('360902', 3, '区县', 'y', 'yzq', '袁州区', '360900', 'yuanzhouqu');
INSERT INTO `ot_region` VALUES ('360921', 3, '区县', 'f', 'fxx', '奉新县', '360900', 'fengxinxian');
INSERT INTO `ot_region` VALUES ('360922', 3, '区县', 'w', 'wzx', '万载县', '360900', 'wanzaixian');
INSERT INTO `ot_region` VALUES ('360923', 3, '区县', 's', 'sgx', '上高县', '360900', 'shanggaoxian');
INSERT INTO `ot_region` VALUES ('360924', 3, '区县', 'y', 'yfx', '宜丰县', '360900', 'yifengxian');
INSERT INTO `ot_region` VALUES ('360925', 3, '区县', 'j', 'jax', '靖安县', '360900', 'jinganxian');
INSERT INTO `ot_region` VALUES ('360926', 3, '区县', 't', 'tgx', '铜鼓县', '360900', 'tongguxian');
INSERT INTO `ot_region` VALUES ('360981', 3, '区县', 'f', 'fcs', '丰城市', '360900', 'fengchengshi');
INSERT INTO `ot_region` VALUES ('360982', 3, '区县', 'z', 'zss', '樟树市', '360900', 'zhangshushi');
INSERT INTO `ot_region` VALUES ('360983', 3, '区县', 'g', 'gas', '高安市', '360900', 'gaoanshi');
INSERT INTO `ot_region` VALUES ('361000', 2, '城市', 'f', 'fzs', '抚州市', '360000', 'fuzhoushi');
INSERT INTO `ot_region` VALUES ('361002', 3, '区县', 'l', 'lcq', '临川区', '361000', 'linchuanqu');
INSERT INTO `ot_region` VALUES ('361003', 3, '区县', 'd', 'dxq', '东乡区', '361000', 'dongxiangqu');
INSERT INTO `ot_region` VALUES ('361021', 3, '区县', 'n', 'ncx', '南城县', '361000', 'nanchengxian');
INSERT INTO `ot_region` VALUES ('361022', 3, '区县', 'l', 'lcx', '黎川县', '361000', 'lichuanxian');
INSERT INTO `ot_region` VALUES ('361023', 3, '区县', 'n', 'nfx', '南丰县', '361000', 'nanfengxian');
INSERT INTO `ot_region` VALUES ('361024', 3, '区县', 'c', 'crx', '崇仁县', '361000', 'chongrenxian');
INSERT INTO `ot_region` VALUES ('361025', 3, '区县', 'l', 'lax', '乐安县', '361000', 'leanxian');
INSERT INTO `ot_region` VALUES ('361026', 3, '区县', 'y', 'yhx', '宜黄县', '361000', 'yihuangxian');
INSERT INTO `ot_region` VALUES ('361027', 3, '区县', 'j', 'jxx', '金溪县', '361000', 'jinxixian');
INSERT INTO `ot_region` VALUES ('361028', 3, '区县', 'z', 'zxx', '资溪县', '361000', 'zixixian');
INSERT INTO `ot_region` VALUES ('361030', 3, '区县', 'g', 'gcx', '广昌县', '361000', 'guangchangxian');
INSERT INTO `ot_region` VALUES ('361100', 2, '城市', 's', 'srs', '上饶市', '360000', 'shangraoshi');
INSERT INTO `ot_region` VALUES ('361102', 3, '区县', 'x', 'xzq', '信州区', '361100', 'xinzhouqu');
INSERT INTO `ot_region` VALUES ('361103', 3, '区县', 'g', 'gfq', '广丰区', '361100', 'guangfengqu');
INSERT INTO `ot_region` VALUES ('361121', 3, '区县', 's', 'srx', '上饶县', '361100', 'shangraoxian');
INSERT INTO `ot_region` VALUES ('361123', 3, '区县', 'y', 'ysx', '玉山县', '361100', 'yushanxian');
INSERT INTO `ot_region` VALUES ('361124', 3, '区县', 'q', 'qsx', '铅山县', '361100', 'qianshanxian');
INSERT INTO `ot_region` VALUES ('361125', 3, '区县', 'h', 'hfx', '横峰县', '361100', 'hengfengxian');
INSERT INTO `ot_region` VALUES ('361126', 3, '区县', 'y', 'yyx', '弋阳县', '361100', 'yiyangxian');
INSERT INTO `ot_region` VALUES ('361127', 3, '区县', 'y', 'ygx', '余干县', '361100', 'yuganxian');
INSERT INTO `ot_region` VALUES ('361128', 3, '区县', 'p', 'pyx', '鄱阳县', '361100', 'poyangxian');
INSERT INTO `ot_region` VALUES ('361129', 3, '区县', 'w', 'wnx', '万年县', '361100', 'wannianxian');
INSERT INTO `ot_region` VALUES ('361130', 3, '区县', 'w', 'wyx', '婺源县', '361100', 'wuyuanxian');
INSERT INTO `ot_region` VALUES ('361181', 3, '区县', 'd', 'dxs', '德兴市', '361100', 'dexingshi');
INSERT INTO `ot_region` VALUES ('370100', 2, '城市', 'j', 'jns', '济南市', '370000', 'jinanshi');
INSERT INTO `ot_region` VALUES ('370102', 3, '区县', 'l', 'lxq', '历下区', '370100', 'lixiaqu');
INSERT INTO `ot_region` VALUES ('370103', 3, '区县', 's', 'szq', '市中区', '370100', 'shizhongqu');
INSERT INTO `ot_region` VALUES ('370104', 3, '区县', 'h', 'hyq', '槐荫区', '370100', 'huaiyinqu');
INSERT INTO `ot_region` VALUES ('370105', 3, '区县', 't', 'tqq', '天桥区', '370100', 'tianqiaoqu');
INSERT INTO `ot_region` VALUES ('370112', 3, '区县', 'l', 'lcq', '历城区', '370100', 'lichengqu');
INSERT INTO `ot_region` VALUES ('370113', 3, '区县', 'z', 'zqq', '长清区', '370100', 'zhangqingqu');
INSERT INTO `ot_region` VALUES ('370114', 3, '区县', 'z', 'zqq', '章丘区', '370100', 'zhangqiuqu');
INSERT INTO `ot_region` VALUES ('370115', 3, '区县', 'j', 'jyq', '济阳区', '370100', 'jiyangqu');
INSERT INTO `ot_region` VALUES ('370124', 3, '区县', 'p', 'pyx', '平阴县', '370100', 'pingyinxian');
INSERT INTO `ot_region` VALUES ('370126', 3, '区县', 's', 'shx', '商河县', '370100', 'shanghexian');
INSERT INTO `ot_region` VALUES ('370190', 3, '区县', 'g', 'gxq', '高新区', '370100', 'gaoxinqu');
INSERT INTO `ot_region` VALUES ('370200', 2, '城市', 'q', 'qds', '青岛市', '370000', 'qingdaoshi');
INSERT INTO `ot_region` VALUES ('370202', 3, '区县', 's', 'snq', '市南区', '370200', 'shinanqu');
INSERT INTO `ot_region` VALUES ('370203', 3, '区县', 's', 'sbq', '市北区', '370200', 'shibeiqu');
INSERT INTO `ot_region` VALUES ('370211', 3, '区县', 'h', 'hdq', '黄岛区', '370200', 'huangdaoqu');
INSERT INTO `ot_region` VALUES ('370212', 3, '区县', 'l', 'lsq', '崂山区', '370200', 'laoshanqu');
INSERT INTO `ot_region` VALUES ('370213', 3, '区县', 'l', 'lcq', '李沧区', '370200', 'licangqu');
INSERT INTO `ot_region` VALUES ('370214', 3, '区县', 'c', 'cyq', '城阳区', '370200', 'chengyangqu');
INSERT INTO `ot_region` VALUES ('370215', 3, '区县', 'j', 'jmq', '即墨区', '370200', 'jimoqu');
INSERT INTO `ot_region` VALUES ('370281', 3, '区县', 'j', 'jzs', '胶州市', '370200', 'jiaozhoushi');
INSERT INTO `ot_region` VALUES ('370283', 3, '区县', 'p', 'pds', '平度市', '370200', 'pingdushi');
INSERT INTO `ot_region` VALUES ('370285', 3, '区县', 'l', 'lxs', '莱西市', '370200', 'laixishi');
INSERT INTO `ot_region` VALUES ('370290', 3, '区县', 'k', 'kfq', '开发区', '370200', 'kaifaqu');
INSERT INTO `ot_region` VALUES ('370300', 2, '城市', 'z', 'zbs', '淄博市', '370000', 'ziboshi');
INSERT INTO `ot_region` VALUES ('370302', 3, '区县', 'z', 'zcq', '淄川区', '370300', 'zichuanqu');
INSERT INTO `ot_region` VALUES ('370303', 3, '区县', 'z', 'zdq', '张店区', '370300', 'zhangdianqu');
INSERT INTO `ot_region` VALUES ('370304', 3, '区县', 'b', 'bsq', '博山区', '370300', 'boshanqu');
INSERT INTO `ot_region` VALUES ('370305', 3, '区县', 'l', 'lzq', '临淄区', '370300', 'linziqu');
INSERT INTO `ot_region` VALUES ('370306', 3, '区县', 'z', 'zcq', '周村区', '370300', 'zhoucunqu');
INSERT INTO `ot_region` VALUES ('370321', 3, '区县', 'h', 'htx', '桓台县', '370300', 'huantaixian');
INSERT INTO `ot_region` VALUES ('370322', 3, '区县', 'g', 'gqx', '高青县', '370300', 'gaoqingxian');
INSERT INTO `ot_region` VALUES ('370323', 3, '区县', 'y', 'yyx', '沂源县', '370300', 'yiyuanxian');
INSERT INTO `ot_region` VALUES ('370400', 2, '城市', 'z', 'zzs', '枣庄市', '370000', 'zaozhuangshi');
INSERT INTO `ot_region` VALUES ('370402', 3, '区县', 's', 'szq', '市中区', '370400', 'shizhongqu');
INSERT INTO `ot_region` VALUES ('370403', 3, '区县', 'x', 'xcq', '薛城区', '370400', 'xuechengqu');
INSERT INTO `ot_region` VALUES ('370404', 3, '区县', 'y', 'ycq', '峄城区', '370400', 'yichengqu');
INSERT INTO `ot_region` VALUES ('370405', 3, '区县', 't', 'tezq', '台儿庄区', '370400', 'taierzhuangqu');
INSERT INTO `ot_region` VALUES ('370406', 3, '区县', 's', 'stq', '山亭区', '370400', 'shantingqu');
INSERT INTO `ot_region` VALUES ('370481', 3, '区县', 't', 'tzs', '滕州市', '370400', 'tengzhoushi');
INSERT INTO `ot_region` VALUES ('370500', 2, '城市', 'd', 'dys', '东营市', '370000', 'dongyingshi');
INSERT INTO `ot_region` VALUES ('370502', 3, '区县', 'd', 'dyq', '东营区', '370500', 'dongyingqu');
INSERT INTO `ot_region` VALUES ('370503', 3, '区县', 'h', 'hkq', '河口区', '370500', 'hekouqu');
INSERT INTO `ot_region` VALUES ('370505', 3, '区县', 'k', 'klq', '垦利区', '370500', 'kenliqu');
INSERT INTO `ot_region` VALUES ('370522', 3, '区县', 'l', 'ljx', '利津县', '370500', 'lijinxian');
INSERT INTO `ot_region` VALUES ('370523', 3, '区县', 'g', 'grx', '广饶县', '370500', 'guangraoxian');
INSERT INTO `ot_region` VALUES ('370600', 2, '城市', 'y', 'yts', '烟台市', '370000', 'yantaishi');
INSERT INTO `ot_region` VALUES ('370602', 3, '区县', 'z', 'zfq', '芝罘区', '370600', 'zhifuqu');
INSERT INTO `ot_region` VALUES ('370611', 3, '区县', 'f', 'fsq', '福山区', '370600', 'fushanqu');
INSERT INTO `ot_region` VALUES ('370612', 3, '区县', 'm', 'mpq', '牟平区', '370600', 'moupingqu');
INSERT INTO `ot_region` VALUES ('370613', 3, '区县', 'l', 'lsq', '莱山区', '370600', 'laishanqu');
INSERT INTO `ot_region` VALUES ('370634', 3, '区县', 'z', 'zdx', '长岛县', '370600', 'zhangdaoxian');
INSERT INTO `ot_region` VALUES ('370681', 3, '区县', 'l', 'lks', '龙口市', '370600', 'longkoushi');
INSERT INTO `ot_region` VALUES ('370682', 3, '区县', 'l', 'lys', '莱阳市', '370600', 'laiyangshi');
INSERT INTO `ot_region` VALUES ('370683', 3, '区县', 'l', 'lzs', '莱州市', '370600', 'laizhoushi');
INSERT INTO `ot_region` VALUES ('370684', 3, '区县', 'p', 'pls', '蓬莱市', '370600', 'penglaishi');
INSERT INTO `ot_region` VALUES ('370685', 3, '区县', 'z', 'zys', '招远市', '370600', 'zhaoyuanshi');
INSERT INTO `ot_region` VALUES ('370686', 3, '区县', 'q', 'qxs', '栖霞市', '370600', 'qixiashi');
INSERT INTO `ot_region` VALUES ('370687', 3, '区县', 'h', 'hys', '海阳市', '370600', 'haiyangshi');
INSERT INTO `ot_region` VALUES ('370690', 3, '区县', 'k', 'kfq', '开发区', '370600', 'kaifaqu');
INSERT INTO `ot_region` VALUES ('370700', 2, '城市', 'w', 'wfs', '潍坊市', '370000', 'weifangshi');
INSERT INTO `ot_region` VALUES ('370702', 3, '区县', 'w', 'wcq', '潍城区', '370700', 'weichengqu');
INSERT INTO `ot_region` VALUES ('370703', 3, '区县', 'h', 'htq', '寒亭区', '370700', 'hantingqu');
INSERT INTO `ot_region` VALUES ('370704', 3, '区县', 'f', 'fzq', '坊子区', '370700', 'fangziqu');
INSERT INTO `ot_region` VALUES ('370705', 3, '区县', 'k', 'kwq', '奎文区', '370700', 'kuiwenqu');
INSERT INTO `ot_region` VALUES ('370724', 3, '区县', 'l', 'lqx', '临朐县', '370700', 'linquxian');
INSERT INTO `ot_region` VALUES ('370725', 3, '区县', 'c', 'clx', '昌乐县', '370700', 'changlexian');
INSERT INTO `ot_region` VALUES ('370781', 3, '区县', 'q', 'qzs', '青州市', '370700', 'qingzhoushi');
INSERT INTO `ot_region` VALUES ('370782', 3, '区县', 'z', 'zcs', '诸城市', '370700', 'zhuchengshi');
INSERT INTO `ot_region` VALUES ('370783', 3, '区县', 's', 'sgs', '寿光市', '370700', 'shouguangshi');
INSERT INTO `ot_region` VALUES ('370784', 3, '区县', 'a', 'aqs', '安丘市', '370700', 'anqiushi');
INSERT INTO `ot_region` VALUES ('370785', 3, '区县', 'g', 'gms', '高密市', '370700', 'gaomishi');
INSERT INTO `ot_region` VALUES ('370786', 3, '区县', 'c', 'cys', '昌邑市', '370700', 'changyishi');
INSERT INTO `ot_region` VALUES ('370790', 3, '区县', 'k', 'kfq', '开发区', '370700', 'kaifaqu');
INSERT INTO `ot_region` VALUES ('370791', 3, '区县', 'g', 'gxq', '高新区', '370700', 'gaoxinqu');
INSERT INTO `ot_region` VALUES ('370800', 2, '城市', 'j', 'jns', '济宁市', '370000', 'jiningshi');
INSERT INTO `ot_region` VALUES ('370811', 3, '区县', 'r', 'rcq', '任城区', '370800', 'renchengqu');
INSERT INTO `ot_region` VALUES ('370812', 3, '区县', 'y', 'yzq', '兖州区', '370800', 'yanzhouqu');
INSERT INTO `ot_region` VALUES ('370826', 3, '区县', 'w', 'wsx', '微山县', '370800', 'weishanxian');
INSERT INTO `ot_region` VALUES ('370827', 3, '区县', 'y', 'ytx', '鱼台县', '370800', 'yutaixian');
INSERT INTO `ot_region` VALUES ('370828', 3, '区县', 'j', 'jxx', '金乡县', '370800', 'jinxiangxian');
INSERT INTO `ot_region` VALUES ('370829', 3, '区县', 'j', 'jxx', '嘉祥县', '370800', 'jiaxiangxian');
INSERT INTO `ot_region` VALUES ('370830', 3, '区县', 'w', 'wsx', '汶上县', '370800', 'wenshangxian');
INSERT INTO `ot_region` VALUES ('370831', 3, '区县', 's', 'ssx', '泗水县', '370800', 'sishuixian');
INSERT INTO `ot_region` VALUES ('370832', 3, '区县', 'l', 'lsx', '梁山县', '370800', 'liangshanxian');
INSERT INTO `ot_region` VALUES ('370881', 3, '区县', 'q', 'qfs', '曲阜市', '370800', 'qufushi');
INSERT INTO `ot_region` VALUES ('370883', 3, '区县', 'z', 'zcs', '邹城市', '370800', 'zouchengshi');
INSERT INTO `ot_region` VALUES ('370890', 3, '区县', 'g', 'gxq', '高新区', '370800', 'gaoxinqu');
INSERT INTO `ot_region` VALUES ('370900', 2, '城市', 't', 'tas', '泰安市', '370000', 'taianshi');
INSERT INTO `ot_region` VALUES ('370902', 3, '区县', 't', 'tsq', '泰山区', '370900', 'taishanqu');
INSERT INTO `ot_region` VALUES ('370911', 3, '区县', 'd', 'dyq', '岱岳区', '370900', 'daiyuequ');
INSERT INTO `ot_region` VALUES ('370921', 3, '区县', 'n', 'nyx', '宁阳县', '370900', 'ningyangxian');
INSERT INTO `ot_region` VALUES ('370923', 3, '区县', 'd', 'dpx', '东平县', '370900', 'dongpingxian');
INSERT INTO `ot_region` VALUES ('370982', 3, '区县', 'x', 'xts', '新泰市', '370900', 'xintaishi');
INSERT INTO `ot_region` VALUES ('370983', 3, '区县', 'f', 'fcs', '肥城市', '370900', 'feichengshi');
INSERT INTO `ot_region` VALUES ('371000', 2, '城市', 'w', 'whs', '威海市', '370000', 'weihaishi');
INSERT INTO `ot_region` VALUES ('371002', 3, '区县', 'h', 'hcq', '环翠区', '371000', 'huancuiqu');
INSERT INTO `ot_region` VALUES ('371003', 3, '区县', 'w', 'wdq', '文登区', '371000', 'wendengqu');
INSERT INTO `ot_region` VALUES ('371082', 3, '区县', 'r', 'rcs', '荣成市', '371000', 'rongchengshi');
INSERT INTO `ot_region` VALUES ('371083', 3, '区县', 'r', 'rss', '乳山市', '371000', 'rushanshi');
INSERT INTO `ot_region` VALUES ('371091', 3, '区县', 'j', 'jjjskfq', '经济技术开发区', '371000', 'jingjijishukaifaqu');
INSERT INTO `ot_region` VALUES ('371100', 2, '城市', 'r', 'rzs', '日照市', '370000', 'rizhaoshi');
INSERT INTO `ot_region` VALUES ('371102', 3, '区县', 'd', 'dgq', '东港区', '371100', 'donggangqu');
INSERT INTO `ot_region` VALUES ('371103', 3, '区县', 'l', 'lsq', '岚山区', '371100', 'lanshanqu');
INSERT INTO `ot_region` VALUES ('371121', 3, '区县', 'w', 'wlx', '五莲县', '371100', 'wulianxian');
INSERT INTO `ot_region` VALUES ('371122', 3, '区县', 'j', 'jx', '莒县', '371100', 'juxian');
INSERT INTO `ot_region` VALUES ('371200', 2, '城市', 'l', 'lws', '莱芜市', '370000', 'laiwushi');
INSERT INTO `ot_region` VALUES ('371202', 3, '区县', 'l', 'lcq', '莱城区', '371200', 'laichengqu');
INSERT INTO `ot_region` VALUES ('371203', 3, '区县', 'g', 'gcq', '钢城区', '371200', 'gangchengqu');
INSERT INTO `ot_region` VALUES ('371300', 2, '城市', 'l', 'lys', '临沂市', '370000', 'linyishi');
INSERT INTO `ot_region` VALUES ('371302', 3, '区县', 'l', 'lsq', '兰山区', '371300', 'lanshanqu');
INSERT INTO `ot_region` VALUES ('371311', 3, '区县', 'l', 'lzq', '罗庄区', '371300', 'luozhuangqu');
INSERT INTO `ot_region` VALUES ('371312', 3, '区县', 'h', 'hdq', '河东区', '371300', 'hedongqu');
INSERT INTO `ot_region` VALUES ('371321', 3, '区县', 'y', 'ynx', '沂南县', '371300', 'yinanxian');
INSERT INTO `ot_region` VALUES ('371322', 3, '区县', 't', 'tcx', '郯城县', '371300', 'tanchengxian');
INSERT INTO `ot_region` VALUES ('371323', 3, '区县', 'y', 'ysx', '沂水县', '371300', 'yishuixian');
INSERT INTO `ot_region` VALUES ('371324', 3, '区县', 'l', 'llx', '兰陵县', '371300', 'lanlingxian');
INSERT INTO `ot_region` VALUES ('371325', 3, '区县', 'f', 'fx', '费县', '371300', 'feixian');
INSERT INTO `ot_region` VALUES ('371326', 3, '区县', 'p', 'pyx', '平邑县', '371300', 'pingyixian');
INSERT INTO `ot_region` VALUES ('371327', 3, '区县', 'j', 'jnx', '莒南县', '371300', 'junanxian');
INSERT INTO `ot_region` VALUES ('371328', 3, '区县', 'm', 'myx', '蒙阴县', '371300', 'mengyinxian');
INSERT INTO `ot_region` VALUES ('371329', 3, '区县', 'l', 'lsx', '临沭县', '371300', 'linshuxian');
INSERT INTO `ot_region` VALUES ('371400', 2, '城市', 'd', 'dzs', '德州市', '370000', 'dezhoushi');
INSERT INTO `ot_region` VALUES ('371402', 3, '区县', 'd', 'dcq', '德城区', '371400', 'dechengqu');
INSERT INTO `ot_region` VALUES ('371403', 3, '区县', 'l', 'lcq', '陵城区', '371400', 'lingchengqu');
INSERT INTO `ot_region` VALUES ('371422', 3, '区县', 'n', 'njx', '宁津县', '371400', 'ningjinxian');
INSERT INTO `ot_region` VALUES ('371423', 3, '区县', 'q', 'qyx', '庆云县', '371400', 'qingyunxian');
INSERT INTO `ot_region` VALUES ('371424', 3, '区县', 'l', 'lyx', '临邑县', '371400', 'linyixian');
INSERT INTO `ot_region` VALUES ('371425', 3, '区县', 'q', 'qhx', '齐河县', '371400', 'qihexian');
INSERT INTO `ot_region` VALUES ('371426', 3, '区县', 'p', 'pyx', '平原县', '371400', 'pingyuanxian');
INSERT INTO `ot_region` VALUES ('371427', 3, '区县', 'x', 'xjx', '夏津县', '371400', 'xiajinxian');
INSERT INTO `ot_region` VALUES ('371428', 3, '区县', 'w', 'wcx', '武城县', '371400', 'wuchengxian');
INSERT INTO `ot_region` VALUES ('371481', 3, '区县', 'l', 'lls', '乐陵市', '371400', 'lelingshi');
INSERT INTO `ot_region` VALUES ('371482', 3, '区县', 'y', 'ycs', '禹城市', '371400', 'yuchengshi');
INSERT INTO `ot_region` VALUES ('371500', 2, '城市', 'l', 'lcs', '聊城市', '370000', 'liaochengshi');
INSERT INTO `ot_region` VALUES ('371502', 3, '区县', 'd', 'dcfq', '东昌府区', '371500', 'dongchangfuqu');
INSERT INTO `ot_region` VALUES ('371521', 3, '区县', 'y', 'ygx', '阳谷县', '371500', 'yangguxian');
INSERT INTO `ot_region` VALUES ('371522', 3, '区县', 'x', 'xx', '莘县', '371500', 'xinxian');
INSERT INTO `ot_region` VALUES ('371523', 3, '区县', 'c', 'cpx', '茌平县', '371500', 'chipingxian');
INSERT INTO `ot_region` VALUES ('371524', 3, '区县', 'd', 'dax', '东阿县', '371500', 'dongaxian');
INSERT INTO `ot_region` VALUES ('371525', 3, '区县', 'g', 'gx', '冠县', '371500', 'guanxian');
INSERT INTO `ot_region` VALUES ('371526', 3, '区县', 'g', 'gtx', '高唐县', '371500', 'gaotangxian');
INSERT INTO `ot_region` VALUES ('371581', 3, '区县', 'l', 'lqs', '临清市', '371500', 'linqingshi');
INSERT INTO `ot_region` VALUES ('371600', 2, '城市', 'b', 'bzs', '滨州市', '370000', 'binzhoushi');
INSERT INTO `ot_region` VALUES ('371602', 3, '区县', 'b', 'bcq', '滨城区', '371600', 'binchengqu');
INSERT INTO `ot_region` VALUES ('371603', 3, '区县', 'z', 'zhq', '沾化区', '371600', 'zhanhuaqu');
INSERT INTO `ot_region` VALUES ('371621', 3, '区县', 'h', 'hmx', '惠民县', '371600', 'huiminxian');
INSERT INTO `ot_region` VALUES ('371622', 3, '区县', 'y', 'yxx', '阳信县', '371600', 'yangxinxian');
INSERT INTO `ot_region` VALUES ('371623', 3, '区县', 'w', 'wdx', '无棣县', '371600', 'wudixian');
INSERT INTO `ot_region` VALUES ('371625', 3, '区县', 'b', 'bxx', '博兴县', '371600', 'boxingxian');
INSERT INTO `ot_region` VALUES ('371681', 3, '区县', 'z', 'zps', '邹平市', '371600', 'zoupingshi');
INSERT INTO `ot_region` VALUES ('371700', 2, '城市', 'h', 'hzs', '菏泽市', '370000', 'hezeshi');
INSERT INTO `ot_region` VALUES ('371702', 3, '区县', 'm', 'mdq', '牡丹区', '371700', 'mudanqu');
INSERT INTO `ot_region` VALUES ('371703', 3, '区县', 'd', 'dtq', '定陶区', '371700', 'dingtaoqu');
INSERT INTO `ot_region` VALUES ('371721', 3, '区县', 'c', 'cx', '曹县', '371700', 'caoxian');
INSERT INTO `ot_region` VALUES ('371722', 3, '区县', 'd', 'dx', '单县', '371700', 'danxian');
INSERT INTO `ot_region` VALUES ('371723', 3, '区县', 'c', 'cwx', '成武县', '371700', 'chengwuxian');
INSERT INTO `ot_region` VALUES ('371724', 3, '区县', 'j', 'jyx', '巨野县', '371700', 'juyexian');
INSERT INTO `ot_region` VALUES ('371725', 3, '区县', 'y', 'ycx', '郓城县', '371700', 'yunchengxian');
INSERT INTO `ot_region` VALUES ('371726', 3, '区县', 'j', 'jcx', '鄄城县', '371700', 'juanchengxian');
INSERT INTO `ot_region` VALUES ('371728', 3, '区县', 'd', 'dmx', '东明县', '371700', 'dongmingxian');
INSERT INTO `ot_region` VALUES ('410100', 2, '城市', 'z', 'zzs', '郑州市', '410000', 'zhengzhoushi');
INSERT INTO `ot_region` VALUES ('410102', 3, '区县', 'z', 'zyq', '中原区', '410100', 'zhongyuanqu');
INSERT INTO `ot_region` VALUES ('410103', 3, '区县', 'e', 'eqq', '二七区', '410100', 'erqiqu');
INSERT INTO `ot_region` VALUES ('410104', 3, '区县', 'g', 'gchzq', '管城回族区', '410100', 'guanchenghuizuqu');
INSERT INTO `ot_region` VALUES ('410105', 3, '区县', 'j', 'jsq', '金水区', '410100', 'jinshuiqu');
INSERT INTO `ot_region` VALUES ('410106', 3, '区县', 's', 'sjq', '上街区', '410100', 'shangjiequ');
INSERT INTO `ot_region` VALUES ('410108', 3, '区县', 'h', 'hjq', '惠济区', '410100', 'huijiqu');
INSERT INTO `ot_region` VALUES ('410122', 3, '区县', 'z', 'zmx', '中牟县', '410100', 'zhongmouxian');
INSERT INTO `ot_region` VALUES ('410181', 3, '区县', 'g', 'gys', '巩义市', '410100', 'gongyishi');
INSERT INTO `ot_region` VALUES ('410182', 3, '区县', 'y', 'yys', '荥阳市', '410100', 'yingyangshi');
INSERT INTO `ot_region` VALUES ('410183', 3, '区县', 'x', 'xms', '新密市', '410100', 'xinmishi');
INSERT INTO `ot_region` VALUES ('410184', 3, '区县', 'x', 'xzs', '新郑市', '410100', 'xinzhengshi');
INSERT INTO `ot_region` VALUES ('410185', 3, '区县', 'd', 'dfs', '登封市', '410100', 'dengfengshi');
INSERT INTO `ot_region` VALUES ('410190', 3, '区县', 'g', 'gxjskfq', '高新技术开发区', '410100', 'gaoxinjishukaifaqu');
INSERT INTO `ot_region` VALUES ('410191', 3, '区县', 'j', 'jjjskfq', '经济技术开发区', '410100', 'jingjijishukaifaqu');
INSERT INTO `ot_region` VALUES ('410200', 2, '城市', 'k', 'kfs', '开封市', '410000', 'kaifengshi');
INSERT INTO `ot_region` VALUES ('410202', 3, '区县', 'l', 'ltq', '龙亭区', '410200', 'longtingqu');
INSERT INTO `ot_region` VALUES ('410203', 3, '区县', 's', 'shhzq', '顺河回族区', '410200', 'shunhehuizuqu');
INSERT INTO `ot_region` VALUES ('410204', 3, '区县', 'g', 'glq', '鼓楼区', '410200', 'gulouqu');
INSERT INTO `ot_region` VALUES ('410205', 3, '区县', 'y', 'ywtq', '禹王台区', '410200', 'yuwangtaiqu');
INSERT INTO `ot_region` VALUES ('410212', 3, '区县', 'x', 'xfq', '祥符区', '410200', 'xiangfuqu');
INSERT INTO `ot_region` VALUES ('410221', 3, '区县', 'q', 'qx', '杞县', '410200', 'qixian');
INSERT INTO `ot_region` VALUES ('410222', 3, '区县', 't', 'txx', '通许县', '410200', 'tongxuxian');
INSERT INTO `ot_region` VALUES ('410223', 3, '区县', 'w', 'wsx', '尉氏县', '410200', 'weishixian');
INSERT INTO `ot_region` VALUES ('410225', 3, '区县', 'l', 'lkx', '兰考县', '410200', 'lankaoxian');
INSERT INTO `ot_region` VALUES ('410300', 2, '城市', 'l', 'lys', '洛阳市', '410000', 'luoyangshi');
INSERT INTO `ot_region` VALUES ('410302', 3, '区县', 'l', 'lcq', '老城区', '410300', 'laochengqu');
INSERT INTO `ot_region` VALUES ('410303', 3, '区县', 'x', 'xgq', '西工区', '410300', 'xigongqu');
INSERT INTO `ot_region` VALUES ('410304', 3, '区县', 'c', 'chhzq', '瀍河回族区', '410300', 'chanhehuizuqu');
INSERT INTO `ot_region` VALUES ('410305', 3, '区县', 'j', 'jxq', '涧西区', '410300', 'jianxiqu');
INSERT INTO `ot_region` VALUES ('410306', 3, '区县', 'j', 'jlq', '吉利区', '410300', 'jiliqu');
INSERT INTO `ot_region` VALUES ('410311', 3, '区县', 'l', 'llq', '洛龙区', '410300', 'luolongqu');
INSERT INTO `ot_region` VALUES ('410322', 3, '区县', 'm', 'mjx', '孟津县', '410300', 'mengjinxian');
INSERT INTO `ot_region` VALUES ('410323', 3, '区县', 'x', 'xax', '新安县', '410300', 'xinanxian');
INSERT INTO `ot_region` VALUES ('410324', 3, '区县', 'l', 'lcx', '栾川县', '410300', 'luanchuanxian');
INSERT INTO `ot_region` VALUES ('410325', 3, '区县', 's', 'sx', '嵩县', '410300', 'songxian');
INSERT INTO `ot_region` VALUES ('410326', 3, '区县', 'r', 'ryx', '汝阳县', '410300', 'ruyangxian');
INSERT INTO `ot_region` VALUES ('410327', 3, '区县', 'y', 'yyx', '宜阳县', '410300', 'yiyangxian');
INSERT INTO `ot_region` VALUES ('410328', 3, '区县', 'l', 'lnx', '洛宁县', '410300', 'luoningxian');
INSERT INTO `ot_region` VALUES ('410329', 3, '区县', 'y', 'ycx', '伊川县', '410300', 'yichuanxian');
INSERT INTO `ot_region` VALUES ('410381', 3, '区县', 'y', 'yss', '偃师市', '410300', 'yanshishi');
INSERT INTO `ot_region` VALUES ('410400', 2, '城市', 'p', 'pdss', '平顶山市', '410000', 'pingdingshanshi');
INSERT INTO `ot_region` VALUES ('410402', 3, '区县', 'x', 'xhq', '新华区', '410400', 'xinhuaqu');
INSERT INTO `ot_region` VALUES ('410403', 3, '区县', 'w', 'wdq', '卫东区', '410400', 'weidongqu');
INSERT INTO `ot_region` VALUES ('410404', 3, '区县', 's', 'slq', '石龙区', '410400', 'shilongqu');
INSERT INTO `ot_region` VALUES ('410411', 3, '区县', 'z', 'zhq', '湛河区', '410400', 'zhanhequ');
INSERT INTO `ot_region` VALUES ('410421', 3, '区县', 'b', 'bfx', '宝丰县', '410400', 'baofengxian');
INSERT INTO `ot_region` VALUES ('410422', 3, '区县', 'y', 'yx', '叶县', '410400', 'yexian');
INSERT INTO `ot_region` VALUES ('410423', 3, '区县', 'l', 'lsx', '鲁山县', '410400', 'lushanxian');
INSERT INTO `ot_region` VALUES ('410425', 3, '区县', 'j', 'jx', '郏县', '410400', 'jiaxian');
INSERT INTO `ot_region` VALUES ('410481', 3, '区县', 'w', 'wgs', '舞钢市', '410400', 'wugangshi');
INSERT INTO `ot_region` VALUES ('410482', 3, '区县', 'r', 'rzs', '汝州市', '410400', 'ruzhoushi');
INSERT INTO `ot_region` VALUES ('410500', 2, '城市', 'a', 'ays', '安阳市', '410000', 'anyangshi');
INSERT INTO `ot_region` VALUES ('410502', 3, '区县', 'w', 'wfq', '文峰区', '410500', 'wenfengqu');
INSERT INTO `ot_region` VALUES ('410503', 3, '区县', 'b', 'bgq', '北关区', '410500', 'beiguanqu');
INSERT INTO `ot_region` VALUES ('410505', 3, '区县', 'y', 'ydq', '殷都区', '410500', 'yindouqu');
INSERT INTO `ot_region` VALUES ('410506', 3, '区县', 'l', 'laq', '龙安区', '410500', 'longanqu');
INSERT INTO `ot_region` VALUES ('410522', 3, '区县', 'a', 'ayx', '安阳县', '410500', 'anyangxian');
INSERT INTO `ot_region` VALUES ('410523', 3, '区县', 't', 'tyx', '汤阴县', '410500', 'tangyinxian');
INSERT INTO `ot_region` VALUES ('410526', 3, '区县', 'h', 'hx', '滑县', '410500', 'huaxian');
INSERT INTO `ot_region` VALUES ('410527', 3, '区县', 'n', 'nhx', '内黄县', '410500', 'neihuangxian');
INSERT INTO `ot_region` VALUES ('410581', 3, '区县', 'l', 'lzs', '林州市', '410500', 'linzhoushi');
INSERT INTO `ot_region` VALUES ('410590', 3, '区县', 'k', 'kfq', '开发区', '410500', 'kaifaqu');
INSERT INTO `ot_region` VALUES ('410600', 2, '城市', 'h', 'hbs', '鹤壁市', '410000', 'hebishi');
INSERT INTO `ot_region` VALUES ('410602', 3, '区县', 'h', 'hsq', '鹤山区', '410600', 'heshanqu');
INSERT INTO `ot_region` VALUES ('410603', 3, '区县', 's', 'scq', '山城区', '410600', 'shanchengqu');
INSERT INTO `ot_region` VALUES ('410611', 3, '区县', 'q', 'qbq', '淇滨区', '410600', 'qibinqu');
INSERT INTO `ot_region` VALUES ('410621', 3, '区县', 'j', 'jx', '浚县', '410600', 'junxian');
INSERT INTO `ot_region` VALUES ('410622', 3, '区县', 'q', 'qx', '淇县', '410600', 'qixian');
INSERT INTO `ot_region` VALUES ('410700', 2, '城市', 'x', 'xxs', '新乡市', '410000', 'xinxiangshi');
INSERT INTO `ot_region` VALUES ('410702', 3, '区县', 'h', 'hqq', '红旗区', '410700', 'hongqiqu');
INSERT INTO `ot_region` VALUES ('410703', 3, '区县', 'w', 'wbq', '卫滨区', '410700', 'weibinqu');
INSERT INTO `ot_region` VALUES ('410704', 3, '区县', 'f', 'fqq', '凤泉区', '410700', 'fengquanqu');
INSERT INTO `ot_region` VALUES ('410711', 3, '区县', 'm', 'myq', '牧野区', '410700', 'muyequ');
INSERT INTO `ot_region` VALUES ('410721', 3, '区县', 'x', 'xxx', '新乡县', '410700', 'xinxiangxian');
INSERT INTO `ot_region` VALUES ('410724', 3, '区县', 'h', 'hjx', '获嘉县', '410700', 'huojiaxian');
INSERT INTO `ot_region` VALUES ('410725', 3, '区县', 'y', 'yyx', '原阳县', '410700', 'yuanyangxian');
INSERT INTO `ot_region` VALUES ('410726', 3, '区县', 'y', 'yjx', '延津县', '410700', 'yanjinxian');
INSERT INTO `ot_region` VALUES ('410727', 3, '区县', 'f', 'fqx', '封丘县', '410700', 'fengqiuxian');
INSERT INTO `ot_region` VALUES ('410728', 3, '区县', 'z', 'zyx', '长垣县', '410700', 'zhangyuanxian');
INSERT INTO `ot_region` VALUES ('410781', 3, '区县', 'w', 'whs', '卫辉市', '410700', 'weihuishi');
INSERT INTO `ot_region` VALUES ('410782', 3, '区县', 'h', 'hxs', '辉县市', '410700', 'huixianshi');
INSERT INTO `ot_region` VALUES ('410800', 2, '城市', 'j', 'jzs', '焦作市', '410000', 'jiaozuoshi');
INSERT INTO `ot_region` VALUES ('410802', 3, '区县', 'j', 'jfq', '解放区', '410800', 'jiefangqu');
INSERT INTO `ot_region` VALUES ('410803', 3, '区县', 'z', 'zzq', '中站区', '410800', 'zhongzhanqu');
INSERT INTO `ot_region` VALUES ('410804', 3, '区县', 'm', 'mcq', '马村区', '410800', 'macunqu');
INSERT INTO `ot_region` VALUES ('410811', 3, '区县', 's', 'syq', '山阳区', '410800', 'shanyangqu');
INSERT INTO `ot_region` VALUES ('410821', 3, '区县', 'x', 'xwx', '修武县', '410800', 'xiuwuxian');
INSERT INTO `ot_region` VALUES ('410822', 3, '区县', 'b', 'bax', '博爱县', '410800', 'boaixian');
INSERT INTO `ot_region` VALUES ('410823', 3, '区县', 'w', 'wzx', '武陟县', '410800', 'wuzhixian');
INSERT INTO `ot_region` VALUES ('410825', 3, '区县', 'w', 'wx', '温县', '410800', 'wenxian');
INSERT INTO `ot_region` VALUES ('410882', 3, '区县', 'q', 'qys', '沁阳市', '410800', 'qinyangshi');
INSERT INTO `ot_region` VALUES ('410883', 3, '区县', 'm', 'mzs', '孟州市', '410800', 'mengzhoushi');
INSERT INTO `ot_region` VALUES ('410900', 2, '城市', 'p', 'pys', '濮阳市', '410000', 'puyangshi');
INSERT INTO `ot_region` VALUES ('410902', 3, '区县', 'h', 'hlq', '华龙区', '410900', 'hualongqu');
INSERT INTO `ot_region` VALUES ('410922', 3, '区县', 'q', 'qfx', '清丰县', '410900', 'qingfengxian');
INSERT INTO `ot_region` VALUES ('410923', 3, '区县', 'n', 'nlx', '南乐县', '410900', 'nanlexian');
INSERT INTO `ot_region` VALUES ('410926', 3, '区县', 'f', 'fx', '范县', '410900', 'fanxian');
INSERT INTO `ot_region` VALUES ('410927', 3, '区县', 't', 'tqx', '台前县', '410900', 'taiqianxian');
INSERT INTO `ot_region` VALUES ('410928', 3, '区县', 'p', 'pyx', '濮阳县', '410900', 'puyangxian');
INSERT INTO `ot_region` VALUES ('411000', 2, '城市', 'x', 'xcs', '许昌市', '410000', 'xuchangshi');
INSERT INTO `ot_region` VALUES ('411002', 3, '区县', 'w', 'wdq', '魏都区', '411000', 'weidouqu');
INSERT INTO `ot_region` VALUES ('411003', 3, '区县', 'j', 'jaq', '建安区', '411000', 'jiananqu');
INSERT INTO `ot_region` VALUES ('411024', 3, '区县', 'y', 'ylx', '鄢陵县', '411000', 'yanlingxian');
INSERT INTO `ot_region` VALUES ('411025', 3, '区县', 'x', 'xcx', '襄城县', '411000', 'xiangchengxian');
INSERT INTO `ot_region` VALUES ('411081', 3, '区县', 'y', 'yzs', '禹州市', '411000', 'yuzhoushi');
INSERT INTO `ot_region` VALUES ('411082', 3, '区县', 'z', 'zgs', '长葛市', '411000', 'zhanggeshi');
INSERT INTO `ot_region` VALUES ('411100', 2, '城市', 'l', 'lhs', '漯河市', '410000', 'luoheshi');
INSERT INTO `ot_region` VALUES ('411102', 3, '区县', 'y', 'yhq', '源汇区', '411100', 'yuanhuiqu');
INSERT INTO `ot_region` VALUES ('411103', 3, '区县', 'y', 'ycq', '郾城区', '411100', 'yanchengqu');
INSERT INTO `ot_region` VALUES ('411104', 3, '区县', 'z', 'zlq', '召陵区', '411100', 'zhaolingqu');
INSERT INTO `ot_region` VALUES ('411121', 3, '区县', 'w', 'wyx', '舞阳县', '411100', 'wuyangxian');
INSERT INTO `ot_region` VALUES ('411122', 3, '区县', 'l', 'lyx', '临颍县', '411100', 'linyingxian');
INSERT INTO `ot_region` VALUES ('411200', 2, '城市', 's', 'smxs', '三门峡市', '410000', 'sanmenxiashi');
INSERT INTO `ot_region` VALUES ('411202', 3, '区县', 'h', 'hbq', '湖滨区', '411200', 'hubinqu');
INSERT INTO `ot_region` VALUES ('411203', 3, '区县', 's', 'szq', '陕州区', '411200', 'shanzhouqu');
INSERT INTO `ot_region` VALUES ('411221', 3, '区县', 'm', 'mcx', '渑池县', '411200', 'mianchixian');
INSERT INTO `ot_region` VALUES ('411224', 3, '区县', 'l', 'lsx', '卢氏县', '411200', 'lushixian');
INSERT INTO `ot_region` VALUES ('411281', 3, '区县', 'y', 'yms', '义马市', '411200', 'yimashi');
INSERT INTO `ot_region` VALUES ('411282', 3, '区县', 'l', 'lbs', '灵宝市', '411200', 'lingbaoshi');
INSERT INTO `ot_region` VALUES ('411300', 2, '城市', 'n', 'nys', '南阳市', '410000', 'nanyangshi');
INSERT INTO `ot_region` VALUES ('411302', 3, '区县', 'w', 'wcq', '宛城区', '411300', 'wanchengqu');
INSERT INTO `ot_region` VALUES ('411303', 3, '区县', 'w', 'wlq', '卧龙区', '411300', 'wolongqu');
INSERT INTO `ot_region` VALUES ('411321', 3, '区县', 'n', 'nzx', '南召县', '411300', 'nanzhaoxian');
INSERT INTO `ot_region` VALUES ('411322', 3, '区县', 'f', 'fcx', '方城县', '411300', 'fangchengxian');
INSERT INTO `ot_region` VALUES ('411323', 3, '区县', 'x', 'xxx', '西峡县', '411300', 'xixiaxian');
INSERT INTO `ot_region` VALUES ('411324', 3, '区县', 'z', 'zpx', '镇平县', '411300', 'zhenpingxian');
INSERT INTO `ot_region` VALUES ('411325', 3, '区县', 'n', 'nxx', '内乡县', '411300', 'neixiangxian');
INSERT INTO `ot_region` VALUES ('411326', 3, '区县', 'x', 'xcx', '淅川县', '411300', 'xichuanxian');
INSERT INTO `ot_region` VALUES ('411327', 3, '区县', 's', 'sqx', '社旗县', '411300', 'sheqixian');
INSERT INTO `ot_region` VALUES ('411328', 3, '区县', 't', 'thx', '唐河县', '411300', 'tanghexian');
INSERT INTO `ot_region` VALUES ('411329', 3, '区县', 'x', 'xyx', '新野县', '411300', 'xinyexian');
INSERT INTO `ot_region` VALUES ('411330', 3, '区县', 't', 'tbx', '桐柏县', '411300', 'tongboxian');
INSERT INTO `ot_region` VALUES ('411381', 3, '区县', 'd', 'dzs', '邓州市', '411300', 'dengzhoushi');
INSERT INTO `ot_region` VALUES ('411400', 2, '城市', 's', 'sqs', '商丘市', '410000', 'shangqiushi');
INSERT INTO `ot_region` VALUES ('411402', 3, '区县', 'l', 'lyq', '梁园区', '411400', 'liangyuanqu');
INSERT INTO `ot_region` VALUES ('411403', 3, '区县', 's', 'syq', '睢阳区', '411400', 'suiyangqu');
INSERT INTO `ot_region` VALUES ('411421', 3, '区县', 'm', 'mqx', '民权县', '411400', 'minquanxian');
INSERT INTO `ot_region` VALUES ('411422', 3, '区县', 's', 'sx', '睢县', '411400', 'suixian');
INSERT INTO `ot_region` VALUES ('411423', 3, '区县', 'n', 'nlx', '宁陵县', '411400', 'ninglingxian');
INSERT INTO `ot_region` VALUES ('411424', 3, '区县', 'z', 'zcx', '柘城县', '411400', 'zhechengxian');
INSERT INTO `ot_region` VALUES ('411425', 3, '区县', 'y', 'ycx', '虞城县', '411400', 'yuchengxian');
INSERT INTO `ot_region` VALUES ('411426', 3, '区县', 'x', 'xyx', '夏邑县', '411400', 'xiayixian');
INSERT INTO `ot_region` VALUES ('411481', 3, '区县', 'y', 'ycs', '永城市', '411400', 'yongchengshi');
INSERT INTO `ot_region` VALUES ('411500', 2, '城市', 'x', 'xys', '信阳市', '410000', 'xinyangshi');
INSERT INTO `ot_region` VALUES ('411502', 3, '区县', 's', 'shq', '浉河区', '411500', 'shihequ');
INSERT INTO `ot_region` VALUES ('411503', 3, '区县', 'p', 'pqq', '平桥区', '411500', 'pingqiaoqu');
INSERT INTO `ot_region` VALUES ('411521', 3, '区县', 'l', 'lsx', '罗山县', '411500', 'luoshanxian');
INSERT INTO `ot_region` VALUES ('411522', 3, '区县', 'g', 'gsx', '光山县', '411500', 'guangshanxian');
INSERT INTO `ot_region` VALUES ('411523', 3, '区县', 'x', 'xx', '新县', '411500', 'xinxian');
INSERT INTO `ot_region` VALUES ('411524', 3, '区县', 's', 'scx', '商城县', '411500', 'shangchengxian');
INSERT INTO `ot_region` VALUES ('411525', 3, '区县', 'g', 'gsx', '固始县', '411500', 'gushixian');
INSERT INTO `ot_region` VALUES ('411526', 3, '区县', 'h', 'hcx', '潢川县', '411500', 'huangchuanxian');
INSERT INTO `ot_region` VALUES ('411527', 3, '区县', 'h', 'hbx', '淮滨县', '411500', 'huaibinxian');
INSERT INTO `ot_region` VALUES ('411528', 3, '区县', 'x', 'xx', '息县', '411500', 'xixian');
INSERT INTO `ot_region` VALUES ('411600', 2, '城市', 'z', 'zks', '周口市', '410000', 'zhoukoushi');
INSERT INTO `ot_region` VALUES ('411602', 3, '区县', 'c', 'chq', '川汇区', '411600', 'chuanhuiqu');
INSERT INTO `ot_region` VALUES ('411621', 3, '区县', 'f', 'fgx', '扶沟县', '411600', 'fugouxian');
INSERT INTO `ot_region` VALUES ('411622', 3, '区县', 'x', 'xhx', '西华县', '411600', 'xihuaxian');
INSERT INTO `ot_region` VALUES ('411623', 3, '区县', 's', 'ssx', '商水县', '411600', 'shangshuixian');
INSERT INTO `ot_region` VALUES ('411624', 3, '区县', 's', 'sqx', '沈丘县', '411600', 'shenqiuxian');
INSERT INTO `ot_region` VALUES ('411625', 3, '区县', 'd', 'dcx', '郸城县', '411600', 'danchengxian');
INSERT INTO `ot_region` VALUES ('411626', 3, '区县', 'h', 'hyx', '淮阳县', '411600', 'huaiyangxian');
INSERT INTO `ot_region` VALUES ('411627', 3, '区县', 't', 'tkx', '太康县', '411600', 'taikangxian');
INSERT INTO `ot_region` VALUES ('411628', 3, '区县', 'l', 'lyx', '鹿邑县', '411600', 'luyixian');
INSERT INTO `ot_region` VALUES ('411681', 3, '区县', 'x', 'xcs', '项城市', '411600', 'xiangchengshi');
INSERT INTO `ot_region` VALUES ('411690', 3, '区县', 'j', 'jjkfq', '经济开发区', '411600', 'jingjikaifaqu');
INSERT INTO `ot_region` VALUES ('411700', 2, '城市', 'z', 'zmds', '驻马店市', '410000', 'zhumadianshi');
INSERT INTO `ot_region` VALUES ('411702', 3, '区县', 'y', 'ycq', '驿城区', '411700', 'yichengqu');
INSERT INTO `ot_region` VALUES ('411721', 3, '区县', 'x', 'xpx', '西平县', '411700', 'xipingxian');
INSERT INTO `ot_region` VALUES ('411722', 3, '区县', 's', 'scx', '上蔡县', '411700', 'shangcaixian');
INSERT INTO `ot_region` VALUES ('411723', 3, '区县', 'p', 'pyx', '平舆县', '411700', 'pingyuxian');
INSERT INTO `ot_region` VALUES ('411724', 3, '区县', 'z', 'zyx', '正阳县', '411700', 'zhengyangxian');
INSERT INTO `ot_region` VALUES ('411725', 3, '区县', 'q', 'qsx', '确山县', '411700', 'queshanxian');
INSERT INTO `ot_region` VALUES ('411726', 3, '区县', 'm', 'myx', '泌阳县', '411700', 'miyangxian');
INSERT INTO `ot_region` VALUES ('411727', 3, '区县', 'r', 'rnx', '汝南县', '411700', 'runanxian');
INSERT INTO `ot_region` VALUES ('411728', 3, '区县', 's', 'spx', '遂平县', '411700', 'suipingxian');
INSERT INTO `ot_region` VALUES ('411729', 3, '区县', 'x', 'xcx', '新蔡县', '411700', 'xincaixian');
INSERT INTO `ot_region` VALUES ('419000', 2, '城市', 's', 'szxx', '省直辖县', '410000', 'shengzhixiaxian');
INSERT INTO `ot_region` VALUES ('419001', 3, '区县', 'j', 'jys', '济源市', '419000', 'jiyuanshi');
INSERT INTO `ot_region` VALUES ('420100', 2, '城市', 'w', 'whs', '武汉市', '420000', 'wuhanshi');
INSERT INTO `ot_region` VALUES ('420102', 3, '区县', 'j', 'jaq', '江岸区', '420100', 'jianganqu');
INSERT INTO `ot_region` VALUES ('420103', 3, '区县', 'j', 'jhq', '江汉区', '420100', 'jianghanqu');
INSERT INTO `ot_region` VALUES ('420104', 3, '区县', 'q', 'qkq', '硚口区', '420100', 'qiaokouqu');
INSERT INTO `ot_region` VALUES ('420105', 3, '区县', 'h', 'hyq', '汉阳区', '420100', 'hanyangqu');
INSERT INTO `ot_region` VALUES ('420106', 3, '区县', 'w', 'wcq', '武昌区', '420100', 'wuchangqu');
INSERT INTO `ot_region` VALUES ('420107', 3, '区县', 'q', 'qsq', '青山区', '420100', 'qingshanqu');
INSERT INTO `ot_region` VALUES ('420111', 3, '区县', 'h', 'hsq', '洪山区', '420100', 'hongshanqu');
INSERT INTO `ot_region` VALUES ('420112', 3, '区县', 'd', 'dxhq', '东西湖区', '420100', 'dongxihuqu');
INSERT INTO `ot_region` VALUES ('420113', 3, '区县', 'h', 'hnq', '汉南区', '420100', 'hannanqu');
INSERT INTO `ot_region` VALUES ('420114', 3, '区县', 'c', 'cdq', '蔡甸区', '420100', 'caidianqu');
INSERT INTO `ot_region` VALUES ('420115', 3, '区县', 'j', 'jxq', '江夏区', '420100', 'jiangxiaqu');
INSERT INTO `ot_region` VALUES ('420116', 3, '区县', 'h', 'hpq', '黄陂区', '420100', 'huangpoqu');
INSERT INTO `ot_region` VALUES ('420117', 3, '区县', 'x', 'xzq', '新洲区', '420100', 'xinzhouqu');
INSERT INTO `ot_region` VALUES ('420200', 2, '城市', 'h', 'hss', '黄石市', '420000', 'huangshishi');
INSERT INTO `ot_region` VALUES ('420202', 3, '区县', 'h', 'hsgq', '黄石港区', '420200', 'huangshigangqu');
INSERT INTO `ot_region` VALUES ('420203', 3, '区县', 'x', 'xssq', '西塞山区', '420200', 'xisaishanqu');
INSERT INTO `ot_region` VALUES ('420204', 3, '区县', 'x', 'xlq', '下陆区', '420200', 'xialuqu');
INSERT INTO `ot_region` VALUES ('420205', 3, '区县', 't', 'tsq', '铁山区', '420200', 'tieshanqu');
INSERT INTO `ot_region` VALUES ('420222', 3, '区县', 'y', 'yxx', '阳新县', '420200', 'yangxinxian');
INSERT INTO `ot_region` VALUES ('420281', 3, '区县', 'd', 'dys', '大冶市', '420200', 'dayeshi');
INSERT INTO `ot_region` VALUES ('420300', 2, '城市', 's', 'sys', '十堰市', '420000', 'shiyanshi');
INSERT INTO `ot_region` VALUES ('420302', 3, '区县', 'm', 'mjq', '茅箭区', '420300', 'maojianqu');
INSERT INTO `ot_region` VALUES ('420303', 3, '区县', 'z', 'zwq', '张湾区', '420300', 'zhangwanqu');
INSERT INTO `ot_region` VALUES ('420304', 3, '区县', 'y', 'yyq', '郧阳区', '420300', 'yunyangqu');
INSERT INTO `ot_region` VALUES ('420322', 3, '区县', 'y', 'yxx', '郧西县', '420300', 'yunxixian');
INSERT INTO `ot_region` VALUES ('420323', 3, '区县', 'z', 'zsx', '竹山县', '420300', 'zhushanxian');
INSERT INTO `ot_region` VALUES ('420324', 3, '区县', 'z', 'zxx', '竹溪县', '420300', 'zhuxixian');
INSERT INTO `ot_region` VALUES ('420325', 3, '区县', 'f', 'fx', '房县', '420300', 'fangxian');
INSERT INTO `ot_region` VALUES ('420381', 3, '区县', 'd', 'djks', '丹江口市', '420300', 'danjiangkoushi');
INSERT INTO `ot_region` VALUES ('420500', 2, '城市', 'y', 'ycs', '宜昌市', '420000', 'yichangshi');
INSERT INTO `ot_region` VALUES ('420502', 3, '区县', 'x', 'xlq', '西陵区', '420500', 'xilingqu');
INSERT INTO `ot_region` VALUES ('420503', 3, '区县', 'w', 'wjgq', '伍家岗区', '420500', 'wujiagangqu');
INSERT INTO `ot_region` VALUES ('420504', 3, '区县', 'd', 'djq', '点军区', '420500', 'dianjunqu');
INSERT INTO `ot_region` VALUES ('420505', 3, '区县', 'y', 'ytq', '猇亭区', '420500', 'yaotingqu');
INSERT INTO `ot_region` VALUES ('420506', 3, '区县', 'y', 'ylq', '夷陵区', '420500', 'yilingqu');
INSERT INTO `ot_region` VALUES ('420525', 3, '区县', 'y', 'yax', '远安县', '420500', 'yuananxian');
INSERT INTO `ot_region` VALUES ('420526', 3, '区县', 'x', 'xsx', '兴山县', '420500', 'xingshanxian');
INSERT INTO `ot_region` VALUES ('420527', 3, '区县', 'z', 'zgx', '秭归县', '420500', 'ziguixian');
INSERT INTO `ot_region` VALUES ('420528', 3, '区县', 'z', 'zytjzzzx', '长阳土家族自治县', '420500', 'zhangyangtujiazuzizhixian');
INSERT INTO `ot_region` VALUES ('420529', 3, '区县', 'w', 'wftjzzzx', '五峰土家族自治县', '420500', 'wufengtujiazuzizhixian');
INSERT INTO `ot_region` VALUES ('420581', 3, '区县', 'y', 'yds', '宜都市', '420500', 'yidoushi');
INSERT INTO `ot_region` VALUES ('420582', 3, '区县', 'd', 'dys', '当阳市', '420500', 'dangyangshi');
INSERT INTO `ot_region` VALUES ('420583', 3, '区县', 'z', 'zjs', '枝江市', '420500', 'zhijiangshi');
INSERT INTO `ot_region` VALUES ('420590', 3, '区县', 'j', 'jjkfq', '经济开发区', '420500', 'jingjikaifaqu');
INSERT INTO `ot_region` VALUES ('420600', 2, '城市', 'x', 'xys', '襄阳市', '420000', 'xiangyangshi');
INSERT INTO `ot_region` VALUES ('420602', 3, '区县', 'x', 'xcq', '襄城区', '420600', 'xiangchengqu');
INSERT INTO `ot_region` VALUES ('420606', 3, '区县', 'f', 'fcq', '樊城区', '420600', 'fanchengqu');
INSERT INTO `ot_region` VALUES ('420607', 3, '区县', 'x', 'xzq', '襄州区', '420600', 'xiangzhouqu');
INSERT INTO `ot_region` VALUES ('420624', 3, '区县', 'n', 'nzx', '南漳县', '420600', 'nanzhangxian');
INSERT INTO `ot_region` VALUES ('420625', 3, '区县', 'g', 'gcx', '谷城县', '420600', 'guchengxian');
INSERT INTO `ot_region` VALUES ('420626', 3, '区县', 'b', 'bkx', '保康县', '420600', 'baokangxian');
INSERT INTO `ot_region` VALUES ('420682', 3, '区县', 'l', 'lhks', '老河口市', '420600', 'laohekoushi');
INSERT INTO `ot_region` VALUES ('420683', 3, '区县', 'z', 'zys', '枣阳市', '420600', 'zaoyangshi');
INSERT INTO `ot_region` VALUES ('420684', 3, '区县', 'y', 'ycs', '宜城市', '420600', 'yichengshi');
INSERT INTO `ot_region` VALUES ('420700', 2, '城市', 'e', 'ezs', '鄂州市', '420000', 'ezhoushi');
INSERT INTO `ot_region` VALUES ('420702', 3, '区县', 'l', 'lzhq', '梁子湖区', '420700', 'liangzihuqu');
INSERT INTO `ot_region` VALUES ('420703', 3, '区县', 'h', 'hrq', '华容区', '420700', 'huarongqu');
INSERT INTO `ot_region` VALUES ('420704', 3, '区县', 'e', 'ecq', '鄂城区', '420700', 'echengqu');
INSERT INTO `ot_region` VALUES ('420800', 2, '城市', 'j', 'jms', '荆门市', '420000', 'jingmenshi');
INSERT INTO `ot_region` VALUES ('420802', 3, '区县', 'd', 'dbq', '东宝区', '420800', 'dongbaoqu');
INSERT INTO `ot_region` VALUES ('420804', 3, '区县', 'd', 'ddq', '掇刀区', '420800', 'duodaoqu');
INSERT INTO `ot_region` VALUES ('420822', 3, '区县', 's', 'syx', '沙洋县', '420800', 'shayangxian');
INSERT INTO `ot_region` VALUES ('420881', 3, '区县', 'z', 'zxs', '钟祥市', '420800', 'zhongxiangshi');
INSERT INTO `ot_region` VALUES ('420882', 3, '区县', 'j', 'jss', '京山市', '420800', 'jingshanshi');
INSERT INTO `ot_region` VALUES ('420900', 2, '城市', 'x', 'xgs', '孝感市', '420000', 'xiaoganshi');
INSERT INTO `ot_region` VALUES ('420902', 3, '区县', 'x', 'xnq', '孝南区', '420900', 'xiaonanqu');
INSERT INTO `ot_region` VALUES ('420921', 3, '区县', 'x', 'xcx', '孝昌县', '420900', 'xiaochangxian');
INSERT INTO `ot_region` VALUES ('420922', 3, '区县', 'd', 'dwx', '大悟县', '420900', 'dawuxian');
INSERT INTO `ot_region` VALUES ('420923', 3, '区县', 'y', 'ymx', '云梦县', '420900', 'yunmengxian');
INSERT INTO `ot_region` VALUES ('420981', 3, '区县', 'y', 'ycs', '应城市', '420900', 'yingchengshi');
INSERT INTO `ot_region` VALUES ('420982', 3, '区县', 'a', 'als', '安陆市', '420900', 'anlushi');
INSERT INTO `ot_region` VALUES ('420984', 3, '区县', 'h', 'hcs', '汉川市', '420900', 'hanchuanshi');
INSERT INTO `ot_region` VALUES ('421000', 2, '城市', 'j', 'jzs', '荆州市', '420000', 'jingzhoushi');
INSERT INTO `ot_region` VALUES ('421002', 3, '区县', 's', 'ssq', '沙市区', '421000', 'shashiqu');
INSERT INTO `ot_region` VALUES ('421003', 3, '区县', 'j', 'jzq', '荆州区', '421000', 'jingzhouqu');
INSERT INTO `ot_region` VALUES ('421022', 3, '区县', 'g', 'gax', '公安县', '421000', 'gonganxian');
INSERT INTO `ot_region` VALUES ('421023', 3, '区县', 'j', 'jlx', '监利县', '421000', 'jianlixian');
INSERT INTO `ot_region` VALUES ('421024', 3, '区县', 'j', 'jlx', '江陵县', '421000', 'jianglingxian');
INSERT INTO `ot_region` VALUES ('421081', 3, '区县', 's', 'sss', '石首市', '421000', 'shishoushi');
INSERT INTO `ot_region` VALUES ('421083', 3, '区县', 'h', 'hhs', '洪湖市', '421000', 'honghushi');
INSERT INTO `ot_region` VALUES ('421087', 3, '区县', 's', 'szs', '松滋市', '421000', 'songzishi');
INSERT INTO `ot_region` VALUES ('421100', 2, '城市', 'h', 'hgs', '黄冈市', '420000', 'huanggangshi');
INSERT INTO `ot_region` VALUES ('421102', 3, '区县', 'h', 'hzq', '黄州区', '421100', 'huangzhouqu');
INSERT INTO `ot_region` VALUES ('421121', 3, '区县', 't', 'tfx', '团风县', '421100', 'tuanfengxian');
INSERT INTO `ot_region` VALUES ('421122', 3, '区县', 'h', 'hax', '红安县', '421100', 'honganxian');
INSERT INTO `ot_region` VALUES ('421123', 3, '区县', 'l', 'ltx', '罗田县', '421100', 'luotianxian');
INSERT INTO `ot_region` VALUES ('421124', 3, '区县', 'y', 'ysx', '英山县', '421100', 'yingshanxian');
INSERT INTO `ot_region` VALUES ('421125', 3, '区县', 'x', 'xsx', '浠水县', '421100', 'xishuixian');
INSERT INTO `ot_region` VALUES ('421126', 3, '区县', 'q', 'qcx', '蕲春县', '421100', 'qichunxian');
INSERT INTO `ot_region` VALUES ('421127', 3, '区县', 'h', 'hmx', '黄梅县', '421100', 'huangmeixian');
INSERT INTO `ot_region` VALUES ('421181', 3, '区县', 'm', 'mcs', '麻城市', '421100', 'machengshi');
INSERT INTO `ot_region` VALUES ('421182', 3, '区县', 'w', 'wxs', '武穴市', '421100', 'wuxueshi');
INSERT INTO `ot_region` VALUES ('421200', 2, '城市', 'x', 'xns', '咸宁市', '420000', 'xianningshi');
INSERT INTO `ot_region` VALUES ('421202', 3, '区县', 'x', 'xaq', '咸安区', '421200', 'xiananqu');
INSERT INTO `ot_region` VALUES ('421221', 3, '区县', 'j', 'jyx', '嘉鱼县', '421200', 'jiayuxian');
INSERT INTO `ot_region` VALUES ('421222', 3, '区县', 't', 'tcx', '通城县', '421200', 'tongchengxian');
INSERT INTO `ot_region` VALUES ('421223', 3, '区县', 'c', 'cyx', '崇阳县', '421200', 'chongyangxian');
INSERT INTO `ot_region` VALUES ('421224', 3, '区县', 't', 'tsx', '通山县', '421200', 'tongshanxian');
INSERT INTO `ot_region` VALUES ('421281', 3, '区县', 'c', 'cbs', '赤壁市', '421200', 'chibishi');
INSERT INTO `ot_region` VALUES ('421300', 2, '城市', 's', 'szs', '随州市', '420000', 'suizhoushi');
INSERT INTO `ot_region` VALUES ('421303', 3, '区县', 'c', 'cdq', '曾都区', '421300', 'cengdouqu');
INSERT INTO `ot_region` VALUES ('421321', 3, '区县', 's', 'sx', '随县', '421300', 'suixian');
INSERT INTO `ot_region` VALUES ('421381', 3, '区县', 'g', 'gss', '广水市', '421300', 'guangshuishi');
INSERT INTO `ot_region` VALUES ('422800', 2, '城市', 'e', 'estjzmzzzz', '恩施土家族苗族自治州', '420000', 'enshitujiazumiaozuzizhizhou');
INSERT INTO `ot_region` VALUES ('422801', 3, '区县', 'e', 'ess', '恩施市', '422800', 'enshishi');
INSERT INTO `ot_region` VALUES ('422802', 3, '区县', 'l', 'lcs', '利川市', '422800', 'lichuanshi');
INSERT INTO `ot_region` VALUES ('422822', 3, '区县', 'j', 'jsx', '建始县', '422800', 'jianshixian');
INSERT INTO `ot_region` VALUES ('422823', 3, '区县', 'b', 'bdx', '巴东县', '422800', 'badongxian');
INSERT INTO `ot_region` VALUES ('422825', 3, '区县', 'x', 'xex', '宣恩县', '422800', 'xuanenxian');
INSERT INTO `ot_region` VALUES ('422826', 3, '区县', 'x', 'xfx', '咸丰县', '422800', 'xianfengxian');
INSERT INTO `ot_region` VALUES ('422827', 3, '区县', 'l', 'lfx', '来凤县', '422800', 'laifengxian');
INSERT INTO `ot_region` VALUES ('422828', 3, '区县', 'h', 'hfx', '鹤峰县', '422800', 'hefengxian');
INSERT INTO `ot_region` VALUES ('429000', 2, '城市', 's', 'szxx', '省直辖县', '420000', 'shengzhixiaxian');
INSERT INTO `ot_region` VALUES ('429004', 3, '区县', 'x', 'xts', '仙桃市', '429000', 'xiantaoshi');
INSERT INTO `ot_region` VALUES ('429005', 3, '区县', 'q', 'qjs', '潜江市', '429000', 'qianjiangshi');
INSERT INTO `ot_region` VALUES ('429006', 3, '区县', 't', 'tms', '天门市', '429000', 'tianmenshi');
INSERT INTO `ot_region` VALUES ('429021', 3, '区县', 's', 'snjlq', '神农架林区', '429000', 'shennongjialinqu');
INSERT INTO `ot_region` VALUES ('430100', 2, '城市', 'z', 'zss', '长沙市', '430000', 'zhangshashi');
INSERT INTO `ot_region` VALUES ('430102', 3, '区县', 'f', 'frq', '芙蓉区', '430100', 'furongqu');
INSERT INTO `ot_region` VALUES ('430103', 3, '区县', 't', 'txq', '天心区', '430100', 'tianxinqu');
INSERT INTO `ot_region` VALUES ('430104', 3, '区县', 'y', 'ylq', '岳麓区', '430100', 'yueluqu');
INSERT INTO `ot_region` VALUES ('430105', 3, '区县', 'k', 'kfq', '开福区', '430100', 'kaifuqu');
INSERT INTO `ot_region` VALUES ('430111', 3, '区县', 'y', 'yhq', '雨花区', '430100', 'yuhuaqu');
INSERT INTO `ot_region` VALUES ('430112', 3, '区县', 'w', 'wcq', '望城区', '430100', 'wangchengqu');
INSERT INTO `ot_region` VALUES ('430121', 3, '区县', 'z', 'zsx', '长沙县', '430100', 'zhangshaxian');
INSERT INTO `ot_region` VALUES ('430181', 3, '区县', 'l', 'lys', '浏阳市', '430100', 'liuyangshi');
INSERT INTO `ot_region` VALUES ('430182', 3, '区县', 'n', 'nxs', '宁乡市', '430100', 'ningxiangshi');
INSERT INTO `ot_region` VALUES ('430200', 2, '城市', 'z', 'zzs', '株洲市', '430000', 'zhuzhoushi');
INSERT INTO `ot_region` VALUES ('430202', 3, '区县', 'h', 'htq', '荷塘区', '430200', 'hetangqu');
INSERT INTO `ot_region` VALUES ('430203', 3, '区县', 'l', 'lsq', '芦淞区', '430200', 'lusongqu');
INSERT INTO `ot_region` VALUES ('430204', 3, '区县', 's', 'sfq', '石峰区', '430200', 'shifengqu');
INSERT INTO `ot_region` VALUES ('430211', 3, '区县', 't', 'tyq', '天元区', '430200', 'tianyuanqu');
INSERT INTO `ot_region` VALUES ('430212', 3, '区县', 'l', 'lkq', '渌口区', '430200', 'lukouqu');
INSERT INTO `ot_region` VALUES ('430223', 3, '区县', 'y', 'yx', '攸县', '430200', 'youxian');
INSERT INTO `ot_region` VALUES ('430224', 3, '区县', 'c', 'clx', '茶陵县', '430200', 'chalingxian');
INSERT INTO `ot_region` VALUES ('430225', 3, '区县', 'y', 'ylx', '炎陵县', '430200', 'yanlingxian');
INSERT INTO `ot_region` VALUES ('430281', 3, '区县', 'l', 'lls', '醴陵市', '430200', 'lilingshi');
INSERT INTO `ot_region` VALUES ('430300', 2, '城市', 'x', 'xts', '湘潭市', '430000', 'xiangtanshi');
INSERT INTO `ot_region` VALUES ('430302', 3, '区县', 'y', 'yhq', '雨湖区', '430300', 'yuhuqu');
INSERT INTO `ot_region` VALUES ('430304', 3, '区县', 'y', 'ytq', '岳塘区', '430300', 'yuetangqu');
INSERT INTO `ot_region` VALUES ('430321', 3, '区县', 'x', 'xtx', '湘潭县', '430300', 'xiangtanxian');
INSERT INTO `ot_region` VALUES ('430381', 3, '区县', 'x', 'xxs', '湘乡市', '430300', 'xiangxiangshi');
INSERT INTO `ot_region` VALUES ('430382', 3, '区县', 's', 'sss', '韶山市', '430300', 'shaoshanshi');
INSERT INTO `ot_region` VALUES ('430400', 2, '城市', 'h', 'hys', '衡阳市', '430000', 'hengyangshi');
INSERT INTO `ot_region` VALUES ('430405', 3, '区县', 'z', 'zhq', '珠晖区', '430400', 'zhuhuiqu');
INSERT INTO `ot_region` VALUES ('430406', 3, '区县', 'y', 'yfq', '雁峰区', '430400', 'yanfengqu');
INSERT INTO `ot_region` VALUES ('430407', 3, '区县', 's', 'sgq', '石鼓区', '430400', 'shiguqu');
INSERT INTO `ot_region` VALUES ('430408', 3, '区县', 'z', 'zxq', '蒸湘区', '430400', 'zhengxiangqu');
INSERT INTO `ot_region` VALUES ('430412', 3, '区县', 'n', 'nyq', '南岳区', '430400', 'nanyuequ');
INSERT INTO `ot_region` VALUES ('430421', 3, '区县', 'h', 'hyx', '衡阳县', '430400', 'hengyangxian');
INSERT INTO `ot_region` VALUES ('430422', 3, '区县', 'h', 'hnx', '衡南县', '430400', 'hengnanxian');
INSERT INTO `ot_region` VALUES ('430423', 3, '区县', 'h', 'hsx', '衡山县', '430400', 'hengshanxian');
INSERT INTO `ot_region` VALUES ('430424', 3, '区县', 'h', 'hdx', '衡东县', '430400', 'hengdongxian');
INSERT INTO `ot_region` VALUES ('430426', 3, '区县', 'q', 'qdx', '祁东县', '430400', 'qidongxian');
INSERT INTO `ot_region` VALUES ('430481', 3, '区县', 'l', 'lys', '耒阳市', '430400', 'leiyangshi');
INSERT INTO `ot_region` VALUES ('430482', 3, '区县', 'c', 'cns', '常宁市', '430400', 'changningshi');
INSERT INTO `ot_region` VALUES ('430500', 2, '城市', 's', 'sys', '邵阳市', '430000', 'shaoyangshi');
INSERT INTO `ot_region` VALUES ('430502', 3, '区县', 's', 'sqq', '双清区', '430500', 'shuangqingqu');
INSERT INTO `ot_region` VALUES ('430503', 3, '区县', 'd', 'dxq', '大祥区', '430500', 'daxiangqu');
INSERT INTO `ot_region` VALUES ('430511', 3, '区县', 'b', 'btq', '北塔区', '430500', 'beitaqu');
INSERT INTO `ot_region` VALUES ('430521', 3, '区县', 's', 'sdx', '邵东县', '430500', 'shaodongxian');
INSERT INTO `ot_region` VALUES ('430522', 3, '区县', 'x', 'xsx', '新邵县', '430500', 'xinshaoxian');
INSERT INTO `ot_region` VALUES ('430523', 3, '区县', 's', 'syx', '邵阳县', '430500', 'shaoyangxian');
INSERT INTO `ot_region` VALUES ('430524', 3, '区县', 'l', 'lhx', '隆回县', '430500', 'longhuixian');
INSERT INTO `ot_region` VALUES ('430525', 3, '区县', 'd', 'dkx', '洞口县', '430500', 'dongkouxian');
INSERT INTO `ot_region` VALUES ('430527', 3, '区县', 's', 'snx', '绥宁县', '430500', 'suiningxian');
INSERT INTO `ot_region` VALUES ('430528', 3, '区县', 'x', 'xnx', '新宁县', '430500', 'xinningxian');
INSERT INTO `ot_region` VALUES ('430529', 3, '区县', 'c', 'cbmzzzx', '城步苗族自治县', '430500', 'chengbumiaozuzizhixian');
INSERT INTO `ot_region` VALUES ('430581', 3, '区县', 'w', 'wgs', '武冈市', '430500', 'wugangshi');
INSERT INTO `ot_region` VALUES ('430600', 2, '城市', 'y', 'yys', '岳阳市', '430000', 'yueyangshi');
INSERT INTO `ot_region` VALUES ('430602', 3, '区县', 'y', 'yylq', '岳阳楼区', '430600', 'yueyanglouqu');
INSERT INTO `ot_region` VALUES ('430603', 3, '区县', 'y', 'yxq', '云溪区', '430600', 'yunxiqu');
INSERT INTO `ot_region` VALUES ('430611', 3, '区县', 'j', 'jsq', '君山区', '430600', 'junshanqu');
INSERT INTO `ot_region` VALUES ('430621', 3, '区县', 'y', 'yyx', '岳阳县', '430600', 'yueyangxian');
INSERT INTO `ot_region` VALUES ('430623', 3, '区县', 'h', 'hrx', '华容县', '430600', 'huarongxian');
INSERT INTO `ot_region` VALUES ('430624', 3, '区县', 'x', 'xyx', '湘阴县', '430600', 'xiangyinxian');
INSERT INTO `ot_region` VALUES ('430626', 3, '区县', 'p', 'pjx', '平江县', '430600', 'pingjiangxian');
INSERT INTO `ot_region` VALUES ('430681', 3, '区县', 'm', 'mls', '汨罗市', '430600', 'miluoshi');
INSERT INTO `ot_region` VALUES ('430682', 3, '区县', 'l', 'lxs', '临湘市', '430600', 'linxiangshi');
INSERT INTO `ot_region` VALUES ('430700', 2, '城市', 'c', 'cds', '常德市', '430000', 'changdeshi');
INSERT INTO `ot_region` VALUES ('430702', 3, '区县', 'w', 'wlq', '武陵区', '430700', 'wulingqu');
INSERT INTO `ot_region` VALUES ('430703', 3, '区县', 'd', 'dcq', '鼎城区', '430700', 'dingchengqu');
INSERT INTO `ot_region` VALUES ('430721', 3, '区县', 'a', 'axx', '安乡县', '430700', 'anxiangxian');
INSERT INTO `ot_region` VALUES ('430722', 3, '区县', 'h', 'hsx', '汉寿县', '430700', 'hanshouxian');
INSERT INTO `ot_region` VALUES ('430723', 3, '区县', 'l', 'lx', '澧县', '430700', 'lixian');
INSERT INTO `ot_region` VALUES ('430724', 3, '区县', 'l', 'llx', '临澧县', '430700', 'linlixian');
INSERT INTO `ot_region` VALUES ('430725', 3, '区县', 't', 'tyx', '桃源县', '430700', 'taoyuanxian');
INSERT INTO `ot_region` VALUES ('430726', 3, '区县', 's', 'smx', '石门县', '430700', 'shimenxian');
INSERT INTO `ot_region` VALUES ('430781', 3, '区县', 'j', 'jss', '津市市', '430700', 'jinshishi');
INSERT INTO `ot_region` VALUES ('430800', 2, '城市', 'z', 'zjjs', '张家界市', '430000', 'zhangjiajieshi');
INSERT INTO `ot_region` VALUES ('430802', 3, '区县', 'y', 'ydq', '永定区', '430800', 'yongdingqu');
INSERT INTO `ot_region` VALUES ('430811', 3, '区县', 'w', 'wlyq', '武陵源区', '430800', 'wulingyuanqu');
INSERT INTO `ot_region` VALUES ('430821', 3, '区县', 'c', 'clx', '慈利县', '430800', 'cilixian');
INSERT INTO `ot_region` VALUES ('430822', 3, '区县', 's', 'szx', '桑植县', '430800', 'sangzhixian');
INSERT INTO `ot_region` VALUES ('430900', 2, '城市', 'y', 'yys', '益阳市', '430000', 'yiyangshi');
INSERT INTO `ot_region` VALUES ('430902', 3, '区县', 'z', 'zyq', '资阳区', '430900', 'ziyangqu');
INSERT INTO `ot_region` VALUES ('430903', 3, '区县', 'h', 'hsq', '赫山区', '430900', 'heshanqu');
INSERT INTO `ot_region` VALUES ('430921', 3, '区县', 'n', 'nx', '南县', '430900', 'nanxian');
INSERT INTO `ot_region` VALUES ('430922', 3, '区县', 't', 'tjx', '桃江县', '430900', 'taojiangxian');
INSERT INTO `ot_region` VALUES ('430923', 3, '区县', 'a', 'ahx', '安化县', '430900', 'anhuaxian');
INSERT INTO `ot_region` VALUES ('430981', 3, '区县', 'y', 'yjs', '沅江市', '430900', 'yuanjiangshi');
INSERT INTO `ot_region` VALUES ('431000', 2, '城市', 'c', 'czs', '郴州市', '430000', 'chenzhoushi');
INSERT INTO `ot_region` VALUES ('431002', 3, '区县', 'b', 'bhq', '北湖区', '431000', 'beihuqu');
INSERT INTO `ot_region` VALUES ('431003', 3, '区县', 's', 'sxq', '苏仙区', '431000', 'suxianqu');
INSERT INTO `ot_region` VALUES ('431021', 3, '区县', 'g', 'gyx', '桂阳县', '431000', 'guiyangxian');
INSERT INTO `ot_region` VALUES ('431022', 3, '区县', 'y', 'yzx', '宜章县', '431000', 'yizhangxian');
INSERT INTO `ot_region` VALUES ('431023', 3, '区县', 'y', 'yxx', '永兴县', '431000', 'yongxingxian');
INSERT INTO `ot_region` VALUES ('431024', 3, '区县', 'j', 'jhx', '嘉禾县', '431000', 'jiahexian');
INSERT INTO `ot_region` VALUES ('431025', 3, '区县', 'l', 'lwx', '临武县', '431000', 'linwuxian');
INSERT INTO `ot_region` VALUES ('431026', 3, '区县', 'r', 'rcx', '汝城县', '431000', 'ruchengxian');
INSERT INTO `ot_region` VALUES ('431027', 3, '区县', 'g', 'gdx', '桂东县', '431000', 'guidongxian');
INSERT INTO `ot_region` VALUES ('431028', 3, '区县', 'a', 'arx', '安仁县', '431000', 'anrenxian');
INSERT INTO `ot_region` VALUES ('431081', 3, '区县', 'z', 'zxs', '资兴市', '431000', 'zixingshi');
INSERT INTO `ot_region` VALUES ('431100', 2, '城市', 'y', 'yzs', '永州市', '430000', 'yongzhoushi');
INSERT INTO `ot_region` VALUES ('431102', 3, '区县', 'l', 'llq', '零陵区', '431100', 'linglingqu');
INSERT INTO `ot_region` VALUES ('431103', 3, '区县', 'l', 'lstq', '冷水滩区', '431100', 'lengshuitanqu');
INSERT INTO `ot_region` VALUES ('431121', 3, '区县', 'q', 'qyx', '祁阳县', '431100', 'qiyangxian');
INSERT INTO `ot_region` VALUES ('431122', 3, '区县', 'd', 'dax', '东安县', '431100', 'donganxian');
INSERT INTO `ot_region` VALUES ('431123', 3, '区县', 's', 'spx', '双牌县', '431100', 'shuangpaixian');
INSERT INTO `ot_region` VALUES ('431124', 3, '区县', 'd', 'dx', '道县', '431100', 'daoxian');
INSERT INTO `ot_region` VALUES ('431125', 3, '区县', 'j', 'jyx', '江永县', '431100', 'jiangyongxian');
INSERT INTO `ot_region` VALUES ('431126', 3, '区县', 'n', 'nyx', '宁远县', '431100', 'ningyuanxian');
INSERT INTO `ot_region` VALUES ('431127', 3, '区县', 'l', 'lsx', '蓝山县', '431100', 'lanshanxian');
INSERT INTO `ot_region` VALUES ('431128', 3, '区县', 'x', 'xtx', '新田县', '431100', 'xintianxian');
INSERT INTO `ot_region` VALUES ('431129', 3, '区县', 'j', 'jhyzzzx', '江华瑶族自治县', '431100', 'jianghuayaozuzizhixian');
INSERT INTO `ot_region` VALUES ('431200', 2, '城市', 'h', 'hhs', '怀化市', '430000', 'huaihuashi');
INSERT INTO `ot_region` VALUES ('431202', 3, '区县', 'h', 'hcq', '鹤城区', '431200', 'hechengqu');
INSERT INTO `ot_region` VALUES ('431221', 3, '区县', 'z', 'zfx', '中方县', '431200', 'zhongfangxian');
INSERT INTO `ot_region` VALUES ('431222', 3, '区县', 'y', 'ylx', '沅陵县', '431200', 'yuanlingxian');
INSERT INTO `ot_region` VALUES ('431223', 3, '区县', 'c', 'cxx', '辰溪县', '431200', 'chenxixian');
INSERT INTO `ot_region` VALUES ('431224', 3, '区县', 'x', 'xpx', '溆浦县', '431200', 'xupuxian');
INSERT INTO `ot_region` VALUES ('431225', 3, '区县', 'h', 'htx', '会同县', '431200', 'huitongxian');
INSERT INTO `ot_region` VALUES ('431226', 3, '区县', 'm', 'mymzzzx', '麻阳苗族自治县', '431200', 'mayangmiaozuzizhixian');
INSERT INTO `ot_region` VALUES ('431227', 3, '区县', 'x', 'xhdzzzx', '新晃侗族自治县', '431200', 'xinhuangdongzuzizhixian');
INSERT INTO `ot_region` VALUES ('431228', 3, '区县', 'z', 'zjdzzzx', '芷江侗族自治县', '431200', 'zhijiangdongzuzizhixian');
INSERT INTO `ot_region` VALUES ('431229', 3, '区县', 'j', 'jzmzdzzzx', '靖州苗族侗族自治县', '431200', 'jingzhoumiaozudongzuzizhixian');
INSERT INTO `ot_region` VALUES ('431230', 3, '区县', 't', 'tddzzzx', '通道侗族自治县', '431200', 'tongdaodongzuzizhixian');
INSERT INTO `ot_region` VALUES ('431281', 3, '区县', 'h', 'hjs', '洪江市', '431200', 'hongjiangshi');
INSERT INTO `ot_region` VALUES ('431300', 2, '城市', 'l', 'lds', '娄底市', '430000', 'loudishi');
INSERT INTO `ot_region` VALUES ('431302', 3, '区县', 'l', 'lxq', '娄星区', '431300', 'louxingqu');
INSERT INTO `ot_region` VALUES ('431321', 3, '区县', 's', 'sfx', '双峰县', '431300', 'shuangfengxian');
INSERT INTO `ot_region` VALUES ('431322', 3, '区县', 'x', 'xhx', '新化县', '431300', 'xinhuaxian');
INSERT INTO `ot_region` VALUES ('431381', 3, '区县', 'l', 'lsjs', '冷水江市', '431300', 'lengshuijiangshi');
INSERT INTO `ot_region` VALUES ('431382', 3, '区县', 'l', 'lys', '涟源市', '431300', 'lianyuanshi');
INSERT INTO `ot_region` VALUES ('433100', 2, '城市', 'x', 'xxtjzmzzzz', '湘西土家族苗族自治州', '430000', 'xiangxitujiazumiaozuzizhizhou');
INSERT INTO `ot_region` VALUES ('433101', 3, '区县', 'j', 'jss', '吉首市', '433100', 'jishoushi');
INSERT INTO `ot_region` VALUES ('433122', 3, '区县', 'l', 'lxx', '泸溪县', '433100', 'luxixian');
INSERT INTO `ot_region` VALUES ('433123', 3, '区县', 'f', 'fhx', '凤凰县', '433100', 'fenghuangxian');
INSERT INTO `ot_region` VALUES ('433124', 3, '区县', 'h', 'hyx', '花垣县', '433100', 'huayuanxian');
INSERT INTO `ot_region` VALUES ('433125', 3, '区县', 'b', 'bjx', '保靖县', '433100', 'baojingxian');
INSERT INTO `ot_region` VALUES ('433126', 3, '区县', 'g', 'gzx', '古丈县', '433100', 'guzhangxian');
INSERT INTO `ot_region` VALUES ('433127', 3, '区县', 'y', 'ysx', '永顺县', '433100', 'yongshunxian');
INSERT INTO `ot_region` VALUES ('433130', 3, '区县', 'l', 'lsx', '龙山县', '433100', 'longshanxian');
INSERT INTO `ot_region` VALUES ('440100', 2, '城市', 'g', 'gzs', '广州市', '440000', 'guangzhoushi');
INSERT INTO `ot_region` VALUES ('440103', 3, '区县', 'l', 'lwq', '荔湾区', '440100', 'liwanqu');
INSERT INTO `ot_region` VALUES ('440104', 3, '区县', 'y', 'yxq', '越秀区', '440100', 'yuexiuqu');
INSERT INTO `ot_region` VALUES ('440105', 3, '区县', 'h', 'hzq', '海珠区', '440100', 'haizhuqu');
INSERT INTO `ot_region` VALUES ('440106', 3, '区县', 't', 'thq', '天河区', '440100', 'tianhequ');
INSERT INTO `ot_region` VALUES ('440111', 3, '区县', 'b', 'byq', '白云区', '440100', 'baiyunqu');
INSERT INTO `ot_region` VALUES ('440112', 3, '区县', 'h', 'hpq', '黄埔区', '440100', 'huangpuqu');
INSERT INTO `ot_region` VALUES ('440113', 3, '区县', 'f', 'fyq', '番禺区', '440100', 'fanyuqu');
INSERT INTO `ot_region` VALUES ('440114', 3, '区县', 'h', 'hdq', '花都区', '440100', 'huadouqu');
INSERT INTO `ot_region` VALUES ('440115', 3, '区县', 'n', 'nsq', '南沙区', '440100', 'nanshaqu');
INSERT INTO `ot_region` VALUES ('440117', 3, '区县', 'c', 'chq', '从化区', '440100', 'conghuaqu');
INSERT INTO `ot_region` VALUES ('440118', 3, '区县', 'z', 'zcq', '增城区', '440100', 'zengchengqu');
INSERT INTO `ot_region` VALUES ('440200', 2, '城市', 's', 'sgs', '韶关市', '440000', 'shaoguanshi');
INSERT INTO `ot_region` VALUES ('440203', 3, '区县', 'w', 'wjq', '武江区', '440200', 'wujiangqu');
INSERT INTO `ot_region` VALUES ('440204', 3, '区县', 'z', 'zjq', '浈江区', '440200', 'zhenjiangqu');
INSERT INTO `ot_region` VALUES ('440205', 3, '区县', 'q', 'qjq', '曲江区', '440200', 'qujiangqu');
INSERT INTO `ot_region` VALUES ('440222', 3, '区县', 's', 'sxx', '始兴县', '440200', 'shixingxian');
INSERT INTO `ot_region` VALUES ('440224', 3, '区县', 'r', 'rhx', '仁化县', '440200', 'renhuaxian');
INSERT INTO `ot_region` VALUES ('440229', 3, '区县', 'w', 'wyx', '翁源县', '440200', 'wengyuanxian');
INSERT INTO `ot_region` VALUES ('440232', 3, '区县', 'r', 'ryyzzzx', '乳源瑶族自治县', '440200', 'ruyuanyaozuzizhixian');
INSERT INTO `ot_region` VALUES ('440233', 3, '区县', 'x', 'xfx', '新丰县', '440200', 'xinfengxian');
INSERT INTO `ot_region` VALUES ('440281', 3, '区县', 'l', 'lcs', '乐昌市', '440200', 'lechangshi');
INSERT INTO `ot_region` VALUES ('440282', 3, '区县', 'n', 'nxs', '南雄市', '440200', 'nanxiongshi');
INSERT INTO `ot_region` VALUES ('440300', 2, '城市', 's', 'szs', '深圳市', '440000', 'shenzhenshi');
INSERT INTO `ot_region` VALUES ('440303', 3, '区县', 'l', 'lhq', '罗湖区', '440300', 'luohuqu');
INSERT INTO `ot_region` VALUES ('440304', 3, '区县', 'f', 'ftq', '福田区', '440300', 'futianqu');
INSERT INTO `ot_region` VALUES ('440305', 3, '区县', 'n', 'nsq', '南山区', '440300', 'nanshanqu');
INSERT INTO `ot_region` VALUES ('440306', 3, '区县', 'b', 'baq', '宝安区', '440300', 'baoanqu');
INSERT INTO `ot_region` VALUES ('440307', 3, '区县', 'l', 'lgq', '龙岗区', '440300', 'longgangqu');
INSERT INTO `ot_region` VALUES ('440308', 3, '区县', 'y', 'ytq', '盐田区', '440300', 'yantianqu');
INSERT INTO `ot_region` VALUES ('440309', 3, '区县', 'l', 'lhq', '龙华区', '440300', 'longhuaqu');
INSERT INTO `ot_region` VALUES ('440310', 3, '区县', 'p', 'psq', '坪山区', '440300', 'pingshanqu');
INSERT INTO `ot_region` VALUES ('440311', 3, '区县', 'g', 'gmq', '光明区', '440300', 'guangmingqu');
INSERT INTO `ot_region` VALUES ('440400', 2, '城市', 'z', 'zhs', '珠海市', '440000', 'zhuhaishi');
INSERT INTO `ot_region` VALUES ('440402', 3, '区县', 'x', 'xzq', '香洲区', '440400', 'xiangzhouqu');
INSERT INTO `ot_region` VALUES ('440403', 3, '区县', 'd', 'dmq', '斗门区', '440400', 'doumenqu');
INSERT INTO `ot_region` VALUES ('440404', 3, '区县', 'j', 'jwq', '金湾区', '440400', 'jinwanqu');
INSERT INTO `ot_region` VALUES ('440500', 2, '城市', 's', 'sts', '汕头市', '440000', 'shantoushi');
INSERT INTO `ot_region` VALUES ('440507', 3, '区县', 'l', 'lhq', '龙湖区', '440500', 'longhuqu');
INSERT INTO `ot_region` VALUES ('440511', 3, '区县', 'j', 'jpq', '金平区', '440500', 'jinpingqu');
INSERT INTO `ot_region` VALUES ('440512', 3, '区县', 'h', 'hjq', '濠江区', '440500', 'haojiangqu');
INSERT INTO `ot_region` VALUES ('440513', 3, '区县', 'c', 'cyq', '潮阳区', '440500', 'chaoyangqu');
INSERT INTO `ot_region` VALUES ('440514', 3, '区县', 'c', 'cnq', '潮南区', '440500', 'chaonanqu');
INSERT INTO `ot_region` VALUES ('440515', 3, '区县', 'c', 'chq', '澄海区', '440500', 'chenghaiqu');
INSERT INTO `ot_region` VALUES ('440523', 3, '区县', 'n', 'nax', '南澳县', '440500', 'nanaoxian');
INSERT INTO `ot_region` VALUES ('440600', 2, '城市', 'f', 'fss', '佛山市', '440000', 'foshanshi');
INSERT INTO `ot_region` VALUES ('440604', 3, '区县', 's', 'scq', '禅城区', '440600', 'shanchengqu');
INSERT INTO `ot_region` VALUES ('440605', 3, '区县', 'n', 'nhq', '南海区', '440600', 'nanhaiqu');
INSERT INTO `ot_region` VALUES ('440606', 3, '区县', 's', 'sdq', '顺德区', '440600', 'shundequ');
INSERT INTO `ot_region` VALUES ('440607', 3, '区县', 's', 'ssq', '三水区', '440600', 'sanshuiqu');
INSERT INTO `ot_region` VALUES ('440608', 3, '区县', 'g', 'gmq', '高明区', '440600', 'gaomingqu');
INSERT INTO `ot_region` VALUES ('440700', 2, '城市', 'j', 'jms', '江门市', '440000', 'jiangmenshi');
INSERT INTO `ot_region` VALUES ('440703', 3, '区县', 'p', 'pjq', '蓬江区', '440700', 'pengjiangqu');
INSERT INTO `ot_region` VALUES ('440704', 3, '区县', 'j', 'jhq', '江海区', '440700', 'jianghaiqu');
INSERT INTO `ot_region` VALUES ('440705', 3, '区县', 'x', 'xhq', '新会区', '440700', 'xinhuiqu');
INSERT INTO `ot_region` VALUES ('440781', 3, '区县', 't', 'tss', '台山市', '440700', 'taishanshi');
INSERT INTO `ot_region` VALUES ('440783', 3, '区县', 'k', 'kps', '开平市', '440700', 'kaipingshi');
INSERT INTO `ot_region` VALUES ('440784', 3, '区县', 'h', 'hss', '鹤山市', '440700', 'heshanshi');
INSERT INTO `ot_region` VALUES ('440785', 3, '区县', 'e', 'eps', '恩平市', '440700', 'enpingshi');
INSERT INTO `ot_region` VALUES ('440800', 2, '城市', 'z', 'zjs', '湛江市', '440000', 'zhanjiangshi');
INSERT INTO `ot_region` VALUES ('440802', 3, '区县', 'c', 'ckq', '赤坎区', '440800', 'chikanqu');
INSERT INTO `ot_region` VALUES ('440803', 3, '区县', 'x', 'xsq', '霞山区', '440800', 'xiashanqu');
INSERT INTO `ot_region` VALUES ('440804', 3, '区县', 'p', 'ptq', '坡头区', '440800', 'potouqu');
INSERT INTO `ot_region` VALUES ('440811', 3, '区县', 'm', 'mzq', '麻章区', '440800', 'mazhangqu');
INSERT INTO `ot_region` VALUES ('440823', 3, '区县', 's', 'sxx', '遂溪县', '440800', 'suixixian');
INSERT INTO `ot_region` VALUES ('440825', 3, '区县', 'x', 'xwx', '徐闻县', '440800', 'xuwenxian');
INSERT INTO `ot_region` VALUES ('440881', 3, '区县', 'l', 'ljs', '廉江市', '440800', 'lianjiangshi');
INSERT INTO `ot_region` VALUES ('440882', 3, '区县', 'l', 'lzs', '雷州市', '440800', 'leizhoushi');
INSERT INTO `ot_region` VALUES ('440883', 3, '区县', 'w', 'wcs', '吴川市', '440800', 'wuchuanshi');
INSERT INTO `ot_region` VALUES ('440890', 3, '区县', 'j', 'jjjskfq', '经济技术开发区', '440800', 'jingjijishukaifaqu');
INSERT INTO `ot_region` VALUES ('440900', 2, '城市', 'm', 'mms', '茂名市', '440000', 'maomingshi');
INSERT INTO `ot_region` VALUES ('440902', 3, '区县', 'm', 'mnq', '茂南区', '440900', 'maonanqu');
INSERT INTO `ot_region` VALUES ('440904', 3, '区县', 'd', 'dbq', '电白区', '440900', 'dianbaiqu');
INSERT INTO `ot_region` VALUES ('440981', 3, '区县', 'g', 'gzs', '高州市', '440900', 'gaozhoushi');
INSERT INTO `ot_region` VALUES ('440982', 3, '区县', 'h', 'hzs', '化州市', '440900', 'huazhoushi');
INSERT INTO `ot_region` VALUES ('440983', 3, '区县', 'x', 'xys', '信宜市', '440900', 'xinyishi');
INSERT INTO `ot_region` VALUES ('441200', 2, '城市', 'z', 'zqs', '肇庆市', '440000', 'zhaoqingshi');
INSERT INTO `ot_region` VALUES ('441202', 3, '区县', 'd', 'dzq', '端州区', '441200', 'duanzhouqu');
INSERT INTO `ot_region` VALUES ('441203', 3, '区县', 'd', 'dhq', '鼎湖区', '441200', 'dinghuqu');
INSERT INTO `ot_region` VALUES ('441204', 3, '区县', 'g', 'gyq', '高要区', '441200', 'gaoyaoqu');
INSERT INTO `ot_region` VALUES ('441223', 3, '区县', 'g', 'gnx', '广宁县', '441200', 'guangningxian');
INSERT INTO `ot_region` VALUES ('441224', 3, '区县', 'h', 'hjx', '怀集县', '441200', 'huaijixian');
INSERT INTO `ot_region` VALUES ('441225', 3, '区县', 'f', 'fkx', '封开县', '441200', 'fengkaixian');
INSERT INTO `ot_region` VALUES ('441226', 3, '区县', 'd', 'dqx', '德庆县', '441200', 'deqingxian');
INSERT INTO `ot_region` VALUES ('441284', 3, '区县', 's', 'shs', '四会市', '441200', 'sihuishi');
INSERT INTO `ot_region` VALUES ('441300', 2, '城市', 'h', 'hzs', '惠州市', '440000', 'huizhoushi');
INSERT INTO `ot_region` VALUES ('441302', 3, '区县', 'h', 'hcq', '惠城区', '441300', 'huichengqu');
INSERT INTO `ot_region` VALUES ('441303', 3, '区县', 'h', 'hyq', '惠阳区', '441300', 'huiyangqu');
INSERT INTO `ot_region` VALUES ('441322', 3, '区县', 'b', 'blx', '博罗县', '441300', 'boluoxian');
INSERT INTO `ot_region` VALUES ('441323', 3, '区县', 'h', 'hdx', '惠东县', '441300', 'huidongxian');
INSERT INTO `ot_region` VALUES ('441324', 3, '区县', 'l', 'lmx', '龙门县', '441300', 'longmenxian');
INSERT INTO `ot_region` VALUES ('441400', 2, '城市', 'm', 'mzs', '梅州市', '440000', 'meizhoushi');
INSERT INTO `ot_region` VALUES ('441402', 3, '区县', 'm', 'mjq', '梅江区', '441400', 'meijiangqu');
INSERT INTO `ot_region` VALUES ('441403', 3, '区县', 'm', 'mxq', '梅县区', '441400', 'meixianqu');
INSERT INTO `ot_region` VALUES ('441422', 3, '区县', 'd', 'dpx', '大埔县', '441400', 'dapuxian');
INSERT INTO `ot_region` VALUES ('441423', 3, '区县', 'f', 'fsx', '丰顺县', '441400', 'fengshunxian');
INSERT INTO `ot_region` VALUES ('441424', 3, '区县', 'w', 'whx', '五华县', '441400', 'wuhuaxian');
INSERT INTO `ot_region` VALUES ('441426', 3, '区县', 'p', 'pyx', '平远县', '441400', 'pingyuanxian');
INSERT INTO `ot_region` VALUES ('441427', 3, '区县', 'j', 'jlx', '蕉岭县', '441400', 'jiaolingxian');
INSERT INTO `ot_region` VALUES ('441481', 3, '区县', 'x', 'xns', '兴宁市', '441400', 'xingningshi');
INSERT INTO `ot_region` VALUES ('441500', 2, '城市', 's', 'sws', '汕尾市', '440000', 'shanweishi');
INSERT INTO `ot_region` VALUES ('441502', 3, '区县', 'c', 'cq', '城区', '441500', 'chengqu');
INSERT INTO `ot_region` VALUES ('441521', 3, '区县', 'h', 'hfx', '海丰县', '441500', 'haifengxian');
INSERT INTO `ot_region` VALUES ('441523', 3, '区县', 'l', 'lhx', '陆河县', '441500', 'luhexian');
INSERT INTO `ot_region` VALUES ('441581', 3, '区县', 'l', 'lfs', '陆丰市', '441500', 'lufengshi');
INSERT INTO `ot_region` VALUES ('441600', 2, '城市', 'h', 'hys', '河源市', '440000', 'heyuanshi');
INSERT INTO `ot_region` VALUES ('441602', 3, '区县', 'y', 'ycq', '源城区', '441600', 'yuanchengqu');
INSERT INTO `ot_region` VALUES ('441621', 3, '区县', 'z', 'zjx', '紫金县', '441600', 'zijinxian');
INSERT INTO `ot_region` VALUES ('441622', 3, '区县', 'l', 'lcx', '龙川县', '441600', 'longchuanxian');
INSERT INTO `ot_region` VALUES ('441623', 3, '区县', 'l', 'lpx', '连平县', '441600', 'lianpingxian');
INSERT INTO `ot_region` VALUES ('441624', 3, '区县', 'h', 'hpx', '和平县', '441600', 'hepingxian');
INSERT INTO `ot_region` VALUES ('441625', 3, '区县', 'd', 'dyx', '东源县', '441600', 'dongyuanxian');
INSERT INTO `ot_region` VALUES ('441700', 2, '城市', 'y', 'yjs', '阳江市', '440000', 'yangjiangshi');
INSERT INTO `ot_region` VALUES ('441702', 3, '区县', 'j', 'jcq', '江城区', '441700', 'jiangchengqu');
INSERT INTO `ot_region` VALUES ('441704', 3, '区县', 'y', 'ydq', '阳东区', '441700', 'yangdongqu');
INSERT INTO `ot_region` VALUES ('441721', 3, '区县', 'y', 'yxx', '阳西县', '441700', 'yangxixian');
INSERT INTO `ot_region` VALUES ('441781', 3, '区县', 'y', 'ycs', '阳春市', '441700', 'yangchunshi');
INSERT INTO `ot_region` VALUES ('441800', 2, '城市', 'q', 'qys', '清远市', '440000', 'qingyuanshi');
INSERT INTO `ot_region` VALUES ('441802', 3, '区县', 'q', 'qcq', '清城区', '441800', 'qingchengqu');
INSERT INTO `ot_region` VALUES ('441803', 3, '区县', 'q', 'qxq', '清新区', '441800', 'qingxinqu');
INSERT INTO `ot_region` VALUES ('441821', 3, '区县', 'f', 'fgx', '佛冈县', '441800', 'fogangxian');
INSERT INTO `ot_region` VALUES ('441823', 3, '区县', 'y', 'ysx', '阳山县', '441800', 'yangshanxian');
INSERT INTO `ot_region` VALUES ('441825', 3, '区县', 'l', 'lszzyzzzx', '连山壮族瑶族自治县', '441800', 'lianshanzhuangzuyaozuzizhixian');
INSERT INTO `ot_region` VALUES ('441826', 3, '区县', 'l', 'lnyzzzx', '连南瑶族自治县', '441800', 'liannanyaozuzizhixian');
INSERT INTO `ot_region` VALUES ('441881', 3, '区县', 'y', 'yds', '英德市', '441800', 'yingdeshi');
INSERT INTO `ot_region` VALUES ('441882', 3, '区县', 'l', 'lzs', '连州市', '441800', 'lianzhoushi');
INSERT INTO `ot_region` VALUES ('441900', 2, '城市', 'd', 'dgs', '东莞市', '440000', 'dongguanshi');
INSERT INTO `ot_region` VALUES ('441901', 3, '区县', 'z', 'ztz', '中堂镇', '441900', 'zhongtangzhen');
INSERT INTO `ot_region` VALUES ('441903', 3, '区县', 'n', 'ncjdbsc', '南城街道办事处', '441900', 'nanchengjiedaobanshichu');
INSERT INTO `ot_region` VALUES ('441904', 3, '区县', 'z', 'zaz', '长安镇', '441900', 'zhanganzhen');
INSERT INTO `ot_region` VALUES ('441905', 3, '区县', 'd', 'dkz', '东坑镇', '441900', 'dongkengzhen');
INSERT INTO `ot_region` VALUES ('441906', 3, '区县', 'z', 'zmtz', '樟木头镇', '441900', 'zhangmutouzhen');
INSERT INTO `ot_region` VALUES ('441907', 3, '区县', 'g', 'gcjdbsc', '莞城街道办事处', '441900', 'guanchengjiedaobanshichu');
INSERT INTO `ot_region` VALUES ('441908', 3, '区县', 's', 'slz', '石龙镇', '441900', 'shilongzhen');
INSERT INTO `ot_region` VALUES ('441909', 3, '区县', 'q', 'qtz', '桥头镇', '441900', 'qiaotouzhen');
INSERT INTO `ot_region` VALUES ('441910', 3, '区县', 'w', 'wjjdbsc', '万江街道办事处', '441900', 'wanjiangjiedaobanshichu');
INSERT INTO `ot_region` VALUES ('441911', 3, '区县', 'm', 'myz', '麻涌镇', '441900', 'mayongzhen');
INSERT INTO `ot_region` VALUES ('441912', 3, '区县', 'h', 'hmz', '虎门镇', '441900', 'humenzhen');
INSERT INTO `ot_region` VALUES ('441913', 3, '区县', 'x', 'xgz', '谢岗镇', '441900', 'xiegangzhen');
INSERT INTO `ot_region` VALUES ('441914', 3, '区县', 's', 'sjz', '石碣镇', '441900', 'shijiezhen');
INSERT INTO `ot_region` VALUES ('441915', 3, '区县', 'c', 'csz', '茶山镇', '441900', 'chashanzhen');
INSERT INTO `ot_region` VALUES ('441916', 3, '区县', 'd', 'dcjdbsc', '东城街道办事处', '441900', 'dongchengjiedaobanshichu');
INSERT INTO `ot_region` VALUES ('441917', 3, '区县', 'h', 'hmz', '洪梅镇', '441900', 'hongmeizhen');
INSERT INTO `ot_region` VALUES ('441918', 3, '区县', 'd', 'djz', '道滘镇', '441900', 'daojiaozhen');
INSERT INTO `ot_region` VALUES ('441919', 3, '区县', 'g', 'gbz', '高埗镇', '441900', 'gaobuzhen');
INSERT INTO `ot_region` VALUES ('441920', 3, '区县', 'q', 'qsz', '企石镇', '441900', 'qishizhen');
INSERT INTO `ot_region` VALUES ('441921', 3, '区县', 'f', 'fgz', '凤岗镇', '441900', 'fenggangzhen');
INSERT INTO `ot_region` VALUES ('441922', 3, '区县', 'd', 'dlsz', '大岭山镇', '441900', 'dalingshanzhen');
INSERT INTO `ot_region` VALUES ('441923', 3, '区县', 's', 'sshgwh', '松山湖管委会', '441900', 'songshanhuguanweihui');
INSERT INTO `ot_region` VALUES ('441924', 3, '区县', 'q', 'qxz', '清溪镇', '441900', 'qingxizhen');
INSERT INTO `ot_region` VALUES ('441925', 3, '区县', 'w', 'wndz', '望牛墩镇', '441900', 'wangniudunzhen');
INSERT INTO `ot_region` VALUES ('441926', 3, '区县', 'h', 'hjz', '厚街镇', '441900', 'houjiezhen');
INSERT INTO `ot_region` VALUES ('441927', 3, '区县', 'c', 'cpz', '常平镇', '441900', 'changpingzhen');
INSERT INTO `ot_region` VALUES ('441928', 3, '区县', 'l', 'lbz', '寮步镇', '441900', 'liaobuzhen');
INSERT INTO `ot_region` VALUES ('441929', 3, '区县', 's', 'spz', '石排镇', '441900', 'shipaizhen');
INSERT INTO `ot_region` VALUES ('441930', 3, '区县', 'h', 'hlz', '横沥镇', '441900', 'henglizhen');
INSERT INTO `ot_region` VALUES ('441931', 3, '区县', 't', 'tsz', '塘厦镇', '441900', 'tangshazhen');
INSERT INTO `ot_region` VALUES ('441932', 3, '区县', 'h', 'hjz', '黄江镇', '441900', 'huangjiangzhen');
INSERT INTO `ot_region` VALUES ('441933', 3, '区县', 'd', 'dlz', '大朗镇', '441900', 'dalangzhen');
INSERT INTO `ot_region` VALUES ('441934', 3, '区县', 'd', 'dgg', '东莞港', '441900', 'dongguangang');
INSERT INTO `ot_region` VALUES ('441935', 3, '区县', 'd', 'dgsty', '东莞生态园', '441900', 'dongguanshengtaiyuan');
INSERT INTO `ot_region` VALUES ('441990', 3, '区县', 's', 'stz', '沙田镇', '441900', 'shatianzhen');
INSERT INTO `ot_region` VALUES ('442000', 2, '城市', 'z', 'zss', '中山市', '440000', 'zhongshanshi');
INSERT INTO `ot_region` VALUES ('442001', 3, '区县', 'n', 'ntz', '南头镇', '442000', 'nantouzhen');
INSERT INTO `ot_region` VALUES ('442002', 3, '区县', 's', 'swz', '神湾镇', '442000', 'shenwanzhen');
INSERT INTO `ot_region` VALUES ('442003', 3, '区县', 'd', 'dfz', '东凤镇', '442000', 'dongfengzhen');
INSERT INTO `ot_region` VALUES ('442004', 3, '区县', 'w', 'wgsjdbsc', '五桂山街道办事处', '442000', 'wuguishanjiedaobanshichu');
INSERT INTO `ot_region` VALUES ('442005', 3, '区县', 'h', 'hpz', '黄圃镇', '442000', 'huangpuzhen');
INSERT INTO `ot_region` VALUES ('442006', 3, '区县', 'x', 'xlz', '小榄镇', '442000', 'xiaolanzhen');
INSERT INTO `ot_region` VALUES ('442007', 3, '区县', 's', 'sqqjdbsc', '石岐区街道办事处', '442000', 'shiqiqujiedaobanshichu');
INSERT INTO `ot_region` VALUES ('442008', 3, '区县', 'h', 'hlz', '横栏镇', '442000', 'henglanzhen');
INSERT INTO `ot_region` VALUES ('442009', 3, '区县', 's', 'sjz', '三角镇', '442000', 'sanjiaozhen');
INSERT INTO `ot_region` VALUES ('442010', 3, '区县', 's', 'sxz', '三乡镇', '442000', 'sanxiangzhen');
INSERT INTO `ot_region` VALUES ('442011', 3, '区县', 'g', 'gkz', '港口镇', '442000', 'gangkouzhen');
INSERT INTO `ot_region` VALUES ('442012', 3, '区县', 's', 'sxz', '沙溪镇', '442000', 'shaxizhen');
INSERT INTO `ot_region` VALUES ('442013', 3, '区县', 'b', 'bfz', '板芙镇', '442000', 'banfuzhen');
INSERT INTO `ot_region` VALUES ('442015', 3, '区县', 'd', 'dsz', '东升镇', '442000', 'dongshengzhen');
INSERT INTO `ot_region` VALUES ('442016', 3, '区县', 'f', 'fsz', '阜沙镇', '442000', 'fushazhen');
INSERT INTO `ot_region` VALUES ('442017', 3, '区县', 'm', 'mzz', '民众镇', '442000', 'minzhongzhen');
INSERT INTO `ot_region` VALUES ('442018', 3, '区县', 'd', 'dqjdbsc', '东区街道办事处', '442000', 'dongqujiedaobanshichu');
INSERT INTO `ot_region` VALUES ('442019', 3, '区县', 'h', 'hjkfqjdbsc', '火炬开发区街道办事处', '442000', 'huojukaifaqujiedaobanshichu');
INSERT INTO `ot_region` VALUES ('442020', 3, '区县', 'x', 'xqjdbsc', '西区街道办事处', '442000', 'xiqujiedaobanshichu');
INSERT INTO `ot_region` VALUES ('442021', 3, '区县', 'n', 'nqjdbsc', '南区街道办事处', '442000', 'nanqujiedaobanshichu');
INSERT INTO `ot_region` VALUES ('442022', 3, '区县', 'g', 'gzz', '古镇镇', '442000', 'guzhenzhen');
INSERT INTO `ot_region` VALUES ('442023', 3, '区县', 't', 'tzz', '坦洲镇', '442000', 'tanzhouzhen');
INSERT INTO `ot_region` VALUES ('442024', 3, '区县', 'd', 'dyz', '大涌镇', '442000', 'dayongzhen');
INSERT INTO `ot_region` VALUES ('442025', 3, '区县', 'n', 'nlz', '南朗镇', '442000', 'nanlangzhen');
INSERT INTO `ot_region` VALUES ('445100', 2, '城市', 'c', 'czs', '潮州市', '440000', 'chaozhoushi');
INSERT INTO `ot_region` VALUES ('445102', 3, '区县', 'x', 'xqq', '湘桥区', '445100', 'xiangqiaoqu');
INSERT INTO `ot_region` VALUES ('445103', 3, '区县', 'c', 'caq', '潮安区', '445100', 'chaoanqu');
INSERT INTO `ot_region` VALUES ('445122', 3, '区县', 'r', 'rpx', '饶平县', '445100', 'raopingxian');
INSERT INTO `ot_region` VALUES ('445200', 2, '城市', 'j', 'jys', '揭阳市', '440000', 'jieyangshi');
INSERT INTO `ot_region` VALUES ('445202', 3, '区县', 'r', 'rcq', '榕城区', '445200', 'rongchengqu');
INSERT INTO `ot_region` VALUES ('445203', 3, '区县', 'j', 'jdq', '揭东区', '445200', 'jiedongqu');
INSERT INTO `ot_region` VALUES ('445222', 3, '区县', 'j', 'jxx', '揭西县', '445200', 'jiexixian');
INSERT INTO `ot_region` VALUES ('445224', 3, '区县', 'h', 'hlx', '惠来县', '445200', 'huilaixian');
INSERT INTO `ot_region` VALUES ('445281', 3, '区县', 'p', 'pns', '普宁市', '445200', 'puningshi');
INSERT INTO `ot_region` VALUES ('445300', 2, '城市', 'y', 'yfs', '云浮市', '440000', 'yunfushi');
INSERT INTO `ot_region` VALUES ('445302', 3, '区县', 'y', 'ycq', '云城区', '445300', 'yunchengqu');
INSERT INTO `ot_region` VALUES ('445303', 3, '区县', 'y', 'yaq', '云安区', '445300', 'yunanqu');
INSERT INTO `ot_region` VALUES ('445321', 3, '区县', 'x', 'xxx', '新兴县', '445300', 'xinxingxian');
INSERT INTO `ot_region` VALUES ('445322', 3, '区县', 'y', 'ynx', '郁南县', '445300', 'yunanxian');
INSERT INTO `ot_region` VALUES ('445381', 3, '区县', 'l', 'lds', '罗定市', '445300', 'luodingshi');
INSERT INTO `ot_region` VALUES ('450100', 2, '城市', 'n', 'nns', '南宁市', '450000', 'nanningshi');
INSERT INTO `ot_region` VALUES ('450102', 3, '区县', 'x', 'xnq', '兴宁区', '450100', 'xingningqu');
INSERT INTO `ot_region` VALUES ('450103', 3, '区县', 'q', 'qxq', '青秀区', '450100', 'qingxiuqu');
INSERT INTO `ot_region` VALUES ('450105', 3, '区县', 'j', 'jnq', '江南区', '450100', 'jiangnanqu');
INSERT INTO `ot_region` VALUES ('450107', 3, '区县', 'x', 'xxtq', '西乡塘区', '450100', 'xixiangtangqu');
INSERT INTO `ot_region` VALUES ('450108', 3, '区县', 'l', 'lqq', '良庆区', '450100', 'liangqingqu');
INSERT INTO `ot_region` VALUES ('450109', 3, '区县', 'y', 'ynq', '邕宁区', '450100', 'yongningqu');
INSERT INTO `ot_region` VALUES ('450110', 3, '区县', 'w', 'wmq', '武鸣区', '450100', 'wumingqu');
INSERT INTO `ot_region` VALUES ('450123', 3, '区县', 'l', 'lax', '隆安县', '450100', 'longanxian');
INSERT INTO `ot_region` VALUES ('450124', 3, '区县', 'm', 'msx', '马山县', '450100', 'mashanxian');
INSERT INTO `ot_region` VALUES ('450125', 3, '区县', 's', 'slx', '上林县', '450100', 'shanglinxian');
INSERT INTO `ot_region` VALUES ('450126', 3, '区县', 'b', 'byx', '宾阳县', '450100', 'binyangxian');
INSERT INTO `ot_region` VALUES ('450127', 3, '区县', 'h', 'hx', '横县', '450100', 'hengxian');
INSERT INTO `ot_region` VALUES ('450200', 2, '城市', 'l', 'lzs', '柳州市', '450000', 'liuzhoushi');
INSERT INTO `ot_region` VALUES ('450202', 3, '区县', 'c', 'czq', '城中区', '450200', 'chengzhongqu');
INSERT INTO `ot_region` VALUES ('450203', 3, '区县', 'y', 'yfq', '鱼峰区', '450200', 'yufengqu');
INSERT INTO `ot_region` VALUES ('450204', 3, '区县', 'l', 'lnq', '柳南区', '450200', 'liunanqu');
INSERT INTO `ot_region` VALUES ('450205', 3, '区县', 'l', 'lbq', '柳北区', '450200', 'liubeiqu');
INSERT INTO `ot_region` VALUES ('450206', 3, '区县', 'l', 'ljq', '柳江区', '450200', 'liujiangqu');
INSERT INTO `ot_region` VALUES ('450222', 3, '区县', 'l', 'lcx', '柳城县', '450200', 'liuchengxian');
INSERT INTO `ot_region` VALUES ('450223', 3, '区县', 'l', 'lzx', '鹿寨县', '450200', 'luzhaixian');
INSERT INTO `ot_region` VALUES ('450224', 3, '区县', 'r', 'rax', '融安县', '450200', 'ronganxian');
INSERT INTO `ot_region` VALUES ('450225', 3, '区县', 'r', 'rsmzzzx', '融水苗族自治县', '450200', 'rongshuimiaozuzizhixian');
INSERT INTO `ot_region` VALUES ('450226', 3, '区县', 's', 'sjdzzzx', '三江侗族自治县', '450200', 'sanjiangdongzuzizhixian');
INSERT INTO `ot_region` VALUES ('450300', 2, '城市', 'g', 'gls', '桂林市', '450000', 'guilinshi');
INSERT INTO `ot_region` VALUES ('450302', 3, '区县', 'x', 'xfq', '秀峰区', '450300', 'xiufengqu');
INSERT INTO `ot_region` VALUES ('450303', 3, '区县', 'd', 'dcq', '叠彩区', '450300', 'diecaiqu');
INSERT INTO `ot_region` VALUES ('450304', 3, '区县', 'x', 'xsq', '象山区', '450300', 'xiangshanqu');
INSERT INTO `ot_region` VALUES ('450305', 3, '区县', 'q', 'qxq', '七星区', '450300', 'qixingqu');
INSERT INTO `ot_region` VALUES ('450311', 3, '区县', 'y', 'ysq', '雁山区', '450300', 'yanshanqu');
INSERT INTO `ot_region` VALUES ('450312', 3, '区县', 'l', 'lgq', '临桂区', '450300', 'linguiqu');
INSERT INTO `ot_region` VALUES ('450321', 3, '区县', 'y', 'ysx', '阳朔县', '450300', 'yangshuoxian');
INSERT INTO `ot_region` VALUES ('450323', 3, '区县', 'l', 'lcx', '灵川县', '450300', 'lingchuanxian');
INSERT INTO `ot_region` VALUES ('450324', 3, '区县', 'q', 'qzx', '全州县', '450300', 'quanzhouxian');
INSERT INTO `ot_region` VALUES ('450325', 3, '区县', 'x', 'xax', '兴安县', '450300', 'xinganxian');
INSERT INTO `ot_region` VALUES ('450326', 3, '区县', 'y', 'yfx', '永福县', '450300', 'yongfuxian');
INSERT INTO `ot_region` VALUES ('450327', 3, '区县', 'g', 'gyx', '灌阳县', '450300', 'guanyangxian');
INSERT INTO `ot_region` VALUES ('450328', 3, '区县', 'l', 'lsgzzzx', '龙胜各族自治县', '450300', 'longshenggezuzizhixian');
INSERT INTO `ot_region` VALUES ('450329', 3, '区县', 'z', 'zyx', '资源县', '450300', 'ziyuanxian');
INSERT INTO `ot_region` VALUES ('450330', 3, '区县', 'p', 'plx', '平乐县', '450300', 'pinglexian');
INSERT INTO `ot_region` VALUES ('450332', 3, '区县', 'g', 'gcyzzzx', '恭城瑶族自治县', '450300', 'gongchengyaozuzizhixian');
INSERT INTO `ot_region` VALUES ('450381', 3, '区县', 'l', 'lps', '荔浦市', '450300', 'lipushi');
INSERT INTO `ot_region` VALUES ('450400', 2, '城市', 'w', 'wzs', '梧州市', '450000', 'wuzhoushi');
INSERT INTO `ot_region` VALUES ('450403', 3, '区县', 'w', 'wxq', '万秀区', '450400', 'wanxiuqu');
INSERT INTO `ot_region` VALUES ('450405', 3, '区县', 'z', 'zzq', '长洲区', '450400', 'zhangzhouqu');
INSERT INTO `ot_region` VALUES ('450406', 3, '区县', 'l', 'lwq', '龙圩区', '450400', 'longweiqu');
INSERT INTO `ot_region` VALUES ('450421', 3, '区县', 'c', 'cwx', '苍梧县', '450400', 'cangwuxian');
INSERT INTO `ot_region` VALUES ('450422', 3, '区县', 't', 'tx', '藤县', '450400', 'tengxian');
INSERT INTO `ot_region` VALUES ('450423', 3, '区县', 'm', 'msx', '蒙山县', '450400', 'mengshanxian');
INSERT INTO `ot_region` VALUES ('450481', 3, '区县', 'c', 'cxs', '岑溪市', '450400', 'cenxishi');
INSERT INTO `ot_region` VALUES ('450500', 2, '城市', 'b', 'bhs', '北海市', '450000', 'beihaishi');
INSERT INTO `ot_region` VALUES ('450502', 3, '区县', 'h', 'hcq', '海城区', '450500', 'haichengqu');
INSERT INTO `ot_region` VALUES ('450503', 3, '区县', 'y', 'yhq', '银海区', '450500', 'yinhaiqu');
INSERT INTO `ot_region` VALUES ('450512', 3, '区县', 't', 'tsgq', '铁山港区', '450500', 'tieshangangqu');
INSERT INTO `ot_region` VALUES ('450521', 3, '区县', 'h', 'hpx', '合浦县', '450500', 'hepuxian');
INSERT INTO `ot_region` VALUES ('450600', 2, '城市', 'f', 'fcgs', '防城港市', '450000', 'fangchenggangshi');
INSERT INTO `ot_region` VALUES ('450602', 3, '区县', 'g', 'gkq', '港口区', '450600', 'gangkouqu');
INSERT INTO `ot_region` VALUES ('450603', 3, '区县', 'f', 'fcq', '防城区', '450600', 'fangchengqu');
INSERT INTO `ot_region` VALUES ('450621', 3, '区县', 's', 'ssx', '上思县', '450600', 'shangsixian');
INSERT INTO `ot_region` VALUES ('450681', 3, '区县', 'd', 'dxs', '东兴市', '450600', 'dongxingshi');
INSERT INTO `ot_region` VALUES ('450700', 2, '城市', 'q', 'qzs', '钦州市', '450000', 'qinzhoushi');
INSERT INTO `ot_region` VALUES ('450702', 3, '区县', 'q', 'qnq', '钦南区', '450700', 'qinnanqu');
INSERT INTO `ot_region` VALUES ('450703', 3, '区县', 'q', 'qbq', '钦北区', '450700', 'qinbeiqu');
INSERT INTO `ot_region` VALUES ('450721', 3, '区县', 'l', 'lsx', '灵山县', '450700', 'lingshanxian');
INSERT INTO `ot_region` VALUES ('450722', 3, '区县', 'p', 'pbx', '浦北县', '450700', 'pubeixian');
INSERT INTO `ot_region` VALUES ('450800', 2, '城市', 'g', 'ggs', '贵港市', '450000', 'guigangshi');
INSERT INTO `ot_region` VALUES ('450802', 3, '区县', 'g', 'gbq', '港北区', '450800', 'gangbeiqu');
INSERT INTO `ot_region` VALUES ('450803', 3, '区县', 'g', 'gnq', '港南区', '450800', 'gangnanqu');
INSERT INTO `ot_region` VALUES ('450804', 3, '区县', 't', 'ttq', '覃塘区', '450800', 'tantangqu');
INSERT INTO `ot_region` VALUES ('450821', 3, '区县', 'p', 'pnx', '平南县', '450800', 'pingnanxian');
INSERT INTO `ot_region` VALUES ('450881', 3, '区县', 'g', 'gps', '桂平市', '450800', 'guipingshi');
INSERT INTO `ot_region` VALUES ('450900', 2, '城市', 'y', 'yls', '玉林市', '450000', 'yulinshi');
INSERT INTO `ot_region` VALUES ('450902', 3, '区县', 'y', 'yzq', '玉州区', '450900', 'yuzhouqu');
INSERT INTO `ot_region` VALUES ('450903', 3, '区县', 'f', 'fmq', '福绵区', '450900', 'fumianqu');
INSERT INTO `ot_region` VALUES ('450921', 3, '区县', 'r', 'rx', '容县', '450900', 'rongxian');
INSERT INTO `ot_region` VALUES ('450922', 3, '区县', 'l', 'lcx', '陆川县', '450900', 'luchuanxian');
INSERT INTO `ot_region` VALUES ('450923', 3, '区县', 'b', 'bbx', '博白县', '450900', 'bobaixian');
INSERT INTO `ot_region` VALUES ('450924', 3, '区县', 'x', 'xyx', '兴业县', '450900', 'xingyexian');
INSERT INTO `ot_region` VALUES ('450981', 3, '区县', 'b', 'bls', '北流市', '450900', 'beiliushi');
INSERT INTO `ot_region` VALUES ('451000', 2, '城市', 'b', 'bss', '百色市', '450000', 'baiseshi');
INSERT INTO `ot_region` VALUES ('451002', 3, '区县', 'y', 'yjq', '右江区', '451000', 'youjiangqu');
INSERT INTO `ot_region` VALUES ('451021', 3, '区县', 't', 'tyx', '田阳县', '451000', 'tianyangxian');
INSERT INTO `ot_region` VALUES ('451022', 3, '区县', 't', 'tdx', '田东县', '451000', 'tiandongxian');
INSERT INTO `ot_region` VALUES ('451023', 3, '区县', 'p', 'pgx', '平果县', '451000', 'pingguoxian');
INSERT INTO `ot_region` VALUES ('451024', 3, '区县', 'd', 'dbx', '德保县', '451000', 'debaoxian');
INSERT INTO `ot_region` VALUES ('451026', 3, '区县', 'n', 'npx', '那坡县', '451000', 'neipoxian');
INSERT INTO `ot_region` VALUES ('451027', 3, '区县', 'l', 'lyx', '凌云县', '451000', 'lingyunxian');
INSERT INTO `ot_region` VALUES ('451028', 3, '区县', 'l', 'lyx', '乐业县', '451000', 'leyexian');
INSERT INTO `ot_region` VALUES ('451029', 3, '区县', 't', 'tlx', '田林县', '451000', 'tianlinxian');
INSERT INTO `ot_region` VALUES ('451030', 3, '区县', 'x', 'xlx', '西林县', '451000', 'xilinxian');
INSERT INTO `ot_region` VALUES ('451031', 3, '区县', 'l', 'llgzzzx', '隆林各族自治县', '451000', 'longlingezuzizhixian');
INSERT INTO `ot_region` VALUES ('451081', 3, '区县', 'j', 'jxs', '靖西市', '451000', 'jingxishi');
INSERT INTO `ot_region` VALUES ('451100', 2, '城市', 'h', 'hzs', '贺州市', '450000', 'hezhoushi');
INSERT INTO `ot_region` VALUES ('451102', 3, '区县', 'b', 'bbq', '八步区', '451100', 'babuqu');
INSERT INTO `ot_region` VALUES ('451103', 3, '区县', 'p', 'pgq', '平桂区', '451100', 'pingguiqu');
INSERT INTO `ot_region` VALUES ('451121', 3, '区县', 'z', 'zpx', '昭平县', '451100', 'zhaopingxian');
INSERT INTO `ot_region` VALUES ('451122', 3, '区县', 'z', 'zsx', '钟山县', '451100', 'zhongshanxian');
INSERT INTO `ot_region` VALUES ('451123', 3, '区县', 'f', 'fcyzzzx', '富川瑶族自治县', '451100', 'fuchuanyaozuzizhixian');
INSERT INTO `ot_region` VALUES ('451200', 2, '城市', 'h', 'hcs', '河池市', '450000', 'hechishi');
INSERT INTO `ot_region` VALUES ('451202', 3, '区县', 'j', 'jcjq', '金城江区', '451200', 'jinchengjiangqu');
INSERT INTO `ot_region` VALUES ('451203', 3, '区县', 'y', 'yzq', '宜州区', '451200', 'yizhouqu');
INSERT INTO `ot_region` VALUES ('451221', 3, '区县', 'n', 'ndx', '南丹县', '451200', 'nandanxian');
INSERT INTO `ot_region` VALUES ('451222', 3, '区县', 't', 'tex', '天峨县', '451200', 'tianexian');
INSERT INTO `ot_region` VALUES ('451223', 3, '区县', 'f', 'fsx', '凤山县', '451200', 'fengshanxian');
INSERT INTO `ot_region` VALUES ('451224', 3, '区县', 'd', 'dlx', '东兰县', '451200', 'donglanxian');
INSERT INTO `ot_region` VALUES ('451225', 3, '区县', 'l', 'lcmlzzzx', '罗城仫佬族自治县', '451200', 'luochengmulaozuzizhixian');
INSERT INTO `ot_region` VALUES ('451226', 3, '区县', 'h', 'hjmnzzzx', '环江毛南族自治县', '451200', 'huanjiangmaonanzuzizhixian');
INSERT INTO `ot_region` VALUES ('451227', 3, '区县', 'b', 'bmyzzzx', '巴马瑶族自治县', '451200', 'bamayaozuzizhixian');
INSERT INTO `ot_region` VALUES ('451228', 3, '区县', 'd', 'dayzzzx', '都安瑶族自治县', '451200', 'douanyaozuzizhixian');
INSERT INTO `ot_region` VALUES ('451229', 3, '区县', 'd', 'dhyzzzx', '大化瑶族自治县', '451200', 'dahuayaozuzizhixian');
INSERT INTO `ot_region` VALUES ('451300', 2, '城市', 'l', 'lbs', '来宾市', '450000', 'laibinshi');
INSERT INTO `ot_region` VALUES ('451302', 3, '区县', 'x', 'xbq', '兴宾区', '451300', 'xingbinqu');
INSERT INTO `ot_region` VALUES ('451321', 3, '区县', 'x', 'xcx', '忻城县', '451300', 'xinchengxian');
INSERT INTO `ot_region` VALUES ('451322', 3, '区县', 'x', 'xzx', '象州县', '451300', 'xiangzhouxian');
INSERT INTO `ot_region` VALUES ('451323', 3, '区县', 'w', 'wxx', '武宣县', '451300', 'wuxuanxian');
INSERT INTO `ot_region` VALUES ('451324', 3, '区县', 'j', 'jxyzzzx', '金秀瑶族自治县', '451300', 'jinxiuyaozuzizhixian');
INSERT INTO `ot_region` VALUES ('451381', 3, '区县', 'h', 'hss', '合山市', '451300', 'heshanshi');
INSERT INTO `ot_region` VALUES ('451400', 2, '城市', 'c', 'czs', '崇左市', '450000', 'chongzuoshi');
INSERT INTO `ot_region` VALUES ('451402', 3, '区县', 'j', 'jzq', '江州区', '451400', 'jiangzhouqu');
INSERT INTO `ot_region` VALUES ('451421', 3, '区县', 'f', 'fsx', '扶绥县', '451400', 'fusuixian');
INSERT INTO `ot_region` VALUES ('451422', 3, '区县', 'n', 'nmx', '宁明县', '451400', 'ningmingxian');
INSERT INTO `ot_region` VALUES ('451423', 3, '区县', 'l', 'lzx', '龙州县', '451400', 'longzhouxian');
INSERT INTO `ot_region` VALUES ('451424', 3, '区县', 'd', 'dxx', '大新县', '451400', 'daxinxian');
INSERT INTO `ot_region` VALUES ('451425', 3, '区县', 't', 'tdx', '天等县', '451400', 'tiandengxian');
INSERT INTO `ot_region` VALUES ('451481', 3, '区县', 'p', 'pxs', '凭祥市', '451400', 'pingxiangshi');
INSERT INTO `ot_region` VALUES ('460100', 2, '城市', 'h', 'hks', '海口市', '460000', 'haikoushi');
INSERT INTO `ot_region` VALUES ('460105', 3, '区县', 'x', 'xyq', '秀英区', '460100', 'xiuyingqu');
INSERT INTO `ot_region` VALUES ('460106', 3, '区县', 'l', 'lhq', '龙华区', '460100', 'longhuaqu');
INSERT INTO `ot_region` VALUES ('460107', 3, '区县', 'q', 'qsq', '琼山区', '460100', 'qiongshanqu');
INSERT INTO `ot_region` VALUES ('460108', 3, '区县', 'm', 'mlq', '美兰区', '460100', 'meilanqu');
INSERT INTO `ot_region` VALUES ('460200', 2, '城市', 's', 'sys', '三亚市', '460000', 'sanyashi');
INSERT INTO `ot_region` VALUES ('460202', 3, '区县', 'h', 'htq', '海棠区', '460200', 'haitangqu');
INSERT INTO `ot_region` VALUES ('460203', 3, '区县', 'j', 'jyq', '吉阳区', '460200', 'jiyangqu');
INSERT INTO `ot_region` VALUES ('460204', 3, '区县', 't', 'tyq', '天涯区', '460200', 'tianyaqu');
INSERT INTO `ot_region` VALUES ('460205', 3, '区县', 'y', 'yzq', '崖州区', '460200', 'yazhouqu');
INSERT INTO `ot_region` VALUES ('460300', 2, '城市', 's', 'sss', '三沙市', '460000', 'sanshashi');
INSERT INTO `ot_region` VALUES ('460321', 3, '区县', 'x', 'xsqd', '西沙群岛', '460300', 'xishaqundao');
INSERT INTO `ot_region` VALUES ('460322', 3, '区县', 'n', 'nsqd', '南沙群岛', '460300', 'nanshaqundao');
INSERT INTO `ot_region` VALUES ('460323', 3, '区县', 'z', 'zsqdddjjqhy', '中沙群岛的岛礁及其海域', '460300', 'zhongshaqundaodedaojiaojiqihaiyu');
INSERT INTO `ot_region` VALUES ('460400', 2, '城市', 'd', 'dzs', '儋州市', '460000', 'danzhoushi');
INSERT INTO `ot_region` VALUES ('460401', 3, '区县', 'n', 'ndz', '那大镇', '460400', 'neidazhen');
INSERT INTO `ot_region` VALUES ('460402', 3, '区县', 'h', 'hqz', '和庆镇', '460400', 'heqingzhen');
INSERT INTO `ot_region` VALUES ('460403', 3, '区县', 'n', 'nfz', '南丰镇', '460400', 'nanfengzhen');
INSERT INTO `ot_region` VALUES ('460404', 3, '区县', 'd', 'dcz', '大成镇', '460400', 'dachengzhen');
INSERT INTO `ot_region` VALUES ('460405', 3, '区县', 'y', 'yxz', '雅星镇', '460400', 'yaxingzhen');
INSERT INTO `ot_region` VALUES ('460406', 3, '区县', 'l', 'lyz', '兰洋镇', '460400', 'lanyangzhen');
INSERT INTO `ot_region` VALUES ('460407', 3, '区县', 'g', 'gcz', '光村镇', '460400', 'guangcunzhen');
INSERT INTO `ot_region` VALUES ('460408', 3, '区县', 'm', 'mtz', '木棠镇', '460400', 'mutangzhen');
INSERT INTO `ot_region` VALUES ('460409', 3, '区县', 'h', 'htz', '海头镇', '460400', 'haitouzhen');
INSERT INTO `ot_region` VALUES ('460410', 3, '区县', 'e', 'emz', '峨蔓镇', '460400', 'emanzhen');
INSERT INTO `ot_region` VALUES ('460411', 3, '区县', 'w', 'wwz', '王五镇', '460400', 'wangwuzhen');
INSERT INTO `ot_region` VALUES ('460412', 3, '区县', 'b', 'bmjz', '白马井镇', '460400', 'baimajingzhen');
INSERT INTO `ot_region` VALUES ('460413', 3, '区县', 'z', 'zhz', '中和镇', '460400', 'zhonghezhen');
INSERT INTO `ot_region` VALUES ('460414', 3, '区县', 'p', 'ppz', '排浦镇', '460400', 'paipuzhen');
INSERT INTO `ot_region` VALUES ('460415', 3, '区县', 'd', 'dcz', '东成镇', '460400', 'dongchengzhen');
INSERT INTO `ot_region` VALUES ('460416', 3, '区县', 'x', 'xzz', '新州镇', '460400', 'xinzhouzhen');
INSERT INTO `ot_region` VALUES ('460417', 3, '区县', 'y', 'ypjjkfq', '洋浦经济开发区', '460400', 'yangpujingjikaifaqu');
INSERT INTO `ot_region` VALUES ('460418', 3, '区县', 'h', 'hnrzxy', '华南热作学院', '460400', 'huananrezuoxueyuan');
INSERT INTO `ot_region` VALUES ('469000', 2, '城市', 's', 'szxx', '省直辖县', '460000', 'shengzhixiaxian');
INSERT INTO `ot_region` VALUES ('469001', 3, '区县', 'w', 'wzss', '五指山市', '469000', 'wuzhishanshi');
INSERT INTO `ot_region` VALUES ('469002', 3, '区县', 'q', 'qhs', '琼海市', '469000', 'qionghaishi');
INSERT INTO `ot_region` VALUES ('469005', 3, '区县', 'w', 'wcs', '文昌市', '469000', 'wenchangshi');
INSERT INTO `ot_region` VALUES ('469006', 3, '区县', 'w', 'wns', '万宁市', '469000', 'wanningshi');
INSERT INTO `ot_region` VALUES ('469007', 3, '区县', 'd', 'dfs', '东方市', '469000', 'dongfangshi');
INSERT INTO `ot_region` VALUES ('469021', 3, '区县', 'd', 'dax', '定安县', '469000', 'dinganxian');
INSERT INTO `ot_region` VALUES ('469022', 3, '区县', 't', 'tcx', '屯昌县', '469000', 'tunchangxian');
INSERT INTO `ot_region` VALUES ('469023', 3, '区县', 'c', 'cmx', '澄迈县', '469000', 'chengmaixian');
INSERT INTO `ot_region` VALUES ('469024', 3, '区县', 'l', 'lgx', '临高县', '469000', 'lingaoxian');
INSERT INTO `ot_region` VALUES ('469025', 3, '区县', 'b', 'bslzzzx', '白沙黎族自治县', '469000', 'baishalizuzizhixian');
INSERT INTO `ot_region` VALUES ('469026', 3, '区县', 'c', 'cjlzzzx', '昌江黎族自治县', '469000', 'changjianglizuzizhixian');
INSERT INTO `ot_region` VALUES ('469027', 3, '区县', 'l', 'ldlzzzx', '乐东黎族自治县', '469000', 'ledonglizuzizhixian');
INSERT INTO `ot_region` VALUES ('469028', 3, '区县', 'l', 'lslzzzx', '陵水黎族自治县', '469000', 'lingshuilizuzizhixian');
INSERT INTO `ot_region` VALUES ('469029', 3, '区县', 'b', 'btlzmzzzx', '保亭黎族苗族自治县', '469000', 'baotinglizumiaozuzizhixian');
INSERT INTO `ot_region` VALUES ('469030', 3, '区县', 'q', 'qzlzmzzzx', '琼中黎族苗族自治县', '469000', 'qiongzhonglizumiaozuzizhixian');
INSERT INTO `ot_region` VALUES ('500100', 2, '城市', 'z', 'zqs', '重庆市', '500000', 'zhongqingshi');
INSERT INTO `ot_region` VALUES ('500101', 3, '区县', 'w', 'wzq', '万州区', '500100', 'wanzhouqu');
INSERT INTO `ot_region` VALUES ('500102', 3, '区县', 'f', 'flq', '涪陵区', '500100', 'fulingqu');
INSERT INTO `ot_region` VALUES ('500103', 3, '区县', 'y', 'yzq', '渝中区', '500100', 'yuzhongqu');
INSERT INTO `ot_region` VALUES ('500104', 3, '区县', 'd', 'ddkq', '大渡口区', '500100', 'dadukouqu');
INSERT INTO `ot_region` VALUES ('500105', 3, '区县', 'j', 'jbq', '江北区', '500100', 'jiangbeiqu');
INSERT INTO `ot_region` VALUES ('500106', 3, '区县', 's', 'spbq', '沙坪坝区', '500100', 'shapingbaqu');
INSERT INTO `ot_region` VALUES ('500107', 3, '区县', 'j', 'jlpq', '九龙坡区', '500100', 'jiulongpoqu');
INSERT INTO `ot_region` VALUES ('500108', 3, '区县', 'n', 'naq', '南岸区', '500100', 'nananqu');
INSERT INTO `ot_region` VALUES ('500109', 3, '区县', 'b', 'bbq', '北碚区', '500100', 'beibeiqu');
INSERT INTO `ot_region` VALUES ('500110', 3, '区县', 'q', 'qjq', '綦江区', '500100', 'qijiangqu');
INSERT INTO `ot_region` VALUES ('500111', 3, '区县', 'd', 'dzq', '大足区', '500100', 'dazuqu');
INSERT INTO `ot_region` VALUES ('500112', 3, '区县', 'y', 'ybq', '渝北区', '500100', 'yubeiqu');
INSERT INTO `ot_region` VALUES ('500113', 3, '区县', 'b', 'bnq', '巴南区', '500100', 'bananqu');
INSERT INTO `ot_region` VALUES ('500114', 3, '区县', 'q', 'qjq', '黔江区', '500100', 'qianjiangqu');
INSERT INTO `ot_region` VALUES ('500115', 3, '区县', 'z', 'zsq', '长寿区', '500100', 'zhangshouqu');
INSERT INTO `ot_region` VALUES ('500116', 3, '区县', 'j', 'jjq', '江津区', '500100', 'jiangjinqu');
INSERT INTO `ot_region` VALUES ('500117', 3, '区县', 'h', 'hcq', '合川区', '500100', 'hechuanqu');
INSERT INTO `ot_region` VALUES ('500118', 3, '区县', 'y', 'ycq', '永川区', '500100', 'yongchuanqu');
INSERT INTO `ot_region` VALUES ('500119', 3, '区县', 'n', 'ncq', '南川区', '500100', 'nanchuanqu');
INSERT INTO `ot_region` VALUES ('500120', 3, '区县', 'b', 'bsq', '璧山区', '500100', 'bishanqu');
INSERT INTO `ot_region` VALUES ('500151', 3, '区县', 't', 'tlq', '铜梁区', '500100', 'tongliangqu');
INSERT INTO `ot_region` VALUES ('500152', 3, '区县', 't', 'tnq', '潼南区', '500100', 'tongnanqu');
INSERT INTO `ot_region` VALUES ('500153', 3, '区县', 'r', 'rcq', '荣昌区', '500100', 'rongchangqu');
INSERT INTO `ot_region` VALUES ('500154', 3, '区县', 'k', 'kzq', '开州区', '500100', 'kaizhouqu');
INSERT INTO `ot_region` VALUES ('500155', 3, '区县', 'l', 'lpq', '梁平区', '500100', 'liangpingqu');
INSERT INTO `ot_region` VALUES ('500156', 3, '区县', 'w', 'wlq', '武隆区', '500100', 'wulongqu');
INSERT INTO `ot_region` VALUES ('500200', 2, '城市', 'x', 'x', '县', '500000', 'xian');
INSERT INTO `ot_region` VALUES ('500229', 3, '区县', 'c', 'ckx', '城口县', '500200', 'chengkouxian');
INSERT INTO `ot_region` VALUES ('500230', 3, '区县', 'f', 'fdx', '丰都县', '500200', 'fengdouxian');
INSERT INTO `ot_region` VALUES ('500231', 3, '区县', 'd', 'djx', '垫江县', '500200', 'dianjiangxian');
INSERT INTO `ot_region` VALUES ('500233', 3, '区县', 'z', 'zx', '忠县', '500200', 'zhongxian');
INSERT INTO `ot_region` VALUES ('500235', 3, '区县', 'y', 'yyx', '云阳县', '500200', 'yunyangxian');
INSERT INTO `ot_region` VALUES ('500236', 3, '区县', 'f', 'fjx', '奉节县', '500200', 'fengjiexian');
INSERT INTO `ot_region` VALUES ('500237', 3, '区县', 'w', 'wsx', '巫山县', '500200', 'wushanxian');
INSERT INTO `ot_region` VALUES ('500238', 3, '区县', 'w', 'wxx', '巫溪县', '500200', 'wuxixian');
INSERT INTO `ot_region` VALUES ('500240', 3, '区县', 's', 'sztjzzzx', '石柱土家族自治县', '500200', 'shizhutujiazuzizhixian');
INSERT INTO `ot_region` VALUES ('500241', 3, '区县', 'x', 'xstjzmzzzx', '秀山土家族苗族自治县', '500200', 'xiushantujiazumiaozuzizhixian');
INSERT INTO `ot_region` VALUES ('500242', 3, '区县', 'y', 'yytjzmzzzx', '酉阳土家族苗族自治县', '500200', 'youyangtujiazumiaozuzizhixian');
INSERT INTO `ot_region` VALUES ('500243', 3, '区县', 'p', 'psmztjzzzx', '彭水苗族土家族自治县', '500200', 'pengshuimiaozutujiazuzizhixian');
INSERT INTO `ot_region` VALUES ('510100', 2, '城市', 'c', 'cds', '成都市', '510000', 'chengdoushi');
INSERT INTO `ot_region` VALUES ('510104', 3, '区县', 'j', 'jjq', '锦江区', '510100', 'jinjiangqu');
INSERT INTO `ot_region` VALUES ('510105', 3, '区县', 'q', 'qyq', '青羊区', '510100', 'qingyangqu');
INSERT INTO `ot_region` VALUES ('510106', 3, '区县', 'j', 'jnq', '金牛区', '510100', 'jinniuqu');
INSERT INTO `ot_region` VALUES ('510107', 3, '区县', 'w', 'whq', '武侯区', '510100', 'wuhouqu');
INSERT INTO `ot_region` VALUES ('510108', 3, '区县', 'c', 'chq', '成华区', '510100', 'chenghuaqu');
INSERT INTO `ot_region` VALUES ('510112', 3, '区县', 'l', 'lqyq', '龙泉驿区', '510100', 'longquanyiqu');
INSERT INTO `ot_region` VALUES ('510113', 3, '区县', 'q', 'qbjq', '青白江区', '510100', 'qingbaijiangqu');
INSERT INTO `ot_region` VALUES ('510114', 3, '区县', 'x', 'xdq', '新都区', '510100', 'xindouqu');
INSERT INTO `ot_region` VALUES ('510115', 3, '区县', 'w', 'wjq', '温江区', '510100', 'wenjiangqu');
INSERT INTO `ot_region` VALUES ('510116', 3, '区县', 's', 'slq', '双流区', '510100', 'shuangliuqu');
INSERT INTO `ot_region` VALUES ('510117', 3, '区县', 'p', 'pdq', '郫都区', '510100', 'pidouqu');
INSERT INTO `ot_region` VALUES ('510121', 3, '区县', 'j', 'jtx', '金堂县', '510100', 'jintangxian');
INSERT INTO `ot_region` VALUES ('510129', 3, '区县', 'd', 'dyx', '大邑县', '510100', 'dayixian');
INSERT INTO `ot_region` VALUES ('510131', 3, '区县', 'p', 'pjx', '蒲江县', '510100', 'pujiangxian');
INSERT INTO `ot_region` VALUES ('510132', 3, '区县', 'x', 'xjx', '新津县', '510100', 'xinjinxian');
INSERT INTO `ot_region` VALUES ('510181', 3, '区县', 'd', 'djys', '都江堰市', '510100', 'doujiangyanshi');
INSERT INTO `ot_region` VALUES ('510182', 3, '区县', 'p', 'pzs', '彭州市', '510100', 'pengzhoushi');
INSERT INTO `ot_region` VALUES ('510183', 3, '区县', 'q', 'qls', '邛崃市', '510100', 'qionglaishi');
INSERT INTO `ot_region` VALUES ('510184', 3, '区县', 'c', 'czs', '崇州市', '510100', 'chongzhoushi');
INSERT INTO `ot_region` VALUES ('510185', 3, '区县', 'j', 'jys', '简阳市', '510100', 'jianyangshi');
INSERT INTO `ot_region` VALUES ('510191', 3, '区县', 'g', 'gxq', '高新区', '510100', 'gaoxinqu');
INSERT INTO `ot_region` VALUES ('510300', 2, '城市', 'z', 'zgs', '自贡市', '510000', 'zigongshi');
INSERT INTO `ot_region` VALUES ('510302', 3, '区县', 'z', 'zljq', '自流井区', '510300', 'ziliujingqu');
INSERT INTO `ot_region` VALUES ('510303', 3, '区县', 'g', 'gjq', '贡井区', '510300', 'gongjingqu');
INSERT INTO `ot_region` VALUES ('510304', 3, '区县', 'd', 'daq', '大安区', '510300', 'daanqu');
INSERT INTO `ot_region` VALUES ('510311', 3, '区县', 'y', 'ytq', '沿滩区', '510300', 'yantanqu');
INSERT INTO `ot_region` VALUES ('510321', 3, '区县', 'r', 'rx', '荣县', '510300', 'rongxian');
INSERT INTO `ot_region` VALUES ('510322', 3, '区县', 'f', 'fsx', '富顺县', '510300', 'fushunxian');
INSERT INTO `ot_region` VALUES ('510400', 2, '城市', 'p', 'pzhs', '攀枝花市', '510000', 'panzhihuashi');
INSERT INTO `ot_region` VALUES ('510402', 3, '区县', 'd', 'dq', '东区', '510400', 'dongqu');
INSERT INTO `ot_region` VALUES ('510403', 3, '区县', 'x', 'xq', '西区', '510400', 'xiqu');
INSERT INTO `ot_region` VALUES ('510411', 3, '区县', 'r', 'rhq', '仁和区', '510400', 'renhequ');
INSERT INTO `ot_region` VALUES ('510421', 3, '区县', 'm', 'myx', '米易县', '510400', 'miyixian');
INSERT INTO `ot_region` VALUES ('510422', 3, '区县', 'y', 'ybx', '盐边县', '510400', 'yanbianxian');
INSERT INTO `ot_region` VALUES ('510500', 2, '城市', 'l', 'lzs', '泸州市', '510000', 'luzhoushi');
INSERT INTO `ot_region` VALUES ('510502', 3, '区县', 'j', 'jyq', '江阳区', '510500', 'jiangyangqu');
INSERT INTO `ot_region` VALUES ('510503', 3, '区县', 'n', 'nxq', '纳溪区', '510500', 'naxiqu');
INSERT INTO `ot_region` VALUES ('510504', 3, '区县', 'l', 'lmtq', '龙马潭区', '510500', 'longmatanqu');
INSERT INTO `ot_region` VALUES ('510521', 3, '区县', 'l', 'lx', '泸县', '510500', 'luxian');
INSERT INTO `ot_region` VALUES ('510522', 3, '区县', 'h', 'hjx', '合江县', '510500', 'hejiangxian');
INSERT INTO `ot_region` VALUES ('510524', 3, '区县', 'x', 'xyx', '叙永县', '510500', 'xuyongxian');
INSERT INTO `ot_region` VALUES ('510525', 3, '区县', 'g', 'glx', '古蔺县', '510500', 'gulinxian');
INSERT INTO `ot_region` VALUES ('510600', 2, '城市', 'd', 'dys', '德阳市', '510000', 'deyangshi');
INSERT INTO `ot_region` VALUES ('510603', 3, '区县', 'j', 'jyq', '旌阳区', '510600', 'jingyangqu');
INSERT INTO `ot_region` VALUES ('510604', 3, '区县', 'l', 'ljq', '罗江区', '510600', 'luojiangqu');
INSERT INTO `ot_region` VALUES ('510623', 3, '区县', 'z', 'zjx', '中江县', '510600', 'zhongjiangxian');
INSERT INTO `ot_region` VALUES ('510681', 3, '区县', 'g', 'ghs', '广汉市', '510600', 'guanghanshi');
INSERT INTO `ot_region` VALUES ('510682', 3, '区县', 's', 'sfs', '什邡市', '510600', 'shenfangshi');
INSERT INTO `ot_region` VALUES ('510683', 3, '区县', 'm', 'mzs', '绵竹市', '510600', 'mianzhushi');
INSERT INTO `ot_region` VALUES ('510700', 2, '城市', 'm', 'mys', '绵阳市', '510000', 'mianyangshi');
INSERT INTO `ot_region` VALUES ('510703', 3, '区县', 'f', 'fcq', '涪城区', '510700', 'fuchengqu');
INSERT INTO `ot_region` VALUES ('510704', 3, '区县', 'y', 'yxq', '游仙区', '510700', 'youxianqu');
INSERT INTO `ot_region` VALUES ('510705', 3, '区县', 'a', 'azq', '安州区', '510700', 'anzhouqu');
INSERT INTO `ot_region` VALUES ('510722', 3, '区县', 's', 'stx', '三台县', '510700', 'santaixian');
INSERT INTO `ot_region` VALUES ('510723', 3, '区县', 'y', 'ytx', '盐亭县', '510700', 'yantingxian');
INSERT INTO `ot_region` VALUES ('510725', 3, '区县', 'z', 'ztx', '梓潼县', '510700', 'zitongxian');
INSERT INTO `ot_region` VALUES ('510726', 3, '区县', 'b', 'bcqzzzx', '北川羌族自治县', '510700', 'beichuanqiangzuzizhixian');
INSERT INTO `ot_region` VALUES ('510727', 3, '区县', 'p', 'pwx', '平武县', '510700', 'pingwuxian');
INSERT INTO `ot_region` VALUES ('510781', 3, '区县', 'j', 'jys', '江油市', '510700', 'jiangyoushi');
INSERT INTO `ot_region` VALUES ('510791', 3, '区县', 'g', 'gxq', '高新区', '510700', 'gaoxinqu');
INSERT INTO `ot_region` VALUES ('510800', 2, '城市', 'g', 'gys', '广元市', '510000', 'guangyuanshi');
INSERT INTO `ot_region` VALUES ('510802', 3, '区县', 'l', 'lzq', '利州区', '510800', 'lizhouqu');
INSERT INTO `ot_region` VALUES ('510811', 3, '区县', 'z', 'zhq', '昭化区', '510800', 'zhaohuaqu');
INSERT INTO `ot_region` VALUES ('510812', 3, '区县', 'c', 'ctq', '朝天区', '510800', 'chaotianqu');
INSERT INTO `ot_region` VALUES ('510821', 3, '区县', 'w', 'wcx', '旺苍县', '510800', 'wangcangxian');
INSERT INTO `ot_region` VALUES ('510822', 3, '区县', 'q', 'qcx', '青川县', '510800', 'qingchuanxian');
INSERT INTO `ot_region` VALUES ('510823', 3, '区县', 'j', 'jgx', '剑阁县', '510800', 'jiangexian');
INSERT INTO `ot_region` VALUES ('510824', 3, '区县', 'c', 'cxx', '苍溪县', '510800', 'cangxixian');
INSERT INTO `ot_region` VALUES ('510900', 2, '城市', 's', 'sns', '遂宁市', '510000', 'suiningshi');
INSERT INTO `ot_region` VALUES ('510903', 3, '区县', 'c', 'csq', '船山区', '510900', 'chuanshanqu');
INSERT INTO `ot_region` VALUES ('510904', 3, '区县', 'a', 'ajq', '安居区', '510900', 'anjuqu');
INSERT INTO `ot_region` VALUES ('510921', 3, '区县', 'p', 'pxx', '蓬溪县', '510900', 'pengxixian');
INSERT INTO `ot_region` VALUES ('510922', 3, '区县', 's', 'shx', '射洪县', '510900', 'shehongxian');
INSERT INTO `ot_region` VALUES ('510923', 3, '区县', 'd', 'dyx', '大英县', '510900', 'dayingxian');
INSERT INTO `ot_region` VALUES ('511000', 2, '城市', 'n', 'njs', '内江市', '510000', 'neijiangshi');
INSERT INTO `ot_region` VALUES ('511002', 3, '区县', 's', 'szq', '市中区', '511000', 'shizhongqu');
INSERT INTO `ot_region` VALUES ('511011', 3, '区县', 'd', 'dxq', '东兴区', '511000', 'dongxingqu');
INSERT INTO `ot_region` VALUES ('511024', 3, '区县', 'w', 'wyx', '威远县', '511000', 'weiyuanxian');
INSERT INTO `ot_region` VALUES ('511025', 3, '区县', 'z', 'zzx', '资中县', '511000', 'zizhongxian');
INSERT INTO `ot_region` VALUES ('511083', 3, '区县', 'l', 'lcs', '隆昌市', '511000', 'longchangshi');
INSERT INTO `ot_region` VALUES ('511100', 2, '城市', 'l', 'lss', '乐山市', '510000', 'leshanshi');
INSERT INTO `ot_region` VALUES ('511102', 3, '区县', 's', 'szq', '市中区', '511100', 'shizhongqu');
INSERT INTO `ot_region` VALUES ('511111', 3, '区县', 's', 'swq', '沙湾区', '511100', 'shawanqu');
INSERT INTO `ot_region` VALUES ('511112', 3, '区县', 'w', 'wtqq', '五通桥区', '511100', 'wutongqiaoqu');
INSERT INTO `ot_region` VALUES ('511113', 3, '区县', 'j', 'jkhq', '金口河区', '511100', 'jinkouhequ');
INSERT INTO `ot_region` VALUES ('511123', 3, '区县', 'j', 'jwx', '犍为县', '511100', 'jianweixian');
INSERT INTO `ot_region` VALUES ('511124', 3, '区县', 'j', 'jyx', '井研县', '511100', 'jingyanxian');
INSERT INTO `ot_region` VALUES ('511126', 3, '区县', 'j', 'jjx', '夹江县', '511100', 'jiajiangxian');
INSERT INTO `ot_region` VALUES ('511129', 3, '区县', 'm', 'mcx', '沐川县', '511100', 'muchuanxian');
INSERT INTO `ot_region` VALUES ('511132', 3, '区县', 'e', 'ebyzzzx', '峨边彝族自治县', '511100', 'ebianyizuzizhixian');
INSERT INTO `ot_region` VALUES ('511133', 3, '区县', 'm', 'mbyzzzx', '马边彝族自治县', '511100', 'mabianyizuzizhixian');
INSERT INTO `ot_region` VALUES ('511181', 3, '区县', 'e', 'emss', '峨眉山市', '511100', 'emeishanshi');
INSERT INTO `ot_region` VALUES ('511300', 2, '城市', 'n', 'ncs', '南充市', '510000', 'nanchongshi');
INSERT INTO `ot_region` VALUES ('511302', 3, '区县', 's', 'sqq', '顺庆区', '511300', 'shunqingqu');
INSERT INTO `ot_region` VALUES ('511303', 3, '区县', 'g', 'gpq', '高坪区', '511300', 'gaopingqu');
INSERT INTO `ot_region` VALUES ('511304', 3, '区县', 'j', 'jlq', '嘉陵区', '511300', 'jialingqu');
INSERT INTO `ot_region` VALUES ('511321', 3, '区县', 'n', 'nbx', '南部县', '511300', 'nanbuxian');
INSERT INTO `ot_region` VALUES ('511322', 3, '区县', 'y', 'ysx', '营山县', '511300', 'yingshanxian');
INSERT INTO `ot_region` VALUES ('511323', 3, '区县', 'p', 'pax', '蓬安县', '511300', 'penganxian');
INSERT INTO `ot_region` VALUES ('511324', 3, '区县', 'y', 'ylx', '仪陇县', '511300', 'yilongxian');
INSERT INTO `ot_region` VALUES ('511325', 3, '区县', 'x', 'xcx', '西充县', '511300', 'xichongxian');
INSERT INTO `ot_region` VALUES ('511381', 3, '区县', 'l', 'lzs', '阆中市', '511300', 'langzhongshi');
INSERT INTO `ot_region` VALUES ('511400', 2, '城市', 'm', 'mss', '眉山市', '510000', 'meishanshi');
INSERT INTO `ot_region` VALUES ('511402', 3, '区县', 'd', 'dpq', '东坡区', '511400', 'dongpoqu');
INSERT INTO `ot_region` VALUES ('511403', 3, '区县', 'p', 'psq', '彭山区', '511400', 'pengshanqu');
INSERT INTO `ot_region` VALUES ('511421', 3, '区县', 'r', 'rsx', '仁寿县', '511400', 'renshouxian');
INSERT INTO `ot_region` VALUES ('511423', 3, '区县', 'h', 'hyx', '洪雅县', '511400', 'hongyaxian');
INSERT INTO `ot_region` VALUES ('511424', 3, '区县', 'd', 'dlx', '丹棱县', '511400', 'danlengxian');
INSERT INTO `ot_region` VALUES ('511425', 3, '区县', 'q', 'qsx', '青神县', '511400', 'qingshenxian');
INSERT INTO `ot_region` VALUES ('511500', 2, '城市', 'y', 'ybs', '宜宾市', '510000', 'yibinshi');
INSERT INTO `ot_region` VALUES ('511502', 3, '区县', 'c', 'cpq', '翠屏区', '511500', 'cuipingqu');
INSERT INTO `ot_region` VALUES ('511503', 3, '区县', 'n', 'nxq', '南溪区', '511500', 'nanxiqu');
INSERT INTO `ot_region` VALUES ('511504', 3, '区县', 'x', 'xzq', '叙州区', '511500', 'xuzhouqu');
INSERT INTO `ot_region` VALUES ('511523', 3, '区县', 'j', 'jax', '江安县', '511500', 'jianganxian');
INSERT INTO `ot_region` VALUES ('511524', 3, '区县', 'z', 'znx', '长宁县', '511500', 'zhangningxian');
INSERT INTO `ot_region` VALUES ('511525', 3, '区县', 'g', 'gx', '高县', '511500', 'gaoxian');
INSERT INTO `ot_region` VALUES ('511526', 3, '区县', 'g', 'gx', '珙县', '511500', 'gongxian');
INSERT INTO `ot_region` VALUES ('511527', 3, '区县', 'y', 'ylx', '筠连县', '511500', 'yunlianxian');
INSERT INTO `ot_region` VALUES ('511528', 3, '区县', 'x', 'xwx', '兴文县', '511500', 'xingwenxian');
INSERT INTO `ot_region` VALUES ('511529', 3, '区县', 'p', 'psx', '屏山县', '511500', 'pingshanxian');
INSERT INTO `ot_region` VALUES ('511600', 2, '城市', 'g', 'gas', '广安市', '510000', 'guanganshi');
INSERT INTO `ot_region` VALUES ('511602', 3, '区县', 'g', 'gaq', '广安区', '511600', 'guanganqu');
INSERT INTO `ot_region` VALUES ('511603', 3, '区县', 'q', 'qfq', '前锋区', '511600', 'qianfengqu');
INSERT INTO `ot_region` VALUES ('511621', 3, '区县', 'y', 'ycx', '岳池县', '511600', 'yuechixian');
INSERT INTO `ot_region` VALUES ('511622', 3, '区县', 'w', 'wsx', '武胜县', '511600', 'wushengxian');
INSERT INTO `ot_region` VALUES ('511623', 3, '区县', 'l', 'lsx', '邻水县', '511600', 'linshuixian');
INSERT INTO `ot_region` VALUES ('511681', 3, '区县', 'h', 'hys', '华蓥市', '511600', 'huayingshi');
INSERT INTO `ot_region` VALUES ('511700', 2, '城市', 'd', 'dzs', '达州市', '510000', 'dazhoushi');
INSERT INTO `ot_region` VALUES ('511702', 3, '区县', 't', 'tcq', '通川区', '511700', 'tongchuanqu');
INSERT INTO `ot_region` VALUES ('511703', 3, '区县', 'd', 'dcq', '达川区', '511700', 'dachuanqu');
INSERT INTO `ot_region` VALUES ('511722', 3, '区县', 'x', 'xhx', '宣汉县', '511700', 'xuanhanxian');
INSERT INTO `ot_region` VALUES ('511723', 3, '区县', 'k', 'kjx', '开江县', '511700', 'kaijiangxian');
INSERT INTO `ot_region` VALUES ('511724', 3, '区县', 'd', 'dzx', '大竹县', '511700', 'dazhuxian');
INSERT INTO `ot_region` VALUES ('511725', 3, '区县', 'q', 'qx', '渠县', '511700', 'quxian');
INSERT INTO `ot_region` VALUES ('511781', 3, '区县', 'w', 'wys', '万源市', '511700', 'wanyuanshi');
INSERT INTO `ot_region` VALUES ('511800', 2, '城市', 'y', 'yas', '雅安市', '510000', 'yaanshi');
INSERT INTO `ot_region` VALUES ('511802', 3, '区县', 'y', 'ycq', '雨城区', '511800', 'yuchengqu');
INSERT INTO `ot_region` VALUES ('511803', 3, '区县', 'm', 'msq', '名山区', '511800', 'mingshanqu');
INSERT INTO `ot_region` VALUES ('511822', 3, '区县', 'y', 'yjx', '荥经县', '511800', 'yingjingxian');
INSERT INTO `ot_region` VALUES ('511823', 3, '区县', 'h', 'hyx', '汉源县', '511800', 'hanyuanxian');
INSERT INTO `ot_region` VALUES ('511824', 3, '区县', 's', 'smx', '石棉县', '511800', 'shimianxian');
INSERT INTO `ot_region` VALUES ('511825', 3, '区县', 't', 'tqx', '天全县', '511800', 'tianquanxian');
INSERT INTO `ot_region` VALUES ('511826', 3, '区县', 'l', 'lsx', '芦山县', '511800', 'lushanxian');
INSERT INTO `ot_region` VALUES ('511827', 3, '区县', 'b', 'bxx', '宝兴县', '511800', 'baoxingxian');
INSERT INTO `ot_region` VALUES ('511900', 2, '城市', 'b', 'bzs', '巴中市', '510000', 'bazhongshi');
INSERT INTO `ot_region` VALUES ('511902', 3, '区县', 'b', 'bzq', '巴州区', '511900', 'bazhouqu');
INSERT INTO `ot_region` VALUES ('511903', 3, '区县', 'e', 'eyq', '恩阳区', '511900', 'enyangqu');
INSERT INTO `ot_region` VALUES ('511921', 3, '区县', 't', 'tjx', '通江县', '511900', 'tongjiangxian');
INSERT INTO `ot_region` VALUES ('511922', 3, '区县', 'n', 'njx', '南江县', '511900', 'nanjiangxian');
INSERT INTO `ot_region` VALUES ('511923', 3, '区县', 'p', 'pcx', '平昌县', '511900', 'pingchangxian');
INSERT INTO `ot_region` VALUES ('512000', 2, '城市', 'z', 'zys', '资阳市', '510000', 'ziyangshi');
INSERT INTO `ot_region` VALUES ('512002', 3, '区县', 'y', 'yjq', '雁江区', '512000', 'yanjiangqu');
INSERT INTO `ot_region` VALUES ('512021', 3, '区县', 'a', 'ayx', '安岳县', '512000', 'anyuexian');
INSERT INTO `ot_region` VALUES ('512022', 3, '区县', 'l', 'lzx', '乐至县', '512000', 'lezhixian');
INSERT INTO `ot_region` VALUES ('513200', 2, '城市', 'a', 'abzzqzzzz', '阿坝藏族羌族自治州', '510000', 'abazangzuqiangzuzizhizhou');
INSERT INTO `ot_region` VALUES ('513201', 3, '区县', 'm', 'meks', '马尔康市', '513200', 'maerkangshi');
INSERT INTO `ot_region` VALUES ('513221', 3, '区县', 'w', 'wcx', '汶川县', '513200', 'wenchuanxian');
INSERT INTO `ot_region` VALUES ('513222', 3, '区县', 'l', 'lx', '理县', '513200', 'lixian');
INSERT INTO `ot_region` VALUES ('513223', 3, '区县', 'm', 'mx', '茂县', '513200', 'maoxian');
INSERT INTO `ot_region` VALUES ('513224', 3, '区县', 's', 'spx', '松潘县', '513200', 'songpanxian');
INSERT INTO `ot_region` VALUES ('513225', 3, '区县', 'j', 'jzgx', '九寨沟县', '513200', 'jiuzhaigouxian');
INSERT INTO `ot_region` VALUES ('513226', 3, '区县', 'j', 'jcx', '金川县', '513200', 'jinchuanxian');
INSERT INTO `ot_region` VALUES ('513227', 3, '区县', 'x', 'xjx', '小金县', '513200', 'xiaojinxian');
INSERT INTO `ot_region` VALUES ('513228', 3, '区县', 'h', 'hsx', '黑水县', '513200', 'heishuixian');
INSERT INTO `ot_region` VALUES ('513230', 3, '区县', 'r', 'rtx', '壤塘县', '513200', 'rangtangxian');
INSERT INTO `ot_region` VALUES ('513231', 3, '区县', 'a', 'abx', '阿坝县', '513200', 'abaxian');
INSERT INTO `ot_region` VALUES ('513232', 3, '区县', 'r', 'regx', '若尔盖县', '513200', 'ruoergaixian');
INSERT INTO `ot_region` VALUES ('513233', 3, '区县', 'h', 'hyx', '红原县', '513200', 'hongyuanxian');
INSERT INTO `ot_region` VALUES ('513300', 2, '城市', 'g', 'gzzzzzz', '甘孜藏族自治州', '510000', 'ganzizangzuzizhizhou');
INSERT INTO `ot_region` VALUES ('513301', 3, '区县', 'k', 'kds', '康定市', '513300', 'kangdingshi');
INSERT INTO `ot_region` VALUES ('513322', 3, '区县', 'l', 'ldx', '泸定县', '513300', 'ludingxian');
INSERT INTO `ot_region` VALUES ('513323', 3, '区县', 'd', 'dbx', '丹巴县', '513300', 'danbaxian');
INSERT INTO `ot_region` VALUES ('513324', 3, '区县', 'j', 'jlx', '九龙县', '513300', 'jiulongxian');
INSERT INTO `ot_region` VALUES ('513325', 3, '区县', 'y', 'yjx', '雅江县', '513300', 'yajiangxian');
INSERT INTO `ot_region` VALUES ('513326', 3, '区县', 'd', 'dfx', '道孚县', '513300', 'daofuxian');
INSERT INTO `ot_region` VALUES ('513327', 3, '区县', 'l', 'lhx', '炉霍县', '513300', 'luhuoxian');
INSERT INTO `ot_region` VALUES ('513328', 3, '区县', 'g', 'gzx', '甘孜县', '513300', 'ganzixian');
INSERT INTO `ot_region` VALUES ('513329', 3, '区县', 'x', 'xlx', '新龙县', '513300', 'xinlongxian');
INSERT INTO `ot_region` VALUES ('513330', 3, '区县', 'd', 'dgx', '德格县', '513300', 'degexian');
INSERT INTO `ot_region` VALUES ('513331', 3, '区县', 'b', 'byx', '白玉县', '513300', 'baiyuxian');
INSERT INTO `ot_region` VALUES ('513332', 3, '区县', 's', 'sqx', '石渠县', '513300', 'shiquxian');
INSERT INTO `ot_region` VALUES ('513333', 3, '区县', 's', 'sdx', '色达县', '513300', 'sedaxian');
INSERT INTO `ot_region` VALUES ('513334', 3, '区县', 'l', 'ltx', '理塘县', '513300', 'litangxian');
INSERT INTO `ot_region` VALUES ('513335', 3, '区县', 'b', 'btx', '巴塘县', '513300', 'batangxian');
INSERT INTO `ot_region` VALUES ('513336', 3, '区县', 'x', 'xcx', '乡城县', '513300', 'xiangchengxian');
INSERT INTO `ot_region` VALUES ('513337', 3, '区县', 'd', 'dcx', '稻城县', '513300', 'daochengxian');
INSERT INTO `ot_region` VALUES ('513338', 3, '区县', 'd', 'drx', '得荣县', '513300', 'derongxian');
INSERT INTO `ot_region` VALUES ('513400', 2, '城市', 'l', 'lsyzzzz', '凉山彝族自治州', '510000', 'liangshanyizuzizhizhou');
INSERT INTO `ot_region` VALUES ('513401', 3, '区县', 'x', 'xcs', '西昌市', '513400', 'xichangshi');
INSERT INTO `ot_region` VALUES ('513422', 3, '区县', 'm', 'mlzzzzx', '木里藏族自治县', '513400', 'mulizangzuzizhixian');
INSERT INTO `ot_region` VALUES ('513423', 3, '区县', 'y', 'yyx', '盐源县', '513400', 'yanyuanxian');
INSERT INTO `ot_region` VALUES ('513424', 3, '区县', 'd', 'dcx', '德昌县', '513400', 'dechangxian');
INSERT INTO `ot_region` VALUES ('513425', 3, '区县', 'h', 'hlx', '会理县', '513400', 'huilixian');
INSERT INTO `ot_region` VALUES ('513426', 3, '区县', 'h', 'hdx', '会东县', '513400', 'huidongxian');
INSERT INTO `ot_region` VALUES ('513427', 3, '区县', 'n', 'nnx', '宁南县', '513400', 'ningnanxian');
INSERT INTO `ot_region` VALUES ('513428', 3, '区县', 'p', 'pgx', '普格县', '513400', 'pugexian');
INSERT INTO `ot_region` VALUES ('513429', 3, '区县', 'b', 'btx', '布拖县', '513400', 'butuoxian');
INSERT INTO `ot_region` VALUES ('513430', 3, '区县', 'j', 'jyx', '金阳县', '513400', 'jinyangxian');
INSERT INTO `ot_region` VALUES ('513431', 3, '区县', 'z', 'zjx', '昭觉县', '513400', 'zhaojuexian');
INSERT INTO `ot_region` VALUES ('513432', 3, '区县', 'x', 'xdx', '喜德县', '513400', 'xidexian');
INSERT INTO `ot_region` VALUES ('513433', 3, '区县', 'm', 'mnx', '冕宁县', '513400', 'mianningxian');
INSERT INTO `ot_region` VALUES ('513434', 3, '区县', 'y', 'yxx', '越西县', '513400', 'yuexixian');
INSERT INTO `ot_region` VALUES ('513435', 3, '区县', 'g', 'glx', '甘洛县', '513400', 'ganluoxian');
INSERT INTO `ot_region` VALUES ('513436', 3, '区县', 'm', 'mgx', '美姑县', '513400', 'meiguxian');
INSERT INTO `ot_region` VALUES ('513437', 3, '区县', 'l', 'lbx', '雷波县', '513400', 'leiboxian');
INSERT INTO `ot_region` VALUES ('520100', 2, '城市', 'g', 'gys', '贵阳市', '520000', 'guiyangshi');
INSERT INTO `ot_region` VALUES ('520102', 3, '区县', 'n', 'nmq', '南明区', '520100', 'nanmingqu');
INSERT INTO `ot_region` VALUES ('520103', 3, '区县', 'y', 'yyq', '云岩区', '520100', 'yunyanqu');
INSERT INTO `ot_region` VALUES ('520111', 3, '区县', 'h', 'hxq', '花溪区', '520100', 'huaxiqu');
INSERT INTO `ot_region` VALUES ('520112', 3, '区县', 'w', 'wdq', '乌当区', '520100', 'wudangqu');
INSERT INTO `ot_region` VALUES ('520113', 3, '区县', 'b', 'byq', '白云区', '520100', 'baiyunqu');
INSERT INTO `ot_region` VALUES ('520115', 3, '区县', 'g', 'gshq', '观山湖区', '520100', 'guanshanhuqu');
INSERT INTO `ot_region` VALUES ('520121', 3, '区县', 'k', 'kyx', '开阳县', '520100', 'kaiyangxian');
INSERT INTO `ot_region` VALUES ('520122', 3, '区县', 'x', 'xfx', '息烽县', '520100', 'xifengxian');
INSERT INTO `ot_region` VALUES ('520123', 3, '区县', 'x', 'xwx', '修文县', '520100', 'xiuwenxian');
INSERT INTO `ot_region` VALUES ('520181', 3, '区县', 'q', 'qzs', '清镇市', '520100', 'qingzhenshi');
INSERT INTO `ot_region` VALUES ('520200', 2, '城市', 'l', 'lpss', '六盘水市', '520000', 'liupanshuishi');
INSERT INTO `ot_region` VALUES ('520201', 3, '区县', 'z', 'zsq', '钟山区', '520200', 'zhongshanqu');
INSERT INTO `ot_region` VALUES ('520203', 3, '区县', 'l', 'lztq', '六枝特区', '520200', 'liuzhitequ');
INSERT INTO `ot_region` VALUES ('520221', 3, '区县', 's', 'scx', '水城县', '520200', 'shuichengxian');
INSERT INTO `ot_region` VALUES ('520281', 3, '区县', 'p', 'pzs', '盘州市', '520200', 'panzhoushi');
INSERT INTO `ot_region` VALUES ('520300', 2, '城市', 'z', 'zys', '遵义市', '520000', 'zunyishi');
INSERT INTO `ot_region` VALUES ('520302', 3, '区县', 'h', 'hhgq', '红花岗区', '520300', 'honghuagangqu');
INSERT INTO `ot_region` VALUES ('520303', 3, '区县', 'h', 'hcq', '汇川区', '520300', 'huichuanqu');
INSERT INTO `ot_region` VALUES ('520304', 3, '区县', 'b', 'bzq', '播州区', '520300', 'bozhouqu');
INSERT INTO `ot_region` VALUES ('520322', 3, '区县', 't', 'tzx', '桐梓县', '520300', 'tongzixian');
INSERT INTO `ot_region` VALUES ('520323', 3, '区县', 's', 'syx', '绥阳县', '520300', 'suiyangxian');
INSERT INTO `ot_region` VALUES ('520324', 3, '区县', 'z', 'zax', '正安县', '520300', 'zhenganxian');
INSERT INTO `ot_region` VALUES ('520325', 3, '区县', 'd', 'dzglzmzzzx', '道真仡佬族苗族自治县', '520300', 'daozhengelaozumiaozuzizhixian');
INSERT INTO `ot_region` VALUES ('520326', 3, '区县', 'w', 'wcglzmzzzx', '务川仡佬族苗族自治县', '520300', 'wuchuangelaozumiaozuzizhixian');
INSERT INTO `ot_region` VALUES ('520327', 3, '区县', 'f', 'fgx', '凤冈县', '520300', 'fenggangxian');
INSERT INTO `ot_region` VALUES ('520328', 3, '区县', 'm', 'mtx', '湄潭县', '520300', 'meitanxian');
INSERT INTO `ot_region` VALUES ('520329', 3, '区县', 'y', 'yqx', '余庆县', '520300', 'yuqingxian');
INSERT INTO `ot_region` VALUES ('520330', 3, '区县', 'x', 'xsx', '习水县', '520300', 'xishuixian');
INSERT INTO `ot_region` VALUES ('520381', 3, '区县', 'c', 'css', '赤水市', '520300', 'chishuishi');
INSERT INTO `ot_region` VALUES ('520382', 3, '区县', 'r', 'rhs', '仁怀市', '520300', 'renhuaishi');
INSERT INTO `ot_region` VALUES ('520400', 2, '城市', 'a', 'ass', '安顺市', '520000', 'anshunshi');
INSERT INTO `ot_region` VALUES ('520402', 3, '区县', 'x', 'xxq', '西秀区', '520400', 'xixiuqu');
INSERT INTO `ot_region` VALUES ('520403', 3, '区县', 'p', 'pbq', '平坝区', '520400', 'pingbaqu');
INSERT INTO `ot_region` VALUES ('520422', 3, '区县', 'p', 'pdx', '普定县', '520400', 'pudingxian');
INSERT INTO `ot_region` VALUES ('520423', 3, '区县', 'z', 'znbyzmzzzx', '镇宁布依族苗族自治县', '520400', 'zhenningbuyizumiaozuzizhixian');
INSERT INTO `ot_region` VALUES ('520424', 3, '区县', 'g', 'glbyzmzzzx', '关岭布依族苗族自治县', '520400', 'guanlingbuyizumiaozuzizhixian');
INSERT INTO `ot_region` VALUES ('520425', 3, '区县', 'z', 'zymzbyzzzx', '紫云苗族布依族自治县', '520400', 'ziyunmiaozubuyizuzizhixian');
INSERT INTO `ot_region` VALUES ('520500', 2, '城市', 'b', 'bjs', '毕节市', '520000', 'bijieshi');
INSERT INTO `ot_region` VALUES ('520502', 3, '区县', 'q', 'qxgq', '七星关区', '520500', 'qixingguanqu');
INSERT INTO `ot_region` VALUES ('520521', 3, '区县', 'd', 'dfx', '大方县', '520500', 'dafangxian');
INSERT INTO `ot_region` VALUES ('520522', 3, '区县', 'q', 'qxx', '黔西县', '520500', 'qianxixian');
INSERT INTO `ot_region` VALUES ('520523', 3, '区县', 'j', 'jsx', '金沙县', '520500', 'jinshaxian');
INSERT INTO `ot_region` VALUES ('520524', 3, '区县', 'z', 'zjx', '织金县', '520500', 'zhijinxian');
INSERT INTO `ot_region` VALUES ('520525', 3, '区县', 'n', 'nyx', '纳雍县', '520500', 'nayongxian');
INSERT INTO `ot_region` VALUES ('520526', 3, '区县', 'w', 'wnyzhzmzzzx', '威宁彝族回族苗族自治县', '520500', 'weiningyizuhuizumiaozuzizhixian');
INSERT INTO `ot_region` VALUES ('520527', 3, '区县', 'h', 'hzx', '赫章县', '520500', 'hezhangxian');
INSERT INTO `ot_region` VALUES ('520600', 2, '城市', 't', 'trs', '铜仁市', '520000', 'tongrenshi');
INSERT INTO `ot_region` VALUES ('520602', 3, '区县', 'b', 'bjq', '碧江区', '520600', 'bijiangqu');
INSERT INTO `ot_region` VALUES ('520603', 3, '区县', 'w', 'wsq', '万山区', '520600', 'wanshanqu');
INSERT INTO `ot_region` VALUES ('520621', 3, '区县', 'j', 'jkx', '江口县', '520600', 'jiangkouxian');
INSERT INTO `ot_region` VALUES ('520622', 3, '区县', 'y', 'ypdzzzx', '玉屏侗族自治县', '520600', 'yupingdongzuzizhixian');
INSERT INTO `ot_region` VALUES ('520623', 3, '区县', 's', 'sqx', '石阡县', '520600', 'shiqianxian');
INSERT INTO `ot_region` VALUES ('520624', 3, '区县', 's', 'snx', '思南县', '520600', 'sinanxian');
INSERT INTO `ot_region` VALUES ('520625', 3, '区县', 'y', 'yjtjzmzzzx', '印江土家族苗族自治县', '520600', 'yinjiangtujiazumiaozuzizhixian');
INSERT INTO `ot_region` VALUES ('520626', 3, '区县', 'd', 'djx', '德江县', '520600', 'dejiangxian');
INSERT INTO `ot_region` VALUES ('520627', 3, '区县', 'y', 'yhtjzzzx', '沿河土家族自治县', '520600', 'yanhetujiazuzizhixian');
INSERT INTO `ot_region` VALUES ('520628', 3, '区县', 's', 'stmzzzx', '松桃苗族自治县', '520600', 'songtaomiaozuzizhixian');
INSERT INTO `ot_region` VALUES ('522300', 2, '城市', 'q', 'qxnbyzmzzzz', '黔西南布依族苗族自治州', '520000', 'qianxinanbuyizumiaozuzizhizhou');
INSERT INTO `ot_region` VALUES ('522301', 3, '区县', 'x', 'xys', '兴义市', '522300', 'xingyishi');
INSERT INTO `ot_region` VALUES ('522302', 3, '区县', 'x', 'xrs', '兴仁市', '522300', 'xingrenshi');
INSERT INTO `ot_region` VALUES ('522323', 3, '区县', 'p', 'pax', '普安县', '522300', 'puanxian');
INSERT INTO `ot_region` VALUES ('522324', 3, '区县', 'q', 'qlx', '晴隆县', '522300', 'qinglongxian');
INSERT INTO `ot_region` VALUES ('522325', 3, '区县', 'z', 'zfx', '贞丰县', '522300', 'zhenfengxian');
INSERT INTO `ot_region` VALUES ('522326', 3, '区县', 'w', 'wmx', '望谟县', '522300', 'wangmoxian');
INSERT INTO `ot_region` VALUES ('522327', 3, '区县', 'c', 'chx', '册亨县', '522300', 'cehengxian');
INSERT INTO `ot_region` VALUES ('522328', 3, '区县', 'a', 'alx', '安龙县', '522300', 'anlongxian');
INSERT INTO `ot_region` VALUES ('522600', 2, '城市', 'q', 'qdnmzdzzzz', '黔东南苗族侗族自治州', '520000', 'qiandongnanmiaozudongzuzizhizhou');
INSERT INTO `ot_region` VALUES ('522601', 3, '区县', 'k', 'kls', '凯里市', '522600', 'kailishi');
INSERT INTO `ot_region` VALUES ('522622', 3, '区县', 'h', 'hpx', '黄平县', '522600', 'huangpingxian');
INSERT INTO `ot_region` VALUES ('522623', 3, '区县', 's', 'sbx', '施秉县', '522600', 'shibingxian');
INSERT INTO `ot_region` VALUES ('522624', 3, '区县', 's', 'ssx', '三穗县', '522600', 'sansuixian');
INSERT INTO `ot_region` VALUES ('522625', 3, '区县', 'z', 'zyx', '镇远县', '522600', 'zhenyuanxian');
INSERT INTO `ot_region` VALUES ('522626', 3, '区县', 'c', 'cgx', '岑巩县', '522600', 'cengongxian');
INSERT INTO `ot_region` VALUES ('522627', 3, '区县', 't', 'tzx', '天柱县', '522600', 'tianzhuxian');
INSERT INTO `ot_region` VALUES ('522628', 3, '区县', 'j', 'jpx', '锦屏县', '522600', 'jinpingxian');
INSERT INTO `ot_region` VALUES ('522629', 3, '区县', 'j', 'jhx', '剑河县', '522600', 'jianhexian');
INSERT INTO `ot_region` VALUES ('522630', 3, '区县', 't', 'tjx', '台江县', '522600', 'taijiangxian');
INSERT INTO `ot_region` VALUES ('522631', 3, '区县', 'l', 'lpx', '黎平县', '522600', 'lipingxian');
INSERT INTO `ot_region` VALUES ('522632', 3, '区县', 'r', 'rjx', '榕江县', '522600', 'rongjiangxian');
INSERT INTO `ot_region` VALUES ('522633', 3, '区县', 'c', 'cjx', '从江县', '522600', 'congjiangxian');
INSERT INTO `ot_region` VALUES ('522634', 3, '区县', 'l', 'lsx', '雷山县', '522600', 'leishanxian');
INSERT INTO `ot_region` VALUES ('522635', 3, '区县', 'm', 'mjx', '麻江县', '522600', 'majiangxian');
INSERT INTO `ot_region` VALUES ('522636', 3, '区县', 'd', 'dzx', '丹寨县', '522600', 'danzhaixian');
INSERT INTO `ot_region` VALUES ('522700', 2, '城市', 'q', 'qnbyzmzzzz', '黔南布依族苗族自治州', '520000', 'qiannanbuyizumiaozuzizhizhou');
INSERT INTO `ot_region` VALUES ('522701', 3, '区县', 'd', 'dys', '都匀市', '522700', 'douyunshi');
INSERT INTO `ot_region` VALUES ('522702', 3, '区县', 'f', 'fqs', '福泉市', '522700', 'fuquanshi');
INSERT INTO `ot_region` VALUES ('522722', 3, '区县', 'l', 'lbx', '荔波县', '522700', 'liboxian');
INSERT INTO `ot_region` VALUES ('522723', 3, '区县', 'g', 'gdx', '贵定县', '522700', 'guidingxian');
INSERT INTO `ot_region` VALUES ('522725', 3, '区县', 'w', 'wax', '瓮安县', '522700', 'wenganxian');
INSERT INTO `ot_region` VALUES ('522726', 3, '区县', 'd', 'dsx', '独山县', '522700', 'dushanxian');
INSERT INTO `ot_region` VALUES ('522727', 3, '区县', 'p', 'ptx', '平塘县', '522700', 'pingtangxian');
INSERT INTO `ot_region` VALUES ('522728', 3, '区县', 'l', 'ldx', '罗甸县', '522700', 'luodianxian');
INSERT INTO `ot_region` VALUES ('522729', 3, '区县', 'z', 'zsx', '长顺县', '522700', 'zhangshunxian');
INSERT INTO `ot_region` VALUES ('522730', 3, '区县', 'l', 'llx', '龙里县', '522700', 'longlixian');
INSERT INTO `ot_region` VALUES ('522731', 3, '区县', 'h', 'hsx', '惠水县', '522700', 'huishuixian');
INSERT INTO `ot_region` VALUES ('522732', 3, '区县', 's', 'sdszzzx', '三都水族自治县', '522700', 'sandoushuizuzizhixian');
INSERT INTO `ot_region` VALUES ('530100', 2, '城市', 'k', 'kms', '昆明市', '530000', 'kunmingshi');
INSERT INTO `ot_region` VALUES ('530102', 3, '区县', 'w', 'whq', '五华区', '530100', 'wuhuaqu');
INSERT INTO `ot_region` VALUES ('530103', 3, '区县', 'p', 'plq', '盘龙区', '530100', 'panlongqu');
INSERT INTO `ot_region` VALUES ('530111', 3, '区县', 'g', 'gdq', '官渡区', '530100', 'guanduqu');
INSERT INTO `ot_region` VALUES ('530112', 3, '区县', 'x', 'xsq', '西山区', '530100', 'xishanqu');
INSERT INTO `ot_region` VALUES ('530113', 3, '区县', 'd', 'dcq', '东川区', '530100', 'dongchuanqu');
INSERT INTO `ot_region` VALUES ('530114', 3, '区县', 'c', 'cgq', '呈贡区', '530100', 'chenggongqu');
INSERT INTO `ot_region` VALUES ('530115', 3, '区县', 'j', 'jnq', '晋宁区', '530100', 'jinningqu');
INSERT INTO `ot_region` VALUES ('530124', 3, '区县', 'f', 'fmx', '富民县', '530100', 'fuminxian');
INSERT INTO `ot_region` VALUES ('530125', 3, '区县', 'y', 'ylx', '宜良县', '530100', 'yiliangxian');
INSERT INTO `ot_region` VALUES ('530126', 3, '区县', 's', 'slyzzzx', '石林彝族自治县', '530100', 'shilinyizuzizhixian');
INSERT INTO `ot_region` VALUES ('530127', 3, '区县', 's', 'smx', '嵩明县', '530100', 'songmingxian');
INSERT INTO `ot_region` VALUES ('530128', 3, '区县', 'l', 'lqyzmzzzx', '禄劝彝族苗族自治县', '530100', 'luquanyizumiaozuzizhixian');
INSERT INTO `ot_region` VALUES ('530129', 3, '区县', 'x', 'xdhzyzzzx', '寻甸回族彝族自治县', '530100', 'xundianhuizuyizuzizhixian');
INSERT INTO `ot_region` VALUES ('530181', 3, '区县', 'a', 'ans', '安宁市', '530100', 'anningshi');
INSERT INTO `ot_region` VALUES ('530300', 2, '城市', 'q', 'qjs', '曲靖市', '530000', 'qujingshi');
INSERT INTO `ot_region` VALUES ('530302', 3, '区县', 'q', 'qlq', '麒麟区', '530300', 'qilinqu');
INSERT INTO `ot_region` VALUES ('530303', 3, '区县', 'z', 'zyq', '沾益区', '530300', 'zhanyiqu');
INSERT INTO `ot_region` VALUES ('530304', 3, '区县', 'm', 'mlq', '马龙区', '530300', 'malongqu');
INSERT INTO `ot_region` VALUES ('530322', 3, '区县', 'l', 'llx', '陆良县', '530300', 'luliangxian');
INSERT INTO `ot_region` VALUES ('530323', 3, '区县', 's', 'szx', '师宗县', '530300', 'shizongxian');
INSERT INTO `ot_region` VALUES ('530324', 3, '区县', 'l', 'lpx', '罗平县', '530300', 'luopingxian');
INSERT INTO `ot_region` VALUES ('530325', 3, '区县', 'f', 'fyx', '富源县', '530300', 'fuyuanxian');
INSERT INTO `ot_region` VALUES ('530326', 3, '区县', 'h', 'hzx', '会泽县', '530300', 'huizexian');
INSERT INTO `ot_region` VALUES ('530381', 3, '区县', 'x', 'xws', '宣威市', '530300', 'xuanweishi');
INSERT INTO `ot_region` VALUES ('530400', 2, '城市', 'y', 'yxs', '玉溪市', '530000', 'yuxishi');
INSERT INTO `ot_region` VALUES ('530402', 3, '区县', 'h', 'htq', '红塔区', '530400', 'hongtaqu');
INSERT INTO `ot_region` VALUES ('530403', 3, '区县', 'j', 'jcq', '江川区', '530400', 'jiangchuanqu');
INSERT INTO `ot_region` VALUES ('530422', 3, '区县', 'c', 'cjx', '澄江县', '530400', 'chengjiangxian');
INSERT INTO `ot_region` VALUES ('530423', 3, '区县', 't', 'thx', '通海县', '530400', 'tonghaixian');
INSERT INTO `ot_region` VALUES ('530424', 3, '区县', 'h', 'hnx', '华宁县', '530400', 'huaningxian');
INSERT INTO `ot_region` VALUES ('530425', 3, '区县', 'y', 'ymx', '易门县', '530400', 'yimenxian');
INSERT INTO `ot_region` VALUES ('530426', 3, '区县', 'e', 'esyzzzx', '峨山彝族自治县', '530400', 'eshanyizuzizhixian');
INSERT INTO `ot_region` VALUES ('530427', 3, '区县', 'x', 'xpyzdzzzx', '新平彝族傣族自治县', '530400', 'xinpingyizudaizuzizhixian');
INSERT INTO `ot_region` VALUES ('530428', 3, '区县', 'y', 'yjhnzyzdzzzx', '元江哈尼族彝族傣族自治县', '530400', 'yuanjianghanizuyizudaizuzizhixian');
INSERT INTO `ot_region` VALUES ('530500', 2, '城市', 'b', 'bss', '保山市', '530000', 'baoshanshi');
INSERT INTO `ot_region` VALUES ('530502', 3, '区县', 'l', 'lyq', '隆阳区', '530500', 'longyangqu');
INSERT INTO `ot_region` VALUES ('530521', 3, '区县', 's', 'sdx', '施甸县', '530500', 'shidianxian');
INSERT INTO `ot_region` VALUES ('530523', 3, '区县', 'l', 'llx', '龙陵县', '530500', 'longlingxian');
INSERT INTO `ot_region` VALUES ('530524', 3, '区县', 'c', 'cnx', '昌宁县', '530500', 'changningxian');
INSERT INTO `ot_region` VALUES ('530581', 3, '区县', 't', 'tcs', '腾冲市', '530500', 'tengchongshi');
INSERT INTO `ot_region` VALUES ('530600', 2, '城市', 'z', 'zts', '昭通市', '530000', 'zhaotongshi');
INSERT INTO `ot_region` VALUES ('530602', 3, '区县', 'z', 'zyq', '昭阳区', '530600', 'zhaoyangqu');
INSERT INTO `ot_region` VALUES ('530621', 3, '区县', 'l', 'ldx', '鲁甸县', '530600', 'ludianxian');
INSERT INTO `ot_region` VALUES ('530622', 3, '区县', 'q', 'qjx', '巧家县', '530600', 'qiaojiaxian');
INSERT INTO `ot_region` VALUES ('530623', 3, '区县', 'y', 'yjx', '盐津县', '530600', 'yanjinxian');
INSERT INTO `ot_region` VALUES ('530624', 3, '区县', 'd', 'dgx', '大关县', '530600', 'daguanxian');
INSERT INTO `ot_region` VALUES ('530625', 3, '区县', 'y', 'ysx', '永善县', '530600', 'yongshanxian');
INSERT INTO `ot_region` VALUES ('530626', 3, '区县', 's', 'sjx', '绥江县', '530600', 'suijiangxian');
INSERT INTO `ot_region` VALUES ('530627', 3, '区县', 'z', 'zxx', '镇雄县', '530600', 'zhenxiongxian');
INSERT INTO `ot_region` VALUES ('530628', 3, '区县', 'y', 'ylx', '彝良县', '530600', 'yiliangxian');
INSERT INTO `ot_region` VALUES ('530629', 3, '区县', 'w', 'wxx', '威信县', '530600', 'weixinxian');
INSERT INTO `ot_region` VALUES ('530681', 3, '区县', 's', 'sfs', '水富市', '530600', 'shuifushi');
INSERT INTO `ot_region` VALUES ('530700', 2, '城市', 'l', 'ljs', '丽江市', '530000', 'lijiangshi');
INSERT INTO `ot_region` VALUES ('530702', 3, '区县', 'g', 'gcq', '古城区', '530700', 'guchengqu');
INSERT INTO `ot_region` VALUES ('530721', 3, '区县', 'y', 'ylnxzzzx', '玉龙纳西族自治县', '530700', 'yulongnaxizuzizhixian');
INSERT INTO `ot_region` VALUES ('530722', 3, '区县', 'y', 'ysx', '永胜县', '530700', 'yongshengxian');
INSERT INTO `ot_region` VALUES ('530723', 3, '区县', 'h', 'hpx', '华坪县', '530700', 'huapingxian');
INSERT INTO `ot_region` VALUES ('530724', 3, '区县', 'n', 'nlyzzzx', '宁蒗彝族自治县', '530700', 'ninglangyizuzizhixian');
INSERT INTO `ot_region` VALUES ('530800', 2, '城市', 'p', 'pes', '普洱市', '530000', 'puershi');
INSERT INTO `ot_region` VALUES ('530802', 3, '区县', 's', 'smq', '思茅区', '530800', 'simaoqu');
INSERT INTO `ot_region` VALUES ('530821', 3, '区县', 'n', 'nehnzyzzzx', '宁洱哈尼族彝族自治县', '530800', 'ningerhanizuyizuzizhixian');
INSERT INTO `ot_region` VALUES ('530822', 3, '区县', 'm', 'mjhnzzzx', '墨江哈尼族自治县', '530800', 'mojianghanizuzizhixian');
INSERT INTO `ot_region` VALUES ('530823', 3, '区县', 'j', 'jdyzzzx', '景东彝族自治县', '530800', 'jingdongyizuzizhixian');
INSERT INTO `ot_region` VALUES ('530824', 3, '区县', 'j', 'jgdzyzzzx', '景谷傣族彝族自治县', '530800', 'jinggudaizuyizuzizhixian');
INSERT INTO `ot_region` VALUES ('530825', 3, '区县', 'z', 'zyyzhnzlhzzzx', '镇沅彝族哈尼族拉祜族自治县', '530800', 'zhenyuanyizuhanizulahuzuzizhixian');
INSERT INTO `ot_region` VALUES ('530826', 3, '区县', 'j', 'jchnzyzzzx', '江城哈尼族彝族自治县', '530800', 'jiangchenghanizuyizuzizhixian');
INSERT INTO `ot_region` VALUES ('530827', 3, '区县', 'm', 'mldzlhzwzzzx', '孟连傣族拉祜族佤族自治县', '530800', 'mengliandaizulahuzuwazuzizhixian');
INSERT INTO `ot_region` VALUES ('530828', 3, '区县', 'l', 'lclhzzzx', '澜沧拉祜族自治县', '530800', 'lancanglahuzuzizhixian');
INSERT INTO `ot_region` VALUES ('530829', 3, '区县', 'x', 'xmwzzzx', '西盟佤族自治县', '530800', 'ximengwazuzizhixian');
INSERT INTO `ot_region` VALUES ('530900', 2, '城市', 'l', 'lcs', '临沧市', '530000', 'lincangshi');
INSERT INTO `ot_region` VALUES ('530902', 3, '区县', 'l', 'lxq', '临翔区', '530900', 'linxiangqu');
INSERT INTO `ot_region` VALUES ('530921', 3, '区县', 'f', 'fqx', '凤庆县', '530900', 'fengqingxian');
INSERT INTO `ot_region` VALUES ('530922', 3, '区县', 'y', 'yx', '云县', '530900', 'yunxian');
INSERT INTO `ot_region` VALUES ('530923', 3, '区县', 'y', 'ydx', '永德县', '530900', 'yongdexian');
INSERT INTO `ot_region` VALUES ('530924', 3, '区县', 'z', 'zkx', '镇康县', '530900', 'zhenkangxian');
INSERT INTO `ot_region` VALUES ('530925', 3, '区县', 's', 'sjlhzwzblzdzzzx', '双江拉祜族佤族布朗族傣族自治县', '530900', 'shuangjianglahuzuwazubulangzudaizuzizhixian');
INSERT INTO `ot_region` VALUES ('530926', 3, '区县', 'g', 'gmdzwzzzx', '耿马傣族佤族自治县', '530900', 'gengmadaizuwazuzizhixian');
INSERT INTO `ot_region` VALUES ('530927', 3, '区县', 'c', 'cywzzzx', '沧源佤族自治县', '530900', 'cangyuanwazuzizhixian');
INSERT INTO `ot_region` VALUES ('532300', 2, '城市', 'c', 'cxyzzzz', '楚雄彝族自治州', '530000', 'chuxiongyizuzizhizhou');
INSERT INTO `ot_region` VALUES ('532301', 3, '区县', 'c', 'cxs', '楚雄市', '532300', 'chuxiongshi');
INSERT INTO `ot_region` VALUES ('532322', 3, '区县', 's', 'sbx', '双柏县', '532300', 'shuangboxian');
INSERT INTO `ot_region` VALUES ('532323', 3, '区县', 'm', 'mdx', '牟定县', '532300', 'moudingxian');
INSERT INTO `ot_region` VALUES ('532324', 3, '区县', 'n', 'nhx', '南华县', '532300', 'nanhuaxian');
INSERT INTO `ot_region` VALUES ('532325', 3, '区县', 'y', 'yax', '姚安县', '532300', 'yaoanxian');
INSERT INTO `ot_region` VALUES ('532326', 3, '区县', 'd', 'dyx', '大姚县', '532300', 'dayaoxian');
INSERT INTO `ot_region` VALUES ('532327', 3, '区县', 'y', 'yrx', '永仁县', '532300', 'yongrenxian');
INSERT INTO `ot_region` VALUES ('532328', 3, '区县', 'y', 'ymx', '元谋县', '532300', 'yuanmouxian');
INSERT INTO `ot_region` VALUES ('532329', 3, '区县', 'w', 'wdx', '武定县', '532300', 'wudingxian');
INSERT INTO `ot_region` VALUES ('532331', 3, '区县', 'l', 'lfx', '禄丰县', '532300', 'lufengxian');
INSERT INTO `ot_region` VALUES ('532500', 2, '城市', 'h', 'hhhnzyzzzz', '红河哈尼族彝族自治州', '530000', 'honghehanizuyizuzizhizhou');
INSERT INTO `ot_region` VALUES ('532501', 3, '区县', 'g', 'gjs', '个旧市', '532500', 'gejiushi');
INSERT INTO `ot_region` VALUES ('532502', 3, '区县', 'k', 'kys', '开远市', '532500', 'kaiyuanshi');
INSERT INTO `ot_region` VALUES ('532503', 3, '区县', 'm', 'mzs', '蒙自市', '532500', 'mengzishi');
INSERT INTO `ot_region` VALUES ('532504', 3, '区县', 'm', 'mls', '弥勒市', '532500', 'mileshi');
INSERT INTO `ot_region` VALUES ('532523', 3, '区县', 'p', 'pbmzzzx', '屏边苗族自治县', '532500', 'pingbianmiaozuzizhixian');
INSERT INTO `ot_region` VALUES ('532524', 3, '区县', 'j', 'jsx', '建水县', '532500', 'jianshuixian');
INSERT INTO `ot_region` VALUES ('532525', 3, '区县', 's', 'spx', '石屏县', '532500', 'shipingxian');
INSERT INTO `ot_region` VALUES ('532527', 3, '区县', 'l', 'lxx', '泸西县', '532500', 'luxixian');
INSERT INTO `ot_region` VALUES ('532528', 3, '区县', 'y', 'yyx', '元阳县', '532500', 'yuanyangxian');
INSERT INTO `ot_region` VALUES ('532529', 3, '区县', 'h', 'hhx', '红河县', '532500', 'honghexian');
INSERT INTO `ot_region` VALUES ('532530', 3, '区县', 'j', 'jpmzyzdzzzx', '金平苗族瑶族傣族自治县', '532500', 'jinpingmiaozuyaozudaizuzizhixian');
INSERT INTO `ot_region` VALUES ('532531', 3, '区县', 'l', 'lcx', '绿春县', '532500', 'lu:chunxian');
INSERT INTO `ot_region` VALUES ('532532', 3, '区县', 'h', 'hkyzzzx', '河口瑶族自治县', '532500', 'hekouyaozuzizhixian');
INSERT INTO `ot_region` VALUES ('532600', 2, '城市', 'w', 'wszzmzzzz', '文山壮族苗族自治州', '530000', 'wenshanzhuangzumiaozuzizhizhou');
INSERT INTO `ot_region` VALUES ('532601', 3, '区县', 'w', 'wss', '文山市', '532600', 'wenshanshi');
INSERT INTO `ot_region` VALUES ('532622', 3, '区县', 'y', 'ysx', '砚山县', '532600', 'yanshanxian');
INSERT INTO `ot_region` VALUES ('532623', 3, '区县', 'x', 'xcx', '西畴县', '532600', 'xichouxian');
INSERT INTO `ot_region` VALUES ('532624', 3, '区县', 'm', 'mlpx', '麻栗坡县', '532600', 'malipoxian');
INSERT INTO `ot_region` VALUES ('532625', 3, '区县', 'm', 'mgx', '马关县', '532600', 'maguanxian');
INSERT INTO `ot_region` VALUES ('532626', 3, '区县', 'q', 'qbx', '丘北县', '532600', 'qiubeixian');
INSERT INTO `ot_region` VALUES ('532627', 3, '区县', 'g', 'gnx', '广南县', '532600', 'guangnanxian');
INSERT INTO `ot_region` VALUES ('532628', 3, '区县', 'f', 'fnx', '富宁县', '532600', 'funingxian');
INSERT INTO `ot_region` VALUES ('532800', 2, '城市', 'x', 'xsbndzzzz', '西双版纳傣族自治州', '530000', 'xishuangbannadaizuzizhizhou');
INSERT INTO `ot_region` VALUES ('532801', 3, '区县', 'j', 'jhs', '景洪市', '532800', 'jinghongshi');
INSERT INTO `ot_region` VALUES ('532822', 3, '区县', 'm', 'mhx', '勐海县', '532800', 'menghaixian');
INSERT INTO `ot_region` VALUES ('532823', 3, '区县', 'm', 'mlx', '勐腊县', '532800', 'menglaxian');
INSERT INTO `ot_region` VALUES ('532900', 2, '城市', 'd', 'dlbzzzz', '大理白族自治州', '530000', 'dalibaizuzizhizhou');
INSERT INTO `ot_region` VALUES ('532901', 3, '区县', 'd', 'dls', '大理市', '532900', 'dalishi');
INSERT INTO `ot_region` VALUES ('532922', 3, '区县', 'y', 'ybyzzzx', '漾濞彝族自治县', '532900', 'yangbiyizuzizhixian');
INSERT INTO `ot_region` VALUES ('532923', 3, '区县', 'x', 'xyx', '祥云县', '532900', 'xiangyunxian');
INSERT INTO `ot_region` VALUES ('532924', 3, '区县', 'b', 'bcx', '宾川县', '532900', 'binchuanxian');
INSERT INTO `ot_region` VALUES ('532925', 3, '区县', 'm', 'mdx', '弥渡县', '532900', 'miduxian');
INSERT INTO `ot_region` VALUES ('532926', 3, '区县', 'n', 'njyzzzx', '南涧彝族自治县', '532900', 'nanjianyizuzizhixian');
INSERT INTO `ot_region` VALUES ('532927', 3, '区县', 'w', 'wsyzhzzzx', '巍山彝族回族自治县', '532900', 'weishanyizuhuizuzizhixian');
INSERT INTO `ot_region` VALUES ('532928', 3, '区县', 'y', 'ypx', '永平县', '532900', 'yongpingxian');
INSERT INTO `ot_region` VALUES ('532929', 3, '区县', 'y', 'ylx', '云龙县', '532900', 'yunlongxian');
INSERT INTO `ot_region` VALUES ('532930', 3, '区县', 'e', 'eyx', '洱源县', '532900', 'eryuanxian');
INSERT INTO `ot_region` VALUES ('532931', 3, '区县', 'j', 'jcx', '剑川县', '532900', 'jianchuanxian');
INSERT INTO `ot_region` VALUES ('532932', 3, '区县', 'h', 'hqx', '鹤庆县', '532900', 'heqingxian');
INSERT INTO `ot_region` VALUES ('533100', 2, '城市', 'd', 'dhdzjpzzzz', '德宏傣族景颇族自治州', '530000', 'dehongdaizujingpozuzizhizhou');
INSERT INTO `ot_region` VALUES ('533102', 3, '区县', 'r', 'rls', '瑞丽市', '533100', 'ruilishi');
INSERT INTO `ot_region` VALUES ('533103', 3, '区县', 'm', 'ms', '芒市', '533100', 'mangshi');
INSERT INTO `ot_region` VALUES ('533122', 3, '区县', 'l', 'lhx', '梁河县', '533100', 'lianghexian');
INSERT INTO `ot_region` VALUES ('533123', 3, '区县', 'y', 'yjx', '盈江县', '533100', 'yingjiangxian');
INSERT INTO `ot_region` VALUES ('533124', 3, '区县', 'l', 'lcx', '陇川县', '533100', 'longchuanxian');
INSERT INTO `ot_region` VALUES ('533300', 2, '城市', 'n', 'njlszzzz', '怒江傈僳族自治州', '530000', 'nujianglisuzuzizhizhou');
INSERT INTO `ot_region` VALUES ('533301', 3, '区县', 'l', 'lss', '泸水市', '533300', 'lushuishi');
INSERT INTO `ot_region` VALUES ('533323', 3, '区县', 'f', 'fgx', '福贡县', '533300', 'fugongxian');
INSERT INTO `ot_region` VALUES ('533324', 3, '区县', 'g', 'gsdlznzzzx', '贡山独龙族怒族自治县', '533300', 'gongshandulongzunuzuzizhixian');
INSERT INTO `ot_region` VALUES ('533325', 3, '区县', 'l', 'lpbzpmzzzx', '兰坪白族普米族自治县', '533300', 'lanpingbaizupumizuzizhixian');
INSERT INTO `ot_region` VALUES ('533400', 2, '城市', 'd', 'dqzzzzz', '迪庆藏族自治州', '530000', 'diqingzangzuzizhizhou');
INSERT INTO `ot_region` VALUES ('533401', 3, '区县', 'x', 'xglls', '香格里拉市', '533400', 'xianggelilashi');
INSERT INTO `ot_region` VALUES ('533422', 3, '区县', 'd', 'dqx', '德钦县', '533400', 'deqinxian');
INSERT INTO `ot_region` VALUES ('533423', 3, '区县', 'w', 'wxlszzzx', '维西傈僳族自治县', '533400', 'weixilisuzuzizhixian');
INSERT INTO `ot_region` VALUES ('540100', 2, '城市', 'l', 'lss', '拉萨市', '540000', 'lasashi');
INSERT INTO `ot_region` VALUES ('540102', 3, '区县', 'c', 'cgq', '城关区', '540100', 'chengguanqu');
INSERT INTO `ot_region` VALUES ('540103', 3, '区县', 'd', 'dldqq', '堆龙德庆区', '540100', 'duilongdeqingqu');
INSERT INTO `ot_region` VALUES ('540104', 3, '区县', 'd', 'dzq', '达孜区', '540100', 'daziqu');
INSERT INTO `ot_region` VALUES ('540121', 3, '区县', 'l', 'lzx', '林周县', '540100', 'linzhouxian');
INSERT INTO `ot_region` VALUES ('540122', 3, '区县', 'd', 'dxx', '当雄县', '540100', 'dangxiongxian');
INSERT INTO `ot_region` VALUES ('540123', 3, '区县', 'n', 'nmx', '尼木县', '540100', 'nimuxian');
INSERT INTO `ot_region` VALUES ('540124', 3, '区县', 'q', 'qsx', '曲水县', '540100', 'qushuixian');
INSERT INTO `ot_region` VALUES ('540127', 3, '区县', 'm', 'mzgkx', '墨竹工卡县', '540100', 'mozhugongkaxian');
INSERT INTO `ot_region` VALUES ('540200', 2, '城市', 'r', 'rkzs', '日喀则市', '540000', 'rikazeshi');
INSERT INTO `ot_region` VALUES ('540202', 3, '区县', 's', 'szzq', '桑珠孜区', '540200', 'sangzhuziqu');
INSERT INTO `ot_region` VALUES ('540221', 3, '区县', 'n', 'nmlx', '南木林县', '540200', 'nanmulinxian');
INSERT INTO `ot_region` VALUES ('540222', 3, '区县', 'j', 'jzx', '江孜县', '540200', 'jiangzixian');
INSERT INTO `ot_region` VALUES ('540223', 3, '区县', 'd', 'drx', '定日县', '540200', 'dingrixian');
INSERT INTO `ot_region` VALUES ('540224', 3, '区县', 's', 'sjx', '萨迦县', '540200', 'sajiaxian');
INSERT INTO `ot_region` VALUES ('540225', 3, '区县', 'l', 'lzx', '拉孜县', '540200', 'lazixian');
INSERT INTO `ot_region` VALUES ('540226', 3, '区县', 'a', 'arx', '昂仁县', '540200', 'angrenxian');
INSERT INTO `ot_region` VALUES ('540227', 3, '区县', 'x', 'xtmx', '谢通门县', '540200', 'xietongmenxian');
INSERT INTO `ot_region` VALUES ('540228', 3, '区县', 'b', 'blx', '白朗县', '540200', 'bailangxian');
INSERT INTO `ot_region` VALUES ('540229', 3, '区县', 'r', 'rbx', '仁布县', '540200', 'renbuxian');
INSERT INTO `ot_region` VALUES ('540230', 3, '区县', 'k', 'kmx', '康马县', '540200', 'kangmaxian');
INSERT INTO `ot_region` VALUES ('540231', 3, '区县', 'd', 'djx', '定结县', '540200', 'dingjiexian');
INSERT INTO `ot_region` VALUES ('540232', 3, '区县', 'z', 'zbx', '仲巴县', '540200', 'zhongbaxian');
INSERT INTO `ot_region` VALUES ('540233', 3, '区县', 'y', 'ydx', '亚东县', '540200', 'yadongxian');
INSERT INTO `ot_region` VALUES ('540234', 3, '区县', 'j', 'jlx', '吉隆县', '540200', 'jilongxian');
INSERT INTO `ot_region` VALUES ('540235', 3, '区县', 'n', 'nlmx', '聂拉木县', '540200', 'nielamuxian');
INSERT INTO `ot_region` VALUES ('540236', 3, '区县', 's', 'sgx', '萨嘎县', '540200', 'sagaxian');
INSERT INTO `ot_region` VALUES ('540237', 3, '区县', 'g', 'gbx', '岗巴县', '540200', 'gangbaxian');
INSERT INTO `ot_region` VALUES ('540300', 2, '城市', 'c', 'cds', '昌都市', '540000', 'changdoushi');
INSERT INTO `ot_region` VALUES ('540302', 3, '区县', 'k', 'krq', '卡若区', '540300', 'karuoqu');
INSERT INTO `ot_region` VALUES ('540321', 3, '区县', 'j', 'jdx', '江达县', '540300', 'jiangdaxian');
INSERT INTO `ot_region` VALUES ('540322', 3, '区县', 'g', 'gjx', '贡觉县', '540300', 'gongjuexian');
INSERT INTO `ot_region` VALUES ('540323', 3, '区县', 'l', 'lwqx', '类乌齐县', '540300', 'leiwuqixian');
INSERT INTO `ot_region` VALUES ('540324', 3, '区县', 'd', 'dqx', '丁青县', '540300', 'dingqingxian');
INSERT INTO `ot_region` VALUES ('540325', 3, '区县', 'c', 'cyx', '察雅县', '540300', 'chayaxian');
INSERT INTO `ot_region` VALUES ('540326', 3, '区县', 'b', 'bsx', '八宿县', '540300', 'basuxian');
INSERT INTO `ot_region` VALUES ('540327', 3, '区县', 'z', 'zgx', '左贡县', '540300', 'zuogongxian');
INSERT INTO `ot_region` VALUES ('540328', 3, '区县', 'm', 'mkx', '芒康县', '540300', 'mangkangxian');
INSERT INTO `ot_region` VALUES ('540329', 3, '区县', 'l', 'llx', '洛隆县', '540300', 'luolongxian');
INSERT INTO `ot_region` VALUES ('540330', 3, '区县', 'b', 'bbx', '边坝县', '540300', 'bianbaxian');
INSERT INTO `ot_region` VALUES ('540400', 2, '城市', 'l', 'lzs', '林芝市', '540000', 'linzhishi');
INSERT INTO `ot_region` VALUES ('540402', 3, '区县', 'b', 'byq', '巴宜区', '540400', 'bayiqu');
INSERT INTO `ot_region` VALUES ('540421', 3, '区县', 'g', 'gbjdx', '工布江达县', '540400', 'gongbujiangdaxian');
INSERT INTO `ot_region` VALUES ('540422', 3, '区县', 'm', 'mlx', '米林县', '540400', 'milinxian');
INSERT INTO `ot_region` VALUES ('540423', 3, '区县', 'm', 'mtx', '墨脱县', '540400', 'motuoxian');
INSERT INTO `ot_region` VALUES ('540424', 3, '区县', 'b', 'bmx', '波密县', '540400', 'bomixian');
INSERT INTO `ot_region` VALUES ('540425', 3, '区县', 'c', 'cyx', '察隅县', '540400', 'chayuxian');
INSERT INTO `ot_region` VALUES ('540426', 3, '区县', 'l', 'lx', '朗县', '540400', 'langxian');
INSERT INTO `ot_region` VALUES ('540500', 2, '城市', 's', 'sns', '山南市', '540000', 'shannanshi');
INSERT INTO `ot_region` VALUES ('540502', 3, '区县', 'n', 'ndq', '乃东区', '540500', 'naidongqu');
INSERT INTO `ot_region` VALUES ('540521', 3, '区县', 'z', 'znx', '扎囊县', '540500', 'zhanangxian');
INSERT INTO `ot_region` VALUES ('540522', 3, '区县', 'g', 'ggx', '贡嘎县', '540500', 'gonggaxian');
INSERT INTO `ot_region` VALUES ('540523', 3, '区县', 's', 'srx', '桑日县', '540500', 'sangrixian');
INSERT INTO `ot_region` VALUES ('540524', 3, '区县', 'q', 'qjx', '琼结县', '540500', 'qiongjiexian');
INSERT INTO `ot_region` VALUES ('540525', 3, '区县', 'q', 'qsx', '曲松县', '540500', 'qusongxian');
INSERT INTO `ot_region` VALUES ('540526', 3, '区县', 'c', 'cmx', '措美县', '540500', 'cuomeixian');
INSERT INTO `ot_region` VALUES ('540527', 3, '区县', 'l', 'lzx', '洛扎县', '540500', 'luozhaxian');
INSERT INTO `ot_region` VALUES ('540528', 3, '区县', 'j', 'jcx', '加查县', '540500', 'jiachaxian');
INSERT INTO `ot_region` VALUES ('540529', 3, '区县', 'l', 'lzx', '隆子县', '540500', 'longzixian');
INSERT INTO `ot_region` VALUES ('540530', 3, '区县', 'c', 'cnx', '错那县', '540500', 'cuoneixian');
INSERT INTO `ot_region` VALUES ('540531', 3, '区县', 'l', 'lkzx', '浪卡子县', '540500', 'langkazixian');
INSERT INTO `ot_region` VALUES ('540600', 2, '城市', 'n', 'nqs', '那曲市', '540000', 'neiqushi');
INSERT INTO `ot_region` VALUES ('540602', 3, '区县', 's', 'snq', '色尼区', '540600', 'seniqu');
INSERT INTO `ot_region` VALUES ('540621', 3, '区县', 'j', 'jlx', '嘉黎县', '540600', 'jialixian');
INSERT INTO `ot_region` VALUES ('540622', 3, '区县', 'b', 'brx', '比如县', '540600', 'biruxian');
INSERT INTO `ot_region` VALUES ('540623', 3, '区县', 'n', 'nrx', '聂荣县', '540600', 'nierongxian');
INSERT INTO `ot_region` VALUES ('540624', 3, '区县', 'a', 'adx', '安多县', '540600', 'anduoxian');
INSERT INTO `ot_region` VALUES ('540625', 3, '区县', 's', 'szx', '申扎县', '540600', 'shenzhaxian');
INSERT INTO `ot_region` VALUES ('540626', 3, '区县', 's', 'sx', '索县', '540600', 'suoxian');
INSERT INTO `ot_region` VALUES ('540627', 3, '区县', 'b', 'bgx', '班戈县', '540600', 'bangexian');
INSERT INTO `ot_region` VALUES ('540628', 3, '区县', 'b', 'bqx', '巴青县', '540600', 'baqingxian');
INSERT INTO `ot_region` VALUES ('540629', 3, '区县', 'n', 'nmx', '尼玛县', '540600', 'nimaxian');
INSERT INTO `ot_region` VALUES ('540630', 3, '区县', 's', 'shx', '双湖县', '540600', 'shuanghuxian');
INSERT INTO `ot_region` VALUES ('542500', 2, '城市', 'a', 'aldq', '阿里地区', '540000', 'alidiqu');
INSERT INTO `ot_region` VALUES ('542521', 3, '区县', 'p', 'plx', '普兰县', '542500', 'pulanxian');
INSERT INTO `ot_region` VALUES ('542522', 3, '区县', 'z', 'zdx', '札达县', '542500', 'zhadaxian');
INSERT INTO `ot_region` VALUES ('542523', 3, '区县', 'g', 'gex', '噶尔县', '542500', 'gaerxian');
INSERT INTO `ot_region` VALUES ('542524', 3, '区县', 'r', 'rtx', '日土县', '542500', 'rituxian');
INSERT INTO `ot_region` VALUES ('542525', 3, '区县', 'g', 'gjx', '革吉县', '542500', 'gejixian');
INSERT INTO `ot_region` VALUES ('542526', 3, '区县', 'g', 'gzx', '改则县', '542500', 'gaizexian');
INSERT INTO `ot_region` VALUES ('542527', 3, '区县', 'c', 'cqx', '措勤县', '542500', 'cuoqinxian');
INSERT INTO `ot_region` VALUES ('610100', 2, '城市', 'x', 'xas', '西安市', '610000', 'xianshi');
INSERT INTO `ot_region` VALUES ('610102', 3, '区县', 'x', 'xcq', '新城区', '610100', 'xinchengqu');
INSERT INTO `ot_region` VALUES ('610103', 3, '区县', 'b', 'blq', '碑林区', '610100', 'beilinqu');
INSERT INTO `ot_region` VALUES ('610104', 3, '区县', 'l', 'lhq', '莲湖区', '610100', 'lianhuqu');
INSERT INTO `ot_region` VALUES ('610111', 3, '区县', 'b', 'bqq', '灞桥区', '610100', 'baqiaoqu');
INSERT INTO `ot_region` VALUES ('610112', 3, '区县', 'w', 'wyq', '未央区', '610100', 'weiyangqu');
INSERT INTO `ot_region` VALUES ('610113', 3, '区县', 'y', 'ytq', '雁塔区', '610100', 'yantaqu');
INSERT INTO `ot_region` VALUES ('610114', 3, '区县', 'y', 'ylq', '阎良区', '610100', 'yanliangqu');
INSERT INTO `ot_region` VALUES ('610115', 3, '区县', 'l', 'ltq', '临潼区', '610100', 'lintongqu');
INSERT INTO `ot_region` VALUES ('610116', 3, '区县', 'z', 'zaq', '长安区', '610100', 'zhanganqu');
INSERT INTO `ot_region` VALUES ('610117', 3, '区县', 'g', 'glq', '高陵区', '610100', 'gaolingqu');
INSERT INTO `ot_region` VALUES ('610118', 3, '区县', 'h', 'hyq', '鄠邑区', '610100', 'huyiqu');
INSERT INTO `ot_region` VALUES ('610122', 3, '区县', 'l', 'ltx', '蓝田县', '610100', 'lantianxian');
INSERT INTO `ot_region` VALUES ('610124', 3, '区县', 'z', 'zzx', '周至县', '610100', 'zhouzhixian');
INSERT INTO `ot_region` VALUES ('610200', 2, '城市', 't', 'tcs', '铜川市', '610000', 'tongchuanshi');
INSERT INTO `ot_region` VALUES ('610202', 3, '区县', 'w', 'wyq', '王益区', '610200', 'wangyiqu');
INSERT INTO `ot_region` VALUES ('610203', 3, '区县', 'y', 'ytq', '印台区', '610200', 'yintaiqu');
INSERT INTO `ot_region` VALUES ('610204', 3, '区县', 'y', 'yzq', '耀州区', '610200', 'yaozhouqu');
INSERT INTO `ot_region` VALUES ('610222', 3, '区县', 'y', 'yjx', '宜君县', '610200', 'yijunxian');
INSERT INTO `ot_region` VALUES ('610300', 2, '城市', 'b', 'bjs', '宝鸡市', '610000', 'baojishi');
INSERT INTO `ot_region` VALUES ('610302', 3, '区县', 'w', 'wbq', '渭滨区', '610300', 'weibinqu');
INSERT INTO `ot_region` VALUES ('610303', 3, '区县', 'j', 'jtq', '金台区', '610300', 'jintaiqu');
INSERT INTO `ot_region` VALUES ('610304', 3, '区县', 'c', 'ccq', '陈仓区', '610300', 'chencangqu');
INSERT INTO `ot_region` VALUES ('610322', 3, '区县', 'f', 'fxx', '凤翔县', '610300', 'fengxiangxian');
INSERT INTO `ot_region` VALUES ('610323', 3, '区县', 'q', 'qsx', '岐山县', '610300', 'qishanxian');
INSERT INTO `ot_region` VALUES ('610324', 3, '区县', 'f', 'ffx', '扶风县', '610300', 'fufengxian');
INSERT INTO `ot_region` VALUES ('610326', 3, '区县', 'm', 'mx', '眉县', '610300', 'meixian');
INSERT INTO `ot_region` VALUES ('610327', 3, '区县', 'l', 'lx', '陇县', '610300', 'longxian');
INSERT INTO `ot_region` VALUES ('610328', 3, '区县', 'q', 'qyx', '千阳县', '610300', 'qianyangxian');
INSERT INTO `ot_region` VALUES ('610329', 3, '区县', 'l', 'lyx', '麟游县', '610300', 'linyouxian');
INSERT INTO `ot_region` VALUES ('610330', 3, '区县', 'f', 'fx', '凤县', '610300', 'fengxian');
INSERT INTO `ot_region` VALUES ('610331', 3, '区县', 't', 'tbx', '太白县', '610300', 'taibaixian');
INSERT INTO `ot_region` VALUES ('610400', 2, '城市', 'x', 'xys', '咸阳市', '610000', 'xianyangshi');
INSERT INTO `ot_region` VALUES ('610402', 3, '区县', 'q', 'qdq', '秦都区', '610400', 'qindouqu');
INSERT INTO `ot_region` VALUES ('610403', 3, '区县', 'y', 'ylq', '杨陵区', '610400', 'yanglingqu');
INSERT INTO `ot_region` VALUES ('610404', 3, '区县', 'w', 'wcq', '渭城区', '610400', 'weichengqu');
INSERT INTO `ot_region` VALUES ('610422', 3, '区县', 's', 'syx', '三原县', '610400', 'sanyuanxian');
INSERT INTO `ot_region` VALUES ('610423', 3, '区县', 'j', 'jyx', '泾阳县', '610400', 'jingyangxian');
INSERT INTO `ot_region` VALUES ('610424', 3, '区县', 'q', 'qx', '乾县', '610400', 'qianxian');
INSERT INTO `ot_region` VALUES ('610425', 3, '区县', 'l', 'lqx', '礼泉县', '610400', 'liquanxian');
INSERT INTO `ot_region` VALUES ('610426', 3, '区县', 'y', 'ysx', '永寿县', '610400', 'yongshouxian');
INSERT INTO `ot_region` VALUES ('610428', 3, '区县', 'z', 'zwx', '长武县', '610400', 'zhangwuxian');
INSERT INTO `ot_region` VALUES ('610429', 3, '区县', 'x', 'xyx', '旬邑县', '610400', 'xunyixian');
INSERT INTO `ot_region` VALUES ('610430', 3, '区县', 'c', 'chx', '淳化县', '610400', 'chunhuaxian');
INSERT INTO `ot_region` VALUES ('610431', 3, '区县', 'w', 'wgx', '武功县', '610400', 'wugongxian');
INSERT INTO `ot_region` VALUES ('610481', 3, '区县', 'x', 'xps', '兴平市', '610400', 'xingpingshi');
INSERT INTO `ot_region` VALUES ('610482', 3, '区县', 'b', 'bzs', '彬州市', '610400', 'binzhoushi');
INSERT INTO `ot_region` VALUES ('610500', 2, '城市', 'w', 'wns', '渭南市', '610000', 'weinanshi');
INSERT INTO `ot_region` VALUES ('610502', 3, '区县', 'l', 'lwq', '临渭区', '610500', 'linweiqu');
INSERT INTO `ot_region` VALUES ('610503', 3, '区县', 'h', 'hzq', '华州区', '610500', 'huazhouqu');
INSERT INTO `ot_region` VALUES ('610522', 3, '区县', 't', 'tgx', '潼关县', '610500', 'tongguanxian');
INSERT INTO `ot_region` VALUES ('610523', 3, '区县', 'd', 'dlx', '大荔县', '610500', 'dalixian');
INSERT INTO `ot_region` VALUES ('610524', 3, '区县', 'h', 'hyx', '合阳县', '610500', 'heyangxian');
INSERT INTO `ot_region` VALUES ('610525', 3, '区县', 'c', 'ccx', '澄城县', '610500', 'chengchengxian');
INSERT INTO `ot_region` VALUES ('610526', 3, '区县', 'p', 'pcx', '蒲城县', '610500', 'puchengxian');
INSERT INTO `ot_region` VALUES ('610527', 3, '区县', 'b', 'bsx', '白水县', '610500', 'baishuixian');
INSERT INTO `ot_region` VALUES ('610528', 3, '区县', 'f', 'fpx', '富平县', '610500', 'fupingxian');
INSERT INTO `ot_region` VALUES ('610581', 3, '区县', 'h', 'hcs', '韩城市', '610500', 'hanchengshi');
INSERT INTO `ot_region` VALUES ('610582', 3, '区县', 'h', 'hys', '华阴市', '610500', 'huayinshi');
INSERT INTO `ot_region` VALUES ('610600', 2, '城市', 'y', 'yas', '延安市', '610000', 'yananshi');
INSERT INTO `ot_region` VALUES ('610602', 3, '区县', 'b', 'btq', '宝塔区', '610600', 'baotaqu');
INSERT INTO `ot_region` VALUES ('610603', 3, '区县', 'a', 'asq', '安塞区', '610600', 'ansaiqu');
INSERT INTO `ot_region` VALUES ('610621', 3, '区县', 'y', 'yzx', '延长县', '610600', 'yanzhangxian');
INSERT INTO `ot_region` VALUES ('610622', 3, '区县', 'y', 'ycx', '延川县', '610600', 'yanchuanxian');
INSERT INTO `ot_region` VALUES ('610623', 3, '区县', 'z', 'zzx', '子长县', '610600', 'zizhangxian');
INSERT INTO `ot_region` VALUES ('610625', 3, '区县', 'z', 'zdx', '志丹县', '610600', 'zhidanxian');
INSERT INTO `ot_region` VALUES ('610626', 3, '区县', 'w', 'wqx', '吴起县', '610600', 'wuqixian');
INSERT INTO `ot_region` VALUES ('610627', 3, '区县', 'g', 'gqx', '甘泉县', '610600', 'ganquanxian');
INSERT INTO `ot_region` VALUES ('610628', 3, '区县', 'f', 'fx', '富县', '610600', 'fuxian');
INSERT INTO `ot_region` VALUES ('610629', 3, '区县', 'l', 'lcx', '洛川县', '610600', 'luochuanxian');
INSERT INTO `ot_region` VALUES ('610630', 3, '区县', 'y', 'ycx', '宜川县', '610600', 'yichuanxian');
INSERT INTO `ot_region` VALUES ('610631', 3, '区县', 'h', 'hlx', '黄龙县', '610600', 'huanglongxian');
INSERT INTO `ot_region` VALUES ('610632', 3, '区县', 'h', 'hlx', '黄陵县', '610600', 'huanglingxian');
INSERT INTO `ot_region` VALUES ('610700', 2, '城市', 'h', 'hzs', '汉中市', '610000', 'hanzhongshi');
INSERT INTO `ot_region` VALUES ('610702', 3, '区县', 'h', 'htq', '汉台区', '610700', 'hantaiqu');
INSERT INTO `ot_region` VALUES ('610703', 3, '区县', 'n', 'nzq', '南郑区', '610700', 'nanzhengqu');
INSERT INTO `ot_region` VALUES ('610722', 3, '区县', 'c', 'cgx', '城固县', '610700', 'chengguxian');
INSERT INTO `ot_region` VALUES ('610723', 3, '区县', 'y', 'yx', '洋县', '610700', 'yangxian');
INSERT INTO `ot_region` VALUES ('610724', 3, '区县', 'x', 'xxx', '西乡县', '610700', 'xixiangxian');
INSERT INTO `ot_region` VALUES ('610725', 3, '区县', 'm', 'mx', '勉县', '610700', 'mianxian');
INSERT INTO `ot_region` VALUES ('610726', 3, '区县', 'n', 'nqx', '宁强县', '610700', 'ningqiangxian');
INSERT INTO `ot_region` VALUES ('610727', 3, '区县', 'l', 'lyx', '略阳县', '610700', 'lu:eyangxian');
INSERT INTO `ot_region` VALUES ('610728', 3, '区县', 'z', 'zbx', '镇巴县', '610700', 'zhenbaxian');
INSERT INTO `ot_region` VALUES ('610729', 3, '区县', 'l', 'lbx', '留坝县', '610700', 'liubaxian');
INSERT INTO `ot_region` VALUES ('610730', 3, '区县', 'f', 'fpx', '佛坪县', '610700', 'fopingxian');
INSERT INTO `ot_region` VALUES ('610800', 2, '城市', 'y', 'yls', '榆林市', '610000', 'yulinshi');
INSERT INTO `ot_region` VALUES ('610802', 3, '区县', 'y', 'yyq', '榆阳区', '610800', 'yuyangqu');
INSERT INTO `ot_region` VALUES ('610803', 3, '区县', 'h', 'hsq', '横山区', '610800', 'hengshanqu');
INSERT INTO `ot_region` VALUES ('610822', 3, '区县', 'f', 'fgx', '府谷县', '610800', 'fuguxian');
INSERT INTO `ot_region` VALUES ('610824', 3, '区县', 'j', 'jbx', '靖边县', '610800', 'jingbianxian');
INSERT INTO `ot_region` VALUES ('610825', 3, '区县', 'd', 'dbx', '定边县', '610800', 'dingbianxian');
INSERT INTO `ot_region` VALUES ('610826', 3, '区县', 's', 'sdx', '绥德县', '610800', 'suidexian');
INSERT INTO `ot_region` VALUES ('610827', 3, '区县', 'm', 'mzx', '米脂县', '610800', 'mizhixian');
INSERT INTO `ot_region` VALUES ('610828', 3, '区县', 'j', 'jx', '佳县', '610800', 'jiaxian');
INSERT INTO `ot_region` VALUES ('610829', 3, '区县', 'w', 'wbx', '吴堡县', '610800', 'wubaoxian');
INSERT INTO `ot_region` VALUES ('610830', 3, '区县', 'q', 'qjx', '清涧县', '610800', 'qingjianxian');
INSERT INTO `ot_region` VALUES ('610831', 3, '区县', 'z', 'zzx', '子洲县', '610800', 'zizhouxian');
INSERT INTO `ot_region` VALUES ('610881', 3, '区县', 's', 'sms', '神木市', '610800', 'shenmushi');
INSERT INTO `ot_region` VALUES ('610900', 2, '城市', 'a', 'aks', '安康市', '610000', 'ankangshi');
INSERT INTO `ot_region` VALUES ('610902', 3, '区县', 'h', 'hbq', '汉滨区', '610900', 'hanbinqu');
INSERT INTO `ot_region` VALUES ('610921', 3, '区县', 'h', 'hyx', '汉阴县', '610900', 'hanyinxian');
INSERT INTO `ot_region` VALUES ('610922', 3, '区县', 's', 'sqx', '石泉县', '610900', 'shiquanxian');
INSERT INTO `ot_region` VALUES ('610923', 3, '区县', 'n', 'nsx', '宁陕县', '610900', 'ningshanxian');
INSERT INTO `ot_region` VALUES ('610924', 3, '区县', 'z', 'zyx', '紫阳县', '610900', 'ziyangxian');
INSERT INTO `ot_region` VALUES ('610925', 3, '区县', 'l', 'lgx', '岚皋县', '610900', 'langaoxian');
INSERT INTO `ot_region` VALUES ('610926', 3, '区县', 'p', 'plx', '平利县', '610900', 'pinglixian');
INSERT INTO `ot_region` VALUES ('610927', 3, '区县', 'z', 'zpx', '镇坪县', '610900', 'zhenpingxian');
INSERT INTO `ot_region` VALUES ('610928', 3, '区县', 'x', 'xyx', '旬阳县', '610900', 'xunyangxian');
INSERT INTO `ot_region` VALUES ('610929', 3, '区县', 'b', 'bhx', '白河县', '610900', 'baihexian');
INSERT INTO `ot_region` VALUES ('611000', 2, '城市', 's', 'sls', '商洛市', '610000', 'shangluoshi');
INSERT INTO `ot_region` VALUES ('611002', 3, '区县', 's', 'szq', '商州区', '611000', 'shangzhouqu');
INSERT INTO `ot_region` VALUES ('611021', 3, '区县', 'l', 'lnx', '洛南县', '611000', 'luonanxian');
INSERT INTO `ot_region` VALUES ('611022', 3, '区县', 'd', 'dfx', '丹凤县', '611000', 'danfengxian');
INSERT INTO `ot_region` VALUES ('611023', 3, '区县', 's', 'snx', '商南县', '611000', 'shangnanxian');
INSERT INTO `ot_region` VALUES ('611024', 3, '区县', 's', 'syx', '山阳县', '611000', 'shanyangxian');
INSERT INTO `ot_region` VALUES ('611025', 3, '区县', 'z', 'zax', '镇安县', '611000', 'zhenanxian');
INSERT INTO `ot_region` VALUES ('611026', 3, '区县', 'z', 'zsx', '柞水县', '611000', 'zuoshuixian');
INSERT INTO `ot_region` VALUES ('620100', 2, '城市', 'l', 'lzs', '兰州市', '620000', 'lanzhoushi');
INSERT INTO `ot_region` VALUES ('620102', 3, '区县', 'c', 'cgq', '城关区', '620100', 'chengguanqu');
INSERT INTO `ot_region` VALUES ('620103', 3, '区县', 'q', 'qlhq', '七里河区', '620100', 'qilihequ');
INSERT INTO `ot_region` VALUES ('620104', 3, '区县', 'x', 'xgq', '西固区', '620100', 'xiguqu');
INSERT INTO `ot_region` VALUES ('620105', 3, '区县', 'a', 'anq', '安宁区', '620100', 'anningqu');
INSERT INTO `ot_region` VALUES ('620111', 3, '区县', 'h', 'hgq', '红古区', '620100', 'hongguqu');
INSERT INTO `ot_region` VALUES ('620121', 3, '区县', 'y', 'ydx', '永登县', '620100', 'yongdengxian');
INSERT INTO `ot_region` VALUES ('620122', 3, '区县', 'g', 'glx', '皋兰县', '620100', 'gaolanxian');
INSERT INTO `ot_region` VALUES ('620123', 3, '区县', 'y', 'yzx', '榆中县', '620100', 'yuzhongxian');
INSERT INTO `ot_region` VALUES ('620200', 2, '城市', 'j', 'jygs', '嘉峪关市', '620000', 'jiayuguanshi');
INSERT INTO `ot_region` VALUES ('620201', 3, '区县', 's', 'sxq', '市辖区', '620200', 'shixiaqu');
INSERT INTO `ot_region` VALUES ('620290', 3, '区县', 'x', 'xgq', '雄关区', '620200', 'xiongguanqu');
INSERT INTO `ot_region` VALUES ('620291', 3, '区县', 'z', 'zcq', '长城区', '620200', 'zhangchengqu');
INSERT INTO `ot_region` VALUES ('620292', 3, '区县', 'j', 'jtq', '镜铁区', '620200', 'jingtiequ');
INSERT INTO `ot_region` VALUES ('620293', 3, '区县', 'x', 'xcz', '新城镇', '620200', 'xinchengzhen');
INSERT INTO `ot_region` VALUES ('620294', 3, '区县', 'y', 'yqz', '峪泉镇', '620200', 'yuquanzhen');
INSERT INTO `ot_region` VALUES ('620295', 3, '区县', 'w', 'wsz', '文殊镇', '620200', 'wenshuzhen');
INSERT INTO `ot_region` VALUES ('620300', 2, '城市', 'j', 'jcs', '金昌市', '620000', 'jinchangshi');
INSERT INTO `ot_region` VALUES ('620302', 3, '区县', 'j', 'jcq', '金川区', '620300', 'jinchuanqu');
INSERT INTO `ot_region` VALUES ('620321', 3, '区县', 'y', 'ycx', '永昌县', '620300', 'yongchangxian');
INSERT INTO `ot_region` VALUES ('620400', 2, '城市', 'b', 'bys', '白银市', '620000', 'baiyinshi');
INSERT INTO `ot_region` VALUES ('620402', 3, '区县', 'b', 'byq', '白银区', '620400', 'baiyinqu');
INSERT INTO `ot_region` VALUES ('620403', 3, '区县', 'p', 'pcq', '平川区', '620400', 'pingchuanqu');
INSERT INTO `ot_region` VALUES ('620421', 3, '区县', 'j', 'jyx', '靖远县', '620400', 'jingyuanxian');
INSERT INTO `ot_region` VALUES ('620422', 3, '区县', 'h', 'hnx', '会宁县', '620400', 'huiningxian');
INSERT INTO `ot_region` VALUES ('620423', 3, '区县', 'j', 'jtx', '景泰县', '620400', 'jingtaixian');
INSERT INTO `ot_region` VALUES ('620500', 2, '城市', 't', 'tss', '天水市', '620000', 'tianshuishi');
INSERT INTO `ot_region` VALUES ('620502', 3, '区县', 'q', 'qzq', '秦州区', '620500', 'qinzhouqu');
INSERT INTO `ot_region` VALUES ('620503', 3, '区县', 'm', 'mjq', '麦积区', '620500', 'maijiqu');
INSERT INTO `ot_region` VALUES ('620521', 3, '区县', 'q', 'qsx', '清水县', '620500', 'qingshuixian');
INSERT INTO `ot_region` VALUES ('620522', 3, '区县', 'q', 'qax', '秦安县', '620500', 'qinanxian');
INSERT INTO `ot_region` VALUES ('620523', 3, '区县', 'g', 'ggx', '甘谷县', '620500', 'ganguxian');
INSERT INTO `ot_region` VALUES ('620524', 3, '区县', 'w', 'wsx', '武山县', '620500', 'wushanxian');
INSERT INTO `ot_region` VALUES ('620525', 3, '区县', 'z', 'zjchzzzx', '张家川回族自治县', '620500', 'zhangjiachuanhuizuzizhixian');
INSERT INTO `ot_region` VALUES ('620600', 2, '城市', 'w', 'wws', '武威市', '620000', 'wuweishi');
INSERT INTO `ot_region` VALUES ('620602', 3, '区县', 'l', 'lzq', '凉州区', '620600', 'liangzhouqu');
INSERT INTO `ot_region` VALUES ('620621', 3, '区县', 'm', 'mqx', '民勤县', '620600', 'minqinxian');
INSERT INTO `ot_region` VALUES ('620622', 3, '区县', 'g', 'glx', '古浪县', '620600', 'gulangxian');
INSERT INTO `ot_region` VALUES ('620623', 3, '区县', 't', 'tzzzzzx', '天祝藏族自治县', '620600', 'tianzhuzangzuzizhixian');
INSERT INTO `ot_region` VALUES ('620700', 2, '城市', 'z', 'zys', '张掖市', '620000', 'zhangyeshi');
INSERT INTO `ot_region` VALUES ('620702', 3, '区县', 'g', 'gzq', '甘州区', '620700', 'ganzhouqu');
INSERT INTO `ot_region` VALUES ('620721', 3, '区县', 's', 'snygzzzx', '肃南裕固族自治县', '620700', 'sunanyuguzuzizhixian');
INSERT INTO `ot_region` VALUES ('620722', 3, '区县', 'm', 'mlx', '民乐县', '620700', 'minlexian');
INSERT INTO `ot_region` VALUES ('620723', 3, '区县', 'l', 'lzx', '临泽县', '620700', 'linzexian');
INSERT INTO `ot_region` VALUES ('620724', 3, '区县', 'g', 'gtx', '高台县', '620700', 'gaotaixian');
INSERT INTO `ot_region` VALUES ('620725', 3, '区县', 's', 'sdx', '山丹县', '620700', 'shandanxian');
INSERT INTO `ot_region` VALUES ('620800', 2, '城市', 'p', 'pls', '平凉市', '620000', 'pingliangshi');
INSERT INTO `ot_region` VALUES ('620802', 3, '区县', 'k', 'ktq', '崆峒区', '620800', 'kongtongqu');
INSERT INTO `ot_region` VALUES ('620821', 3, '区县', 'j', 'jcx', '泾川县', '620800', 'jingchuanxian');
INSERT INTO `ot_region` VALUES ('620822', 3, '区县', 'l', 'ltx', '灵台县', '620800', 'lingtaixian');
INSERT INTO `ot_region` VALUES ('620823', 3, '区县', 'c', 'cxx', '崇信县', '620800', 'chongxinxian');
INSERT INTO `ot_region` VALUES ('620825', 3, '区县', 'z', 'zlx', '庄浪县', '620800', 'zhuanglangxian');
INSERT INTO `ot_region` VALUES ('620826', 3, '区县', 'j', 'jnx', '静宁县', '620800', 'jingningxian');
INSERT INTO `ot_region` VALUES ('620881', 3, '区县', 'h', 'hts', '华亭市', '620800', 'huatingshi');
INSERT INTO `ot_region` VALUES ('620900', 2, '城市', 'j', 'jqs', '酒泉市', '620000', 'jiuquanshi');
INSERT INTO `ot_region` VALUES ('620902', 3, '区县', 's', 'szq', '肃州区', '620900', 'suzhouqu');
INSERT INTO `ot_region` VALUES ('620921', 3, '区县', 'j', 'jtx', '金塔县', '620900', 'jintaxian');
INSERT INTO `ot_region` VALUES ('620922', 3, '区县', 'g', 'gzx', '瓜州县', '620900', 'guazhouxian');
INSERT INTO `ot_region` VALUES ('620923', 3, '区县', 's', 'sbmgzzzx', '肃北蒙古族自治县', '620900', 'subeimengguzuzizhixian');
INSERT INTO `ot_region` VALUES ('620924', 3, '区县', 'a', 'akshskzzzx', '阿克塞哈萨克族自治县', '620900', 'akesaihasakezuzizhixian');
INSERT INTO `ot_region` VALUES ('620981', 3, '区县', 'y', 'yms', '玉门市', '620900', 'yumenshi');
INSERT INTO `ot_region` VALUES ('620982', 3, '区县', 'd', 'dhs', '敦煌市', '620900', 'dunhuangshi');
INSERT INTO `ot_region` VALUES ('621000', 2, '城市', 'q', 'qys', '庆阳市', '620000', 'qingyangshi');
INSERT INTO `ot_region` VALUES ('621002', 3, '区县', 'x', 'xfq', '西峰区', '621000', 'xifengqu');
INSERT INTO `ot_region` VALUES ('621021', 3, '区县', 'q', 'qcx', '庆城县', '621000', 'qingchengxian');
INSERT INTO `ot_region` VALUES ('621022', 3, '区县', 'h', 'hx', '环县', '621000', 'huanxian');
INSERT INTO `ot_region` VALUES ('621023', 3, '区县', 'h', 'hcx', '华池县', '621000', 'huachixian');
INSERT INTO `ot_region` VALUES ('621024', 3, '区县', 'h', 'hsx', '合水县', '621000', 'heshuixian');
INSERT INTO `ot_region` VALUES ('621025', 3, '区县', 'z', 'znx', '正宁县', '621000', 'zhengningxian');
INSERT INTO `ot_region` VALUES ('621026', 3, '区县', 'n', 'nx', '宁县', '621000', 'ningxian');
INSERT INTO `ot_region` VALUES ('621027', 3, '区县', 'z', 'zyx', '镇原县', '621000', 'zhenyuanxian');
INSERT INTO `ot_region` VALUES ('621100', 2, '城市', 'd', 'dxs', '定西市', '620000', 'dingxishi');
INSERT INTO `ot_region` VALUES ('621102', 3, '区县', 'a', 'adq', '安定区', '621100', 'andingqu');
INSERT INTO `ot_region` VALUES ('621121', 3, '区县', 't', 'twx', '通渭县', '621100', 'tongweixian');
INSERT INTO `ot_region` VALUES ('621122', 3, '区县', 'l', 'lxx', '陇西县', '621100', 'longxixian');
INSERT INTO `ot_region` VALUES ('621123', 3, '区县', 'w', 'wyx', '渭源县', '621100', 'weiyuanxian');
INSERT INTO `ot_region` VALUES ('621124', 3, '区县', 'l', 'ltx', '临洮县', '621100', 'lintaoxian');
INSERT INTO `ot_region` VALUES ('621125', 3, '区县', 'z', 'zx', '漳县', '621100', 'zhangxian');
INSERT INTO `ot_region` VALUES ('621126', 3, '区县', 'm', 'mx', '岷县', '621100', 'minxian');
INSERT INTO `ot_region` VALUES ('621200', 2, '城市', 'l', 'lns', '陇南市', '620000', 'longnanshi');
INSERT INTO `ot_region` VALUES ('621202', 3, '区县', 'w', 'wdq', '武都区', '621200', 'wudouqu');
INSERT INTO `ot_region` VALUES ('621221', 3, '区县', 'c', 'cx', '成县', '621200', 'chengxian');
INSERT INTO `ot_region` VALUES ('621222', 3, '区县', 'w', 'wx', '文县', '621200', 'wenxian');
INSERT INTO `ot_region` VALUES ('621223', 3, '区县', 'd', 'dcx', '宕昌县', '621200', 'dangchangxian');
INSERT INTO `ot_region` VALUES ('621224', 3, '区县', 'k', 'kx', '康县', '621200', 'kangxian');
INSERT INTO `ot_region` VALUES ('621225', 3, '区县', 'x', 'xhx', '西和县', '621200', 'xihexian');
INSERT INTO `ot_region` VALUES ('621226', 3, '区县', 'l', 'lx', '礼县', '621200', 'lixian');
INSERT INTO `ot_region` VALUES ('621227', 3, '区县', 'h', 'hx', '徽县', '621200', 'huixian');
INSERT INTO `ot_region` VALUES ('621228', 3, '区县', 'l', 'ldx', '两当县', '621200', 'liangdangxian');
INSERT INTO `ot_region` VALUES ('622900', 2, '城市', 'l', 'lxhzzzz', '临夏回族自治州', '620000', 'linxiahuizuzizhizhou');
INSERT INTO `ot_region` VALUES ('622901', 3, '区县', 'l', 'lxs', '临夏市', '622900', 'linxiashi');
INSERT INTO `ot_region` VALUES ('622921', 3, '区县', 'l', 'lxx', '临夏县', '622900', 'linxiaxian');
INSERT INTO `ot_region` VALUES ('622922', 3, '区县', 'k', 'klx', '康乐县', '622900', 'kanglexian');
INSERT INTO `ot_region` VALUES ('622923', 3, '区县', 'y', 'yjx', '永靖县', '622900', 'yongjingxian');
INSERT INTO `ot_region` VALUES ('622924', 3, '区县', 'g', 'ghx', '广河县', '622900', 'guanghexian');
INSERT INTO `ot_region` VALUES ('622925', 3, '区县', 'h', 'hzx', '和政县', '622900', 'hezhengxian');
INSERT INTO `ot_region` VALUES ('622926', 3, '区县', 'd', 'dxzzzx', '东乡族自治县', '622900', 'dongxiangzuzizhixian');
INSERT INTO `ot_region` VALUES ('622927', 3, '区县', 'j', 'jssbazdxzslzzzx', '积石山保安族东乡族撒拉族自治县', '622900', 'jishishanbaoanzudongxiangzusalazuzizhixian');
INSERT INTO `ot_region` VALUES ('623000', 2, '城市', 'g', 'gnzzzzz', '甘南藏族自治州', '620000', 'gannanzangzuzizhizhou');
INSERT INTO `ot_region` VALUES ('623001', 3, '区县', 'h', 'hzs', '合作市', '623000', 'hezuoshi');
INSERT INTO `ot_region` VALUES ('623021', 3, '区县', 'l', 'ltx', '临潭县', '623000', 'lintanxian');
INSERT INTO `ot_region` VALUES ('623022', 3, '区县', 'z', 'znx', '卓尼县', '623000', 'zhuonixian');
INSERT INTO `ot_region` VALUES ('623023', 3, '区县', 'z', 'zqx', '舟曲县', '623000', 'zhouquxian');
INSERT INTO `ot_region` VALUES ('623024', 3, '区县', 'd', 'dbx', '迭部县', '623000', 'diebuxian');
INSERT INTO `ot_region` VALUES ('623025', 3, '区县', 'm', 'mqx', '玛曲县', '623000', 'maquxian');
INSERT INTO `ot_region` VALUES ('623026', 3, '区县', 'l', 'lqx', '碌曲县', '623000', 'liuquxian');
INSERT INTO `ot_region` VALUES ('623027', 3, '区县', 'x', 'xhx', '夏河县', '623000', 'xiahexian');
INSERT INTO `ot_region` VALUES ('630100', 2, '城市', 'x', 'xns', '西宁市', '630000', 'xiningshi');
INSERT INTO `ot_region` VALUES ('630102', 3, '区县', 'c', 'cdq', '城东区', '630100', 'chengdongqu');
INSERT INTO `ot_region` VALUES ('630103', 3, '区县', 'c', 'czq', '城中区', '630100', 'chengzhongqu');
INSERT INTO `ot_region` VALUES ('630104', 3, '区县', 'c', 'cxq', '城西区', '630100', 'chengxiqu');
INSERT INTO `ot_region` VALUES ('630105', 3, '区县', 'c', 'cbq', '城北区', '630100', 'chengbeiqu');
INSERT INTO `ot_region` VALUES ('630121', 3, '区县', 'd', 'dthztzzzx', '大通回族土族自治县', '630100', 'datonghuizutuzuzizhixian');
INSERT INTO `ot_region` VALUES ('630122', 3, '区县', 'h', 'hzx', '湟中县', '630100', 'huangzhongxian');
INSERT INTO `ot_region` VALUES ('630123', 3, '区县', 'h', 'hyx', '湟源县', '630100', 'huangyuanxian');
INSERT INTO `ot_region` VALUES ('630200', 2, '城市', 'h', 'hds', '海东市', '630000', 'haidongshi');
INSERT INTO `ot_region` VALUES ('630202', 3, '区县', 'l', 'ldq', '乐都区', '630200', 'ledouqu');
INSERT INTO `ot_region` VALUES ('630203', 3, '区县', 'p', 'paq', '平安区', '630200', 'pinganqu');
INSERT INTO `ot_region` VALUES ('630222', 3, '区县', 'm', 'mhhztzzzx', '民和回族土族自治县', '630200', 'minhehuizutuzuzizhixian');
INSERT INTO `ot_region` VALUES ('630223', 3, '区县', 'h', 'hztzzzx', '互助土族自治县', '630200', 'huzhutuzuzizhixian');
INSERT INTO `ot_region` VALUES ('630224', 3, '区县', 'h', 'hlhzzzx', '化隆回族自治县', '630200', 'hualonghuizuzizhixian');
INSERT INTO `ot_region` VALUES ('630225', 3, '区县', 'x', 'xhslzzzx', '循化撒拉族自治县', '630200', 'xunhuasalazuzizhixian');
INSERT INTO `ot_region` VALUES ('632200', 2, '城市', 'h', 'hbzzzzz', '海北藏族自治州', '630000', 'haibeizangzuzizhizhou');
INSERT INTO `ot_region` VALUES ('632221', 3, '区县', 'm', 'myhzzzx', '门源回族自治县', '632200', 'menyuanhuizuzizhixian');
INSERT INTO `ot_region` VALUES ('632222', 3, '区县', 'q', 'qlx', '祁连县', '632200', 'qilianxian');
INSERT INTO `ot_region` VALUES ('632223', 3, '区县', 'h', 'hyx', '海晏县', '632200', 'haiyanxian');
INSERT INTO `ot_region` VALUES ('632224', 3, '区县', 'g', 'gcx', '刚察县', '632200', 'gangchaxian');
INSERT INTO `ot_region` VALUES ('632300', 2, '城市', 'h', 'hnzzzzz', '黄南藏族自治州', '630000', 'huangnanzangzuzizhizhou');
INSERT INTO `ot_region` VALUES ('632321', 3, '区县', 't', 'trx', '同仁县', '632300', 'tongrenxian');
INSERT INTO `ot_region` VALUES ('632322', 3, '区县', 'j', 'jzx', '尖扎县', '632300', 'jianzhaxian');
INSERT INTO `ot_region` VALUES ('632323', 3, '区县', 'z', 'zkx', '泽库县', '632300', 'zekuxian');
INSERT INTO `ot_region` VALUES ('632324', 3, '区县', 'h', 'hnmgzzzx', '河南蒙古族自治县', '632300', 'henanmengguzuzizhixian');
INSERT INTO `ot_region` VALUES ('632500', 2, '城市', 'h', 'hnzzzzz', '海南藏族自治州', '630000', 'hainanzangzuzizhizhou');
INSERT INTO `ot_region` VALUES ('632521', 3, '区县', 'g', 'ghx', '共和县', '632500', 'gonghexian');
INSERT INTO `ot_region` VALUES ('632522', 3, '区县', 't', 'tdx', '同德县', '632500', 'tongdexian');
INSERT INTO `ot_region` VALUES ('632523', 3, '区县', 'g', 'gdx', '贵德县', '632500', 'guidexian');
INSERT INTO `ot_region` VALUES ('632524', 3, '区县', 'x', 'xhx', '兴海县', '632500', 'xinghaixian');
INSERT INTO `ot_region` VALUES ('632525', 3, '区县', 'g', 'gnx', '贵南县', '632500', 'guinanxian');
INSERT INTO `ot_region` VALUES ('632600', 2, '城市', 'g', 'glzzzzz', '果洛藏族自治州', '630000', 'guoluozangzuzizhizhou');
INSERT INTO `ot_region` VALUES ('632621', 3, '区县', 'm', 'mqx', '玛沁县', '632600', 'maqinxian');
INSERT INTO `ot_region` VALUES ('632622', 3, '区县', 'b', 'bmx', '班玛县', '632600', 'banmaxian');
INSERT INTO `ot_region` VALUES ('632623', 3, '区县', 'g', 'gdx', '甘德县', '632600', 'gandexian');
INSERT INTO `ot_region` VALUES ('632624', 3, '区县', 'd', 'drx', '达日县', '632600', 'darixian');
INSERT INTO `ot_region` VALUES ('632625', 3, '区县', 'j', 'jzx', '久治县', '632600', 'jiuzhixian');
INSERT INTO `ot_region` VALUES ('632626', 3, '区县', 'm', 'mdx', '玛多县', '632600', 'maduoxian');
INSERT INTO `ot_region` VALUES ('632700', 2, '城市', 'y', 'yszzzzz', '玉树藏族自治州', '630000', 'yushuzangzuzizhizhou');
INSERT INTO `ot_region` VALUES ('632701', 3, '区县', 'y', 'yss', '玉树市', '632700', 'yushushi');
INSERT INTO `ot_region` VALUES ('632722', 3, '区县', 'z', 'zdx', '杂多县', '632700', 'zaduoxian');
INSERT INTO `ot_region` VALUES ('632723', 3, '区县', 'c', 'cdx', '称多县', '632700', 'chengduoxian');
INSERT INTO `ot_region` VALUES ('632724', 3, '区县', 'z', 'zdx', '治多县', '632700', 'zhiduoxian');
INSERT INTO `ot_region` VALUES ('632725', 3, '区县', 'n', 'nqx', '囊谦县', '632700', 'nangqianxian');
INSERT INTO `ot_region` VALUES ('632726', 3, '区县', 'q', 'qmlx', '曲麻莱县', '632700', 'qumalaixian');
INSERT INTO `ot_region` VALUES ('632800', 2, '城市', 'h', 'hxmgzzzzzz', '海西蒙古族藏族自治州', '630000', 'haiximengguzuzangzuzizhizhou');
INSERT INTO `ot_region` VALUES ('632801', 3, '区县', 'g', 'gems', '格尔木市', '632800', 'geermushi');
INSERT INTO `ot_region` VALUES ('632802', 3, '区县', 'd', 'dlhs', '德令哈市', '632800', 'delinghashi');
INSERT INTO `ot_region` VALUES ('632803', 3, '区县', 'm', 'mys', '茫崖市', '632800', 'mangyashi');
INSERT INTO `ot_region` VALUES ('632821', 3, '区县', 'w', 'wlx', '乌兰县', '632800', 'wulanxian');
INSERT INTO `ot_region` VALUES ('632822', 3, '区县', 'd', 'dlx', '都兰县', '632800', 'doulanxian');
INSERT INTO `ot_region` VALUES ('632823', 3, '区县', 't', 'tjx', '天峻县', '632800', 'tianjunxian');
INSERT INTO `ot_region` VALUES ('640100', 2, '城市', 'y', 'ycs', '银川市', '640000', 'yinchuanshi');
INSERT INTO `ot_region` VALUES ('640104', 3, '区县', 'x', 'xqq', '兴庆区', '640100', 'xingqingqu');
INSERT INTO `ot_region` VALUES ('640105', 3, '区县', 'x', 'xxq', '西夏区', '640100', 'xixiaqu');
INSERT INTO `ot_region` VALUES ('640106', 3, '区县', 'j', 'jfq', '金凤区', '640100', 'jinfengqu');
INSERT INTO `ot_region` VALUES ('640121', 3, '区县', 'y', 'ynx', '永宁县', '640100', 'yongningxian');
INSERT INTO `ot_region` VALUES ('640122', 3, '区县', 'h', 'hlx', '贺兰县', '640100', 'helanxian');
INSERT INTO `ot_region` VALUES ('640181', 3, '区县', 'l', 'lws', '灵武市', '640100', 'lingwushi');
INSERT INTO `ot_region` VALUES ('640200', 2, '城市', 's', 'szss', '石嘴山市', '640000', 'shizuishanshi');
INSERT INTO `ot_region` VALUES ('640202', 3, '区县', 'd', 'dwkq', '大武口区', '640200', 'dawukouqu');
INSERT INTO `ot_region` VALUES ('640205', 3, '区县', 'h', 'hnq', '惠农区', '640200', 'huinongqu');
INSERT INTO `ot_region` VALUES ('640221', 3, '区县', 'p', 'plx', '平罗县', '640200', 'pingluoxian');
INSERT INTO `ot_region` VALUES ('640300', 2, '城市', 'w', 'wzs', '吴忠市', '640000', 'wuzhongshi');
INSERT INTO `ot_region` VALUES ('640302', 3, '区县', 'l', 'ltq', '利通区', '640300', 'litongqu');
INSERT INTO `ot_region` VALUES ('640303', 3, '区县', 'h', 'hsbq', '红寺堡区', '640300', 'hongsibaoqu');
INSERT INTO `ot_region` VALUES ('640323', 3, '区县', 'y', 'ycx', '盐池县', '640300', 'yanchixian');
INSERT INTO `ot_region` VALUES ('640324', 3, '区县', 't', 'txx', '同心县', '640300', 'tongxinxian');
INSERT INTO `ot_region` VALUES ('640381', 3, '区县', 'q', 'qtxs', '青铜峡市', '640300', 'qingtongxiashi');
INSERT INTO `ot_region` VALUES ('640400', 2, '城市', 'g', 'gys', '固原市', '640000', 'guyuanshi');
INSERT INTO `ot_region` VALUES ('640402', 3, '区县', 'y', 'yzq', '原州区', '640400', 'yuanzhouqu');
INSERT INTO `ot_region` VALUES ('640422', 3, '区县', 'x', 'xjx', '西吉县', '640400', 'xijixian');
INSERT INTO `ot_region` VALUES ('640423', 3, '区县', 'l', 'ldx', '隆德县', '640400', 'longdexian');
INSERT INTO `ot_region` VALUES ('640424', 3, '区县', 'j', 'jyx', '泾源县', '640400', 'jingyuanxian');
INSERT INTO `ot_region` VALUES ('640425', 3, '区县', 'p', 'pyx', '彭阳县', '640400', 'pengyangxian');
INSERT INTO `ot_region` VALUES ('640500', 2, '城市', 'z', 'zws', '中卫市', '640000', 'zhongweishi');
INSERT INTO `ot_region` VALUES ('640502', 3, '区县', 's', 'sptq', '沙坡头区', '640500', 'shapotouqu');
INSERT INTO `ot_region` VALUES ('640521', 3, '区县', 'z', 'znx', '中宁县', '640500', 'zhongningxian');
INSERT INTO `ot_region` VALUES ('640522', 3, '区县', 'h', 'hyx', '海原县', '640500', 'haiyuanxian');
INSERT INTO `ot_region` VALUES ('650100', 2, '城市', 'w', 'wlmqs', '乌鲁木齐市', '650000', 'wulumuqishi');
INSERT INTO `ot_region` VALUES ('650102', 3, '区县', 't', 'tsq', '天山区', '650100', 'tianshanqu');
INSERT INTO `ot_region` VALUES ('650103', 3, '区县', 's', 'sybkq', '沙依巴克区', '650100', 'shayibakequ');
INSERT INTO `ot_region` VALUES ('650104', 3, '区县', 'x', 'xsq', '新市区', '650100', 'xinshiqu');
INSERT INTO `ot_region` VALUES ('650105', 3, '区县', 's', 'smgq', '水磨沟区', '650100', 'shuimogouqu');
INSERT INTO `ot_region` VALUES ('650106', 3, '区县', 't', 'tthq', '头屯河区', '650100', 'toutunhequ');
INSERT INTO `ot_region` VALUES ('650107', 3, '区县', 'd', 'dbcq', '达坂城区', '650100', 'dabanchengqu');
INSERT INTO `ot_region` VALUES ('650109', 3, '区县', 'm', 'mdq', '米东区', '650100', 'midongqu');
INSERT INTO `ot_region` VALUES ('650121', 3, '区县', 'w', 'wlmqx', '乌鲁木齐县', '650100', 'wulumuqixian');
INSERT INTO `ot_region` VALUES ('650200', 2, '城市', 'k', 'klmys', '克拉玛依市', '650000', 'kelamayishi');
INSERT INTO `ot_region` VALUES ('650202', 3, '区县', 'd', 'dszq', '独山子区', '650200', 'dushanziqu');
INSERT INTO `ot_region` VALUES ('650203', 3, '区县', 'k', 'klmyq', '克拉玛依区', '650200', 'kelamayiqu');
INSERT INTO `ot_region` VALUES ('650204', 3, '区县', 'b', 'bjtq', '白碱滩区', '650200', 'baijiantanqu');
INSERT INTO `ot_region` VALUES ('650205', 3, '区县', 'w', 'wehq', '乌尔禾区', '650200', 'wuerhequ');
INSERT INTO `ot_region` VALUES ('650400', 2, '城市', 't', 'tlfs', '吐鲁番市', '650000', 'tulufanshi');
INSERT INTO `ot_region` VALUES ('650402', 3, '区县', 'g', 'gcq', '高昌区', '650400', 'gaochangqu');
INSERT INTO `ot_region` VALUES ('650421', 3, '区县', 's', 'ssx', '鄯善县', '650400', 'shanshanxian');
INSERT INTO `ot_region` VALUES ('650422', 3, '区县', 't', 'tkxx', '托克逊县', '650400', 'tuokexunxian');
INSERT INTO `ot_region` VALUES ('650500', 2, '城市', 'h', 'hms', '哈密市', '650000', 'hamishi');
INSERT INTO `ot_region` VALUES ('650502', 3, '区县', 'y', 'yzq', '伊州区', '650500', 'yizhouqu');
INSERT INTO `ot_region` VALUES ('650521', 3, '区县', 'b', 'blkhskzzx', '巴里坤哈萨克自治县', '650500', 'balikunhasakezizhixian');
INSERT INTO `ot_region` VALUES ('650522', 3, '区县', 'y', 'ywx', '伊吾县', '650500', 'yiwuxian');
INSERT INTO `ot_region` VALUES ('652300', 2, '城市', 'c', 'cjhzzzz', '昌吉回族自治州', '650000', 'changjihuizuzizhizhou');
INSERT INTO `ot_region` VALUES ('652301', 3, '区县', 'c', 'cjs', '昌吉市', '652300', 'changjishi');
INSERT INTO `ot_region` VALUES ('652302', 3, '区县', 'f', 'fks', '阜康市', '652300', 'fukangshi');
INSERT INTO `ot_region` VALUES ('652323', 3, '区县', 'h', 'htbx', '呼图壁县', '652300', 'hutubixian');
INSERT INTO `ot_region` VALUES ('652324', 3, '区县', 'm', 'mnsx', '玛纳斯县', '652300', 'manasixian');
INSERT INTO `ot_region` VALUES ('652325', 3, '区县', 'q', 'qtx', '奇台县', '652300', 'qitaixian');
INSERT INTO `ot_region` VALUES ('652327', 3, '区县', 'j', 'jmsex', '吉木萨尔县', '652300', 'jimusaerxian');
INSERT INTO `ot_region` VALUES ('652328', 3, '区县', 'm', 'mlhskzzx', '木垒哈萨克自治县', '652300', 'muleihasakezizhixian');
INSERT INTO `ot_region` VALUES ('652700', 2, '城市', 'b', 'betlmgzzz', '博尔塔拉蒙古自治州', '650000', 'boertalamengguzizhizhou');
INSERT INTO `ot_region` VALUES ('652701', 3, '区县', 'b', 'bls', '博乐市', '652700', 'boleshi');
INSERT INTO `ot_region` VALUES ('652702', 3, '区县', 'a', 'alsks', '阿拉山口市', '652700', 'alashankoushi');
INSERT INTO `ot_region` VALUES ('652722', 3, '区县', 'j', 'jhx', '精河县', '652700', 'jinghexian');
INSERT INTO `ot_region` VALUES ('652723', 3, '区县', 'w', 'wqx', '温泉县', '652700', 'wenquanxian');
INSERT INTO `ot_region` VALUES ('652800', 2, '城市', 'b', 'byglmgzzz', '巴音郭楞蒙古自治州', '650000', 'bayinguolengmengguzizhizhou');
INSERT INTO `ot_region` VALUES ('652801', 3, '区县', 'k', 'kels', '库尔勒市', '652800', 'kuerleshi');
INSERT INTO `ot_region` VALUES ('652822', 3, '区县', 'l', 'ltx', '轮台县', '652800', 'luntaixian');
INSERT INTO `ot_region` VALUES ('652823', 3, '区县', 'w', 'wlx', '尉犁县', '652800', 'weilixian');
INSERT INTO `ot_region` VALUES ('652824', 3, '区县', 'r', 'rqx', '若羌县', '652800', 'ruoqiangxian');
INSERT INTO `ot_region` VALUES ('652825', 3, '区县', 'q', 'qmx', '且末县', '652800', 'qiemoxian');
INSERT INTO `ot_region` VALUES ('652826', 3, '区县', 'y', 'yqhzzzx', '焉耆回族自治县', '652800', 'yanqihuizuzizhixian');
INSERT INTO `ot_region` VALUES ('652827', 3, '区县', 'h', 'hjx', '和静县', '652800', 'hejingxian');
INSERT INTO `ot_region` VALUES ('652828', 3, '区县', 'h', 'hsx', '和硕县', '652800', 'heshuoxian');
INSERT INTO `ot_region` VALUES ('652829', 3, '区县', 'b', 'bhx', '博湖县', '652800', 'bohuxian');
INSERT INTO `ot_region` VALUES ('652900', 2, '城市', 'a', 'aksdq', '阿克苏地区', '650000', 'akesudiqu');
INSERT INTO `ot_region` VALUES ('652901', 3, '区县', 'a', 'akss', '阿克苏市', '652900', 'akesushi');
INSERT INTO `ot_region` VALUES ('652922', 3, '区县', 'w', 'wsx', '温宿县', '652900', 'wensuxian');
INSERT INTO `ot_region` VALUES ('652923', 3, '区县', 'k', 'kcx', '库车县', '652900', 'kuchexian');
INSERT INTO `ot_region` VALUES ('652924', 3, '区县', 's', 'syx', '沙雅县', '652900', 'shayaxian');
INSERT INTO `ot_region` VALUES ('652925', 3, '区县', 'x', 'xhx', '新和县', '652900', 'xinhexian');
INSERT INTO `ot_region` VALUES ('652926', 3, '区县', 'b', 'bcx', '拜城县', '652900', 'baichengxian');
INSERT INTO `ot_region` VALUES ('652927', 3, '区县', 'w', 'wsx', '乌什县', '652900', 'wushenxian');
INSERT INTO `ot_region` VALUES ('652928', 3, '区县', 'a', 'awtx', '阿瓦提县', '652900', 'awatixian');
INSERT INTO `ot_region` VALUES ('652929', 3, '区县', 'k', 'kpx', '柯坪县', '652900', 'kepingxian');
INSERT INTO `ot_region` VALUES ('653000', 2, '城市', 'k', 'kzlskekzzzz', '克孜勒苏柯尔克孜自治州', '650000', 'kezilesukeerkezizizhizhou');
INSERT INTO `ot_region` VALUES ('653001', 3, '区县', 'a', 'atss', '阿图什市', '653000', 'atushenshi');
INSERT INTO `ot_region` VALUES ('653022', 3, '区县', 'a', 'aktx', '阿克陶县', '653000', 'aketaoxian');
INSERT INTO `ot_region` VALUES ('653023', 3, '区县', 'a', 'ahqx', '阿合奇县', '653000', 'aheqixian');
INSERT INTO `ot_region` VALUES ('653024', 3, '区县', 'w', 'wqx', '乌恰县', '653000', 'wuqiaxian');
INSERT INTO `ot_region` VALUES ('653100', 2, '城市', 'k', 'ksdq', '喀什地区', '650000', 'kashendiqu');
INSERT INTO `ot_region` VALUES ('653101', 3, '区县', 'k', 'kss', '喀什市', '653100', 'kashenshi');
INSERT INTO `ot_region` VALUES ('653121', 3, '区县', 's', 'sfx', '疏附县', '653100', 'shufuxian');
INSERT INTO `ot_region` VALUES ('653122', 3, '区县', 's', 'slx', '疏勒县', '653100', 'shulexian');
INSERT INTO `ot_region` VALUES ('653123', 3, '区县', 'y', 'yjsx', '英吉沙县', '653100', 'yingjishaxian');
INSERT INTO `ot_region` VALUES ('653124', 3, '区县', 'z', 'zpx', '泽普县', '653100', 'zepuxian');
INSERT INTO `ot_region` VALUES ('653125', 3, '区县', 's', 'scx', '莎车县', '653100', 'shachexian');
INSERT INTO `ot_region` VALUES ('653126', 3, '区县', 'y', 'ycx', '叶城县', '653100', 'yechengxian');
INSERT INTO `ot_region` VALUES ('653127', 3, '区县', 'm', 'mgtx', '麦盖提县', '653100', 'maigaitixian');
INSERT INTO `ot_region` VALUES ('653128', 3, '区县', 'y', 'yphx', '岳普湖县', '653100', 'yuepuhuxian');
INSERT INTO `ot_region` VALUES ('653129', 3, '区县', 'j', 'jsx', '伽师县', '653100', 'jiashixian');
INSERT INTO `ot_region` VALUES ('653130', 3, '区县', 'b', 'bcx', '巴楚县', '653100', 'bachuxian');
INSERT INTO `ot_region` VALUES ('653131', 3, '区县', 't', 'tskegtjkzzx', '塔什库尔干塔吉克自治县', '653100', 'tashenkuergantajikezizhixian');
INSERT INTO `ot_region` VALUES ('653200', 2, '城市', 'h', 'htdq', '和田地区', '650000', 'hetiandiqu');
INSERT INTO `ot_region` VALUES ('653201', 3, '区县', 'h', 'hts', '和田市', '653200', 'hetianshi');
INSERT INTO `ot_region` VALUES ('653221', 3, '区县', 'h', 'htx', '和田县', '653200', 'hetianxian');
INSERT INTO `ot_region` VALUES ('653222', 3, '区县', 'm', 'myx', '墨玉县', '653200', 'moyuxian');
INSERT INTO `ot_region` VALUES ('653223', 3, '区县', 'p', 'psx', '皮山县', '653200', 'pishanxian');
INSERT INTO `ot_region` VALUES ('653224', 3, '区县', 'l', 'lpx', '洛浦县', '653200', 'luopuxian');
INSERT INTO `ot_region` VALUES ('653225', 3, '区县', 'c', 'clx', '策勒县', '653200', 'celexian');
INSERT INTO `ot_region` VALUES ('653226', 3, '区县', 'y', 'ytx', '于田县', '653200', 'yutianxian');
INSERT INTO `ot_region` VALUES ('653227', 3, '区县', 'm', 'mfx', '民丰县', '653200', 'minfengxian');
INSERT INTO `ot_region` VALUES ('654000', 2, '城市', 'y', 'ylhskzzz', '伊犁哈萨克自治州', '650000', 'yilihasakezizhizhou');
INSERT INTO `ot_region` VALUES ('654002', 3, '区县', 'y', 'yns', '伊宁市', '654000', 'yiningshi');
INSERT INTO `ot_region` VALUES ('654003', 3, '区县', 'k', 'kts', '奎屯市', '654000', 'kuitunshi');
INSERT INTO `ot_region` VALUES ('654004', 3, '区县', 'h', 'hegss', '霍尔果斯市', '654000', 'huoerguosishi');
INSERT INTO `ot_region` VALUES ('654021', 3, '区县', 'y', 'ynx', '伊宁县', '654000', 'yiningxian');
INSERT INTO `ot_region` VALUES ('654022', 3, '区县', 'c', 'cbcexbzzx', '察布查尔锡伯自治县', '654000', 'chabuchaerxibozizhixian');
INSERT INTO `ot_region` VALUES ('654023', 3, '区县', 'h', 'hcx', '霍城县', '654000', 'huochengxian');
INSERT INTO `ot_region` VALUES ('654024', 3, '区县', 'g', 'glx', '巩留县', '654000', 'gongliuxian');
INSERT INTO `ot_region` VALUES ('654025', 3, '区县', 'x', 'xyx', '新源县', '654000', 'xinyuanxian');
INSERT INTO `ot_region` VALUES ('654026', 3, '区县', 'z', 'zsx', '昭苏县', '654000', 'zhaosuxian');
INSERT INTO `ot_region` VALUES ('654027', 3, '区县', 't', 'tksx', '特克斯县', '654000', 'tekesixian');
INSERT INTO `ot_region` VALUES ('654028', 3, '区县', 'n', 'nlkx', '尼勒克县', '654000', 'nilekexian');
INSERT INTO `ot_region` VALUES ('654200', 2, '城市', 't', 'tcdq', '塔城地区', '650000', 'tachengdiqu');
INSERT INTO `ot_region` VALUES ('654201', 3, '区县', 't', 'tcs', '塔城市', '654200', 'tachengshi');
INSERT INTO `ot_region` VALUES ('654202', 3, '区县', 'w', 'wss', '乌苏市', '654200', 'wusushi');
INSERT INTO `ot_region` VALUES ('654221', 3, '区县', 'e', 'emx', '额敏县', '654200', 'eminxian');
INSERT INTO `ot_region` VALUES ('654223', 3, '区县', 's', 'swx', '沙湾县', '654200', 'shawanxian');
INSERT INTO `ot_region` VALUES ('654224', 3, '区县', 't', 'tlx', '托里县', '654200', 'tuolixian');
INSERT INTO `ot_region` VALUES ('654225', 3, '区县', 'y', 'ymx', '裕民县', '654200', 'yuminxian');
INSERT INTO `ot_region` VALUES ('654226', 3, '区县', 'h', 'hbksemgzzx', '和布克赛尔蒙古自治县', '654200', 'hebukesaiermengguzizhixian');
INSERT INTO `ot_region` VALUES ('654300', 2, '城市', 'a', 'altdq', '阿勒泰地区', '650000', 'aletaidiqu');
INSERT INTO `ot_region` VALUES ('654301', 3, '区县', 'a', 'alts', '阿勒泰市', '654300', 'aletaishi');
INSERT INTO `ot_region` VALUES ('654321', 3, '区县', 'b', 'bejx', '布尔津县', '654300', 'buerjinxian');
INSERT INTO `ot_region` VALUES ('654322', 3, '区县', 'f', 'fyx', '富蕴县', '654300', 'fuyunxian');
INSERT INTO `ot_region` VALUES ('654323', 3, '区县', 'f', 'fhx', '福海县', '654300', 'fuhaixian');
INSERT INTO `ot_region` VALUES ('654324', 3, '区县', 'h', 'hbhx', '哈巴河县', '654300', 'habahexian');
INSERT INTO `ot_region` VALUES ('654325', 3, '区县', 'q', 'qhx', '青河县', '654300', 'qinghexian');
INSERT INTO `ot_region` VALUES ('654326', 3, '区县', 'j', 'jmnx', '吉木乃县', '654300', 'jimunaixian');
INSERT INTO `ot_region` VALUES ('659000', 2, '城市', 'z', 'zzqzxxjxzqh', '自治区直辖县级行政区划', '650000', 'zizhiquzhixiaxianjixingzhengquhua');
INSERT INTO `ot_region` VALUES ('659001', 3, '区县', 's', 'shzs', '石河子市', '659000', 'shihezishi');
INSERT INTO `ot_region` VALUES ('659002', 3, '区县', 'a', 'ales', '阿拉尔市', '659000', 'alaershi');
INSERT INTO `ot_region` VALUES ('659003', 3, '区县', 't', 'tmsks', '图木舒克市', '659000', 'tumushukeshi');
INSERT INTO `ot_region` VALUES ('659004', 3, '区县', 'w', 'wjqs', '五家渠市', '659000', 'wujiaqushi');
INSERT INTO `ot_region` VALUES ('659005', 3, '区县', 'b', 'bts', '北屯市', '659000', 'beitunshi');
INSERT INTO `ot_region` VALUES ('659006', 3, '区县', 't', 'tmgs', '铁门关市', '659000', 'tiemenguanshi');
INSERT INTO `ot_region` VALUES ('659007', 3, '区县', 's', 'shs', '双河市', '659000', 'shuangheshi');
INSERT INTO `ot_region` VALUES ('659008', 3, '区县', 'k', 'kkdls', '可克达拉市', '659000', 'kekedalashi');
INSERT INTO `ot_region` VALUES ('659009', 3, '区县', 'k', 'kys', '昆玉市', '659000', 'kunyushi');
INSERT INTO `ot_region` VALUES ('710100', 2, '城市', 't', 'tbs', '台北市', '710000', 'taibeishi');
INSERT INTO `ot_region` VALUES ('710101', 3, '区县', 'z', 'zzq', '中正区', '710100', 'zhongzhengqu');
INSERT INTO `ot_region` VALUES ('710102', 3, '区县', 'd', 'dtq', '大同区', '710100', 'datongqu');
INSERT INTO `ot_region` VALUES ('710103', 3, '区县', 'z', 'zsq', '中山区', '710100', 'zhongshanqu');
INSERT INTO `ot_region` VALUES ('710104', 3, '区县', 's', 'ssq', '松山区', '710100', 'songshanqu');
INSERT INTO `ot_region` VALUES ('710105', 3, '区县', 'd', 'daq', '大安区', '710100', 'daanqu');
INSERT INTO `ot_region` VALUES ('710106', 3, '区县', 'w', 'whq', '万华区', '710100', 'wanhuaqu');
INSERT INTO `ot_region` VALUES ('710107', 3, '区县', 'x', 'xyq', '信义区', '710100', 'xinyiqu');
INSERT INTO `ot_region` VALUES ('710108', 3, '区县', 's', 'slq', '士林区', '710100', 'shilinqu');
INSERT INTO `ot_region` VALUES ('710109', 3, '区县', 'b', 'btq', '北投区', '710100', 'beitouqu');
INSERT INTO `ot_region` VALUES ('710110', 3, '区县', 'n', 'nhq', '内湖区', '710100', 'neihuqu');
INSERT INTO `ot_region` VALUES ('710111', 3, '区县', 'n', 'ngq', '南港区', '710100', 'nangangqu');
INSERT INTO `ot_region` VALUES ('710112', 3, '区县', 'w', 'wsq', '文山区', '710100', 'wenshanqu');
INSERT INTO `ot_region` VALUES ('710199', 3, '区县', 'q', 'qtq', '其它区', '710100', 'qitaqu');
INSERT INTO `ot_region` VALUES ('710200', 2, '城市', 'g', 'gxs', '高雄市', '710000', 'gaoxiongshi');
INSERT INTO `ot_region` VALUES ('710201', 3, '区县', 'x', 'xxq', '新兴区', '710200', 'xinxingqu');
INSERT INTO `ot_region` VALUES ('710202', 3, '区县', 'q', 'qjq', '前金区', '710200', 'qianjinqu');
INSERT INTO `ot_region` VALUES ('710203', 3, '区县', 'q', 'qyq', '芩雅区', '710200', 'qinyaqu');
INSERT INTO `ot_region` VALUES ('710204', 3, '区县', 'y', 'ycq', '盐埕区', '710200', 'yanchengqu');
INSERT INTO `ot_region` VALUES ('710205', 3, '区县', 'g', 'gsq', '鼓山区', '710200', 'gushanqu');
INSERT INTO `ot_region` VALUES ('710206', 3, '区县', 'q', 'qjq', '旗津区', '710200', 'qijinqu');
INSERT INTO `ot_region` VALUES ('710207', 3, '区县', 'q', 'qzq', '前镇区', '710200', 'qianzhenqu');
INSERT INTO `ot_region` VALUES ('710208', 3, '区县', 's', 'smq', '三民区', '710200', 'sanminqu');
INSERT INTO `ot_region` VALUES ('710209', 3, '区县', 'z', 'zyq', '左营区', '710200', 'zuoyingqu');
INSERT INTO `ot_region` VALUES ('710210', 3, '区县', 'n', 'nzq', '楠梓区', '710200', 'nanziqu');
INSERT INTO `ot_region` VALUES ('710211', 3, '区县', 'x', 'xgq', '小港区', '710200', 'xiaogangqu');
INSERT INTO `ot_region` VALUES ('710241', 3, '区县', 'l', 'lyq', '苓雅区', '710200', 'lingyaqu');
INSERT INTO `ot_region` VALUES ('710242', 3, '区县', 'r', 'rwq', '仁武区', '710200', 'renwuqu');
INSERT INTO `ot_region` VALUES ('710243', 3, '区县', 'd', 'dsq', '大社区', '710200', 'dashequ');
INSERT INTO `ot_region` VALUES ('710244', 3, '区县', 'g', 'gsq', '冈山区', '710200', 'gangshanqu');
INSERT INTO `ot_region` VALUES ('710245', 3, '区县', 'l', 'lzq', '路竹区', '710200', 'luzhuqu');
INSERT INTO `ot_region` VALUES ('710246', 3, '区县', 'a', 'alq', '阿莲区', '710200', 'alianqu');
INSERT INTO `ot_region` VALUES ('710247', 3, '区县', 't', 'tlq', '田寮区', '710200', 'tianliaoqu');
INSERT INTO `ot_region` VALUES ('710248', 3, '区县', 'y', 'ycq', '燕巢区', '710200', 'yanchaoqu');
INSERT INTO `ot_region` VALUES ('710249', 3, '区县', 'q', 'qtq', '桥头区', '710200', 'qiaotouqu');
INSERT INTO `ot_region` VALUES ('710250', 3, '区县', 'z', 'zgq', '梓官区', '710200', 'ziguanqu');
INSERT INTO `ot_region` VALUES ('710251', 3, '区县', 'm', 'mtq', '弥陀区', '710200', 'mituoqu');
INSERT INTO `ot_region` VALUES ('710252', 3, '区县', 'y', 'yaq', '永安区', '710200', 'yonganqu');
INSERT INTO `ot_region` VALUES ('710253', 3, '区县', 'h', 'hnq', '湖内区', '710200', 'huneiqu');
INSERT INTO `ot_region` VALUES ('710254', 3, '区县', 'f', 'fsq', '凤山区', '710200', 'fengshanqu');
INSERT INTO `ot_region` VALUES ('710255', 3, '区县', 'd', 'dlq', '大寮区', '710200', 'daliaoqu');
INSERT INTO `ot_region` VALUES ('710256', 3, '区县', 'l', 'lyq', '林园区', '710200', 'linyuanqu');
INSERT INTO `ot_region` VALUES ('710257', 3, '区县', 'n', 'nsq', '鸟松区', '710200', 'niaosongqu');
INSERT INTO `ot_region` VALUES ('710258', 3, '区县', 'd', 'dsq', '大树区', '710200', 'dashuqu');
INSERT INTO `ot_region` VALUES ('710259', 3, '区县', 'q', 'qsq', '旗山区', '710200', 'qishanqu');
INSERT INTO `ot_region` VALUES ('710260', 3, '区县', 'm', 'mnq', '美浓区', '710200', 'meinongqu');
INSERT INTO `ot_region` VALUES ('710261', 3, '区县', 'l', 'lgq', '六龟区', '710200', 'liuguiqu');
INSERT INTO `ot_region` VALUES ('710262', 3, '区县', 'n', 'nmq', '内门区', '710200', 'neimenqu');
INSERT INTO `ot_region` VALUES ('710263', 3, '区县', 's', 'slq', '杉林区', '710200', 'shanlinqu');
INSERT INTO `ot_region` VALUES ('710264', 3, '区县', 'j', 'jxq', '甲仙区', '710200', 'jiaxianqu');
INSERT INTO `ot_region` VALUES ('710265', 3, '区县', 't', 'tyq', '桃源区', '710200', 'taoyuanqu');
INSERT INTO `ot_region` VALUES ('710266', 3, '区县', 'n', 'nmxq', '那玛夏区', '710200', 'neimaxiaqu');
INSERT INTO `ot_region` VALUES ('710267', 3, '区县', 'm', 'mlq', '茂林区', '710200', 'maolinqu');
INSERT INTO `ot_region` VALUES ('710268', 3, '区县', 'q', 'qdq', '茄萣区', '710200', 'qiedingqu');
INSERT INTO `ot_region` VALUES ('710299', 3, '区县', 'q', 'qtq', '其它区', '710200', 'qitaqu');
INSERT INTO `ot_region` VALUES ('710300', 2, '城市', 't', 'tns', '台南市', '710000', 'tainanshi');
INSERT INTO `ot_region` VALUES ('710301', 3, '区县', 'z', 'zxq', '中西区', '710300', 'zhongxiqu');
INSERT INTO `ot_region` VALUES ('710302', 3, '区县', 'd', 'dq', '东区', '710300', 'dongqu');
INSERT INTO `ot_region` VALUES ('710303', 3, '区县', 'n', 'nq', '南区', '710300', 'nanqu');
INSERT INTO `ot_region` VALUES ('710304', 3, '区县', 'b', 'bq', '北区', '710300', 'beiqu');
INSERT INTO `ot_region` VALUES ('710305', 3, '区县', 'a', 'apq', '安平区', '710300', 'anpingqu');
INSERT INTO `ot_region` VALUES ('710306', 3, '区县', 'a', 'anq', '安南区', '710300', 'annanqu');
INSERT INTO `ot_region` VALUES ('710339', 3, '区县', 'y', 'ykq', '永康区', '710300', 'yongkangqu');
INSERT INTO `ot_region` VALUES ('710340', 3, '区县', 'g', 'grq', '归仁区', '710300', 'guirenqu');
INSERT INTO `ot_region` VALUES ('710341', 3, '区县', 'x', 'xhq', '新化区', '710300', 'xinhuaqu');
INSERT INTO `ot_region` VALUES ('710342', 3, '区县', 'z', 'zzq', '左镇区', '710300', 'zuozhenqu');
INSERT INTO `ot_region` VALUES ('710343', 3, '区县', 'y', 'yjq', '玉井区', '710300', 'yujingqu');
INSERT INTO `ot_region` VALUES ('710344', 3, '区县', 'n', 'nxq', '楠西区', '710300', 'nanxiqu');
INSERT INTO `ot_region` VALUES ('710345', 3, '区县', 'n', 'nhq', '南化区', '710300', 'nanhuaqu');
INSERT INTO `ot_region` VALUES ('710346', 3, '区县', 'r', 'rdq', '仁德区', '710300', 'rendequ');
INSERT INTO `ot_region` VALUES ('710347', 3, '区县', 'g', 'gmq', '关庙区', '710300', 'guanmiaoqu');
INSERT INTO `ot_region` VALUES ('710348', 3, '区县', 'l', 'lqq', '龙崎区', '710300', 'longqiqu');
INSERT INTO `ot_region` VALUES ('710349', 3, '区县', 'g', 'gtq', '官田区', '710300', 'guantianqu');
INSERT INTO `ot_region` VALUES ('710350', 3, '区县', 'm', 'mdq', '麻豆区', '710300', 'madouqu');
INSERT INTO `ot_region` VALUES ('710351', 3, '区县', 'j', 'jlq', '佳里区', '710300', 'jialiqu');
INSERT INTO `ot_region` VALUES ('710352', 3, '区县', 'x', 'xgq', '西港区', '710300', 'xigangqu');
INSERT INTO `ot_region` VALUES ('710353', 3, '区县', 'q', 'qgq', '七股区', '710300', 'qiguqu');
INSERT INTO `ot_region` VALUES ('710354', 3, '区县', 'j', 'jjq', '将军区', '710300', 'jiangjunqu');
INSERT INTO `ot_region` VALUES ('710355', 3, '区县', 'x', 'xjq', '学甲区', '710300', 'xuejiaqu');
INSERT INTO `ot_region` VALUES ('710356', 3, '区县', 'b', 'bmq', '北门区', '710300', 'beimenqu');
INSERT INTO `ot_region` VALUES ('710357', 3, '区县', 'x', 'xyq', '新营区', '710300', 'xinyingqu');
INSERT INTO `ot_region` VALUES ('710358', 3, '区县', 'h', 'hbq', '后壁区', '710300', 'houbiqu');
INSERT INTO `ot_region` VALUES ('710359', 3, '区县', 'b', 'bhq', '白河区', '710300', 'baihequ');
INSERT INTO `ot_region` VALUES ('710360', 3, '区县', 'd', 'dsq', '东山区', '710300', 'dongshanqu');
INSERT INTO `ot_region` VALUES ('710361', 3, '区县', 'l', 'ljq', '六甲区', '710300', 'liujiaqu');
INSERT INTO `ot_region` VALUES ('710362', 3, '区县', 'x', 'xyq', '下营区', '710300', 'xiayingqu');
INSERT INTO `ot_region` VALUES ('710363', 3, '区县', 'l', 'lyq', '柳营区', '710300', 'liuyingqu');
INSERT INTO `ot_region` VALUES ('710364', 3, '区县', 'y', 'ysq', '盐水区', '710300', 'yanshuiqu');
INSERT INTO `ot_region` VALUES ('710365', 3, '区县', 's', 'shq', '善化区', '710300', 'shanhuaqu');
INSERT INTO `ot_region` VALUES ('710366', 3, '区县', 'd', 'dnq', '大内区', '710300', 'daneiqu');
INSERT INTO `ot_region` VALUES ('710367', 3, '区县', 's', 'ssq', '山上区', '710300', 'shanshangqu');
INSERT INTO `ot_region` VALUES ('710368', 3, '区县', 'x', 'xsq', '新市区', '710300', 'xinshiqu');
INSERT INTO `ot_region` VALUES ('710369', 3, '区县', 'a', 'adq', '安定区', '710300', 'andingqu');
INSERT INTO `ot_region` VALUES ('710399', 3, '区县', 'q', 'qtq', '其它区', '710300', 'qitaqu');
INSERT INTO `ot_region` VALUES ('710400', 2, '城市', 't', 'tzs', '台中市', '710000', 'taizhongshi');
INSERT INTO `ot_region` VALUES ('710401', 3, '区县', 'z', 'zq', '中区', '710400', 'zhongqu');
INSERT INTO `ot_region` VALUES ('710402', 3, '区县', 'd', 'dq', '东区', '710400', 'dongqu');
INSERT INTO `ot_region` VALUES ('710403', 3, '区县', 'n', 'nq', '南区', '710400', 'nanqu');
INSERT INTO `ot_region` VALUES ('710404', 3, '区县', 'x', 'xq', '西区', '710400', 'xiqu');
INSERT INTO `ot_region` VALUES ('710405', 3, '区县', 'b', 'bq', '北区', '710400', 'beiqu');
INSERT INTO `ot_region` VALUES ('710406', 3, '区县', 'b', 'btq', '北屯区', '710400', 'beitunqu');
INSERT INTO `ot_region` VALUES ('710407', 3, '区县', 'x', 'xtq', '西屯区', '710400', 'xitunqu');
INSERT INTO `ot_region` VALUES ('710408', 3, '区县', 'n', 'ntq', '南屯区', '710400', 'nantunqu');
INSERT INTO `ot_region` VALUES ('710431', 3, '区县', 't', 'tpq', '太平区', '710400', 'taipingqu');
INSERT INTO `ot_region` VALUES ('710432', 3, '区县', 'd', 'dlq', '大里区', '710400', 'daliqu');
INSERT INTO `ot_region` VALUES ('710433', 3, '区县', 'w', 'wfq', '雾峰区', '710400', 'wufengqu');
INSERT INTO `ot_region` VALUES ('710434', 3, '区县', 'w', 'wrq', '乌日区', '710400', 'wuriqu');
INSERT INTO `ot_region` VALUES ('710435', 3, '区县', 'f', 'fyq', '丰原区', '710400', 'fengyuanqu');
INSERT INTO `ot_region` VALUES ('710436', 3, '区县', 'h', 'hlq', '后里区', '710400', 'houliqu');
INSERT INTO `ot_region` VALUES ('710437', 3, '区县', 's', 'sgq', '石冈区', '710400', 'shigangqu');
INSERT INTO `ot_region` VALUES ('710438', 3, '区县', 'd', 'dsq', '东势区', '710400', 'dongshiqu');
INSERT INTO `ot_region` VALUES ('710439', 3, '区县', 'h', 'hpq', '和平区', '710400', 'hepingqu');
INSERT INTO `ot_region` VALUES ('710440', 3, '区县', 'x', 'xsq', '新社区', '710400', 'xinshequ');
INSERT INTO `ot_region` VALUES ('710441', 3, '区县', 't', 'tzq', '潭子区', '710400', 'tanziqu');
INSERT INTO `ot_region` VALUES ('710442', 3, '区县', 'd', 'dyq', '大雅区', '710400', 'dayaqu');
INSERT INTO `ot_region` VALUES ('710443', 3, '区县', 's', 'sgq', '神冈区', '710400', 'shengangqu');
INSERT INTO `ot_region` VALUES ('710444', 3, '区县', 'd', 'ddq', '大肚区', '710400', 'daduqu');
INSERT INTO `ot_region` VALUES ('710445', 3, '区县', 's', 'slq', '沙鹿区', '710400', 'shaluqu');
INSERT INTO `ot_region` VALUES ('710446', 3, '区县', 'l', 'ljq', '龙井区', '710400', 'longjingqu');
INSERT INTO `ot_region` VALUES ('710447', 3, '区县', 'w', 'wqq', '梧栖区', '710400', 'wuqiqu');
INSERT INTO `ot_region` VALUES ('710448', 3, '区县', 'q', 'qsq', '清水区', '710400', 'qingshuiqu');
INSERT INTO `ot_region` VALUES ('710449', 3, '区县', 'd', 'djq', '大甲区', '710400', 'dajiaqu');
INSERT INTO `ot_region` VALUES ('710450', 3, '区县', 'w', 'wpq', '外埔区', '710400', 'waipuqu');
INSERT INTO `ot_region` VALUES ('710451', 3, '区县', 'd', 'daq', '大安区', '710400', 'daanqu');
INSERT INTO `ot_region` VALUES ('710499', 3, '区县', 'q', 'qtq', '其它区', '710400', 'qitaqu');
INSERT INTO `ot_region` VALUES ('710500', 2, '城市', 'j', 'jmx', '金门县', '710000', 'jinmenxian');
INSERT INTO `ot_region` VALUES ('710507', 3, '区县', 'j', 'jsz', '金沙镇', '710500', 'jinshazhen');
INSERT INTO `ot_region` VALUES ('710508', 3, '区县', 'j', 'jhz', '金湖镇', '710500', 'jinhuzhen');
INSERT INTO `ot_region` VALUES ('710509', 3, '区县', 'j', 'jnx', '金宁乡', '710500', 'jinningxiang');
INSERT INTO `ot_region` VALUES ('710510', 3, '区县', 'j', 'jcz', '金城镇', '710500', 'jinchengzhen');
INSERT INTO `ot_region` VALUES ('710511', 3, '区县', 'l', 'lyx', '烈屿乡', '710500', 'lieyuxiang');
INSERT INTO `ot_region` VALUES ('710512', 3, '区县', 'w', 'wqx', '乌坵乡', '710500', 'wuqiuxiang');
INSERT INTO `ot_region` VALUES ('710600', 2, '城市', 'n', 'ntx', '南投县', '710000', 'nantouxian');
INSERT INTO `ot_region` VALUES ('710614', 3, '区县', 'n', 'nts', '南投市', '710600', 'nantoushi');
INSERT INTO `ot_region` VALUES ('710615', 3, '区县', 'z', 'zlx', '中寮乡', '710600', 'zhongliaoxiang');
INSERT INTO `ot_region` VALUES ('710616', 3, '区县', 'c', 'ctz', '草屯镇', '710600', 'caotunzhen');
INSERT INTO `ot_region` VALUES ('710617', 3, '区县', 'g', 'gxx', '国姓乡', '710600', 'guoxingxiang');
INSERT INTO `ot_region` VALUES ('710618', 3, '区县', 'p', 'plz', '埔里镇', '710600', 'pulizhen');
INSERT INTO `ot_region` VALUES ('710619', 3, '区县', 'r', 'rax', '仁爱乡', '710600', 'renaixiang');
INSERT INTO `ot_region` VALUES ('710620', 3, '区县', 'm', 'mjx', '名间乡', '710600', 'mingjianxiang');
INSERT INTO `ot_region` VALUES ('710621', 3, '区县', 'j', 'jjz', '集集镇', '710600', 'jijizhen');
INSERT INTO `ot_region` VALUES ('710622', 3, '区县', 's', 'slx', '水里乡', '710600', 'shuilixiang');
INSERT INTO `ot_region` VALUES ('710623', 3, '区县', 'y', 'ycx', '鱼池乡', '710600', 'yuchixiang');
INSERT INTO `ot_region` VALUES ('710624', 3, '区县', 'x', 'xyx', '信义乡', '710600', 'xinyixiang');
INSERT INTO `ot_region` VALUES ('710625', 3, '区县', 'z', 'zsz', '竹山镇', '710600', 'zhushanzhen');
INSERT INTO `ot_region` VALUES ('710626', 3, '区县', 'l', 'lgx', '鹿谷乡', '710600', 'luguxiang');
INSERT INTO `ot_region` VALUES ('710700', 2, '城市', 'j', 'jls', '基隆市', '710000', 'jilongshi');
INSERT INTO `ot_region` VALUES ('710701', 3, '区县', 'r', 'raq', '仁爱区', '710700', 'renaiqu');
INSERT INTO `ot_region` VALUES ('710702', 3, '区县', 'x', 'xyq', '信义区', '710700', 'xinyiqu');
INSERT INTO `ot_region` VALUES ('710703', 3, '区县', 'z', 'zzq', '中正区', '710700', 'zhongzhengqu');
INSERT INTO `ot_region` VALUES ('710704', 3, '区县', 'z', 'zsq', '中山区', '710700', 'zhongshanqu');
INSERT INTO `ot_region` VALUES ('710705', 3, '区县', 'a', 'alq', '安乐区', '710700', 'anlequ');
INSERT INTO `ot_region` VALUES ('710706', 3, '区县', 'n', 'nnq', '暖暖区', '710700', 'nuannuanqu');
INSERT INTO `ot_region` VALUES ('710707', 3, '区县', 'q', 'qdq', '七堵区', '710700', 'qiduqu');
INSERT INTO `ot_region` VALUES ('710799', 3, '区县', 'q', 'qtq', '其它区', '710700', 'qitaqu');
INSERT INTO `ot_region` VALUES ('710800', 2, '城市', 'x', 'xzs', '新竹市', '710000', 'xinzhushi');
INSERT INTO `ot_region` VALUES ('710801', 3, '区县', 'd', 'dq', '东区', '710800', 'dongqu');
INSERT INTO `ot_region` VALUES ('710802', 3, '区县', 'b', 'bq', '北区', '710800', 'beiqu');
INSERT INTO `ot_region` VALUES ('710803', 3, '区县', 'x', 'xsq', '香山区', '710800', 'xiangshanqu');
INSERT INTO `ot_region` VALUES ('710899', 3, '区县', 'q', 'qtq', '其它区', '710800', 'qitaqu');
INSERT INTO `ot_region` VALUES ('710900', 2, '城市', 'j', 'jys', '嘉义市', '710000', 'jiayishi');
INSERT INTO `ot_region` VALUES ('710901', 3, '区县', 'd', 'dq', '东区', '710900', 'dongqu');
INSERT INTO `ot_region` VALUES ('710902', 3, '区县', 'x', 'xq', '西区', '710900', 'xiqu');
INSERT INTO `ot_region` VALUES ('710999', 3, '区县', 'q', 'qtq', '其它区', '710900', 'qitaqu');
INSERT INTO `ot_region` VALUES ('711100', 2, '城市', 'x', 'xbs', '新北市', '710000', 'xinbeishi');
INSERT INTO `ot_region` VALUES ('711130', 3, '区县', 'w', 'wlq', '万里区', '711100', 'wanliqu');
INSERT INTO `ot_region` VALUES ('711132', 3, '区县', 'b', 'bqq', '板桥区', '711100', 'banqiaoqu');
INSERT INTO `ot_region` VALUES ('711133', 3, '区县', 'x', 'xzq', '汐止区', '711100', 'xizhiqu');
INSERT INTO `ot_region` VALUES ('711134', 3, '区县', 's', 'skq', '深坑区', '711100', 'shenkengqu');
INSERT INTO `ot_region` VALUES ('711135', 3, '区县', 's', 'sdq', '石碇区', '711100', 'shidingqu');
INSERT INTO `ot_region` VALUES ('711136', 3, '区县', 'r', 'rfq', '瑞芳区', '711100', 'ruifangqu');
INSERT INTO `ot_region` VALUES ('711137', 3, '区县', 'p', 'pxq', '平溪区', '711100', 'pingxiqu');
INSERT INTO `ot_region` VALUES ('711138', 3, '区县', 's', 'sxq', '双溪区', '711100', 'shuangxiqu');
INSERT INTO `ot_region` VALUES ('711139', 3, '区县', 'g', 'glq', '贡寮区', '711100', 'gongliaoqu');
INSERT INTO `ot_region` VALUES ('711140', 3, '区县', 'x', 'xdq', '新店区', '711100', 'xindianqu');
INSERT INTO `ot_region` VALUES ('711141', 3, '区县', 'p', 'plq', '坪林区', '711100', 'pinglinqu');
INSERT INTO `ot_region` VALUES ('711142', 3, '区县', 'w', 'wlq', '乌来区', '711100', 'wulaiqu');
INSERT INTO `ot_region` VALUES ('711143', 3, '区县', 'y', 'yhq', '永和区', '711100', 'yonghequ');
INSERT INTO `ot_region` VALUES ('711144', 3, '区县', 'z', 'zhq', '中和区', '711100', 'zhonghequ');
INSERT INTO `ot_region` VALUES ('711145', 3, '区县', 't', 'tcq', '土城区', '711100', 'tuchengqu');
INSERT INTO `ot_region` VALUES ('711146', 3, '区县', 's', 'sxq', '三峡区', '711100', 'sanxiaqu');
INSERT INTO `ot_region` VALUES ('711147', 3, '区县', 's', 'slq', '树林区', '711100', 'shulinqu');
INSERT INTO `ot_region` VALUES ('711148', 3, '区县', 'y', 'ygq', '莺歌区', '711100', 'yinggequ');
INSERT INTO `ot_region` VALUES ('711149', 3, '区县', 's', 'szq', '三重区', '711100', 'sanzhongqu');
INSERT INTO `ot_region` VALUES ('711150', 3, '区县', 'x', 'xzq', '新庄区', '711100', 'xinzhuangqu');
INSERT INTO `ot_region` VALUES ('711151', 3, '区县', 't', 'tsq', '泰山区', '711100', 'taishanqu');
INSERT INTO `ot_region` VALUES ('711152', 3, '区县', 'l', 'lkq', '林口区', '711100', 'linkouqu');
INSERT INTO `ot_region` VALUES ('711153', 3, '区县', 'l', 'lzq', '芦洲区', '711100', 'luzhouqu');
INSERT INTO `ot_region` VALUES ('711154', 3, '区县', 'w', 'wgq', '五股区', '711100', 'wuguqu');
INSERT INTO `ot_region` VALUES ('711155', 3, '区县', 'b', 'blq', '八里区', '711100', 'baliqu');
INSERT INTO `ot_region` VALUES ('711156', 3, '区县', 'd', 'dsq', '淡水区', '711100', 'danshuiqu');
INSERT INTO `ot_region` VALUES ('711157', 3, '区县', 's', 'szq', '三芝区', '711100', 'sanzhiqu');
INSERT INTO `ot_region` VALUES ('711158', 3, '区县', 's', 'smq', '石门区', '711100', 'shimenqu');
INSERT INTO `ot_region` VALUES ('711200', 2, '城市', 'y', 'ylx', '宜兰县', '710000', 'yilanxian');
INSERT INTO `ot_region` VALUES ('711287', 3, '区县', 'y', 'yls', '宜兰市', '711200', 'yilanshi');
INSERT INTO `ot_region` VALUES ('711288', 3, '区县', 't', 'tcz', '头城镇', '711200', 'touchengzhen');
INSERT INTO `ot_region` VALUES ('711289', 3, '区县', 'j', 'jxx', '礁溪乡', '711200', 'jiaoxixiang');
INSERT INTO `ot_region` VALUES ('711290', 3, '区县', 'z', 'zwx', '壮围乡', '711200', 'zhuangweixiang');
INSERT INTO `ot_region` VALUES ('711291', 3, '区县', 'y', 'ysx', '员山乡', '711200', 'yuanshanxiang');
INSERT INTO `ot_region` VALUES ('711292', 3, '区县', 'l', 'ldz', '罗东镇', '711200', 'luodongzhen');
INSERT INTO `ot_region` VALUES ('711293', 3, '区县', 's', 'sxx', '三星乡', '711200', 'sanxingxiang');
INSERT INTO `ot_region` VALUES ('711294', 3, '区县', 'd', 'dtx', '大同乡', '711200', 'datongxiang');
INSERT INTO `ot_region` VALUES ('711295', 3, '区县', 'w', 'wjx', '五结乡', '711200', 'wujiexiang');
INSERT INTO `ot_region` VALUES ('711296', 3, '区县', 'd', 'dsx', '冬山乡', '711200', 'dongshanxiang');
INSERT INTO `ot_region` VALUES ('711297', 3, '区县', 's', 'saz', '苏澳镇', '711200', 'suaozhen');
INSERT INTO `ot_region` VALUES ('711298', 3, '区县', 'n', 'nax', '南澳乡', '711200', 'nanaoxiang');
INSERT INTO `ot_region` VALUES ('711299', 3, '区县', 'd', 'dyt', '钓鱼台', '711200', 'diaoyutai');
INSERT INTO `ot_region` VALUES ('711300', 2, '城市', 'x', 'xzx', '新竹县', '710000', 'xinzhuxian');
INSERT INTO `ot_region` VALUES ('711387', 3, '区县', 'z', 'zbs', '竹北市', '711300', 'zhubeishi');
INSERT INTO `ot_region` VALUES ('711388', 3, '区县', 'h', 'hkx', '湖口乡', '711300', 'hukouxiang');
INSERT INTO `ot_region` VALUES ('711389', 3, '区县', 'x', 'xfx', '新丰乡', '711300', 'xinfengxiang');
INSERT INTO `ot_region` VALUES ('711390', 3, '区县', 'x', 'xpz', '新埔镇', '711300', 'xinpuzhen');
INSERT INTO `ot_region` VALUES ('711391', 3, '区县', 'g', 'gxz', '关西镇', '711300', 'guanxizhen');
INSERT INTO `ot_region` VALUES ('711392', 3, '区县', 'x', 'xlx', '芎林乡', '711300', 'xionglinxiang');
INSERT INTO `ot_region` VALUES ('711393', 3, '区县', 'b', 'bsx', '宝山乡', '711300', 'baoshanxiang');
INSERT INTO `ot_region` VALUES ('711394', 3, '区县', 'z', 'zdz', '竹东镇', '711300', 'zhudongzhen');
INSERT INTO `ot_region` VALUES ('711395', 3, '区县', 'w', 'wfx', '五峰乡', '711300', 'wufengxiang');
INSERT INTO `ot_region` VALUES ('711396', 3, '区县', 'h', 'hsx', '横山乡', '711300', 'hengshanxiang');
INSERT INTO `ot_region` VALUES ('711397', 3, '区县', 'j', 'jsx', '尖石乡', '711300', 'jianshixiang');
INSERT INTO `ot_region` VALUES ('711398', 3, '区县', 'b', 'bpx', '北埔乡', '711300', 'beipuxiang');
INSERT INTO `ot_region` VALUES ('711399', 3, '区县', 'e', 'emx', '峨眉乡', '711300', 'emeixiang');
INSERT INTO `ot_region` VALUES ('711400', 2, '城市', 't', 'tyx', '桃园县', '710000', 'taoyuanxian');
INSERT INTO `ot_region` VALUES ('711414', 3, '区县', 'z', 'zlq', '中坜区', '711400', 'zhongliqu');
INSERT INTO `ot_region` VALUES ('711415', 3, '区县', 'p', 'pzq', '平镇区', '711400', 'pingzhenqu');
INSERT INTO `ot_region` VALUES ('711417', 3, '区县', 'y', 'ymq', '杨梅区', '711400', 'yangmeiqu');
INSERT INTO `ot_region` VALUES ('711418', 3, '区县', 'x', 'xwq', '新屋区', '711400', 'xinwuqu');
INSERT INTO `ot_region` VALUES ('711419', 3, '区县', 'g', 'gyq', '观音区', '711400', 'guanyinqu');
INSERT INTO `ot_region` VALUES ('711420', 3, '区县', 't', 'tyq', '桃园区', '711400', 'taoyuanqu');
INSERT INTO `ot_region` VALUES ('711421', 3, '区县', 'g', 'gsq', '龟山区', '711400', 'guishanqu');
INSERT INTO `ot_region` VALUES ('711422', 3, '区县', 'b', 'bdq', '八德区', '711400', 'badequ');
INSERT INTO `ot_region` VALUES ('711423', 3, '区县', 'd', 'dxq', '大溪区', '711400', 'daxiqu');
INSERT INTO `ot_region` VALUES ('711425', 3, '区县', 'd', 'dyq', '大园区', '711400', 'dayuanqu');
INSERT INTO `ot_region` VALUES ('711426', 3, '区县', 'l', 'lzq', '芦竹区', '711400', 'luzhuqu');
INSERT INTO `ot_region` VALUES ('711487', 3, '区县', 'z', 'zls', '中坜市', '711400', 'zhonglishi');
INSERT INTO `ot_region` VALUES ('711488', 3, '区县', 'p', 'pzs', '平镇市', '711400', 'pingzhenshi');
INSERT INTO `ot_region` VALUES ('711489', 3, '区县', 'l', 'ltx', '龙潭乡', '711400', 'longtanxiang');
INSERT INTO `ot_region` VALUES ('711490', 3, '区县', 'y', 'yms', '杨梅市', '711400', 'yangmeishi');
INSERT INTO `ot_region` VALUES ('711491', 3, '区县', 'x', 'xwx', '新屋乡', '711400', 'xinwuxiang');
INSERT INTO `ot_region` VALUES ('711492', 3, '区县', 'g', 'gyx', '观音乡', '711400', 'guanyinxiang');
INSERT INTO `ot_region` VALUES ('711493', 3, '区县', 't', 'tys', '桃园市', '711400', 'taoyuanshi');
INSERT INTO `ot_region` VALUES ('711494', 3, '区县', 'g', 'gsx', '龟山乡', '711400', 'guishanxiang');
INSERT INTO `ot_region` VALUES ('711495', 3, '区县', 'b', 'bds', '八德市', '711400', 'badeshi');
INSERT INTO `ot_region` VALUES ('711496', 3, '区县', 'd', 'dxz', '大溪镇', '711400', 'daxizhen');
INSERT INTO `ot_region` VALUES ('711497', 3, '区县', 'f', 'fxx', '复兴乡', '711400', 'fuxingxiang');
INSERT INTO `ot_region` VALUES ('711498', 3, '区县', 'd', 'dyx', '大园乡', '711400', 'dayuanxiang');
INSERT INTO `ot_region` VALUES ('711499', 3, '区县', 'l', 'lzx', '芦竹乡', '711400', 'luzhuxiang');
INSERT INTO `ot_region` VALUES ('711500', 2, '城市', 'm', 'mlx', '苗栗县', '710000', 'miaolixian');
INSERT INTO `ot_region` VALUES ('711520', 3, '区县', 't', 'tfs', '头份市', '711500', 'toufenshi');
INSERT INTO `ot_region` VALUES ('711582', 3, '区县', 'z', 'znz', '竹南镇', '711500', 'zhunanzhen');
INSERT INTO `ot_region` VALUES ('711583', 3, '区县', 't', 'tfz', '头份镇', '711500', 'toufenzhen');
INSERT INTO `ot_region` VALUES ('711584', 3, '区县', 's', 'swx', '三湾乡', '711500', 'sanwanxiang');
INSERT INTO `ot_region` VALUES ('711585', 3, '区县', 'n', 'nzx', '南庄乡', '711500', 'nanzhuangxiang');
INSERT INTO `ot_region` VALUES ('711586', 3, '区县', 's', 'stx', '狮潭乡', '711500', 'shitanxiang');
INSERT INTO `ot_region` VALUES ('711587', 3, '区县', 'h', 'hlz', '后龙镇', '711500', 'houlongzhen');
INSERT INTO `ot_region` VALUES ('711588', 3, '区县', 't', 'txz', '通霄镇', '711500', 'tongxiaozhen');
INSERT INTO `ot_region` VALUES ('711589', 3, '区县', 'y', 'ylz', '苑里镇', '711500', 'yuanlizhen');
INSERT INTO `ot_region` VALUES ('711590', 3, '区县', 'm', 'mls', '苗栗市', '711500', 'miaolishi');
INSERT INTO `ot_region` VALUES ('711591', 3, '区县', 'z', 'zqx', '造桥乡', '711500', 'zaoqiaoxiang');
INSERT INTO `ot_region` VALUES ('711592', 3, '区县', 't', 'twx', '头屋乡', '711500', 'touwuxiang');
INSERT INTO `ot_region` VALUES ('711593', 3, '区县', 'g', 'ggx', '公馆乡', '711500', 'gongguanxiang');
INSERT INTO `ot_region` VALUES ('711594', 3, '区县', 'd', 'dhx', '大湖乡', '711500', 'dahuxiang');
INSERT INTO `ot_region` VALUES ('711595', 3, '区县', 't', 'tax', '泰安乡', '711500', 'taianxiang');
INSERT INTO `ot_region` VALUES ('711596', 3, '区县', 't', 'tlx', '铜锣乡', '711500', 'tongluoxiang');
INSERT INTO `ot_region` VALUES ('711597', 3, '区县', 's', 'syx', '三义乡', '711500', 'sanyixiang');
INSERT INTO `ot_region` VALUES ('711598', 3, '区县', 'x', 'xhx', '西湖乡', '711500', 'xihuxiang');
INSERT INTO `ot_region` VALUES ('711599', 3, '区县', 'z', 'zlz', '卓兰镇', '711500', 'zhuolanzhen');
INSERT INTO `ot_region` VALUES ('711700', 2, '城市', 'z', 'zhx', '彰化县', '710000', 'zhanghuaxian');
INSERT INTO `ot_region` VALUES ('711736', 3, '区县', 'y', 'yls', '员林市', '711700', 'yuanlinshi');
INSERT INTO `ot_region` VALUES ('711774', 3, '区县', 'z', 'zhs', '彰化市', '711700', 'zhanghuashi');
INSERT INTO `ot_region` VALUES ('711775', 3, '区县', 'f', 'fyx', '芬园乡', '711700', 'fenyuanxiang');
INSERT INTO `ot_region` VALUES ('711776', 3, '区县', 'h', 'htx', '花坛乡', '711700', 'huatanxiang');
INSERT INTO `ot_region` VALUES ('711777', 3, '区县', 'x', 'xsx', '秀水乡', '711700', 'xiushuixiang');
INSERT INTO `ot_region` VALUES ('711778', 3, '区县', 'l', 'lgz', '鹿港镇', '711700', 'lugangzhen');
INSERT INTO `ot_region` VALUES ('711779', 3, '区县', 'f', 'fxx', '福兴乡', '711700', 'fuxingxiang');
INSERT INTO `ot_region` VALUES ('711780', 3, '区县', 'x', 'xxx', '线西乡', '711700', 'xianxixiang');
INSERT INTO `ot_region` VALUES ('711781', 3, '区县', 'h', 'hmz', '和美镇', '711700', 'hemeizhen');
INSERT INTO `ot_region` VALUES ('711782', 3, '区县', 's', 'sgx', '伸港乡', '711700', 'shengangxiang');
INSERT INTO `ot_region` VALUES ('711783', 3, '区县', 'y', 'ylz', '员林镇', '711700', 'yuanlinzhen');
INSERT INTO `ot_region` VALUES ('711784', 3, '区县', 's', 'stx', '社头乡', '711700', 'shetouxiang');
INSERT INTO `ot_region` VALUES ('711785', 3, '区县', 'y', 'yjx', '永靖乡', '711700', 'yongjingxiang');
INSERT INTO `ot_region` VALUES ('711786', 3, '区县', 'p', 'pxx', '埔心乡', '711700', 'puxinxiang');
INSERT INTO `ot_region` VALUES ('711787', 3, '区县', 'x', 'xhz', '溪湖镇', '711700', 'xihuzhen');
INSERT INTO `ot_region` VALUES ('711788', 3, '区县', 'd', 'dcx', '大村乡', '711700', 'dacunxiang');
INSERT INTO `ot_region` VALUES ('711789', 3, '区县', 'p', 'pyx', '埔盐乡', '711700', 'puyanxiang');
INSERT INTO `ot_region` VALUES ('711790', 3, '区县', 't', 'tzz', '田中镇', '711700', 'tianzhongzhen');
INSERT INTO `ot_region` VALUES ('711791', 3, '区县', 'b', 'bdz', '北斗镇', '711700', 'beidouzhen');
INSERT INTO `ot_region` VALUES ('711792', 3, '区县', 't', 'twx', '田尾乡', '711700', 'tianweixiang');
INSERT INTO `ot_region` VALUES ('711793', 3, '区县', 'p', 'ptx', '埤头乡', '711700', 'pitouxiang');
INSERT INTO `ot_region` VALUES ('711794', 3, '区县', 'x', 'xzx', '溪州乡', '711700', 'xizhouxiang');
INSERT INTO `ot_region` VALUES ('711795', 3, '区县', 'z', 'ztx', '竹塘乡', '711700', 'zhutangxiang');
INSERT INTO `ot_region` VALUES ('711796', 3, '区县', 'e', 'elz', '二林镇', '711700', 'erlinzhen');
INSERT INTO `ot_region` VALUES ('711797', 3, '区县', 'd', 'dcx', '大城乡', '711700', 'dachengxiang');
INSERT INTO `ot_region` VALUES ('711798', 3, '区县', 'f', 'fyx', '芳苑乡', '711700', 'fangyuanxiang');
INSERT INTO `ot_region` VALUES ('711799', 3, '区县', 'e', 'esx', '二水乡', '711700', 'ershuixiang');
INSERT INTO `ot_region` VALUES ('711900', 2, '城市', 'j', 'jyx', '嘉义县', '710000', 'jiayixian');
INSERT INTO `ot_region` VALUES ('711982', 3, '区县', 'f', 'flx', '番路乡', '711900', 'fanluxiang');
INSERT INTO `ot_region` VALUES ('711983', 3, '区县', 'm', 'msx', '梅山乡', '711900', 'meishanxiang');
INSERT INTO `ot_region` VALUES ('711984', 3, '区县', 'z', 'zqx', '竹崎乡', '711900', 'zhuqixiang');
INSERT INTO `ot_region` VALUES ('711985', 3, '区县', 'a', 'alsx', '阿里山乡', '711900', 'alishanxiang');
INSERT INTO `ot_region` VALUES ('711986', 3, '区县', 'z', 'zpx', '中埔乡', '711900', 'zhongpuxiang');
INSERT INTO `ot_region` VALUES ('711987', 3, '区县', 'd', 'dpx', '大埔乡', '711900', 'dapuxiang');
INSERT INTO `ot_region` VALUES ('711988', 3, '区县', 's', 'ssx', '水上乡', '711900', 'shuishangxiang');
INSERT INTO `ot_region` VALUES ('711989', 3, '区县', 'l', 'lcx', '鹿草乡', '711900', 'lucaoxiang');
INSERT INTO `ot_region` VALUES ('711990', 3, '区县', 't', 'tbs', '太保市', '711900', 'taibaoshi');
INSERT INTO `ot_region` VALUES ('711991', 3, '区县', 'p', 'pzs', '朴子市', '711900', 'pozishi');
INSERT INTO `ot_region` VALUES ('711992', 3, '区县', 'd', 'dsx', '东石乡', '711900', 'dongshixiang');
INSERT INTO `ot_region` VALUES ('711993', 3, '区县', 'l', 'ljx', '六脚乡', '711900', 'liujiaoxiang');
INSERT INTO `ot_region` VALUES ('711994', 3, '区县', 'x', 'xgx', '新港乡', '711900', 'xingangxiang');
INSERT INTO `ot_region` VALUES ('711995', 3, '区县', 'm', 'mxx', '民雄乡', '711900', 'minxiongxiang');
INSERT INTO `ot_region` VALUES ('711996', 3, '区县', 'd', 'dlz', '大林镇', '711900', 'dalinzhen');
INSERT INTO `ot_region` VALUES ('711997', 3, '区县', 'x', 'xkx', '溪口乡', '711900', 'xikouxiang');
INSERT INTO `ot_region` VALUES ('711998', 3, '区县', 'y', 'yzx', '义竹乡', '711900', 'yizhuxiang');
INSERT INTO `ot_region` VALUES ('711999', 3, '区县', 'b', 'bdz', '布袋镇', '711900', 'budaizhen');
INSERT INTO `ot_region` VALUES ('712100', 2, '城市', 'y', 'ylx', '云林县', '710000', 'yunlinxian');
INSERT INTO `ot_region` VALUES ('712180', 3, '区县', 'd', 'dnz', '斗南镇', '712100', 'dounanzhen');
INSERT INTO `ot_region` VALUES ('712181', 3, '区县', 'd', 'dpx', '大埤乡', '712100', 'dapixiang');
INSERT INTO `ot_region` VALUES ('712182', 3, '区县', 'h', 'hwz', '虎尾镇', '712100', 'huweizhen');
INSERT INTO `ot_region` VALUES ('712183', 3, '区县', 't', 'tkz', '土库镇', '712100', 'tukuzhen');
INSERT INTO `ot_region` VALUES ('712184', 3, '区县', 'b', 'bzx', '褒忠乡', '712100', 'baozhongxiang');
INSERT INTO `ot_region` VALUES ('712185', 3, '区县', 'd', 'dsx', '东势乡', '712100', 'dongshixiang');
INSERT INTO `ot_region` VALUES ('712186', 3, '区县', 't', 'txx', '台西乡', '712100', 'taixixiang');
INSERT INTO `ot_region` VALUES ('712187', 3, '区县', 'l', 'lbx', '仑背乡', '712100', 'lunbeixiang');
INSERT INTO `ot_region` VALUES ('712188', 3, '区县', 'm', 'mlx', '麦寮乡', '712100', 'mailiaoxiang');
INSERT INTO `ot_region` VALUES ('712189', 3, '区县', 'd', 'dls', '斗六市', '712100', 'douliushi');
INSERT INTO `ot_region` VALUES ('712190', 3, '区县', 'l', 'lnx', '林内乡', '712100', 'linneixiang');
INSERT INTO `ot_region` VALUES ('712191', 3, '区县', 'g', 'gkx', '古坑乡', '712100', 'gukengxiang');
INSERT INTO `ot_region` VALUES ('712192', 3, '区县', 'c', 'ctx', '莿桐乡', '712100', 'citongxiang');
INSERT INTO `ot_region` VALUES ('712193', 3, '区县', 'x', 'xlz', '西螺镇', '712100', 'xiluozhen');
INSERT INTO `ot_region` VALUES ('712194', 3, '区县', 'e', 'elx', '二仑乡', '712100', 'erlunxiang');
INSERT INTO `ot_region` VALUES ('712195', 3, '区县', 'b', 'bgz', '北港镇', '712100', 'beigangzhen');
INSERT INTO `ot_region` VALUES ('712196', 3, '区县', 's', 'slx', '水林乡', '712100', 'shuilinxiang');
INSERT INTO `ot_region` VALUES ('712197', 3, '区县', 'k', 'khx', '口湖乡', '712100', 'kouhuxiang');
INSERT INTO `ot_region` VALUES ('712198', 3, '区县', 's', 'shx', '四湖乡', '712100', 'sihuxiang');
INSERT INTO `ot_region` VALUES ('712199', 3, '区县', 'y', 'yzx', '元长乡', '712100', 'yuanzhangxiang');
INSERT INTO `ot_region` VALUES ('712400', 2, '城市', 'p', 'pdx', '屏东县', '710000', 'pingdongxian');
INSERT INTO `ot_region` VALUES ('712451', 3, '区县', 'k', 'kdx', '崁顶乡', '712400', 'kandingxiang');
INSERT INTO `ot_region` VALUES ('712467', 3, '区县', 'p', 'pds', '屏东市', '712400', 'pingdongshi');
INSERT INTO `ot_region` VALUES ('712468', 3, '区县', 's', 'sdmx', '三地门乡', '712400', 'sandimenxiang');
INSERT INTO `ot_region` VALUES ('712469', 3, '区县', 'w', 'wtx', '雾台乡', '712400', 'wutaixiang');
INSERT INTO `ot_region` VALUES ('712470', 3, '区县', 'm', 'mjx', '玛家乡', '712400', 'majiaxiang');
INSERT INTO `ot_region` VALUES ('712471', 3, '区县', 'j', 'jrx', '九如乡', '712400', 'jiuruxiang');
INSERT INTO `ot_region` VALUES ('712472', 3, '区县', 'l', 'lgx', '里港乡', '712400', 'ligangxiang');
INSERT INTO `ot_region` VALUES ('712473', 3, '区县', 'g', 'gsx', '高树乡', '712400', 'gaoshuxiang');
INSERT INTO `ot_region` VALUES ('712474', 3, '区县', 'y', 'ypx', '盐埔乡', '712400', 'yanpuxiang');
INSERT INTO `ot_region` VALUES ('712475', 3, '区县', 'z', 'zzx', '长治乡', '712400', 'zhangzhixiang');
INSERT INTO `ot_region` VALUES ('712476', 3, '区县', 'l', 'llx', '麟洛乡', '712400', 'linluoxiang');
INSERT INTO `ot_region` VALUES ('712477', 3, '区县', 'z', 'ztx', '竹田乡', '712400', 'zhutianxiang');
INSERT INTO `ot_region` VALUES ('712478', 3, '区县', 'n', 'npx', '内埔乡', '712400', 'neipuxiang');
INSERT INTO `ot_region` VALUES ('712479', 3, '区县', 'w', 'wdx', '万丹乡', '712400', 'wandanxiang');
INSERT INTO `ot_region` VALUES ('712480', 3, '区县', 'c', 'czz', '潮州镇', '712400', 'chaozhouzhen');
INSERT INTO `ot_region` VALUES ('712481', 3, '区县', 't', 'twx', '泰武乡', '712400', 'taiwuxiang');
INSERT INTO `ot_region` VALUES ('712482', 3, '区县', 'l', 'lyx', '来义乡', '712400', 'laiyixiang');
INSERT INTO `ot_region` VALUES ('712483', 3, '区县', 'w', 'wlx', '万峦乡', '712400', 'wanluanxiang');
INSERT INTO `ot_region` VALUES ('712484', 3, '区县', 'k', 'kdx', '莰顶乡', '712400', 'kandingxiang');
INSERT INTO `ot_region` VALUES ('712485', 3, '区县', 'x', 'xpx', '新埤乡', '712400', 'xinpixiang');
INSERT INTO `ot_region` VALUES ('712486', 3, '区县', 'n', 'nzx', '南州乡', '712400', 'nanzhouxiang');
INSERT INTO `ot_region` VALUES ('712487', 3, '区县', 'l', 'lbx', '林边乡', '712400', 'linbianxiang');
INSERT INTO `ot_region` VALUES ('712488', 3, '区县', 'd', 'dgz', '东港镇', '712400', 'donggangzhen');
INSERT INTO `ot_region` VALUES ('712489', 3, '区县', 'l', 'lqx', '琉球乡', '712400', 'liuqiuxiang');
INSERT INTO `ot_region` VALUES ('712490', 3, '区县', 'j', 'jdx', '佳冬乡', '712400', 'jiadongxiang');
INSERT INTO `ot_region` VALUES ('712491', 3, '区县', 'x', 'xyx', '新园乡', '712400', 'xinyuanxiang');
INSERT INTO `ot_region` VALUES ('712492', 3, '区县', 'f', 'flx', '枋寮乡', '712400', 'fangliaoxiang');
INSERT INTO `ot_region` VALUES ('712493', 3, '区县', 'f', 'fsx', '枋山乡', '712400', 'fangshanxiang');
INSERT INTO `ot_region` VALUES ('712494', 3, '区县', 'c', 'crx', '春日乡', '712400', 'chunrixiang');
INSERT INTO `ot_region` VALUES ('712495', 3, '区县', 's', 'szx', '狮子乡', '712400', 'shizixiang');
INSERT INTO `ot_region` VALUES ('712496', 3, '区县', 'c', 'ccx', '车城乡', '712400', 'chechengxiang');
INSERT INTO `ot_region` VALUES ('712497', 3, '区县', 'm', 'mdx', '牡丹乡', '712400', 'mudanxiang');
INSERT INTO `ot_region` VALUES ('712498', 3, '区县', 'h', 'hcz', '恒春镇', '712400', 'hengchunzhen');
INSERT INTO `ot_region` VALUES ('712499', 3, '区县', 'm', 'mzx', '满州乡', '712400', 'manzhouxiang');
INSERT INTO `ot_region` VALUES ('712500', 2, '城市', 't', 'tdx', '台东县', '710000', 'taidongxian');
INSERT INTO `ot_region` VALUES ('712584', 3, '区县', 't', 'tds', '台东市', '712500', 'taidongshi');
INSERT INTO `ot_region` VALUES ('712585', 3, '区县', 'l', 'ldx', '绿岛乡', '712500', 'lu:daoxiang');
INSERT INTO `ot_region` VALUES ('712586', 3, '区县', 'l', 'lyx', '兰屿乡', '712500', 'lanyuxiang');
INSERT INTO `ot_region` VALUES ('712587', 3, '区县', 'y', 'ypx', '延平乡', '712500', 'yanpingxiang');
INSERT INTO `ot_region` VALUES ('712588', 3, '区县', 'b', 'bnx', '卑南乡', '712500', 'beinanxiang');
INSERT INTO `ot_region` VALUES ('712589', 3, '区县', 'l', 'lyx', '鹿野乡', '712500', 'luyexiang');
INSERT INTO `ot_region` VALUES ('712590', 3, '区县', 'g', 'gsz', '关山镇', '712500', 'guanshanzhen');
INSERT INTO `ot_region` VALUES ('712591', 3, '区县', 'h', 'hdx', '海端乡', '712500', 'haiduanxiang');
INSERT INTO `ot_region` VALUES ('712592', 3, '区县', 'c', 'csx', '池上乡', '712500', 'chishangxiang');
INSERT INTO `ot_region` VALUES ('712593', 3, '区县', 'd', 'dhx', '东河乡', '712500', 'donghexiang');
INSERT INTO `ot_region` VALUES ('712594', 3, '区县', 'c', 'cgz', '成功镇', '712500', 'chenggongzhen');
INSERT INTO `ot_region` VALUES ('712595', 3, '区县', 'z', 'zbx', '长滨乡', '712500', 'zhangbinxiang');
INSERT INTO `ot_region` VALUES ('712596', 3, '区县', 'j', 'jfx', '金峰乡', '712500', 'jinfengxiang');
INSERT INTO `ot_region` VALUES ('712597', 3, '区县', 'd', 'dwx', '大武乡', '712500', 'dawuxiang');
INSERT INTO `ot_region` VALUES ('712598', 3, '区县', 'd', 'drx', '达仁乡', '712500', 'darenxiang');
INSERT INTO `ot_region` VALUES ('712599', 3, '区县', 't', 'tmlx', '太麻里乡', '712500', 'taimalixiang');
INSERT INTO `ot_region` VALUES ('712600', 2, '城市', 'h', 'hlx', '花莲县', '710000', 'hualianxian');
INSERT INTO `ot_region` VALUES ('712686', 3, '区县', 'h', 'hls', '花莲市', '712600', 'hualianshi');
INSERT INTO `ot_region` VALUES ('712687', 3, '区县', 'x', 'xcx', '新城乡', '712600', 'xinchengxiang');
INSERT INTO `ot_region` VALUES ('712688', 3, '区县', 't', 'tlg', '太鲁阁', '712600', 'tailuge');
INSERT INTO `ot_region` VALUES ('712689', 3, '区县', 'x', 'xlx', '秀林乡', '712600', 'xiulinxiang');
INSERT INTO `ot_region` VALUES ('712690', 3, '区县', 'j', 'jax', '吉安乡', '712600', 'jianxiang');
INSERT INTO `ot_region` VALUES ('712691', 3, '区县', 's', 'sfx', '寿丰乡', '712600', 'shoufengxiang');
INSERT INTO `ot_region` VALUES ('712692', 3, '区县', 'f', 'flz', '凤林镇', '712600', 'fenglinzhen');
INSERT INTO `ot_region` VALUES ('712693', 3, '区县', 'g', 'gfx', '光复乡', '712600', 'guangfuxiang');
INSERT INTO `ot_region` VALUES ('712694', 3, '区县', 'f', 'fbx', '丰滨乡', '712600', 'fengbinxiang');
INSERT INTO `ot_region` VALUES ('712695', 3, '区县', 'r', 'rsx', '瑞穗乡', '712600', 'ruisuixiang');
INSERT INTO `ot_region` VALUES ('712696', 3, '区县', 'w', 'wrx', '万荣乡', '712600', 'wanrongxiang');
INSERT INTO `ot_region` VALUES ('712697', 3, '区县', 'y', 'ylz', '玉里镇', '712600', 'yulizhen');
INSERT INTO `ot_region` VALUES ('712698', 3, '区县', 'z', 'zxx', '卓溪乡', '712600', 'zhuoxixiang');
INSERT INTO `ot_region` VALUES ('712699', 3, '区县', 'f', 'flx', '富里乡', '712600', 'fulixiang');
INSERT INTO `ot_region` VALUES ('712700', 2, '城市', 'p', 'phx', '澎湖县', '710000', 'penghuxian');
INSERT INTO `ot_region` VALUES ('712794', 3, '区县', 'm', 'mgs', '马公市', '712700', 'magongshi');
INSERT INTO `ot_region` VALUES ('712795', 3, '区县', 'x', 'xyx', '西屿乡', '712700', 'xiyuxiang');
INSERT INTO `ot_region` VALUES ('712796', 3, '区县', 'w', 'wax', '望安乡', '712700', 'wanganxiang');
INSERT INTO `ot_region` VALUES ('712797', 3, '区县', 'q', 'qmx', '七美乡', '712700', 'qimeixiang');
INSERT INTO `ot_region` VALUES ('712798', 3, '区县', 'b', 'bsx', '白沙乡', '712700', 'baishaxiang');
INSERT INTO `ot_region` VALUES ('712799', 3, '区县', 'h', 'hxx', '湖西乡', '712700', 'huxixiang');
INSERT INTO `ot_region` VALUES ('712800', 2, '城市', 'l', 'ljx', '连江县', '710000', 'lianjiangxian');
INSERT INTO `ot_region` VALUES ('712896', 3, '区县', 'n', 'ngx', '南竿乡', '712800', 'nanganxiang');
INSERT INTO `ot_region` VALUES ('712897', 3, '区县', 'b', 'bgx', '北竿乡', '712800', 'beiganxiang');
INSERT INTO `ot_region` VALUES ('712898', 3, '区县', 'd', 'dyx', '东引乡', '712800', 'dongyinxiang');
INSERT INTO `ot_region` VALUES ('712899', 3, '区县', 'j', 'jgx', '莒光乡', '712800', 'juguangxiang');
INSERT INTO `ot_region` VALUES ('810100', 2, '城市', 'x', 'xgd', '香港岛', '810000', 'xianggangdao');
INSERT INTO `ot_region` VALUES ('810101', 3, '区县', 'z', 'zxq', '中西区', '810100', 'zhongxiqu');
INSERT INTO `ot_region` VALUES ('810102', 3, '区县', 'w', 'wzq', '湾仔区', '810100', 'wanziqu');
INSERT INTO `ot_region` VALUES ('810103', 3, '区县', 'd', 'dq', '东区', '810100', 'dongqu');
INSERT INTO `ot_region` VALUES ('810104', 3, '区县', 'n', 'nq', '南区', '810100', 'nanqu');
INSERT INTO `ot_region` VALUES ('810200', 2, '城市', 'j', 'jl', '九龙', '810000', 'jiulong');
INSERT INTO `ot_region` VALUES ('810201', 3, '区县', 'j', 'jlcq', '九龙城区', '810200', 'jiulongchengqu');
INSERT INTO `ot_region` VALUES ('810202', 3, '区县', 'y', 'yjwq', '油尖旺区', '810200', 'youjianwangqu');
INSERT INTO `ot_region` VALUES ('810203', 3, '区县', 's', 'ssbq', '深水埗区', '810200', 'shenshuibuqu');
INSERT INTO `ot_region` VALUES ('810204', 3, '区县', 'h', 'hdxq', '黄大仙区', '810200', 'huangdaxianqu');
INSERT INTO `ot_region` VALUES ('810205', 3, '区县', 'g', 'gtq', '观塘区', '810200', 'guantangqu');
INSERT INTO `ot_region` VALUES ('810300', 2, '城市', 'x', 'xj', '新界', '810000', 'xinjie');
INSERT INTO `ot_region` VALUES ('810301', 3, '区县', 'b', 'bq', '北区', '810300', 'beiqu');
INSERT INTO `ot_region` VALUES ('810302', 3, '区县', 'd', 'dpq', '大埔区', '810300', 'dapuqu');
INSERT INTO `ot_region` VALUES ('810303', 3, '区县', 's', 'stq', '沙田区', '810300', 'shatianqu');
INSERT INTO `ot_region` VALUES ('810304', 3, '区县', 'x', 'xgq', '西贡区', '810300', 'xigongqu');
INSERT INTO `ot_region` VALUES ('810305', 3, '区县', 'y', 'ylq', '元朗区', '810300', 'yuanlangqu');
INSERT INTO `ot_region` VALUES ('810306', 3, '区县', 't', 'tmq', '屯门区', '810300', 'tunmenqu');
INSERT INTO `ot_region` VALUES ('810307', 3, '区县', 'q', 'qwq', '荃湾区', '810300', 'quanwanqu');
INSERT INTO `ot_region` VALUES ('810308', 3, '区县', 'k', 'kqq', '葵青区', '810300', 'kuiqingqu');
INSERT INTO `ot_region` VALUES ('810309', 3, '区县', 'l', 'ldq', '离岛区', '810300', 'lidaoqu');
INSERT INTO `ot_region` VALUES ('820100', 2, '城市', 'a', 'ambd', '澳门半岛', '820000', 'aomenbandao');
INSERT INTO `ot_region` VALUES ('820101', 3, '区县', 'a', 'ambd', '澳门半岛', '820100', 'aomenbandao');
INSERT INTO `ot_region` VALUES ('820200', 2, '城市', 'l', 'ld', '离岛', '820000', 'lidao');
INSERT INTO `ot_region` VALUES ('820201', 3, '区县', 'l', 'ld', '离岛', '820200', 'lidao');
INSERT INTO `ot_region` VALUES ('900400', 2, '城市', 'a', 'afh', '阿富汗', '900000', 'afuhan');
INSERT INTO `ot_region` VALUES ('900800', 2, '城市', 'a', 'aebny', '阿尔巴尼亚', '900000', 'aerbaniya');
INSERT INTO `ot_region` VALUES ('901000', 2, '城市', 'n', 'njz', '南极洲', '900000', 'nanjizhou');
INSERT INTO `ot_region` VALUES ('901200', 2, '城市', 'a', 'aejly', '阿尔及利亚', '900000', 'aerjiliya');
INSERT INTO `ot_region` VALUES ('901600', 2, '城市', 'm', 'mssmy', '美属萨摩亚', '900000', 'meishusamoya');
INSERT INTO `ot_region` VALUES ('902000', 2, '城市', 'a', 'ade', '安道尔', '900000', 'andaoer');
INSERT INTO `ot_region` VALUES ('902400', 2, '城市', 'a', 'agl', '安哥拉', '900000', 'angela');
INSERT INTO `ot_region` VALUES ('902800', 2, '城市', 'a', 'atghbbd', '安提瓜和巴布达', '900000', 'antiguahebabuda');
INSERT INTO `ot_region` VALUES ('903100', 2, '城市', 'a', 'asbj', '阿塞拜疆', '900000', 'asaibaijiang');
INSERT INTO `ot_region` VALUES ('903200', 2, '城市', 'a', 'agt', '阿根廷', '900000', 'agenting');
INSERT INTO `ot_region` VALUES ('903600', 2, '城市', 'a', 'adly', '澳大利亚', '900000', 'aodaliya');
INSERT INTO `ot_region` VALUES ('904000', 2, '城市', 'a', 'adl', '奥地利', '900000', 'aodili');
INSERT INTO `ot_region` VALUES ('904400', 2, '城市', 'b', 'bhm', '巴哈马', '900000', 'bahama');
INSERT INTO `ot_region` VALUES ('904800', 2, '城市', 'b', 'bl', '巴林', '900000', 'balin');
INSERT INTO `ot_region` VALUES ('905000', 2, '城市', 'm', 'mjl', '孟加拉', '900000', 'mengjiala');
INSERT INTO `ot_region` VALUES ('905100', 2, '城市', 'y', 'ymny', '亚美尼亚', '900000', 'yameiniya');
INSERT INTO `ot_region` VALUES ('905200', 2, '城市', 'b', 'bbds', '巴巴多斯', '900000', 'babaduosi');
INSERT INTO `ot_region` VALUES ('905600', 2, '城市', 'b', 'bls', '比利时', '900000', 'bilishi');
INSERT INTO `ot_region` VALUES ('906000', 2, '城市', 'b', 'bmd', '百慕大', '900000', 'baimuda');
INSERT INTO `ot_region` VALUES ('906400', 2, '城市', 'b', 'bd', '不丹', '900000', 'budan');
INSERT INTO `ot_region` VALUES ('906800', 2, '城市', 'b', 'blwy', '玻利维亚', '900000', 'boliweiya');
INSERT INTO `ot_region` VALUES ('907000', 2, '城市', 'b', 'bh', '波黑', '900000', 'bohei');
INSERT INTO `ot_region` VALUES ('907200', 2, '城市', 'b', 'bcwn', '博茨瓦纳', '900000', 'bociwana');
INSERT INTO `ot_region` VALUES ('907400', 2, '城市', 'b', 'bwd', '布韦岛', '900000', 'buweidao');
INSERT INTO `ot_region` VALUES ('907600', 2, '城市', 'b', 'bx', '巴西', '900000', 'baxi');
INSERT INTO `ot_region` VALUES ('908400', 2, '城市', 'b', 'blz', '伯利兹', '900000', 'bolizi');
INSERT INTO `ot_region` VALUES ('908600', 2, '城市', 'y', 'ysydyld', '英属印度洋领地', '900000', 'yingshuyinduyanglingdi');
INSERT INTO `ot_region` VALUES ('909000', 2, '城市', 's', 'slmqd', '所罗门群岛', '900000', 'suoluomenqundao');
INSERT INTO `ot_region` VALUES ('909200', 2, '城市', 'y', 'yswejqd', '英属维尔京群岛', '900000', 'yingshuweierjingqundao');
INSERT INTO `ot_region` VALUES ('909600', 2, '城市', 'w', 'wl', '文莱', '900000', 'wenlai');
INSERT INTO `ot_region` VALUES ('910000', 2, '城市', 'b', 'bjly', '保加利亚', '910000', 'baojialiya');
INSERT INTO `ot_region` VALUES ('910400', 2, '城市', 'm', 'md', '缅甸', '910000', 'miandian');
INSERT INTO `ot_region` VALUES ('910800', 2, '城市', 'b', 'bld', '布隆迪', '910000', 'bulongdi');
INSERT INTO `ot_region` VALUES ('911200', 2, '城市', 'b', 'bels', '白俄罗斯', '910000', 'baieluosi');
INSERT INTO `ot_region` VALUES ('911600', 2, '城市', 'j', 'jpz', '柬埔寨', '910000', 'jianpuzhai');
INSERT INTO `ot_region` VALUES ('912000', 2, '城市', 'k', 'kml', '喀麦隆', '910000', 'kamailong');
INSERT INTO `ot_region` VALUES ('912400', 2, '城市', 'j', 'jnd', '加拿大', '910000', 'jianada');
INSERT INTO `ot_region` VALUES ('913200', 2, '城市', 'f', 'fdj', '佛得角', '910000', 'fodejiao');
INSERT INTO `ot_region` VALUES ('913600', 2, '城市', 'k', 'kmqd', '开曼群岛', '910000', 'kaimanqundao');
INSERT INTO `ot_region` VALUES ('914000', 2, '城市', 'z', 'zf', '中非', '910000', 'zhongfei');
INSERT INTO `ot_region` VALUES ('914400', 2, '城市', 's', 'sllk', '斯里兰卡', '910000', 'sililanka');
INSERT INTO `ot_region` VALUES ('914800', 2, '城市', 'z', 'zd', '乍得', '910000', 'zhade');
INSERT INTO `ot_region` VALUES ('915200', 2, '城市', 'z', 'zl', '智利', '910000', 'zhili');
INSERT INTO `ot_region` VALUES ('916200', 2, '城市', 's', 'sdd', '圣诞岛', '910000', 'shengdandao');
INSERT INTO `ot_region` VALUES ('916600', 2, '城市', 'k', 'kksqd', '科科斯群岛', '910000', 'kekesiqundao');
INSERT INTO `ot_region` VALUES ('917000', 2, '城市', 'g', 'glby', '哥伦比亚', '910000', 'gelunbiya');
INSERT INTO `ot_region` VALUES ('917400', 2, '城市', 'k', 'kml', '科摩罗', '910000', 'kemoluo');
INSERT INTO `ot_region` VALUES ('917500', 2, '城市', 'm', 'myt', '马约特', '910000', 'mayuete');
INSERT INTO `ot_region` VALUES ('917800', 2, '城市', 'g', 'ggb', '刚果（布）', '910000', 'gangguobu');
INSERT INTO `ot_region` VALUES ('918000', 2, '城市', 'g', 'ggj', '刚果（金）', '910000', 'gangguojin');
INSERT INTO `ot_region` VALUES ('918400', 2, '城市', 'k', 'kkqd', '库克群岛', '910000', 'kukequndao');
INSERT INTO `ot_region` VALUES ('918800', 2, '城市', 'g', 'gsdlj', '哥斯达黎加', '910000', 'gesidalijia');
INSERT INTO `ot_region` VALUES ('919100', 2, '城市', 'k', 'kldy', '克罗地亚', '910000', 'keluodiya');
INSERT INTO `ot_region` VALUES ('919200', 2, '城市', 'g', 'gb', '古巴', '910000', 'guba');
INSERT INTO `ot_region` VALUES ('919600', 2, '城市', 's', 'spls', '塞浦路斯', '910000', 'saipulusi');
INSERT INTO `ot_region` VALUES ('920300', 2, '城市', 'j', 'jk', '捷克', '920000', 'jieke');
INSERT INTO `ot_region` VALUES ('920400', 2, '城市', 'b', 'bn', '贝宁', '920000', 'beining');
INSERT INTO `ot_region` VALUES ('920800', 2, '城市', 'd', 'dm', '丹麦', '920000', 'danmai');
INSERT INTO `ot_region` VALUES ('921200', 2, '城市', 'd', 'dmnk', '多米尼克', '920000', 'duominike');
INSERT INTO `ot_region` VALUES ('921400', 2, '城市', 'd', 'dmnj', '多米尼加', '920000', 'duominijia');
INSERT INTO `ot_region` VALUES ('921800', 2, '城市', 'e', 'egde', '厄瓜多尔', '920000', 'eguaduoer');
INSERT INTO `ot_region` VALUES ('922200', 2, '城市', 's', 'sewd', '萨尔瓦多', '920000', 'saerwaduo');
INSERT INTO `ot_region` VALUES ('922600', 2, '城市', 'c', 'cdjny', '赤道几内亚', '920000', 'chidaojineiya');
INSERT INTO `ot_region` VALUES ('923100', 2, '城市', 'a', 'aseby', '埃塞俄比亚', '920000', 'aisaiebiya');
INSERT INTO `ot_region` VALUES ('923200', 2, '城市', 'e', 'eltly', '厄立特里亚', '920000', 'eliteliya');
INSERT INTO `ot_region` VALUES ('923300', 2, '城市', 'a', 'asny', '爱沙尼亚', '920000', 'aishaniya');
INSERT INTO `ot_region` VALUES ('923400', 2, '城市', 'f', 'flqd', '法罗群岛', '920000', 'faluoqundao');
INSERT INTO `ot_region` VALUES ('923800', 2, '城市', 'm', 'mewnsqdfkl', '马尔维纳斯群岛（ 福克兰）', '920000', 'maerweinasiqundaofukelan');
INSERT INTO `ot_region` VALUES ('923900', 2, '城市', 'n', 'nqzydhnswqqd', '南乔治亚岛和南桑威奇群岛', '920000', 'nanqiaozhiyadaohenansangweiqiqundao');
INSERT INTO `ot_region` VALUES ('924200', 2, '城市', 'f', 'fjqd', '斐济群岛', '920000', 'feijiqundao');
INSERT INTO `ot_region` VALUES ('924600', 2, '城市', 'f', 'fl', '芬兰', '920000', 'fenlan');
INSERT INTO `ot_region` VALUES ('924800', 2, '城市', 'a', 'alqd', '奥兰群岛', '920000', 'aolanqundao');
INSERT INTO `ot_region` VALUES ('925000', 2, '城市', 'f', 'fg', '法国', '920000', 'faguo');
INSERT INTO `ot_region` VALUES ('925400', 2, '城市', 'f', 'fsgyn', '法属圭亚那', '920000', 'fashuguiyanei');
INSERT INTO `ot_region` VALUES ('925800', 2, '城市', 'f', 'fsblnxy', '法属波利尼西亚', '920000', 'fashubolinixiya');
INSERT INTO `ot_region` VALUES ('926000', 2, '城市', 'f', 'fsnbld', '法属南部领地', '920000', 'fashunanbulingdi');
INSERT INTO `ot_region` VALUES ('926200', 2, '城市', 'j', 'jbt', '吉布提', '920000', 'jibuti');
INSERT INTO `ot_region` VALUES ('926600', 2, '城市', 'j', 'jp', '加蓬', '920000', 'jiapeng');
INSERT INTO `ot_region` VALUES ('926800', 2, '城市', 'g', 'gljy', '格鲁吉亚', '920000', 'gelujiya');
INSERT INTO `ot_region` VALUES ('927000', 2, '城市', 'g', 'gby', '冈比亚', '920000', 'gangbiya');
INSERT INTO `ot_region` VALUES ('927500', 2, '城市', 'b', 'blst', '巴勒斯坦', '920000', 'balesitan');
INSERT INTO `ot_region` VALUES ('927600', 2, '城市', 'd', 'dg', '德国', '920000', 'deguo');
INSERT INTO `ot_region` VALUES ('928800', 2, '城市', 'j', 'jn', '加纳', '920000', 'jiana');
INSERT INTO `ot_region` VALUES ('929200', 2, '城市', 'z', 'zblt', '直布罗陀', '920000', 'zhibuluotuo');
INSERT INTO `ot_region` VALUES ('929600', 2, '城市', 'j', 'jlbs', '基里巴斯', '920000', 'jilibasi');
INSERT INTO `ot_region` VALUES ('930000', 2, '城市', 'x', 'xl', '希腊', '930000', 'xila');
INSERT INTO `ot_region` VALUES ('930400', 2, '城市', 'g', 'gll', '格陵兰', '930000', 'gelinglan');
INSERT INTO `ot_region` VALUES ('930800', 2, '城市', 'g', 'glnd', '格林纳达', '930000', 'gelinnada');
INSERT INTO `ot_region` VALUES ('931200', 2, '城市', 'g', 'gdlp', '瓜德罗普', '930000', 'guadeluopu');
INSERT INTO `ot_region` VALUES ('931600', 2, '城市', 'g', 'gd', '关岛', '930000', 'guandao');
INSERT INTO `ot_region` VALUES ('932000', 2, '城市', 'w', 'wdml', '危地马拉', '930000', 'weidimala');
INSERT INTO `ot_region` VALUES ('932400', 2, '城市', 'j', 'jny', '几内亚', '930000', 'jineiya');
INSERT INTO `ot_region` VALUES ('932800', 2, '城市', 'g', 'gyn', '圭亚那', '930000', 'guiyanei');
INSERT INTO `ot_region` VALUES ('933200', 2, '城市', 'h', 'hd', '海地', '930000', 'haidi');
INSERT INTO `ot_region` VALUES ('933400', 2, '城市', 'h', 'hddhmktnqd', '赫德岛和麦克唐纳群岛', '930000', 'hededaohemaiketangnaqundao');
INSERT INTO `ot_region` VALUES ('933600', 2, '城市', 'f', 'fdg', '梵蒂冈', '930000', 'fandigang');
INSERT INTO `ot_region` VALUES ('934000', 2, '城市', 'h', 'hdls', '洪都拉斯', '930000', 'hongdoulasi');
INSERT INTO `ot_region` VALUES ('934800', 2, '城市', 'x', 'xyl', '匈牙利', '930000', 'xiongyali');
INSERT INTO `ot_region` VALUES ('935200', 2, '城市', 'b', 'bd', '冰岛', '930000', 'bingdao');
INSERT INTO `ot_region` VALUES ('935600', 2, '城市', 'y', 'yd', '印度', '930000', 'yindu');
INSERT INTO `ot_region` VALUES ('936000', 2, '城市', 'y', 'yn', '印尼', '930000', 'yinni');
INSERT INTO `ot_region` VALUES ('936400', 2, '城市', 'y', 'yl', '伊朗', '930000', 'yilang');
INSERT INTO `ot_region` VALUES ('936800', 2, '城市', 'y', 'ylk', '伊拉克', '930000', 'yilake');
INSERT INTO `ot_region` VALUES ('937200', 2, '城市', 'a', 'ael', '爱尔兰', '930000', 'aierlan');
INSERT INTO `ot_region` VALUES ('937600', 2, '城市', 'y', 'ysl', '以色列', '930000', 'yiselie');
INSERT INTO `ot_region` VALUES ('938000', 2, '城市', 'y', 'ydl', '意大利', '930000', 'yidali');
INSERT INTO `ot_region` VALUES ('938400', 2, '城市', 'k', 'ktdw', '科特迪瓦', '930000', 'ketediwa');
INSERT INTO `ot_region` VALUES ('938800', 2, '城市', 'y', 'ymj', '牙买加', '930000', 'yamaijia');
INSERT INTO `ot_region` VALUES ('939200', 2, '城市', 'r', 'rb', '日本', '930000', 'riben');
INSERT INTO `ot_region` VALUES ('939800', 2, '城市', 'h', 'hskst', '哈萨克斯坦', '930000', 'hasakesitan');
INSERT INTO `ot_region` VALUES ('940000', 2, '城市', 'y', 'yd', '约旦', '940000', 'yuedan');
INSERT INTO `ot_region` VALUES ('940400', 2, '城市', 'k', 'kny', '肯尼亚', '940000', 'kenniya');
INSERT INTO `ot_region` VALUES ('940800', 2, '城市', 'c', 'cxbcx', '朝鲜 北朝鲜', '940000', 'chaoxianbeichaoxian');
INSERT INTO `ot_region` VALUES ('941000', 2, '城市', 'h', 'hg', '韩国', '940000', 'hanguo');
INSERT INTO `ot_region` VALUES ('941400', 2, '城市', 'k', 'kwt', '科威特', '940000', 'keweite');
INSERT INTO `ot_region` VALUES ('941700', 2, '城市', 'j', 'jejsst', '吉尔吉斯斯坦', '940000', 'jierjisisitan');
INSERT INTO `ot_region` VALUES ('941800', 2, '城市', 'l', 'lw', '老挝', '940000', 'laowo');
INSERT INTO `ot_region` VALUES ('942200', 2, '城市', 'l', 'lbn', '黎巴嫩', '940000', 'libanen');
INSERT INTO `ot_region` VALUES ('942600', 2, '城市', 'l', 'lst', '莱索托', '940000', 'laisuotuo');
INSERT INTO `ot_region` VALUES ('942800', 2, '城市', 'l', 'ltwy', '拉脱维亚', '940000', 'latuoweiya');
INSERT INTO `ot_region` VALUES ('943000', 2, '城市', 'l', 'lbly', '利比里亚', '940000', 'libiliya');
INSERT INTO `ot_region` VALUES ('943400', 2, '城市', 'l', 'lby', '利比亚', '940000', 'libiya');
INSERT INTO `ot_region` VALUES ('943800', 2, '城市', 'l', 'lzdsd', '列支敦士登', '940000', 'liezhidunshideng');
INSERT INTO `ot_region` VALUES ('944000', 2, '城市', 'l', 'ltw', '立陶宛', '940000', 'litaowan');
INSERT INTO `ot_region` VALUES ('944200', 2, '城市', 'l', 'lsb', '卢森堡', '940000', 'lusenbao');
INSERT INTO `ot_region` VALUES ('945000', 2, '城市', 'm', 'mdjsj', '马达加斯加', '940000', 'madajiasijia');
INSERT INTO `ot_region` VALUES ('945400', 2, '城市', 'm', 'mlw', '马拉维', '940000', 'malawei');
INSERT INTO `ot_region` VALUES ('945800', 2, '城市', 'm', 'mlxy', '马来西亚', '940000', 'malaixiya');
INSERT INTO `ot_region` VALUES ('946200', 2, '城市', 'm', 'medf', '马尔代夫', '940000', 'maerdaifu');
INSERT INTO `ot_region` VALUES ('946600', 2, '城市', 'm', 'ml', '马里', '940000', 'mali');
INSERT INTO `ot_region` VALUES ('947000', 2, '城市', 'm', 'met', '马耳他', '940000', 'maerta');
INSERT INTO `ot_region` VALUES ('947400', 2, '城市', 'm', 'mtnk', '马提尼克', '940000', 'matinike');
INSERT INTO `ot_region` VALUES ('947800', 2, '城市', 'm', 'mltny', '毛里塔尼亚', '940000', 'maolitaniya');
INSERT INTO `ot_region` VALUES ('948000', 2, '城市', 'm', 'mlqs', '毛里求斯', '940000', 'maoliqiusi');
INSERT INTO `ot_region` VALUES ('948400', 2, '城市', 'm', 'mxg', '墨西哥', '940000', 'moxige');
INSERT INTO `ot_region` VALUES ('949200', 2, '城市', 'm', 'mng', '摩纳哥', '940000', 'monage');
INSERT INTO `ot_region` VALUES ('949600', 2, '城市', 'm', 'mgg', '蒙古国', '940000', 'mengguguo');
INSERT INTO `ot_region` VALUES ('949800', 2, '城市', 'm', 'medw', '摩尔多瓦', '940000', 'moerduowa');
INSERT INTO `ot_region` VALUES ('949900', 2, '城市', 'h', 'hs', '黑山', '940000', 'heishan');
INSERT INTO `ot_region` VALUES ('950000', 2, '城市', 'm', 'msltd', '蒙塞拉特岛', '950000', 'mengsailatedao');
INSERT INTO `ot_region` VALUES ('950400', 2, '城市', 'm', 'mlg', '摩洛哥', '950000', 'moluoge');
INSERT INTO `ot_region` VALUES ('950800', 2, '城市', 'm', 'msbk', '莫桑比克', '950000', 'mosangbike');
INSERT INTO `ot_region` VALUES ('951200', 2, '城市', 'a', 'am', '阿曼', '950000', 'aman');
INSERT INTO `ot_region` VALUES ('951600', 2, '城市', 'n', 'nmby', '纳米比亚', '950000', 'namibiya');
INSERT INTO `ot_region` VALUES ('952000', 2, '城市', 'n', 'nl', '瑙鲁', '950000', 'naolu');
INSERT INTO `ot_region` VALUES ('952400', 2, '城市', 'n', 'nbe', '尼泊尔', '950000', 'niboer');
INSERT INTO `ot_region` VALUES ('952800', 2, '城市', 'h', 'hl', '荷兰', '950000', 'helan');
INSERT INTO `ot_region` VALUES ('953300', 2, '城市', 'a', 'alb', '阿鲁巴', '950000', 'aluba');
INSERT INTO `ot_region` VALUES ('953500', 2, '城市', 'h', 'hljlbq', '荷兰加勒比区', '950000', 'helanjialebiqu');
INSERT INTO `ot_region` VALUES ('954000', 2, '城市', 'x', 'xkldny', '新喀里多尼亚', '950000', 'xinkaliduoniya');
INSERT INTO `ot_region` VALUES ('954800', 2, '城市', 'w', 'wnat', '瓦努阿图', '950000', 'wanuatu');
INSERT INTO `ot_region` VALUES ('955400', 2, '城市', 'x', 'xxl', '新西兰', '950000', 'xinxilan');
INSERT INTO `ot_region` VALUES ('955800', 2, '城市', 'n', 'njlg', '尼加拉瓜', '950000', 'nijialagua');
INSERT INTO `ot_region` VALUES ('956200', 2, '城市', 'n', 'nre', '尼日尔', '950000', 'nirier');
INSERT INTO `ot_region` VALUES ('956600', 2, '城市', 'n', 'nrly', '尼日利亚', '950000', 'niriliya');
INSERT INTO `ot_region` VALUES ('957000', 2, '城市', 'n', 'na', '纽埃', '950000', 'niuai');
INSERT INTO `ot_region` VALUES ('957400', 2, '城市', 'n', 'nfkd', '诺福克岛', '950000', 'nuofukedao');
INSERT INTO `ot_region` VALUES ('957800', 2, '城市', 'n', 'nw', '挪威', '950000', 'nuowei');
INSERT INTO `ot_region` VALUES ('958000', 2, '城市', 'b', 'bmlynqd', '北马里亚纳群岛', '950000', 'beimaliyanaqundao');
INSERT INTO `ot_region` VALUES ('958100', 2, '城市', 'm', 'mgbtwxdy', '美国本土外小岛屿', '950000', 'meiguobentuwaixiaodaoyu');
INSERT INTO `ot_region` VALUES ('958300', 2, '城市', 'm', 'mklnxylb', '密克罗尼西亚联邦', '950000', 'mikeluonixiyalianbang');
INSERT INTO `ot_region` VALUES ('958400', 2, '城市', 'm', 'mseqd', '马绍尔群岛', '950000', 'mashaoerqundao');
INSERT INTO `ot_region` VALUES ('958500', 2, '城市', 'p', 'pl', '帕劳', '950000', 'palao');
INSERT INTO `ot_region` VALUES ('958600', 2, '城市', 'b', 'bjst', '巴基斯坦', '950000', 'bajisitan');
INSERT INTO `ot_region` VALUES ('959100', 2, '城市', 'b', 'bnm', '巴拿马', '950000', 'banama');
INSERT INTO `ot_region` VALUES ('959800', 2, '城市', 'b', 'bbyxjny', '巴布亚新几内亚', '950000', 'babuyaxinjineiya');
INSERT INTO `ot_region` VALUES ('960000', 2, '城市', 'b', 'blg', '巴拉圭', '960000', 'balagui');
INSERT INTO `ot_region` VALUES ('960400', 2, '城市', 'm', 'ml', '秘鲁', '960000', 'milu');
INSERT INTO `ot_region` VALUES ('960800', 2, '城市', 'f', 'flb', '菲律宾', '960000', 'feilu:bin');
INSERT INTO `ot_region` VALUES ('961200', 2, '城市', 'p', 'ptkeqd', '皮特凯恩群岛', '960000', 'pitekaienqundao');
INSERT INTO `ot_region` VALUES ('961600', 2, '城市', 'b', 'bl', '波兰', '960000', 'bolan');
INSERT INTO `ot_region` VALUES ('962000', 2, '城市', 'p', 'pty', '葡萄牙', '960000', 'putaoya');
INSERT INTO `ot_region` VALUES ('962400', 2, '城市', 'j', 'jnybs', '几内亚比绍', '960000', 'jineiyabishao');
INSERT INTO `ot_region` VALUES ('962600', 2, '城市', 'd', 'ddw', '东帝汶', '960000', 'dongdiwen');
INSERT INTO `ot_region` VALUES ('963000', 2, '城市', 'b', 'bdlg', '波多黎各', '960000', 'boduolige');
INSERT INTO `ot_region` VALUES ('963400', 2, '城市', 'k', 'kte', '卡塔尔', '960000', 'kataer');
INSERT INTO `ot_region` VALUES ('963800', 2, '城市', 'l', 'lnw', '留尼汪', '960000', 'liuniwang');
INSERT INTO `ot_region` VALUES ('964200', 2, '城市', 'l', 'lmny', '罗马尼亚', '960000', 'luomaniya');
INSERT INTO `ot_region` VALUES ('964300', 2, '城市', 'e', 'els', '俄罗斯', '960000', 'eluosi');
INSERT INTO `ot_region` VALUES ('964600', 2, '城市', 'l', 'lwd', '卢旺达', '960000', 'luwangda');
INSERT INTO `ot_region` VALUES ('965200', 2, '城市', 's', 'sbtlmd', '圣巴泰勒米岛', '960000', 'shengbatailemidao');
INSERT INTO `ot_region` VALUES ('965400', 2, '城市', 's', 'shln', '圣赫勒拿', '960000', 'shenghelena');
INSERT INTO `ot_region` VALUES ('965900', 2, '城市', 's', 'sjchnws', '圣基茨和尼维斯', '960000', 'shengjiciheniweisi');
INSERT INTO `ot_region` VALUES ('966000', 2, '城市', 'a', 'agl', '安圭拉', '960000', 'anguila');
INSERT INTO `ot_region` VALUES ('966200', 2, '城市', 's', 'slxy', '圣卢西亚', '960000', 'shengluxiya');
INSERT INTO `ot_region` VALUES ('966300', 2, '城市', 'f', 'fssmd', '法属圣马丁', '960000', 'fashushengmading');
INSERT INTO `ot_region` VALUES ('966600', 2, '城市', 's', 'spaehmkl', '圣皮埃尔和密克隆', '960000', 'shengpiaierhemikelong');
INSERT INTO `ot_region` VALUES ('967000', 2, '城市', 's', 'swsthglnds', '圣文森特和格林纳丁斯', '960000', 'shengwensentehegelinnadingsi');
INSERT INTO `ot_region` VALUES ('967400', 2, '城市', 's', 'smln', '圣马力诺', '960000', 'shengmalinuo');
INSERT INTO `ot_region` VALUES ('967800', 2, '城市', 's', 'sdmhplxb', '圣多美和普林西比', '960000', 'shengduomeihepulinxibi');
INSERT INTO `ot_region` VALUES ('968200', 2, '城市', 's', 'stalb', '沙特阿拉伯', '960000', 'shatealabo');
INSERT INTO `ot_region` VALUES ('968600', 2, '城市', 's', 'snje', '塞内加尔', '960000', 'saineijiaer');
INSERT INTO `ot_region` VALUES ('968800', 2, '城市', 's', 'sewy', '塞尔维亚', '960000', 'saierweiya');
INSERT INTO `ot_region` VALUES ('969000', 2, '城市', 's', 'sse', '塞舌尔', '960000', 'saisheer');
INSERT INTO `ot_region` VALUES ('969400', 2, '城市', 's', 'slla', '塞拉利昂', '960000', 'sailaliang');
INSERT INTO `ot_region` VALUES ('970200', 2, '城市', 'x', 'xjp', '新加坡', '970000', 'xinjiapo');
INSERT INTO `ot_region` VALUES ('970300', 2, '城市', 's', 'slfk', '斯洛伐克', '970000', 'siluofake');
INSERT INTO `ot_region` VALUES ('970400', 2, '城市', 'y', 'yn', '越南', '970000', 'yuenan');
INSERT INTO `ot_region` VALUES ('970500', 2, '城市', 's', 'slwny', '斯洛文尼亚', '970000', 'siluowenniya');
INSERT INTO `ot_region` VALUES ('970600', 2, '城市', 's', 'sml', '索马里', '970000', 'suomali');
INSERT INTO `ot_region` VALUES ('971000', 2, '城市', 'n', 'nf', '南非', '970000', 'nanfei');
INSERT INTO `ot_region` VALUES ('971600', 2, '城市', 'j', 'jbbw', '津巴布韦', '970000', 'jinbabuwei');
INSERT INTO `ot_region` VALUES ('972400', 2, '城市', 'x', 'xby', '西班牙', '970000', 'xibanya');
INSERT INTO `ot_region` VALUES ('972800', 2, '城市', 'n', 'nsd', '南苏丹', '970000', 'nansudan');
INSERT INTO `ot_region` VALUES ('972900', 2, '城市', 's', 'sd', '苏丹', '970000', 'sudan');
INSERT INTO `ot_region` VALUES ('973200', 2, '城市', 'x', 'xshl', '西撒哈拉', '970000', 'xisahala');
INSERT INTO `ot_region` VALUES ('974000', 2, '城市', 's', 'sln', '苏里南', '970000', 'sulinan');
INSERT INTO `ot_region` VALUES ('974400', 2, '城市', 's', 'swebqdhymyd', '斯瓦尔巴群岛和 扬马延岛', '970000', 'siwaerbaqundaoheyangmayandao');
INSERT INTO `ot_region` VALUES ('974800', 2, '城市', 's', 'swsl', '斯威士兰', '970000', 'siweishilan');
INSERT INTO `ot_region` VALUES ('975200', 2, '城市', 'r', 'rd', '瑞典', '970000', 'ruidian');
INSERT INTO `ot_region` VALUES ('975600', 2, '城市', 'r', 'rs', '瑞士', '970000', 'ruishi');
INSERT INTO `ot_region` VALUES ('976000', 2, '城市', 'x', 'xly', '叙利亚', '970000', 'xuliya');
INSERT INTO `ot_region` VALUES ('976200', 2, '城市', 't', 'tjkst', '塔吉克斯坦', '970000', 'tajikesitan');
INSERT INTO `ot_region` VALUES ('976400', 2, '城市', 't', 'tg', '泰国', '970000', 'taiguo');
INSERT INTO `ot_region` VALUES ('976800', 2, '城市', 'd', 'dg', '多哥', '970000', 'duoge');
INSERT INTO `ot_region` VALUES ('977200', 2, '城市', 't', 'tkl', '托克劳', '970000', 'tuokelao');
INSERT INTO `ot_region` VALUES ('977600', 2, '城市', 't', 'tj', '汤加', '970000', 'tangjia');
INSERT INTO `ot_region` VALUES ('978000', 2, '城市', 't', 'tlndhdbg', '特立尼达和多巴哥', '970000', 'telinidaheduobage');
INSERT INTO `ot_region` VALUES ('978400', 2, '城市', 'a', 'alq', '阿联酋', '970000', 'alianqiu');
INSERT INTO `ot_region` VALUES ('978800', 2, '城市', 't', 'tns', '突尼斯', '970000', 'tunisi');
INSERT INTO `ot_region` VALUES ('979200', 2, '城市', 't', 'teq', '土耳其', '970000', 'tuerqi');
INSERT INTO `ot_region` VALUES ('979500', 2, '城市', 't', 'tkmst', '土库曼斯坦', '970000', 'tukumansitan');
INSERT INTO `ot_region` VALUES ('979600', 2, '城市', 't', 'tkshkksqd', '特克斯和凯科斯群岛', '970000', 'tekesihekaikesiqundao');
INSERT INTO `ot_region` VALUES ('979800', 2, '城市', 't', 'twl', '图瓦卢', '970000', 'tuwalu');
INSERT INTO `ot_region` VALUES ('980000', 2, '城市', 'w', 'wgd', '乌干达', '980000', 'wuganda');
INSERT INTO `ot_region` VALUES ('980400', 2, '城市', 'w', 'wkl', '乌克兰', '980000', 'wukelan');
INSERT INTO `ot_region` VALUES ('980700', 2, '城市', 'm', 'mqd', '马其顿', '980000', 'maqidun');
INSERT INTO `ot_region` VALUES ('981800', 2, '城市', 'a', 'aj', '埃及', '980000', 'aiji');
INSERT INTO `ot_region` VALUES ('982600', 2, '城市', 'y', 'yg', '英国', '980000', 'yingguo');
INSERT INTO `ot_region` VALUES ('983100', 2, '城市', 'g', 'gxd', '根西岛', '980000', 'genxidao');
INSERT INTO `ot_region` VALUES ('983200', 2, '城市', 'z', 'zxd', '泽西岛', '980000', 'zexidao');
INSERT INTO `ot_region` VALUES ('983300', 2, '城市', 'm', 'med', '马恩岛', '980000', 'maendao');
INSERT INTO `ot_region` VALUES ('983400', 2, '城市', 't', 'tsny', '坦桑尼亚', '980000', 'tansangniya');
INSERT INTO `ot_region` VALUES ('984000', 2, '城市', 'm', 'mg', '美国', '980000', 'meiguo');
INSERT INTO `ot_region` VALUES ('985000', 2, '城市', 'm', 'mswejqd', '美属维尔京群岛', '980000', 'meishuweierjingqundao');
INSERT INTO `ot_region` VALUES ('985400', 2, '城市', 'b', 'bjnfs', '布基纳法索', '980000', 'bujinafasuo');
INSERT INTO `ot_region` VALUES ('985800', 2, '城市', 'w', 'wlg', '乌拉圭', '980000', 'wulagui');
INSERT INTO `ot_region` VALUES ('986000', 2, '城市', 'w', 'wzbkst', '乌兹别克斯坦', '980000', 'wuzibiekesitan');
INSERT INTO `ot_region` VALUES ('986200', 2, '城市', 'w', 'wnrl', '委内瑞拉', '980000', 'weineiruila');
INSERT INTO `ot_region` VALUES ('987600', 2, '城市', 'w', 'wlshftn', '瓦利斯和富图纳', '980000', 'walisihefutuna');
INSERT INTO `ot_region` VALUES ('988200', 2, '城市', 's', 'smy', '萨摩亚', '980000', 'samoya');
INSERT INTO `ot_region` VALUES ('988700', 2, '城市', 'y', 'ym', '也门', '980000', 'yemen');
INSERT INTO `ot_region` VALUES ('989400', 2, '城市', 'z', 'zby', '赞比亚', '980000', 'zanbiya');
COMMIT;

-- ----------------------------
-- Table structure for ot_sys_api_list
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_api_list`;
CREATE TABLE `ot_sys_api_list` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `api_name` varchar(40) NOT NULL COMMENT 'API名称',
  `api_tag` varchar(40) DEFAULT NULL COMMENT 'API tag',
  `api_url` varchar(100) NOT NULL COMMENT 'APIUrl',
  `by_order` int(3) DEFAULT NULL COMMENT '排序',
  `parent_id` varchar(40) DEFAULT NULL COMMENT '父节点ID',
  `shiro_code` varchar(40) DEFAULT NULL COMMENT 'Shiro编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统API列表';

-- ----------------------------
-- Records of ot_sys_api_list
-- ----------------------------
BEGIN;
INSERT INTO `ot_sys_api_list` VALUES ('e06697f0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '应用品牌列表', '应用相关', '/api/app_brand/brand/list', NULL, NULL, 'app:brand:list');
INSERT INTO `ot_sys_api_list` VALUES ('e066e610943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '应用品牌详情', '应用相关', '/api/app_brand/brand/ma_config/{id}', NULL, NULL, 'app:brand:list');
INSERT INTO `ot_sys_api_list` VALUES ('e0673430943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '应用品牌详情', '应用相关', '/api/app_brand/brand/details/{id}', NULL, NULL, 'app:brand:save');
INSERT INTO `ot_sys_api_list` VALUES ('e0675b40943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '应用品牌添加', '应用相关', '/api/app_brand/brand/save', NULL, NULL, 'app:brand:save');
INSERT INTO `ot_sys_api_list` VALUES ('e067a960943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '应用品牌删除', '应用相关', '/api/app_brand/brand/remove/{id}', NULL, NULL, 'app:brand:remove');
INSERT INTO `ot_sys_api_list` VALUES ('e067d070943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '应用小程序配置删除', '应用相关', '/api/app_brand/ma_config/remove/{id}', NULL, NULL, 'app:brand:remove');
INSERT INTO `ot_sys_api_list` VALUES ('e0681e90943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '小程序配置添加', '应用相关', '/api/app_brand/ma_config/save', NULL, NULL, 'app:brand:save');
INSERT INTO `ot_sys_api_list` VALUES ('e06845a0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '用户列表', '用户相关', '/api/user/login/list', NULL, NULL, 'user:login:list');
INSERT INTO `ot_sys_api_list` VALUES ('e06893c0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '小程序会话分页列表', '用户相关', '/api/user/ma_session/list', NULL, NULL, 'user:login:list');
INSERT INTO `ot_sys_api_list` VALUES ('e068bad0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '小程序会话列表', '用户相关', '/api/user/ma_session/_list', NULL, NULL, 'user:login:list');
INSERT INTO `ot_sys_api_list` VALUES ('e06908f0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '初始化数据', '地区数据', '/api/sysregion/init/{depth}', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e0693000943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '地区数据', '地区数据', '/api/sysregion/child/{parentId}', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e0697e20943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '地区数据', '地区数据', '/api/sysregion/depth/{depth}', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e069a530943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '所有数据', '地区数据', '/api/sysregion/all', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e069cc40943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '地区列表', '地区数据', '/api/sysregion/list', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e069f350943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '地区添加', '地区数据', '/api/sysregion/save', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e06a6880943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '任务创建更新', '系统任务', '/api/sys/jobs/details/save', NULL, NULL, 'sys:quartz_job:save');
INSERT INTO `ot_sys_api_list` VALUES ('e06a8f90943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '删除任务', '系统任务', '/api/sys/jobs/details/remove/{id}', NULL, NULL, 'sys:quartz_job:remove');
INSERT INTO `ot_sys_api_list` VALUES ('e06addb0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '任务创建更新', '系统任务', '/api/sys/jobs/trigger/save', NULL, NULL, 'sys:quartz_job:save');
INSERT INTO `ot_sys_api_list` VALUES ('e06b2bd0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '删除任务', '系统任务', '/api/sys/jobs/trigger/remove/{id}', NULL, NULL, 'sys:quartz_job:remove');
INSERT INTO `ot_sys_api_list` VALUES ('e06b52e0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '启动任务', '系统任务', '/api/sys/jobs/instance/start/{instanceId}', NULL, NULL, 'sys:quartz_job:opt');
INSERT INTO `ot_sys_api_list` VALUES ('e06ba100943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '暂停任务', '系统任务', '/api/sys/jobs/instance/pause/{instanceId}', NULL, NULL, 'sys:quartz_job:opt');
INSERT INTO `ot_sys_api_list` VALUES ('e06bc810943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '实例日志统计', '系统任务', '/api/sys/jobs/instance/logs/statistics', NULL, NULL, 'sys:quartz_job:list');
INSERT INTO `ot_sys_api_list` VALUES ('e06bef20943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '删除任务', '系统任务', '/api/sys/jobs/instance/remove/{instanceId}', NULL, NULL, 'sys:quartz_job:remove');
INSERT INTO `ot_sys_api_list` VALUES ('e06c3d40943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '任务列表', '系统任务', '/api/sys/jobs/details/list', NULL, NULL, 'sys:quartz_job:list');
INSERT INTO `ot_sys_api_list` VALUES ('e06c6450943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '任务列表', '系统任务', '/api/sys/jobs/trigger/list', NULL, NULL, 'sys:quartz_job:list');
INSERT INTO `ot_sys_api_list` VALUES ('e06c8b60943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '任务实例列表', '系统任务', '/api/sys/jobs/instance/list', NULL, NULL, 'sys:quartz_job:list');
INSERT INTO `ot_sys_api_list` VALUES ('e06cb270943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '任务实例创建', '系统任务', '/api/sys/jobs/instance/save', NULL, NULL, 'sys:quartz_job:save');
INSERT INTO `ot_sys_api_list` VALUES ('e06d0090943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '实例日志列表', '系统任务', '/api/sys/jobs/instance/logs/list', NULL, NULL, 'sys:quartz_job:list');
INSERT INTO `ot_sys_api_list` VALUES ('e06d27a0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, 'Avatar', '不受保护', '/api/insecure/avatar', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e06d75c0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '码值', '系统（管理）', '/api/syscode/cache', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e06d9cd0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '获取类型下一个序列值', '系统（管理）', '/api/syscode/type/last_code', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e06dc3e0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '获取下一个序列值', '系统（管理）', '/api/syscode/{typeCode}/last_code', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e06e1200943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '码类列表', '系统（管理）', '/api/syscode/type/list', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e06e3910943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '码类添加', '系统（管理）', '/api/syscode/type/save', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e06e6020943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '码类移除', '系统（管理）', '/api/syscode/type/remove/{id}', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e06e8730943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '码值列表', '系统（管理）', '/api/syscode/list', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e06eae40943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '码值添加', '系统（管理）', '/api/syscode/save', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e06efc60943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '码值移除', '系统（管理）', '/api/syscode/remove/{id}', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e06f2370943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '码值2', '系统（管理）', '/api/syscode/caches', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e06f4a80943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '同步表结构', '数据字典', '/api/sys/metadata/sync', NULL, NULL, 'sys:db:sync');
INSERT INTO `ot_sys_api_list` VALUES ('e06f7190943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '列表', '数据字典', '/api/sys/metadata/table/all_list', NULL, NULL, 'sys:db:list');
INSERT INTO `ot_sys_api_list` VALUES ('e06f98a0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '列表', '数据字典', '/api/sys/metadata/table/list', NULL, NULL, 'sys:db:list');
INSERT INTO `ot_sys_api_list` VALUES ('e06fbfb0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '表结构', '数据字典', '/api/sys/metadata/details/{id}', NULL, NULL, 'sys:db:list');
INSERT INTO `ot_sys_api_list` VALUES ('e06fe6c0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '在线用户', '会话管理', '/api/sys/users_online', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e07034e0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '注销用户', '会话管理', '/api/sys/force_logout', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e0705bf0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '在线会话数', '会话管理', '/api/sys/online_total', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e0708300943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '操作日志', '系统操作日志', '/api/sys/opt_log/list', NULL, NULL, 'sys:user:optLog');
INSERT INTO `ot_sys_api_list` VALUES ('e070aa10943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统菜单详情', '基础', '/api/sys/menu/detail/{id}', NULL, NULL, 'sys:menu:list');
INSERT INTO `ot_sys_api_list` VALUES ('e070f830943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统角色菜单列表', '基础', '/api/sys/role/menu/{roleId}', NULL, NULL, 'sys:role:list');
INSERT INTO `ot_sys_api_list` VALUES ('e0711f40943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统角色权限列表', '基础', '/api/sys/role/authorities/{roleId}', NULL, NULL, 'sys:role:list');
INSERT INTO `ot_sys_api_list` VALUES ('e0719470943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统菜单权限列表', '基础', '/api/sys/menu/authorities/{menuId}', NULL, NULL, 'sys:menu:grant');
INSERT INTO `ot_sys_api_list` VALUES ('e071bb80943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统权限列表', '基础', '/api/sys/authority/list', NULL, NULL, 'sys:authority:list');
INSERT INTO `ot_sys_api_list` VALUES ('e07209a0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统权限列表', '基础', '/api/sys/authority/_list', NULL, NULL, 'sys:authority:list');
INSERT INTO `ot_sys_api_list` VALUES ('e07230b0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '授权用户角色', '基础', '/api/sys/grant/user_roles', NULL, NULL, 'sys:user:grant');
INSERT INTO `ot_sys_api_list` VALUES ('e07257c0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '授权角色菜单', '基础', '/api/sys/grant/role_menu', NULL, NULL, 'sys:role:grant');
INSERT INTO `ot_sys_api_list` VALUES ('e072a5e0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '授权角色API权限', '基础', '/api/sys/grant/role_authorities', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e072ccf0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '授权菜单API权限', '基础', '/api/sys/grant/menu_authorities', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e072f400943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '唯一值检测', '基础', '/api/sys/unique/{selectType}', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e0731b10943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '类别选择', '基础', '/api/sys/select/{selectType}', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e0734220943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '类别选择', '基础', '/api/sys/selects/{selectTypes}', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e0739040943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统用户列表', '基础', '/api/sys/user/list', NULL, NULL, 'sys:user:list');
INSERT INTO `ot_sys_api_list` VALUES ('e073b750943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统用户添加', '基础', '/api/sys/user/save', NULL, NULL, 'sys:user:save');
INSERT INTO `ot_sys_api_list` VALUES ('e073de60943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统用户激活|锁定', '基础', '/api/sys/user/status/{id}/{active}', NULL, NULL, 'sys:user:lock');
INSERT INTO `ot_sys_api_list` VALUES ('e0740570943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统用户移除', '基础', '/api/sys/user/remove/{id}', NULL, NULL, 'sys:user:remove');
INSERT INTO `ot_sys_api_list` VALUES ('e0742c80943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统角色列表', '基础', '/api/sys/role/list', NULL, NULL, 'sys:role:list');
INSERT INTO `ot_sys_api_list` VALUES ('e0745390943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统角色添加', '基础', '/api/sys/role/save', NULL, NULL, 'sys:role:save');
INSERT INTO `ot_sys_api_list` VALUES ('e074a1b0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统角色移除', '基础', '/api/sys/role/remove/{id}', NULL, NULL, 'sys:role:remove');
INSERT INTO `ot_sys_api_list` VALUES ('e074c8c0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统菜单列表', '基础', '/api/sys/menu/list', NULL, NULL, 'sys:menu:list');
INSERT INTO `ot_sys_api_list` VALUES ('e074efd0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统菜单树形列表', '基础', '/api/sys/menu/tree_list', NULL, NULL, 'sys:menu:list');
INSERT INTO `ot_sys_api_list` VALUES ('e07516e0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统菜单添加', '基础', '/api/sys/menu/save', NULL, NULL, 'sys:menu:save');
INSERT INTO `ot_sys_api_list` VALUES ('e0753df0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统菜单移除', '基础', '/api/sys/menu/remove/{id}', NULL, NULL, 'sys:menu:remove');
INSERT INTO `ot_sys_api_list` VALUES ('e0756500943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统权限列表', '基础', '/api/sys/authority/tree_list', NULL, NULL, 'sys:authority:list');
INSERT INTO `ot_sys_api_list` VALUES ('e075b320943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统权限列表', '基础', '/api/sys/authority/select', NULL, NULL, 'sys:authority:list');
INSERT INTO `ot_sys_api_list` VALUES ('e075da30943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统权限添加', '基础', '/api/sys/authority/save', NULL, NULL, 'sys:authority:save');
INSERT INTO `ot_sys_api_list` VALUES ('e0760140943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统权限移除', '基础', '/api/sys/authority/remove/{id}', NULL, NULL, 'sys:authority:remove');
INSERT INTO `ot_sys_api_list` VALUES ('e0764f60943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, 'API列表', '基础', '/api/sys/apiList/list', NULL, NULL, 'sys:apiList:list');
INSERT INTO `ot_sys_api_list` VALUES ('e0767670943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, 'API添加', '基础', '/api/sys/apiList/save', NULL, NULL, 'sys:apiList:save');
INSERT INTO `ot_sys_api_list` VALUES ('e076c490943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, 'API移除', '基础', '/api/sys/apiList/remove/{id}', NULL, NULL, 'sys:apiList:remove');
INSERT INTO `ot_sys_api_list` VALUES ('e076eba0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '添加增量权限', '基础', '/api/sys/sync/authorities', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e07739c0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '获取用户登录信息', '系统（管理）', '/api/sys/user_info', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e07760d0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '用户重置密码', '系统（管理）', '/api/sys/reset_password', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e077aef0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '更新用户信息', '系统（管理）', '/api/sys/update/user_detail', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e077d600943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '获取用户信息', '系统（管理）', '/api/sys/user_detail', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e0782420943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '用户注销', '系统（管理）', '/api/login/logout', NULL, NULL, NULL);
INSERT INTO `ot_sys_api_list` VALUES ('e0784b30943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '系统用户登录', '系统（管理）', '/api/login/auth', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ot_sys_authority
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_authority`;
CREATE TABLE `ot_sys_authority` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `action` varchar(40) DEFAULT NULL COMMENT '动作',
  `authority_name` varchar(40) NOT NULL COMMENT '权限名称',
  `by_order` int(3) DEFAULT NULL COMMENT '排序',
  `domain` varchar(40) DEFAULT NULL COMMENT '业务',
  `module` varchar(40) NOT NULL COMMENT '权限模块',
  `parent_id` varchar(40) DEFAULT NULL COMMENT '父节点ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统API权限';

-- ----------------------------
-- Records of ot_sys_authority
-- ----------------------------
BEGIN;
INSERT INTO `ot_sys_authority` VALUES ('app', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, '#', '应用管理', NULL, 'app', 'app', NULL);
INSERT INTO `ot_sys_authority` VALUES ('app:brand', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, '#', '应用品牌', NULL, 'brand', 'app', 'app');
INSERT INTO `ot_sys_authority` VALUES ('app:brand:list', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'list', '列表', NULL, 'brand', 'app', 'app:brand');
INSERT INTO `ot_sys_authority` VALUES ('app:brand:remove', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'remove', '删除', NULL, 'brand', 'app', 'app:brand');
INSERT INTO `ot_sys_authority` VALUES ('app:brand:save', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'save', '保存', NULL, 'brand', 'app', 'app:brand');
INSERT INTO `ot_sys_authority` VALUES ('sys', '2020-05-12 18:39:37', '2020-05-13 13:55:07', NULL, '#', '系统管理', NULL, 'sys', 'sys', NULL);
INSERT INTO `ot_sys_authority` VALUES ('sys:apiList', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, '#', '接口列表', NULL, 'apiList', 'sys', 'sys');
INSERT INTO `ot_sys_authority` VALUES ('sys:apiList:list', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'list', '列表', NULL, 'apiList', 'sys', 'sys:apiList');
INSERT INTO `ot_sys_authority` VALUES ('sys:apiList:remove', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'remove', '删除', NULL, 'apiList', 'sys', 'sys:apiList');
INSERT INTO `ot_sys_authority` VALUES ('sys:apiList:save', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'save', '保存', NULL, 'apiList', 'sys', 'sys:apiList');
INSERT INTO `ot_sys_authority` VALUES ('sys:authority', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, '#', '权限管理', NULL, 'authority', 'sys', 'sys');
INSERT INTO `ot_sys_authority` VALUES ('sys:authority:list', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'list', '列表', NULL, 'authority', 'sys', 'sys:authority');
INSERT INTO `ot_sys_authority` VALUES ('sys:authority:remove', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'remove', '删除', NULL, 'authority', 'sys', 'sys:authority');
INSERT INTO `ot_sys_authority` VALUES ('sys:authority:save', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'save', '保存', NULL, 'authority', 'sys', 'sys:authority');
INSERT INTO `ot_sys_authority` VALUES ('sys:db', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, '#', '数据字典', NULL, 'db', 'sys', 'sys');
INSERT INTO `ot_sys_authority` VALUES ('sys:db:list', '2020-05-12 18:39:37', '2020-05-13 13:55:07', NULL, 'list', '列表', NULL, 'db', 'sys', 'sys:db');
INSERT INTO `ot_sys_authority` VALUES ('sys:db:sync', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'sync', '同步表结构', NULL, 'db', 'sys', 'sys:db');
INSERT INTO `ot_sys_authority` VALUES ('sys:menu', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, '#', '菜单管理', NULL, 'menu', 'sys', 'sys');
INSERT INTO `ot_sys_authority` VALUES ('sys:menu:grant', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'grant', '授权', NULL, 'menu', 'sys', 'sys:menu');
INSERT INTO `ot_sys_authority` VALUES ('sys:menu:list', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'list', '列表', NULL, 'menu', 'sys', 'sys:menu');
INSERT INTO `ot_sys_authority` VALUES ('sys:menu:remove', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'remove', '删除', NULL, 'menu', 'sys', 'sys:menu');
INSERT INTO `ot_sys_authority` VALUES ('sys:menu:save', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'save', '保存', NULL, 'menu', 'sys', 'sys:menu');
INSERT INTO `ot_sys_authority` VALUES ('sys:quartz_job', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, '#', '定时任务', NULL, 'quartz_job', 'sys', 'sys');
INSERT INTO `ot_sys_authority` VALUES ('sys:quartz_job:list', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'list', '列表', NULL, 'quartz_job', 'sys', 'sys:quartz_job');
INSERT INTO `ot_sys_authority` VALUES ('sys:quartz_job:opt', '2020-05-12 18:39:37', '2020-05-13 13:55:07', NULL, 'opt', '启动，停止操作', NULL, 'quartz_job', 'sys', 'sys:quartz_job');
INSERT INTO `ot_sys_authority` VALUES ('sys:quartz_job:remove', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'remove', '删除', NULL, 'quartz_job', 'sys', 'sys:quartz_job');
INSERT INTO `ot_sys_authority` VALUES ('sys:quartz_job:save', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'save', '保存', NULL, 'quartz_job', 'sys', 'sys:quartz_job');
INSERT INTO `ot_sys_authority` VALUES ('sys:role', '2020-05-12 18:39:37', '2020-05-13 13:55:07', NULL, '#', '角色管理', NULL, 'role', 'sys', 'sys');
INSERT INTO `ot_sys_authority` VALUES ('sys:role:grant', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'grant', '授权', NULL, 'role', 'sys', 'sys:role');
INSERT INTO `ot_sys_authority` VALUES ('sys:role:list', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'list', '列表', NULL, 'role', 'sys', 'sys:role');
INSERT INTO `ot_sys_authority` VALUES ('sys:role:remove', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'remove', '删除', NULL, 'role', 'sys', 'sys:role');
INSERT INTO `ot_sys_authority` VALUES ('sys:role:save', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'save', '保存', NULL, 'role', 'sys', 'sys:role');
INSERT INTO `ot_sys_authority` VALUES ('sys:user', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, '#', '用户管理', NULL, 'user', 'sys', 'sys');
INSERT INTO `ot_sys_authority` VALUES ('sys:user:grant', '2020-05-12 18:39:37', '2020-05-13 13:55:07', NULL, 'grant', '角色授权', NULL, 'user', 'sys', 'sys:user');
INSERT INTO `ot_sys_authority` VALUES ('sys:user:list', '2020-05-12 18:39:37', '2020-05-13 13:55:07', NULL, 'list', '列表', NULL, 'user', 'sys', 'sys:user');
INSERT INTO `ot_sys_authority` VALUES ('sys:user:lock', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'lock', '锁定', NULL, 'user', 'sys', 'sys:user');
INSERT INTO `ot_sys_authority` VALUES ('sys:user:optLog', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'optLog', '操作日志', NULL, 'user', 'sys', 'sys:user');
INSERT INTO `ot_sys_authority` VALUES ('sys:user:remove', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, 'remove', '删除', NULL, 'user', 'sys', 'sys:user');
INSERT INTO `ot_sys_authority` VALUES ('sys:user:save', '2020-05-12 18:39:37', '2020-05-13 13:55:07', NULL, 'save', '保存', NULL, 'user', 'sys', 'sys:user');
INSERT INTO `ot_sys_authority` VALUES ('user', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, '#', '用户管理', NULL, 'user', 'user', NULL);
INSERT INTO `ot_sys_authority` VALUES ('user:login', '2020-05-12 18:39:37', '2020-05-13 13:55:06', NULL, '#', '用户列表', NULL, 'login', 'user', 'user');
INSERT INTO `ot_sys_authority` VALUES ('user:login:list', '2020-05-12 18:39:37', '2020-05-13 13:55:07', NULL, 'list', '列表', NULL, 'login', 'user', 'user:login');
COMMIT;

-- ----------------------------
-- Table structure for ot_sys_dic
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_dic`;
CREATE TABLE `ot_sys_dic` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `status` varchar(20) NOT NULL COMMENT '是否启用（码类：1000）',
  `type_code` varchar(20) NOT NULL COMMENT '码类编码',
  `val_code` varchar(20) NOT NULL COMMENT '码值编码',
  `val_name` varchar(40) NOT NULL COMMENT '码值名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典信息';

-- ----------------------------
-- Records of ot_sys_dic
-- ----------------------------
BEGIN;
INSERT INTO `ot_sys_dic` VALUES ('27ac0c00942c11ea81f21e6b7e443566', '2020-05-12 16:39:55', NULL, NULL, '100000', '1005', '100500', '微信');
INSERT INTO `ot_sys_dic` VALUES ('27ac8130942c11ea81f21e6b7e443566', '2020-05-12 16:39:55', NULL, NULL, '100000', '1005', '100501', '用户名');
INSERT INTO `ot_sys_dic` VALUES ('61a0fe00935711eaa6d7b27dc27070f1', '2020-05-11 15:16:50', NULL, NULL, '100000', '1005', '100500', '微信');
INSERT INTO `ot_sys_dic` VALUES ('61a17330935711eaa6d7b27dc27070f1', '2020-05-11 15:16:50', NULL, NULL, '100000', '1005', '100501', '用户名');
INSERT INTO `ot_sys_dic` VALUES ('e03093d0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1005', '100500', '微信');
INSERT INTO `ot_sys_dic` VALUES ('e0310900943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1005', '100501', '用户名');
INSERT INTO `ot_sys_dic` VALUES ('e0315720943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1004', '100400', '成功');
INSERT INTO `ot_sys_dic` VALUES ('e031cc50943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1004', '100401', '失败');
INSERT INTO `ot_sys_dic` VALUES ('e0321a70943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1003', '100300', '运行中');
INSERT INTO `ot_sys_dic` VALUES ('e0328fa0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1003', '100301', '暂停');
INSERT INTO `ot_sys_dic` VALUES ('e032ddc0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1003', '100302', '失败');
INSERT INTO `ot_sys_dic` VALUES ('e03352f0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1002', '100200', '固定频率');
INSERT INTO `ot_sys_dic` VALUES ('e033a110943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1002', '100201', '每日时间段');
INSERT INTO `ot_sys_dic` VALUES ('e033c820943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1002', '100202', 'CRON');
INSERT INTO `ot_sys_dic` VALUES ('e0341640943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1001', '100100', '男');
INSERT INTO `ot_sys_dic` VALUES ('e0346460943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1001', '100101', '女');
INSERT INTO `ot_sys_dic` VALUES ('e034b280943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1001', '100102', '未知');
INSERT INTO `ot_sys_dic` VALUES ('e03500a0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1000', '100000', '是');
INSERT INTO `ot_sys_dic` VALUES ('e03527b0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1000', '100001', '否');
COMMIT;

-- ----------------------------
-- Table structure for ot_sys_job_details
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_job_details`;
CREATE TABLE `ot_sys_job_details` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `clazz_path` varchar(200) NOT NULL COMMENT '任务执行方法',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `job_name` varchar(40) NOT NULL COMMENT '任务名称',
  `job_params` varchar(1000) DEFAULT NULL COMMENT '任务参数',
  `status` varchar(20) NOT NULL COMMENT '是否启用(1000)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统任务';

-- ----------------------------
-- Table structure for ot_sys_job_instance
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_job_instance`;
CREATE TABLE `ot_sys_job_instance` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `clazz_path` varchar(200) DEFAULT NULL COMMENT '任务执行方法',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `group_name` varchar(40) DEFAULT NULL COMMENT '组名称',
  `instance_id` varchar(40) NOT NULL COMMENT '任务实例ID',
  `instance_params` varchar(1000) DEFAULT NULL COMMENT '任务实例参数',
  `job_id` varchar(40) NOT NULL COMMENT '任务ID',
  `job_name` varchar(40) DEFAULT NULL COMMENT '任务名称',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `status` varchar(20) NOT NULL COMMENT '实例状态(1003)',
  `trigger_id` varchar(40) NOT NULL COMMENT '触发器ID',
  `trigger_rule` varchar(40) DEFAULT NULL COMMENT '触发规则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统任务实例';

-- ----------------------------
-- Table structure for ot_sys_job_run_log
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_job_run_log`;
CREATE TABLE `ot_sys_job_run_log` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '操作记录',
  `instance_id` varchar(40) NOT NULL COMMENT '任务实例ID',
  `result` varchar(1000) DEFAULT NULL COMMENT '返回结果',
  `status` varchar(20) NOT NULL COMMENT '实例状态(1004)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统任务运行日志';

-- ----------------------------
-- Table structure for ot_sys_job_trigger
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_job_trigger`;
CREATE TABLE `ot_sys_job_trigger` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `cron` varchar(20) DEFAULT NULL COMMENT 'Cron',
  `days_of_week` varchar(40) DEFAULT NULL COMMENT '需要执行的星期',
  `end_time_of_day` varchar(40) DEFAULT NULL COMMENT '每天结束时间',
  `_interval` int(10) DEFAULT NULL COMMENT '间隔',
  `interval_unit` varchar(20) DEFAULT NULL COMMENT '间隔单位',
  `repeat_count` int(10) DEFAULT NULL COMMENT '重复次数',
  `start_time_of_day` varchar(40) DEFAULT NULL COMMENT '每天开始时间',
  `trigger_name` varchar(40) NOT NULL COMMENT '触发器名称',
  `trigger_type` varchar(40) NOT NULL COMMENT '触发类型(1002)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务触发器';

-- ----------------------------
-- Table structure for ot_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_menu`;
CREATE TABLE `ot_sys_menu` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `by_order` int(3) DEFAULT NULL COMMENT '排序',
  `component` varchar(40) NOT NULL COMMENT '组件名称',
  `hidden` bit(1) DEFAULT b'0' COMMENT '是否隐藏',
  `meta` varchar(1000) DEFAULT NULL COMMENT 'Meta',
  `parent_id` varchar(40) DEFAULT NULL COMMENT '父节点ID',
  `path` varchar(40) DEFAULT NULL COMMENT '菜单路径',
  `redirect` varchar(40) DEFAULT NULL COMMENT 'redirect',
  `always_show` bit(1) DEFAULT b'0' COMMENT '始终显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统菜单列表';

-- ----------------------------
-- Records of ot_sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `ot_sys_menu` VALUES ('appBrandManager', '2020-05-12 18:39:37', NULL, NULL, 1, 'appBrandManager', b'0', '{\`icon\`:\`child\`,\`title\`:\`应用品牌\`}', 'appManager', 'brand_manager', NULL, b'0');
INSERT INTO `ot_sys_menu` VALUES ('appManager', '2020-05-12 18:39:37', NULL, NULL, 1, 'appManager', b'0', '{\`icon\`:\`app\`,\`title\`:\`应用管理\`}', NULL, '/app', NULL, b'1');
INSERT INTO `ot_sys_menu` VALUES ('sysApiListManager', '2020-05-12 18:39:37', NULL, NULL, 6, 'sysApiListManager', b'0', '{\`icon\`:\`child\`,\`title\`:\`接口列表\`}', 'systemManager', 'apiList_manager', NULL, b'0');
INSERT INTO `ot_sys_menu` VALUES ('sysAuthorityManager', '2020-05-12 18:39:37', NULL, NULL, 5, 'sysAuthorityManager', b'0', '{\`icon\`:\`child\`,\`title\`:\`接口权限\`}', 'systemManager', 'authority_manager', NULL, b'0');
INSERT INTO `ot_sys_menu` VALUES ('sysDicManager', '2020-05-12 18:39:37', NULL, NULL, 7, 'sysDicManager', b'0', '{\`icon\`:\`child\`,\`title\`:\`常量管理\`}', 'systemManager', 'dic_manager', NULL, b'0');
INSERT INTO `ot_sys_menu` VALUES ('sysJobManager', '2020-05-12 18:39:37', NULL, NULL, 4, 'sysJobManager', b'0', '{\`icon\`:\`child\`,\`title\`:\`定时任务\`}', 'systemManager', 'job_manager', NULL, b'0');
INSERT INTO `ot_sys_menu` VALUES ('sysMenuManager', '2020-05-12 18:39:37', NULL, NULL, 3, 'sysMenuManager', b'0', '{\`icon\`:\`child\`,\`title\`:\`菜单管理\`}', 'systemManager', 'menu_manager', NULL, b'0');
INSERT INTO `ot_sys_menu` VALUES ('sysMetadataManager', '2020-05-12 18:39:37', NULL, NULL, 9, 'sysMetadataManager', b'0', '{\`icon\`:\`child\`,\`title\`:\`数据字典\`}', 'systemManager', 'metadata_manager', NULL, b'0');
INSERT INTO `ot_sys_menu` VALUES ('sysOptLogManager', '2020-05-12 18:39:37', NULL, NULL, 10, 'sysOptLogManager', b'0', '{\`icon\`:\`child\`,\`title\`:\`操作日志\`}', 'systemManager', 'optLog_manager', NULL, b'0');
INSERT INTO `ot_sys_menu` VALUES ('sysRegionManager', '2020-05-12 18:39:37', NULL, NULL, 8, 'sysRegionManager', b'0', '{\`icon\`:\`child\`,\`title\`:\`地区管理\`}', 'systemManager', 'region_manager', NULL, b'0');
INSERT INTO `ot_sys_menu` VALUES ('sysRoleManager', '2020-05-12 18:39:37', NULL, NULL, 2, 'sysRoleManager', b'0', '{\`icon\`:\`child\`,\`title\`:\`角色管理\`}', 'systemManager', 'role_manager', NULL, b'0');
INSERT INTO `ot_sys_menu` VALUES ('systemManager', '2020-05-12 18:39:37', NULL, NULL, 2, 'systemManager', b'0', '{\`icon\`:\`system\`,\`title\`:\`系统管理\`}', NULL, '/sys', NULL, b'1');
INSERT INTO `ot_sys_menu` VALUES ('sysUserManager', '2020-05-12 18:39:37', NULL, NULL, 1, 'sysUserManager', b'0', '{\`icon\`:\`child\`,\`title\`:\`用户管理\`}', 'systemManager', 'user_manager', NULL, b'0');
INSERT INTO `ot_sys_menu` VALUES ('userLoginManager', '2020-05-12 18:39:37', NULL, NULL, 1, 'userLoginManager', b'0', '{\`icon\`:\`child\`,\`title\`:\`用户列表\`}', 'userManager', 'user_manager', NULL, b'0');
INSERT INTO `ot_sys_menu` VALUES ('userManager', '2020-05-12 18:39:37', NULL, NULL, 0, 'userManager', b'0', '{\`icon\`:\`user\`,\`title\`:\`用户管理\`}', NULL, '/user', NULL, b'1');
COMMIT;

-- ----------------------------
-- Table structure for ot_sys_menu_authority_rel
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_menu_authority_rel`;
CREATE TABLE `ot_sys_menu_authority_rel` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `authority_id` varchar(40) NOT NULL COMMENT '权限ID',
  `menu_id` varchar(40) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限关联';

-- ----------------------------
-- Table structure for ot_sys_opt_log
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_opt_log`;
CREATE TABLE `ot_sys_opt_log` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '操作记录',
  `ip_geo` varchar(80) DEFAULT NULL COMMENT 'IP来源',
  `operator` varchar(40) NOT NULL COMMENT '操作人',
  `opt_ip` varchar(40) DEFAULT NULL COMMENT 'IP',
  `opt_name` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `request_data` varchar(2000) DEFAULT NULL COMMENT '请求数据',
  `request_url` varchar(100) DEFAULT NULL COMMENT '请求地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户操作日志';

-- ----------------------------
-- Records of ot_sys_opt_log
-- ----------------------------
BEGIN;
INSERT INTO `ot_sys_opt_log` VALUES ('11a7d11094df11ea99c600163e08b76e', '2020-05-13 14:00:38', NULL, '成都市', 'admin', '112.19.161.12', '系统用户注销', NULL, '/shop_test/api/login/logout');
INSERT INTO `ot_sys_opt_log` VALUES ('12bb63f094df11ea99c600163e08b76e', '2020-05-13 14:00:40', NULL, '成都市', 'system', '112.19.161.12', '系统用户登录', '[{\`password\`:\`123123\`,\`username\`:\`demo\`}]', '/shop_test/api/login/auth');
INSERT INTO `ot_sys_opt_log` VALUES ('16d3a0c094de11ea99c600163e08b76e', '2020-05-13 13:53:37', NULL, '成都市', 'system', '112.19.161.12', '系统用户登录', '[{\`password\`:\`123123\`,\`username\`:\`admin\`}]', '/shop_test/api/login/auth');
INSERT INTO `ot_sys_opt_log` VALUES ('428063c094c511ea95a900163e08b76e', '2020-05-13 10:55:53', NULL, '成都市', 'admin', '112.19.161.12', '系统用户注销', NULL, '/shop_test/api/login/logout');
INSERT INTO `ot_sys_opt_log` VALUES ('451215b094c611ea95a900163e08b76e', '2020-05-13 11:03:07', NULL, '成都市', 'system', '112.19.161.12', '系统用户登录', '[{\`password\`:\`123123\`,\`username\`:\`admin\`}]', '/shop_test/api/login/auth');
INSERT INTO `ot_sys_opt_log` VALUES ('498beff094c411ea95a900163e08b76e', '2020-05-13 10:48:56', NULL, '成都市', 'admin', '112.19.161.12', '系统用户注销', NULL, '/shop_test/api/login/logout');
INSERT INTO `ot_sys_opt_log` VALUES ('4c13d35094c411ea95a900163e08b76e', '2020-05-13 10:49:00', NULL, '成都市', 'system', '112.19.161.12', '系统用户登录', '[{\`password\`:\`123123\`,\`username\`:\`admin\`}]', '/shop_test/api/login/auth');
INSERT INTO `ot_sys_opt_log` VALUES ('4f12959094de11ea99c600163e08b76e', '2020-05-13 13:55:12', NULL, '成都市', 'admin', '112.19.161.12', '系统用户注销', NULL, '/shop_test/api/login/logout');
INSERT INTO `ot_sys_opt_log` VALUES ('50cc2c7094de11ea99c600163e08b76e', '2020-05-13 13:55:15', NULL, '成都市', 'system', '112.19.161.12', '系统用户登录', '[{\`password\`:\`123123\`,\`username\`:\`demo\`}]', '/shop_test/api/login/auth');
INSERT INTO `ot_sys_opt_log` VALUES ('8371287094c911ea915000163e08b76e', '2020-05-13 11:26:20', NULL, '成都市', 'system', '112.19.161.12', '系统用户登录', '[{\`password\`:\`123123\`,\`username\`:\`admin\`}]', '/shop_test/api/login/auth');
INSERT INTO `ot_sys_opt_log` VALUES ('86bea5f094ee11ea99c600163e08b76e', '2020-05-13 15:51:17', NULL, '成都市', 'system', '112.19.161.12', '系统用户登录', '[{\`password\`:\`123123\`,\`username\`:\`admin\`}]', '/shop_test/api/login/auth');
INSERT INTO `ot_sys_opt_log` VALUES ('8f91a0f094c711ea95a900163e08b76e', '2020-05-13 11:12:22', NULL, '成都市', 'admin', '112.19.161.12', '系统用户注销', NULL, '/shop_test/api/login/logout');
INSERT INTO `ot_sys_opt_log` VALUES ('928b58f094c711ea95a900163e08b76e', '2020-05-13 11:12:27', NULL, '成都市', 'system', '112.19.161.12', '系统用户登录', '[{\`password\`:\`123123\`,\`username\`:\`demo\`}]', '/shop_test/api/login/auth');
INSERT INTO `ot_sys_opt_log` VALUES ('c921132094de11ea99c600163e08b76e', '2020-05-13 13:58:37', NULL, '成都市', 'demo', '112.19.161.12', '系统用户注销', NULL, '/shop_test/api/login/logout');
INSERT INTO `ot_sys_opt_log` VALUES ('cb18eb8094de11ea99c600163e08b76e', '2020-05-13 13:58:40', NULL, '成都市', 'system', '112.19.161.12', '系统用户登录', '[{\`password\`:\`123123\`,\`username\`:\`admin\`}]', '/shop_test/api/login/auth');
INSERT INTO `ot_sys_opt_log` VALUES ('f5756a8094f611ea99c600163e08b76e', '2020-05-13 16:51:39', NULL, '成都市', 'system', '112.19.161.12', '系统用户登录', '[{\`password\`:\`123123\`,\`username\`:\`demo\`}]', '/shop_test/api/login/auth');
COMMIT;

-- ----------------------------
-- Table structure for ot_sys_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_quartz_job`;
CREATE TABLE `ot_sys_quartz_job` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `clazz_path` varchar(200) NOT NULL COMMENT '任务执行方法',
  `cron` varchar(20) NOT NULL COMMENT 'Cron',
  `job_code` varchar(40) NOT NULL COMMENT '任务编号（唯一）',
  `job_name` varchar(40) NOT NULL COMMENT '任务名称',
  `status` varchar(20) NOT NULL COMMENT '状态(1000)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK3woc49ofk3k4gw8u1t2bq7e1p` (`job_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Quartz定时任务';

-- ----------------------------
-- Table structure for ot_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_role`;
CREATE TABLE `ot_sys_role` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `role_code` varchar(40) NOT NULL COMMENT '角色编码(唯一)',
  `role_name` varchar(40) NOT NULL COMMENT '角色名称',
  `status` varchar(20) NOT NULL COMMENT '是否启用（码类：1000）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6hft9bir8o0lk25wdjd97hwc2` (`role_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统角色信息';

-- ----------------------------
-- Records of ot_sys_role
-- ----------------------------
BEGIN;
INSERT INTO `ot_sys_role` VALUES ('admin', '2020-05-12 18:39:37', NULL, NULL, 'admin', 'admin', '100000');
INSERT INTO `ot_sys_role` VALUES ('demo', '2020-05-13 11:10:16', '2020-05-13 11:12:03', 'Demo 账号', 'demo', 'demo', '100000');
COMMIT;

-- ----------------------------
-- Table structure for ot_sys_role_authority_rel
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_role_authority_rel`;
CREATE TABLE `ot_sys_role_authority_rel` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `authority_id` varchar(40) NOT NULL COMMENT '权限ID',
  `role_id` varchar(40) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色权限关联';

-- ----------------------------
-- Records of ot_sys_role_authority_rel
-- ----------------------------
BEGIN;
INSERT INTO `ot_sys_role_authority_rel` VALUES ('6fd90dc094c711ea95a900163e08b76e', '2020-05-13 11:11:28', NULL, NULL, 'app:brand:list', 'demo');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('6fd9aa0094c711ea95a900163e08b76e', '2020-05-13 11:11:28', NULL, NULL, 'sys:apiList:list', 'demo');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('6fda1f3094c711ea95a900163e08b76e', '2020-05-13 11:11:28', NULL, NULL, 'sys:authority:list', 'demo');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('6fda946094c711ea95a900163e08b76e', '2020-05-13 11:11:28', NULL, NULL, 'sys:db:list', 'demo');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('6fdb099094c711ea95a900163e08b76e', '2020-05-13 11:11:28', NULL, NULL, 'sys:menu:list', 'demo');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('6fdb7ec094c711ea95a900163e08b76e', '2020-05-13 11:11:28', NULL, NULL, 'sys:quartz_job:list', 'demo');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('6fdbf3f094c711ea95a900163e08b76e', '2020-05-13 11:11:28', NULL, NULL, 'sys:role:list', 'demo');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('6fdc692094c711ea95a900163e08b76e', '2020-05-13 11:11:28', NULL, NULL, 'sys:user:list', 'demo');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('6fdcde5094c711ea95a900163e08b76e', '2020-05-13 11:11:28', NULL, NULL, 'sys:user:optLog', 'demo');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('6fdd538094c711ea95a900163e08b76e', '2020-05-13 11:11:28', NULL, NULL, 'user:login:list', 'demo');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e095be40943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'app', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0963370943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'app:brand', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e096a8a0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'app:brand:list', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09744e0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'app:brand:remove', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e097ba10943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'app:brand:save', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0982f40943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e098a470943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:apiList', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09919a0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:apiList:list', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0998ed0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:apiList:remove', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09a0400943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:apiList:save', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09a5220943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:authority', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09aa040943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:authority:list', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09b1570943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:authority:remove', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09b8aa0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:authority:save', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09bffd0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:db', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09c4df0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:db:list', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09cc320943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:db:sync', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09d3850943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:menu', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09d8670943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:menu:grant', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09dfba0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:menu:list', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09e49c0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:menu:remove', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09e97e0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:menu:save', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09ee600943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:quartz_job', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09f5b30943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:quartz_job:list', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e09fa950943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:quartz_job:opt', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a01e80943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:quartz_job:remove', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a06ca0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:quartz_job:save', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a0e1d0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:role', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a12ff0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:role:grant', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a17e10943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:role:list', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a1cc30943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:role:remove', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a21a50943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:role:save', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a28f80943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:user', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a2dda0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:user:grant', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a352d0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:user:list', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a3a0f0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:user:lock', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a3ef10943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:user:optLog', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a43d30943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:user:remove', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a4b260943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'sys:user:save', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a50080943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'user', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a575b0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'user:login', 'admin');
INSERT INTO `ot_sys_role_authority_rel` VALUES ('e0a5eae0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'user:login:list', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for ot_sys_role_menu_rel
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_role_menu_rel`;
CREATE TABLE `ot_sys_role_menu_rel` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `half` bit(1) NOT NULL COMMENT '是否半选',
  `menu_id` varchar(40) NOT NULL COMMENT '菜单ID',
  `role_id` varchar(40) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色菜单关联';

-- ----------------------------
-- Records of ot_sys_role_menu_rel
-- ----------------------------
BEGIN;
INSERT INTO `ot_sys_role_menu_rel` VALUES ('0e16940094df11ea99c600163e08b76e', '2020-05-13 14:00:32', NULL, NULL, b'0', 'userManager', 'demo');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('0e17f39094df11ea99c600163e08b76e', '2020-05-13 14:00:32', NULL, NULL, b'0', 'userLoginManager', 'demo');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('0e1868c094df11ea99c600163e08b76e', '2020-05-13 14:00:32', NULL, NULL, b'0', 'appManager', 'demo');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('0e19a14094df11ea99c600163e08b76e', '2020-05-13 14:00:32', NULL, NULL, b'0', 'appBrandManager', 'demo');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('0e1a167094df11ea99c600163e08b76e', '2020-05-13 14:00:32', NULL, NULL, b'0', 'sysUserManager', 'demo');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('0e1ab2b094df11ea99c600163e08b76e', '2020-05-13 14:00:32', NULL, NULL, b'0', 'sysRoleManager', 'demo');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('0e1b760094df11ea99c600163e08b76e', '2020-05-13 14:00:32', NULL, NULL, b'0', 'sysMenuManager', 'demo');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('0e1c395094df11ea99c600163e08b76e', '2020-05-13 14:00:32', NULL, NULL, b'0', 'sysJobManager', 'demo');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('0e1dbff094df11ea99c600163e08b76e', '2020-05-13 14:00:32', NULL, NULL, b'0', 'sysAuthorityManager', 'demo');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('0e1e834094df11ea99c600163e08b76e', '2020-05-13 14:00:32', NULL, NULL, b'0', 'sysApiListManager', 'demo');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('0e1f1f8094df11ea99c600163e08b76e', '2020-05-13 14:00:32', NULL, NULL, b'0', 'sysDicManager', 'demo');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('0e1fe2d094df11ea99c600163e08b76e', '2020-05-13 14:00:32', NULL, NULL, b'0', 'sysRegionManager', 'demo');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('0e20580094df11ea99c600163e08b76e', '2020-05-13 14:00:32', NULL, NULL, b'0', 'sysMetadataManager', 'demo');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('0e211b5094df11ea99c600163e08b76e', '2020-05-13 14:00:32', NULL, NULL, b'1', 'systemManager', 'demo');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('e0a6ae30943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, b'0', 'appBrandManager', 'admin');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('e0a6fc50943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, b'0', 'appManager', 'admin');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('e0a74a70943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, b'0', 'sysApiListManager', 'admin');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('e0a79890943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, b'0', 'sysAuthorityManager', 'admin');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('e0a7e6b0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, b'0', 'sysDicManager', 'admin');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('e0a834d0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, b'0', 'sysJobManager', 'admin');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('e0a882f0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, b'0', 'sysMenuManager', 'admin');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('e0a8d110943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, b'0', 'sysMetadataManager', 'admin');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('e0a94640943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, b'0', 'sysOptLogManager', 'admin');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('e0a99460943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, b'0', 'sysRegionManager', 'admin');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('e0a9e280943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, b'0', 'sysRoleManager', 'admin');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('e0aa30a0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, b'0', 'systemManager', 'admin');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('e0aa7ec0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, b'0', 'sysUserManager', 'admin');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('e0aaf3f0943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, b'0', 'userLoginManager', 'admin');
INSERT INTO `ot_sys_role_menu_rel` VALUES ('e0ab4210943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, b'0', 'userManager', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for ot_sys_type_dic
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_type_dic`;
CREATE TABLE `ot_sys_type_dic` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `status` varchar(20) NOT NULL COMMENT '是否启用（码类：1000）',
  `type_code` varchar(20) NOT NULL COMMENT '码类编码(唯一)',
  `type_name` varchar(40) NOT NULL COMMENT '码类名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKp1je6kw6r7c5oyt7a7hxe2suv` (`type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典类型';

-- ----------------------------
-- Records of ot_sys_type_dic
-- ----------------------------
BEGIN;
INSERT INTO `ot_sys_type_dic` VALUES ('e02e49e0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1004', '运行状态');
INSERT INTO `ot_sys_type_dic` VALUES ('e02ebf10943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1003', '实例状态');
INSERT INTO `ot_sys_type_dic` VALUES ('e02f3440943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1002', '触发器类型');
INSERT INTO `ot_sys_type_dic` VALUES ('e02fa970943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1001', '性别');
INSERT INTO `ot_sys_type_dic` VALUES ('e0301ea0943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', NULL, NULL, '100000', '1000', '是否');
COMMIT;

-- ----------------------------
-- Table structure for ot_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_user`;
CREATE TABLE `ot_sys_user` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `active` bit(1) NOT NULL COMMENT '是否激活',
  `avatar` varchar(40) DEFAULT NULL COMMENT '用户头像',
  `email` varchar(40) DEFAULT NULL COMMENT '邮箱',
  `password` varchar(40) DEFAULT NULL COMMENT '用户密码',
  `phone_no` varchar(40) DEFAULT NULL COMMENT '手机号',
  `real_name` varchar(40) DEFAULT NULL COMMENT '真实姓名',
  `username` varchar(40) NOT NULL COMMENT '用户名(唯一)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKd4j618na2y009s6psvpb6rcnm` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户';

-- ----------------------------
-- Records of ot_sys_user
-- ----------------------------
BEGIN;
INSERT INTO `ot_sys_user` VALUES ('793f365094c711ea95a900163e08b76e', '2020-05-13 11:11:44', '2020-05-13 16:51:39', '激活用户', b'1', '5867419290', '', '4297f44b13955235245b2497399d7a93', '', 'Demo', 'demo');
INSERT INTO `ot_sys_user` VALUES ('e090b530943c11ea82b01e6b7e443566', '2020-05-12 18:39:37', '2020-05-13 15:51:17', NULL, b'1', '8180702398', NULL, '4297f44b13955235245b2497399d7a93', NULL, 'admin', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for ot_sys_user_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `ot_sys_user_role_rel`;
CREATE TABLE `ot_sys_user_role_rel` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `role_id` varchar(40) NOT NULL COMMENT '角色ID',
  `user_id` varchar(40) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户角色关联';

-- ----------------------------
-- Records of ot_sys_user_role_rel
-- ----------------------------
BEGIN;
INSERT INTO `ot_sys_user_role_rel` VALUES ('87b106f094c711ea95a900163e08b76e', '2020-05-13 11:12:08', NULL, NULL, 'demo', '793f365094c711ea95a900163e08b76e');
INSERT INTO `ot_sys_user_role_rel` VALUES ('e0ac2c70943c11ea82b01e6b7e443566', '2020-05-12 18:39:38', NULL, NULL, 'admin', 'e090b530943c11ea82b01e6b7e443566');
COMMIT;

-- ----------------------------
-- Table structure for ot_table_metadata
-- ----------------------------
DROP TABLE IF EXISTS `ot_table_metadata`;
CREATE TABLE `ot_table_metadata` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `pk_name` varchar(40) DEFAULT NULL COMMENT '主键',
  `remarks` varchar(400) DEFAULT NULL COMMENT '注释',
  `table_name` varchar(40) NOT NULL COMMENT '表名',
  `table_scheme` varchar(40) DEFAULT NULL COMMENT 'Scheme',
  `table_type` varchar(40) DEFAULT NULL COMMENT '表类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据字典表';

-- ----------------------------
-- Records of ot_table_metadata
-- ----------------------------
BEGIN;
INSERT INTO `ot_table_metadata` VALUES ('e0b09940943c11ea82b01e6b7e443566', 'id ', '应用品牌', 'ot_app_brand', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b13588943c11ea82b01e6b7e443566', 'id ', '应用小程序配置', 'ot_app_ma_config', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b1aabd943c11ea82b01e6b7e443566', 'id ', '数据字典列', 'ot_column_metadata', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b1f8d8943c11ea82b01e6b7e443566', 'id ', '地区数据', 'ot_region', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b26e08943c11ea82b01e6b7e443566', 'id ', '系统API列表', 'ot_sys_api_list', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b2e33a943c11ea82b01e6b7e443566', 'id ', '系统API权限', 'ot_sys_authority', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b3315a943c11ea82b01e6b7e443566', 'id ', '字典信息', 'ot_sys_dic', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b37f78943c11ea82b01e6b7e443566', 'id ', '系统任务', 'ot_sys_job_details', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b3cd99943c11ea82b01e6b7e443566', 'id ', '系统任务实例', 'ot_sys_job_instance', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b442cf943c11ea82b01e6b7e443566', 'id ', '系统任务运行日志', 'ot_sys_job_run_log', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b4b7f6943c11ea82b01e6b7e443566', 'id ', '任务触发器', 'ot_sys_job_trigger', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b5061d943c11ea82b01e6b7e443566', 'id ', '系统菜单列表', 'ot_sys_menu', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b57b41943c11ea82b01e6b7e443566', 'id ', '菜单权限关联', 'ot_sys_menu_authority_rel', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b5c966943c11ea82b01e6b7e443566', 'id ', '系统用户操作日志', 'ot_sys_opt_log', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b61789943c11ea82b01e6b7e443566', 'id ', 'Quartz定时任务', 'ot_sys_quartz_job', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b665a9943c11ea82b01e6b7e443566', 'id ', '系统角色信息', 'ot_sys_role', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b6b3c7943c11ea82b01e6b7e443566', 'id ', '角色权限关联', 'ot_sys_role_authority_rel', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b728f6943c11ea82b01e6b7e443566', 'id ', '角色菜单关联', 'ot_sys_role_menu_rel', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b77717943c11ea82b01e6b7e443566', 'id ', '字典类型', 'ot_sys_type_dic', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b7c537943c11ea82b01e6b7e443566', 'id ', '系统用户', 'ot_sys_user', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b83a6b943c11ea82b01e6b7e443566', 'id ', '用户角色关联', 'ot_sys_user_role_rel', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b8af96943c11ea82b01e6b7e443566', 'id ', '数据字典表', 'ot_table_metadata', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b8fdb6943c11ea82b01e6b7e443566', 'id ', '用户登录信息', 'ot_user_login', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b972f1943c11ea82b01e6b7e443566', 'id ', '用户登录日志', 'ot_user_login_log', NULL, NULL);
INSERT INTO `ot_table_metadata` VALUES ('e0b9e81a943c11ea82b01e6b7e443566', 'id ', '小程序会话密钥', 'ot_user_ma_session', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ot_user_login
-- ----------------------------
DROP TABLE IF EXISTS `ot_user_login`;
CREATE TABLE `ot_user_login` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `app_no` varchar(20) NOT NULL COMMENT '应用编号',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `avatar_url` varchar(255) DEFAULT NULL COMMENT '头像',
  `city` varchar(40) DEFAULT NULL COMMENT '城市',
  `country` varchar(40) DEFAULT NULL COMMENT '国家',
  `gender` int(2) DEFAULT NULL COMMENT '性别表示：0,1,2等数字.',
  `ma_type` varchar(20) DEFAULT NULL COMMENT '小程序类型(wx|swan|my|tt|h5)',
  `nick_name` varchar(100) DEFAULT NULL COMMENT '昵称（用于显示）',
  `openid` varchar(200) DEFAULT NULL COMMENT '小程序openid',
  `password` varchar(40) DEFAULT NULL COMMENT '用户密码',
  `phone_no` varchar(40) DEFAULT NULL COMMENT '手机号（h5模式）',
  `province` varchar(40) DEFAULT NULL COMMENT '省',
  `unionid` varchar(200) DEFAULT NULL COMMENT '(小程序用户 + 主体维度)id',
  `username` varchar(40) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK53yg5h7oj5aqlj3lryywudn3q` (`app_no`,`ma_type`,`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户登录信息';

-- ----------------------------
-- Table structure for ot_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ot_user_login_log`;
CREATE TABLE `ot_user_login_log` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '操作记录',
  `app_no` varchar(20) DEFAULT NULL COMMENT '应用编号',
  `ip_geo` varchar(80) DEFAULT NULL COMMENT 'IP来源',
  `login_ip` varchar(40) DEFAULT NULL COMMENT '登录IP',
  `ma_type` varchar(20) DEFAULT NULL COMMENT '小程序类型(wx|swan|my|tt|h5)',
  `nick_name` varchar(40) NOT NULL COMMENT '用户昵称',
  `uid` varchar(40) NOT NULL COMMENT '用户ID',
  `unique_key` varchar(200) DEFAULT NULL COMMENT '唯一值(appNo:maType:(openid|phoneNo))',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户登录日志';

-- ----------------------------
-- Table structure for ot_user_ma_session
-- ----------------------------
DROP TABLE IF EXISTS `ot_user_ma_session`;
CREATE TABLE `ot_user_ma_session` (
  `id` varchar(40) NOT NULL COMMENT 'ID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `app_no` varchar(20) NOT NULL COMMENT '应用编号',
  `last_modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注（修改记录)',
  `ma_type` varchar(20) NOT NULL COMMENT '小程序类型(wx|swan|my|tt)',
  `openid` varchar(200) NOT NULL COMMENT '小程序openid',
  `session_key` varchar(120) DEFAULT NULL COMMENT '会话密钥',
  `uid` varchar(40) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKh6w6ypj0jv2rvl4c4y21u54fg` (`app_no`,`ma_type`,`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='小程序会话密钥';

/*quartz*/
drop table if exists qrtz_fired_triggers;
drop table if exists qrtz_paused_trigger_grps;
drop table if exists qrtz_scheduler_state;
drop table if exists qrtz_locks;
drop table if exists qrtz_simple_triggers;
drop table if exists qrtz_simprop_triggers;
drop table if exists qrtz_cron_triggers;
drop table if exists qrtz_blob_triggers;
drop table if exists qrtz_triggers;
drop table if exists qrtz_job_details;
drop table if exists qrtz_calendars;

create table qrtz_job_details(
sched_name varchar(120) not null,
job_name varchar(200) not null,
job_group varchar(200) not null,
description varchar(250) null,
job_class_name varchar(250) not null,
is_durable varchar(1) not null,
is_nonconcurrent varchar(1) not null,
is_update_data varchar(1) not null,
requests_recovery varchar(1) not null,
job_data blob null,
primary key (sched_name,job_name,job_group))
engine=innodb;

create table qrtz_triggers (
sched_name varchar(120) not null,
trigger_name varchar(200) not null,
trigger_group varchar(200) not null,
job_name varchar(200) not null,
job_group varchar(200) not null,
description varchar(250) null,
next_fire_time bigint(13) null,
prev_fire_time bigint(13) null,
priority integer null,
trigger_state varchar(16) not null,
trigger_type varchar(8) not null,
start_time bigint(13) not null,
end_time bigint(13) null,
calendar_name varchar(200) null,
misfire_instr smallint(2) null,
job_data blob null,
primary key (sched_name,trigger_name,trigger_group),
foreign key (sched_name,job_name,job_group)
references qrtz_job_details(sched_name,job_name,job_group))
engine=innodb;

create table qrtz_simple_triggers (
sched_name varchar(120) not null,
trigger_name varchar(200) not null,
trigger_group varchar(200) not null,
repeat_count bigint(7) not null,
repeat_interval bigint(12) not null,
times_triggered bigint(10) not null,
primary key (sched_name,trigger_name,trigger_group),
foreign key (sched_name,trigger_name,trigger_group)
references qrtz_triggers(sched_name,trigger_name,trigger_group))
engine=innodb;

create table qrtz_cron_triggers (
sched_name varchar(120) not null,
trigger_name varchar(200) not null,
trigger_group varchar(200) not null,
cron_expression varchar(120) not null,
time_zone_id varchar(80),
primary key (sched_name,trigger_name,trigger_group),
foreign key (sched_name,trigger_name,trigger_group)
references qrtz_triggers(sched_name,trigger_name,trigger_group))
engine=innodb;

create table qrtz_simprop_triggers
  (
    sched_name varchar(120) not null,
    trigger_name varchar(200) not null,
    trigger_group varchar(200) not null,
    str_prop_1 varchar(512) null,
    str_prop_2 varchar(512) null,
    str_prop_3 varchar(512) null,
    int_prop_1 int null,
    int_prop_2 int null,
    long_prop_1 bigint null,
    long_prop_2 bigint null,
    dec_prop_1 numeric(13,4) null,
    dec_prop_2 numeric(13,4) null,
    bool_prop_1 varchar(1) null,
    bool_prop_2 varchar(1) null,
    primary key (sched_name,trigger_name,trigger_group),
    foreign key (sched_name,trigger_name,trigger_group)
    references qrtz_triggers(sched_name,trigger_name,trigger_group))
engine=innodb;

create table qrtz_blob_triggers (
sched_name varchar(120) not null,
trigger_name varchar(200) not null,
trigger_group varchar(200) not null,
blob_data blob null,
primary key (sched_name,trigger_name,trigger_group),
index (sched_name,trigger_name, trigger_group),
foreign key (sched_name,trigger_name,trigger_group)
references qrtz_triggers(sched_name,trigger_name,trigger_group))
engine=innodb;

create table qrtz_calendars (
sched_name varchar(120) not null,
calendar_name varchar(200) not null,
calendar blob not null,
primary key (sched_name,calendar_name))
engine=innodb;

create table qrtz_paused_trigger_grps (
sched_name varchar(120) not null,
trigger_group varchar(200) not null,
primary key (sched_name,trigger_group))
engine=innodb;

create table qrtz_fired_triggers (
sched_name varchar(120) not null,
entry_id varchar(95) not null,
trigger_name varchar(200) not null,
trigger_group varchar(200) not null,
instance_name varchar(200) not null,
fired_time bigint(13) not null,
sched_time bigint(13) not null,
priority integer not null,
state varchar(16) not null,
job_name varchar(200) null,
job_group varchar(200) null,
is_nonconcurrent varchar(1) null,
requests_recovery varchar(1) null,
primary key (sched_name,entry_id))
engine=innodb;

create table qrtz_scheduler_state (
sched_name varchar(120) not null,
instance_name varchar(200) not null,
last_checkin_time bigint(13) not null,
checkin_interval bigint(13) not null,
primary key (sched_name,instance_name))
engine=innodb;

create table qrtz_locks (
sched_name varchar(120) not null,
lock_name varchar(40) not null,
primary key (sched_name,lock_name))
engine=innodb;

create index idx_qrtz_j_req_recovery on qrtz_job_details(sched_name,requests_recovery);
create index idx_qrtz_j_grp on qrtz_job_details(sched_name,job_group);

create index idx_qrtz_t_j on qrtz_triggers(sched_name,job_name,job_group);
create index idx_qrtz_t_jg on qrtz_triggers(sched_name,job_group);
create index idx_qrtz_t_c on qrtz_triggers(sched_name,calendar_name);
create index idx_qrtz_t_g on qrtz_triggers(sched_name,trigger_group);
create index idx_qrtz_t_state on qrtz_triggers(sched_name,trigger_state);
create index idx_qrtz_t_n_state on qrtz_triggers(sched_name,trigger_name,trigger_group,trigger_state);
create index idx_qrtz_t_n_g_state on qrtz_triggers(sched_name,trigger_group,trigger_state);
create index idx_qrtz_t_next_fire_time on qrtz_triggers(sched_name,next_fire_time);
create index idx_qrtz_t_nft_st on qrtz_triggers(sched_name,trigger_state,next_fire_time);
create index idx_qrtz_t_nft_misfire on qrtz_triggers(sched_name,misfire_instr,next_fire_time);
create index idx_qrtz_t_nft_st_misfire on qrtz_triggers(sched_name,misfire_instr,next_fire_time,trigger_state);
create index idx_qrtz_t_nft_st_misfire_grp on qrtz_triggers(sched_name,misfire_instr,next_fire_time,trigger_group,trigger_state);

create index idx_qrtz_ft_trig_inst_name on qrtz_fired_triggers(sched_name,instance_name);
create index idx_qrtz_ft_inst_job_req_rcvry on qrtz_fired_triggers(sched_name,instance_name,requests_recovery);
create index idx_qrtz_ft_j_g on qrtz_fired_triggers(sched_name,job_name,job_group);
create index idx_qrtz_ft_jg on qrtz_fired_triggers(sched_name,job_group);
create index idx_qrtz_ft_t_g on qrtz_fired_triggers(sched_name,trigger_name,trigger_group);
create index idx_qrtz_ft_tg on qrtz_fired_triggers(sched_name,trigger_group);

commit;
