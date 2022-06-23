/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : aiot

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 22/06/2022 11:29:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for device_remote_ops
-- ----------------------------
DROP TABLE IF EXISTS `device_remote_ops`;
CREATE TABLE `device_remote_ops` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `client_id` varchar(125) COLLATE utf8mb4_bin NOT NULL COMMENT '设备ID',
  `rtty_url` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT 'rttyUrl',
  `remote_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '远程调试状态（0关闭 1开启）',
  `order_code_time` datetime DEFAULT NULL COMMENT '指令下发时间',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='设备远程调试表';

-- ----------------------------
-- Records of device_remote_ops
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for device_soft_relate
-- ----------------------------
DROP TABLE IF EXISTS `device_soft_relate`;
CREATE TABLE `device_soft_relate` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `device_id` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备ID',
  `soft_id` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '软件ID',
  `version` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本号',
  `related_time` datetime DEFAULT NULL COMMENT '升级时间',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_soft_idx1_device` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='设备软件关联表';

-- ----------------------------
-- Records of device_soft_relate
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for emq_order_dict
-- ----------------------------
DROP TABLE IF EXISTS `emq_order_dict`;
CREATE TABLE `emq_order_dict` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_code` varchar(32) NOT NULL COMMENT '指令code',
  `order_value` varchar(8) NOT NULL COMMENT '指令value',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标识0-未删除 1-删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='指令字典';

-- ----------------------------
-- Records of emq_order_dict
-- ----------------------------
BEGIN;
INSERT INTO `emq_order_dict` VALUES (1, 'REMOTE_DEBUG_START', '开始远程调试', '远程调试', 0, '2022-06-08 02:04:36', '2022-06-08 02:04:36', 'admin', 'admin');
INSERT INTO `emq_order_dict` VALUES (2, 'REMOTE_DEBUG_END', '结束远程调试', '远程调试', 0, '2022-06-08 11:31:35', '2022-06-08 11:31:35', 'admin', 'admin');
INSERT INTO `emq_order_dict` VALUES (3, 'REMOTE_UPGRADE', '远程升级', '远程升级', 0, '2022-06-08 11:31:35', '2022-06-08 11:31:39', 'admin', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for emq_order_record
-- ----------------------------
DROP TABLE IF EXISTS `emq_order_record`;
CREATE TABLE `emq_order_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `client_id` varchar(64) NOT NULL COMMENT '设备ID',
  `topic` varchar(128) NOT NULL COMMENT '主题',
  `type` varchar(4) NOT NULL COMMENT '类型',
  `order_code` varchar(64) DEFAULT NULL COMMENT '指令code',
  `swift_number` varchar(64) DEFAULT NULL COMMENT '流水号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标识0-未删除 1-删除',
  `message` varchar(255) DEFAULT NULL COMMENT '消息内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `record_idx1_clientId` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='指令下发记录表';

-- ----------------------------
-- Records of emq_order_record
-- ----------------------------
BEGIN;
INSERT INTO `emq_order_record` VALUES (1, '1', 'JSONUtil.toJsonStr(topics)', '1', 'CODE', '', 2, '', '2022-06-05 22:39:16', '2022-06-05 22:39:16', NULL, NULL);
INSERT INTO `emq_order_record` VALUES (2, '1', 'JSONUtil.toJsonStr(topics)', '1', 'CODE', '', 2, '', '2022-06-05 22:40:47', '2022-06-05 22:40:47', NULL, NULL);
INSERT INTO `emq_order_record` VALUES (3, '1', 'JSONUtil.toJsonStr(topics)', '1', 'CODE', '', 2, '', '2022-06-05 22:43:18', '2022-06-05 22:43:18', NULL, NULL);
INSERT INTO `emq_order_record` VALUES (4, '1', 'JSONUtil.toJsonStr(topics)', '1', 'CODE', '', 2, '', '2022-06-05 22:44:08', '2022-06-05 22:44:08', NULL, NULL);
INSERT INTO `emq_order_record` VALUES (5, '1', 'JSONUtil.toJsonStr(topics)', '1', 'CODE', '', 2, '', '2022-06-05 22:45:47', '2022-06-05 22:45:47', NULL, NULL);
INSERT INTO `emq_order_record` VALUES (6, '1', 'JSONUtil.toJsonStr(topics)', '1', 'CODE', '', 2, '', '2022-06-05 22:46:50', '2022-06-05 22:46:50', NULL, NULL);
INSERT INTO `emq_order_record` VALUES (7, '1', 'JSONUtil.toJsonStr(topics)', '1', 'CODE', '', 2, '', '2022-06-05 22:47:55', '2022-06-05 22:47:55', NULL, NULL);
INSERT INTO `emq_order_record` VALUES (8, '1', 'JSONUtil.toJsonStr(topics)', '1', 'CODE', '', 2, '', '2022-06-05 22:48:04', '2022-06-05 22:48:04', NULL, NULL);
INSERT INTO `emq_order_record` VALUES (9, '1', 'JSONUtil.toJsonStr(topics)', '1', 'CODE', '', 2, '', '2022-06-05 22:48:18', '2022-06-05 22:48:18', NULL, NULL);
INSERT INTO `emq_order_record` VALUES (10, '1', 'JSONUtil.toJsonStr(topics)', '1', 'CODE', '', 2, '', '2022-06-05 22:50:50', '2022-06-05 22:50:50', NULL, NULL);
INSERT INTO `emq_order_record` VALUES (11, '1', 'JSONUtil.toJsonStr(topics)', '1', 'CODE', '', 2, '', '2022-06-05 22:51:16', '2022-06-05 22:51:16', NULL, NULL);
INSERT INTO `emq_order_record` VALUES (12, '1', 'JSONUtil.toJsonStr(topics)', '1', 'CODE', '', 2, '', '2022-06-05 22:53:36', '2022-06-05 22:53:36', NULL, NULL);
INSERT INTO `emq_order_record` VALUES (13, '1', 'JSONUtil.toJsonStr(topics)', '1', 'CODE', '', 2, '', '2022-06-05 22:55:16', '2022-06-05 22:55:16', NULL, NULL);
INSERT INTO `emq_order_record` VALUES (14, '1', 'JSONUtil.toJsonStr(topics)', '1', 'CODE', '', 2, '', '2022-06-05 22:58:35', '2022-06-05 22:58:35', NULL, NULL);
INSERT INTO `emq_order_record` VALUES (15, '1', 'JSONUtil.toJsonStr(topics)', '1', 'CODE', '', 2, '', '2022-06-05 23:06:22', '2022-06-05 23:06:22', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for emq_topic
-- ----------------------------
DROP TABLE IF EXISTS `emq_topic`;
CREATE TABLE `emq_topic` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `topic` varchar(64) NOT NULL COMMENT '主题',
  `type` varchar(4) NOT NULL COMMENT '类型',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标识0-未删除 1-删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='主题模板表';

-- ----------------------------
-- Records of emq_topic
-- ----------------------------
BEGIN;
INSERT INTO `emq_topic` VALUES (1, '测试', '测试12', '测试', 1, '2022-06-06 13:59:22', '2022-06-06 14:02:30', 'admin', 'admin');
INSERT INTO `emq_topic` VALUES (2, '测试', '测试', '测试', 0, '2022-06-06 13:59:28', '2022-06-06 13:59:28', 'admin', 'admin');
INSERT INTO `emq_topic` VALUES (3, '测试', '测试', '测试', 1, '2022-06-06 13:59:35', '2022-06-06 14:01:50', 'admin', 'admin');
INSERT INTO `emq_topic` VALUES (4, '达式', '达式', '达式', 1, '2022-06-06 14:13:01', '2022-06-06 14:17:33', 'admin', 'admin');
INSERT INTO `emq_topic` VALUES (5, '123', '123', '123', 1, '2022-06-06 14:17:06', '2022-06-06 14:17:31', 'admin', 'admin');
INSERT INTO `emq_topic` VALUES (6, '456', '456', '456', 1, '2022-06-06 14:17:23', '2022-06-06 14:17:29', 'admin', 'admin');
INSERT INTO `emq_topic` VALUES (7, 'test', 'test', 'test', 0, '2022-06-08 10:11:58', '2022-06-08 10:11:58', 'admin', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for emq_user
-- ----------------------------
DROP TABLE IF EXISTS `emq_user`;
CREATE TABLE `emq_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `clientId` varchar(255) NOT NULL COMMENT '设备ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标识0-未删除 1-删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='emq用户表';

-- ----------------------------
-- Records of emq_user
-- ----------------------------
BEGIN;
INSERT INTO `emq_user` VALUES (1, 'test', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'emq_sha256', 0, '2022-05-23 06:51:37', '2022-05-23 06:51:37', NULL, NULL);
INSERT INTO `emq_user` VALUES (2, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'supper', 0, '2022-05-23 07:21:15', '2022-05-23 07:21:15', NULL, NULL);
INSERT INTO `emq_user` VALUES (3, 'test', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', 'test', 1, '2022-06-08 10:10:22', '2022-06-08 10:18:05', 'admin', 'admin');
INSERT INTO `emq_user` VALUES (4, 'test1', '1b4f0e9851971998e732078544c96b36c3d01cedf7caa332359d6f1d83567014', 'test1', 1, '2022-06-08 10:12:22', '2022-06-08 10:17:42', 'admin', 'admin');
INSERT INTO `emq_user` VALUES (5, 'test1', '1b4f0e9851971998e732078544c96b36c3d01cedf7caa332359d6f1d83567014', 'test1', 1, '2022-06-08 10:19:40', '2022-06-08 10:24:15', 'admin', 'admin');
INSERT INTO `emq_user` VALUES (6, 'test2', '60303ae22b998861bce3b28f33eec1be758a213c86c93c076dbe9f558c11c752', 'test2', 1, '2022-06-08 10:23:26', '2022-06-08 10:24:07', 'admin', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for iot_device
-- ----------------------------
DROP TABLE IF EXISTS `iot_device`;
CREATE TABLE `iot_device` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `device_id` varchar(64) NOT NULL COMMENT '设备ID',
  `device_code` varchar(255) NOT NULL COMMENT '设备序列号',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `device_model` varchar(64) DEFAULT NULL COMMENT '设备型号',
  `enterprise_id` varchar(64) DEFAULT NULL COMMENT '企业ID',
  `manufacturer` varchar(64) DEFAULT NULL COMMENT '生产厂商',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标识0-未删除 1-删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `device_status` char(1) NOT NULL DEFAULT '0' COMMENT '设备状态(0-正常、1-停用、2-禁用)',
  `maintain_flag` char(1) NOT NULL DEFAULT '0' COMMENT '是否开启运维(0-开启、1-未开启)',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `iot_device_device_id` (`device_id`) USING BTREE,
  KEY `iot_device_device_code` (`device_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='设备管理-设备表';

-- ----------------------------
-- Records of iot_device
-- ----------------------------
BEGIN;
INSERT INTO `iot_device` VALUES (1, '1', '1', '测试', 'ASD-101', 'sdasad', '生产厂商', 0, '2022-05-16 01:56:12', '2022-05-16 01:56:12', NULL, NULL, '0', '0');
INSERT INTO `iot_device` VALUES (2, '2', '2', '测试2', 'ASD-102', 'ceshi12', '生产厂商1', 0, '2022-05-16 01:56:32', '2022-05-16 01:56:32', NULL, NULL, '0', '0');
INSERT INTO `iot_device` VALUES (3, '3', '3', 'dc15', 'dc', 'dc15', 'dc15', 0, '2022-05-19 11:01:45', '2022-05-31 16:58:18', 'dc', 'dc', '0', '0');
INSERT INTO `iot_device` VALUES (556, '2', '2', '测试2', 'ASD-102', 'ceshi12', '生产厂商1', 1, NULL, '2022-05-31 16:55:07', NULL, 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (557, '2', '2', '测试2', 'ASD-102', 'ceshi12', '生产厂商1', 1, '2022-05-25 18:40:54', '2022-06-04 14:07:35', NULL, 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (558, 'sn123456', 'sn123456', 'dctest', 'testDevice', 'dc', 'dc', 1, '2022-05-31 14:37:21', '2022-05-31 14:37:21', 'dc', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (559, 'sc023', 'sc023', 'dctest12564', 'sc023', 'dc', 'dc', 1, '2022-05-31 14:54:03', '2022-05-31 15:57:48', 'dc', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (560, '4', '4', 'dc14', 'dc', 'dc14', 'dc14', 1, '2022-05-31 14:56:30', '2022-05-31 15:20:38', 'dc', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (561, 'sn23', 'sn23', 'sn23', 'sn23', 'sn23', 'sn23', 1, '2022-05-31 16:11:14', '2022-05-31 16:11:18', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (562, 'dctest', 'dctest', 'dctest', 'dctest', 'dctest', 'dctest', 1, '2022-05-31 16:21:49', '2022-05-31 16:51:59', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (563, 'dc15', 'dc15', 'dc15', 'dc15', 'dc15', 'dc15', 1, '2022-05-31 16:58:39', '2022-05-31 17:03:21', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (564, 'dc15', 'dc15', 'dc15', 'dc15', 'dc15', 'dc15', 1, '2022-05-31 17:03:33', '2022-05-31 17:05:03', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (565, 'dc15', 'dc15', 'dc15', 'dc15', 'dc15', 'dc15', 1, '2022-05-31 17:05:16', '2022-05-31 17:05:50', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (566, 'dc15', 'dc15', 'dc15', 'dc15', 'dc15', 'dc15', 1, '2022-05-31 17:06:05', '2022-05-31 17:06:08', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (567, '', '', '', '', '', '', 1, '2022-06-04 12:01:23', '2022-06-04 13:01:41', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (568, '', '', '', '', '', '', 1, '2022-06-04 12:39:19', '2022-06-04 13:01:40', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (569, '', '', '', '', '', '', 1, '2022-06-04 12:42:20', '2022-06-04 13:01:37', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (570, '', '', '', '', '', '', 1, '2022-06-04 12:45:12', '2022-06-04 13:01:34', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (571, 'test', 'test', 'test', 'test', 'test', 'test', 1, '2022-06-04 12:56:13', '2022-06-04 13:01:25', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (572, 'awdawd', 'aweawd', 'wsdawd', 'wraw', 'awdwad', 'awfw', 1, '2022-06-04 13:03:33', '2022-06-04 13:11:30', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (573, 'test', 'test', 'test', 'test', 'test', 'test', 1, '2022-06-04 13:11:41', '2022-06-04 13:11:48', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (574, 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 1, '2022-06-04 13:44:30', '2022-06-04 13:47:20', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (575, 'test2', 'test2', 'test2', 'test2', 'test2', 'test2', 1, '2022-06-04 13:44:38', '2022-06-04 13:55:48', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (576, 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 1, '2022-06-04 13:47:41', '2022-06-04 13:55:48', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (577, 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 1, '2022-06-04 13:56:10', '2022-06-04 13:56:13', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (578, 'awedwa', 'awdaw', 'asdawd', 'awdawd', 'wadwa', 'awd', 1, '2022-06-04 14:07:30', '2022-06-04 14:07:35', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (579, 'test', 'test', 'test', 'test', 'test', 'test', 1, '2022-06-04 14:45:33', '2022-06-04 14:45:38', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (580, 'test', 'test', 'test', 'test', 'test', 'test', 1, '2022-06-04 14:46:16', '2022-06-04 14:46:39', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (581, 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 1, '2022-06-04 14:46:35', '2022-06-04 14:46:43', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (582, 'test24523', 'test1', 'test24532', 'test1', 'test1', 'test1', 1, '2022-06-04 16:17:21', '2022-06-04 16:17:46', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (583, 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 1, '2022-06-04 16:18:19', '2022-06-04 16:18:22', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (584, 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 1, '2022-06-04 16:21:43', '2022-06-04 16:21:45', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (585, 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 1, '2022-06-04 16:22:21', '2022-06-04 16:24:03', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (586, 'test', 'test', 'test', 'test', 'test', 'test', 1, '2022-06-04 16:24:34', '2022-06-04 16:24:43', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (587, 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 1, '2022-06-04 16:26:17', '2022-06-04 16:26:33', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (588, 'test2', 'test2', 'test2', 'test2', 'test2', 'test2', 1, '2022-06-04 16:26:25', '2022-06-04 16:28:41', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (589, 'test', 'test', 'test', 'test', 'test', 'test', 1, '2022-06-04 16:29:36', '2022-06-04 16:29:52', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (590, 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 1, '2022-06-04 16:29:42', '2022-06-04 16:29:58', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (591, 'test2', 'test2', 'test2', 'test2', 'test2', 'test2', 1, '2022-06-04 16:29:49', '2022-06-04 16:29:58', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (592, 'test2', 'test2', 'test2', 'test2', 'test2', 'test2', 1, '2022-06-04 16:30:11', '2022-06-04 16:30:22', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (593, 'test3', 'test3', 'test3', 'test3', 'test3', 'test3', 1, '2022-06-04 16:30:17', '2022-06-04 16:30:22', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (594, 'test3', 'test3', 'test3', 'test3', 'test3', 'test3', 1, '2022-06-04 16:31:49', '2022-06-04 16:31:53', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (595, 'test', 'test', 'test', 'test', 'test', 'test', 1, '2022-06-04 16:32:52', '2022-06-04 16:33:27', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (596, 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 1, '2022-06-04 16:33:01', '2022-06-04 16:33:27', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (597, 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 1, '2022-06-04 16:33:32', '2022-06-04 16:34:00', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (598, 'test2', 'test2', 'test2', 'test2', 'test2', 'test2', 1, '2022-06-04 16:33:40', '2022-06-04 16:34:00', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (599, 'test1', 'test1', 'test1', 'test1', 'test1', 'test1', 1, '2022-06-04 16:39:15', '2022-06-04 16:39:31', 'admin', 'admin', '0', '0');
INSERT INTO `iot_device` VALUES (600, 'test2', 'test2', 'test2', 'test2', 'test2', 'test2', 1, '2022-06-04 16:39:25', '2022-06-04 16:39:35', 'admin', 'admin', '0', '0');
COMMIT;

-- ----------------------------
-- Table structure for orm_user
-- ----------------------------
DROP TABLE IF EXISTS `orm_user`;
CREATE TABLE `orm_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '加密后的密码',
  `salt` varchar(32) NOT NULL COMMENT '加密使用的盐',
  `email` varchar(32) NOT NULL COMMENT '邮箱',
  `phone_number` varchar(15) NOT NULL COMMENT '手机号码',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态，-1：逻辑删除，0：禁用，1：启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上次更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Spring Boot Demo Orm 系列示例表';

-- ----------------------------
-- Records of orm_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (1, 0, '0', '触景无限科技', 0, 'chuf', '17623743694', 'dsadsaxx@qq.com', '0', '0', '', NULL, '', NULL);
INSERT INTO `sys_dept` VALUES (2, 1, '0,1', '2', 1, '1', '13333333333', '133333333@qq.com', '0', '0', '', '2022-06-07 10:10:48', '', '2022-06-08 03:45:27');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_relation`;
CREATE TABLE `sys_dept_relation` (
  `ancestor` bigint NOT NULL,
  `descendant` bigint NOT NULL,
  PRIMARY KEY (`ancestor`,`descendant`),
  KEY `idx1` (`ancestor`),
  KEY `idx2` (`descendant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='部门关系表';

-- ----------------------------
-- Records of sys_dept_relation
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept_relation` VALUES (1, 1);
INSERT INTO `sys_dept_relation` VALUES (1, 2);
INSERT INTO `sys_dept_relation` VALUES (1, 3);
INSERT INTO `sys_dept_relation` VALUES (1, 4);
INSERT INTO `sys_dept_relation` VALUES (1, 5);
INSERT INTO `sys_dept_relation` VALUES (1, 6);
INSERT INTO `sys_dept_relation` VALUES (1, 7);
INSERT INTO `sys_dept_relation` VALUES (2, 2);
INSERT INTO `sys_dept_relation` VALUES (3, 3);
INSERT INTO `sys_dept_relation` VALUES (3, 5);
INSERT INTO `sys_dept_relation` VALUES (3, 6);
INSERT INTO `sys_dept_relation` VALUES (3, 7);
INSERT INTO `sys_dept_relation` VALUES (4, 4);
INSERT INTO `sys_dept_relation` VALUES (5, 5);
INSERT INTO `sys_dept_relation` VALUES (6, 6);
INSERT INTO `sys_dept_relation` VALUES (7, 7);
COMMIT;

-- ----------------------------
-- Table structure for sys_enterprise
-- ----------------------------
DROP TABLE IF EXISTS `sys_enterprise`;
CREATE TABLE `sys_enterprise` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL COMMENT '企业名称',
  `ea_code` varchar(64) NOT NULL COMMENT '企业code',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `zip` varchar(20) DEFAULT NULL COMMENT '邮政编码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标识0-未删除 1-删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='企业表';

-- ----------------------------
-- Records of sys_enterprise
-- ----------------------------
BEGIN;
INSERT INTO `sys_enterprise` VALUES (1, '123', '12', '12', '12', NULL, NULL, 1, '2022-05-26 08:48:24', '2022-05-26 09:16:28', '12', NULL);
INSERT INTO `sys_enterprise` VALUES (2, '北京公司', '123sadwqe', '海淀区', '11111111111@qq.com', NULL, NULL, 0, '2022-05-26 08:49:05', '2022-05-26 08:49:05', 'admin', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示信息',
  `access_time` datetime DEFAULT NULL COMMENT '访问时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` VALUES (100, 'test', '119.167.105.18', '1', '登录成功', '2022-05-09 13:33:43', NULL, NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (101, 'test', '119.167.105.18', '0', '登录成功', '2022-05-09 13:33:43', NULL, NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (102, 'test', '119.167.105.18', '0', '失败', '2022-05-09 13:33:43', NULL, NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (103, 'test', '119.167.105.18', '0', '验证码错误', '2022-05-09 13:33:43', NULL, NULL, NULL, NULL);
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '0:0:0:0:0:0:0:1', '1', '退出成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (105, '', '0:0:0:0:0:0:0:1', '', '', NULL, NULL, '', NULL, '');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '111.201.16.37', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '111.201.16.37', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '111.201.16.37', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '111.201.16.37', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '111.201.16.37', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '111.201.16.37', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '111.201.16.37', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '111.201.16.37', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '192.168.0.45', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '192.168.0.66', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '111.201.16.37', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '111.201.16.37', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '192.168.28.29', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '192.168.28.29', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '192.168.28.29', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '111.196.241.181', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '111.196.241.181', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '221.218.136.38', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '111.196.241.181', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '111.196.241.181', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '111.196.241.181', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '111.196.241.181', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '221.218.136.38', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '192.168.28.29', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '111.196.241.181', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '111.196.241.181', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '221.218.136.38', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '221.218.136.38', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '221.218.136.38', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '111.196.241.181', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '221.218.136.38', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '221.218.136.38', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '221.218.136.38', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '111.196.241.181', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '221.218.136.38', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '111.196.241.181', '0', '登录成功', NULL, NULL, 'admin', NULL, 'admin');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '111.196.241.181', '0', '登录成功', NULL, '2022-06-02 15:58:58', 'admin', '2022-06-02 15:58:58', 'admin');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '111.196.241.181', '1', '退出成功', NULL, '2022-06-02 16:29:56', 'admin', '2022-06-02 16:29:56', 'admin');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-02 18:14:12', 'admin', '2022-06-02 18:14:12', 'admin');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '221.218.136.38', '0', '登录成功', NULL, '2022-06-02 18:14:54', 'admin', '2022-06-02 18:14:54', 'admin');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '221.218.136.38', '0', '登录成功', NULL, '2022-06-02 18:37:19', 'admin', '2022-06-02 18:37:19', 'admin');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '221.218.136.38', '0', '登录成功', NULL, '2022-06-02 18:44:26', 'admin', '2022-06-02 18:44:26', 'admin');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '221.218.136.38', '0', '登录成功', NULL, '2022-06-02 19:06:16', 'admin', '2022-06-02 19:06:16', 'admin');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '221.218.136.38', '0', '登录成功', NULL, '2022-06-02 20:12:59', 'admin', '2022-06-02 20:12:59', 'admin');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-03 22:50:56', 'admin', '2022-06-03 22:50:56', 'admin');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '0:0:0:0:0:0:0:1', '1', '退出成功', NULL, '2022-06-03 22:51:43', 'admin', '2022-06-03 22:51:43', 'admin');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-03 22:51:48', 'admin', '2022-06-03 22:51:48', 'admin');
INSERT INTO `sys_logininfor` VALUES (289, 'test', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-04 10:09:12', 'test', '2022-06-04 10:09:12', 'test');
INSERT INTO `sys_logininfor` VALUES (290, 'test', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-04 10:13:17', 'test', '2022-06-04 10:13:17', 'test');
INSERT INTO `sys_logininfor` VALUES (291, 'test', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-04 10:14:07', 'test', '2022-06-04 10:14:07', 'test');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-04 10:15:44', 'admin', '2022-06-04 10:15:44', 'admin');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '111.196.241.181', '0', '登录成功', NULL, '2022-06-04 10:16:01', 'admin', '2022-06-04 10:16:01', 'admin');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '221.218.136.38', '0', '登录成功', NULL, '2022-06-04 10:16:28', 'admin', '2022-06-04 10:16:28', 'admin');
INSERT INTO `sys_logininfor` VALUES (295, 'test', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-04 10:17:13', 'test', '2022-06-04 10:17:13', 'test');
INSERT INTO `sys_logininfor` VALUES (296, 'test', '0:0:0:0:0:0:0:1', '1', '退出成功', NULL, '2022-06-04 10:17:23', 'test', '2022-06-04 10:17:23', 'test');
INSERT INTO `sys_logininfor` VALUES (297, 'test', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-04 10:17:28', 'test', '2022-06-04 10:17:28', 'test');
INSERT INTO `sys_logininfor` VALUES (298, 'test', '0:0:0:0:0:0:0:1', '1', '退出成功', NULL, '2022-06-04 10:17:38', 'test', '2022-06-04 10:17:38', 'test');
INSERT INTO `sys_logininfor` VALUES (299, 'test', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-04 10:17:44', 'test', '2022-06-04 10:17:44', 'test');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '0', '登录成功', NULL, '2022-06-04 11:12:52', 'admin', '2022-06-04 11:12:52', 'admin');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '221.218.136.38', '0', '登录成功', NULL, '2022-06-04 11:46:01', 'admin', '2022-06-04 11:46:01', 'admin');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '221.218.136.38', '0', '登录成功', NULL, '2022-06-04 14:25:46', 'admin', '2022-06-04 14:25:46', 'admin');
INSERT INTO `sys_logininfor` VALUES (303, 'test', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-04 15:18:35', 'test', '2022-06-04 15:18:35', 'test');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '221.218.136.38', '0', '登录成功', NULL, '2022-06-04 17:58:46', 'admin', '2022-06-04 17:58:46', 'admin');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '221.218.136.38', '0', '登录成功', NULL, '2022-06-04 17:59:02', 'admin', '2022-06-04 17:59:02', 'admin');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '221.218.136.38', '0', '登录成功', NULL, '2022-06-04 17:59:29', 'admin', '2022-06-04 17:59:29', 'admin');
INSERT INTO `sys_logininfor` VALUES (307, 'test', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-04 18:11:41', 'test', '2022-06-04 18:11:41', 'test');
INSERT INTO `sys_logininfor` VALUES (308, 'test', '0:0:0:0:0:0:0:1', '1', '退出成功', NULL, '2022-06-04 18:12:01', 'test', '2022-06-04 18:12:01', 'test');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '221.218.136.38', '0', '登录成功', NULL, '2022-06-04 18:25:28', 'admin', '2022-06-04 18:25:28', 'admin');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '221.218.136.38', '0', '登录成功', NULL, '2022-06-04 18:26:02', 'admin', '2022-06-04 18:26:02', 'admin');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '221.218.136.38', '0', '登录成功', NULL, '2022-06-04 18:27:51', 'admin', '2022-06-04 18:27:51', 'admin');
INSERT INTO `sys_logininfor` VALUES (312, 'test', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-04 18:32:53', 'test', '2022-06-04 18:32:53', 'test');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-04 18:34:34', 'admin', '2022-06-04 18:34:34', 'admin');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '221.218.136.38', '0', '登录成功', NULL, '2022-06-04 18:35:16', 'admin', '2022-06-04 18:35:16', 'admin');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-04 18:36:18', 'admin', '2022-06-04 18:36:18', 'admin');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-04 18:38:09', 'admin', '2022-06-04 18:38:09', 'admin');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-06 11:25:20', 'admin', '2022-06-06 11:25:20', 'admin');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '192.168.11.174', '0', '登录成功', NULL, '2022-06-06 11:26:10', 'admin', '2022-06-06 11:26:10', 'admin');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '192.168.11.174', '0', '登录成功', NULL, '2022-06-06 14:18:19', 'admin', '2022-06-06 14:18:19', 'admin');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '192.168.0.174', '0', '登录成功', NULL, '2022-06-07 13:48:00', 'admin', '2022-06-07 13:48:00', 'admin');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '192.168.0.174', '0', '登录成功', NULL, '2022-06-07 14:20:20', 'admin', '2022-06-07 14:20:20', 'admin');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '192.168.0.174', '0', '登录成功', NULL, '2022-06-07 14:57:25', 'admin', '2022-06-07 14:57:25', 'admin');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '192.168.0.174', '0', '登录成功', NULL, '2022-06-07 17:05:59', 'admin', '2022-06-07 17:05:59', 'admin');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '192.168.0.68', '0', '登录成功', NULL, '2022-06-07 17:20:19', 'admin', '2022-06-07 17:20:19', 'admin');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '192.168.0.174', '0', '登录成功', NULL, '2022-06-08 10:06:57', 'admin', '2022-06-08 10:06:57', 'admin');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '192.168.0.56', '0', '登录成功', NULL, '2022-06-08 11:15:29', 'admin', '2022-06-08 11:15:29', 'admin');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '192.168.0.174', '0', '登录成功', NULL, '2022-06-08 14:38:14', 'admin', '2022-06-08 14:38:14', 'admin');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '192.168.0.174', '0', '登录成功', NULL, '2022-06-13 10:20:00', 'admin', '2022-06-13 10:20:00', 'admin');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '192.168.0.174', '0', '登录成功', NULL, '2022-06-13 10:20:31', 'admin', '2022-06-13 10:20:31', 'admin');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '192.168.0.174', '0', '登录成功', NULL, '2022-06-13 10:21:06', 'admin', '2022-06-13 10:21:06', 'admin');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '0:0:0:0:0:0:0:1', '0', '登录成功', NULL, '2022-06-13 10:29:07', 'admin', '2022-06-13 10:29:07', 'admin');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '192.168.0.174', '0', '登录成功', NULL, '2022-06-13 10:41:45', 'admin', '2022-06-13 10:41:45', 'admin');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '192.168.0.174', '0', '登录成功', NULL, '2022-06-13 10:58:30', 'admin', '2022-06-13 10:58:30', 'admin');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '192.168.0.59', '0', '登录成功', NULL, '2022-06-16 09:50:05', 'admin', '2022-06-16 09:50:05', 'admin');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '192.168.0.59', '1', '退出成功', NULL, '2022-06-16 13:50:44', 'admin', '2022-06-16 13:50:44', 'admin');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '192.168.0.59', '0', '登录成功', NULL, '2022-06-16 13:50:51', 'admin', '2022-06-16 13:50:51', 'admin');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '192.168.0.59', '0', '登录成功', NULL, '2022-06-16 13:52:29', 'admin', '2022-06-16 13:52:29', 'admin');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '192.168.0.59', '0', '登录成功', NULL, '2022-06-16 13:59:36', 'admin', '2022-06-16 13:59:36', 'admin');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '192.168.0.59', '0', '登录成功', NULL, '2022-06-16 14:01:55', 'admin', '2022-06-16 14:01:55', 'admin');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '192.168.0.59', '0', '登录成功', NULL, '2022-06-16 14:03:45', 'admin', '2022-06-16 14:03:45', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '菜单类型 （0菜单 1按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '#' COMMENT '菜单图标',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '用户中心', -1, 1, '/system', 'Layout', NULL, 1, 0, 'M', '0', '0', NULL, 'system', '2022-06-01 16:26:09', '2022-06-01 16:26:09', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (2, '用户管理', 1, 1, 'user', 'system/user/index', NULL, 1, 0, 'C', '0', '0', 'system:user:list', 'cascader', '2022-06-01 16:26:09', '2022-06-04 15:25:31', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (3, '角色管理', 1, 2, 'role', 'system/role/index', NULL, 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', '2022-06-01 16:26:09', '2022-06-01 16:26:09', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (4, '菜单管理', 1, 3, 'menu', 'system/menu/index', NULL, 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', '2022-06-01 16:26:09', '2022-06-01 16:26:09', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (5, '部门管理', 1, 4, 'dept', 'system/dept/index', NULL, 1, 1, 'C', '0', '0', 'system:dept:list', 'tree', '2022-06-01 16:26:09', '2022-06-16 10:07:50', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (6, '测试', 1, 0, '/dec', NULL, NULL, 1, 0, '', '0', '0', NULL, 'button', '2022-06-08 11:20:47', '2022-06-08 11:20:47', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (7, '日志管理', -1, 0, '/log', 'Layout', NULL, 1, 0, 'M', '0', '0', NULL, 'build', '2022-06-16 10:33:38', '2022-06-16 10:33:38', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (8, '操作日志', 7, 0, 'operlog', 'system/operlog/index', NULL, 1, 0, 'C', '0', '0', NULL, 'cascader', '2022-06-16 10:35:58', '2022-06-16 10:35:58', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (10, '用户中心', -1, 0, 'user', NULL, NULL, 1, 0, '', '0', '1', NULL, 'build', '2022-06-16 14:09:00', '2022-06-16 14:29:46', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (11, '登录日志', 7, 2, 'loginLog', 'system/logininfor/index', NULL, 1, 1, 'C', '0', '0', NULL, 'build', '2022-06-16 14:18:49', '2022-06-16 14:18:49', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (12, '视频监控', -1, 0, '/video', 'Layout', NULL, 1, 1, 'M', '0', '0', NULL, 'github', '2022-06-16 14:25:41', '2022-06-16 14:25:41', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (13, '视频配置', 12, 0, 'manage', 'video/manage/index', NULL, 1, 1, 'C', '0', '0', NULL, 'validCode', '2022-06-16 14:33:31', '2022-06-16 14:33:31', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (14, '视频播放', 12, 0, 'play', 'video/play/index', NULL, 1, 1, 'C', '0', '0', NULL, '#', '2022-06-16 14:36:32', '2022-06-16 14:36:32', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (15, '设备中心', 0, 0, '/device', 'Layout', NULL, 1, 0, 'C', '0', '0', NULL, 'tool', '2022-06-16 14:39:51', '2022-06-16 14:39:51', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (16, '设备中心', 0, 4, '/device', 'Layout', NULL, 1, 0, 'C', '0', '0', NULL, 'tool', '2022-06-16 14:41:41', '2022-06-16 14:41:41', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (17, '设备中心', -1, 3, '/device', 'Layout', NULL, 1, 1, 'M', '0', '0', NULL, 'build', '2022-06-16 14:42:35', '2022-06-16 14:42:35', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (18, '设备管理', 17, 0, 'manage', 'device/manage/index', NULL, 1, 1, 'C', '0', '0', NULL, 'checkbox', '2022-06-16 14:48:05', '2022-06-16 14:48:05', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (19, '主题管理', 17, 1, 'emqTopic', 'device/emqTopic/index', NULL, 1, 1, 'C', '0', '0', NULL, 'color', '2022-06-16 14:48:42', '2022-06-16 14:48:42', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (20, '认证管理', 17, 2, 'emqUser', 'device/emqUser/index', NULL, 1, 1, 'C', '0', '0', NULL, 'drag', '2022-06-16 14:49:28', '2022-06-16 14:49:28', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (21, '系统管理', -1, 6, '/sys', 'Layout', NULL, 1, 0, 'M', '0', '0', NULL, 'code', '2022-06-16 14:59:01', '2022-06-16 14:59:01', 'admin', 'admin', '');
INSERT INTO `sys_menu` VALUES (22, '企业管理', 21, 0, 'company', '/system/company/index', NULL, 1, 1, 'C', '0', '0', NULL, 'cascader', '2022-06-16 15:00:29', '2022-06-16 15:00:29', 'admin', 'admin', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details` (
  `client_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端ID',
  `resource_ids` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资源列表',
  `client_secret` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户端密钥',
  `scope` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '域',
  `authorized_grant_types` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '认证类型',
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '重定向地址',
  `authorities` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色列表',
  `access_token_validity` int DEFAULT NULL COMMENT 'token 有效期',
  `refresh_token_validity` int DEFAULT NULL COMMENT '刷新令牌有效期',
  `additional_information` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '令牌扩展字段JSON',
  `autoapprove` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自动放行',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='终端信息表';

-- ----------------------------
-- Records of sys_oauth_client_details
-- ----------------------------
BEGIN;
INSERT INTO `sys_oauth_client_details` VALUES ('aiot', NULL, 'aiot', 'server', 'password,app,refresh_token,authorization_code,client_credentials', 'http://localhost:4040/sso1/login,http://localhost:4041/sso1/login', NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oauth_client_details` VALUES ('app', NULL, 'app', 'server', 'app,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oauth_client_details` VALUES ('daemon', NULL, 'daemon', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oauth_client_details` VALUES ('gen', NULL, 'gen', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oauth_client_details` VALUES ('test', NULL, 'test', 'server', 'password,app,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_param` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 1, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '1', '/tool/gen', '120.199.10.50', 'sdaidas', '', 0, '', '2022-05-09 14:00:51', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (101, '测试', 1, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '1', '/tool/gen', '120.199.10.50', 'sdaidas', '', 0, '', '2022-05-09 14:00:51', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (102, '测试1', 1, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '1', '/tool/gen', '120.199.10.50', 'sdaidas', '', 0, '', '2022-05-09 14:00:51', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (103, '测试1', 1, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'test', '1', '/tool/gen', '120.199.10.50', 'sdaidas', '', 0, '', '2022-05-09 14:00:51', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (104, '用户管理', 0, 'cn.com.senscape.aiot.uc.controller.UserController.user()', 'POST', 1, 'admin', '', '/user/findUserById', '0:0:0:0:0:0:0:1', '1', '{\"code\":\"0\",\"data\":{\"avatar\":\"\",\"createTime\":1524179718000,\"delFlag\":\"0\",\"deptId\":1,\"deptName\":\"总经办\",\"lockFlag\":\"0\",\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"17034642999\",\"roleList\":[{\"createTime\":1509263151000,\"roleCode\":\"ROLE_ADMIN\",\"roleDesc\":\"管理员\",\"roleId\":1,\"roleName\":\"管理员\",\"updateTime\":1545804551000}],\"updateTime\":1548916147000,\"userId\":1,\"username\":\"admin\"},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (105, '用户管理', 0, 'cn.com.senscape.aiot.uc.controller.UserController.user()', 'POST', 1, 'admin', '', '/user/findUserById', '0:0:0:0:0:0:0:1', '1', '{\"code\":\"0\",\"data\":{\"avatar\":\"\",\"createTime\":1524179718000,\"delFlag\":\"0\",\"deptId\":1,\"deptName\":\"总经办\",\"lockFlag\":\"0\",\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"17034642999\",\"roleList\":[{\"createTime\":1509263151000,\"roleCode\":\"ROLE_ADMIN\",\"roleDesc\":\"管理员\",\"roleId\":1,\"roleName\":\"管理员\",\"updateTime\":1545804551000}],\"updateTime\":1548916147000,\"userId\":1,\"username\":\"admin\"},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (106, '用户管理', 0, 'cn.com.senscape.aiot.uc.controller.UserController.user()', 'POST', 1, 'admin', '', '/user/findUserById', '0:0:0:0:0:0:0:1', '1', '{\"code\":\"0\",\"data\":{\"deptId\":1,\"deptName\":\"总经办\",\"email\":\"xxxx@qq.com\",\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678901\",\"roleList\":[{\"createTime\":1653530302000,\"id\":1,\"roleCode\":\"ROLE_ADMIN\",\"roleDesc\":\"管理员(内部)\",\"roleName\":\"管理员\",\"updateTime\":1653530302000}],\"status\":\"0\",\"userId\":1,\"username\":\"admin\"},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (107, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (108, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (109, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (110, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (111, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (112, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (113, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (114, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (115, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (116, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (117, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (118, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (119, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (120, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (121, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (122, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (123, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (124, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (125, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (126, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (127, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (128, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (129, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (130, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (131, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (132, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (133, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (134, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (135, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (136, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (137, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (138, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '127.0.0.1', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (139, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '127.0.0.1', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (140, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (141, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (142, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (143, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (144, '用户管理', 0, 'cn.com.senscape.aiot.uc.controller.UserController.user()', 'POST', 1, 'admin', '', '/user/findUserById', '0:0:0:0:0:0:0:1', '1', '{\"code\":\"0\",\"data\":{\"deptId\":1,\"deptName\":\"总经办\",\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"roleList\":[{\"createTime\":1653530302000,\"id\":1,\"roleCode\":\"ROLE_ADMIN\",\"roleDesc\":\"管理员(内部)\",\"roleName\":\"管理员\",\"updateTime\":1653530302000}],\"status\":\"0\",\"updateTime\":1653642028000,\"username\":\"admin\"},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (145, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (146, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (147, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (148, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (149, '用户管理', 0, 'cn.com.senscape.aiot.uc.controller.UserController.user()', 'POST', 1, 'admin', '', '/user/findUserById', '0:0:0:0:0:0:0:1', '1', '{\"code\":\"0\",\"data\":{\"deptId\":1,\"deptName\":\"总经办\",\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"roleList\":[{\"createTime\":1653530302000,\"id\":1,\"roleCode\":\"ROLE_ADMIN\",\"roleDesc\":\"管理员(内部)\",\"roleName\":\"管理员\",\"updateTime\":1653530302000}],\"status\":\"0\",\"updateTime\":1653642028000,\"username\":\"admin\"},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (150, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (151, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (152, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (153, '用户管理', 0, 'cn.com.senscape.aiot.uc.controller.UserController.user()', 'POST', 1, 'admin', '', '/user/findUserById', '0:0:0:0:0:0:0:1', '1', '{\"code\":\"0\",\"data\":{\"deptId\":1,\"deptName\":\"总经办\",\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"roleList\":[{\"createTime\":1653530302000,\"id\":1,\"roleCode\":\"ROLE_ADMIN\",\"roleDesc\":\"管理员(内部)\",\"roleName\":\"管理员\",\"updateTime\":1653530302000}],\"status\":\"0\",\"updateTime\":1653642028000,\"username\":\"admin\"},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (154, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (155, '用户管理', 0, 'cn.com.senscape.aiot.uc.controller.UserController.user()', 'POST', 1, 'admin', '', '/user/findUserById', '0:0:0:0:0:0:0:1', '1', '{\"code\":\"0\",\"data\":{\"deptId\":1,\"deptName\":\"总经办\",\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"roleList\":[{\"createTime\":1653530302000,\"id\":1,\"roleCode\":\"ROLE_ADMIN\",\"roleDesc\":\"管理员(内部)\",\"roleName\":\"管理员\",\"updateTime\":1653530302000}],\"status\":\"0\",\"updateTime\":1653642028000,\"username\":\"admin\"},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (156, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (157, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (158, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (159, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (160, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (161, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (162, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (163, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (164, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (165, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (166, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (167, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (168, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (169, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (170, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 15:44:23', NULL, '2022-06-02 15:44:23', NULL);
INSERT INTO `sys_oper_log` VALUES (171, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 15:51:54', NULL, '2022-06-02 15:51:54', NULL);
INSERT INTO `sys_oper_log` VALUES (172, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_oper_log` VALUES (173, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 15:59:00', NULL, '2022-06-02 15:59:00', NULL);
INSERT INTO `sys_oper_log` VALUES (174, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:00:48', NULL, '2022-06-02 16:00:48', NULL);
INSERT INTO `sys_oper_log` VALUES (175, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:02:03', NULL, '2022-06-02 16:02:03', NULL);
INSERT INTO `sys_oper_log` VALUES (176, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:02:34', NULL, '2022-06-02 16:02:34', NULL);
INSERT INTO `sys_oper_log` VALUES (177, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:03:27', NULL, '2022-06-02 16:03:27', NULL);
INSERT INTO `sys_oper_log` VALUES (178, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:04:42', NULL, '2022-06-02 16:04:42', NULL);
INSERT INTO `sys_oper_log` VALUES (179, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:04:54', NULL, '2022-06-02 16:04:54', NULL);
INSERT INTO `sys_oper_log` VALUES (180, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:05:35', NULL, '2022-06-02 16:05:35', NULL);
INSERT INTO `sys_oper_log` VALUES (181, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:05:54', NULL, '2022-06-02 16:05:54', NULL);
INSERT INTO `sys_oper_log` VALUES (182, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:06:34', NULL, '2022-06-02 16:06:34', NULL);
INSERT INTO `sys_oper_log` VALUES (183, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:06:37', NULL, '2022-06-02 16:06:37', NULL);
INSERT INTO `sys_oper_log` VALUES (184, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:10:27', NULL, '2022-06-02 16:10:27', NULL);
INSERT INTO `sys_oper_log` VALUES (185, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:11:26', NULL, '2022-06-02 16:11:26', NULL);
INSERT INTO `sys_oper_log` VALUES (186, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:14:38', NULL, '2022-06-02 16:14:38', NULL);
INSERT INTO `sys_oper_log` VALUES (187, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:14:49', NULL, '2022-06-02 16:14:49', NULL);
INSERT INTO `sys_oper_log` VALUES (188, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:15:14', NULL, '2022-06-02 16:15:14', NULL);
INSERT INTO `sys_oper_log` VALUES (189, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:15:53', NULL, '2022-06-02 16:15:53', NULL);
INSERT INTO `sys_oper_log` VALUES (190, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:16:18', NULL, '2022-06-02 16:16:18', NULL);
INSERT INTO `sys_oper_log` VALUES (191, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:16:44', NULL, '2022-06-02 16:16:44', NULL);
INSERT INTO `sys_oper_log` VALUES (192, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:17:20', NULL, '2022-06-02 16:17:20', NULL);
INSERT INTO `sys_oper_log` VALUES (193, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:18:35', NULL, '2022-06-02 16:18:35', NULL);
INSERT INTO `sys_oper_log` VALUES (194, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:19:02', NULL, '2022-06-02 16:19:02', NULL);
INSERT INTO `sys_oper_log` VALUES (195, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:19:45', NULL, '2022-06-02 16:19:45', NULL);
INSERT INTO `sys_oper_log` VALUES (196, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:20:05', NULL, '2022-06-02 16:20:05', NULL);
INSERT INTO `sys_oper_log` VALUES (197, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:22:39', NULL, '2022-06-02 16:22:39', NULL);
INSERT INTO `sys_oper_log` VALUES (198, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:24:19', NULL, '2022-06-02 16:24:19', NULL);
INSERT INTO `sys_oper_log` VALUES (199, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '127.0.0.1', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:26:46', NULL, '2022-06-02 16:26:46', NULL);
INSERT INTO `sys_oper_log` VALUES (200, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:29:37', NULL, '2022-06-02 16:29:37', NULL);
INSERT INTO `sys_oper_log` VALUES (201, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:29:38', NULL, '2022-06-02 16:29:38', NULL);
INSERT INTO `sys_oper_log` VALUES (202, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '111.196.241.181', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$UvC.MbV88nUg6AtBHBvJyOrMQR6PkSqWBMWy5krZNSinLsHSs3SaC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 16:29:45', NULL, '2022-06-02 16:29:45', NULL);
INSERT INTO `sys_oper_log` VALUES (203, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 18:14:56', NULL, '2022-06-02 18:14:56', NULL);
INSERT INTO `sys_oper_log` VALUES (204, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 18:17:17', NULL, '2022-06-02 18:17:17', NULL);
INSERT INTO `sys_oper_log` VALUES (205, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 18:20:43', NULL, '2022-06-02 18:20:43', NULL);
INSERT INTO `sys_oper_log` VALUES (206, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 18:21:02', NULL, '2022-06-02 18:21:02', NULL);
INSERT INTO `sys_oper_log` VALUES (207, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 18:21:15', NULL, '2022-06-02 18:21:15', NULL);
INSERT INTO `sys_oper_log` VALUES (208, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 18:21:23', NULL, '2022-06-02 18:21:23', NULL);
INSERT INTO `sys_oper_log` VALUES (209, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 18:21:31', NULL, '2022-06-02 18:21:31', NULL);
INSERT INTO `sys_oper_log` VALUES (210, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 18:37:20', NULL, '2022-06-02 18:37:20', NULL);
INSERT INTO `sys_oper_log` VALUES (211, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 18:44:26', NULL, '2022-06-02 18:44:26', NULL);
INSERT INTO `sys_oper_log` VALUES (212, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 18:50:34', NULL, '2022-06-02 18:50:34', NULL);
INSERT INTO `sys_oper_log` VALUES (213, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 18:58:58', NULL, '2022-06-02 18:58:58', NULL);
INSERT INTO `sys_oper_log` VALUES (214, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 18:59:20', NULL, '2022-06-02 18:59:20', NULL);
INSERT INTO `sys_oper_log` VALUES (215, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 18:59:42', NULL, '2022-06-02 18:59:42', NULL);
INSERT INTO `sys_oper_log` VALUES (216, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 19:00:25', NULL, '2022-06-02 19:00:25', NULL);
INSERT INTO `sys_oper_log` VALUES (217, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 19:01:03', NULL, '2022-06-02 19:01:03', NULL);
INSERT INTO `sys_oper_log` VALUES (218, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 19:02:02', NULL, '2022-06-02 19:02:02', NULL);
INSERT INTO `sys_oper_log` VALUES (219, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 19:06:16', NULL, '2022-06-02 19:06:16', NULL);
INSERT INTO `sys_oper_log` VALUES (220, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 19:36:21', NULL, '2022-06-02 19:36:21', NULL);
INSERT INTO `sys_oper_log` VALUES (221, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 19:41:40', NULL, '2022-06-02 19:41:40', NULL);
INSERT INTO `sys_oper_log` VALUES (222, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 19:47:05', NULL, '2022-06-02 19:47:05', NULL);
INSERT INTO `sys_oper_log` VALUES (223, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 19:47:07', NULL, '2022-06-02 19:47:07', NULL);
INSERT INTO `sys_oper_log` VALUES (224, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 19:47:49', NULL, '2022-06-02 19:47:49', NULL);
INSERT INTO `sys_oper_log` VALUES (225, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 19:48:50', NULL, '2022-06-02 19:48:50', NULL);
INSERT INTO `sys_oper_log` VALUES (226, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 19:49:06', NULL, '2022-06-02 19:49:06', NULL);
INSERT INTO `sys_oper_log` VALUES (227, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 19:49:54', NULL, '2022-06-02 19:49:54', NULL);
INSERT INTO `sys_oper_log` VALUES (228, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 19:54:24', NULL, '2022-06-02 19:54:24', NULL);
INSERT INTO `sys_oper_log` VALUES (229, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 19:55:41', NULL, '2022-06-02 19:55:41', NULL);
INSERT INTO `sys_oper_log` VALUES (230, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 19:57:19', NULL, '2022-06-02 19:57:19', NULL);
INSERT INTO `sys_oper_log` VALUES (231, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 19:57:28', NULL, '2022-06-02 19:57:28', NULL);
INSERT INTO `sys_oper_log` VALUES (232, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 20:01:45', NULL, '2022-06-02 20:01:45', NULL);
INSERT INTO `sys_oper_log` VALUES (233, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 20:07:05', NULL, '2022-06-02 20:07:05', NULL);
INSERT INTO `sys_oper_log` VALUES (234, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 20:09:23', NULL, '2022-06-02 20:09:23', NULL);
INSERT INTO `sys_oper_log` VALUES (235, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 20:10:51', NULL, '2022-06-02 20:10:51', NULL);
INSERT INTO `sys_oper_log` VALUES (236, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 20:12:22', NULL, '2022-06-02 20:12:22', NULL);
INSERT INTO `sys_oper_log` VALUES (237, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 20:12:34', NULL, '2022-06-02 20:12:34', NULL);
INSERT INTO `sys_oper_log` VALUES (238, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 20:15:25', NULL, '2022-06-02 20:15:25', NULL);
INSERT INTO `sys_oper_log` VALUES (239, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 20:15:38', NULL, '2022-06-02 20:15:38', NULL);
INSERT INTO `sys_oper_log` VALUES (240, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 20:30:06', NULL, '2022-06-02 20:30:06', NULL);
INSERT INTO `sys_oper_log` VALUES (241, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 20:30:15', NULL, '2022-06-02 20:30:15', NULL);
INSERT INTO `sys_oper_log` VALUES (242, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 20:30:22', NULL, '2022-06-02 20:30:22', NULL);
INSERT INTO `sys_oper_log` VALUES (243, '查询用户', 0, 'cn.com.senscape.aiot.uc.controller.UserController.info()', 'POST', 1, 'admin', '', '/user/info', '221.218.136.38', '', '{\"code\":\"0\",\"data\":{\"permissions\":[\"system:dept:list\",\"system:user:list\",\"system:menu:list\",\"system:role:list\"],\"roles\":[1],\"sysUser\":{\"deptId\":1,\"email\":\"xxxx@qq.com\",\"id\":1,\"password\":\"$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC\",\"phone\":\"12345678904\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":1653642028000,\"username\":\"admin\"}},\"msg\":\"Success\"}', 0, '', NULL, '2022-06-02 20:32:57', NULL, '2022-06-02 20:32:57', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '岗位排序',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新人',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, 'user', '员工', 2, '0', '2022-03-19 10:05:15', 'admin', '2022-03-19 10:42:28', 'admin', '打工人');
INSERT INTO `sys_post` VALUES (2, 'cto', 'cto', 0, '0', '2022-03-19 10:06:20', 'admin', '2022-03-19 10:06:20', 'admin', 'cto666');
INSERT INTO `sys_post` VALUES (3, 'boss', '董事长', -1, '0', '2022-03-19 10:06:35', 'admin', '2022-03-19 10:42:44', 'admin', '大boss');
COMMIT;

-- ----------------------------
-- Table structure for sys_public_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_public_param`;
CREATE TABLE `sys_public_param` (
  `public_id` bigint NOT NULL COMMENT '编号',
  `public_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `public_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `public_value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `validate_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ' COMMENT '创建人',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ' COMMENT '修改人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `public_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `system_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  PRIMARY KEY (`public_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='公共参数配置表';

-- ----------------------------
-- Records of sys_public_param
-- ----------------------------
BEGIN;
INSERT INTO `sys_public_param` VALUES (1, '接口文档不显示的字段', 'GEN_HIDDEN_COLUMNS', 'tenant_id', '0', '', ' ', ' ', '2020-05-12 04:25:19', NULL, '9', '1');
INSERT INTO `sys_public_param` VALUES (2, '注册用户默认角色', 'USER_DEFAULT_ROLE', 'GENERAL_USER', '0', '', 'admin', 'admin', '2022-03-30 10:00:57', '2022-03-30 02:05:59', '2', '1');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色编码',
  `role_desc` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色说明',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_idx1_role_code` (`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '管理员', 'ROLE_ADMIN', '管理员(内部)', '0', '2022-05-26 09:58:22', '2022-05-26 09:58:22', NULL, NULL);
INSERT INTO `sys_role` VALUES (22, '22', '22', '22', '1', '2022-05-26 14:43:45', '2022-05-26 15:17:14', 'admin', 'admin');
INSERT INTO `sys_role` VALUES (25, '普通用户1', 'GENERAL_USER', '普通用户1', '0', '2022-05-26 09:59:16', '2022-05-26 09:59:16', NULL, 'admin');
INSERT INTO `sys_role` VALUES (26, '超级管理员', 'SUPER_USER', '超级管理员', '1', '2022-05-26 10:01:35', '2022-05-26 10:12:35', NULL, NULL);
INSERT INTO `sys_role` VALUES (28, '1', '1', '1', '1', '2022-05-26 10:55:56', '2022-05-26 10:56:19', NULL, NULL);
INSERT INTO `sys_role` VALUES (33, '1', '2341', '333', '0', '2022-05-26 14:44:15', '2022-05-26 16:55:20', 'admin', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 7);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '随机盐',
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`user_id`),
  KEY `user_idx1_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC', NULL, '12345678904', 'xxxx@qq.com', NULL, 1, '0', NULL, '2022-05-27 17:00:28', NULL, 'admin');
INSERT INTO `sys_user` VALUES (2, 'test', '$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC', NULL, '123', NULL, NULL, 1, '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (4, '123', '$2a$10$N/FV77yMbth/Bk/OS4LTDeYXabkyRmfpoc/QRYjXfR8z3ud2Q3ZQa', NULL, '123', NULL, NULL, NULL, '1', '2022-05-27 17:04:29', '2022-05-27 17:11:20', 'admin', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
