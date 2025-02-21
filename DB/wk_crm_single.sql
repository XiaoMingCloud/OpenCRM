-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: wk_crm_single
-- ------------------------------------------------------
-- Server version	5.7.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `undo_log`
--

DROP TABLE IF EXISTS `undo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `undo_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) NOT NULL,
  `context` varchar(128) NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undo_log`
--

LOCK TABLES `undo_log` WRITE;
/*!40000 ALTER TABLE `undo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `undo_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_attention`
--

DROP TABLE IF EXISTS `wk_admin_attention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_attention` (
  `attention_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `be_user_id` bigint(20) NOT NULL COMMENT '被关注人',
  `attention_user_id` bigint(20) NOT NULL COMMENT '关注人',
  PRIMARY KEY (`attention_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='通讯录用户关注表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_attention`
--

LOCK TABLES `wk_admin_attention` WRITE;
/*!40000 ALTER TABLE `wk_admin_attention` DISABLE KEYS */;
INSERT INTO `wk_admin_attention` VALUES (1,14773,14773);
/*!40000 ALTER TABLE `wk_admin_attention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_auth`
--

DROP TABLE IF EXISTS `wk_admin_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `auth_name` varchar(100) DEFAULT NULL COMMENT '权限名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_auth`
--

LOCK TABLES `wk_admin_auth` WRITE;
/*!40000 ALTER TABLE `wk_admin_auth` DISABLE KEYS */;
INSERT INTO `wk_admin_auth` VALUES (1,'admin');
/*!40000 ALTER TABLE `wk_admin_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_config`
--

DROP TABLE IF EXISTS `wk_admin_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_config` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态，0:不启用 1 ： 启用',
  `name` varchar(255) NOT NULL COMMENT '设置名称',
  `value` varchar(255) DEFAULT NULL COMMENT '设置值',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`setting_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=262479 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_config`
--

LOCK TABLES `wk_admin_config` WRITE;
/*!40000 ALTER TABLE `wk_admin_config` DISABLE KEYS */;
INSERT INTO `wk_admin_config` VALUES (262433,1,'expiringContractDays','3','合同到期提醒'),(262434,1,'putInPoolRemindDays','2','放入池提醒天数'),(262435,1,'taskExamine','1','任务审批'),(262436,1,'log','1','日志'),(262437,1,'book','1','通讯录'),(262438,1,'crm','1','客户管理'),(262439,1,'project','1','项目管理'),(262440,1,'calendar','1','日历'),(262441,1,'email','1','邮箱'),(262442,1,'knowledge','3','知识库'),(262443,1,'hrm','1','人力资源管理'),(262444,1,'jxc','3','进销存管理'),(262445,1,'call','3','呼叫中心'),(262446,0,'followRecordOption','打电话','跟进记录选项'),(262447,0,'followRecordOption','发邮件','跟进记录选项'),(262448,0,'followRecordOption','发短信','跟进记录选项'),(262449,0,'followRecordOption','见面拜访','跟进记录选项'),(262450,0,'followRecordOption','活动','跟进记录选项'),(262454,0,'pictureSetting',NULL,'外勤签到照片上传设置'),(262455,0,'returnVisitRemindConfig','7','客户回访提醒设置'),(262456,0,'numberSetting','6','自动编号设置'),(262457,0,'numberSetting','7','自动编号设置'),(262458,0,'numberSetting','17','自动编号设置'),(262459,0,'numberSetting','18','自动编号设置'),(262460,1,'companyInfo','{\"companyLogo\":\"/adminFile/down/1837807744141365248\",\"companyName\":\"没良心企业\"}','企业LOGO配置'),(262461,1,'marketing',NULL,'是否开启营销活动'),(262475,1,'logWelcomeSpeech','蓝天是宁静的，空气是清新的，阳光是明媚的','欢迎标语'),(262476,1,'logWelcomeSpeech','人生，最快乐的莫过于奋斗','欢迎标语'),(262477,1,'logWelcomeSpeech','工作一天辛苦了，人生，最快乐的莫过于奋斗','欢迎标语'),(262478,1,'logWelcomeSpeech','每天加班一小时，明天老板换奔驰','欢迎标语');
/*!40000 ALTER TABLE `wk_admin_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_dept`
--

DROP TABLE IF EXISTS `wk_admin_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `pid` int(11) DEFAULT '0' COMMENT '父级ID 顶级部门为0',
  `name` varchar(64) NOT NULL COMMENT '部门名称',
  `num` int(11) DEFAULT NULL COMMENT '排序 越大越靠后',
  `remark` varchar(64) DEFAULT '' COMMENT '部门备注',
  `owner_user_id` bigint(20) DEFAULT NULL COMMENT '部门负责人',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14861 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_dept`
--

LOCK TABLES `wk_admin_dept` WRITE;
/*!40000 ALTER TABLE `wk_admin_dept` DISABLE KEYS */;
INSERT INTO `wk_admin_dept` VALUES (14852,0,'全公司',1,'',NULL),(14853,14852,'销售部',NULL,'',14774),(14855,14852,'制造部',NULL,'',NULL),(14856,14852,'检验部',NULL,'',NULL),(14857,14852,'外交部',NULL,'',NULL),(14858,14852,'跨国销售部',NULL,'',NULL),(14859,14852,'外包对接部',NULL,'',NULL),(14860,14852,'秘书部',NULL,'',NULL);
/*!40000 ALTER TABLE `wk_admin_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_file`
--

DROP TABLE IF EXISTS `wk_admin_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_file` (
  `file_id` bigint(20) NOT NULL COMMENT '附件id',
  `name` varchar(255) NOT NULL COMMENT '附件名称',
  `size` bigint(20) NOT NULL COMMENT '附件大小（字节）',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `path` varchar(255) DEFAULT NULL COMMENT '文件真实路径',
  `file_type` varchar(4) DEFAULT 'file' COMMENT '文件类型,file,img',
  `type` int(11) DEFAULT NULL COMMENT '1 本地 2 阿里云oss',
  `source` int(11) DEFAULT NULL COMMENT '来源 0 默认 1 admin 2 crm 3 work 4 oa 5 进销存 6 hrm',
  `is_public` int(11) DEFAULT '0' COMMENT '1 公有访问 0 私有访问',
  `batch_id` varchar(50) DEFAULT NULL COMMENT '批次id',
  PRIMARY KEY (`file_id`) USING BTREE,
  KEY `batch_id` (`batch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_file`
--

LOCK TABLES `wk_admin_file` WRITE;
/*!40000 ALTER TABLE `wk_admin_file` DISABLE KEYS */;
INSERT INTO `wk_admin_file` VALUES (1836395225204002816,'background.jpg',258070,14773,'2024-09-18 21:21:55','E:\\upload\\private\\20240918\\1836395225204002816-background.jpg','file',1,NULL,0,'5c96dd1198394958b81c00e00e41337d'),(1836395249988145152,'58ce174caa809e9cf0868aff4010579.jpg',206573,14773,'2024-09-18 21:22:01','E:\\upload\\private\\20240918\\1836395249988145152-58ce174caa809e9cf0868aff4010579.jpg','file',1,NULL,0,'dd078d5133054c6e9e128c5acf6f9e81'),(1836395595481354240,'1cd36jw5gns9n0lpgqql3htot.jpg',1479608,14773,'2024-09-18 21:23:23','E:\\upload\\private\\20240918\\1836395595481354240-1cd36jw5gns9n0lpgqql3htot.jpg','file',1,NULL,0,'34aa589968744285992e5f5e4f7b1987'),(1836395632273788928,'1zoeuuco1cis84srim3kbpt8q.jpg',267563,14773,'2024-09-18 21:23:32','E:\\upload\\private\\20240918\\1836395632273788928-1zoeuuco1cis84srim3kbpt8q.jpg','file',1,NULL,0,'0527e29158a34ca08f8d356965ef0c50'),(1836565930960883712,'blob',60880,14773,'2024-09-19 08:40:14','E:\\upload\\private\\20240919\\1836565930960883712-blob','file',1,NULL,0,'f7e2f69790e445efb4045dfb05ae61c9'),(1836948531521392640,'2fbxv3bwmrb4z1z8w6mcbkvq8.jpg',148031,14773,'2024-09-20 10:00:33','E:\\upload\\private\\20240920\\1836948531521392640-2fbxv3bwmrb4z1z8w6mcbkvq8.jpg','img',1,NULL,0,'7b95386926ba42d3b69e900bde5d1763'),(1836953060090449920,'2cquff00259pzoucww1ilncco.jpg',2874404,14773,'2024-09-20 10:18:33','E:\\upload\\private\\20240920\\1836953060090449920-2cquff00259pzoucww1ilncco.jpg','img',1,NULL,0,'462fc661261aa751c18dd15588c26939'),(1836954745529569280,'1hddl67vmgkvjz1q5ito30csw.jpg',1882919,14773,'2024-09-20 10:25:15','E:\\upload\\private\\20240920\\1836954745529569280-1hddl67vmgkvjz1q5ito30csw.jpg','img',1,NULL,0,'4ada258d4d598a21e8097185ff847ad5'),(1836957202401857536,'2nv4wv5dhmzgwxbejacuisc8l.jpg',2966528,14773,'2024-09-20 10:35:01','E:\\upload\\private\\20240920\\1836957202401857536-2nv4wv5dhmzgwxbejacuisc8l.jpg','img',1,NULL,0,'84ce3c1fde123627008d065ec675a71a'),(1837130546568892416,'blob',83201,14773,'2024-09-20 22:03:49','E:\\upload\\private\\20240920\\1837130546568892416-blob','file',1,NULL,0,'3e45248e85064e44bec6691aa6a1ada6'),(1837341007600029696,'3d16d7ecbf91f8f.jpg',127146,14778,'2024-09-21 12:00:07','E:\\upload\\private\\20240921\\1837341007600029696-3d16d7ecbf91f8f.jpg','img',1,NULL,0,'7352d79f6d28493a8adcd49bb87bb25a'),(1837807744141365248,'blob',65102,14773,'2024-09-22 18:54:46','E:\\upload\\private\\20240922\\1837807744141365248-blob','file',1,NULL,0,'c774ea680d0c41358e381dcbaec81594'),(1844193205772488704,'微信图片_20241006092239.jpg',179115,14773,'2024-10-10 09:48:18','E:\\upload\\private\\20241010\\1844193205772488704-微信图片_20241006092239.jpg','img',1,NULL,0,'9424bead17627a1f50b82f5043551cc2'),(1844194421487308800,'微信图片_20241006092239.jpg',179115,14773,'2024-10-10 09:53:08','E:\\upload\\private\\20241010\\1844194421487308800-微信图片_20241006092239.jpg','img',1,NULL,0,'34284c6d933ee89a54fc841dad34bd9f'),(1845023641205608448,'003.pdf',223207,14773,'2024-10-12 16:48:10','E:\\upload\\private\\20241012\\1845023641205608448-003.pdf','file',1,NULL,0,'2db041f6749330820898e01d2c7ce85b');
/*!40000 ALTER TABLE `wk_admin_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_login_log`
--

DROP TABLE IF EXISTS `wk_admin_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_user_id` bigint(20) NOT NULL COMMENT '操作人id',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `ip_address` varchar(255) DEFAULT NULL COMMENT '登录ip地址',
  `login_address` varchar(255) DEFAULT NULL COMMENT '登录地点',
  `device_type` varchar(255) DEFAULT NULL COMMENT '设备类型',
  `core` varchar(255) DEFAULT NULL COMMENT '终端内核',
  `platform` varchar(255) DEFAULT NULL COMMENT '平台',
  `imei` varchar(255) DEFAULT NULL COMMENT 'IEMI设备号',
  `auth_result` int(11) DEFAULT NULL COMMENT '认证结果 1成功 2失败',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统登录日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_login_log`
--

LOCK TABLES `wk_admin_login_log` WRITE;
/*!40000 ALTER TABLE `wk_admin_login_log` DISABLE KEYS */;
INSERT INTO `wk_admin_login_log` VALUES (1,14773,'2024-09-19 16:44:49','127.0.0.1','内网','网页','MSEdge128.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(2,14773,'2024-09-19 20:59:44','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(3,14773,'2024-09-20 09:47:08','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(4,14774,'2024-09-20 10:26:48','127.0.0.1','内网','网页','MSEdge128.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(5,14774,'2024-09-20 10:35:43','127.0.0.1','内网','网页','MSEdge128.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(6,14778,'2024-09-21 11:55:31','127.0.0.1','内网','网页','MSEdge128.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(7,14778,'2024-09-21 11:58:46','127.0.0.1','内网','网页','MSEdge128.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(8,14773,'2024-09-21 16:01:59','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(9,14773,'2024-09-21 16:32:25','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(10,14773,'2024-09-21 17:05:49','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(11,14773,'2024-09-21 19:45:11','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(12,14773,'2024-09-21 20:00:49','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(13,14773,'2024-09-21 20:28:31','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(14,14773,'2024-09-21 20:35:59','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(15,14773,'2024-09-21 20:41:27','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(16,14773,'2024-09-21 20:45:07','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(17,14773,'2024-09-21 21:17:47','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(18,14773,'2024-09-21 21:25:37','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(19,14773,'2024-09-21 21:30:35','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(20,14773,'2024-09-21 22:17:42','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(21,14773,'2024-09-22 09:21:27','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(22,14773,'2024-09-22 09:30:49','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(23,14773,'2024-09-22 09:35:04','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(24,14773,'2024-09-22 09:35:52','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(25,14773,'2024-09-22 09:38:53','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(26,14773,'2024-09-22 09:40:16','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(27,14773,'2024-09-22 09:40:49','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(28,14773,'2024-09-22 09:45:25','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(29,14773,'2024-09-22 09:47:59','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(30,14773,'2024-09-22 16:33:02','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(31,14773,'2024-09-22 16:36:24','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(32,14773,'2024-09-22 16:36:42','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(33,14773,'2024-09-22 16:39:21','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(34,14773,'2024-09-22 16:45:11','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(35,14773,'2024-09-22 16:54:26','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(36,14773,'2024-09-22 16:58:28','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(37,14773,'2024-09-22 17:00:26','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(38,14773,'2024-09-22 17:13:51','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(39,14773,'2024-09-22 17:35:03','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(40,14773,'2024-09-22 17:44:07','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(41,14773,'2024-09-23 15:01:38','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(42,14773,'2024-09-23 15:53:09','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(43,14773,'2024-09-23 15:56:13','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(44,14773,'2024-09-23 16:04:49','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(45,14773,'2024-09-23 16:14:00','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(46,14773,'2024-09-23 16:17:12','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(47,14773,'2024-09-23 16:22:44','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(48,14773,'2024-09-23 16:28:13','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(49,14773,'2024-09-23 17:22:33','127.0.0.1','内网','网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(50,14773,'2024-09-23 18:11:29','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(51,14773,'2024-09-23 18:13:02','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(52,14773,'2024-09-23 19:54:13','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(53,14773,'2024-09-23 19:57:02','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(54,14773,'2024-09-23 20:02:49','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(55,14773,'2024-09-23 20:03:51','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(56,14773,'2024-09-23 20:04:29','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(57,14773,'2024-09-23 20:06:38','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(58,14773,'2024-09-23 20:07:58','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(59,14774,'2024-09-23 20:14:20','127.0.0.1',NULL,'网页','MSEdge128.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(60,14773,'2024-09-23 20:35:38','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(61,14773,'2024-09-23 20:46:03','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(62,14773,'2024-09-23 20:58:48','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(63,14773,'2024-09-23 21:00:10','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(64,14773,'2024-09-23 21:01:05','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(65,14773,'2024-09-23 21:02:11','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(66,14773,'2024-09-23 21:04:39','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(67,14773,'2024-09-23 21:05:07','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(68,14773,'2024-09-23 21:07:35','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(69,14773,'2024-09-23 21:13:25','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(70,14773,'2024-09-23 21:16:49','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(71,14773,'2024-09-23 21:17:12','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(72,14773,'2024-09-23 21:18:35','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(73,14773,'2024-09-23 21:21:07','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(74,14773,'2024-09-23 21:21:43','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(75,14773,'2024-09-23 21:24:35','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(76,14773,'2024-09-23 21:51:50','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(77,14773,'2024-09-23 21:52:32','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(78,14773,'2024-09-23 22:06:29','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(79,14774,'2024-09-23 22:07:57','127.0.0.1',NULL,'网页','MSEdge128.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(80,14773,'2024-09-24 14:07:56','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(81,14773,'2024-09-24 14:09:46','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(82,14773,'2024-09-24 14:12:04','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(83,14774,'2024-09-24 14:20:58','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(84,14774,'2024-09-24 15:44:13','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(85,14774,'2024-09-24 15:44:59','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(86,14774,'2024-09-24 16:00:19','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(87,14773,'2024-09-24 16:16:54','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(88,14773,'2024-09-24 16:25:49','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(89,14773,'2024-09-24 16:26:22','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(90,14773,'2024-09-24 16:42:47','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(91,14773,'2024-09-24 16:43:48','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(92,14773,'2024-09-24 16:44:13','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(93,14773,'2024-09-25 09:47:40','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(94,14773,'2024-09-27 14:17:51','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(95,14773,'2024-09-27 19:27:47','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(96,14773,'2024-09-28 08:35:17','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(97,14773,'2024-09-28 16:27:15','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(98,14773,'2024-09-28 17:11:39','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(99,14773,'2024-09-29 10:12:24','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(100,14773,'2024-09-29 15:31:52','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(101,14773,'2024-09-29 15:32:28','127.0.0.1',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(102,14773,'2024-09-29 17:43:23','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(103,14773,'2024-09-30 10:14:30','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(104,14773,'2024-10-08 09:48:44','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(105,14773,'2024-10-08 13:50:43','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(106,14773,'2024-10-08 15:56:05','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(107,14773,'2024-10-08 19:02:11','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(108,14773,'2024-10-08 20:59:50','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(109,14773,'2024-10-09 09:42:25','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(110,14773,'2024-10-09 17:52:45','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(111,14773,'2024-10-09 18:26:41','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(112,14776,'2024-10-09 18:39:00','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(113,14777,'2024-10-09 19:53:38','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(114,14773,'2024-10-09 20:29:31','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(115,14773,'2024-10-09 20:46:51','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(116,14774,'2024-10-09 20:47:53','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(117,14773,'2024-10-09 20:49:20','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(118,14777,'2024-10-09 21:19:39','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(119,14773,'2024-10-09 21:35:48','100.75.176.55',NULL,'移动端','Chrome125.0.0.0','Android',NULL,1),(120,14773,'2024-10-09 21:36:32','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(121,14773,'2024-10-10 08:44:05','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(122,14773,'2024-10-10 08:44:37','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(123,14773,'2024-10-10 10:17:55','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(124,14773,'2024-10-10 14:01:27','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(125,14773,'2024-10-10 17:21:34','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(126,14773,'2024-10-10 18:15:25','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(127,14773,'2024-10-10 20:37:03','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(128,14773,'2024-10-11 09:53:12','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(129,14773,'2024-10-11 10:31:41','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(130,14773,'2024-10-11 15:10:44','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(131,14773,'2024-10-11 20:31:03','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(132,14773,'2024-10-12 08:03:50','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(133,14773,'2024-10-12 14:25:33','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(134,14773,'2024-10-12 16:30:52','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(135,14777,'2024-10-12 16:50:08','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(136,14773,'2024-10-13 11:03:25','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(137,14780,'2024-10-13 11:10:13','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(138,14780,'2024-10-13 11:15:50','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(139,14780,'2024-10-13 11:16:45','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(140,14773,'2024-10-13 15:13:29','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(141,14779,'2024-10-13 15:48:41','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(142,14773,'2024-10-14 08:11:02','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(143,14777,'2024-10-14 08:39:15','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(144,14780,'2024-10-14 09:23:55','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(145,14773,'2024-10-14 10:11:35','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(146,14773,'2024-10-14 18:42:20','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(147,14773,'2024-10-16 10:54:28','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(148,14773,'2024-10-16 18:43:34','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(149,14773,'2024-10-16 21:31:29','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(150,14773,'2024-10-17 14:13:34','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(151,14773,'2024-10-17 18:27:46','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(152,14773,'2024-10-17 18:31:45','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(153,14773,'2024-10-17 21:34:42','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(154,14773,'2024-10-18 09:51:18','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(155,14773,'2024-10-18 11:43:32','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(156,14773,'2024-10-18 14:51:02','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(157,14773,'2024-10-18 14:51:52','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(158,14773,'2024-10-18 18:50:39','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(159,14773,'2024-10-19 10:27:22','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(160,14773,'2024-10-21 08:19:12','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(161,14773,'2024-10-21 10:59:04','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(162,14773,'2024-10-21 14:09:35','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(163,14773,'2024-10-21 16:38:38','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(164,14773,'2024-10-21 18:40:44','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(165,14773,'2024-10-21 21:11:06','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(166,14773,'2024-10-22 13:38:55','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(167,14773,'2024-10-22 15:40:17','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(168,14773,'2024-11-27 20:20:41','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(169,14773,'2024-11-27 20:53:13','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(170,14773,'2024-11-27 21:12:19','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(171,14773,'2024-11-27 21:53:40','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(172,14773,'2024-11-27 21:55:10','100.75.176.55',NULL,'网页','MSEdge130.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(173,14773,'2024-11-27 22:39:39','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(174,14773,'2024-12-05 22:02:31','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(175,14773,'2024-12-05 23:03:18','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(176,14773,'2024-12-13 19:04:34','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(177,14773,'2024-12-13 19:26:26','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(178,14773,'2024-12-13 19:43:33','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(179,14773,'2024-12-13 20:18:26','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(180,14773,'2024-12-13 20:21:38','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(181,14773,'2024-12-13 20:34:13','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(182,14773,'2024-12-14 10:38:58','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(183,14773,'2024-12-14 10:40:16','100.75.176.55',NULL,'网页','MSEdge130.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(184,14773,'2024-12-14 10:40:51','100.75.176.55',NULL,'网页','MSEdge130.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(185,14773,'2024-12-14 10:42:25','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(186,14773,'2024-12-14 10:43:45','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(187,14773,'2025-02-16 18:10:37','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(188,14773,'2025-02-16 19:36:47','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(189,14773,'2025-02-16 19:38:25','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(190,14773,'2025-02-16 19:40:39','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(191,14773,'2025-02-16 19:46:35','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(192,14773,'2025-02-16 19:48:15','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(193,14773,'2025-02-16 19:53:04','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(194,14773,'2025-02-16 20:07:30','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(195,14773,'2025-02-16 20:09:15','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(196,14773,'2025-02-16 20:10:55','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(197,14773,'2025-02-16 20:17:28','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(198,14773,'2025-02-16 20:18:21','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(199,14773,'2025-02-16 20:23:58','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(200,14773,'2025-02-16 21:30:41','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(201,14773,'2025-02-16 21:31:17','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(202,14773,'2025-02-16 22:23:22','100.75.176.55',NULL,'网页','Chrome124.0.0.0','Windows 10 or Windows Server 2016',NULL,1),(203,14773,'2025-02-21 19:44:04','100.75.176.55',NULL,'网页','MSEdge133.0.0.0','Windows 10 or Windows Server 2016',NULL,1);
/*!40000 ALTER TABLE `wk_admin_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_menu`
--

DROP TABLE IF EXISTS `wk_admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_menu` (
  `menu_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parent_id` int(10) unsigned DEFAULT '0' COMMENT '上级菜单ID',
  `menu_name` varchar(32) DEFAULT '' COMMENT '菜单名称',
  `realm` varchar(127) DEFAULT '' COMMENT '权限标识',
  `realm_url` varchar(1024) DEFAULT NULL COMMENT '权限URL',
  `realm_module` varchar(10) DEFAULT NULL COMMENT '所属模块',
  `menu_type` int(11) DEFAULT NULL COMMENT '菜单类型  1目录 2 菜单 3 按钮 4特殊',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `status` int(11) DEFAULT '1' COMMENT '状态 1 启用 0 禁用',
  `remarks` varchar(255) DEFAULT NULL COMMENT '菜单说明',
  PRIMARY KEY (`menu_id`) USING BTREE,
  KEY `menu_id` (`menu_id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `realm` (`realm`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=943 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='后台菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_menu`
--

LOCK TABLES `wk_admin_menu` WRITE;
/*!40000 ALTER TABLE `wk_admin_menu` DISABLE KEYS */;
INSERT INTO `wk_admin_menu` VALUES (1,0,'全部','crm',NULL,NULL,1,0,1,NULL),(2,0,'全部','bi',NULL,NULL,1,0,1,NULL),(3,0,'全部','manage',NULL,NULL,1,0,1,NULL),(5,0,'全部','hrm',NULL,NULL,1,0,1,NULL),(6,0,'全部','jxc','',NULL,1,0,1,NULL),(9,1,'线索管理','leads',NULL,NULL,1,1,1,NULL),(10,1,'客户管理','customer',NULL,NULL,1,2,1,NULL),(11,1,'联系人管理','contacts',NULL,NULL,1,3,1,NULL),(12,1,'商机管理','business',NULL,NULL,1,4,1,NULL),(13,1,'合同管理','contract',NULL,NULL,1,5,1,NULL),(14,1,'回款管理','receivables',NULL,NULL,1,6,1,NULL),(15,1,'产品管理','product',NULL,NULL,1,7,1,NULL),(17,9,'新建','save','/crmLeads/add',NULL,3,1,1,NULL),(18,9,'编辑','update','/crmLeads/update',NULL,3,1,1,NULL),(19,9,'查看列表','index','/crmLeads/queryPageList',NULL,3,1,1,NULL),(20,9,'查看详情','read','/crmLeads/queryById/*',NULL,3,1,1,NULL),(21,9,'导入','excelimport','/crmLead/downloadExcel',NULL,3,1,1,NULL),(22,9,'导出','excelexport','/crmLead/allExportExcel,/crmLead/batchExportExcel',NULL,3,1,1,NULL),(23,9,'删除','delete','/crmLead/deleteByIds',NULL,3,1,1,NULL),(24,9,'转移','transfer','/crmLeads/changeOwnerUser',NULL,3,1,1,NULL),(25,9,'转化','transform','/crmLead/transfer',NULL,3,1,1,NULL),(26,10,'新建','save','/crmCustomer/add',NULL,3,1,1,NULL),(27,10,'编辑','update','/crmCustomer/update',NULL,3,1,1,NULL),(28,10,'查看列表','index','/crmCustomer/queryPageList',NULL,3,1,1,NULL),(29,10,'查看详情','read','/crmCustomer/queryById/*',NULL,3,1,1,NULL),(30,10,'导入','excelimport','/crmCustomer/uploadExcel',NULL,3,1,1,NULL),(31,10,'导出','excelexport','/crmCustomer/batchExportExcel,/crmCustomer/allExportExcel',NULL,3,1,1,NULL),(32,10,'删除','delete','/crmCustomer/deleteByIds',NULL,3,1,1,NULL),(33,10,'转移','transfer','/crmCustomer/changeOwnerUser',NULL,3,1,1,NULL),(34,10,'放入公海','putinpool','/crmCustomer/updateCustomerByIds',NULL,3,1,1,NULL),(35,10,'锁定/解锁','lock','/crmCustomer/lock',NULL,3,1,1,NULL),(36,10,'编辑团队成员','teamsave','/crmCustomer/addMembers,/crmCustomer/updateMembers,/crmCustomer/exitTeam',NULL,3,1,1,NULL),(40,11,'新建','save','/crmContacts/add',NULL,3,1,1,NULL),(41,11,'编辑','update','/crmContacts/update',NULL,3,1,1,NULL),(42,11,'查看列表','index','/crmContacts/queryPageList',NULL,3,1,1,NULL),(43,11,'查看详情','read','/crmContacts/queryById/*',NULL,3,1,1,NULL),(44,11,'删除','delete','/crmContacts/deleteByIds',NULL,3,1,1,NULL),(45,11,'转移','transfer','/crmContacts/changeOwnerUser',NULL,3,1,1,NULL),(46,12,'新建','save','/crmBusiness/add',NULL,3,1,1,NULL),(47,12,'编辑','update','/crmBusiness/update',NULL,3,1,1,NULL),(48,12,'查看列表','index','/crmBusiness/queryPageList',NULL,3,1,1,NULL),(49,12,'查看详情','read','/crmBusiness/queryById/*',NULL,3,1,1,NULL),(50,12,'删除','delete','/crmBusiness/deleteByIds',NULL,3,1,1,NULL),(51,12,'转移','transfer','/crmBusiness/changeOwnerUser',NULL,3,1,1,NULL),(52,12,'编辑团队成员','teamsave','/crmBusiness/addMembers,/crmBusiness/updateMembers,/crmBusiness/deleteMembers',NULL,3,1,1,NULL),(53,13,'新建','save','/crmContract/add',NULL,3,1,1,NULL),(54,13,'编辑','update','/crmContract/update',NULL,3,1,1,NULL),(55,13,'查看列表','index','/crmContract/queryPageList',NULL,3,1,1,NULL),(56,13,'查看详情','read','/crmContract/queryById',NULL,3,1,1,NULL),(57,13,'删除','delete','/crmContract/deleteByIds',NULL,3,1,1,NULL),(58,13,'转移','transfer','/crmContract/changeOwnerUser',NULL,3,1,1,NULL),(59,13,'编辑团队成员','teamsave','/crmContract/addMembers,/crmContract/updateMembers,/crmContract/deleteMembers',NULL,3,1,1,NULL),(60,14,'新建','save','/crmReceivables/add',NULL,3,1,1,NULL),(61,14,'编辑','update','/crmReceivables/update',NULL,3,1,1,NULL),(62,14,'查看列表','index','/crmReceivables/queryPageList',NULL,3,1,1,NULL),(63,14,'查看详情','read','/crmReceivables/queryById',NULL,3,1,1,NULL),(64,14,'删除','delete','/crmReceivables/deleteByIds',NULL,3,1,1,NULL),(65,15,'新建','save','/crmProduct/add',NULL,3,1,1,NULL),(66,15,'编辑','update','/crmProduct/udpate',NULL,3,1,1,NULL),(67,15,'查看列表','index','/crmProduct/queryPageList',NULL,3,1,1,NULL),(68,15,'查看详情','read','/crmProduct/queryById',NULL,3,1,1,NULL),(69,15,'上架/下架','status','/crmProduct/updateStatus',NULL,3,1,1,NULL),(70,15,'转移','transfer','/crmProduct/changeOwnerUser',NULL,3,1,1,NULL),(71,14,'转移','transfer','/crmReceivables/changeOwnerUser',NULL,3,1,1,NULL),(97,2,'业绩目标完成情况','achievement',NULL,NULL,1,0,1,NULL),(98,2,'销售漏斗','business','/biFunnel/addBusinessAnalyze,/biFunnel/win',NULL,1,0,1,NULL),(99,2,'员工客户分析','customer',NULL,NULL,1,0,1,NULL),(101,2,'员工业绩分析','contract',NULL,NULL,1,0,1,NULL),(102,97,'查看','read','/bi/taskCompleteStatistics',NULL,3,0,1,NULL),(103,98,'查看','read','',NULL,3,0,1,NULL),(104,99,'查看','read','/biCustomer/totalCustomerStats,/biCustomer/totalCustomerTable,/biCustomer/customerRecordStats,/biCustomer/customerRecordStats,/biCustomer/customerRecodCategoryStats,/biCustomer/customerConversionStats,/biCustomer/poolStats,/biCustomer/poolTable,/biCustomer/employeeCycle,/biCustomer/employeeCycleInfo,/biCustomer/customerSatisfactionTable,/biCustomer/productSatisfactionTable',NULL,3,0,1,NULL),(106,101,'查看','read','/biEmployee/contractNumStats,/biEmployee/contractMoneyStats,/biEmployee/receivablesMoneyStats,/biEmployee/totalContract,/biEmployee/invoiceStats',NULL,3,0,1,NULL),(107,11,'联系人导出','excelexport','/crmContacts/batchExportExcel,/crmContacts/allExportExcel',NULL,3,1,1,NULL),(108,11,'联系人导入','excelimport','/crmContacts/uploadExcel',NULL,3,1,1,NULL),(109,15,'产品导入','excelimport','/crmProduct/uploadExcel',NULL,3,1,1,NULL),(110,15,'产品导出','excelexport','/crmProduct/batchExportExcel,/crmProduct/allExportExcel',NULL,3,1,1,NULL),(117,2,'产品分析','product',NULL,NULL,1,0,1,NULL),(118,117,'查看','read','/bi/productStatistics,/biRanking/contractProductRanKing',NULL,3,0,1,NULL),(123,2,'客户画像分析','portrait',NULL,NULL,1,0,1,NULL),(124,123,'查看','read','/biRanking/addressAnalyse,/biRanking/portrait,/biRanking/portraitLevel,/biRanking/portraitSource',NULL,3,0,1,NULL),(125,2,'排行榜','ranking',NULL,NULL,1,0,1,NULL),(126,125,'查看','read','/biRanking/contractRanKing,/biRanking/receivablesRanKing,/biRanking/contractCountRanKing,/biRanking/productCountRanKing,/biRanking/productCountRanKing,/biRanking/contactsCountRanKing,/biRanking/customerCountRanKing,/biRanking/recordCountRanKing,/biRanking/customerGenjinCountRanKing,/biRanking/customerGenjinCountRanKing',NULL,3,0,1,NULL),(146,2,'办公分析','oa',NULL,NULL,1,10,1,NULL),(147,146,'查看','read','/biWork/logStatistics,/biWork/examineStatistics',NULL,3,1,1,NULL),(148,0,'全部','oa',NULL,NULL,1,0,1,NULL),(149,0,'全部','project',NULL,NULL,1,0,1,'项目管理角色权限'),(150,148,'通讯录','book',NULL,NULL,1,1,1,NULL),(151,150,'查看','read','/adminUser/queryListName',NULL,3,0,1,NULL),(152,149,'项目管理','projectManage',NULL,NULL,1,1,1,NULL),(153,152,'新建项目','save','/work/addWork',NULL,3,2,1,'projectSave'),(160,3,'企业首页','system',NULL,NULL,1,1,1,NULL),(161,160,'查看','read','',NULL,3,1,1,NULL),(162,160,'编辑','update','/adminConfig/setAdminConfig',NULL,3,2,1,NULL),(163,3,'应用管理','configSet',NULL,NULL,1,2,1,NULL),(164,163,'查看','read',NULL,NULL,3,1,1,NULL),(165,163,'停用/启用','update','/adminConfig/setModuleSetting',NULL,3,2,1,NULL),(166,3,'员工与部门管理','users',NULL,NULL,1,3,1,NULL),(167,166,'部门/员工查看','read','',NULL,3,1,1,NULL),(168,166,'员工新建','userSave','/adminUser/addUser',NULL,3,2,1,NULL),(169,166,'员工禁用/激活','userEnables','/adminUser/setUserStatus',NULL,3,3,1,NULL),(170,166,'员工操作','userUpdate','/adminUser/setUser',NULL,3,4,1,NULL),(171,166,'部门新建','deptSave','/adminDept/addDept',NULL,3,5,1,NULL),(172,166,'部门编辑','deptUpdate','/adminDept/setDept',NULL,3,6,1,NULL),(173,166,'部门删除','deptDelete','/adminDept/deleteDept',NULL,3,7,1,NULL),(174,3,'角色权限管理','permission',NULL,NULL,1,4,1,NULL),(175,174,'角色权限设置','update','/adminRole/getRoleByType/*',NULL,3,1,1,NULL),(176,3,'办公审批流','oa',NULL,NULL,1,6,1,NULL),(177,176,'办公审批流管理','examine','/oaExamineCategory/queryExamineCategoryList',NULL,3,1,1,NULL),(178,3,'业务审批流','examineFlow',NULL,NULL,1,5,1,NULL),(179,178,'业务审批流管理','update','/crmExamine/queryAllExamine',NULL,3,1,1,NULL),(180,3,'客户管理设置','crm',NULL,NULL,1,7,1,NULL),(181,180,'自定义字段设置','field','/crmField/queryFields',NULL,3,1,1,NULL),(182,180,'客户公海规则','pool','/crmCustomerPool/queryPoolSettingList',NULL,3,2,1,NULL),(183,180,'业务参数设置','setting','',NULL,3,4,1,NULL),(184,180,'业绩目标设置','achievement','/biAchievement/queryAchievementList',NULL,3,5,1,NULL),(185,3,'项目管理设置','work',NULL,NULL,1,8,1,NULL),(186,185,'项目管理','update','',NULL,3,1,1,NULL),(187,148,'公告','announcement',NULL,NULL,1,2,1,NULL),(188,187,'新建','save','/oaAnnouncement/addAnnouncement',NULL,3,1,1,NULL),(189,187,'编辑','update','/oaAnnouncement/setAnnouncement',NULL,3,2,1,NULL),(190,187,'删除','delete','/oaAnnouncement/delete',NULL,3,3,1,NULL),(191,10,'设置成交状态','dealStatus','/crmCustomer/setDealStatus',NULL,3,0,1,NULL),(192,13,'合同作废','discard','/crmContract/contractDiscard',NULL,3,1,1,NULL),(193,2,'呼叫中心','call',NULL,NULL,1,0,1,NULL),(194,193,'查询通话记录','index',NULL,NULL,3,2,1,NULL),(195,193,'通话记录分析','analysis',NULL,NULL,3,3,1,NULL),(200,1,'市场活动','marketing',NULL,NULL,1,1,1,''),(201,200,'新建','save','/crmMarketing/add',NULL,3,1,1,''),(202,200,'查看列表','index','/crmMarketing/queryPageList',NULL,3,1,1,''),(204,200,'编辑','update','/crmMarketing/update',NULL,3,1,1,''),(205,200,'删除','delete','/crmMarketing/deleteByIds',NULL,3,1,1,''),(206,200,'启用/停用','updateStatus','/crmMarketing/updateStatus',NULL,3,1,1,''),(207,200,'查看详情','read','/crmMarketing/queryById',NULL,3,1,1,''),(208,13,'导出','excelexport','/crmContract/batchExportExcel,/crmContract/allExportExcel',NULL,3,1,1,''),(209,12,'导出','excelexport','/crmBusiness/batchExportExcel,/crmBusiness/allExportExcel',NULL,3,1,1,''),(211,15,'删除','delete','/crmProduct/deleteByIds',NULL,3,1,1,''),(212,14,'导出','excelexport','/crmReceivables/batchExportExcel,/crmReceivables/allExportExcel',NULL,3,1,1,''),(213,1,'外勤','outwork',NULL,NULL,1,9,1,NULL),(214,213,'新建','save',NULL,NULL,3,1,1,NULL),(215,213,'查看','read',NULL,NULL,3,1,1,NULL),(216,213,'删除','delete',NULL,NULL,3,1,1,NULL),(217,213,'设置','setting',NULL,NULL,3,1,1,NULL),(218,10,'附近的客户','nearbyCustomer','/crmCustomer/nearbyCustomer',NULL,3,1,1,''),(230,3,'系统日志','adminLog',NULL,NULL,1,9,1,NULL),(231,230,'系统登录日志','loginLog','/system/log/queryLoginLogList',NULL,3,0,1,NULL),(232,230,'数据操作日志','actionRecord','/system/log/queryActionRecordList',NULL,3,0,1,NULL),(233,230,'系统操作日志','systemLog','/system/log/querySystemLogList',NULL,3,1,1,NULL),(300,0,'项目管理','work',NULL,NULL,1,0,1,NULL),(301,300,'项目','project',NULL,NULL,1,0,1,NULL),(310,301,'项目设置','setWork','',NULL,3,1,1,NULL),(311,301,'项目导出','excelExport','',NULL,3,2,1,NULL),(312,301,'新建任务列表','saveTaskClass','',NULL,3,3,1,NULL),(313,301,'编辑任务列表','updateTaskClass','',NULL,3,4,1,NULL),(314,301,'移动任务列表','updateClassOrder','',NULL,3,5,1,NULL),(315,301,'删除任务列表','deleteTaskClass','',NULL,3,6,1,NULL),(316,301,'新建任务','saveTask','',NULL,3,7,1,NULL),(317,301,'完成任务','setTaskStatus','',NULL,3,8,1,NULL),(318,301,'编辑任务标题','setTaskTitle','',NULL,3,9,1,NULL),(319,301,'编辑任务描述','setTaskDescription','',NULL,3,10,1,NULL),(320,301,'分配任务','setTaskMainUser','',NULL,3,11,1,NULL),(321,301,'设置任务时间','setTaskTime','',NULL,3,12,1,NULL),(322,301,'设置任务标签','setTaskLabel','',NULL,3,13,1,NULL),(323,301,'添加任务参与人','setTaskOwnerUser','',NULL,3,14,1,NULL),(324,301,'设置任务优先级','setTaskPriority','',NULL,3,15,1,NULL),(325,301,'移动任务','setTaskOrder','',NULL,3,16,1,NULL),(326,301,'归档任务','archiveTask','',NULL,3,17,1,NULL),(327,301,'删除任务','deleteTask','',NULL,3,18,1,NULL),(328,301,'彻底删除任务','cleanTask','',NULL,3,19,1,NULL),(329,301,'任务添加附件','uploadTaskFile','',NULL,3,20,1,NULL),(330,301,'任务删除附件','deleteTaskFile','',NULL,3,21,1,NULL),(331,301,'项目导入','excelImport','',NULL,3,22,1,NULL),(332,301,'新建子任务','addChildTask','',NULL,3,23,1,NULL),(333,301,'编辑子任务','updateChildTask','',NULL,3,24,1,NULL),(334,301,'删除子任务','deleteChildTask','',NULL,3,25,1,NULL),(335,301,'恢复任务','restoreTask','',NULL,3,26,1,NULL),(336,301,'关联业务','saveTaskRelation','',NULL,3,27,1,NULL),(337,301,'完成子任务','setChildTaskStatus','',NULL,3,28,1,NULL),(400,1,'客户回访管理','visit',NULL,NULL,1,8,1,NULL),(401,400,'新建','save','/crmReturnVisit/add',NULL,3,1,1,NULL),(402,400,'编辑','update','/crmReturnVisit/update',NULL,3,1,1,NULL),(403,400,'查看列表','index','/crmReturnVisit/queryPageList',NULL,3,1,1,NULL),(404,400,'查看详情','read','/crmReturnVisit/queryById/*',NULL,3,1,1,NULL),(405,400,'删除','delete','/crmReturnVisit/deleteByIds',NULL,3,1,1,NULL),(420,1,'发票管理','invoice',NULL,NULL,1,9,1,NULL),(421,420,'新建','save','/crmInvoice/save',NULL,3,1,1,NULL),(422,420,'编辑','update','/crmInvoice/update',NULL,3,1,1,NULL),(423,420,'查看列表','index','/crmInvoice/queryPageList',NULL,3,1,1,NULL),(424,420,'查看详情','read','/crmInvoice/queryById/*',NULL,3,1,1,NULL),(425,420,'删除','delete','/crmInvoice/deleteByIds',NULL,3,1,1,NULL),(426,420,'转移','transfer','/crmInvoice/changeOwnerUser',NULL,3,1,1,NULL),(427,420,'标记开票','updateInvoiceStatus','/crmInvoice/updateInvoiceStatus',NULL,3,1,1,NULL),(428,420,'重置开票信息','resetInvoiceStatus','/crmInvoice/resetInvoiceStatus',NULL,3,1,1,NULL),(440,1,'跟进记录管理','followRecord',NULL,NULL,1,10,1,NULL),(441,440,'查看','read','/crmInstrument/queryRecordList',NULL,3,1,1,NULL),(442,440,'新建','save','/crmActivity/addCrmActivityRecord',NULL,3,2,1,NULL),(443,440,'编辑','update','/crmActivity/updateActivityRecord',NULL,3,3,1,NULL),(444,440,'删除','delete','/crmActivity/deleteCrmActivityRecord/*',NULL,3,4,1,NULL),(500,180,'打印模板设置','print','',NULL,3,3,1,NULL),(501,12,'打印','print','',NULL,3,1,1,NULL),(502,13,'打印','print','',NULL,3,1,1,NULL),(503,14,'打印','print','',NULL,3,1,1,NULL),(601,6,'供应商','supplier','',NULL,1,1,1,NULL),(602,601,'新建','save','/jxcSupplier/addOrUpdate/add',NULL,3,1,1,NULL),(603,601,'编辑','update','/jxcSupplier/addOrUpdate/update',NULL,3,1,1,NULL),(604,601,'查看列表','index','/jxcField/queryPageList/2',NULL,3,1,1,NULL),(605,601,'查看详情','read','/jxcField/information/2,/jxcSupplier/queryById/*',NULL,3,1,1,NULL),(606,601,'删除','delete','/jxcSupplier/deleteByIds',NULL,3,1,1,NULL),(607,601,'转移','transfer','/jxcField/transfer/2',NULL,3,1,1,NULL),(608,601,'导出','excelexport',NULL,NULL,3,1,1,NULL),(610,6,'采购订单','purchase','',NULL,1,2,1,NULL),(611,610,'新建','save','/jxcPurchase/addOrUpdate/add',NULL,3,1,1,NULL),(612,610,'编辑','update','/jxcPurchase/addOrUpdate/update',NULL,3,1,1,NULL),(613,610,'查看列表','index','/jxcField/queryPageList/3',NULL,3,1,1,NULL),(614,610,'查看详情','read','/jxcField/information/3,/jxcPurchase/queryById/*',NULL,3,1,1,NULL),(615,610,'删除','delete','/jxcPurchase/deleteByIds',NULL,3,1,1,NULL),(616,610,'转移','transfer','/jxcField/transfer/3',NULL,3,1,1,NULL),(617,610,'作废','setState','/jxcPurchase/setStateByIds',NULL,3,1,1,NULL),(618,610,'导出','excelexport',NULL,NULL,3,1,1,NULL),(620,6,'采购退货','retreat','',NULL,1,3,1,NULL),(621,620,'新建','save','/jxcRetreat/addOrUpdate/add',NULL,3,1,1,NULL),(622,620,'编辑','update','/jxcRetreat/addOrUpdate/update',NULL,3,1,1,NULL),(623,620,'查看列表','index','/jxcField/queryPageList/4',NULL,3,1,1,NULL),(624,620,'查看详情','read','/jxcField/information/4,/jxcRetreat/queryById/*',NULL,3,1,1,NULL),(625,620,'删除','delete','/jxcRetreat/deleteByIds',NULL,3,1,1,NULL),(626,620,'转移','transfer','/jxcField/transfer/4',NULL,3,1,1,NULL),(627,620,'作废','setState','/jxcRetreat/setStateByIds',NULL,3,1,1,NULL),(628,620,'导出','excelexport',NULL,NULL,3,1,1,NULL),(630,6,'产品','product','',NULL,1,4,1,NULL),(631,630,'新建','save','/jxcProduct/addOrUpdate/add',NULL,3,1,1,NULL),(632,630,'编辑','update','/jxcProduct/addOrUpdate/update',NULL,3,1,1,NULL),(633,630,'查看列表','index','/jxcField/queryList/1,/jxcField/queryPageList/1,/jxcWarehouseProduct/queryPageList,/jxcWarehouseProduct/queryList',NULL,3,1,1,NULL),(634,630,'查看详情','read','/jxcField/information/1,/jxcProduct/queryById/*',NULL,3,1,1,NULL),(636,630,'上/下架','self','/jxcProduct/addorUpdateShelf',NULL,3,1,1,NULL),(637,630,'删除','delete','/jxcProduct/deleteByIds',NULL,NULL,0,1,NULL),(638,630,'导出','excelexport',NULL,NULL,3,1,1,NULL),(640,6,'销售订单','sale','',NULL,1,5,1,NULL),(641,640,'新建','save','/jxcSale/addOrUpdate/add',NULL,3,1,1,NULL),(642,640,'编辑','update','/jxcSale/addOrUpdate/update',NULL,3,1,1,NULL),(643,640,'查看列表','index','/jxcField/queryPageList/5',NULL,3,1,1,NULL),(644,640,'查看详情','read','/jxcField/information/5,/jxcSale/queryById/*',NULL,3,1,1,NULL),(645,640,'删除','delete','/jxcSale/deleteByIds',NULL,3,1,1,NULL),(646,640,'转移','transfer','/jxcField/transfer/5',NULL,3,1,1,NULL),(647,640,'作废','setState','/jxcSale/setStateByIds',NULL,3,1,1,NULL),(648,640,'导出','excelexport',NULL,NULL,3,1,1,NULL),(650,6,'销售退货单','saleReturn','',NULL,1,6,1,NULL),(651,650,'新建','save','/jxcSaleReturn/addOrUpdate/add',NULL,3,1,1,NULL),(652,650,'编辑','update','/jxcSaleReturn/addOrUpdate/update',NULL,3,1,1,NULL),(653,650,'查看列表','index','/jxcField/queryPageList/6',NULL,3,1,1,NULL),(654,650,'查看详情','read','/jxcField/information/6,/jxcSaleReturn/queryById/*',NULL,3,1,1,NULL),(655,650,'删除','delete','/jxcSaleReturn/deleteByIds',NULL,3,1,1,NULL),(656,650,'转移','transfer','/jxcField/transfer/6',NULL,3,1,1,NULL),(657,650,'作废','setState','/jxcSaleReturn/setStateByIds',NULL,3,1,1,NULL),(658,650,'导出','excelexport',NULL,NULL,3,1,1,NULL),(670,6,'仓库管理','warehouse','',NULL,1,7,1,NULL),(671,670,'新建','save','/jxcWarehouse/addOrUpdate/add',NULL,3,1,1,NULL),(672,670,'编辑','update','/jxcWarehouse/addOrUpdate/update',NULL,3,1,1,NULL),(673,670,'查看列表','index','/jxcWarehouse/queryPageList',NULL,3,1,1,NULL),(675,670,'删除','delete','/jxcWarehouse/deleteByIds',NULL,3,1,1,NULL),(676,670,'停用/启用','spst','/jxcWarehouse/setTrunByIds',NULL,3,1,1,NULL),(677,670,'导出','excelexport',NULL,NULL,3,1,1,NULL),(680,6,'产品库存','warehouseProduct','',NULL,1,8,1,NULL),(681,680,'查看列表','index','/jxcWarehouseProduct/queryPageList',NULL,3,1,1,NULL),(682,680,'导出','excelexport',NULL,NULL,3,1,1,NULL),(690,6,'产品入库','receipt','',NULL,1,9,1,NULL),(691,690,'新建','save','/jxcReceipt/addOrUpdate',NULL,3,1,1,NULL),(693,690,'查看列表','index','/jxcField/queryPageList/7',NULL,3,1,1,NULL),(694,690,'查看详情','read','/jxcField/information/7,/jxcReceipt/queryById/*',NULL,3,1,1,NULL),(695,690,'作废','setState','/jxcReceipt/setStateByIds',NULL,3,1,1,NULL),(696,690,'导出','excelexport',NULL,NULL,3,1,1,NULL),(700,6,'产品出库','outbound','',NULL,1,10,1,NULL),(701,700,'新建','save','/jxcOutbound/addOrUpdate',NULL,3,1,1,NULL),(703,700,'查看列表','index','/jxcField/queryPageList/8',NULL,3,1,1,NULL),(704,700,'查看详情','read','/jxcField/information/8,/jxcOutbound/queryById/*',NULL,3,1,1,NULL),(705,700,'作废','setState','/jxcOutbound/setStateByIds',NULL,3,1,1,NULL),(706,700,'导出','excelexport',NULL,NULL,3,1,1,NULL),(710,6,'库存调拨','allocation','',NULL,1,11,1,NULL),(711,710,'新建','save','/jxcAllocation/addOrUpdate/add',NULL,3,1,1,NULL),(712,710,'编辑','update','/jxcAllocation/addOrUpdate/update',NULL,3,1,1,NULL),(713,710,'查看列表','index','/jxcField/queryPageList/12',NULL,3,1,1,NULL),(714,710,'查看详情','read','/jxcField/information/12,/jxcAllocation/queryById/*',NULL,3,1,1,NULL),(715,710,'删除','delete','/jxcAllocation/deleteByIds',NULL,3,1,1,NULL),(716,710,'作废','setState','/jxcAllocation/setStateByIds',NULL,3,1,1,NULL),(717,710,'导出','excelexport',NULL,NULL,3,1,1,NULL),(720,6,'库存盘点','inventory','',NULL,1,12,1,NULL),(721,720,'新建','save','/jxcInventory/addOrUpdate/add',NULL,3,1,1,NULL),(722,720,'编辑','update','/jxcInventory/addOrUpdate/update',NULL,3,1,1,NULL),(723,720,'查看列表','index','/jxcField/queryPageList/11',NULL,3,1,1,NULL),(724,720,'查看详情','read','/jxcField/information/11,/jxcInventory/queryById/*',NULL,3,1,1,NULL),(725,720,'删除','delete','/jxcInventory/deleteByIds',NULL,3,1,1,NULL),(726,720,'作废','setState','/jxcInventory/setStateByIds',NULL,3,1,1,NULL),(727,720,'盘点入库','storage',NULL,NULL,NULL,0,1,NULL),(728,720,'盘点作废','invalid','',NULL,NULL,0,1,NULL),(729,720,'导出','excelexport',NULL,NULL,3,1,1,NULL),(730,6,'出入库明细','detailed','',NULL,1,13,1,NULL),(731,730,'查看列表','index','/jxcField/queryPageList/13',NULL,3,1,1,NULL),(732,730,'导出','excelexport',NULL,NULL,3,1,1,NULL),(740,6,'回款','collection','',NULL,1,14,1,NULL),(741,740,'新建','save','/jxcCollection/addOrUpdate/add',NULL,3,1,1,NULL),(742,740,'编辑','update','/jxcCollection/addOrUpdate/update',NULL,3,1,1,NULL),(743,740,'查看列表','index','/jxcField/queryPageList/10',NULL,3,1,1,NULL),(744,740,'查看详情','read','/jxcField/information/10,/jxcCollection/queryById/*',NULL,3,1,1,NULL),(745,740,'删除','delete','/jxcCollection/deleteByIds',NULL,3,1,1,NULL),(746,740,'转移','transfer','/jxcField/transfer/10',NULL,3,1,1,NULL),(747,740,'作废','setState','/jxcCollection/setStateByIds',NULL,3,1,1,NULL),(748,740,'导出','excelexport',NULL,NULL,3,1,1,NULL),(750,6,'付款','payment','',NULL,1,15,1,NULL),(751,750,'新建','save','/jxcPayment/addOrUpdate/add',NULL,3,1,1,NULL),(752,750,'编辑','update','/jxcPayment/addOrUpdate/update',NULL,3,1,1,NULL),(753,750,'查看列表','index','/jxcField/queryPageList/9',NULL,3,1,1,NULL),(754,750,'查看详情','read','/jxcField/information/9,/jxcPayment/queryById/*',NULL,3,1,1,NULL),(755,750,'删除','delete','/jxcPayment/deleteByIds',NULL,3,1,1,NULL),(756,750,'转移','transfer','/jxcField/transfer/9',NULL,3,1,1,NULL),(757,750,'作废','setState','/jxcPayment/setStateByIds',NULL,3,1,1,NULL),(758,750,'导出','excelexport',NULL,NULL,3,1,1,NULL),(760,2,'全部','jxc','',NULL,1,0,1,NULL),(761,760,'进销存采购分析','purchasingStatistics','',NULL,1,0,1,NULL),(762,761,'查看','read','/jxcPurchaseStatistics/purchasingStatistics,/jxcProductPurchaseStatistics/productPurchaseStatistics,/jxcProductPurchaseStatistics/purchaseHeadStatistics,/jxcSupplierPurchaseStatistics/supplierPurchaseStatistics',NULL,3,0,1,NULL),(763,760,'进销存销售分析','saleStatistics','',NULL,1,0,1,NULL),(764,763,'查看','read','/jxcSaleStatistics/saleStatistics,/jxcProductSaleStatistics/productSaleStatistics,/jxcProductSaleStatistics/saleHeadStatistics,/jxcCustomerSaleStatistics/customerSaleStatistics,/jxcCustomerSaleStatistics/customerSaleStatistics',NULL,3,0,1,NULL),(765,760,'进销存产品分析','productStatistics','',NULL,1,0,1,NULL),(766,765,'查看','read','/jxcProductStatistics/productStatistics,/jxcProductStatistics/productHeadStatistics',NULL,3,0,1,NULL),(800,5,'员工管理','employee','',NULL,1,1,1,NULL),(801,800,'新建','save','/hrmEmployee/addEmployee',NULL,3,1,1,NULL),(802,800,'编辑','update','/hrmEmployeePost/updatePostInformation,/hrmEmployee/setEduExperience,/hrmEmployee/addExperience,/hrmEmployee/deleteEduExperience,/hrmEmployee/addWorkExperience,/hrmEmployee/setWorkExperience,/hrmEmployee/deleteWorkExperience,/hrmEmployee/addCertificate,/hrmEmployee/setCertificate,/hrmEmployee/deleteCertificate,/hrmEmployee/addTrainingExperience,/hrmEmployee/setTrainingExperience,/hrmEmployee/deleteTrainingExperience,/hrmEmployee/addContacts,/hrmEmployee/setContacts,/hrmEmployee/deleteContacts,/hrmEmployeeContract/addContract,/hrmEmployeeContract/setContract,/hrmEmployeeContract/deleteContract,/SocialSecurity/setSalaryCard,/SocialSecurity/setSocialSecurity,/hrmEmployeeFile/addFile,/hrmEmployeeFile/deleteFile',NULL,3,2,1,NULL),(803,800,'查看列表','index','/hrmEmployee/queryPageList',NULL,3,3,1,'label-92'),(804,800,'查看详情','read','/hrmEmployee/queryById,/hrmEmployeePost/postInformation,/hrmEmployee/personalInformation,/hrmEmployeeContract/contractInformation,/hrmEmployee/SocialSecurity/salarySocialSecurityInformation,/hrmEmployeeFile/queryFileNum',NULL,3,4,1,'label-92'),(805,800,'导入','excelimport','/hrmEmployee/uploadExcel',NULL,3,5,1,NULL),(806,800,'导出','excelexport','/hrmEmployee/export',NULL,3,6,1,NULL),(807,800,'删除','delete','/hrmEmployee/deleteByIds',NULL,3,7,1,NULL),(808,800,'办理转正','become','/hrmEmployee/become',NULL,3,8,1,NULL),(809,800,'调整部门/岗位','changePost','/hrmEmployee/changePost',NULL,3,9,1,NULL),(810,800,'晋升/降级','promotion','/hrmEmployee/promotion',NULL,3,10,1,NULL),(811,800,'办理离职','leave','/hrmEmployeePost/addLeaveInformation',NULL,3,11,1,NULL),(812,800,'设置参保方案','setInsured','/hrmEmployee/updateInsuranceScheme',NULL,3,12,1,NULL),(813,800,'再入职','againOnboarding','/hrmEmployee/againOnboarding',NULL,3,13,1,NULL),(814,800,'确认入职','confirmEntry','/hrmEmployee/confirmEntry',NULL,3,13,1,NULL),(815,800,'放弃离职','cancelLevel','/hrmEmployeePost/deleteLeaveInformation',NULL,3,14,1,NULL),(830,5,'组织管理','dept','',NULL,1,2,1,NULL),(831,830,'新建','save','/hrmDept/addDept',NULL,3,1,1,NULL),(832,830,'编辑','update','/hrmDept/setDept',NULL,3,2,1,NULL),(833,830,'查看列表','index','',NULL,3,3,1,'label-92'),(834,830,'查看详情','read','/hrmDept/queryById',NULL,3,4,1,'label-92'),(835,830,'删除','delete','/hrmDept/deleteDeptById',NULL,3,5,1,NULL),(840,5,'薪资管理','salary','',NULL,1,3,1,NULL),(841,840,'工资表维护','manage','/hrmSalaryMonthRecord/computeSalaryData,/hrmSalaryMonthRecord/updateSalary,/hrmSalaryMonthRecord/submitExamine,/hrmSalaryMonthRecord/addNextMonthSalary',NULL,3,1,1,NULL),(842,840,'查看薪酬列表','index','/hrmSalaryOption/querySalaryOptionDetail',NULL,3,2,1,'label-92'),(843,840,'查看历史工资','history','/hrmSalaryHistoryRecord/queryHistorySalaryList',NULL,3,3,1,'label-92'),(844,840,'发放工资条','sendSlip','/hrmSalarySlipRecord/sendSalarySlip',NULL,3,4,1,NULL),(845,840,'查看发放记录','queryRecord','',NULL,3,5,1,NULL),(846,840,'查看薪资档案','queryArchives','/hrmSalaryArchives/querySalaryArchivesList',NULL,3,6,1,'label-92'),(847,840,'维护薪资档案','updateArchives','/hrmSalaryArchives/setFixSalaryRecord,/hrmSalaryArchives/setChangeSalaryRecord,/deleteChangeSalary/setChangeSalaryRecord,/deleteChangeSalary/batchChangeSalaryRecord,/deleteChangeSalary/exportFixSalaryRecord',NULL,3,7,1,NULL),(850,5,'社保管理','insurance','',NULL,1,4,1,NULL),(851,850,'维护社保','manage','/hrmInsuranceMonthRecord/computeInsuranceData,/hrmInsuranceMonthEmpRecord/stop,/hrmInsuranceMonthEmpRecord/updateInsuranceProject',NULL,3,1,1,NULL),(852,850,'查看社保','read','/hrmInsuranceMonthRecord/queryInsuranceRecordList',NULL,3,2,1,'label-92'),(860,5,'招聘管理','recruit','',NULL,1,5,1,NULL),(861,860,'新建候选人','save','/hrmRecruitCandidate/addCandidate',NULL,3,1,1,NULL),(862,860,'查看候选人','read','/hrmRecruitCandidate/queryPageList,/hrmRecruitCandidate/queryById',NULL,3,2,1,'label-92'),(863,860,'维护候选人','manage','/hrmRecruitCandidate/setCandidate,/hrmRecruitCandidate/updateCandidateStatus,/hrmRecruitCandidate/updateCandidatePost,/hrmRecruitCandidate/updateCandidateRecruitChannel,/hrmRecruitCandidate/eliminateCandidate',NULL,3,3,1,NULL),(864,860,'删除候选人','delete','/hrmRecruitCandidate/deleteByIds,/hrmRecruitCandidate/deleteById',NULL,3,4,1,NULL),(865,860,'新建招聘职位','savePost','/hrmRecruitPost/addRecruitPost',NULL,3,5,1,NULL),(866,860,'编辑招聘职位','updatePost','/hrmRecruitPost/setRecruitPost',NULL,3,6,1,NULL),(867,860,'查看招聘职位','readPost','/hrmRecruitPost/queryRecruitPostPageList,/hrmRecruitPost/queryById',NULL,3,7,1,'label-92'),(868,860,'停用/启用招聘职位','updatePostStatus','/hrmRecruitPost/updateRecruitPostStatus',NULL,3,8,1,NULL),(880,5,'绩效管理','appraisal','',NULL,1,6,1,NULL),(881,880,'新建绩效','save','/hrmRecruitPost/addAppraisal',NULL,3,1,1,NULL),(882,880,'编辑绩效','update','/hrmRecruitPost/setAppraisal',NULL,3,2,1,NULL),(883,880,'查看绩效','read','',NULL,3,3,1,NULL),(884,880,'删除绩效','delete','/hrmRecruitPost/delete',NULL,3,4,1,NULL),(885,880,'终止绩效','stop','/hrmRecruitPoststopAppraisal',NULL,3,5,1,NULL),(886,880,'查看员工绩效','readEmp','',NULL,3,3,1,'label-92'),(890,5,'考勤管理','attendance','',NULL,1,6,1,NULL),(891,890,'查看打卡记录','readClock','/hrmRecruitPost/addAppraisal',NULL,3,1,1,'label-92'),(892,890,'导出打卡记录','excelexport','/hrmAttendanceClock/excelExport',NULL,3,1,1,NULL),(900,3,'人力资源管理','hrm',NULL,NULL,1,10,1,NULL),(901,900,'自定义字段设置','field','/hrmConfig/queryFields',NULL,3,1,1,NULL),(902,900,'薪资设置','salary','/hrmSalaryGroup/querySalaryGroupPageList',NULL,3,2,1,NULL),(903,900,'社保设置','insurance','',NULL,3,2,1,NULL),(904,900,'绩效设置','appraisal','',NULL,3,2,1,NULL),(905,900,'业务参数设置','params','/hrmConfig/queryRecruitChannelList',NULL,3,2,1,NULL),(906,900,'员工档案设置','archives','',NULL,3,2,1,NULL),(920,3,'进销存管理','jxc',NULL,NULL,1,11,1,NULL),(921,920,'自定义字段设置','field','/jxcField/queryFields',NULL,3,1,1,NULL),(922,920,'业务参数设置','params','/jxcProductType/queryJxcProductTyp,/jxcNumberSetting/queryNumberSetting',NULL,3,1,1,NULL),(923,3,'初始化','init',NULL,NULL,1,12,1,NULL),(924,923,'初始化管理','initData','/adminConfig/moduleInitData',NULL,3,0,1,NULL),(926,180,'市场活动表单设置','activityForm','/crmMarketingForm/page',NULL,3,6,1,NULL),(927,301,'管理参与人权限','manageTaskOwnerUser','',NULL,3,29,1,NULL),(928,440,'导入','excelimport','/crmInstrument/importRecordList',NULL,3,5,1,NULL),(929,440,'导出','excelexport','/crmInstrument/exportRecordList',NULL,3,6,1,NULL),(933,11,'编辑团队成员','teamsave','/crmContacts/addMembers,/crmContacts/updateMembers,/crmContacts/exitTeam',NULL,3,1,1,NULL),(934,14,'编辑团队成员','teamsave','/crmReceivables/addMembers,/crmReceivables/updateMembers,/crmReceivables/exitTeam',NULL,3,1,1,NULL),(935,166,'角色权限查看','read',NULL,NULL,3,8,1,NULL),(936,1,'回款计划','receivablesPlan',NULL,NULL,1,5,1,NULL),(937,936,'新建','save',NULL,NULL,3,1,1,NULL),(938,936,'编辑','update',NULL,NULL,3,2,1,NULL),(939,936,'查看列表','index',NULL,NULL,3,3,1,NULL),(940,936,'查看详情','read',NULL,NULL,3,4,1,NULL),(941,936,'删除','delete',NULL,NULL,3,5,1,NULL),(942,936,'导出','excelexport',NULL,NULL,3,6,1,NULL);
/*!40000 ALTER TABLE `wk_admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_message`
--

DROP TABLE IF EXISTS `wk_admin_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_message` (
  `message_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `title` varchar(128) DEFAULT NULL COMMENT '消息标题',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `label` int(11) DEFAULT NULL COMMENT '消息大类 1 任务 2 日志 3 oa审批 4公告 5 日程 6 crm消息 7 知识库 8 人资',
  `type` int(11) DEFAULT NULL COMMENT '消息类型 详见AdminMessageEnum',
  `type_id` int(11) DEFAULT NULL COMMENT '关联ID',
  `create_user` bigint(20) NOT NULL COMMENT '消息创建者 0为系统',
  `recipient_user` bigint(20) NOT NULL COMMENT '接收人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_read` int(11) DEFAULT '0' COMMENT '是否已读 0 未读 1 已读',
  `read_time` datetime DEFAULT NULL COMMENT '已读时间',
  PRIMARY KEY (`message_id`) USING BTREE,
  KEY `recipient_user` (`recipient_user`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_message`
--

LOCK TABLES `wk_admin_message` WRITE;
/*!40000 ALTER TABLE `wk_admin_message` DISABLE KEYS */;
INSERT INTO `wk_admin_message` VALUES (1,'佛山大学计算机专业毕业设计',NULL,6,26,1,14773,14773,'2024-09-18 21:34:31',1,NULL),(2,'佛山大学计算机专业毕业设计','',6,11,1,14773,14773,'2024-09-19 15:09:27',0,NULL),(3,'0001',NULL,6,37,1,14773,14777,'2024-09-19 15:11:39',0,NULL),(4,'0001',NULL,6,27,1,14773,14776,'2024-09-19 15:14:27',0,NULL),(5,'普通审批',NULL,3,25,1,14773,14774,'2024-09-20 10:18:58',0,NULL),(6,'加班审批',NULL,3,25,2,14773,14775,'2024-09-20 10:25:41',0,NULL),(7,'普通审批','没有意见',3,7,1,14774,14773,'2024-09-20 10:30:28',1,NULL),(8,'出差审批',NULL,3,25,3,14773,14774,'2024-09-20 10:35:23',0,NULL),(9,'出差审批','度你?的蜜月',3,6,3,14774,14773,'2024-09-20 10:38:22',1,NULL),(10,'出差审批',NULL,3,25,3,14773,14777,'2024-09-20 10:46:10',0,NULL),(11,'团建','{\"startTime\":1727485200000,\"endTime\":1727485200000,\"type\":1,\"value\":5}',5,9,1,14773,14773,'2024-09-28 08:55:00',0,NULL),(12,'发邮件',NULL,1,1,3,14773,14778,'2024-09-30 10:56:56',0,NULL),(13,'发邮件',NULL,1,3,3,14773,14778,'2024-10-08 10:07:33',0,NULL),(14,'发邮件',NULL,1,3,3,14773,14778,'2024-10-08 10:07:58',0,NULL),(16,'放假',NULL,4,8,1,0,14778,'2024-10-09 18:11:48',0,NULL),(17,'学习外语',NULL,4,8,2,0,14773,'2024-10-09 18:19:12',1,NULL),(18,'学习外语',NULL,4,8,2,0,14778,'2024-10-09 18:19:12',0,NULL),(19,'001',NULL,4,8,3,0,14773,'2024-10-09 18:41:23',1,NULL),(20,'001',NULL,4,8,3,0,14778,'2024-10-09 18:41:23',0,NULL),(21,'003',NULL,4,8,4,0,14773,'2024-10-09 18:46:11',1,NULL),(22,'003',NULL,4,8,4,0,14778,'2024-10-09 18:46:11',0,NULL),(23,'004',NULL,4,8,5,0,14773,'2024-10-09 18:46:44',1,NULL),(24,'004',NULL,4,8,5,0,14778,'2024-10-09 18:46:44',0,NULL),(25,'006',NULL,4,8,6,0,14773,'2024-10-09 18:47:53',1,NULL),(27,'007',NULL,4,8,7,0,14773,'2024-10-09 18:55:09',1,NULL),(28,'007',NULL,4,8,7,0,14777,'2024-10-09 18:55:09',1,NULL),(29,'100',NULL,4,8,8,0,14773,'2024-10-09 19:04:55',1,NULL),(30,'100',NULL,4,8,8,0,14777,'2024-10-09 19:04:55',1,NULL),(31,'放假',NULL,4,8,9,0,14773,'2024-10-09 19:52:20',1,NULL),(32,'放假',NULL,4,8,9,0,14778,'2024-10-09 19:52:20',0,NULL),(33,'休假',NULL,4,8,10,0,14773,'2024-10-09 20:02:17',1,NULL),(34,'休假',NULL,4,8,10,0,14778,'2024-10-09 20:02:17',0,NULL),(35,'放假02',NULL,4,8,11,0,14773,'2024-10-09 20:30:13',1,NULL),(37,'放假02',NULL,4,8,11,0,14775,'2024-10-09 20:30:13',0,NULL),(38,'放假02',NULL,4,8,11,0,14776,'2024-10-09 20:30:13',0,NULL),(39,'放假02',NULL,4,8,11,0,14777,'2024-10-09 20:30:13',1,NULL),(42,'放假03',NULL,4,8,12,0,14775,'2024-10-09 20:33:19',0,NULL),(43,'放假03',NULL,4,8,12,0,14776,'2024-10-09 20:33:19',0,NULL),(44,'放假03',NULL,4,8,12,0,14777,'2024-10-09 20:33:19',1,NULL),(45,'放假03',NULL,4,8,12,0,14778,'2024-10-09 20:33:19',0,NULL),(47,'放假04',NULL,4,8,13,0,14775,'2024-10-09 20:40:34',0,NULL),(48,'放假04',NULL,4,8,13,0,14777,'2024-10-09 20:40:34',1,NULL),(49,'日程01','{\"startTime\":1728435600000,\"endTime\":1728435600000,\"type\":1,\"value\":5}',5,9,2,14773,14773,'2024-10-09 08:55:00',1,NULL),(50,'借款申请',NULL,3,25,4,14773,14773,'2024-10-10 09:48:46',0,NULL),(51,'加班审批',NULL,3,25,5,14773,14773,'2024-10-10 09:53:28',0,NULL),(52,'加班审批','没有意见',3,7,5,14773,14773,'2024-10-10 14:39:22',1,NULL),(53,'邀请填写档案信息',NULL,8,83,NULL,14773,14778,'2024-10-12 08:08:47',0,NULL),(54,NULL,NULL,8,97,NULL,14773,14773,'2024-10-12 14:41:46',0,NULL),(55,NULL,NULL,8,97,NULL,14773,0,'2024-10-12 14:48:43',0,NULL),(56,NULL,NULL,8,97,NULL,14773,0,'2024-10-12 14:55:04',0,NULL),(57,NULL,NULL,8,97,NULL,14773,0,'2024-10-12 14:59:47',0,NULL),(58,NULL,NULL,8,97,NULL,14773,0,'2024-10-12 15:02:11',0,NULL),(59,NULL,NULL,8,97,NULL,14773,0,'2024-10-12 15:13:09',0,NULL),(60,NULL,NULL,8,97,NULL,14773,0,'2024-10-12 15:16:20',0,NULL),(61,NULL,NULL,8,97,NULL,14773,0,'2024-10-12 15:20:39',0,NULL),(62,NULL,NULL,8,97,NULL,14773,14777,'2024-10-14 09:20:30',0,NULL),(63,'11月考核',NULL,8,87,1,14773,14773,'2024-10-14 09:57:05',1,NULL),(64,'11月考核',NULL,8,87,2,14773,0,'2024-10-14 09:57:05',0,NULL);
/*!40000 ALTER TABLE `wk_admin_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_model_sort`
--

DROP TABLE IF EXISTS `wk_admin_model_sort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_model_sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '导航类型 1头部导航 2客户管理左侧导航',
  `model` varchar(255) NOT NULL COMMENT '模块  1仪表盘 2待办事项 3线索 4客户 5联系人 6商机 7合同 8回款 9发票 10回访 11产品 12市场活动',
  `sort` int(11) NOT NULL COMMENT '排序',
  `is_hidden` int(11) DEFAULT '0' COMMENT '是否隐藏  0不隐藏 1隐藏',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户管理导航栏排序表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_model_sort`
--

LOCK TABLES `wk_admin_model_sort` WRITE;
/*!40000 ALTER TABLE `wk_admin_model_sort` DISABLE KEYS */;
INSERT INTO `wk_admin_model_sort` VALUES (9,1,'crm',0,0,14773),(10,1,'taskExamine',1,0,14773),(11,1,'log',2,0,14773),(12,1,'book',3,0,14773),(13,1,'project',4,0,14773),(14,1,'bi',5,0,14773),(15,1,'calendar',6,0,14773),(16,1,'hrm',7,0,14773);
/*!40000 ALTER TABLE `wk_admin_model_sort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_official_img`
--

DROP TABLE IF EXISTS `wk_admin_official_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_official_img` (
  `official_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `size` bigint(20) DEFAULT NULL COMMENT '附件大小（字节）',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `path` varchar(255) DEFAULT NULL COMMENT '文件真实路径',
  `file_path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `type` int(11) DEFAULT NULL COMMENT '1.官网设置 2.名片海报',
  `name` varchar(255) DEFAULT NULL COMMENT '图片名字',
  `tactic` int(11) DEFAULT NULL COMMENT '0',
  PRIMARY KEY (`official_img_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='官网图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_official_img`
--

LOCK TABLES `wk_admin_official_img` WRITE;
/*!40000 ALTER TABLE `wk_admin_official_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_admin_official_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_role`
--

DROP TABLE IF EXISTS `wk_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `role_type` int(11) DEFAULT NULL COMMENT '0、自定义角色1、管理角色 2、客户管理角色 3、人事角色 4、财务角色 5、项目角色 8、项目自定义角色',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT '1' COMMENT '1 启用 0 禁用',
  `data_type` int(11) NOT NULL DEFAULT '5' COMMENT '数据权限 1、本人，2、本人及下属，3、本部门，4、本部门及下属部门，5、全部 ',
  `is_hidden` int(11) NOT NULL DEFAULT '1' COMMENT '0 隐藏 1 不隐藏',
  `label` int(11) DEFAULT NULL COMMENT '1 系统项目管理员角色 2 项目管理角色 3 项目编辑角色 4 项目只读角色',
  PRIMARY KEY (`role_id`) USING BTREE,
  KEY `role_type` (`role_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=180176 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_role`
--

LOCK TABLES `wk_admin_role` WRITE;
/*!40000 ALTER TABLE `wk_admin_role` DISABLE KEYS */;
INSERT INTO `wk_admin_role` VALUES (180162,'超级管理员',1,'admin',1,5,1,5),(180163,'系统设置管理员',1,NULL,1,2,1,6),(180164,'部门与员工管理员',1,NULL,1,5,1,7),(180165,'审批流管理员',1,NULL,1,5,1,8),(180166,'工作台管理员',1,NULL,1,5,1,9),(180167,'客户管理员',1,NULL,1,5,1,10),(180168,'公告管理员',7,NULL,1,5,1,11),(180169,'销售经理角色',2,NULL,1,5,1,NULL),(180170,'销售员角色',2,NULL,1,1,1,NULL),(180171,'项目管理员',8,'project',1,5,1,1),(180172,'管理',5,'系统默认权限，包含所在项目所有权限',1,5,0,2),(180173,'编辑',5,'成员初始加入时默认享有的权限',1,5,1,3),(180174,'只读',5,'项目只读角色',1,1,1,4),(180175,'上级角色',9,NULL,1,2,1,91);
/*!40000 ALTER TABLE `wk_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_role_auth`
--

DROP TABLE IF EXISTS `wk_admin_role_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_role_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `auth_role_id` int(11) DEFAULT NULL COMMENT '能查询的角色ID',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `auth_id` int(11) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_type` (`auth_role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_role_auth`
--

LOCK TABLES `wk_admin_role_auth` WRITE;
/*!40000 ALTER TABLE `wk_admin_role_auth` DISABLE KEYS */;
INSERT INTO `wk_admin_role_auth` VALUES (1,180162,0,0,'0',1);
/*!40000 ALTER TABLE `wk_admin_role_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_role_menu`
--

DROP TABLE IF EXISTS `wk_admin_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `menu_id` (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2300822 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色菜单对应关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_role_menu`
--

LOCK TABLES `wk_admin_role_menu` WRITE;
/*!40000 ALTER TABLE `wk_admin_role_menu` DISABLE KEYS */;
INSERT INTO `wk_admin_role_menu` VALUES (2300572,180163,3),(2300573,180163,160),(2300574,180163,161),(2300575,180163,162),(2300576,180163,163),(2300577,180163,164),(2300578,180163,165),(2300579,180163,166),(2300580,180163,167),(2300581,180163,168),(2300582,180163,169),(2300583,180163,170),(2300584,180163,171),(2300585,180163,172),(2300586,180163,173),(2300587,180163,174),(2300588,180163,175),(2300589,180163,176),(2300590,180163,177),(2300591,180163,178),(2300592,180163,179),(2300593,180163,180),(2300594,180163,181),(2300595,180163,182),(2300596,180163,183),(2300597,180163,184),(2300598,180163,185),(2300599,180163,186),(2300600,180164,166),(2300601,180164,167),(2300602,180164,168),(2300603,180164,169),(2300604,180164,170),(2300605,180164,171),(2300606,180164,172),(2300607,180164,173),(2300608,180165,178),(2300609,180165,179),(2300610,180166,176),(2300611,180166,177),(2300612,180167,180),(2300613,180167,181),(2300614,180167,182),(2300615,180167,183),(2300616,180167,184),(2300617,180168,187),(2300618,180168,188),(2300619,180168,189),(2300620,180168,190),(2300621,180169,9),(2300622,180169,10),(2300623,180169,11),(2300624,180169,12),(2300625,180169,13),(2300626,180169,14),(2300627,180169,17),(2300628,180169,18),(2300629,180169,19),(2300630,180169,20),(2300631,180169,21),(2300632,180169,22),(2300633,180169,23),(2300634,180169,24),(2300635,180169,25),(2300636,180169,26),(2300637,180169,27),(2300638,180169,28),(2300639,180169,29),(2300640,180169,30),(2300641,180169,31),(2300642,180169,32),(2300643,180169,33),(2300644,180169,34),(2300645,180169,35),(2300646,180169,36),(2300647,180169,40),(2300648,180169,41),(2300649,180169,42),(2300650,180169,43),(2300651,180169,44),(2300652,180169,45),(2300653,180169,46),(2300654,180169,47),(2300655,180169,48),(2300656,180169,49),(2300657,180169,50),(2300658,180169,51),(2300659,180169,52),(2300660,180169,53),(2300661,180169,54),(2300662,180169,55),(2300663,180169,56),(2300664,180169,57),(2300665,180169,58),(2300666,180169,59),(2300667,180169,60),(2300668,180169,61),(2300669,180169,62),(2300670,180169,63),(2300671,180169,64),(2300672,180169,67),(2300673,180169,68),(2300674,180169,97),(2300675,180169,98),(2300676,180169,99),(2300677,180169,101),(2300678,180169,102),(2300679,180169,103),(2300680,180169,104),(2300681,180169,106),(2300682,180169,107),(2300683,180169,108),(2300684,180169,117),(2300685,180169,118),(2300686,180169,123),(2300687,180169,124),(2300688,180169,125),(2300689,180169,126),(2300690,180169,191),(2300691,180169,192),(2300692,180170,14),(2300693,180170,17),(2300694,180170,18),(2300695,180170,19),(2300696,180170,20),(2300697,180170,21),(2300698,180170,25),(2300699,180170,26),(2300700,180170,27),(2300701,180170,28),(2300702,180170,29),(2300703,180170,30),(2300704,180170,34),(2300705,180170,35),(2300706,180170,36),(2300707,180170,40),(2300708,180170,41),(2300709,180170,42),(2300710,180170,43),(2300711,180170,44),(2300712,180170,45),(2300713,180170,46),(2300714,180170,47),(2300715,180170,48),(2300716,180170,49),(2300717,180170,50),(2300718,180170,52),(2300719,180170,53),(2300720,180170,54),(2300721,180170,55),(2300722,180170,56),(2300723,180170,57),(2300724,180170,59),(2300725,180170,60),(2300726,180170,61),(2300727,180170,62),(2300728,180170,63),(2300729,180170,64),(2300730,180170,67),(2300731,180170,68),(2300732,180170,97),(2300733,180170,98),(2300734,180170,99),(2300735,180170,101),(2300736,180170,102),(2300737,180170,103),(2300738,180170,104),(2300739,180170,106),(2300740,180170,108),(2300741,180170,117),(2300742,180170,118),(2300743,180170,123),(2300744,180170,124),(2300745,180170,125),(2300746,180170,126),(2300747,180173,316),(2300748,180173,317),(2300749,180173,318),(2300750,180173,319),(2300751,180173,320),(2300752,180173,321),(2300753,180173,322),(2300754,180173,323),(2300755,180173,324),(2300756,180173,325),(2300757,180173,326),(2300758,180173,327),(2300759,180173,329),(2300760,180173,330),(2300761,180173,331),(2300762,180173,332),(2300763,180173,333),(2300764,180173,334),(2300765,180173,335),(2300766,180173,337),(2300767,180171,149),(2300768,180171,152),(2300769,180171,153),(2300770,180169,2),(2300771,180169,15),(2300772,180169,65),(2300773,180169,66),(2300774,180169,69),(2300775,180169,70),(2300776,180169,109),(2300777,180169,110),(2300778,180169,193),(2300779,180169,194),(2300780,180169,195),(2300781,180169,211),(2300782,180169,400),(2300783,180169,401),(2300784,180169,402),(2300785,180169,403),(2300786,180169,404),(2300787,180169,405),(2300788,180169,420),(2300789,180169,421),(2300790,180169,422),(2300791,180169,423),(2300792,180169,424),(2300793,180169,425),(2300794,180169,426),(2300795,180169,427),(2300796,180169,428),(2300797,180169,440),(2300798,180169,441),(2300799,180169,442),(2300800,180169,443),(2300801,180169,444),(2300802,180170,400),(2300803,180170,401),(2300804,180170,402),(2300805,180170,403),(2300806,180170,404),(2300807,180170,405),(2300808,180170,420),(2300809,180170,421),(2300810,180170,422),(2300811,180170,423),(2300812,180170,424),(2300813,180170,425),(2300814,180170,426),(2300815,180170,427),(2300816,180170,428),(2300817,180170,440),(2300818,180170,441),(2300819,180170,442),(2300820,180170,443),(2300821,180170,444);
/*!40000 ALTER TABLE `wk_admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_system_log`
--

DROP TABLE IF EXISTS `wk_admin_system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_user_id` int(11) NOT NULL COMMENT '操作人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `ip_address` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `types` int(11) DEFAULT NULL COMMENT '模块 1企业首页 2应用管理 3员工和部门管理 4名片小程序管理 5角色权限管理 6审批流（合同/回款） 7审批流（办公） 8项目管理 9客户管理 10系统日志管理 11其他设置',
  `behavior` int(11) DEFAULT NULL COMMENT '行为',
  `object` varchar(255) DEFAULT NULL COMMENT '操作对象',
  `detail` varchar(255) DEFAULT NULL COMMENT '操作详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_system_log`
--

LOCK TABLES `wk_admin_system_log` WRITE;
/*!40000 ALTER TABLE `wk_admin_system_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_admin_system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_user`
--

DROP TABLE IF EXISTS `wk_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `salt` varchar(32) DEFAULT NULL COMMENT '安全符',
  `img` varchar(200) DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `num` varchar(100) DEFAULT NULL COMMENT '员工编号',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` int(11) DEFAULT NULL COMMENT '0 未选择 1 男 2 女 ',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门id',
  `post` varchar(50) DEFAULT NULL COMMENT '岗位',
  `status` int(11) DEFAULT '2' COMMENT '状态,0禁用,1正常,2未激活',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '直属上级ID',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(30) DEFAULT NULL COMMENT '最后登录IP 注意兼容IPV6',
  `old_user_id` bigint(20) DEFAULT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 0 未删除 1 已删除',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `dept_id` (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14782 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_user`
--

LOCK TABLES `wk_admin_user` WRITE;
/*!40000 ALTER TABLE `wk_admin_user` DISABLE KEYS */;
INSERT INTO `wk_admin_user` VALUES (14773,'14767815683','3c396ae01404a03260cfe16cccf3421a','f7681a13f02f4bbdb2f3457b4302a35f','/adminFile/down/1836948531521392640','2024-09-16 21:15:42','刘董事长',NULL,'14767815683',NULL,NULL,14852,'董事长',1,0,'2025-02-21 19:44:04','100.75.176.55',NULL,0),(14774,'15858693254','7bbb84eef7ec81591efe9c6b7e1a8f12','f5bb1cf204244e6cbac4fcd5dd365ab7',NULL,'2024-09-19 08:59:51','张三','577782180899986','15858693254',NULL,1,14853,'销售部经理',1,14773,'2024-10-09 20:47:53','100.75.176.55',NULL,0),(14775,'14569856235','80ee63a46dae0731ef275d95bb61670a','66f80d2e785d4be1b1e8fcbd35cd78a0',NULL,'2024-09-19 09:02:42','李四','573129037972752','14569856235',NULL,1,14855,'制造部经理',1,14773,NULL,NULL,NULL,0),(14776,'14869535642','da406a367188b022bfc8b2ca2454e7b0','491709730b4f45e08d8c1122d7bef223',NULL,'2024-09-19 09:03:38','王五','703057964286519','14869535642',NULL,1,14857,NULL,1,0,'2024-10-09 18:39:00','100.75.176.55',NULL,0),(14777,'15698741563','6dcd15c4f3b256e04173b22075e62abd','5011b1c1e11849819f5a941a7412a005',NULL,'2024-09-19 09:04:50','李明','522262093393959','15698741563',NULL,1,14857,NULL,1,0,'2024-10-14 08:39:15','100.75.176.55',NULL,0),(14778,'14568953687','A123456','ab7143e3105348f3bb0cc622ccc9273f','/adminFile/down/1837341007600029696','2024-09-20 22:06:46','王明','789325844249355','14568953687',NULL,1,14852,NULL,1,14773,'2024-09-21 11:58:46','127.0.0.1',NULL,0),(14779,'456856852368','e461e63f2b05167137bb32c580f17f27','531e05b341f34a968e592440d2d7d972',NULL,'2024-10-12 16:54:18','李世民','832869189208933','456856852368',NULL,1,14852,'人事部长/HR',1,14773,'2024-10-13 15:48:41','100.75.176.55',NULL,0),(14780,'145685236854','30b1af883235d92f7fe8e154b28c0336','0d4634f23a36418db7874e3a8aab9b6b',NULL,'2024-10-12 16:54:19','王牧风','629631384453692','145685236854',NULL,1,14852,'销售部部长/销售',1,14773,'2024-10-14 09:23:55','100.75.176.55',NULL,0),(14781,'14568563586','a1ecf1457dfbea0186df6b00d9c62791','4d9334427fde4c398cda27acd3e2c744',NULL,'2024-10-14 09:25:43','张学铭','298689583884182','14568563586',NULL,1,14855,'运维部部长/运维工程师',2,14773,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `wk_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_user_config`
--

DROP TABLE IF EXISTS `wk_admin_user_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_user_config` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态，0:不启用 1 ： 启用',
  `name` varchar(255) NOT NULL COMMENT '设置名称',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`setting_id`) USING BTREE,
  KEY `name` (`name`,`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114607 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_user_config`
--

LOCK TABLES `wk_admin_user_config` WRITE;
/*!40000 ALTER TABLE `wk_admin_user_config` DISABLE KEYS */;
INSERT INTO `wk_admin_user_config` VALUES (114563,14773,1,'ActivityPhrase','电话无人接听','跟进记录常用语'),(114564,14773,1,'ActivityPhrase','客户无意向','跟进记录常用语'),(114565,14773,1,'ActivityPhrase','客户意向度适中，后续继续跟进','跟进记录常用语'),(114566,14773,1,'ActivityPhrase','客户意向度较强，成交几率较大','跟进记录常用语'),(114567,14773,1,'readNotice','','升级日志阅读状态'),(114568,14773,1,'readNotice','','升级日志阅读状态'),(114569,14774,1,'ActivityPhrase','电话无人接听','跟进记录常用语'),(114570,14774,1,'ActivityPhrase','客户无意向','跟进记录常用语'),(114571,14774,1,'ActivityPhrase','客户意向度适中，后续继续跟进','跟进记录常用语'),(114572,14774,1,'ActivityPhrase','客户意向度较强，成交几率较大','跟进记录常用语'),(114573,14774,1,'readNotice','','升级日志阅读状态'),(114574,14773,1,'InitUserConfig','{\"date\":\"2022-01-10\",\"companyId\":1198775893045153792,\"companyName\":\"SARD11\",\"mobile\":\"15288723344\",\"name\":\"admin\",\"id\":\"S9IZKIHN\"}','用户信息'),(114575,14774,1,'ActivityPhrase','电话无人接听','跟进记录常用语'),(114576,14774,1,'ActivityPhrase','客户无意向','跟进记录常用语'),(114577,14774,1,'ActivityPhrase','客户意向度适中，后续继续跟进','跟进记录常用语'),(114578,14774,1,'ActivityPhrase','客户意向度较强，成交几率较大','跟进记录常用语'),(114579,14775,1,'ActivityPhrase','电话无人接听','跟进记录常用语'),(114580,14775,1,'ActivityPhrase','客户无意向','跟进记录常用语'),(114581,14775,1,'ActivityPhrase','客户意向度适中，后续继续跟进','跟进记录常用语'),(114582,14775,1,'ActivityPhrase','客户意向度较强，成交几率较大','跟进记录常用语'),(114583,14776,1,'ActivityPhrase','电话无人接听','跟进记录常用语'),(114584,14776,1,'ActivityPhrase','客户无意向','跟进记录常用语'),(114585,14776,1,'ActivityPhrase','客户意向度适中，后续继续跟进','跟进记录常用语'),(114586,14776,1,'ActivityPhrase','客户意向度较强，成交几率较大','跟进记录常用语'),(114587,14777,1,'ActivityPhrase','电话无人接听','跟进记录常用语'),(114588,14777,1,'ActivityPhrase','客户无意向','跟进记录常用语'),(114589,14777,1,'ActivityPhrase','客户意向度适中，后续继续跟进','跟进记录常用语'),(114590,14777,1,'ActivityPhrase','客户意向度较强，成交几率较大','跟进记录常用语'),(114591,14778,1,'ActivityPhrase','电话无人接听','跟进记录常用语'),(114592,14778,1,'ActivityPhrase','客户无意向','跟进记录常用语'),(114593,14778,1,'ActivityPhrase','客户意向度适中，后续继续跟进','跟进记录常用语'),(114594,14778,1,'ActivityPhrase','客户意向度较强，成交几率较大','跟进记录常用语'),(114595,14779,1,'ActivityPhrase','电话无人接听','跟进记录常用语'),(114596,14779,1,'ActivityPhrase','客户无意向','跟进记录常用语'),(114597,14779,1,'ActivityPhrase','客户意向度适中，后续继续跟进','跟进记录常用语'),(114598,14779,1,'ActivityPhrase','客户意向度较强，成交几率较大','跟进记录常用语'),(114599,14780,1,'ActivityPhrase','电话无人接听','跟进记录常用语'),(114600,14780,1,'ActivityPhrase','客户无意向','跟进记录常用语'),(114601,14780,1,'ActivityPhrase','客户意向度适中，后续继续跟进','跟进记录常用语'),(114602,14780,1,'ActivityPhrase','客户意向度较强，成交几率较大','跟进记录常用语'),(114603,14781,1,'ActivityPhrase','电话无人接听','跟进记录常用语'),(114604,14781,1,'ActivityPhrase','客户无意向','跟进记录常用语'),(114605,14781,1,'ActivityPhrase','客户意向度适中，后续继续跟进','跟进记录常用语'),(114606,14781,1,'ActivityPhrase','客户意向度较强，成交几率较大','跟进记录常用语');
/*!40000 ALTER TABLE `wk_admin_user_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_user_his_table`
--

DROP TABLE IF EXISTS `wk_admin_user_his_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_user_his_table` (
  `his_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `his_table` int(11) DEFAULT NULL COMMENT '0 没有 1 有',
  `type` int(11) DEFAULT '1' COMMENT '1.坐席授权 2.设置默认名片 3.关联员工',
  PRIMARY KEY (`his_table_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='授权坐席';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_user_his_table`
--

LOCK TABLES `wk_admin_user_his_table` WRITE;
/*!40000 ALTER TABLE `wk_admin_user_his_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_admin_user_his_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_user_role`
--

DROP TABLE IF EXISTS `wk_admin_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19242 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色对应关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_user_role`
--

LOCK TABLES `wk_admin_user_role` WRITE;
/*!40000 ALTER TABLE `wk_admin_user_role` DISABLE KEYS */;
INSERT INTO `wk_admin_user_role` VALUES (19224,14776,180171),(19227,14778,180171),(19228,14773,180162),(19230,14775,180163),(19231,14775,180164),(19232,14774,180165),(19233,14779,180164),(19238,14780,180170),(19239,14777,180166),(19240,14777,180175),(19241,14781,180167);
/*!40000 ALTER TABLE `wk_admin_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_call_record`
--

DROP TABLE IF EXISTS `wk_call_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_call_record` (
  `call_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 记录id',
  `number` varchar(20) NOT NULL COMMENT '电话号码',
  `start_time` datetime DEFAULT NULL COMMENT '开始振铃时间',
  `answer_time` datetime DEFAULT NULL COMMENT '接通时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `talk_time` int(11) DEFAULT '0' COMMENT '通话时长（秒）',
  `dial_time` int(11) DEFAULT '0' COMMENT '摘机时长',
  `state` int(11) DEFAULT NULL COMMENT '通话状态 (0未振铃，1未接通，2接通，3呼入未接通)',
  `type` int(11) DEFAULT NULL COMMENT '通话类型 (0呼出，1呼入)',
  `model` varchar(15) DEFAULT NULL COMMENT '关联模块 leads，customer，contacts',
  `model_id` int(11) DEFAULT NULL COMMENT '关联模块ID',
  `file_path` varchar(500) DEFAULT NULL COMMENT '录音文件路径',
  `size` int(11) DEFAULT '0' COMMENT '录音文件大小',
  `file_name` varchar(500) DEFAULT NULL COMMENT '文件名称',
  `call_upload` tinyint(1) DEFAULT '0' COMMENT '0：CRM服务器; 1：上传至阿里云',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `owner_user_id` bigint(20) DEFAULT NULL COMMENT '负责人ID',
  `batch_id` varchar(32) DEFAULT NULL COMMENT '批次',
  PRIMARY KEY (`call_record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='通话记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_call_record`
--

LOCK TABLES `wk_call_record` WRITE;
/*!40000 ALTER TABLE `wk_call_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_call_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_card_weixin_browse`
--

DROP TABLE IF EXISTS `wk_card_weixin_browse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_card_weixin_browse` (
  `browse_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '名片表',
  `weixin_leads_id` bigint(20) DEFAULT NULL COMMENT '微信线索表',
  `create_time` datetime DEFAULT NULL,
  `num` int(11) DEFAULT '0' COMMENT '浏览次数',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`browse_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='微信浏览名片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_card_weixin_browse`
--

LOCK TABLES `wk_card_weixin_browse` WRITE;
/*!40000 ALTER TABLE `wk_card_weixin_browse` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_card_weixin_browse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_card_weixin_leads`
--

DROP TABLE IF EXISTS `wk_card_weixin_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_card_weixin_leads` (
  `weixin_leads_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_transform` int(11) DEFAULT '0' COMMENT '1已转化 0 未转化',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `owner_user_id` bigint(20) DEFAULT NULL COMMENT '所有者用户ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `weixin_img` varchar(255) DEFAULT NULL COMMENT '微信头像',
  `weixin_name` varchar(60) DEFAULT NULL COMMENT '微信名称',
  `weixin_number` varchar(60) DEFAULT NULL COMMENT '微信号',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `openid` varchar(64) DEFAULT NULL COMMENT '微信唯一标识',
  `sex` varchar(6) DEFAULT NULL COMMENT '性别',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  PRIMARY KEY (`weixin_leads_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='微信线索';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_card_weixin_leads`
--

LOCK TABLES `wk_card_weixin_leads` WRITE;
/*!40000 ALTER TABLE `wk_card_weixin_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_card_weixin_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_card_weixin_leads_user`
--

DROP TABLE IF EXISTS `wk_card_weixin_leads_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_card_weixin_leads_user` (
  `weixin_user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '被关注的员工id',
  `weixin_leads_id` bigint(20) DEFAULT NULL COMMENT '微信线索id',
  `create_time` datetime DEFAULT NULL,
  `relevance_user_id` bigint(20) DEFAULT NULL COMMENT '员工id',
  PRIMARY KEY (`weixin_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='名片夹';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_card_weixin_leads_user`
--

LOCK TABLES `wk_card_weixin_leads_user` WRITE;
/*!40000 ALTER TABLE `wk_card_weixin_leads_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_card_weixin_leads_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_achievement`
--

DROP TABLE IF EXISTS `wk_crm_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_achievement` (
  `achievement_id` int(11) NOT NULL AUTO_INCREMENT,
  `obj_id` int(11) DEFAULT NULL COMMENT '对象ID',
  `type` int(11) DEFAULT '0' COMMENT '1公司2部门3员工',
  `year` varchar(20) DEFAULT NULL COMMENT '年',
  `january` decimal(18,2) DEFAULT '0.00' COMMENT '一月',
  `february` decimal(18,2) DEFAULT '0.00' COMMENT '二月',
  `march` decimal(18,2) DEFAULT '0.00' COMMENT '三月',
  `april` decimal(18,2) DEFAULT '0.00' COMMENT '四月',
  `may` decimal(18,2) DEFAULT '0.00' COMMENT '五月',
  `june` decimal(18,2) DEFAULT '0.00' COMMENT '六月',
  `july` decimal(18,2) DEFAULT '0.00' COMMENT '七月',
  `august` decimal(18,2) DEFAULT '0.00' COMMENT '八月',
  `september` decimal(18,2) DEFAULT '0.00' COMMENT '九月',
  `october` decimal(18,2) DEFAULT '0.00' COMMENT '十月',
  `november` decimal(18,2) DEFAULT '0.00' COMMENT '十一月',
  `december` decimal(18,2) DEFAULT '0.00' COMMENT '十二月',
  `status` int(11) DEFAULT NULL COMMENT '1销售（目标）2回款（目标）',
  `yeartarget` decimal(18,2) DEFAULT '0.00' COMMENT '年目标',
  PRIMARY KEY (`achievement_id`) USING BTREE,
  KEY `obj_id` (`obj_id`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='业绩目标';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_achievement`
--

LOCK TABLES `wk_crm_achievement` WRITE;
/*!40000 ALTER TABLE `wk_crm_achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_action_record`
--

DROP TABLE IF EXISTS `wk_crm_action_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_action_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_user_id` bigint(20) NOT NULL COMMENT '操作人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'ip地址',
  `types` int(11) NOT NULL COMMENT '模块类型',
  `action_id` int(11) DEFAULT NULL COMMENT '被操作对象ID',
  `object` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '对象',
  `behavior` int(11) DEFAULT NULL COMMENT '行为',
  `content` longtext CHARACTER SET utf8mb4 COMMENT '内容',
  `detail` longtext CHARACTER SET utf8mb4 COMMENT '详情',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `types` (`types`,`action_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字段操作记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_action_record`
--

LOCK TABLES `wk_crm_action_record` WRITE;
/*!40000 ALTER TABLE `wk_crm_action_record` DISABLE KEYS */;
INSERT INTO `wk_crm_action_record` VALUES (1,14773,'2024-09-18 20:33:02','100.75.29.25',2,1,'刘嘉明',1,'[\"新建了客户\"]','新建了客户：刘嘉明'),(2,14773,'2024-09-18 20:33:34','100.75.29.25',3,2,'刘嘉明',1,'[\"新建了联系人\"]','新建了联系人：刘嘉明'),(3,14773,'2024-09-18 20:36:35','100.75.29.25',4,1,'微信小程序',1,'[\"新建了产品\"]','新建了产品：微信小程序'),(4,14773,'2024-09-18 21:23:38','100.75.29.25',4,2,'web开发',1,'[\"新建了产品\"]','新建了产品：web开发'),(5,14773,'2024-09-18 21:25:41','100.75.29.25',2,2,'王书记',1,'[\"新建了客户\"]','新建了客户：王书记'),(6,14773,'2024-09-18 21:26:17','100.75.29.25',3,3,'王明源',1,'[\"新建了联系人\"]','新建了联系人：王明源'),(7,14773,'2024-09-18 21:32:02','100.75.29.25',5,1,'大学生毕业设计',1,'[\"新建了商机\"]','新建了商机：大学生毕业设计'),(8,14773,'2024-09-18 21:34:33','100.75.29.25',6,1,'佛山大学计算机专业毕业设计',1,'[\"新建了合同\"]','新建了合同：佛山大学计算机专业毕业设计'),(9,14773,'2024-09-19 15:11:39','100.75.29.25',18,1,'0001',1,'[\"新建了发票\"]','新建了发票：0001'),(10,14773,'2024-09-19 15:13:39','100.75.29.25',17,1,'0001',1,'[\"新建了客户回访\"]','新建了客户回访：0001'),(11,14773,'2024-09-19 15:14:27','100.75.29.25',7,1,'0001',1,'[\"新建了回款\"]','新建了回款：0001'),(12,14773,'2024-09-19 21:42:38','100.75.29.25',2,1,'刘嘉明',8,'[\"将客户放入公海\"]','将客户：刘嘉明放入公海'),(13,14773,'2024-09-20 21:06:52','100.75.29.25',2,3,'徐铭璟',1,'[\"新建了客户\"]','新建了客户：徐铭璟'),(14,14773,'2024-09-20 21:35:00','100.75.29.25',2,3,'徐铭璟',8,'[\"将客户放入公海\"]','将客户：徐铭璟放入公海'),(15,14773,'2024-09-20 21:35:53','100.75.29.25',2,3,'徐铭璟',9,'[\"领取了客户\"]','领取了客户：徐铭璟'),(16,14773,'2024-10-21 08:33:53','100.75.29.25',5,2,'001',1,'[\"新建了商机\"]','新建了商机：001'),(17,14773,'2024-10-21 11:00:59','100.75.29.25',5,3,'002',1,'[\"新建了商机\"]','新建了商机：002'),(18,14773,'2024-10-21 11:14:34','100.75.29.25',5,4,'004',1,'[\"新建了商机\"]','新建了商机：004');
/*!40000 ALTER TABLE `wk_crm_action_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_activity`
--

DROP TABLE IF EXISTS `wk_crm_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `type` int(11) DEFAULT NULL COMMENT '活动类型 1 跟进记录 2 创建记录 3 商机阶段变更 4 外勤签到',
  `category` varchar(255) DEFAULT NULL COMMENT '跟进类型',
  `activity_type` int(11) NOT NULL COMMENT '活动类型 1 线索 2 客户 3 联系人 4 产品 5 商机 6 合同 7回款 8日志 9审批 10日程 11任务 12 发邮件',
  `activity_type_id` int(11) NOT NULL COMMENT '活动类型Id',
  `content` varchar(1024) DEFAULT NULL COMMENT '活动内容',
  `business_ids` varchar(255) DEFAULT NULL COMMENT '关联商机',
  `contacts_ids` varchar(255) DEFAULT NULL COMMENT '关联联系人',
  `next_time` datetime DEFAULT NULL COMMENT '下次联系时间',
  `status` int(11) DEFAULT '1' COMMENT '0 删除 1 未删除',
  `lng` varchar(255) DEFAULT NULL COMMENT '经度',
  `lat` varchar(255) DEFAULT NULL COMMENT '纬度',
  `address` varchar(255) DEFAULT NULL COMMENT '签到地址',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `batch_id` varchar(32) DEFAULT NULL COMMENT '批次id',
  PRIMARY KEY (`activity_id`) USING BTREE,
  KEY `wk_crm_activity_type_activity_type_index` (`type`,`activity_type`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='crm活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_activity`
--

LOCK TABLES `wk_crm_activity` WRITE;
/*!40000 ALTER TABLE `wk_crm_activity` DISABLE KEYS */;
INSERT INTO `wk_crm_activity` VALUES (1,2,NULL,2,1,'创建了客户: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-09-18 20:33:02',NULL),(2,2,NULL,3,2,'创建了联系人: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-09-18 20:33:34',NULL),(3,2,NULL,2,2,'创建了客户: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-09-18 21:25:41',NULL),(4,2,NULL,3,3,'创建了联系人: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-09-18 21:26:16',NULL),(5,2,NULL,5,1,'创建了商机: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-09-18 21:32:02',NULL),(6,2,NULL,6,1,'创建了合同: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-09-18 21:34:32',NULL),(7,2,NULL,7,1,'创建了回款: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-09-19 15:14:27',NULL),(8,2,NULL,9,1,'创建了审批: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-09-20 10:18:58',NULL),(9,2,NULL,9,2,'创建了审批: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-09-20 10:25:42',NULL),(10,2,NULL,9,3,'创建了审批: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-09-20 10:35:23',NULL),(11,2,NULL,9,3,'创建了审批: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-09-20 10:46:10',NULL),(12,2,NULL,2,3,'创建了客户: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-09-20 21:06:51',NULL),(13,2,NULL,11,4,'创建了任务: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-09-30 11:03:11',NULL),(14,2,NULL,11,7,'创建了任务: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-10-08 15:58:03',NULL),(15,2,NULL,9,4,'创建了审批: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-10-10 09:48:48',NULL),(16,2,NULL,9,5,'创建了审批: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-10-10 09:53:30',NULL),(17,2,NULL,5,2,'创建了商机: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-10-21 08:33:53',NULL),(18,2,NULL,5,3,'创建了商机: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-10-21 11:00:59',NULL),(19,2,NULL,5,4,'创建了商机: ',NULL,NULL,NULL,1,NULL,NULL,NULL,14773,'2024-10-21 11:14:34',NULL);
/*!40000 ALTER TABLE `wk_crm_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_activity_relation`
--

DROP TABLE IF EXISTS `wk_crm_activity_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_activity_relation` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL COMMENT '活动id',
  `type` int(11) NOT NULL COMMENT '3 联系人 5 商机',
  `type_id` int(11) NOT NULL COMMENT '类型id',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='活动关联商机联系人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_activity_relation`
--

LOCK TABLES `wk_crm_activity_relation` WRITE;
/*!40000 ALTER TABLE `wk_crm_activity_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_activity_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_area`
--

DROP TABLE IF EXISTS `wk_crm_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_area` (
  `code_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT '父级id',
  `city_name` varchar(255) DEFAULT NULL COMMENT '城市名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='地名表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_area`
--

LOCK TABLES `wk_crm_area` WRITE;
/*!40000 ALTER TABLE `wk_crm_area` DISABLE KEYS */;
INSERT INTO `wk_crm_area` VALUES (513222,513200,'理县'),(513233,513200,'红原县'),(513221,513200,'汶川县'),(513232,513200,'若尔盖县'),(513231,513200,'阿坝县'),(513230,513200,'壤塘县'),(513226,513200,'金川县'),(513225,513200,'九寨沟县'),(513224,513200,'松潘县'),(513201,513200,'马尔康市'),(513223,513200,'茂县'),(513228,513200,'黑水县'),(513227,513200,'小金县'),(712899,712800,'莒光乡'),(712896,712800,'南竿乡'),(712897,712800,'北竿乡'),(712898,712800,'东引乡'),(632822,632800,'都兰县'),(632821,632800,'乌兰县'),(632803,632800,'茫崖市'),(632802,632800,'德令哈市'),(632857,632800,'大柴旦行政委员会'),(632801,632800,'格尔木市'),(632823,632800,'天峻县'),(370982,370900,'新泰市'),(370921,370900,'宁阳县'),(370911,370900,'岱岳区'),(370923,370900,'东平县'),(370902,370900,'泰山区'),(370983,370900,'肥城市'),(421127,421100,'黄梅县'),(421126,421100,'蕲春县'),(421125,421100,'浠水县'),(421102,421100,'黄州区'),(421124,421100,'英山县'),(421181,421100,'麻城市'),(421171,421100,'龙感湖管理区'),(421182,421100,'武穴市'),(421123,421100,'罗田县'),(421122,421100,'红安县'),(421121,421100,'团风县'),(330282,330200,'慈溪市'),(330206,330200,'北仑区'),(330281,330200,'余姚市'),(330213,330200,'奉化区'),(330203,330200,'海曙区'),(330225,330200,'象山县'),(330226,330200,'宁海县'),(330205,330200,'江北区'),(330211,330200,'镇海区'),(330212,330200,'鄞州区'),(640381,640300,'青铜峡市'),(640302,640300,'利通区'),(640324,640300,'同心县'),(640323,640300,'盐池县'),(640303,640300,'红寺堡区'),(650500,650000,'哈密市'),(650400,650000,'吐鲁番市'),(650200,650000,'克拉玛依市'),(650100,650000,'乌鲁木齐市'),(652300,650000,'昌吉回族自治州'),(652700,650000,'博尔塔拉蒙古自治州'),(652800,650000,'巴音郭楞蒙古自治州'),(652900,650000,'阿克苏地区'),(654000,650000,'伊犁哈萨克自治州'),(653000,650000,'克孜勒苏柯尔克孜自治州'),(653100,650000,'喀什地区'),(654200,650000,'塔城地区'),(653200,650000,'和田地区'),(654300,650000,'阿勒泰地区'),(659000,650000,'自治区直辖县级行政区划'),(411328,411300,'唐河县'),(411327,411300,'社旗县'),(411329,411300,'新野县'),(411302,411300,'宛城区'),(411324,411300,'镇平县'),(411323,411300,'西峡县'),(411326,411300,'淅川县'),(411303,411300,'卧龙区'),(411325,411300,'内乡县'),(411330,411300,'桐柏县'),(411322,411300,'方城县'),(411321,411300,'南召县'),(411371,411300,'南阳高新技术产业开发区'),(411381,411300,'邓州市'),(411372,411300,'南阳市城乡一体化示范区'),(340700,340000,'铜陵市'),(340800,340000,'安庆市'),(341800,340000,'宣城市'),(340100,340000,'合肥市'),(341200,340000,'阜阳市'),(340200,340000,'芜湖市'),(341300,340000,'宿州市'),(341000,340000,'黄山市'),(341100,340000,'滁州市'),(340500,340000,'马鞍山市'),(341700,340000,'池州市'),(340600,340000,'淮北市'),(341600,340000,'亳州市'),(340300,340000,'蚌埠市'),(341500,340000,'六安市'),(340400,340000,'淮南市'),(810100,810000,'香港城区'),(711777,711700,'秀水乡'),(711799,711700,'二水乡'),(711778,711700,'鹿港镇'),(711779,711700,'福兴乡'),(711784,711700,'社头乡'),(711785,711700,'永靖乡'),(711786,711700,'埔心乡'),(711787,711700,'溪湖镇'),(711780,711700,'线西乡'),(711781,711700,'和美镇'),(711782,711700,'伸港乡'),(711783,711700,'员林镇'),(711788,711700,'大村乡'),(711789,711700,'埔盐乡'),(711790,711700,'田中镇'),(711795,711700,'竹塘乡'),(711774,711700,'彰化市'),(711796,711700,'二林镇'),(711775,711700,'芬园乡'),(711797,711700,'大城乡'),(711776,711700,'花坛乡'),(711798,711700,'芳苑乡'),(711791,711700,'北斗镇'),(711792,711700,'田尾乡'),(711793,711700,'埤头乡'),(711794,711700,'溪州乡'),(650107,650100,'达坂城区'),(650106,650100,'头屯河区'),(650105,650100,'水磨沟区'),(650104,650100,'新市区'),(650103,650100,'沙依巴克区'),(650102,650100,'天山区'),(650121,650100,'乌鲁木齐县'),(650172,650100,'乌鲁木齐高新技术产业开发区'),(650171,650100,'乌鲁木齐经济技术开发区'),(650109,650100,'米东区'),(445303,445300,'云安区'),(445302,445300,'云城区'),(445381,445300,'罗定市'),(445321,445300,'新兴县'),(445322,445300,'郁南县'),(500200,500000,'县'),(500100,500000,'市辖区'),(530921,530900,'凤庆县'),(530922,530900,'云县'),(530927,530900,'沧源佤族自治县'),(530925,530900,'双江拉祜族佤族布朗族傣族自治县'),(530926,530900,'耿马傣族佤族自治县'),(530923,530900,'永德县'),(530902,530900,'临翔区'),(530924,530900,'镇康县'),(150626,150600,'乌审旗'),(150627,150600,'伊金霍洛旗'),(150602,150600,'东胜区'),(150624,150600,'鄂托克旗'),(150603,150600,'康巴什区'),(150625,150600,'杭锦旗'),(150622,150600,'准格尔旗'),(150623,150600,'鄂托克前旗'),(150621,150600,'达拉特旗'),(152923,152900,'额济纳旗'),(152922,152900,'阿拉善右旗'),(152921,152900,'阿拉善左旗'),(152971,152900,'内蒙古阿拉善经济开发区'),(341271,341200,'阜阳合肥现代产业园区'),(341282,341200,'界首市'),(341272,341200,'阜阳经济技术开发区'),(341222,341200,'太和县'),(341221,341200,'临泉县'),(341204,341200,'颍泉区'),(341226,341200,'颍上县'),(341202,341200,'颍州区'),(341203,341200,'颍东区'),(341225,341200,'阜南县'),(620881,620800,'华亭市'),(620826,620800,'静宁县'),(620822,620800,'灵台县'),(620823,620800,'崇信县'),(620802,620800,'崆峒区'),(620825,620800,'庄浪县'),(620821,620800,'泾川县'),(140827,140800,'垣曲县'),(140828,140800,'夏县'),(140829,140800,'平陆县'),(140881,140800,'永济市'),(140882,140800,'河津市'),(140830,140800,'芮城县'),(140821,140800,'临猗县'),(140822,140800,'万荣县'),(140823,140800,'闻喜县'),(140802,140800,'盐湖区'),(140824,140800,'稷山县'),(140825,140800,'新绛县'),(140826,140800,'绛县'),(410106,410100,'上街区'),(410108,410100,'惠济区'),(410103,410100,'二七区'),(410102,410100,'中原区'),(410105,410100,'金水区'),(410104,410100,'管城回族区'),(410181,410100,'巩义市'),(410122,410100,'中牟县'),(410172,410100,'郑州高新技术产业开发区'),(410183,410100,'新密市'),(410171,410100,'郑州经济技术开发区'),(410182,410100,'荥阳市'),(410185,410100,'登封市'),(410173,410100,'郑州航空港经济综合实验区'),(410184,410100,'新郑市'),(710512,710500,'乌坵乡'),(710508,710500,'金湖镇'),(710507,710500,'金沙镇'),(710509,710500,'金宁乡'),(710511,710500,'烈屿乡'),(710510,710500,'金城镇'),(320481,320400,'溧阳市'),(320404,320400,'钟楼区'),(320412,320400,'武进区'),(320402,320400,'天宁区'),(320413,320400,'金坛区'),(320411,320400,'新北区'),(230709,230700,'金山屯区'),(230708,230700,'美溪区'),(230710,230700,'五营区'),(230781,230700,'铁力市'),(230707,230700,'新青区'),(230706,230700,'翠峦区'),(230705,230700,'西林区'),(230716,230700,'上甘岭区'),(230704,230700,'友好区'),(230715,230700,'红星区'),(230703,230700,'南岔区'),(230714,230700,'乌伊岭区'),(230702,230700,'伊春区'),(230713,230700,'带岭区'),(230712,230700,'汤旺河区'),(230711,230700,'乌马河区'),(230722,230700,'嘉荫县'),(110100,110000,'北京城区'),(370881,370800,'曲阜市'),(370871,370800,'济宁高新技术产业开发区'),(370883,370800,'邹城市'),(370826,370800,'微山县'),(370827,370800,'鱼台县'),(370828,370800,'金乡县'),(370829,370800,'嘉祥县'),(370811,370800,'任城区'),(370812,370800,'兖州区'),(370830,370800,'汶上县'),(370831,370800,'泗水县'),(370832,370800,'梁山县'),(632701,632700,'玉树市'),(632723,632700,'称多县'),(632722,632700,'杂多县'),(632726,632700,'曲麻莱县'),(632725,632700,'囊谦县'),(632724,632700,'治多县'),(421003,421000,'荆州区'),(421071,421000,'荆州经济技术开发区'),(421081,421000,'石首市'),(421083,421000,'洪湖市'),(421002,421000,'沙市区'),(421024,421000,'江陵县'),(421023,421000,'监利县'),(421022,421000,'公安县'),(421087,421000,'松滋市'),(330381,330300,'瑞安市'),(330371,330300,'温州经济技术开发区'),(330382,330300,'乐清市'),(330305,330300,'洞头区'),(330327,330300,'苍南县'),(330328,330300,'文成县'),(330329,330300,'泰顺县'),(330302,330300,'鹿城区'),(330324,330300,'永嘉县'),(330303,330300,'龙湾区'),(330304,330300,'瓯海区'),(330326,330300,'平阳县'),(340181,340100,'巢湖市'),(340173,340100,'合肥新站高新技术产业开发区'),(340171,340100,'合肥高新技术产业开发区'),(340172,340100,'合肥经济技术开发区'),(340111,340100,'包河区'),(340122,340100,'肥东县'),(340123,340100,'肥西县'),(340121,340100,'长丰县'),(340104,340100,'蜀山区'),(340102,340100,'瑶海区'),(340124,340100,'庐江县'),(340103,340100,'庐阳区'),(640221,640200,'平罗县'),(640202,640200,'大武口区'),(640205,640200,'惠农区'),(711590,711500,'苗栗市'),(711591,711500,'造桥乡'),(711592,711500,'头屋乡'),(711586,711500,'狮潭乡'),(711597,711500,'三义乡'),(711587,711500,'后龙镇'),(711598,711500,'西湖乡'),(711588,711500,'通霄镇'),(711599,711500,'卓兰镇'),(711589,711500,'苑里镇'),(711582,711500,'竹南镇'),(711593,711500,'公馆乡'),(711583,711500,'头份镇'),(711594,711500,'大湖乡'),(711584,711500,'三湾乡'),(711595,711500,'泰安乡'),(711585,711500,'南庄乡'),(711596,711500,'铜锣乡'),(411281,411200,'义马市'),(411203,411200,'陕州区'),(411202,411200,'湖滨区'),(411224,411200,'卢氏县'),(411221,411200,'渑池县'),(411271,411200,'河南三门峡经济开发区'),(411282,411200,'灵宝市'),(512022,512000,'乐至县'),(512021,512000,'安岳县'),(512002,512000,'雁江区'),(220822,220800,'通榆县'),(220802,220800,'洮北区'),(220881,220800,'洮南市'),(220871,220800,'吉林白城经济开发区'),(220882,220800,'大安市'),(220821,220800,'镇赉县'),(810110,810100,'荃湾区'),(810111,810100,'屯门区'),(810101,810100,'中西区'),(810112,810100,'元朗区'),(810102,810100,'湾仔区'),(810113,810100,'北区'),(810103,810100,'东区'),(810114,810100,'大埔区'),(810104,810100,'南区'),(810115,810100,'西贡区'),(810105,810100,'油尖旺区'),(810116,810100,'沙田区'),(810106,810100,'深水埗区'),(810117,810100,'葵青区'),(810107,810100,'九龙城区'),(810118,810100,'离岛区'),(810108,810100,'黄大仙区'),(810109,810100,'观塘区'),(640181,640100,'灵武市'),(640122,640100,'贺兰县'),(640121,640100,'永宁县'),(640104,640100,'兴庆区'),(640106,640100,'金凤区'),(640105,640100,'西夏区'),(652301,652300,'昌吉市'),(652323,652300,'呼图壁县'),(652302,652300,'阜康市'),(652324,652300,'玛纳斯县'),(652325,652300,'奇台县'),(652327,652300,'吉木萨尔县'),(652328,652300,'木垒哈萨克自治县'),(130972,130900,'沧州高新技术产业开发区'),(130983,130900,'黄骅市'),(130973,130900,'沧州渤海新区'),(130984,130900,'河间市'),(130981,130900,'泊头市'),(130971,130900,'河北沧州经济开发区'),(130982,130900,'任丘市'),(130921,130900,'沧县'),(130922,130900,'青县'),(130930,130900,'孟村回族自治县'),(130903,130900,'运河区'),(130925,130900,'盐山县'),(130926,130900,'肃宁县'),(130923,130900,'东光县'),(130902,130900,'新华区'),(130924,130900,'海兴县'),(130929,130900,'献县'),(130927,130900,'南皮县'),(130928,130900,'吴桥县'),(445203,445200,'揭东区'),(445281,445200,'普宁市'),(445222,445200,'揭西县'),(445202,445200,'榕城区'),(445224,445200,'惠来县'),(230622,230600,'肇源县'),(230621,230600,'肇州县'),(230671,230600,'大庆高新技术产业开发区'),(230606,230600,'大同区'),(230605,230600,'红岗区'),(230604,230600,'让胡路区'),(230603,230600,'龙凤区'),(230602,230600,'萨尔图区'),(230624,230600,'杜尔伯特蒙古族自治县'),(230623,230600,'林甸县'),(150525,150500,'奈曼旗'),(150526,150500,'扎鲁特旗'),(150523,150500,'开鲁县'),(150502,150500,'科尔沁区'),(150524,150500,'库伦旗'),(150521,150500,'科尔沁左翼中旗'),(150522,150500,'科尔沁左翼后旗'),(150581,150500,'霍林郭勒市'),(150571,150500,'通辽经济技术开发区'),(450903,450900,'福绵区'),(450902,450900,'玉州区'),(450924,450900,'兴业县'),(450921,450900,'容县'),(450923,450900,'博白县'),(450922,450900,'陆川县'),(450981,450900,'北流市'),(410800,410000,'焦作市'),(410700,410000,'新乡市'),(410900,410000,'濮阳市'),(410400,410000,'平顶山市'),(411500,410000,'信阳市'),(410300,410000,'洛阳市'),(411400,410000,'商丘市'),(410600,410000,'鹤壁市'),(411700,410000,'驻马店市'),(410500,410000,'安阳市'),(411600,410000,'周口市'),(411100,410000,'漯河市'),(411000,410000,'许昌市'),(410200,410000,'开封市'),(411300,410000,'南阳市'),(410100,410000,'郑州市'),(411200,410000,'三门峡市'),(419000,410000,'省直辖县级行政区划'),(341372,341300,'宿州经济技术开发区'),(341371,341300,'宿州马鞍山现代产业园区'),(341321,341300,'砀山县'),(341322,341300,'萧县'),(341323,341300,'灵璧县'),(341302,341300,'埇桥区'),(341324,341300,'泗县'),(620981,620900,'玉门市'),(620982,620900,'敦煌市'),(620921,620900,'金塔县'),(620922,620900,'瓜州县'),(620923,620900,'肃北蒙古族自治县'),(620902,620900,'肃州区'),(620924,620900,'阿克塞哈萨克族自治县'),(140728,140700,'平遥县'),(140729,140700,'灵石县'),(140781,140700,'介休市'),(140721,140700,'榆社县'),(140722,140700,'左权县'),(140723,140700,'和顺县'),(140702,140700,'榆次区'),(140724,140700,'昔阳县'),(140725,140700,'寿阳县'),(140726,140700,'太谷县'),(140727,140700,'祁县'),(320571,320500,'苏州工业园区'),(320582,320500,'张家港市'),(320583,320500,'昆山市'),(320508,320500,'姑苏区'),(320509,320500,'吴江区'),(320581,320500,'常熟市'),(320506,320500,'吴中区'),(320507,320500,'相城区'),(320505,320500,'虎丘区'),(320585,320500,'太仓市'),(712796,712700,'望安乡'),(712797,712700,'七美乡'),(712798,712700,'白沙乡'),(712799,712700,'湖西乡'),(712794,712700,'马公市'),(712795,712700,'西屿乡'),(710405,710400,'北区'),(710449,710400,'大甲区'),(710404,710400,'西区'),(710448,710400,'清水区'),(710403,710400,'南区'),(710447,710400,'梧栖区'),(710402,710400,'东区'),(710446,710400,'龙井区'),(710408,710400,'南屯区'),(710407,710400,'西屯区'),(710406,710400,'北屯区'),(710451,710400,'大安区'),(710450,710400,'外埔区'),(710434,710400,'乌日区'),(710433,710400,'雾峰区'),(710499,710400,'其它区'),(710432,710400,'大里区'),(710431,710400,'太平区'),(710438,710400,'东势区'),(710437,710400,'石冈区'),(710436,710400,'后里区'),(710435,710400,'丰原区'),(710439,710400,'和平区'),(710441,710400,'潭子区'),(710440,710400,'新社区'),(710401,710400,'中区'),(710445,710400,'沙鹿区'),(710444,710400,'大肚区'),(710443,710400,'神冈区'),(710442,710400,'大雅区'),(433127,433100,'永顺县'),(433125,433100,'保靖县'),(433126,433100,'古丈县'),(433130,433100,'龙山县'),(433172,433100,'湖南吉首经济开发区'),(433173,433100,'湖南永顺经济开发区'),(433101,433100,'吉首市'),(433123,433100,'凤凰县'),(433124,433100,'花垣县'),(433122,433100,'泸溪县'),(540522,540500,'贡嘎县'),(540523,540500,'桑日县'),(540502,540500,'乃东区'),(540524,540500,'琼结县'),(540525,540500,'曲松县'),(540530,540500,'错那县'),(540531,540500,'浪卡子县'),(540521,540500,'扎囊县'),(540526,540500,'措美县'),(540527,540500,'洛扎县'),(540528,540500,'加查县'),(540529,540500,'隆子县'),(710702,710700,'信义区'),(710701,710700,'仁爱区'),(710799,710700,'其它区'),(710706,710700,'暖暖区'),(710705,710700,'安乐区'),(710704,710700,'中山区'),(710703,710700,'中正区'),(710707,710700,'七堵区'),(410404,410400,'石龙区'),(410403,410400,'卫东区'),(410425,410400,'郏县'),(410411,410400,'湛河区'),(410422,410400,'叶县'),(410421,410400,'宝丰县'),(410402,410400,'新华区'),(410423,410400,'鲁山县'),(410472,410400,'平顶山市新城区'),(410471,410400,'平顶山高新技术产业开发区'),(410482,410400,'汝州市'),(410481,410400,'舞钢市'),(330481,330400,'海宁市'),(330482,330400,'平湖市'),(330483,330400,'桐乡市'),(330411,330400,'秀洲区'),(330402,330400,'南湖区'),(330424,330400,'海盐县'),(330421,330400,'嘉善县'),(632624,632600,'达日县'),(632623,632600,'甘德县'),(632622,632600,'班玛县'),(632621,632600,'玛沁县'),(632626,632600,'玛多县'),(632625,632600,'久治县'),(44000004,442000,'西区街道'),(44000103,442000,'东凤镇'),(44000114,442000,'三乡镇'),(44000005,442000,'南区街道'),(44000104,442000,'东升镇'),(44000115,442000,'板芙镇'),(44000006,442000,'五桂山街道'),(44000105,442000,'古镇镇'),(44000116,442000,'大涌镇'),(44000106,442000,'沙溪镇'),(44000117,442000,'神湾镇 '),(44000110,442000,'横栏镇'),(44000001,442000,'石岐区街道'),(44000100,442000,'小榄镇'),(44000111,442000,'南头镇'),(44000002,442000,'东区街道'),(44000101,442000,'黄圃镇'),(44000112,442000,'阜沙镇'),(44000003,442000,'火炬开发区街道'),(44000102,442000,'民众镇'),(44000113,442000,'南朗镇'),(44000107,442000,'坦洲镇'),(44000108,442000,'港口镇'),(44000109,442000,'三角镇'),(370781,370700,'青州市'),(370782,370700,'诸城市'),(370772,370700,'潍坊滨海经济技术开发区'),(370783,370700,'寿光市'),(370784,370700,'安丘市'),(370702,370700,'潍城区'),(370724,370700,'临朐县'),(370703,370700,'寒亭区'),(370725,370700,'昌乐县'),(370704,370700,'坊子区'),(370785,370700,'高密市'),(370786,370700,'昌邑市'),(370705,370700,'奎文区'),(210903,210900,'新邱区'),(210902,210900,'海州区'),(210911,210900,'细河区'),(210922,210900,'彰武县'),(210905,210900,'清河门区'),(210904,210900,'太平区'),(210921,210900,'阜新蒙古族自治县'),(420203,420200,'西塞山区'),(420202,420200,'黄石港区'),(420222,420200,'阳新县'),(420205,420200,'铁山区'),(420204,420200,'下陆区'),(420281,420200,'大冶市'),(340207,340200,'鸠江区'),(340208,340200,'三山区'),(340272,340200,'安徽芜湖长江大桥经济开发区'),(340271,340200,'芜湖经济技术开发区'),(340221,340200,'芜湖县'),(340222,340200,'繁昌县'),(340203,340200,'弋江区'),(340225,340200,'无为县'),(340223,340200,'南陵县'),(340202,340200,'镜湖区'),(411526,411500,'潢川县'),(411503,411500,'平桥区'),(411525,411500,'固始县'),(411528,411500,'息县'),(411527,411500,'淮滨县'),(411522,411500,'光山县'),(411521,411500,'罗山县'),(411502,411500,'浉河区'),(411524,411500,'商城县'),(411523,411500,'新县'),(411571,411500,'信阳高新技术产业开发区'),(711986,711900,'中埔乡'),(711997,711900,'溪口乡'),(711987,711900,'大埔乡'),(711998,711900,'义竹乡'),(711988,711900,'水上乡'),(711999,711900,'布袋镇'),(711989,711900,'鹿草乡'),(711982,711900,'番路乡'),(711993,711900,'六脚乡'),(711983,711900,'梅山乡'),(711994,711900,'新港乡'),(711984,711900,'竹崎乡'),(711995,711900,'民雄乡'),(711985,711900,'阿里山乡'),(711996,711900,'大林镇'),(711990,711900,'太保市'),(711991,711900,'朴子市'),(711992,711900,'东石乡'),(640100,640000,'银川市'),(640300,640000,'吴忠市'),(640200,640000,'石嘴山市'),(640500,640000,'中卫市'),(640400,640000,'固原市'),(420111,420100,'洪山区'),(420104,420100,'硚口区'),(420115,420100,'江夏区'),(420103,420100,'江汉区'),(420114,420100,'蔡甸区'),(420102,420100,'江岸区'),(420113,420100,'汉南区'),(420112,420100,'东西湖区'),(420107,420100,'青山区'),(420106,420100,'武昌区'),(420117,420100,'新洲区'),(420105,420100,'汉阳区'),(420116,420100,'黄陂区'),(220702,220700,'宁江区'),(220723,220700,'乾安县'),(220771,220700,'吉林松原经济开发区'),(220781,220700,'扶余市'),(220722,220700,'长岭县'),(220721,220700,'前郭尔罗斯蒙古族自治县'),(230523,230500,'宝清县'),(230522,230500,'友谊县'),(230521,230500,'集贤县'),(230506,230500,'宝山区'),(230505,230500,'四方台区'),(230503,230500,'岭东区'),(230502,230500,'尖山区'),(230524,230500,'饶河县'),(150802,150800,'临河区'),(150824,150800,'乌拉特中旗'),(150825,150800,'乌拉特后旗'),(150822,150800,'磴口县'),(150823,150800,'乌拉特前旗'),(150821,150800,'五原县'),(150826,150800,'杭锦后旗'),(421303,421300,'曾都区'),(421381,421300,'广水市'),(421321,421300,'随县'),(530723,530700,'华坪县'),(530702,530700,'古城区'),(530724,530700,'宁蒗彝族自治县'),(530721,530700,'玉龙纳西族自治县'),(530722,530700,'永胜县'),(630222,630200,'民和回族土族自治县'),(630203,630200,'平安区'),(630225,630200,'循化撒拉族自治县'),(630223,630200,'互助土族自治县'),(630202,630200,'乐都区'),(630224,630200,'化隆回族自治县'),(360982,360900,'樟树市'),(360983,360900,'高安市'),(360981,360900,'丰城市'),(360926,360900,'铜鼓县'),(360902,360900,'袁州区'),(360924,360900,'宜丰县'),(360925,360900,'靖安县'),(360922,360900,'万载县'),(360923,360900,'上高县'),(360921,360900,'奉新县'),(320681,320600,'启东市'),(320671,320600,'南通经济技术开发区'),(320682,320600,'如皋市'),(320612,320600,'通州区'),(320623,320600,'如东县'),(320602,320600,'崇川区'),(320611,320600,'港闸区'),(320685,320600,'海安市'),(320684,320600,'海门市'),(431102,431100,'零陵区'),(431124,431100,'道县'),(431123,431100,'双牌县'),(431126,431100,'宁远县'),(431103,431100,'冷水滩区'),(431125,431100,'江永县'),(431128,431100,'新田县'),(431127,431100,'蓝山县'),(431129,431100,'江华瑶族自治县'),(431171,431100,'永州经济技术开发区'),(431173,431100,'永州市回龙圩管理区'),(431172,431100,'永州市金洞管理区'),(431122,431100,'东安县'),(431121,431100,'祁阳县'),(540621,540600,'嘉黎县'),(540622,540600,'比如县'),(540623,540600,'聂荣县'),(540602,540600,'色尼区'),(540624,540600,'安多县'),(540630,540600,'双湖县'),(540629,540600,'尼玛县'),(540625,540600,'申扎县'),(540626,540600,'索县'),(540627,540600,'班戈县'),(540628,540600,'巴青县'),(710614,710600,'南投市'),(710625,710600,'竹山镇'),(710624,710600,'信义乡'),(710623,710600,'鱼池乡'),(710622,710600,'水里乡'),(710618,710600,'埔里镇'),(710617,710600,'国姓乡'),(710616,710600,'草屯镇'),(710615,710600,'中寮乡'),(710626,710600,'鹿谷乡'),(710619,710600,'仁爱乡'),(710621,710600,'集集镇'),(710620,710600,'名间乡'),(410305,410300,'涧西区'),(410327,410300,'宜阳县'),(410304,410300,'瀍河回族区'),(410326,410300,'汝阳县'),(410329,410300,'伊川县'),(410306,410300,'吉利区'),(410328,410300,'洛宁县'),(410323,410300,'新安县'),(410311,410300,'洛龙区'),(410322,410300,'孟津县'),(410303,410300,'西工区'),(410325,410300,'嵩县'),(410302,410300,'老城区'),(410324,410300,'栾川县'),(410381,410300,'偃师市'),(410371,410300,'洛阳高新技术产业开发区'),(370000,100000,'山东省'),(620000,100000,'甘肃省'),(320000,100000,'江苏省'),(110000,100000,'北京市'),(530000,100000,'云南省'),(460000,100000,'海南省'),(330000,100000,'浙江省'),(310000,100000,'上海市'),(120000,100000,'天津市'),(610000,100000,'陕西省'),(650000,100000,'新疆维吾尔自治区'),(520000,100000,'贵州省'),(340000,100000,'安徽省'),(820000,100000,'澳门特别行政区'),(430000,100000,'湖南省'),(130000,100000,'河北省'),(810000,100000,'香港特别行政区'),(210000,100000,'辽宁省'),(510000,100000,'四川省'),(640000,100000,'宁夏回族自治区'),(220000,100000,'吉林省'),(350000,100000,'福建省'),(420000,100000,'湖北省'),(440000,100000,'广东省'),(500000,100000,'重庆市'),(140000,100000,'山西省'),(360000,100000,'江西省'),(230000,100000,'黑龙江省'),(630000,100000,'青海省'),(410000,100000,'河南省'),(710000,100000,'台湾省'),(150000,100000,'内蒙古自治区'),(540000,100000,'西藏自治区'),(450000,100000,'广西壮族自治区'),(330503,330500,'南浔区'),(330521,330500,'德清县'),(330522,330500,'长兴县'),(330523,330500,'安吉县'),(330502,330500,'吴兴区'),(632521,632500,'共和县'),(632525,632500,'贵南县'),(632524,632500,'兴海县'),(632523,632500,'贵德县'),(632522,632500,'同德县'),(421202,421200,'咸安区'),(421224,421200,'通山县'),(421223,421200,'崇阳县'),(421281,421200,'赤壁市'),(421222,421200,'通城县'),(421221,421200,'嘉鱼县'),(370671,370600,'烟台高新技术产业开发区'),(370682,370600,'莱阳市'),(370672,370600,'烟台经济技术开发区'),(370683,370600,'莱州市'),(370684,370600,'蓬莱市'),(370685,370600,'招远市'),(370681,370600,'龙口市'),(370602,370600,'芝罘区'),(370613,370600,'莱山区'),(370686,370600,'栖霞市'),(370687,370600,'海阳市'),(370611,370600,'福山区'),(370612,370600,'牟平区'),(370634,370600,'长岛县'),(654321,654300,'布尔津县'),(654322,654300,'富蕴县'),(654301,654300,'阿勒泰市'),(654323,654300,'福海县'),(654324,654300,'哈巴河县'),(654325,654300,'青河县'),(654326,654300,'吉木乃县'),(210804,210800,'鲅鱼圈区'),(210803,210800,'西市区'),(210802,210800,'站前区'),(210882,210800,'大石桥市'),(210881,210800,'盖州市'),(210811,210800,'老边区'),(419001,419000,'济源市'),(340304,340300,'禹会区'),(340371,340300,'蚌埠市高新技术开发区'),(340372,340300,'蚌埠市经济开发区'),(340321,340300,'怀远县'),(340302,340300,'龙子湖区'),(340303,340300,'蚌山区'),(340311,340300,'淮上区'),(340322,340300,'五河县'),(340323,340300,'固镇县'),(411426,411400,'夏邑县'),(411423,411400,'宁陵县'),(411422,411400,'睢县'),(411403,411400,'睢阳区'),(411425,411400,'虞城县'),(411402,411400,'梁园区'),(411424,411400,'柘城县'),(411421,411400,'民权县'),(411481,411400,'永城市'),(411472,411400,'河南商丘经济开发区'),(411471,411400,'豫东综合物流产业聚集区'),(429000,420000,'省直辖县级行政区划'),(420100,420000,'武汉市'),(421200,420000,'咸宁市'),(421100,420000,'黄冈市'),(421000,420000,'荆州市'),(420500,420000,'宜昌市'),(422800,420000,'恩施土家族苗族自治州'),(420300,420000,'十堰市'),(420200,420000,'黄石市'),(421300,420000,'随州市'),(420900,420000,'孝感市'),(420800,420000,'荆门市'),(420700,420000,'鄂州市'),(420600,420000,'襄阳市'),(220602,220600,'浑江区'),(220605,220600,'江源区'),(220681,220600,'临江市'),(220621,220600,'抚松县'),(220623,220600,'长白朝鲜族自治县'),(220622,220600,'靖宇县'),(530822,530800,'墨江哈尼族自治县'),(530823,530800,'景东彝族自治县'),(530821,530800,'宁洱哈尼族彝族自治县'),(530828,530800,'澜沧拉祜族自治县'),(530829,530800,'西盟佤族自治县'),(530826,530800,'江城哈尼族彝族自治县'),(530827,530800,'孟连傣族拉祜族佤族自治县'),(530802,530800,'思茅区'),(530824,530800,'景谷傣族彝族自治县'),(530825,530800,'镇沅彝族哈尼族拉祜族自治县'),(230402,230400,'向阳区'),(230422,230400,'绥滨县'),(230421,230400,'萝北县'),(230407,230400,'兴山区'),(230406,230400,'东山区'),(230405,230400,'兴安区'),(230404,230400,'南山区'),(230403,230400,'工农区'),(630122,630100,'湟中县'),(630123,630100,'湟源县'),(630121,630100,'大通回族土族自治县'),(630104,630100,'城西区'),(630105,630100,'城北区'),(630102,630100,'城东区'),(630103,630100,'城中区'),(150727,150700,'新巴尔虎右旗'),(150703,150700,'扎赉诺尔区'),(150725,150700,'陈巴尔虎旗'),(150726,150700,'新巴尔虎左旗'),(150723,150700,'鄂伦春自治旗'),(150702,150700,'海拉尔区'),(150724,150700,'鄂温克族自治旗'),(150721,150700,'阿荣旗'),(150722,150700,'莫力达瓦达斡尔族自治旗'),(150785,150700,'根河市'),(150783,150700,'扎兰屯市'),(150784,150700,'额尔古纳市'),(150781,150700,'满洲里市'),(150782,150700,'牙克石市'),(653221,653200,'和田县'),(653222,653200,'墨玉县'),(653201,653200,'和田市'),(653223,653200,'皮山县'),(653224,653200,'洛浦县'),(653225,653200,'策勒县'),(653226,653200,'于田县'),(653227,653200,'民丰县'),(320706,320700,'海州区'),(320707,320700,'赣榆区'),(320724,320700,'灌南县'),(320703,320700,'连云区'),(320722,320700,'东海县'),(320723,320700,'灌云县'),(320771,320700,'连云港经济技术开发区'),(320772,320700,'连云港高新技术产业开发区'),(410205,410200,'禹王台区'),(410202,410200,'龙亭区'),(410212,410200,'祥符区'),(410223,410200,'尉氏县'),(410204,410200,'鼓楼区'),(410203,410200,'顺河回族区'),(410225,410200,'兰考县'),(410222,410200,'通许县'),(410221,410200,'杞县'),(140926,140900,'静乐县'),(140927,140900,'神池县'),(140928,140900,'五寨县'),(140929,140900,'岢岚县'),(140981,140900,'原平市'),(140971,140900,'五台山风景名胜区'),(140930,140900,'河曲县'),(140931,140900,'保德县'),(140921,140900,'定襄县'),(140932,140900,'偏关县'),(140922,140900,'五台县'),(140923,140900,'代县'),(140902,140900,'忻府区'),(140924,140900,'繁峙县'),(140925,140900,'宁武县'),(360829,360800,'安福县'),(360827,360800,'遂川县'),(360828,360800,'万安县'),(360881,360800,'井冈山市'),(360803,360800,'青原区'),(360825,360800,'永丰县'),(360826,360800,'泰和县'),(360823,360800,'峡江县'),(360802,360800,'吉州区'),(360824,360800,'新干县'),(360821,360800,'吉安县'),(360822,360800,'吉水县'),(360830,360800,'永新县'),(232761,232700,'加格达奇区'),(232762,232700,'松岭区'),(232763,232700,'新林区'),(232764,232700,'呼中区'),(232721,232700,'呼玛县'),(232722,232700,'塔河县'),(232701,232700,'漠河市'),(341504,341500,'叶集区'),(341503,341500,'裕安区'),(341525,341500,'霍山县'),(341502,341500,'金安区'),(341524,341500,'金寨县'),(341523,341500,'舒城县'),(341522,341500,'霍邱县'),(431003,431000,'苏仙区'),(431025,431000,'临武县'),(431002,431000,'北湖区'),(431024,431000,'嘉禾县'),(431027,431000,'桂东县'),(431026,431000,'汝城县'),(431028,431000,'安仁县'),(431081,431000,'资兴市'),(431021,431000,'桂阳县'),(431023,431000,'永兴县'),(431022,431000,'宜章县'),(431322,431300,'新化县'),(431321,431300,'双峰县'),(431302,431300,'娄星区'),(431382,431300,'涟源市'),(431381,431300,'冷水江市'),(620321,620300,'永昌县'),(620302,620300,'金川区'),(511322,511300,'营山县'),(511323,511300,'蓬安县'),(511321,511300,'南部县'),(511304,511300,'嘉陵区'),(511302,511300,'顺庆区'),(511324,511300,'仪陇县'),(511303,511300,'高坪区'),(511325,511300,'西充县'),(511381,511300,'阆中市'),(410602,410600,'鹤山区'),(410603,410600,'山城区'),(410611,410600,'淇滨区'),(410622,410600,'淇县'),(410621,410600,'浚县'),(410671,410600,'鹤壁经济技术开发区'),(330681,330600,'诸暨市'),(330602,330600,'越城区'),(330624,330600,'新昌县'),(330603,330600,'柯桥区'),(330604,330600,'上虞区'),(330683,330600,'嵊州市'),(370572,370500,'东营港经济开发区'),(370571,370500,'东营经济技术开发区'),(370503,370500,'河口区'),(370505,370500,'垦利区'),(370522,370500,'利津县'),(370523,370500,'广饶县'),(370502,370500,'东营区'),(210727,210700,'义县'),(210726,210700,'黑山县'),(210703,210700,'凌河区'),(210702,210700,'古塔区'),(210781,210700,'凌海市'),(210782,210700,'北镇市'),(210711,210700,'太和区'),(340405,340400,'八公山区'),(340406,340400,'潘集区'),(340403,340400,'田家庵区'),(340404,340400,'谢家集区'),(340402,340400,'大通区'),(340421,340400,'凤台县'),(340422,340400,'寿县'),(711292,711200,'罗东镇'),(711293,711200,'三星乡'),(711294,711200,'大同乡'),(711295,711200,'五结乡'),(711290,711200,'壮围乡'),(711291,711200,'员山乡'),(711289,711200,'礁溪乡'),(711296,711200,'冬山乡'),(711297,711200,'苏澳镇'),(711287,711200,'宜兰市'),(711298,711200,'南澳乡'),(711288,711200,'头城镇'),(711299,711200,'钓鱼台'),(430211,430200,'天元区'),(430202,430200,'荷塘区'),(430224,430200,'茶陵县'),(430212,430200,'渌口区'),(430223,430200,'攸县'),(430204,430200,'石峰区'),(430203,430200,'芦淞区'),(430225,430200,'炎陵县'),(430271,430200,'云龙示范区'),(430281,430200,'醴陵市'),(350921,350900,'霞浦县'),(350922,350900,'古田县'),(350923,350900,'屏南县'),(350902,350900,'蕉城区'),(350924,350900,'寿宁县'),(350925,350900,'周宁县'),(350926,350900,'柘荣县'),(350981,350900,'福安市'),(350982,350900,'福鼎市'),(650502,650500,'伊州区'),(650522,650500,'伊吾县'),(650521,650500,'巴里坤哈萨克自治县'),(411702,411700,'驿城区'),(411724,411700,'正阳县'),(411723,411700,'平舆县'),(411726,411700,'泌阳县'),(411725,411700,'确山县'),(411722,411700,'上蔡县'),(411721,411700,'西平县'),(411771,411700,'河南驻马店经济开发区'),(411728,411700,'遂平县'),(411727,411700,'汝南县'),(411729,411700,'新蔡县'),(130671,130600,'保定高新技术产业开发区'),(130672,130600,'保定白沟新城'),(130631,130600,'望都县'),(130632,130600,'安新县'),(130630,130600,'涞源县'),(130635,130600,'蠡县'),(130636,130600,'顺平县'),(130633,130600,'易县'),(130634,130600,'曲阳县'),(130637,130600,'博野县'),(130638,130600,'雄县'),(130682,130600,'定州市'),(130683,130600,'安国市'),(130681,130600,'涿州市'),(130684,130600,'高碑店市'),(130602,130600,'竞秀区'),(130624,130600,'阜平县'),(130623,130600,'涞水县'),(130606,130600,'莲池区'),(130628,130600,'高阳县'),(130607,130600,'满城区'),(130629,130600,'容城县'),(130626,130600,'定兴县'),(130627,130600,'唐县'),(130608,130600,'清苑区'),(130609,130600,'徐水区'),(533103,533100,'芒市'),(533102,533100,'瑞丽市'),(533124,533100,'陇川县'),(533123,533100,'盈江县'),(533122,533100,'梁河县'),(220503,220500,'二道江区'),(220582,220500,'集安市'),(220581,220500,'梅河口市'),(220521,220500,'通化县'),(220502,220500,'东昌区'),(220524,220500,'柳河县'),(220523,220500,'辉南县'),(652825,652800,'且末县'),(652826,652800,'焉耆回族自治县'),(652827,652800,'和静县'),(652828,652800,'和硕县'),(652829,652800,'博湖县'),(652871,652800,'库尔勒经济技术开发区'),(652822,652800,'轮台县'),(652801,652800,'库尔勒市'),(652823,652800,'尉犁县'),(652824,652800,'若羌县'),(371772,371700,'菏泽高新技术开发区'),(371771,371700,'菏泽经济技术开发区'),(371728,371700,'东明县'),(371703,371700,'定陶区'),(371725,371700,'郓城县'),(371702,371700,'牡丹区'),(371724,371700,'巨野县'),(371726,371700,'鄄城县'),(371721,371700,'曹县'),(371723,371700,'成武县'),(371722,371700,'单县'),(440900,440000,'茂名市'),(440800,440000,'湛江市'),(441900,440000,'东莞市'),(440700,440000,'江门市'),(441800,440000,'清远市'),(440600,440000,'佛山市'),(441700,440000,'阳江市'),(440500,440000,'汕头市'),(441600,440000,'河源市'),(440400,440000,'珠海市'),(441500,440000,'汕尾市'),(440300,440000,'深圳市'),(441400,440000,'梅州市'),(445200,440000,'揭阳市'),(440200,440000,'韶关市'),(441300,440000,'惠州市'),(445100,440000,'潮州市'),(440100,440000,'广州市'),(441200,440000,'肇庆市'),(442000,440000,'中山市'),(445300,440000,'云浮市'),(610629,610600,'洛川县'),(610627,610600,'甘泉县'),(610628,610600,'富县'),(610603,610600,'安塞区'),(610625,610600,'志丹县'),(610626,610600,'吴起县'),(610623,610600,'子长县'),(610602,610600,'宝塔区'),(610621,610600,'延长县'),(610632,610600,'黄陵县'),(610622,610600,'延川县'),(610630,610600,'宜川县'),(610631,610600,'黄龙县'),(230303,230300,'恒山区'),(230302,230300,'鸡冠区'),(230321,230300,'鸡东县'),(230382,230300,'密山市'),(230381,230300,'虎林市'),(230307,230300,'麻山区'),(230306,230300,'城子河区'),(230305,230300,'梨树区'),(230304,230300,'滴道区'),(140471,140400,'山西长治高新技术产业园区'),(140430,140400,'沁县'),(140431,140400,'沁源县'),(140423,140400,'襄垣县'),(140403,140400,'潞州区'),(140425,140400,'平顺县'),(140404,140400,'上党区'),(140426,140400,'黎城县'),(140405,140400,'屯留区'),(140427,140400,'壶关县'),(140406,140400,'潞城区'),(140428,140400,'长子县'),(140429,140400,'武乡县'),(150206,150200,'白云鄂博矿区'),(150207,150200,'九原区'),(150204,150200,'青山区'),(150205,150200,'石拐区'),(150202,150200,'东河区'),(150203,150200,'昆都仑区'),(150222,150200,'固阳县'),(150223,150200,'达尔罕茂明安联合旗'),(150221,150200,'土默特右旗'),(150271,150200,'包头稀土高新技术产业开发区'),(152529,152500,'正镶白旗'),(152528,152500,'镶黄旗'),(152527,152500,'太仆寺旗'),(152526,152500,'西乌珠穆沁旗'),(152525,152500,'东乌珠穆沁旗'),(152502,152500,'锡林浩特市'),(152524,152500,'苏尼特右旗'),(152501,152500,'二连浩特市'),(152523,152500,'苏尼特左旗'),(152522,152500,'阿巴嘎旗'),(152531,152500,'多伦县'),(152530,152500,'正蓝旗'),(152571,152500,'乌拉盖管委会'),(710108,710100,'士林区'),(710107,710100,'信义区'),(710106,710100,'万华区'),(710105,710100,'大安区'),(710109,710100,'北投区'),(710111,710100,'南港区'),(710199,710100,'其它区'),(710110,710100,'内湖区'),(710104,710100,'松山区'),(710103,710100,'中山区'),(710102,710100,'大同区'),(710101,710100,'中正区'),(710112,710100,'文山区'),(712491,712400,'新园乡'),(712470,712400,'玛家乡'),(712492,712400,'枋寮乡'),(712471,712400,'九如乡'),(712493,712400,'枋山乡'),(712472,712400,'里港乡'),(712494,712400,'春日乡'),(712490,712400,'佳冬乡'),(712477,712400,'竹田乡'),(712499,712400,'满州乡'),(712478,712400,'内埔乡'),(712479,712400,'万丹乡'),(712473,712400,'高树乡'),(712495,712400,'狮子乡'),(712474,712400,'盐埔乡'),(712496,712400,'车城乡'),(712475,712400,'长治乡'),(712497,712400,'牡丹乡'),(712476,712400,'麟洛乡'),(712498,712400,'恒春镇'),(712480,712400,'潮州镇'),(712481,712400,'泰武乡'),(712482,712400,'来义乡'),(712483,712400,'万峦乡'),(712488,712400,'东港镇'),(712467,712400,'屏东市'),(712489,712400,'琉球乡'),(712468,712400,'三地门乡'),(712469,712400,'雾台乡'),(712484,712400,'莰顶乡'),(712485,712400,'新埤乡'),(712486,712400,'南州乡'),(712487,712400,'林边乡'),(320803,320800,'淮安区'),(320804,320800,'淮阴区'),(320826,320800,'涟水县'),(320812,320800,'清江浦区'),(320813,320800,'洪泽区'),(320830,320800,'盱眙县'),(320831,320800,'金湖县'),(320871,320800,'淮安经济技术开发区'),(360728,360700,'定南县'),(360729,360700,'全南县'),(360730,360700,'宁都县'),(360781,360700,'瑞金市'),(360704,360700,'赣县区'),(360726,360700,'安远县'),(360727,360700,'龙南县'),(360702,360700,'章贡区'),(360724,360700,'上犹县'),(360735,360700,'石城县'),(360703,360700,'南康区'),(360725,360700,'崇义县'),(360722,360700,'信丰县'),(360733,360700,'会昌县'),(360723,360700,'大余县'),(360734,360700,'寻乌县'),(360731,360700,'于都县'),(360732,360700,'兴国县'),(620421,620400,'靖远县'),(620422,620400,'会宁县'),(620423,620400,'景泰县'),(620402,620400,'白银区'),(620403,620400,'平川区'),(341602,341600,'谯城区'),(341623,341600,'利辛县'),(341622,341600,'蒙城县'),(341621,341600,'涡阳县'),(431223,431200,'辰溪县'),(431222,431200,'沅陵县'),(431225,431200,'会同县'),(431202,431200,'鹤城区'),(431224,431200,'溆浦县'),(431227,431200,'新晃侗族自治县'),(431226,431200,'麻阳苗族自治县'),(431229,431200,'靖州苗族侗族自治县'),(431228,431200,'芷江侗族自治县'),(431281,431200,'洪江市'),(431271,431200,'怀化市洪江管理区'),(431230,431200,'通道侗族自治县'),(431221,431200,'中方县'),(429021,429000,'神农架林区'),(429006,429000,'天门市'),(429005,429000,'潜江市'),(429004,429000,'仙桃市'),(410503,410500,'北关区'),(410502,410500,'文峰区'),(410505,410500,'殷都区'),(410527,410500,'内黄县'),(410526,410500,'滑县'),(410523,410500,'汤阴县'),(410522,410500,'安阳县'),(410571,410500,'安阳高新技术产业开发区'),(410506,410500,'龙安区'),(410581,410500,'林州市'),(330727,330700,'磐安县'),(330723,330700,'武义县'),(330702,330700,'婺城区'),(330703,330700,'金东区'),(330726,330700,'浦江县'),(330781,330700,'兰溪市'),(330782,330700,'义乌市'),(330783,330700,'东阳市'),(330784,330700,'永康市'),(370481,370400,'滕州市'),(370404,370400,'峄城区'),(370405,370400,'台儿庄区'),(370406,370400,'山亭区'),(370402,370400,'市中区'),(370403,370400,'薛城区'),(420302,420300,'茅箭区'),(420324,420300,'竹溪县'),(420323,420300,'竹山县'),(420322,420300,'郧西县'),(420304,420300,'郧阳区'),(420303,420300,'张湾区'),(420325,420300,'房县'),(420381,420300,'丹江口市'),(522301,522300,'兴义市'),(522323,522300,'普安县'),(522302,522300,'兴仁市'),(522324,522300,'晴隆县'),(522325,522300,'贞丰县'),(522326,522300,'望谟县'),(522327,522300,'册亨县'),(522328,522300,'安龙县'),(522300,520000,'黔西南布依族苗族自治州'),(520200,520000,'六盘水市'),(520300,520000,'遵义市'),(520100,520000,'贵阳市'),(520400,520000,'安顺市'),(522600,520000,'黔东南苗族侗族自治州'),(520500,520000,'毕节市'),(522700,520000,'黔南布依族苗族自治州'),(520600,520000,'铜仁市'),(340504,340500,'雨山区'),(340503,340500,'花山区'),(340506,340500,'博望区'),(340522,340500,'含山县'),(340523,340500,'和县'),(340521,340500,'当涂县'),(210604,210600,'振安区'),(210603,210600,'振兴区'),(210682,210600,'凤城市'),(210681,210600,'东港市'),(210602,210600,'元宝区'),(210624,210600,'宽甸满族自治县'),(430200,430000,'株洲市'),(431300,430000,'娄底市'),(430100,430000,'长沙市'),(431200,430000,'怀化市'),(430400,430000,'衡阳市'),(430300,430000,'湘潭市'),(430600,430000,'岳阳市'),(430500,430000,'邵阳市'),(430800,430000,'张家界市'),(430700,430000,'常德市'),(430900,430000,'益阳市'),(431100,430000,'永州市'),(431000,430000,'郴州市'),(433100,430000,'湘西土家族苗族自治州'),(711150,711100,'新庄区'),(711140,711100,'新店区'),(711151,711100,'泰山区'),(711130,711100,'万里区'),(711141,711100,'坪林区'),(711152,711100,'林口区'),(711146,711100,'三峡区'),(711157,711100,'三芝区'),(711136,711100,'瑞芳区'),(711147,711100,'树林区'),(711137,711100,'平溪区'),(711138,711100,'双溪区'),(711149,711100,'三重区'),(711142,711100,'乌来区'),(711132,711100,'板桥区'),(711143,711100,'永和区'),(711154,711100,'五股区'),(711133,711100,'汐止区'),(711144,711100,'中和区'),(711155,711100,'八里区'),(711134,711100,'深坑区'),(711145,711100,'土城区'),(711156,711100,'淡水区'),(430112,430100,'望城区'),(430111,430100,'雨花区'),(430103,430100,'天心区'),(430102,430100,'芙蓉区'),(430105,430100,'开福区'),(430104,430100,'岳麓区'),(430181,430100,'浏阳市'),(430182,430100,'宁乡市'),(430121,430100,'长沙县'),(350821,350800,'长汀县'),(350823,350800,'上杭县'),(350802,350800,'新罗区'),(350824,350800,'武平县'),(350803,350800,'永定区'),(350825,350800,'连城县'),(350881,350800,'漳平市'),(510184,510100,'崇州市'),(510183,510100,'邛崃市'),(510131,510100,'蒲江县'),(510185,510100,'简阳市'),(510121,510100,'金堂县'),(510132,510100,'新津县'),(510113,510100,'青白江区'),(510112,510100,'龙泉驿区'),(510182,510100,'彭州市'),(510181,510100,'都江堰市'),(510104,510100,'锦江区'),(510115,510100,'温江区'),(510114,510100,'新都区'),(510106,510100,'金牛区'),(510117,510100,'郫都区'),(510105,510100,'青羊区'),(510116,510100,'双流区'),(510108,510100,'成华区'),(510107,510100,'武侯区'),(510129,510100,'大邑县'),(650402,650400,'高昌区'),(650422,650400,'托克逊县'),(650421,650400,'鄯善县'),(130581,130500,'南宫市'),(130571,130500,'河北邢台经济开发区'),(130582,130500,'沙河市'),(130521,130500,'邢台县'),(130532,130500,'平乡县'),(130522,130500,'临城县'),(130533,130500,'威县'),(130530,130500,'新河县'),(130531,130500,'广宗县'),(130503,130500,'桥西区'),(130525,130500,'隆尧县'),(130526,130500,'任县'),(130523,130500,'内丘县'),(130534,130500,'清河县'),(130502,130500,'桥东区'),(130524,130500,'柏乡县'),(130535,130500,'临西县'),(130529,130500,'巨鹿县'),(130527,130500,'南和县'),(130528,130500,'宁晋县'),(411625,411600,'郸城县'),(411602,411600,'川汇区'),(411624,411600,'沈丘县'),(411627,411600,'太康县'),(411626,411600,'淮阳县'),(411621,411600,'扶沟县'),(411623,411600,'商水县'),(411622,411600,'西华县'),(411671,411600,'河南周口经济开发区'),(411628,411600,'鹿邑县'),(411681,411600,'项城市'),(371681,371600,'邹平市'),(371603,371600,'沾化区'),(371625,371600,'博兴县'),(371622,371600,'阳信县'),(371621,371600,'惠民县'),(371602,371600,'滨城区'),(371623,371600,'无棣县'),(610730,610700,'佛坪县'),(610728,610700,'镇巴县'),(610729,610700,'留坝县'),(610726,610700,'宁强县'),(610727,610700,'略阳县'),(610702,610700,'汉台区'),(610724,610700,'西乡县'),(610703,610700,'南郑区'),(610725,610700,'勉县'),(610722,610700,'城固县'),(610723,610700,'洋县'),(652722,652700,'精河县'),(652701,652700,'博乐市'),(652723,652700,'温泉县'),(652702,652700,'阿拉山口市'),(220421,220400,'东丰县'),(220422,220400,'东辽县'),(220403,220400,'西安区'),(220402,220400,'龙山区'),(230281,230200,'讷河市'),(230204,230200,'铁锋区'),(230203,230200,'建华区'),(230225,230200,'甘南县'),(230202,230200,'龙沙区'),(230224,230200,'泰来县'),(230223,230200,'依安县'),(230221,230200,'龙江县'),(230231,230200,'拜泉县'),(230230,230200,'克东县'),(230208,230200,'梅里斯达斡尔族区'),(230207,230200,'碾子山区'),(230229,230200,'克山县'),(230206,230200,'富拉尔基区'),(230205,230200,'昂昂溪区'),(230227,230200,'富裕县'),(140321,140300,'平定县'),(140311,140300,'郊区'),(140322,140300,'盂县'),(140302,140300,'城区'),(140303,140300,'矿区'),(320904,320900,'大丰区'),(320902,320900,'亭湖区'),(320924,320900,'射阳县'),(320903,320900,'盐都区'),(320925,320900,'建湖县'),(320922,320900,'滨海县'),(320923,320900,'阜宁县'),(320921,320900,'响水县'),(320971,320900,'盐城经济技术开发区'),(320981,320900,'东台市'),(710900,710000,'嘉义市'),(710800,710000,'新竹市'),(710700,710000,'基隆市'),(710600,710000,'南投县'),(711700,710000,'彰化县'),(712800,710000,'连江县'),(711900,710000,'嘉义县'),(710100,710000,'台北市'),(711300,710000,'新竹县'),(712400,710000,'屏东县'),(711400,710000,'桃园县'),(712500,710000,'台东县'),(711500,710000,'苗栗县'),(712600,710000,'花莲县'),(712700,710000,'澎湖县'),(710500,710000,'金门县'),(710400,710000,'台中市'),(712100,710000,'云林县'),(710300,710000,'台南市'),(711100,710000,'新北市'),(710200,710000,'高雄市'),(711200,710000,'宜兰县'),(150171,150100,'呼和浩特金海工业园区'),(150105,150100,'赛罕区'),(150103,150100,'回民区'),(150125,150100,'武川县'),(150104,150100,'玉泉区'),(150123,150100,'和林格尔县'),(150102,150100,'新城区'),(150124,150100,'清水河县'),(150121,150100,'土默特左旗'),(150122,150100,'托克托县'),(150172,150100,'呼和浩特经济技术开发区'),(341702,341700,'贵池区'),(341723,341700,'青阳县'),(341722,341700,'石台县'),(341721,341700,'东至县'),(620503,620500,'麦积区'),(620525,620500,'张家川回族自治县'),(620521,620500,'清水县'),(620522,620500,'秦安县'),(620523,620500,'甘谷县'),(620502,620500,'秦州区'),(620524,620500,'武山县'),(360681,360600,'贵溪市'),(360603,360600,'余江区'),(360602,360600,'月湖区'),(410811,410800,'山阳区'),(410822,410800,'博爱县'),(410821,410800,'修武县'),(410802,410800,'解放区'),(410823,410800,'武陟县'),(410883,410800,'孟州市'),(410871,410800,'焦作城乡一体化示范区'),(410882,410800,'沁阳市'),(410804,410800,'马村区'),(410803,410800,'中站区'),(410825,410800,'温县'),(370321,370300,'桓台县'),(370322,370300,'高青县'),(370305,370300,'临淄区'),(370306,370300,'周村区'),(370323,370300,'沂源县'),(370302,370300,'淄川区'),(370303,370300,'张店区'),(370304,370300,'博山区'),(330822,330800,'常山县'),(330802,330800,'柯城区'),(330824,330800,'开化县'),(330803,330800,'衢江区'),(330825,330800,'龙游县'),(330881,330800,'江山市'),(511132,511100,'峨边彝族自治县'),(511102,511100,'市中区'),(511113,511100,'金口河区'),(511124,511100,'井研县'),(511111,511100,'沙湾区'),(511133,511100,'马边彝族自治县'),(511112,511100,'五通桥区'),(511123,511100,'犍为县'),(511129,511100,'沐川县'),(511126,511100,'夹江县'),(511181,511100,'峨眉山市'),(513431,513400,'昭觉县'),(513430,513400,'金阳县'),(513424,513400,'德昌县'),(513435,513400,'甘洛县'),(513401,513400,'西昌市'),(513423,513400,'盐源县'),(513434,513400,'越西县'),(513422,513400,'木里藏族自治县'),(513433,513400,'冕宁县'),(513432,513400,'喜德县'),(513428,513400,'普格县'),(513427,513400,'宁南县'),(513426,513400,'会东县'),(513437,513400,'雷波县'),(513425,513400,'会理县'),(513436,513400,'美姑县'),(513429,513400,'布拖县'),(441303,441300,'惠阳区'),(441302,441300,'惠城区'),(441324,441300,'龙门县'),(441323,441300,'惠东县'),(441322,441300,'博罗县'),(420684,420600,'宜城市'),(420625,420600,'谷城县'),(420602,420600,'襄城区'),(420624,420600,'南漳县'),(420607,420600,'襄州区'),(420606,420600,'樊城区'),(420626,420600,'保康县'),(420683,420600,'枣阳市'),(420682,420600,'老河口市'),(711490,711400,'杨梅市'),(711491,711400,'新屋乡'),(711492,711400,'观音乡'),(711493,711400,'桃园市'),(711487,711400,'中坜市'),(711498,711400,'大园乡'),(711488,711400,'平镇市'),(711499,711400,'芦竹乡'),(711489,711400,'龙潭乡'),(711494,711400,'龟山乡'),(711495,711400,'八德市'),(711496,711400,'大溪镇'),(711497,711400,'复兴乡'),(231281,231200,'安达市'),(231282,231200,'肇东市'),(231283,231200,'海伦市'),(231221,231200,'望奎县'),(231222,231200,'兰西县'),(231223,231200,'青冈县'),(231202,231200,'北林区'),(231224,231200,'庆安县'),(231225,231200,'明水县'),(231226,231200,'绥棱县'),(640522,640500,'海原县'),(640521,640500,'中宁县'),(640502,640500,'沙坡头区'),(451103,451100,'平桂区'),(451122,451100,'钟山县'),(451121,451100,'昭平县'),(451102,451100,'八步区'),(451123,451100,'富川瑶族自治县'),(340603,340600,'相山区'),(340604,340600,'烈山区'),(340602,340600,'杜集区'),(340621,340600,'濉溪县'),(210505,210500,'南芬区'),(210504,210500,'明山区'),(210521,210500,'本溪满族自治县'),(210503,210500,'溪湖区'),(210502,210500,'平山区'),(210522,210500,'桓仁满族自治县'),(350721,350700,'顺昌县'),(350722,350700,'浦城县'),(350723,350700,'光泽县'),(350702,350700,'延平区'),(350724,350700,'松溪县'),(350703,350700,'建阳区'),(350725,350700,'政和县'),(350781,350700,'邵武市'),(350782,350700,'武夷山市'),(350783,350700,'建瓯市'),(430422,430400,'衡南县'),(430421,430400,'衡阳县'),(430424,430400,'衡东县'),(430412,430400,'南岳区'),(430423,430400,'衡山县'),(430426,430400,'祁东县'),(430406,430400,'雁峰区'),(430405,430400,'珠晖区'),(430408,430400,'蒸湘区'),(430407,430400,'石鼓区'),(430471,430400,'衡阳综合保税区'),(430482,430400,'常宁市'),(430481,430400,'耒阳市'),(430473,430400,'湖南衡阳松木经济开发区'),(430472,430400,'湖南衡阳高新技术产业园区'),(512000,510000,'资阳市'),(513200,510000,'阿坝藏族羌族自治州'),(511000,510000,'内江市'),(510100,510000,'成都市'),(511300,510000,'南充市'),(511400,510000,'眉山市'),(510300,510000,'自贡市'),(511100,510000,'乐山市'),(513400,510000,'凉山彝族自治州'),(513300,510000,'甘孜藏族自治州'),(510500,510000,'泸州市'),(511700,510000,'达州市'),(510400,510000,'攀枝花市'),(511800,510000,'雅安市'),(510700,510000,'绵阳市'),(511500,510000,'宜宾市'),(510600,510000,'德阳市'),(511600,510000,'广安市'),(510800,510000,'广元市'),(511900,510000,'巴中市'),(510900,510000,'遂宁市'),(130881,130800,'平泉市'),(130828,130800,'围场满族蒙古族自治县'),(130871,130800,'承德高新技术产业开发区'),(130822,130800,'兴隆县'),(130821,130800,'承德县'),(130804,130800,'鹰手营子矿区'),(130826,130800,'丰宁满族自治县'),(130827,130800,'宽城满族自治县'),(130802,130800,'双桥区'),(130824,130800,'滦平县'),(130803,130800,'双滦区'),(130825,130800,'隆化县'),(220382,220300,'双辽市'),(220381,220300,'公主岭市'),(220322,220300,'梨树县'),(220302,220300,'铁西区'),(220323,220300,'伊通满族自治县'),(220303,220300,'铁东区'),(371521,371500,'阳谷县'),(371581,371500,'临清市'),(371526,371500,'高唐县'),(371523,371500,'茌平县'),(371522,371500,'莘县'),(371525,371500,'冠县'),(371502,371500,'东昌府区'),(371524,371500,'东阿县'),(440282,440200,'南雄市'),(440281,440200,'乐昌市'),(440229,440200,'翁源县'),(440205,440200,'曲江区'),(440204,440200,'浈江区'),(440203,440200,'武江区'),(440224,440200,'仁化县'),(440222,440200,'始兴县'),(440233,440200,'新丰县'),(440232,440200,'乳源瑶族自治县'),(610881,610800,'神木市'),(610829,610800,'吴堡县'),(610827,610800,'米脂县'),(610828,610800,'佳县'),(610803,610800,'横山区'),(610825,610800,'定边县'),(610826,610800,'绥德县'),(610802,610800,'榆阳区'),(610824,610800,'靖边县'),(610822,610800,'府谷县'),(610830,610800,'清涧县'),(610831,610800,'子洲县'),(341825,341800,'旌德县'),(341802,341800,'宣州区'),(341824,341800,'绩溪县'),(341823,341800,'泾县'),(341822,341800,'广德县'),(341871,341800,'宣城市经济开发区'),(341881,341800,'宁国市'),(341821,341800,'郎溪县'),(230184,230100,'五常市'),(230183,230100,'尚志市'),(230127,230100,'木兰县'),(230104,230100,'道外区'),(230126,230100,'巴彦县'),(230103,230100,'南岗区'),(230125,230100,'宾县'),(230102,230100,'道里区'),(230113,230100,'双城区'),(230124,230100,'方正县'),(230112,230100,'阿城区'),(230123,230100,'依兰县'),(230111,230100,'呼兰区'),(230110,230100,'香坊区'),(230109,230100,'松北区'),(230108,230100,'平房区'),(230129,230100,'延寿县'),(230128,230100,'通河县'),(150428,150400,'喀喇沁旗'),(150429,150400,'宁城县'),(150404,150400,'松山区'),(150426,150400,'翁牛特旗'),(150402,150400,'红山区'),(150424,150400,'林西县'),(150403,150400,'元宝山区'),(150425,150400,'克什克腾旗'),(150422,150400,'巴林左旗'),(150423,150400,'巴林右旗'),(150421,150400,'阿鲁科尔沁旗'),(150430,150400,'敖汉旗'),(500231,500200,'垫江县'),(500242,500200,'酉阳土家族苗族自治县'),(500230,500200,'丰都县'),(500241,500200,'秀山土家族苗族自治县'),(500240,500200,'石柱土家族自治县'),(500235,500200,'云阳县'),(500233,500200,'忠县'),(500243,500200,'彭水苗族土家族自治县'),(500238,500200,'巫溪县'),(500237,500200,'巫山县'),(500236,500200,'奉节县'),(500229,500200,'城口县'),(140681,140600,'怀仁市'),(140671,140600,'山西朔州经济开发区'),(140621,140600,'山阴县'),(140622,140600,'应县'),(140623,140600,'右玉县'),(140602,140600,'朔城区'),(140603,140600,'平鲁区'),(712690,712600,'吉安乡'),(712691,712600,'寿丰乡'),(712692,712600,'凤林镇'),(712686,712600,'花莲市'),(712697,712600,'玉里镇'),(712687,712600,'新城乡'),(712698,712600,'卓溪乡'),(712688,712600,'太鲁阁'),(712699,712600,'富里乡'),(712689,712600,'秀林乡'),(712693,712600,'光复乡'),(712694,712600,'丰滨乡'),(712695,712600,'瑞穗乡'),(712696,712600,'万荣乡'),(450800,450000,'贵港市'),(450700,450000,'钦州市'),(450900,450000,'玉林市'),(450400,450000,'梧州市'),(450300,450000,'桂林市'),(451400,450000,'崇左市'),(450600,450000,'防城港市'),(450500,450000,'北海市'),(451100,450000,'贺州市'),(451000,450000,'百色市'),(450200,450000,'柳州市'),(451300,450000,'来宾市'),(450100,450000,'南宁市'),(451200,450000,'河池市'),(659004,659000,'五家渠市'),(659003,659000,'图木舒克市'),(659002,659000,'阿拉尔市'),(659006,659000,'铁门关市'),(659001,659000,'石河子市'),(360521,360500,'分宜县'),(360502,360500,'渝水区'),(620602,620600,'凉州区'),(620621,620600,'民勤县'),(620622,620600,'古浪县'),(620623,620600,'天祝藏族自治县'),(622927,622900,'积石山保安族东乡族撒拉族自治县'),(622924,622900,'广河县'),(622901,622900,'临夏市'),(622923,622900,'永靖县'),(622926,622900,'东乡族自治县'),(622925,622900,'和政县'),(622922,622900,'康乐县'),(622921,622900,'临夏县'),(710306,710300,'安南区'),(710305,710300,'安平区'),(710349,710300,'官田区'),(710304,710300,'北区'),(710348,710300,'龙崎区'),(710303,710300,'南区'),(710347,710300,'关庙区'),(710369,710300,'安定区'),(710353,710300,'七股区'),(710352,710300,'西港区'),(710351,710300,'佳里区'),(710350,710300,'麻豆区'),(710357,710300,'新营区'),(710356,710300,'北门区'),(710355,710300,'学甲区'),(710399,710300,'其它区'),(710354,710300,'将军区'),(710339,710300,'永康区'),(710359,710300,'白河区'),(710358,710300,'后壁区'),(710360,710300,'东山区'),(710342,710300,'左镇区'),(710364,710300,'盐水区'),(710341,710300,'新化区'),(710363,710300,'柳营区'),(710340,710300,'归仁区'),(710362,710300,'下营区'),(710361,710300,'六甲区'),(710302,710300,'东区'),(710346,710300,'仁德区'),(710368,710300,'新市区'),(710301,710300,'中西区'),(710345,710300,'南化区'),(710367,710300,'山上区'),(710344,710300,'楠西区'),(710366,710300,'大内区'),(710343,710300,'玉井区'),(710365,710300,'善化区'),(410711,410700,'牧野区'),(410703,410700,'卫滨区'),(410725,410700,'原阳县'),(410702,410700,'红旗区'),(410724,410700,'获嘉县'),(410773,410700,'新乡市平原城乡一体化示范区'),(410721,410700,'新乡县'),(410727,410700,'封丘县'),(410704,410700,'凤泉区'),(410726,410700,'延津县'),(410728,410700,'长垣县'),(410781,410700,'卫辉市'),(410772,410700,'新乡经济技术开发区'),(410771,410700,'新乡高新技术产业开发区'),(410782,410700,'辉县市'),(511011,511000,'东兴区'),(511025,511000,'资中县'),(511002,511000,'市中区'),(511024,511000,'威远县'),(511083,511000,'隆昌市'),(511071,511000,'内江经济开发区'),(370211,370200,'黄岛区'),(370212,370200,'崂山区'),(370271,370200,'青岛高新技术产业开发区'),(370283,370200,'平度市'),(370285,370200,'莱西市'),(370281,370200,'胶州市'),(370202,370200,'市南区'),(370213,370200,'李沧区'),(370203,370200,'市北区'),(370214,370200,'城阳区'),(370215,370200,'即墨区'),(330903,330900,'普陀区'),(330921,330900,'岱山县'),(330922,330900,'嵊泗县'),(330902,330900,'定海区'),(513332,513300,'石渠县'),(513331,513300,'白玉县'),(513330,513300,'德格县'),(513325,513300,'雅江县'),(513336,513300,'乡城县'),(513324,513300,'九龙县'),(513335,513300,'巴塘县'),(513301,513300,'康定市'),(513323,513300,'丹巴县'),(513334,513300,'理塘县'),(513322,513300,'泸定县'),(513333,513300,'色达县'),(513329,513300,'新龙县'),(513328,513300,'甘孜县'),(513327,513300,'炉霍县'),(513338,513300,'得荣县'),(513326,513300,'道孚县'),(513337,513300,'稻城县'),(441284,441200,'四会市'),(441204,441200,'高要区'),(441226,441200,'德庆县'),(441203,441200,'鼎湖区'),(441225,441200,'封开县'),(441202,441200,'端州区'),(441224,441200,'怀集县'),(441223,441200,'广宁县'),(420583,420500,'枝江市'),(420582,420500,'当阳市'),(420581,420500,'宜都市'),(420504,420500,'点军区'),(420526,420500,'兴山县'),(420503,420500,'伍家岗区'),(420525,420500,'远安县'),(420502,420500,'西陵区'),(420529,420500,'五峰土家族自治县'),(420506,420500,'夷陵区'),(420528,420500,'长阳土家族自治县'),(420505,420500,'猇亭区'),(420527,420500,'秭归县'),(422822,422800,'建始县'),(422801,422800,'恩施市'),(422823,422800,'巴东县'),(422802,422800,'利川市'),(422825,422800,'宣恩县'),(422826,422800,'咸丰县'),(422827,422800,'来凤县'),(422828,422800,'鹤峰县'),(340711,340700,'郊区'),(340722,340700,'枞阳县'),(340706,340700,'义安区'),(340705,340700,'铜官区'),(210411,210400,'顺城区'),(210422,210400,'新宾满族自治县'),(210421,210400,'抚顺县'),(210404,210400,'望花区'),(210403,210400,'东洲区'),(210402,210400,'新抚区'),(210423,210400,'清原满族自治县'),(711391,711300,'关西镇'),(711392,711300,'芎林乡'),(711393,711300,'宝山乡'),(711394,711300,'竹东镇'),(711390,711300,'新埔镇'),(711388,711300,'湖口乡'),(711399,711300,'峨眉乡'),(711389,711300,'新丰乡'),(711395,711300,'五峰乡'),(711396,711300,'横山乡'),(711397,711300,'尖石乡'),(711387,711300,'竹北市'),(711398,711300,'北埔乡'),(231181,231100,'北安市'),(231182,231100,'五大连池市'),(231121,231100,'嫩江县'),(231123,231100,'逊克县'),(231102,231100,'爱辉区'),(231124,231100,'孙吴县'),(640423,640400,'隆德县'),(640422,640400,'西吉县'),(640425,640400,'彭阳县'),(640402,640400,'原州区'),(640424,640400,'泾源县'),(451030,451000,'西林县'),(451021,451000,'田阳县'),(451031,451000,'隆林各族自治县'),(451081,451000,'靖西市'),(451027,451000,'凌云县'),(451026,451000,'那坡县'),(451029,451000,'田林县'),(451028,451000,'乐业县'),(451023,451000,'平果县'),(451022,451000,'田东县'),(451002,451000,'右江区'),(451024,451000,'德保县'),(350622,350600,'云霄县'),(350623,350600,'漳浦县'),(350602,350600,'芗城区'),(350624,350600,'诏安县'),(350603,350600,'龙文区'),(350625,350600,'长泰县'),(350626,350600,'东山县'),(350627,350600,'南靖县'),(350628,350600,'平和县'),(350629,350600,'华安县'),(350681,350600,'龙海市'),(371422,371400,'宁津县'),(371471,371400,'德州经济技术开发区'),(371482,371400,'禹城市'),(371481,371400,'乐陵市'),(371472,371400,'德州运河经济开发区'),(371428,371400,'武城县'),(371427,371400,'夏津县'),(371402,371400,'德城区'),(371424,371400,'临邑县'),(371423,371400,'庆云县'),(371426,371400,'平原县'),(371403,371400,'陵城区'),(371425,371400,'齐河县'),(430321,430300,'湘潭县'),(430302,430300,'雨湖区'),(430304,430300,'岳塘区'),(430381,430300,'湘乡市'),(430372,430300,'湘潭昭山示范区'),(430371,430300,'湖南湘潭高新技术产业园区'),(430382,430300,'韶山市'),(430373,430300,'湘潭九华示范区'),(650205,650200,'乌尔禾区'),(650204,650200,'白碱滩区'),(650203,650200,'克拉玛依区'),(650202,650200,'独山子区'),(610928,610900,'旬阳县'),(610929,610900,'白河县'),(610926,610900,'平利县'),(610927,610900,'镇坪县'),(610902,610900,'汉滨区'),(610924,610900,'紫阳县'),(610925,610900,'岚皋县'),(610922,610900,'石泉县'),(610923,610900,'宁陕县'),(610921,610900,'汉阴县'),(130771,130700,'张家口市高新技术产业开发区'),(130730,130700,'怀来县'),(130731,130700,'涿鹿县'),(130772,130700,'张家口市察北管理区'),(130773,130700,'张家口市塞北管理区'),(130723,130700,'康保县'),(130702,130700,'桥东区'),(130724,130700,'沽源县'),(130732,130700,'赤城县'),(130722,130700,'张北县'),(130705,130700,'宣化区'),(130727,130700,'阳原县'),(130706,130700,'下花园区'),(130728,130700,'怀安县'),(130703,130700,'桥西区'),(130725,130700,'尚义县'),(130726,130700,'蔚县'),(130709,130700,'崇礼区'),(130708,130700,'万全区'),(220281,220200,'蛟河市'),(220272,220200,'吉林高新技术产业开发区'),(220283,220200,'舒兰市'),(220271,220200,'吉林经济开发区'),(220282,220200,'桦甸市'),(220273,220200,'吉林中国新加坡食品区'),(220284,220200,'磐石市'),(220221,220200,'永吉县'),(220211,220200,'丰满区'),(220203,220200,'龙潭区'),(220202,220200,'昌邑区'),(220204,220200,'船营区'),(440118,440100,'增城区'),(440106,440100,'天河区'),(440117,440100,'从化区'),(440105,440100,'海珠区'),(440104,440100,'越秀区'),(440115,440100,'南沙区'),(440103,440100,'荔湾区'),(440114,440100,'花都区'),(440113,440100,'番禺区'),(440112,440100,'黄埔区'),(440111,440100,'白云区'),(360430,360400,'彭泽县'),(360483,360400,'庐山市'),(360481,360400,'瑞昌市'),(360482,360400,'共青城市'),(360429,360400,'湖口县'),(360428,360400,'都昌县'),(360403,360400,'浔阳区'),(360425,360400,'永修县'),(360404,360400,'柴桑区'),(360426,360400,'德安县'),(360423,360400,'武宁县'),(360402,360400,'濂溪区'),(360424,360400,'修水县'),(230600,230000,'大庆市'),(230500,230000,'双鸭山市'),(230400,230000,'鹤岗市'),(230300,230000,'鸡西市'),(230200,230000,'齐齐哈尔市'),(230100,230000,'哈尔滨市'),(231000,230000,'牡丹江市'),(231100,230000,'黑河市'),(231200,230000,'绥化市'),(230900,230000,'七台河市'),(230800,230000,'佳木斯市'),(232700,230000,'大兴安岭地区'),(230700,230000,'伊春市'),(500107,500100,'九龙坡区'),(500106,500100,'沙坪坝区'),(500105,500100,'江北区'),(500104,500100,'大渡口区'),(500109,500100,'北碚区'),(500108,500100,'南岸区'),(500110,500100,'綦江区'),(500154,500100,'开州区'),(500153,500100,'荣昌区'),(500152,500100,'潼南区'),(500151,500100,'铜梁区'),(500114,500100,'黔江区'),(500113,500100,'巴南区'),(500112,500100,'渝北区'),(500156,500100,'武隆区'),(500111,500100,'大足区'),(500155,500100,'梁平区'),(500118,500100,'永川区'),(500117,500100,'合川区'),(500116,500100,'江津区'),(500115,500100,'长寿区'),(500119,500100,'南川区'),(500120,500100,'璧山区'),(500103,500100,'渝中区'),(500102,500100,'涪陵区'),(500101,500100,'万州区'),(140581,140500,'高平市'),(140521,140500,'沁水县'),(140522,140500,'阳城县'),(140502,140500,'城区'),(140524,140500,'陵川县'),(140525,140500,'泽州县'),(150303,150300,'海南区'),(150304,150300,'乌达区'),(150302,150300,'海勃湾区'),(712590,712500,'关山镇'),(712591,712500,'海端乡'),(712592,712500,'池上乡'),(712593,712500,'东河乡'),(712587,712500,'延平乡'),(712598,712500,'达仁乡'),(712588,712500,'卑南乡'),(712599,712500,'太麻里乡'),(712589,712500,'鹿野乡'),(712594,712500,'成功镇'),(712584,712500,'台东市'),(712595,712500,'长滨乡'),(712585,712500,'绿岛乡'),(712596,712500,'金峰乡'),(712586,712500,'兰屿乡'),(712597,712500,'大武乡'),(620723,620700,'临泽县'),(620702,620700,'甘州区'),(620724,620700,'高台县'),(620725,620700,'山丹县'),(620721,620700,'肃南裕固族自治县'),(620722,620700,'民乐县'),(710207,710200,'前镇区'),(710206,710200,'旗津区'),(710205,710200,'鼓山区'),(710249,710200,'桥头区'),(710204,710200,'盐埕区'),(710248,710200,'燕巢区'),(710209,710200,'左营区'),(710208,710200,'三民区'),(710250,710200,'梓官区'),(710210,710200,'楠梓区'),(710254,710200,'凤山区'),(710253,710200,'湖内区'),(710252,710200,'永安区'),(710251,710200,'弥陀区'),(710258,710200,'大树区'),(710257,710200,'鸟松区'),(710256,710200,'林园区'),(710211,710200,'小港区'),(710255,710200,'大寮区'),(710299,710200,'其它区'),(710259,710200,'旗山区'),(710261,710200,'六龟区'),(710260,710200,'美浓区'),(710243,710200,'大社区'),(710265,710200,'桃源区'),(710242,710200,'仁武区'),(710264,710200,'甲仙区'),(710241,710200,'苓雅区'),(710263,710200,'杉林区'),(710262,710200,'内门区'),(710203,710200,'芩雅区'),(710247,710200,'田寮区'),(710202,710200,'前金区'),(710246,710200,'阿莲区'),(710268,710200,'茄萣区'),(710201,710200,'新兴区'),(710245,710200,'路竹区'),(710267,710200,'茂林区'),(710244,710200,'冈山区'),(710266,710200,'那玛夏区'),(370112,370100,'历城区'),(370102,370100,'历下区'),(370113,370100,'长清区'),(370124,370100,'平阴县'),(370171,370100,'济南高新技术产业开发区'),(370103,370100,'市中区'),(370114,370100,'章丘区'),(370104,370100,'槐荫区'),(370115,370100,'济阳区'),(370126,370100,'商河县'),(370105,370100,'天桥区'),(530111,530100,'官渡区'),(530181,530100,'安宁市'),(530129,530100,'寻甸回族彝族自治县'),(530127,530100,'嵩明县'),(530128,530100,'禄劝彝族苗族自治县'),(530103,530100,'盘龙区'),(530114,530100,'呈贡区'),(530125,530100,'宜良县'),(530115,530100,'晋宁区'),(530126,530100,'石林彝族自治县'),(530112,530100,'西山区'),(530102,530100,'五华区'),(530113,530100,'东川区'),(530124,530100,'富民县'),(441581,441500,'陆丰市'),(441502,441500,'城区'),(441523,441500,'陆河县'),(441521,441500,'海丰县'),(610117,610100,'高陵区'),(610118,610100,'鄠邑区'),(610104,610100,'莲湖区'),(610115,610100,'临潼区'),(610116,610100,'长安区'),(610102,610100,'新城区'),(610113,610100,'雁塔区'),(610124,610100,'周至县'),(610103,610100,'碑林区'),(610114,610100,'阎良区'),(610111,610100,'灞桥区'),(610122,610100,'蓝田县'),(610112,610100,'未央区'),(340802,340800,'迎江区'),(340811,340800,'宜秀区'),(340822,340800,'怀宁县'),(340827,340800,'望江县'),(340828,340800,'岳西县'),(340803,340800,'大观区'),(340825,340800,'太湖县'),(340826,340800,'宿松县'),(340881,340800,'桐城市'),(340871,340800,'安徽安庆经济开发区'),(340882,340800,'潜山市'),(420882,420800,'京山市'),(420822,420800,'沙洋县'),(420804,420800,'掇刀区'),(420802,420800,'东宝区'),(420881,420800,'钟祥市'),(231005,231000,'西安区'),(231004,231000,'爱民区'),(231003,231000,'阳明区'),(231025,231000,'林口县'),(231002,231000,'东安区'),(231086,231000,'东宁市'),(231085,231000,'穆棱市'),(231084,231000,'宁安市'),(231083,231000,'海林市'),(231071,231000,'牡丹江经济技术开发区'),(231081,231000,'绥芬河市'),(210381,210300,'海城市'),(210323,210300,'岫岩满族自治县'),(210311,210300,'千山区'),(210321,210300,'台安县'),(210304,210300,'立山区'),(210303,210300,'铁西区'),(210302,210300,'铁东区'),(510681,510600,'广汉市'),(510683,510600,'绵竹市'),(510682,510600,'什邡市'),(510623,510600,'中江县'),(510603,510600,'旌阳区'),(510604,510600,'罗江区'),(451381,451300,'合山市'),(451302,451300,'兴宾区'),(451324,451300,'金秀瑶族自治县'),(451323,451300,'武宣县'),(451322,451300,'象州县'),(451321,451300,'忻城县'),(621123,621100,'渭源县'),(621122,621100,'陇西县'),(621125,621100,'漳县'),(621102,621100,'安定区'),(621124,621100,'临洮县'),(621121,621100,'通渭县'),(621126,621100,'岷县'),(371321,371300,'沂南县'),(371312,371300,'河东区'),(371323,371300,'沂水县'),(371311,371300,'罗庄区'),(371322,371300,'郯城县'),(371372,371300,'临沂经济技术开发区'),(371371,371300,'临沂高新技术产业开发区'),(371373,371300,'临沂临港经济开发区'),(371329,371300,'临沭县'),(371328,371300,'蒙阴县'),(371325,371300,'费县'),(371302,371300,'兰山区'),(371324,371300,'兰陵县'),(371327,371300,'莒南县'),(371326,371300,'平邑县'),(430611,430600,'君山区'),(430621,430600,'岳阳县'),(430602,430600,'岳阳楼区'),(430624,430600,'湘阴县'),(430623,430600,'华容县'),(430626,430600,'平江县'),(430603,430600,'云溪区'),(430671,430600,'岳阳市屈原管理区'),(430682,430600,'临湘市'),(430681,430600,'汨罗市'),(130273,130200,'唐山高新技术产业开发区'),(130284,130200,'滦州市'),(130274,130200,'河北唐山海港经济开发区'),(130202,130200,'路南区'),(130224,130200,'滦南县'),(130203,130200,'路北区'),(130225,130200,'乐亭县'),(130207,130200,'丰南区'),(130229,130200,'玉田县'),(130204,130200,'古冶区'),(130205,130200,'开平区'),(130227,130200,'迁西县'),(130208,130200,'丰润区'),(130209,130200,'曹妃甸区'),(130271,130200,'唐山市芦台经济技术开发区'),(130272,130200,'唐山市汉沽管理区'),(130283,130200,'迁安市'),(130281,130200,'遵化市'),(220122,220100,'农安县'),(220102,220100,'南关区'),(220113,220100,'九台区'),(220112,220100,'双阳区'),(220104,220100,'朝阳区'),(220103,220100,'宽城区'),(220106,220100,'绿园区'),(220105,220100,'二道区'),(220171,220100,'长春经济技术开发区'),(220182,220100,'榆树市'),(220173,220100,'长春高新技术产业开发区'),(220172,220100,'长春净月高新技术产业开发区'),(220183,220100,'德惠市'),(220174,220100,'长春汽车经济技术开发区'),(222406,222400,'和龙市'),(222401,222400,'延吉市'),(222404,222400,'珲春市'),(222426,222400,'安图县'),(222405,222400,'龙井市'),(222402,222400,'图们市'),(222424,222400,'汪清县'),(222403,222400,'敦化市'),(520322,520300,'桐梓县'),(520323,520300,'绥阳县'),(520302,520300,'红花岗区'),(520324,520300,'正安县'),(520303,520300,'汇川区'),(520325,520300,'道真仡佬族苗族自治县'),(520304,520300,'播州区'),(520326,520300,'务川仡佬族苗族自治县'),(520327,520300,'凤冈县'),(520328,520300,'湄潭县'),(520329,520300,'余庆县'),(520381,520300,'赤水市'),(520382,520300,'仁怀市'),(520330,520300,'习水县'),(522629,522600,'剑河县'),(522632,522600,'榕江县'),(522622,522600,'黄平县'),(522633,522600,'从江县'),(522601,522600,'凯里市'),(522623,522600,'施秉县'),(522634,522600,'雷山县'),(522624,522600,'三穗县'),(522635,522600,'麻江县'),(522625,522600,'镇远县'),(522636,522600,'丹寨县'),(522626,522600,'岑巩县'),(522627,522600,'天柱县'),(522628,522600,'锦屏县'),(522630,522600,'台江县'),(522631,522600,'黎平县'),(440404,440400,'金湾区'),(440403,440400,'斗门区'),(440402,440400,'香洲区'),(350502,350500,'鲤城区'),(350524,350500,'安溪县'),(350503,350500,'丰泽区'),(350525,350500,'永春县'),(350504,350500,'洛江区'),(350526,350500,'德化县'),(350505,350500,'泉港区'),(350527,350500,'金门县'),(350581,350500,'石狮市'),(350582,350500,'晋江市'),(350583,350500,'南安市'),(350521,350500,'惠安县'),(360322,360300,'上栗县'),(360323,360300,'芦溪县'),(360321,360300,'莲花县'),(360302,360300,'安源区'),(360313,360300,'湘东区'),(141100,140000,'吕梁市'),(141000,140000,'临汾市'),(140100,140000,'太原市'),(140200,140000,'大同市'),(140300,140000,'阳泉市'),(140400,140000,'长治市'),(140500,140000,'晋城市'),(140600,140000,'朔州市'),(140700,140000,'晋中市'),(140800,140000,'运城市'),(140900,140000,'忻州市'),(211481,211400,'兴城市'),(211422,211400,'建昌县'),(211421,211400,'绥中县'),(211404,211400,'南票区'),(211403,211400,'龙港区'),(211402,211400,'连山区'),(511827,511800,'宝兴县'),(511822,511800,'荥经县'),(511803,511800,'名山区'),(511825,511800,'天全县'),(511826,511800,'芦山县'),(511823,511800,'汉源县'),(511802,511800,'雨城区'),(511824,511800,'石棉县'),(450206,450200,'柳江区'),(450205,450200,'柳北区'),(450202,450200,'城中区'),(450224,450200,'融安县'),(450223,450200,'鹿寨县'),(450204,450200,'柳南区'),(450226,450200,'三江侗族自治县'),(450203,450200,'鱼峰区'),(450225,450200,'融水苗族自治县'),(450222,450200,'柳城县'),(371200,370000,'莱芜市'),(370100,370000,'济南市'),(371100,370000,'日照市'),(370200,370000,'青岛市'),(371400,370000,'德州市'),(370300,370000,'淄博市'),(371300,370000,'临沂市'),(371000,370000,'威海市'),(370800,370000,'济宁市'),(370900,370000,'泰安市'),(370400,370000,'枣庄市'),(371600,370000,'滨州市'),(370500,370000,'东营市'),(371500,370000,'聊城市'),(370600,370000,'烟台市'),(370700,370000,'潍坊市'),(371700,370000,'菏泽市'),(621200,620000,'陇南市'),(620100,620000,'兰州市'),(621100,620000,'定西市'),(620200,620000,'嘉峪关市'),(620300,620000,'金昌市'),(621000,620000,'庆阳市'),(623000,620000,'甘南藏族自治州'),(620800,620000,'平凉市'),(620900,620000,'酒泉市'),(620400,620000,'白银市'),(620500,620000,'天水市'),(620600,620000,'武威市'),(622900,620000,'临夏回族自治州'),(620700,620000,'张掖市'),(410923,410900,'南乐县'),(410922,410900,'清丰县'),(410972,410900,'濮阳经济技术开发区'),(410971,410900,'河南濮阳工业园区'),(410928,410900,'濮阳县'),(410902,410900,'华龙区'),(410927,410900,'台前县'),(410926,410900,'范县'),(469000,460000,'省直辖县级行政区划'),(460100,460000,'海口市'),(460400,460000,'儋州市'),(460300,460000,'三沙市'),(460200,460000,'三亚市'),(441481,441400,'兴宁市'),(441427,441400,'蕉岭县'),(441426,441400,'平远县'),(441403,441400,'梅县区'),(441402,441400,'梅江区'),(441424,441400,'五华县'),(441423,441400,'丰顺县'),(441422,441400,'大埔县'),(141182,141100,'汾阳市'),(141181,141100,'孝义市'),(141130,141100,'交口县'),(141122,141100,'交城县'),(141121,141100,'文水县'),(141102,141100,'离石区'),(141124,141100,'临县'),(141123,141100,'兴县'),(141126,141100,'石楼县'),(141125,141100,'柳林县'),(141128,141100,'方山县'),(141127,141100,'岚县'),(141129,141100,'中阳县'),(610202,610200,'王益区'),(610222,610200,'宜君县'),(610203,610200,'印台区'),(610204,610200,'耀州区'),(420702,420700,'梁子湖区'),(420704,420700,'鄂城区'),(420703,420700,'华容区'),(510522,510500,'合江县'),(510521,510500,'泸县'),(510502,510500,'江阳区'),(510524,510500,'叙永县'),(510504,510500,'龙马潭区'),(510503,510500,'纳溪区'),(510525,510500,'古蔺县'),(210281,210200,'瓦房店市'),(210283,210200,'庄河市'),(210202,210200,'中山区'),(210213,210200,'金州区'),(210224,210200,'长海县'),(210212,210200,'旅顺口区'),(210211,210200,'甘井子区'),(210204,210200,'沙河口区'),(210203,210200,'西岗区'),(210214,210200,'普兰店区'),(451229,451200,'大化瑶族自治县'),(451228,451200,'都安瑶族自治县'),(451203,451200,'宜州区'),(451225,451200,'罗城仫佬族自治县'),(451202,451200,'金城江区'),(451224,451200,'东兰县'),(451227,451200,'巴马瑶族自治县'),(451226,451200,'环江毛南族自治县'),(451221,451200,'南丹县'),(451223,451200,'凤山县'),(451222,451200,'天峨县'),(371202,371200,'莱城区'),(371203,371200,'钢城区'),(621222,621200,'文县'),(621221,621200,'成县'),(621202,621200,'武都区'),(621224,621200,'康县'),(621223,621200,'宕昌县'),(621226,621200,'礼县'),(621225,621200,'西和县'),(621228,621200,'两当县'),(621227,621200,'徽县'),(130110,130100,'鹿泉区'),(130121,130100,'井陉县'),(130132,130100,'元氏县'),(130111,130100,'栾城区'),(130133,130100,'赵县'),(130130,130100,'无极县'),(130131,130100,'平山县'),(130125,130100,'行唐县'),(130104,130100,'桥西区'),(130126,130100,'灵寿县'),(130123,130100,'正定县'),(130102,130100,'长安区'),(130107,130100,'井陉矿区'),(130129,130100,'赞皇县'),(130108,130100,'裕华区'),(130105,130100,'新华区'),(130127,130100,'高邑县'),(130128,130100,'深泽县'),(130109,130100,'藁城区'),(130172,130100,'石家庄循环化工园区'),(130183,130100,'晋州市'),(130184,130100,'新乐市'),(130181,130100,'辛集市'),(130171,130100,'石家庄高新技术产业开发区'),(430521,430500,'邵东县'),(430523,430500,'邵阳县'),(430511,430500,'北塔区'),(430522,430500,'新邵县'),(430503,430500,'大祥区'),(430525,430500,'洞口县'),(430502,430500,'双清区'),(430524,430500,'隆回县'),(430527,430500,'绥宁县'),(430529,430500,'城步苗族自治县'),(430528,430500,'新宁县'),(430581,430500,'武冈市'),(220800,220000,'白城市'),(220100,220000,'长春市'),(222400,220000,'延边朝鲜族自治州'),(220300,220000,'四平市'),(220200,220000,'吉林市'),(220500,220000,'通化市'),(220400,220000,'辽源市'),(220700,220000,'松原市'),(220600,220000,'白山市'),(520422,520400,'普定县'),(520423,520400,'镇宁布依族苗族自治县'),(520402,520400,'西秀区'),(520424,520400,'关岭布依族苗族自治县'),(520403,520400,'平坝区'),(520425,520400,'紫云苗族布依族自治县'),(522728,522700,'罗甸县'),(522729,522700,'长顺县'),(522730,522700,'龙里县'),(522731,522700,'惠水县'),(522732,522700,'三都水族自治县'),(522722,522700,'荔波县'),(522701,522700,'都匀市'),(522723,522700,'贵定县'),(522702,522700,'福泉市'),(522725,522700,'瓮安县'),(522726,522700,'独山县'),(522727,522700,'平塘县'),(440309,440300,'龙华区'),(440308,440300,'盐田区'),(440307,440300,'龙岗区'),(440306,440300,'宝安区'),(440305,440300,'南山区'),(440304,440300,'福田区'),(440303,440300,'罗湖区'),(440311,440300,'光明区'),(440310,440300,'坪山区'),(350402,350400,'梅列区'),(350424,350400,'宁化县'),(350403,350400,'三元区'),(350425,350400,'大田县'),(350426,350400,'尤溪县'),(350427,350400,'沙县'),(350428,350400,'将乐县'),(350429,350400,'泰宁县'),(350481,350400,'永安市'),(350430,350400,'建宁县'),(350421,350400,'明溪县'),(350423,350400,'清流县'),(360202,360200,'昌江区'),(360222,360200,'浮梁县'),(360281,360200,'乐平市'),(360203,360200,'珠山区'),(532531,532500,'绿春县'),(532530,532500,'金平苗族瑶族傣族自治县'),(532528,532500,'元阳县'),(532527,532500,'泸西县'),(532504,532500,'弥勒市'),(532503,532500,'蒙自市'),(532525,532500,'石屏县'),(532502,532500,'开远市'),(532524,532500,'建水县'),(532501,532500,'个旧市'),(532523,532500,'屏边苗族自治县'),(532532,532500,'河口瑶族自治县'),(532529,532500,'红河县'),(511781,511700,'万源市'),(511771,511700,'达州经济开发区'),(511722,511700,'宣汉县'),(511723,511700,'开江县'),(511702,511700,'通川区'),(511724,511700,'大竹县'),(511703,511700,'达川区'),(511725,511700,'渠县'),(211382,211300,'凌源市'),(211381,211300,'北票市'),(211302,211300,'双塔区'),(211324,211300,'喀喇沁左翼蒙古族自治县'),(211322,211300,'建平县'),(211321,211300,'朝阳县'),(211303,211300,'龙城区'),(540500,540000,'山南市'),(540600,540000,'那曲市'),(540100,540000,'拉萨市'),(540200,540000,'日喀则市'),(540300,540000,'昌都市'),(540400,540000,'林芝市'),(542500,540000,'阿里地区'),(450107,450100,'西乡塘区'),(450109,450100,'邕宁区'),(450108,450100,'良庆区'),(450103,450100,'青秀区'),(450125,450100,'上林县'),(450102,450100,'兴宁区'),(450124,450100,'马山县'),(450105,450100,'江南区'),(450127,450100,'横县'),(450126,450100,'宾阳县'),(450110,450100,'武鸣区'),(450123,450100,'隆安县'),(620121,620100,'永登县'),(620111,620100,'红古区'),(620122,620100,'皋兰县'),(620123,620100,'榆中县'),(620102,620100,'城关区'),(620171,620100,'兰州新区'),(620103,620100,'七里河区'),(620104,620100,'西固区'),(620105,620100,'安宁区'),(460108,460100,'美兰区'),(460107,460100,'琼山区'),(460106,460100,'龙华区'),(460105,460100,'秀英区'),(441781,441700,'阳春市'),(441704,441700,'阳东区'),(441702,441700,'江城区'),(441721,441700,'阳西县'),(310100,310000,'上海城区'),(610322,610300,'凤翔县'),(610323,610300,'岐山县'),(610331,610300,'太白县'),(610330,610300,'凤县'),(610328,610300,'千阳县'),(610329,610300,'麟游县'),(610304,610300,'陈仓区'),(610326,610300,'眉县'),(610327,610300,'陇县'),(610302,610300,'渭滨区'),(610324,610300,'扶风县'),(610303,610300,'金台区'),(510421,510400,'米易县'),(510411,510400,'仁和区'),(510422,510400,'盐边县'),(510403,510400,'西区'),(510402,510400,'东区'),(520121,520100,'开阳县'),(520103,520100,'云岩区'),(520122,520100,'息烽县'),(520102,520100,'南明区'),(520123,520100,'修文县'),(520112,520100,'乌当区'),(520113,520100,'白云区'),(520111,520100,'花溪区'),(520115,520100,'观山湖区'),(520181,520100,'清镇市'),(210181,210100,'新民市'),(210103,210100,'沈河区'),(210114,210100,'于洪区'),(210102,210100,'和平区'),(210113,210100,'沈北新区'),(210124,210100,'法库县'),(210112,210100,'浑南区'),(210123,210100,'康平县'),(210111,210100,'苏家屯区'),(210106,210100,'铁西区'),(210105,210100,'皇姑区'),(210104,210100,'大东区'),(210115,210100,'辽中区'),(371122,371100,'莒县'),(371103,371100,'岚山区'),(371102,371100,'东港区'),(371121,371100,'五莲县'),(371171,371100,'日照经济技术开发区'),(130473,130400,'邯郸冀南新区'),(130430,130400,'邱县'),(130471,130400,'邯郸经济技术开发区'),(130433,130400,'馆陶县'),(130423,130400,'临漳县'),(130434,130400,'魏县'),(130431,130400,'鸡泽县'),(130432,130400,'广平县'),(130404,130400,'复兴区'),(130426,130400,'涉县'),(130427,130400,'磁县'),(130402,130400,'邯山区'),(130424,130400,'成安县'),(130435,130400,'曲周县'),(130403,130400,'丛台区'),(130425,130400,'大名县'),(130408,130400,'永年区'),(130406,130400,'峰峰矿区'),(130407,130400,'肥乡区'),(130481,130400,'武安市'),(211100,210000,'盘锦市'),(211000,210000,'辽阳市'),(210900,210000,'阜新市'),(210400,210000,'抚顺市'),(210300,210000,'鞍山市'),(211400,210000,'葫芦岛市'),(210200,210000,'大连市'),(211300,210000,'朝阳市'),(210100,210000,'沈阳市'),(211200,210000,'铁岭市'),(210800,210000,'营口市'),(210700,210000,'锦州市'),(210600,210000,'丹东市'),(210500,210000,'本溪市'),(430811,430800,'武陵源区'),(430822,430800,'桑植县'),(430821,430800,'慈利县'),(430802,430800,'永定区'),(440608,440600,'高明区'),(440607,440600,'三水区'),(440606,440600,'顺德区'),(440605,440600,'南海区'),(440604,440600,'禅城区'),(533325,533300,'兰坪白族普米族自治县'),(533324,533300,'贡山独龙族怒族自治县'),(533301,533300,'泸水市'),(533323,533300,'福贡县'),(350303,350300,'涵江区'),(350304,350300,'荔城区'),(350305,350300,'秀屿区'),(350322,350300,'仙游县'),(350302,350300,'城厢区'),(360102,360100,'东湖区'),(360124,360100,'进贤县'),(360103,360100,'西湖区'),(360111,360100,'青山湖区'),(360112,360100,'新建区'),(360123,360100,'安义县'),(360121,360100,'南昌县'),(360104,360100,'青云谱区'),(360105,360100,'湾里区'),(140221,140200,'阳高县'),(140222,140200,'天镇县'),(140212,140200,'新荣区'),(140223,140200,'广灵县'),(140213,140200,'平城区'),(140224,140200,'灵丘县'),(140214,140200,'云冈区'),(140225,140200,'浑源县'),(140215,140200,'云州区'),(140226,140200,'左云县'),(140271,140200,'山西大同经济开发区'),(450481,450400,'岑溪市'),(450403,450400,'万秀区'),(450406,450400,'龙圩区'),(450405,450400,'长洲区'),(450422,450400,'藤县'),(450421,450400,'苍梧县'),(450423,450400,'蒙山县'),(150800,150000,'巴彦淖尔市'),(150900,150000,'乌兰察布市'),(150600,150000,'鄂尔多斯市'),(152900,150000,'阿拉善盟'),(150700,150000,'呼伦贝尔市'),(150400,150000,'赤峰市'),(150500,150000,'通辽市'),(150200,150000,'包头市'),(152500,150000,'锡林郭勒盟'),(150300,150000,'乌海市'),(150100,150000,'呼和浩特市'),(152200,150000,'兴安盟'),(211282,211200,'开原市'),(211281,211200,'调兵山市'),(211221,211200,'铁岭县'),(211202,211200,'银州区'),(211224,211200,'昌图县'),(211223,211200,'西丰县'),(211204,211200,'清河区'),(511681,511600,'华蓥市'),(511623,511600,'邻水县'),(511602,511600,'广安区'),(511621,511600,'岳池县'),(511622,511600,'武胜县'),(511603,511600,'前锋区'),(62201403,620200,'长城区'),(62201102,620200,'文殊镇'),(62201401,620200,'雄关区'),(62201402,620200,'镜铁区'),(62201100,620200,'新城镇'),(62201101,620200,'峪泉镇'),(211122,211100,'盘山县'),(211104,211100,'大洼区'),(211103,211100,'兴隆台区'),(211102,211100,'双台子区'),(511421,511400,'仁寿县'),(511403,511400,'彭山区'),(511425,511400,'青神县'),(511423,511400,'洪雅县'),(511402,511400,'东坡区'),(511424,511400,'丹棱县'),(532300,530000,'楚雄彝族自治州'),(533400,530000,'迪庆藏族自治州'),(530100,530000,'昆明市'),(533300,530000,'怒江傈僳族自治州'),(533100,530000,'德宏傣族景颇族自治州'),(530800,530000,'普洱市'),(530900,530000,'临沧市'),(530600,530000,'昭通市'),(532900,530000,'大理白族自治州'),(530700,530000,'丽江市'),(532800,530000,'西双版纳傣族自治州'),(530400,530000,'玉溪市'),(530500,530000,'保山市'),(532600,530000,'文山壮族苗族自治州'),(532500,530000,'红河哈尼族彝族自治州'),(530300,530000,'曲靖市'),(532329,532300,'武定县'),(532328,532300,'元谋县'),(532327,532300,'永仁县'),(532326,532300,'大姚县'),(532325,532300,'姚安县'),(532324,532300,'南华县'),(532301,532300,'楚雄市'),(532323,532300,'牟定县'),(532322,532300,'双柏县'),(532331,532300,'禄丰县'),(441625,441600,'东源县'),(441602,441600,'源城区'),(441624,441600,'和平县'),(441623,441600,'连平县'),(441622,441600,'龙川县'),(441621,441600,'紫金县'),(310151,310100,'崇明区'),(310120,310100,'奉贤区'),(310110,310100,'杨浦区'),(310101,310100,'黄浦区'),(310112,310100,'闵行区'),(310113,310100,'宝山区'),(310114,310100,'嘉定区'),(310104,310100,'徐汇区'),(310115,310100,'浦东新区'),(310105,310100,'长宁区'),(310116,310100,'金山区'),(310106,310100,'静安区'),(310117,310100,'松江区'),(310107,310100,'普陀区'),(310118,310100,'青浦区'),(310109,310100,'虹口区'),(460205,460200,'崖州区'),(460204,460200,'天涯区'),(460203,460200,'吉阳区'),(460202,460200,'海棠区'),(610429,610400,'旬邑县'),(610428,610400,'长武县'),(610403,610400,'杨陵区'),(610425,610400,'礼泉县'),(610404,610400,'渭城区'),(610426,610400,'永寿县'),(610423,610400,'泾阳县'),(610402,610400,'秦都区'),(610424,610400,'乾县'),(610422,610400,'三原县'),(610430,610400,'淳化县'),(610431,610400,'武功县'),(610481,610400,'兴平市'),(610482,610400,'彬州市'),(420984,420900,'汉川市'),(420982,420900,'安陆市'),(420981,420900,'应城市'),(420922,420900,'大悟县'),(420921,420900,'孝昌县'),(420902,420900,'孝南区'),(420923,420900,'云梦县'),(520281,520200,'盘州市'),(520221,520200,'水城县'),(520201,520200,'钟山区'),(520203,520200,'六枝特区'),(451481,451400,'凭祥市'),(451423,451400,'龙州县'),(451422,451400,'宁明县'),(451425,451400,'天等县'),(451402,451400,'江州区'),(451424,451400,'大新县'),(451421,451400,'扶绥县'),(321012,321000,'江都区'),(321023,321000,'宝应县'),(321084,321000,'高邮市'),(321071,321000,'扬州经济技术开发区'),(321081,321000,'仪征市'),(321002,321000,'广陵区'),(321003,321000,'邗江区'),(371002,371000,'环翠区'),(371003,371000,'文登区'),(371071,371000,'威海火炬高技术产业开发区'),(371082,371000,'荣成市'),(371073,371000,'威海临港经济技术开发区'),(371072,371000,'威海经济技术开发区'),(371083,371000,'乳山市'),(510311,510300,'沿滩区'),(510322,510300,'富顺县'),(510321,510300,'荣县'),(510302,510300,'自流井区'),(510304,510300,'大安区'),(510303,510300,'贡井区'),(130372,130300,'北戴河新区'),(130302,130300,'海港区'),(130324,130300,'卢龙县'),(130321,130300,'青龙满族自治县'),(130322,130300,'昌黎县'),(130306,130300,'抚宁区'),(130303,130300,'山海关区'),(130304,130300,'北戴河区'),(130371,130300,'秦皇岛市经济技术开发区'),(430771,430700,'常德市西洞庭管理区'),(430721,430700,'安乡县'),(430723,430700,'澧县'),(430722,430700,'汉寿县'),(430703,430700,'鼎城区'),(430725,430700,'桃源县'),(430702,430700,'武陵区'),(430724,430700,'临澧县'),(430726,430700,'石门县'),(430781,430700,'津市市'),(533401,533400,'香格里拉市'),(533423,533400,'维西傈僳族自治县'),(533422,533400,'德钦县'),(440507,440500,'龙湖区'),(440515,440500,'澄海区'),(440514,440500,'潮南区'),(440513,440500,'潮阳区'),(440512,440500,'濠江区'),(440523,440500,'南澳县'),(440511,440500,'金平区'),(350205,350200,'海沧区'),(350206,350200,'湖里区'),(350211,350200,'集美区'),(350212,350200,'同安区'),(350213,350200,'翔安区'),(350203,350200,'思明区'),(610582,610500,'华阴市'),(610581,610500,'韩城市'),(610528,610500,'富平县'),(610526,610500,'蒲城县'),(610527,610500,'白水县'),(610502,610500,'临渭区'),(610524,610500,'合阳县'),(610503,610500,'华州区'),(610525,610500,'澄城县'),(610522,610500,'潼关县'),(610523,610500,'大荔县'),(652924,652900,'沙雅县'),(652925,652900,'新和县'),(652926,652900,'拜城县'),(652927,652900,'乌什县'),(652928,652900,'阿瓦提县'),(652929,652900,'柯坪县'),(652922,652900,'温宿县'),(652901,652900,'阿克苏市'),(652923,652900,'库车县'),(140110,140100,'晋源区'),(140121,140100,'清徐县'),(140122,140100,'阳曲县'),(140123,140100,'娄烦县'),(140105,140100,'小店区'),(140106,140100,'迎泽区'),(140107,140100,'杏花岭区'),(140108,140100,'尖草坪区'),(140109,140100,'万柏林区'),(140181,140100,'古交市'),(140171,140100,'山西转型综合改革示范区'),(360300,360000,'萍乡市'),(360400,360000,'九江市'),(360100,360000,'南昌市'),(360200,360000,'景德镇市'),(361100,360000,'上饶市'),(361000,360000,'抚州市'),(360900,360000,'宜春市'),(360700,360000,'赣州市'),(360800,360000,'吉安市'),(360500,360000,'新余市'),(360600,360000,'鹰潭市'),(450381,450300,'荔浦市'),(450305,450300,'七星区'),(450327,450300,'灌阳县'),(450304,450300,'象山区'),(450326,450300,'永福县'),(450329,450300,'资源县'),(450328,450300,'龙胜各族自治县'),(450312,450300,'临桂区'),(450323,450300,'灵川县'),(450311,450300,'雁山区'),(450303,450300,'叠彩区'),(450325,450300,'兴安县'),(450302,450300,'秀峰区'),(450324,450300,'全州县'),(450330,450300,'平乐县'),(450321,450300,'阳朔县'),(450332,450300,'恭城瑶族自治县'),(511502,511500,'翠屏区'),(511524,511500,'长宁县'),(511503,511500,'南溪区'),(511525,511500,'高县'),(511523,511500,'江安县'),(511528,511500,'兴文县'),(511529,511500,'屏山县'),(511504,511500,'叙州区'),(511526,511500,'珙县'),(511527,511500,'筠连县'),(152202,152200,'阿尔山市'),(152224,152200,'突泉县'),(152201,152200,'乌兰浩特市'),(152223,152200,'扎赉特旗'),(152222,152200,'科尔沁右翼中旗'),(152221,152200,'科尔沁右翼前旗'),(712183,712100,'土库镇'),(712194,712100,'二仑乡'),(712184,712100,'褒忠乡'),(712195,712100,'北港镇'),(712185,712100,'东势乡'),(712196,712100,'水林乡'),(712186,712100,'台西乡'),(712197,712100,'口湖乡'),(712190,712100,'林内乡'),(712180,712100,'斗南镇'),(712191,712100,'古坑乡'),(712181,712100,'大埤乡'),(712192,712100,'莿桐乡'),(712182,712100,'虎尾镇'),(712193,712100,'西螺镇'),(712187,712100,'仑背乡'),(712198,712100,'四湖乡'),(712188,712100,'麦寮乡'),(712199,712100,'元长乡'),(712189,712100,'斗六市'),(710999,710900,'其它区'),(710902,710900,'西区'),(710901,710900,'东区'),(321000,320000,'扬州市'),(321100,320000,'镇江市'),(320900,320000,'盐城市'),(320700,320000,'连云港市'),(320800,320000,'淮安市'),(320500,320000,'苏州市'),(320600,320000,'南通市'),(320300,320000,'徐州市'),(320400,320000,'常州市'),(320100,320000,'南京市'),(321200,320000,'泰州市'),(320200,320000,'无锡市'),(321300,320000,'宿迁市'),(131002,131000,'安次区'),(131024,131000,'香河县'),(131023,131000,'永清县'),(131022,131000,'固安县'),(131028,131000,'大厂回族自治县'),(131026,131000,'文安县'),(131003,131000,'广阳区'),(131025,131000,'大城县'),(131071,131000,'廊坊经济技术开发区'),(131082,131000,'三河市'),(131081,131000,'霸州市'),(211011,211000,'太子河区'),(211021,211000,'辽阳县'),(211005,211000,'弓长岭区'),(211004,211000,'宏伟区'),(211003,211000,'文圣区'),(211002,211000,'白塔区'),(211081,211000,'灯塔市'),(540302,540300,'卡若区'),(540324,540300,'丁青县'),(540325,540300,'察雅县'),(540326,540300,'八宿县'),(540327,540300,'左贡县'),(540321,540300,'江达县'),(540322,540300,'贡觉县'),(540323,540300,'类乌齐县'),(540330,540300,'边坝县'),(540328,540300,'芒康县'),(540329,540300,'洛隆县'),(44900119,441900,'长安镇'),(44900121,441900,'虎门镇'),(44900122,441900,'厚街镇'),(44900101,441900,'石碣镇'),(44900123,441900,'沙田镇'),(44900003,441900,'东城街道'),(44900102,441900,'石龙镇'),(44900124,441900,'道滘镇'),(44900004,441900,'南城街道'),(44900103,441900,'茶山镇'),(44900125,441900,'洪梅镇'),(44900005,441900,'万江街道'),(44900104,441900,'石排镇'),(44900126,441900,'麻涌镇'),(44900401,441900,'松山湖管委会'),(44900006,441900,'莞城街道'),(44900105,441900,'企石镇'),(44900127,441900,'望牛墩镇'),(44900402,441900,'东莞港'),(44900106,441900,'横沥镇'),(44900128,441900,'中堂镇'),(44900403,441900,'东莞生态园'),(44900107,441900,'桥头镇'),(44900129,441900,'高埗镇'),(44900108,441900,'谢岗镇'),(44900109,441900,'东坑镇'),(44900110,441900,'常平镇'),(44900111,441900,'寮步镇'),(44900112,441900,'樟木头镇'),(44900113,441900,'大朗镇'),(44900114,441900,'黄江镇'),(44900115,441900,'清溪镇'),(44900116,441900,'塘厦镇'),(44900117,441900,'凤岗镇'),(44900118,441900,'大岭山镇'),(460323,460300,'中沙群岛的岛礁及其海域'),(460322,460300,'南沙群岛'),(460321,460300,'西沙群岛'),(361126,361100,'弋阳县'),(361103,361100,'广丰区'),(361125,361100,'横峰县'),(361102,361100,'信州区'),(361124,361100,'铅山县'),(361123,361100,'玉山县'),(361121,361100,'上饶县'),(361130,361100,'婺源县'),(361181,361100,'德兴市'),(361129,361100,'万年县'),(361128,361100,'鄱阳县'),(361127,361100,'余干县'),(654221,654200,'额敏县'),(654201,654200,'塔城市'),(654223,654200,'沙湾县'),(654202,654200,'乌苏市'),(654224,654200,'托里县'),(654225,654200,'裕民县'),(654226,654200,'和布克赛尔蒙古自治县'),(120102,120100,'河东区'),(120113,120100,'北辰区'),(120103,120100,'河西区'),(120114,120100,'武清区'),(120104,120100,'南开区'),(120115,120100,'宝坻区'),(120105,120100,'河北区'),(120116,120100,'滨海新区'),(120110,120100,'东丽区'),(120111,120100,'西青区'),(120101,120100,'和平区'),(120112,120100,'津南区'),(120106,120100,'红桥区'),(120117,120100,'宁河区'),(120118,120100,'静海区'),(120119,120100,'蓟州区'),(469007,469000,'东方市'),(469029,469000,'保亭黎族苗族自治县'),(469006,469000,'万宁市'),(469028,469000,'陵水黎族自治县'),(469005,469000,'文昌市'),(469027,469000,'乐东黎族自治县'),(469026,469000,'昌江黎族自治县'),(469025,469000,'白沙黎族自治县'),(469002,469000,'琼海市'),(469024,469000,'临高县'),(469001,469000,'五指山市'),(469023,469000,'澄迈县'),(469022,469000,'屯昌县'),(469021,469000,'定安县'),(469030,469000,'琼中黎族苗族自治县'),(321271,321200,'泰州医药高新技术产业开发区'),(321282,321200,'靖江市'),(321283,321200,'泰兴市'),(321281,321200,'兴化市'),(321204,321200,'姜堰区'),(321202,321200,'海陵区'),(321203,321200,'高港区'),(321111,321100,'润州区'),(321183,321100,'句容市'),(321181,321100,'丹阳市'),(321171,321100,'镇江新区'),(321182,321100,'扬中市'),(321112,321100,'丹徒区'),(321102,321100,'京口区'),(440804,440800,'坡头区'),(440803,440800,'霞山区'),(440825,440800,'徐闻县'),(440802,440800,'赤坎区'),(440823,440800,'遂溪县'),(440811,440800,'麻章区'),(440883,440800,'吴川市'),(440882,440800,'雷州市'),(440881,440800,'廉江市'),(623027,623000,'夏河县'),(623025,623000,'玛曲县'),(623026,623000,'碌曲县'),(623001,623000,'合作市'),(623023,623000,'舟曲县'),(623024,623000,'迭部县'),(623021,623000,'临潭县'),(623022,623000,'卓尼县'),(350105,350100,'马尾区'),(350128,350100,'平潭县'),(350121,350100,'闽侯县'),(350111,350100,'晋安区'),(350122,350100,'连江县'),(350112,350100,'长乐区'),(350123,350100,'罗源县'),(350102,350100,'鼓楼区'),(350124,350100,'闽清县'),(350103,350100,'台江区'),(350125,350100,'永泰县'),(350104,350100,'仓山区'),(350181,350100,'福清市'),(532801,532800,'景洪市'),(532823,532800,'勐腊县'),(532822,532800,'勐海县'),(530523,530500,'龙陵县'),(530502,530500,'隆阳区'),(530524,530500,'昌宁县'),(530521,530500,'施甸县'),(530581,530500,'腾冲市'),(632323,632300,'泽库县'),(632322,632300,'尖扎县'),(632321,632300,'同仁县'),(632324,632300,'河南蒙古族自治县'),(653130,653100,'巴楚县'),(653131,653100,'塔什库尔干塔吉克自治县'),(653121,653100,'疏附县'),(653122,653100,'疏勒县'),(653101,653100,'喀什市'),(653123,653100,'英吉沙县'),(653124,653100,'泽普县'),(653125,653100,'莎车县'),(653126,653100,'叶城县'),(653127,653100,'麦盖提县'),(653128,653100,'岳普湖县'),(653129,653100,'伽师县'),(630100,630000,'西宁市'),(630200,630000,'海东市'),(632300,630000,'黄南藏族自治州'),(632200,630000,'海北藏族自治州'),(632800,630000,'海西蒙古族藏族自治州'),(632700,630000,'玉树藏族自治州'),(632600,630000,'果洛藏族自治州'),(632500,630000,'海南藏族自治州'),(450602,450600,'港口区'),(450603,450600,'防城区'),(450621,450600,'上思县'),(450681,450600,'东兴市'),(710801,710800,'东区'),(710899,710800,'其它区'),(710803,710800,'香山区'),(710802,710800,'北区'),(540423,540400,'墨脱县'),(540402,540400,'巴宜区'),(540424,540400,'波密县'),(540425,540400,'察隅县'),(540426,540400,'朗县'),(540421,540400,'工布江达县'),(540422,540400,'米林县'),(441826,441800,'连南瑶族自治县'),(441803,441800,'清新区'),(441825,441800,'连山壮族瑶族自治县'),(441802,441800,'清城区'),(441823,441800,'阳山县'),(441821,441800,'佛冈县'),(441882,441800,'连州市'),(441881,441800,'英德市'),(46400105,460400,'兰洋镇'),(46400116,460400,'新州镇'),(46400106,460400,'光村镇'),(46400107,460400,'木棠镇'),(46400108,460400,'海头镇'),(46400101,460400,'和庆镇'),(46400112,460400,'白马井镇'),(46400102,460400,'南丰镇'),(46400113,460400,'中和镇'),(46400103,460400,'大成镇'),(46400114,460400,'排浦镇'),(46400499,460400,'洋浦经济开发区'),(46400104,460400,'雅星镇'),(46400115,460400,'东成镇'),(46400500,460400,'华南热作学院'),(46400109,460400,'峨蔓镇'),(46400100,460400,'那大镇'),(46400111,460400,'王五镇'),(331022,331000,'三门县'),(331081,331000,'温岭市'),(331082,331000,'临海市'),(331083,331000,'玉环市'),(331023,331000,'天台县'),(331002,331000,'椒江区'),(331024,331000,'仙居县'),(331003,331000,'黄岩区'),(331004,331000,'路桥区'),(361027,361000,'金溪县'),(361026,361000,'宜黄县'),(361003,361000,'东乡区'),(361025,361000,'乐安县'),(361002,361000,'临川区'),(361024,361000,'崇仁县'),(361023,361000,'南丰县'),(361022,361000,'黎川县'),(361021,361000,'南城县'),(361030,361000,'广昌县'),(361028,361000,'资溪县'),(321371,321300,'宿迁经济技术开发区'),(321323,321300,'泗阳县'),(321302,321300,'宿城区'),(321324,321300,'泗洪县'),(321311,321300,'宿豫区'),(321322,321300,'沭阳县'),(510903,510900,'船山区'),(510904,510900,'安居区'),(510923,510900,'大英县'),(510921,510900,'蓬溪县'),(510922,510900,'射洪县'),(440705,440700,'新会区'),(440704,440700,'江海区'),(440703,440700,'蓬江区'),(440785,440700,'恩平市'),(440784,440700,'鹤山市'),(440783,440700,'开平市'),(440781,440700,'台山市'),(430981,430900,'沅江市'),(430972,430900,'湖南益阳高新技术产业园区'),(430971,430900,'益阳市大通湖管理区'),(430921,430900,'南县'),(430923,430900,'安化县'),(430922,430900,'桃江县'),(430903,430900,'赫山区'),(430902,430900,'资阳区'),(350600,350000,'漳州市'),(350700,350000,'南平市'),(350800,350000,'龙岩市'),(350900,350000,'宁德市'),(350100,350000,'福州市'),(350200,350000,'厦门市'),(350300,350000,'莆田市'),(350400,350000,'三明市'),(350500,350000,'泉州市'),(331121,331100,'青田县'),(331181,331100,'龙泉市'),(331126,331100,'庆元县'),(331127,331100,'景宁畲族自治县'),(331122,331100,'缙云县'),(331123,331100,'遂昌县'),(331102,331100,'莲都区'),(331124,331100,'松阳县'),(331125,331100,'云和县'),(150902,150900,'集宁区'),(150924,150900,'兴和县'),(150923,150900,'商都县'),(150922,150900,'化德县'),(150921,150900,'卓资县'),(150981,150900,'丰镇市'),(150929,150900,'四子王旗'),(150928,150900,'察哈尔右翼后旗'),(150927,150900,'察哈尔右翼中旗'),(150926,150900,'察哈尔右翼前旗'),(150925,150900,'凉城县'),(530602,530600,'昭阳区'),(530624,530600,'大关县'),(530625,530600,'永善县'),(530622,530600,'巧家县'),(530623,530600,'盐津县'),(530621,530600,'鲁甸县'),(530681,530600,'水富市'),(530628,530600,'彝良县'),(530629,530600,'威信县'),(530626,530600,'绥江县'),(530627,530600,'镇雄县'),(532924,532900,'宾川县'),(532901,532900,'大理市'),(532923,532900,'祥云县'),(532922,532900,'漾濞彝族自治县'),(532932,532900,'鹤庆县'),(532931,532900,'剑川县'),(532930,532900,'洱源县'),(532929,532900,'云龙县'),(532928,532900,'永平县'),(532927,532900,'巍山彝族回族自治县'),(532926,532900,'南涧彝族自治县'),(532925,532900,'弥渡县'),(653022,653000,'阿克陶县'),(653001,653000,'阿图什市'),(653023,653000,'阿合奇县'),(653024,653000,'乌恰县'),(611026,611000,'柞水县'),(611025,611000,'镇安县'),(611002,611000,'商州区'),(611024,611000,'山阳县'),(611023,611000,'商南县'),(611022,611000,'丹凤县'),(611021,611000,'洛南县'),(632224,632200,'刚察县'),(632223,632200,'海晏县'),(632222,632200,'祁连县'),(632221,632200,'门源回族自治县'),(450503,450500,'银海区'),(450502,450500,'海城区'),(450521,450500,'合浦县'),(450512,450500,'铁山港区'),(320106,320100,'鼓楼区'),(320117,320100,'溧水区'),(320118,320100,'高淳区'),(320104,320100,'秦淮区'),(320115,320100,'江宁区'),(320105,320100,'建邺区'),(320116,320100,'六合区'),(320102,320100,'玄武区'),(320113,320100,'栖霞区'),(320114,320100,'雨花台区'),(320111,320100,'浦口区'),(540104,540100,'达孜区'),(540127,540100,'墨竹工卡县'),(540122,540100,'当雄县'),(540123,540100,'尼木县'),(540102,540100,'城关区'),(540124,540100,'曲水县'),(540103,540100,'堆龙德庆区'),(540173,540100,'西藏文化旅游创意园区'),(540174,540100,'达孜工业园区'),(540121,540100,'林周县'),(540171,540100,'格尔木藏青工业园区'),(540172,540100,'拉萨经济技术开发区'),(110105,110100,'朝阳区'),(110116,110100,'怀柔区'),(110106,110100,'丰台区'),(110117,110100,'平谷区'),(110114,110100,'昌平区'),(110115,110100,'大兴区'),(110101,110100,'东城区'),(110112,110100,'通州区'),(110102,110100,'西城区'),(110113,110100,'顺义区'),(110111,110100,'房山区'),(110109,110100,'门头沟区'),(110107,110100,'石景山区'),(110118,110100,'密云区'),(110108,110100,'海淀区'),(110119,110100,'延庆区'),(331000,330000,'台州市'),(330800,330000,'衢州市'),(330900,330000,'舟山市'),(330400,330000,'嘉兴市'),(330500,330000,'湖州市'),(330600,330000,'绍兴市'),(330700,330000,'金华市'),(331100,330000,'丽水市'),(330100,330000,'杭州市'),(330200,330000,'宁波市'),(330300,330000,'温州市'),(141081,141000,'侯马市'),(141082,141000,'霍州市'),(141030,141000,'大宁县'),(141021,141000,'曲沃县'),(141032,141000,'永和县'),(141031,141000,'隰县'),(141023,141000,'襄汾县'),(141034,141000,'汾西县'),(141022,141000,'翼城县'),(141033,141000,'蒲县'),(141025,141000,'古县'),(141002,141000,'尧都区'),(141024,141000,'洪洞县'),(141027,141000,'浮山县'),(141026,141000,'安泽县'),(141029,141000,'乡宁县'),(141028,141000,'吉县'),(654021,654000,'伊宁县'),(654022,654000,'察布查尔锡伯自治县'),(654023,654000,'霍城县'),(654002,654000,'伊宁市'),(654024,654000,'巩留县'),(654003,654000,'奎屯市'),(654025,654000,'新源县'),(654004,654000,'霍尔果斯市'),(654026,654000,'昭苏县'),(654027,654000,'特克斯县'),(654028,654000,'尼勒克县'),(411171,411100,'漯河经济技术开发区'),(411104,411100,'召陵区'),(411103,411100,'郾城区'),(411122,411100,'临颍县'),(411121,411100,'舞阳县'),(411102,411100,'源汇区'),(820100,820000,'澳门城区'),(510821,510800,'旺苍县'),(510802,510800,'利州区'),(510824,510800,'苍溪县'),(510811,510800,'昭化区'),(510822,510800,'青川县'),(510812,510800,'朝天区'),(510823,510800,'剑阁县'),(130100,130000,'石家庄市'),(131100,130000,'衡水市'),(131000,130000,'廊坊市'),(130400,130000,'邯郸市'),(130500,130000,'邢台市'),(130200,130000,'唐山市'),(130300,130000,'秦皇岛市'),(130800,130000,'承德市'),(130900,130000,'沧州市'),(130600,130000,'保定市'),(130700,130000,'张家口市'),(520521,520500,'大方县'),(520522,520500,'黔西县'),(520523,520500,'金沙县'),(520502,520500,'七星关区'),(520524,520500,'织金县'),(520525,520500,'纳雍县'),(520526,520500,'威宁彝族回族苗族自治县'),(520527,520500,'赫章县'),(445122,445100,'饶平县'),(445103,445100,'潮安区'),(445102,445100,'湘桥区'),(450804,450800,'覃塘区'),(450803,450800,'港南区'),(450821,450800,'平南县'),(450802,450800,'港北区'),(450881,450800,'桂平市'),(532627,532600,'广南县'),(532626,532600,'丘北县'),(532625,532600,'马关县'),(532624,532600,'麻栗坡县'),(532601,532600,'文山市'),(532623,532600,'西畴县'),(532622,532600,'砚山县'),(532628,532600,'富宁县'),(530303,530300,'沾益区'),(530325,530300,'富源县'),(530304,530300,'马龙区'),(530326,530300,'会泽县'),(530323,530300,'师宗县'),(530302,530300,'麒麟区'),(530324,530300,'罗平县'),(530322,530300,'陆良县'),(530381,530300,'宣威市'),(341021,341000,'歙县'),(341002,341000,'屯溪区'),(341024,341000,'祁门县'),(341003,341000,'黄山区'),(341022,341000,'休宁县'),(341023,341000,'黟县'),(341004,341000,'徽州区'),(230904,230900,'茄子河区'),(230903,230900,'桃山区'),(230902,230900,'新兴区'),(230921,230900,'勃利县'),(320281,320200,'江阴市'),(320282,320200,'宜兴市'),(320205,320200,'锡山区'),(320206,320200,'惠山区'),(320214,320200,'新吴区'),(320213,320200,'梁溪区'),(320211,320200,'滨湖区'),(131123,131100,'武强县'),(131122,131100,'武邑县'),(131121,131100,'枣强县'),(131127,131100,'景县'),(131126,131100,'故城县'),(131103,131100,'冀州区'),(131125,131100,'安平县'),(131102,131100,'桃城区'),(131124,131100,'饶阳县'),(131128,131100,'阜城县'),(131172,131100,'衡水滨湖新区'),(131171,131100,'河北衡水高新技术产业开发区'),(131182,131100,'深州市'),(540225,540200,'拉孜县'),(540236,540200,'萨嘎县'),(540226,540200,'昂仁县'),(540237,540200,'岗巴县'),(540227,540200,'谢通门县'),(540228,540200,'白朗县'),(540221,540200,'南木林县'),(540232,540200,'仲巴县'),(540222,540200,'江孜县'),(540233,540200,'亚东县'),(540223,540200,'定日县'),(540234,540200,'吉隆县'),(540202,540200,'桑珠孜区'),(540224,540200,'萨迦县'),(540235,540200,'聂拉木县'),(540229,540200,'仁布县'),(540230,540200,'康马县'),(540231,540200,'定结县'),(542525,542500,'革吉县'),(542524,542500,'日土县'),(542527,542500,'措勤县'),(542526,542500,'改则县'),(542521,542500,'普兰县'),(542523,542500,'噶尔县'),(542522,542500,'札达县'),(330108,330100,'滨江区'),(330109,330100,'萧山区'),(330103,330100,'下城区'),(330104,330100,'江干区'),(330105,330100,'拱墅区'),(330127,330100,'淳安县'),(330106,330100,'西湖区'),(330110,330100,'余杭区'),(330111,330100,'富阳区'),(330122,330100,'桐庐县'),(330112,330100,'临安区'),(330102,330100,'上城区'),(330182,330100,'建德市'),(120100,120000,'天津城区'),(610300,610000,'宝鸡市'),(610400,610000,'咸阳市'),(610100,610000,'西安市'),(610200,610000,'铜川市'),(611000,610000,'商洛市'),(610900,610000,'安康市'),(610700,610000,'汉中市'),(610800,610000,'榆林市'),(610500,610000,'渭南市'),(610600,610000,'延安市'),(411081,411000,'禹州市'),(411071,411000,'许昌经济技术开发区'),(411082,411000,'长葛市'),(411003,411000,'建安区'),(411025,411000,'襄城县'),(411002,411000,'魏都区'),(411024,411000,'鄢陵县'),(510705,510700,'安州区'),(510727,510700,'平武县'),(510781,510700,'江油市'),(510722,510700,'三台县'),(510723,510700,'盐亭县'),(510704,510700,'游仙区'),(510726,510700,'北川羌族自治县'),(510703,510700,'涪城区'),(510725,510700,'梓潼县'),(820107,820100,'路凼填海区'),(820108,820100,'圣方济各堂区'),(820105,820100,'风顺堂区'),(820106,820100,'嘉模堂区'),(820103,820100,'望德堂区'),(820104,820100,'大堂区'),(820101,820100,'花地玛堂区'),(820102,820100,'花王堂区'),(440904,440900,'电白区'),(440902,440900,'茂南区'),(440983,440900,'信宜市'),(440982,440900,'化州市'),(440981,440900,'高州市'),(621002,621000,'西峰区'),(621024,621000,'合水县'),(621023,621000,'华池县'),(621026,621000,'宁县'),(621025,621000,'正宁县'),(621022,621000,'环县'),(621021,621000,'庆城县'),(621027,621000,'镇原县'),(520627,520600,'沿河土家族自治县'),(520628,520600,'松桃苗族自治县'),(520621,520600,'江口县'),(520622,520600,'玉屏侗族自治县'),(520623,520600,'石阡县'),(520602,520600,'碧江区'),(520624,520600,'思南县'),(520603,520600,'万山区'),(520625,520600,'印江土家族苗族自治县'),(520626,520600,'德江县'),(530426,530400,'峨山彝族自治县'),(530427,530400,'新平彝族傣族自治县'),(530402,530400,'红塔区'),(530424,530400,'华宁县'),(530403,530400,'江川区'),(530425,530400,'易门县'),(530422,530400,'澄江县'),(530423,530400,'通海县'),(530428,530400,'元江哈尼族彝族傣族自治县'),(450722,450700,'浦北县'),(450703,450700,'钦北区'),(450702,450700,'钦南区'),(450721,450700,'灵山县'),(341181,341100,'天长市'),(341171,341100,'苏滁现代产业园'),(341182,341100,'明光市'),(341172,341100,'滁州经济技术开发区'),(341102,341100,'琅琊区'),(341124,341100,'全椒县'),(341122,341100,'来安县'),(341103,341100,'南谯区'),(341125,341100,'定远县'),(341126,341100,'凤阳县'),(320371,320300,'徐州经济技术开发区'),(320382,320300,'邳州市'),(320381,320300,'新沂市'),(320305,320300,'贾汪区'),(320302,320300,'鼓楼区'),(320324,320300,'睢宁县'),(320303,320300,'云龙区'),(320311,320300,'泉山区'),(320322,320300,'沛县'),(320312,320300,'铜山区'),(320321,320300,'丰县'),(230883,230800,'抚远市'),(230882,230800,'富锦市'),(230881,230800,'同江市'),(230828,230800,'汤原县'),(230805,230800,'东风区'),(230804,230800,'前进区'),(230826,230800,'桦川县'),(230803,230800,'向阳区'),(230811,230800,'郊区'),(230822,230800,'桦南县'),(511971,511900,'巴中经济开发区'),(511921,511900,'通江县'),(511902,511900,'巴州区'),(511903,511900,'恩阳区'),(511922,511900,'南江县'),(511923,511900,'平昌县');
/*!40000 ALTER TABLE `wk_crm_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_back_log_deal`
--

DROP TABLE IF EXISTS `wk_crm_back_log_deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_back_log_deal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` int(11) NOT NULL COMMENT '待办事项模块 1今日需联系客户 2分配给我的线索 3分配给我的客户 4待进入公海的客户 5待审核合同 6待审核回款 7待回款提醒 8即将到期的合同 9待回访合同 10待审核发票',
  `crm_type` int(11) NOT NULL COMMENT '数据模块 1线索 2客户 3联系人 4产品 5商机  6合同  7回款  8回款计划 9公海 10市场活动  17客户回访 18发票 0null  ',
  `type_id` int(11) NOT NULL COMMENT '待办事项ID',
  `pool_id` int(11) DEFAULT NULL COMMENT '公海id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='待办事项已处理标记表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_back_log_deal`
--

LOCK TABLES `wk_crm_back_log_deal` WRITE;
/*!40000 ALTER TABLE `wk_crm_back_log_deal` DISABLE KEYS */;
INSERT INTO `wk_crm_back_log_deal` VALUES (1,5,6,1,NULL,'2024-09-19 15:07:58',14773);
/*!40000 ALTER TABLE `wk_crm_back_log_deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_business`
--

DROP TABLE IF EXISTS `wk_crm_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_business` (
  `business_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL COMMENT '商机状态组',
  `status_id` int(11) DEFAULT NULL COMMENT '销售阶段',
  `next_time` datetime DEFAULT NULL COMMENT '下次联系时间',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `contacts_id` int(11) DEFAULT NULL COMMENT '首要联系人ID',
  `deal_date` datetime DEFAULT NULL COMMENT '预计成交日期',
  `business_name` varchar(255) NOT NULL COMMENT '商机名称',
  `money` decimal(18,2) DEFAULT NULL COMMENT '商机金额',
  `discount_rate` decimal(10,2) DEFAULT NULL COMMENT '整单折扣',
  `total_price` decimal(17,2) DEFAULT NULL COMMENT '产品总金额',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `owner_user_id` bigint(20) DEFAULT NULL COMMENT '负责人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `batch_id` varchar(32) DEFAULT NULL COMMENT '批次 比如附件批次',
  `ro_user_id` longtext CHARACTER SET utf8mb4 COMMENT '只读权限',
  `rw_user_id` longtext COMMENT '读写权限',
  `is_end` int(11) NOT NULL DEFAULT '0' COMMENT '1赢单2输单3无效',
  `status_remark` varchar(500) DEFAULT '' COMMENT '状态备注',
  `status` int(11) DEFAULT '1' COMMENT '1正常 3  删除',
  `last_time` datetime DEFAULT NULL COMMENT '最后跟进时间',
  `followup` int(11) DEFAULT NULL COMMENT '0 未跟进 1 已跟进',
  PRIMARY KEY (`business_id`) USING BTREE,
  KEY `owner_user_id` (`owner_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商机表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_business`
--

LOCK TABLES `wk_crm_business` WRITE;
/*!40000 ALTER TABLE `wk_crm_business` DISABLE KEYS */;
INSERT INTO `wk_crm_business` VALUES (1,12366,47645,NULL,2,NULL,'2024-10-19 00:00:00','大学生毕业设计',100000.00,0.00,100000.00,'',14773,14773,'2024-09-18 21:32:02','2024-09-18 21:32:02','20332089da69449bbaafa17d77b64daf',NULL,NULL,0,'',1,NULL,NULL),(2,12366,47643,NULL,3,NULL,'2024-10-21 00:00:00','001',977.33,1.00,977.33,'001',14773,14773,'2024-10-21 08:33:53','2024-10-21 08:33:53','dbe9702467ba4367b1bfd7802c18d1a4',NULL,NULL,0,'',1,NULL,NULL),(3,12366,47643,NULL,2,NULL,'2024-10-21 11:00:30','002',9900.00,1.00,9900.00,'002',14773,14773,'2024-10-21 11:00:59',NULL,'9eaa29635f6e43d1a5ebb601ac414550',NULL,NULL,0,'',1,NULL,NULL),(4,12366,47643,NULL,3,NULL,'2024-10-21 11:14:22','004',9900.00,1.00,9900.00,'',14773,14773,'2024-10-21 11:14:34',NULL,'a9c6bc96d0354a00951afa3a2af3a95c',NULL,NULL,0,'',1,NULL,NULL);
/*!40000 ALTER TABLE `wk_crm_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_business_change`
--

DROP TABLE IF EXISTS `wk_crm_business_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_business_change` (
  `change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '变化id',
  `business_id` int(11) NOT NULL COMMENT '商机ID',
  `status_id` int(11) NOT NULL COMMENT '阶段ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  PRIMARY KEY (`change_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商机阶段变化表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_business_change`
--

LOCK TABLES `wk_crm_business_change` WRITE;
/*!40000 ALTER TABLE `wk_crm_business_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_business_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_business_data`
--

DROP TABLE IF EXISTS `wk_crm_business_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_business_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `field_id` int(11) NOT NULL COMMENT '字段id',
  `name` varchar(255) NOT NULL COMMENT '字段名称',
  `value` longtext COMMENT '字段值',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `batch_id` (`batch_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商机扩展字段数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_business_data`
--

LOCK TABLES `wk_crm_business_data` WRITE;
/*!40000 ALTER TABLE `wk_crm_business_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_business_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_business_product`
--

DROP TABLE IF EXISTS `wk_crm_business_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_business_product` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL COMMENT '商机ID',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `price` decimal(18,2) NOT NULL COMMENT '产品单价',
  `sales_price` decimal(18,2) NOT NULL COMMENT '销售价格',
  `num` decimal(10,2) NOT NULL COMMENT '数量',
  `discount` int(11) NOT NULL COMMENT '折扣',
  `subtotal` decimal(18,2) NOT NULL COMMENT '小计（折扣后价格）',
  `unit` varchar(50) DEFAULT '' COMMENT '商品单位',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商机产品关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_business_product`
--

LOCK TABLES `wk_crm_business_product` WRITE;
/*!40000 ALTER TABLE `wk_crm_business_product` DISABLE KEYS */;
INSERT INTO `wk_crm_business_product` VALUES (2,1,2,10000.00,10000.00,10.00,0,100000.00,'个'),(3,2,1,987.20,987.20,1.00,0,987.20,'个'),(4,3,2,10000.00,10000.00,1.00,0,10000.00,'个'),(5,4,2,10000.00,10000.00,1.00,0,10000.00,'个');
/*!40000 ALTER TABLE `wk_crm_business_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_business_status`
--

DROP TABLE IF EXISTS `wk_crm_business_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_business_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL COMMENT '商机状态类别ID',
  `name` varchar(50) NOT NULL COMMENT '标识',
  `rate` varchar(20) DEFAULT NULL COMMENT '赢单率',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`status_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47646 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商机状态';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_business_status`
--

LOCK TABLES `wk_crm_business_status` WRITE;
/*!40000 ALTER TABLE `wk_crm_business_status` DISABLE KEYS */;
INSERT INTO `wk_crm_business_status` VALUES (47643,12366,'验证客户','20',1),(47644,12366,'需求分析','30',2),(47645,12366,'方案/报价','80',3);
/*!40000 ALTER TABLE `wk_crm_business_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_business_type`
--

DROP TABLE IF EXISTS `wk_crm_business_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_business_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '标识',
  `dept_ids` varchar(255) NOT NULL COMMENT '部门ID',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0禁用1启用2删除',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12367 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商机状态组类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_business_type`
--

LOCK TABLES `wk_crm_business_type` WRITE;
/*!40000 ALTER TABLE `wk_crm_business_type` DISABLE KEYS */;
INSERT INTO `wk_crm_business_type` VALUES (12366,'销售流程商机组','',3,'2019-05-11 16:25:09',NULL,1);
/*!40000 ALTER TABLE `wk_crm_business_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_business_user_star`
--

DROP TABLE IF EXISTS `wk_crm_business_user_star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_business_user_star` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `business_id` int(11) NOT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`business_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户-商机关系表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_business_user_star`
--

LOCK TABLES `wk_crm_business_user_star` WRITE;
/*!40000 ALTER TABLE `wk_crm_business_user_star` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_business_user_star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_contacts`
--

DROP TABLE IF EXISTS `wk_crm_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_contacts` (
  `contacts_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '联系人名称',
  `next_time` datetime DEFAULT NULL COMMENT '下次联系时间',
  `mobile` varchar(255) DEFAULT '' COMMENT '手机',
  `telephone` varchar(255) DEFAULT '' COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮箱',
  `post` varchar(255) DEFAULT NULL COMMENT '职务',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `address` varchar(500) DEFAULT '' COMMENT '地址',
  `remark` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `owner_user_id` bigint(20) DEFAULT NULL COMMENT '负责人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次',
  `last_time` datetime DEFAULT NULL COMMENT '最后跟进时间',
  PRIMARY KEY (`contacts_id`) USING BTREE,
  KEY `owner_user_id` (`owner_user_id`) USING BTREE,
  KEY `customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='联系人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_contacts`
--

LOCK TABLES `wk_crm_contacts` WRITE;
/*!40000 ALTER TABLE `wk_crm_contacts` DISABLE KEYS */;
INSERT INTO `wk_crm_contacts` VALUES (2,'刘嘉明','2024-09-18 20:33:29','14767815683','14767815683',NULL,'',1,'','',14773,NULL,'2024-09-18 20:33:34','2024-09-18 20:33:34','23cf342fcf8e43c483ec4b9f31b860c2',NULL),(3,'王明源',NULL,'14767815683','',NULL,'',2,'','',14773,14773,'2024-09-18 21:26:16','2024-09-18 21:26:16','c0ba5951563f435495f3b663eb301655',NULL);
/*!40000 ALTER TABLE `wk_crm_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_contacts_business`
--

DROP TABLE IF EXISTS `wk_crm_contacts_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_contacts_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `business_id` int(11) NOT NULL COMMENT '商机id',
  `contacts_id` int(11) NOT NULL COMMENT '联系人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商机联系人关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_contacts_business`
--

LOCK TABLES `wk_crm_contacts_business` WRITE;
/*!40000 ALTER TABLE `wk_crm_contacts_business` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_contacts_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_contacts_data`
--

DROP TABLE IF EXISTS `wk_crm_contacts_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_contacts_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL COMMENT '字段id',
  `name` varchar(255) NOT NULL COMMENT '字段名称',
  `value` longtext COMMENT '字段值',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `batch_id` (`batch_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='联系人扩展字段数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_contacts_data`
--

LOCK TABLES `wk_crm_contacts_data` WRITE;
/*!40000 ALTER TABLE `wk_crm_contacts_data` DISABLE KEYS */;
INSERT INTO `wk_crm_contacts_data` VALUES (3,1101853,'policymakers','','2024-09-18 20:33:33','23cf342fcf8e43c483ec4b9f31b860c2'),(4,1101857,'sex','男','2024-09-18 20:33:33','23cf342fcf8e43c483ec4b9f31b860c2'),(5,1101853,'policymakers','是','2024-09-18 21:26:16','c0ba5951563f435495f3b663eb301655'),(6,1101857,'sex','男','2024-09-18 21:26:16','c0ba5951563f435495f3b663eb301655');
/*!40000 ALTER TABLE `wk_crm_contacts_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_contacts_user_star`
--

DROP TABLE IF EXISTS `wk_crm_contacts_user_star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_contacts_user_star` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `contacts_id` int(11) NOT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`contacts_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户-联系人关注表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_contacts_user_star`
--

LOCK TABLES `wk_crm_contacts_user_star` WRITE;
/*!40000 ALTER TABLE `wk_crm_contacts_user_star` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_contacts_user_star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_contract`
--

DROP TABLE IF EXISTS `wk_crm_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_contract` (
  `contract_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '合同编号',
  `name` varchar(100) DEFAULT NULL COMMENT '合同名称',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `business_id` int(11) DEFAULT NULL COMMENT '商机ID',
  `check_status` int(11) NOT NULL DEFAULT '0' COMMENT '0待审核、1通过、2拒绝、3审核中 4:撤回 5 未提交 6 创建 7 已删除 8 作废',
  `examine_record_id` int(11) DEFAULT NULL COMMENT '审核记录ID',
  `order_date` datetime DEFAULT NULL COMMENT '下单日期',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `owner_user_id` bigint(20) DEFAULT NULL COMMENT '负责人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `num` varchar(255) DEFAULT NULL COMMENT '合同编号',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `money` decimal(18,2) DEFAULT NULL COMMENT '合同金额',
  `discount_rate` decimal(10,2) DEFAULT NULL COMMENT '整单折扣',
  `total_price` decimal(17,2) DEFAULT NULL COMMENT '产品总金额',
  `types` varchar(255) DEFAULT NULL COMMENT '合同类型',
  `payment_type` varchar(255) DEFAULT NULL COMMENT '付款方式',
  `batch_id` varchar(32) NOT NULL COMMENT '批次 比如附件批次',
  `ro_user_id` longtext COMMENT '只读权限',
  `rw_user_id` longtext COMMENT '读写权限',
  `contacts_id` int(11) DEFAULT NULL COMMENT '客户签约人（联系人id）',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `company_user_id` varchar(255) DEFAULT NULL COMMENT '公司签约人',
  `last_time` datetime DEFAULT NULL COMMENT '最后跟进时间',
  `received_money` decimal(17,2) DEFAULT '0.00' COMMENT '收到的钱',
  `unreceived_money` decimal(17,2) DEFAULT NULL COMMENT '未收到的钱',
  `old_contract_id` int(11) DEFAULT NULL COMMENT '旧合同编号',
  PRIMARY KEY (`contract_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='合同表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_contract`
--

LOCK TABLES `wk_crm_contract` WRITE;
/*!40000 ALTER TABLE `wk_crm_contract` DISABLE KEYS */;
INSERT INTO `wk_crm_contract` VALUES (1,'佛山大学计算机专业毕业设计',2,1,1,1004974,'2024-09-18 00:00:00',14773,14773,'2024-09-18 21:34:27','2024-09-18 21:34:27','000001','2024-09-18 00:00:00','2024-09-18 00:00:00',100000.00,0.00,100000.00,NULL,NULL,'daa6c07efb724b9884bda394e5fc7c05',NULL,NULL,3,'','14773',NULL,0.00,100000.00,NULL);
/*!40000 ALTER TABLE `wk_crm_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_contract_data`
--

DROP TABLE IF EXISTS `wk_crm_contract_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_contract_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL COMMENT '字段ID',
  `name` varchar(255) NOT NULL COMMENT '字段名称',
  `value` longtext COMMENT '字段值',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `batch_id` (`batch_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='合同扩展字段数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_contract_data`
--

LOCK TABLES `wk_crm_contract_data` WRITE;
/*!40000 ALTER TABLE `wk_crm_contract_data` DISABLE KEYS */;
INSERT INTO `wk_crm_contract_data` VALUES (1,1101880,'fliedXucqai','直销合同','2024-09-18 21:34:26','daa6c07efb724b9884bda394e5fc7c05');
/*!40000 ALTER TABLE `wk_crm_contract_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_contract_product`
--

DROP TABLE IF EXISTS `wk_crm_contract_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_contract_product` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL COMMENT '合同ID',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `price` decimal(18,2) NOT NULL COMMENT '产品单价',
  `sales_price` decimal(18,2) NOT NULL COMMENT '销售价格',
  `num` decimal(10,2) NOT NULL COMMENT '数量',
  `discount` decimal(18,4) NOT NULL COMMENT '折扣',
  `subtotal` decimal(18,2) NOT NULL COMMENT '小计（折扣后价格）',
  `unit` varchar(50) DEFAULT '' COMMENT '单位',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='合同产品关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_contract_product`
--

LOCK TABLES `wk_crm_contract_product` WRITE;
/*!40000 ALTER TABLE `wk_crm_contract_product` DISABLE KEYS */;
INSERT INTO `wk_crm_contract_product` VALUES (1,1,2,10000.00,10000.00,10.00,0.0000,100000.00,'个');
/*!40000 ALTER TABLE `wk_crm_contract_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_customer`
--

DROP TABLE IF EXISTS `wk_crm_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户名称',
  `followup` int(11) DEFAULT NULL COMMENT '跟进状态 0未跟进1已跟进',
  `is_lock` int(11) NOT NULL DEFAULT '0' COMMENT '1锁定',
  `next_time` datetime DEFAULT NULL COMMENT '下次联系时间',
  `deal_status` int(11) DEFAULT '0' COMMENT '成交状态 0 未成交 1 已成交',
  `deal_time` datetime DEFAULT NULL COMMENT '成交时间',
  `contacts_id` int(11) DEFAULT NULL COMMENT '首要联系人ID',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
  `telephone` varchar(255) DEFAULT '' COMMENT '电话',
  `website` varchar(500) DEFAULT '' COMMENT '网址',
  `email` varchar(225) DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(3000) DEFAULT '' COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `owner_user_id` bigint(20) DEFAULT NULL COMMENT '负责人ID',
  `ro_user_id` longtext COMMENT '只读权限',
  `rw_user_id` longtext COMMENT '读写权限',
  `address` varchar(255) DEFAULT '' COMMENT '省市区',
  `location` varchar(255) DEFAULT '' COMMENT '定位信息',
  `detail_address` varchar(255) DEFAULT '' COMMENT '详细地址',
  `lng` varchar(255) DEFAULT '' COMMENT '地理位置经度',
  `lat` varchar(255) DEFAULT '' COMMENT '地理位置维度',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次 比如附件批次',
  `status` int(11) DEFAULT '1' COMMENT '客户状态 1 正常 2锁定 3删除',
  `last_time` datetime DEFAULT NULL COMMENT '最后跟进时间',
  `pool_time` datetime DEFAULT NULL COMMENT '放入公海时间',
  `is_receive` int(11) DEFAULT NULL COMMENT '1 分配 2 领取',
  `last_content` varchar(1024) DEFAULT NULL COMMENT '最后一条跟进记录',
  `receive_time` datetime DEFAULT NULL COMMENT '接收到客户时间',
  `pre_owner_user_id` bigint(20) DEFAULT NULL COMMENT '进入公海前负责人id',
  PRIMARY KEY (`customer_id`) USING BTREE,
  KEY `update_time` (`update_time`) USING BTREE,
  KEY `owner_user_id` (`owner_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_customer`
--

LOCK TABLES `wk_crm_customer` WRITE;
/*!40000 ALTER TABLE `wk_crm_customer` DISABLE KEYS */;
INSERT INTO `wk_crm_customer` VALUES (1,'刘嘉明',NULL,0,'2024-09-18 20:32:39',0,NULL,2,'14767815683','14767815683','',NULL,'',14773,NULL,NULL,NULL,'广东省,湛江市,遂溪县','','','','','2024-09-18 20:33:01','2024-09-18 20:33:01','e17ead83efe04001b8a0b2663e0715e8',1,'2024-09-18 20:33:01','2024-09-19 21:42:38',NULL,NULL,'2024-09-18 20:33:01',14773),(2,'王书记',NULL,0,NULL,1,'2024-09-18 00:00:00',3,'14767815683','14767815683','',NULL,'',14773,14773,NULL,NULL,'广东省,广州市,白云区','','','','','2024-09-18 21:25:41','2024-09-18 21:25:41','a1abc32e50c541aea046690a056f31b3',1,'2024-09-18 21:25:41',NULL,NULL,NULL,'2024-09-18 21:25:41',NULL),(3,'徐铭璟',0,0,'2024-09-20 21:05:38',0,NULL,NULL,'14767815683','14767815683','','3257715328@qq.com','喜欢学java',14773,14773,NULL,NULL,'广东省,佛山市,南海区','','广东佛山','','','2024-09-20 21:06:51','2024-09-20 21:35:53','8e826b58b3e0496d80fd6c9527996e3b',1,'2024-09-20 21:06:51','2024-09-20 21:35:00',2,NULL,'2024-09-20 21:35:53',14773);
/*!40000 ALTER TABLE `wk_crm_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_customer_data`
--

DROP TABLE IF EXISTS `wk_crm_customer_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_customer_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL COMMENT '字段id',
  `name` varchar(255) NOT NULL COMMENT '字段名称',
  `value` longtext COMMENT '字段值',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `batch_id` (`batch_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户扩展字段数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_customer_data`
--

LOCK TABLES `wk_crm_customer_data` WRITE;
/*!40000 ALTER TABLE `wk_crm_customer_data` DISABLE KEYS */;
INSERT INTO `wk_crm_customer_data` VALUES (1,1101828,'source','广告','2024-09-18 20:33:01','e17ead83efe04001b8a0b2663e0715e8'),(2,1101832,'industry','IT','2024-09-18 20:33:01','e17ead83efe04001b8a0b2663e0715e8'),(3,1101833,'level','B（普通客户）','2024-09-18 20:33:01','e17ead83efe04001b8a0b2663e0715e8'),(4,1101828,'source','搜索引擎','2024-09-18 21:25:40','a1abc32e50c541aea046690a056f31b3'),(5,1101832,'industry','政府','2024-09-18 21:25:40','a1abc32e50c541aea046690a056f31b3'),(6,1101833,'level','A（重点客户）','2024-09-18 21:25:40','a1abc32e50c541aea046690a056f31b3'),(7,1101828,'source','转介绍','2024-09-20 21:06:51','8e826b58b3e0496d80fd6c9527996e3b'),(8,1101832,'industry','金融业','2024-09-20 21:06:51','8e826b58b3e0496d80fd6c9527996e3b'),(9,1101833,'level','A（重点客户）','2024-09-20 21:06:51','8e826b58b3e0496d80fd6c9527996e3b');
/*!40000 ALTER TABLE `wk_crm_customer_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_customer_pool`
--

DROP TABLE IF EXISTS `wk_crm_customer_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_customer_pool` (
  `pool_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公海id',
  `pool_name` varchar(255) NOT NULL COMMENT '公海名称',
  `admin_user_id` longtext NOT NULL COMMENT '管理员 “,”分割',
  `member_user_id` longtext COMMENT '公海规则员工成员 “,”分割',
  `member_dept_id` longtext COMMENT '公海规则部门成员 “,”分割',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态 0 停用 1启用',
  `pre_owner_setting` int(11) NOT NULL COMMENT '前负责人领取规则 0不限制 1限制',
  `pre_owner_setting_day` int(11) DEFAULT NULL COMMENT '前负责人领取规则限制天数',
  `receive_setting` int(11) NOT NULL COMMENT '是否限制领取频率 0不限制 1限制',
  `receive_num` int(11) DEFAULT NULL COMMENT '领取频率规则',
  `remind_setting` int(11) NOT NULL COMMENT '是否设置提前提醒 0不开启 1开启',
  `remind_day` int(11) DEFAULT NULL COMMENT '提醒规则天数',
  `put_in_rule` int(11) NOT NULL COMMENT '收回规则 0不自动收回 1自动收回',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`pool_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34554 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='公海表(公共客户池)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_customer_pool`
--

LOCK TABLES `wk_crm_customer_pool` WRITE;
/*!40000 ALTER TABLE `wk_crm_customer_pool` DISABLE KEYS */;
INSERT INTO `wk_crm_customer_pool` VALUES (34552,'系统默认公海','14773','14773','',1,0,NULL,0,NULL,0,NULL,0,0,'2019-06-30 18:13:08'),(34553,'软件公海','14773','14773',NULL,1,0,NULL,0,NULL,0,NULL,0,0,'2024-09-20 21:21:42');
/*!40000 ALTER TABLE `wk_crm_customer_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_customer_pool_field_setting`
--

DROP TABLE IF EXISTS `wk_crm_customer_pool_field_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_customer_pool_field_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `pool_id` int(11) NOT NULL COMMENT '公海id',
  `field_id` int(11) DEFAULT NULL COMMENT '字段id',
  `name` varchar(255) NOT NULL COMMENT '字段中文名称',
  `field_name` varchar(255) NOT NULL COMMENT '字段名称',
  `type` int(11) NOT NULL COMMENT '字段类型 1 单行文本 2 多行文本 3 单选 4日期 5 数字 6 小数 7 手机  8 文件 9 多选 10 人员 11 附件 12 部门 13 日期时间 14 邮箱 15客户 16 商机 17 联系人 18 地图 19 产品类型 20 合同 21 回款计划',
  `is_hidden` int(11) NOT NULL DEFAULT '0' COMMENT '是否隐藏 0不隐藏 1隐藏',
  PRIMARY KEY (`setting_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=439856 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='公海列表页字段设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_customer_pool_field_setting`
--

LOCK TABLES `wk_crm_customer_pool_field_setting` WRITE;
/*!40000 ALTER TABLE `wk_crm_customer_pool_field_setting` DISABLE KEYS */;
INSERT INTO `wk_crm_customer_pool_field_setting` VALUES (439842,34552,1101827,'客户名称','customerName',1,0),(439843,34552,1101829,'手机','mobile',7,0),(439844,34552,1101830,'电话','telephone',1,0),(439845,34552,1101831,'网址','website',1,0),(439846,34552,1101834,'下次联系时间','nextTime',13,0),(439847,34552,1101835,'备注','remark',1,0),(439848,34552,1101833,'客户级别','level',3,0),(439849,34552,1101828,'客户来源','source',3,0),(439850,34552,1101832,'客户行业','industry',3,0),(439851,34552,NULL,'成交状态','dealStatus',3,0),(439852,34552,NULL,'最后跟进时间','lastTime',4,0),(439853,34552,NULL,'更新时间','updateTime',4,0),(439854,34552,NULL,'创建时间','createTime',4,0),(439855,34552,NULL,'创建人','createUserName',1,0);
/*!40000 ALTER TABLE `wk_crm_customer_pool_field_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_customer_pool_field_sort`
--

DROP TABLE IF EXISTS `wk_crm_customer_pool_field_sort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_customer_pool_field_sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pool_id` int(11) NOT NULL COMMENT '公海id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `field_id` int(11) DEFAULT NULL COMMENT '字段id',
  `field_name` varchar(255) NOT NULL COMMENT '字段名称',
  `name` varchar(255) NOT NULL COMMENT '字段中文名称',
  `type` int(11) NOT NULL COMMENT '字段类型 1 单行文本 2 多行文本 3 单选 4日期 5 数字 6 小数 7 手机  8 文件 9 多选 10 人员 11 附件 12 部门 13 日期时间 14 邮箱 15客户 16 商机 17 联系人 18 地图 19 产品类型 20 合同 21 回款计划',
  `sort` int(11) NOT NULL COMMENT '字段排序',
  `is_hidden` int(11) NOT NULL COMMENT '是否隐藏 0、不隐藏 1、隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='公海列表页字段排序表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_customer_pool_field_sort`
--

LOCK TABLES `wk_crm_customer_pool_field_sort` WRITE;
/*!40000 ALTER TABLE `wk_crm_customer_pool_field_sort` DISABLE KEYS */;
INSERT INTO `wk_crm_customer_pool_field_sort` VALUES (1,34552,14773,1101827,'customerName','客户名称',1,0,0),(2,34552,14773,1101829,'mobile','手机',7,1,0),(3,34552,14773,1101830,'telephone','电话',1,2,0),(4,34552,14773,1101831,'website','网址',1,3,0),(5,34552,14773,1101834,'nextTime','下次联系时间',13,4,0),(6,34552,14773,1101835,'remark','备注',1,5,0),(7,34552,14773,1101833,'level','客户级别',3,6,0),(8,34552,14773,1101828,'source','客户来源',3,7,0),(9,34552,14773,1101832,'industry','客户行业',3,8,0),(10,34552,14773,NULL,'dealStatus','成交状态',3,9,0),(11,34552,14773,NULL,'lastTime','最后跟进时间',4,10,0),(12,34552,14773,NULL,'updateTime','更新时间',4,11,0),(13,34552,14773,NULL,'createTime','创建时间',4,12,0),(14,34552,14773,NULL,'createUserName','创建人',1,13,0);
/*!40000 ALTER TABLE `wk_crm_customer_pool_field_sort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_customer_pool_field_style`
--

DROP TABLE IF EXISTS `wk_crm_customer_pool_field_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_customer_pool_field_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pool_id` int(11) NOT NULL COMMENT '公海id',
  `style` int(11) NOT NULL COMMENT '字段宽度',
  `field_name` varchar(255) NOT NULL COMMENT '字段名称',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='公海列表页字段样式表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_customer_pool_field_style`
--

LOCK TABLES `wk_crm_customer_pool_field_style` WRITE;
/*!40000 ALTER TABLE `wk_crm_customer_pool_field_style` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_customer_pool_field_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_customer_pool_relation`
--

DROP TABLE IF EXISTS `wk_crm_customer_pool_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_customer_pool_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `pool_id` int(11) NOT NULL COMMENT '公海id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pool_id` (`pool_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户公海关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_customer_pool_relation`
--

LOCK TABLES `wk_crm_customer_pool_relation` WRITE;
/*!40000 ALTER TABLE `wk_crm_customer_pool_relation` DISABLE KEYS */;
INSERT INTO `wk_crm_customer_pool_relation` VALUES (1,1,34552);
/*!40000 ALTER TABLE `wk_crm_customer_pool_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_customer_pool_rule`
--

DROP TABLE IF EXISTS `wk_crm_customer_pool_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_customer_pool_rule` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收回规则id',
  `pool_id` int(11) NOT NULL COMMENT '公海id',
  `type` int(11) NOT NULL COMMENT '收回规则判断类型 1跟进记录 2商机 3成交状态',
  `deal_handle` int(11) DEFAULT NULL COMMENT '已成交客户是否进入公海 0不进入 1进入',
  `business_handle` int(11) DEFAULT NULL COMMENT '有商机客户是否进入公海 0不进入 1进入',
  `customer_level_setting` int(11) NOT NULL COMMENT '客户级别设置 1全部 2根据级别分别设置',
  `level` varchar(255) DEFAULT NULL COMMENT '客户级别 1全部',
  `limit_day` int(11) NOT NULL COMMENT '公海规则限制天数',
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='公海收回规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_customer_pool_rule`
--

LOCK TABLES `wk_crm_customer_pool_rule` WRITE;
/*!40000 ALTER TABLE `wk_crm_customer_pool_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_customer_pool_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_customer_setting`
--

DROP TABLE IF EXISTS `wk_crm_customer_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_customer_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `setting_name` varchar(255) DEFAULT NULL COMMENT '规则名称',
  `customer_num` int(11) DEFAULT NULL COMMENT '可拥有客户数量',
  `customer_deal` int(11) DEFAULT '0' COMMENT '成交客户是否占用数量 0 不占用 1 占用',
  `type` int(11) DEFAULT NULL COMMENT '类型 1 拥有客户数限制 2 锁定客户数限制',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`setting_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='员工拥有以及锁定客户数限制';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_customer_setting`
--

LOCK TABLES `wk_crm_customer_setting` WRITE;
/*!40000 ALTER TABLE `wk_crm_customer_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_customer_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_customer_setting_user`
--

DROP TABLE IF EXISTS `wk_crm_customer_setting_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_customer_setting_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `setting_id` int(11) NOT NULL COMMENT '客户规则限制ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `type` int(11) DEFAULT NULL COMMENT '1 员工 2 部门',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='员工拥有以及锁定客户员工关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_customer_setting_user`
--

LOCK TABLES `wk_crm_customer_setting_user` WRITE;
/*!40000 ALTER TABLE `wk_crm_customer_setting_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_customer_setting_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_customer_stats`
--

DROP TABLE IF EXISTS `wk_crm_customer_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_customer_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_num` bigint(20) DEFAULT NULL COMMENT '客户数量',
  `deal_status` int(11) DEFAULT NULL COMMENT '成交状态 0 未成交 1 已成交',
  `owner_user_id` int(11) DEFAULT NULL COMMENT '负责人ID',
  `create_date` varchar(8) DEFAULT NULL COMMENT '创建时间 年月日',
  `deal_date` varchar(8) DEFAULT NULL COMMENT '创建时间 年月日',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`customer_num`,`deal_status`,`owner_user_id`,`create_date`,`deal_date`) USING BTREE,
  KEY `create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_customer_stats`
--

LOCK TABLES `wk_crm_customer_stats` WRITE;
/*!40000 ALTER TABLE `wk_crm_customer_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_customer_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_customer_stats_info`
--

DROP TABLE IF EXISTS `wk_crm_customer_stats_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_customer_stats_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `last_customer_id` int(11) NOT NULL COMMENT '最后同步客户ID',
  `create_time` datetime NOT NULL COMMENT '同步时间',
  `sync_num` int(11) DEFAULT NULL COMMENT '同步数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='客户数量统计汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_customer_stats_info`
--

LOCK TABLES `wk_crm_customer_stats_info` WRITE;
/*!40000 ALTER TABLE `wk_crm_customer_stats_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_customer_stats_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_customer_user_star`
--

DROP TABLE IF EXISTS `wk_crm_customer_user_star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_customer_user_star` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`customer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户客户标星关系表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_customer_user_star`
--

LOCK TABLES `wk_crm_customer_user_star` WRITE;
/*!40000 ALTER TABLE `wk_crm_customer_user_star` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_customer_user_star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_examine`
--

DROP TABLE IF EXISTS `wk_crm_examine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_examine` (
  `examine_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_type` int(11) NOT NULL DEFAULT '1' COMMENT '1 合同 2 回款 3发票 4薪资 5 采购审核 6采购退货审核 7销售审核 8 销售退货审核 9付款单审核10 回款单审核11盘点审核12调拨审核',
  `examine_type` int(11) DEFAULT NULL COMMENT '审核类型 1 固定审批 2 授权审批',
  `name` varchar(255) DEFAULT NULL COMMENT '审批流名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `dept_ids` varchar(500) DEFAULT '0' COMMENT '部门ID（0为全部）',
  `user_ids` varchar(500) DEFAULT '0' COMMENT '员工ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `status` int(11) DEFAULT NULL COMMENT '状态 1 启用 0 禁用 2 删除',
  `remarks` varchar(255) DEFAULT NULL COMMENT '流程说明',
  PRIMARY KEY (`examine_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25378 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='审批流程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_examine`
--

LOCK TABLES `wk_crm_examine` WRITE;
/*!40000 ALTER TABLE `wk_crm_examine` DISABLE KEYS */;
INSERT INTO `wk_crm_examine` VALUES (25375,2,2,'回款审批流程',NULL,NULL,NULL,NULL,3,NULL,3,1,''),(25376,1,2,'合同审批流程',NULL,NULL,NULL,NULL,3,NULL,3,1,'说明'),(25377,3,2,'发票审批流程',NULL,NULL,NULL,NULL,0,NULL,0,1,'');
/*!40000 ALTER TABLE `wk_crm_examine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_examine_log`
--

DROP TABLE IF EXISTS `wk_crm_examine_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_examine_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `record_id` int(11) DEFAULT NULL COMMENT '审批记录ID',
  `examine_step_id` bigint(20) DEFAULT NULL COMMENT '审核步骤ID',
  `examine_status` int(11) DEFAULT NULL COMMENT '审核状态 0 未审核 1 审核通过 2 审核拒绝3 撤回审核',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `examine_user` bigint(20) DEFAULT NULL COMMENT '审核人',
  `examine_time` datetime DEFAULT NULL COMMENT '审核时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '审核备注',
  `is_recheck` int(11) DEFAULT '0' COMMENT '是否是撤回之前的日志 0或者null为新数据 1：撤回之前的数据',
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='审核日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_examine_log`
--

LOCK TABLES `wk_crm_examine_log` WRITE;
/*!40000 ALTER TABLE `wk_crm_examine_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_examine_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_examine_record`
--

DROP TABLE IF EXISTS `wk_crm_examine_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_examine_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审核记录ID',
  `examine_id` int(11) DEFAULT NULL COMMENT '审批ID',
  `examine_step_id` bigint(20) DEFAULT NULL COMMENT '当前进行的审批步骤ID',
  `examine_status` int(11) DEFAULT NULL COMMENT '审核状态 0 未审核 1 审核通过 2 审核拒绝 3 审核中 4 已撤回',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '审核备注',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='审核记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_examine_record`
--

LOCK TABLES `wk_crm_examine_record` WRITE;
/*!40000 ALTER TABLE `wk_crm_examine_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_examine_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_examine_step`
--

DROP TABLE IF EXISTS `wk_crm_examine_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_examine_step` (
  `step_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `step_type` int(11) DEFAULT NULL COMMENT '步骤类型1、负责人主管，2、指定用户（任意一人），3、指定用户（多人会签）,4、上一级审批人主管',
  `examine_id` int(11) NOT NULL COMMENT '审批ID',
  `check_user_id` varchar(500) DEFAULT NULL COMMENT '审批人ID (使用逗号隔开) ,1,2,',
  `step_num` int(11) DEFAULT '1' COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`step_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='审批步骤表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_examine_step`
--

LOCK TABLES `wk_crm_examine_step` WRITE;
/*!40000 ALTER TABLE `wk_crm_examine_step` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_examine_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_field`
--

DROP TABLE IF EXISTS `wk_crm_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_field` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `field_name` varchar(20) NOT NULL COMMENT '自定义字段英文标识',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '字段名称',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '字段类型 1 单行文本 2 多行文本 3 单选 4日期 5 数字 6 小数 7 手机  8 文件 9 多选 10 人员 11 附件 12 部门 13 日期时间 14 邮箱 15客户 16 商机 17 联系人 18 地图 19 产品类型 20 合同 21 回款计划',
  `label` int(11) NOT NULL COMMENT '标签 1 线索 2 客户 3 联系人 4 产品 5 商机 6 合同 7回款8.回款计划',
  `remark` varchar(60) DEFAULT NULL COMMENT '字段说明',
  `input_tips` varchar(255) DEFAULT NULL COMMENT '输入提示',
  `max_length` int(11) DEFAULT NULL COMMENT '最大长度',
  `default_value` varchar(5000) DEFAULT '' COMMENT '默认值',
  `is_unique` int(11) DEFAULT '0' COMMENT '是否唯一 1 是 0 否',
  `is_null` int(11) DEFAULT '0' COMMENT '是否必填 1 是 0 否',
  `sorting` int(11) DEFAULT '1' COMMENT '排序 从小到大',
  `options` longtext COMMENT '如果类型是选项，此处不能为空，多个选项以，隔开',
  `operating` int(11) DEFAULT '255' COMMENT '是否可以删除修改',
  `is_hidden` int(11) NOT NULL DEFAULT '0' COMMENT '是否隐藏  0不隐藏 1隐藏',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `field_type` int(11) NOT NULL DEFAULT '0' COMMENT '字段来源  0.自定义 1.原始固定 2原始字段但值存在扩展表中',
  `relevant` int(11) DEFAULT NULL COMMENT '只有线索需要，转换客户的自定义字段ID',
  `style_percent` int(11) DEFAULT '50' COMMENT '样式百分比%',
  `precisions` int(11) DEFAULT NULL COMMENT '精度，允许的最大小数位',
  `form_position` varchar(10) DEFAULT NULL COMMENT '表单定位 坐标格式： 1,1',
  `max_num_restrict` varchar(20) DEFAULT NULL COMMENT '限制的最大数值',
  `min_num_restrict` varchar(20) DEFAULT NULL COMMENT '限制的最小数值',
  `form_assist_id` int(11) DEFAULT NULL COMMENT '表单辅助id，前端生成',
  PRIMARY KEY (`field_id`) USING BTREE,
  KEY `label` (`label`) USING BTREE,
  KEY `update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1101914 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自定义字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_field`
--

LOCK TABLES `wk_crm_field` WRITE;
/*!40000 ALTER TABLE `wk_crm_field` DISABLE KEYS */;
INSERT INTO `wk_crm_field` VALUES (1101827,'customer_name','客户名称',1,2,NULL,NULL,255,'',1,1,0,NULL,189,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101828,'source','客户来源',3,2,NULL,NULL,NULL,'',0,0,1,'促销,搜索引擎,广告,转介绍,线上注册,线上询价,预约上门,陌拜,电话咨询,邮件咨询',191,0,'2021-03-24 16:55:24',2,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101829,'mobile','手机',7,2,NULL,NULL,255,'',0,0,2,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101830,'telephone','电话',1,2,NULL,NULL,255,'',0,0,3,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101831,'website','网址',1,2,NULL,NULL,255,'',0,0,4,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101832,'industry','客户行业',3,2,NULL,NULL,NULL,'',0,0,5,'IT,金融业,房地产,商业服务,运输/物流,生产,政府,文化传媒',191,0,'2021-03-24 16:55:24',2,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101833,'level','客户级别',3,2,NULL,NULL,NULL,'',0,0,6,'A（重点客户）,B（普通客户）,C（非优先客户）',63,0,'2021-03-24 16:55:24',2,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101834,'next_time','下次联系时间',13,2,NULL,NULL,NULL,'',0,0,7,NULL,63,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101835,'remark','备注',2,2,NULL,NULL,255,'',0,0,8,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101836,'email','邮箱',14,2,NULL,NULL,255,'',0,0,4,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101837,'leads_name','线索名称',1,1,NULL,NULL,255,'',0,1,0,NULL,189,0,'2021-03-24 16:55:24',1,1101827,50,NULL,NULL,NULL,NULL,NULL),(1101838,'email','邮箱',14,1,NULL,NULL,255,'',0,0,1,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101839,'source','线索来源',3,1,NULL,NULL,NULL,'',0,0,2,'促销,搜索引擎,广告,转介绍,线上注册,线上询价,预约上门,陌拜,电话咨询,邮件咨询',191,0,'2021-03-24 16:55:24',2,1101828,50,NULL,NULL,NULL,NULL,NULL),(1101840,'mobile','手机',7,1,NULL,NULL,255,'',0,0,3,NULL,191,0,'2021-03-24 16:55:24',1,1101829,50,NULL,NULL,NULL,NULL,NULL),(1101841,'telephone','电话',1,1,NULL,NULL,255,'',0,0,4,NULL,191,0,'2021-03-24 16:55:24',1,1101830,50,NULL,NULL,NULL,NULL,NULL),(1101842,'address','地址',1,1,NULL,NULL,255,'',0,0,5,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101843,'industry','客户行业',3,1,NULL,NULL,NULL,'',0,0,6,'IT,金融业,房地产,商业服务,运输/物流,生产,政府,文化传媒',191,0,'2021-03-24 16:55:24',2,1101832,50,NULL,NULL,NULL,NULL,NULL),(1101844,'level','客户级别',3,1,NULL,NULL,NULL,'',0,0,7,'A（重点客户）,B（普通客户）,C（非优先客户）',191,0,'2021-03-24 16:55:24',2,1101833,50,NULL,NULL,NULL,NULL,NULL),(1101845,'next_time','下次联系时间',13,1,NULL,NULL,NULL,'',0,0,8,NULL,63,0,'2021-03-24 16:55:24',1,1101834,50,NULL,NULL,NULL,NULL,NULL),(1101846,'remark','备注',2,1,NULL,NULL,255,'',0,0,9,NULL,191,0,'2021-03-24 16:55:24',1,1101835,50,NULL,NULL,NULL,NULL,NULL),(1101847,'name','姓名',1,3,NULL,NULL,255,'',0,1,0,NULL,181,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101848,'customer_id','客户名称',15,3,NULL,NULL,NULL,'',0,1,1,NULL,159,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101849,'mobile','手机',7,3,NULL,NULL,255,'',0,0,2,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101850,'telephone','电话',1,3,NULL,NULL,255,'',0,0,3,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101851,'email','邮箱',14,3,NULL,NULL,255,'',0,0,4,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101852,'post','职务',1,3,NULL,NULL,255,'',0,0,5,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101853,'policymakers','是否关键决策人',3,3,NULL,NULL,NULL,'',0,0,6,'是,否',190,0,'2021-03-24 16:55:24',2,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101854,'address','地址',1,3,NULL,NULL,255,'',0,0,7,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101855,'next_time','下次联系时间',13,3,NULL,NULL,NULL,'',0,0,8,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101856,'remark','备注',2,3,NULL,NULL,255,'',0,0,9,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101857,'sex','性别',3,3,NULL,NULL,NULL,'',0,0,10,'男,女',191,0,'2021-03-24 16:55:24',2,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101858,'name','产品名称',1,4,NULL,NULL,255,'',0,1,0,NULL,177,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101859,'category_id','产品类型',19,4,NULL,NULL,NULL,'',0,1,1,NULL,1,0,NULL,1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101860,'unit','产品单位',3,4,NULL,NULL,NULL,'',0,0,2,'个,块,只,把,枚,瓶,盒,台,吨,千克,米,箱,套',191,0,'2021-03-24 16:55:24',2,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101861,'num','产品编码',1,4,NULL,NULL,255,'',1,1,3,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101862,'price','价格',6,4,NULL,NULL,255,'',0,1,4,NULL,181,0,'2021-05-07 13:58:21',1,NULL,50,2,NULL,NULL,NULL,NULL),(1101863,'description','产品描述',1,4,NULL,NULL,255,'',0,0,6,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101864,'business_name','商机名称',1,5,NULL,NULL,255,'',0,1,0,NULL,181,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101865,'customer_id','客户名称',15,5,NULL,NULL,NULL,'',0,1,1,NULL,149,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101866,'money','商机金额',6,5,NULL,NULL,255,'',0,0,2,NULL,189,0,'2021-05-07 13:58:21',1,NULL,50,2,NULL,NULL,NULL,NULL),(1101867,'deal_date','预计成交日期',13,5,NULL,NULL,NULL,'',0,0,3,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101868,'remark','备注',2,5,NULL,NULL,255,'',0,0,4,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101869,'name','合同名称',1,6,NULL,NULL,255,'',0,1,1,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101870,'num','合同编号',1,6,NULL,NULL,255,'',1,1,0,NULL,177,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101871,'customer_id','客户名称',15,6,NULL,NULL,NULL,'',0,1,2,NULL,149,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101872,'business_id','商机名称',16,6,NULL,NULL,NULL,'',0,0,3,NULL,159,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101873,'money','合同金额',6,6,NULL,NULL,255,'',0,1,4,NULL,189,0,'2021-05-07 13:58:21',1,NULL,50,2,NULL,NULL,NULL,NULL),(1101874,'order_date','下单时间',4,6,NULL,NULL,NULL,'',0,1,5,NULL,181,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101875,'start_time','合同开始时间',4,6,NULL,NULL,NULL,'',0,0,6,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101876,'end_time','合同结束时间',4,6,NULL,NULL,NULL,'',0,0,7,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101877,'contacts_id','客户签约人',17,6,NULL,NULL,NULL,'',0,0,8,NULL,159,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101878,'company_user_id','公司签约人',10,6,NULL,NULL,NULL,'',0,0,9,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101879,'remark','备注',2,6,NULL,NULL,255,'',0,0,10,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101880,'flied_xucqai','合同类型',3,6,NULL,NULL,255,'',0,0,11,'直销合同,代理合同,服务合同,快销合同',255,0,'2021-03-24 16:55:24',0,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101881,'number','回款编号',1,7,NULL,NULL,255,'',1,1,0,NULL,177,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101882,'customer_id','客户名称',15,7,NULL,NULL,NULL,'',0,1,1,NULL,149,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101883,'contract_id','合同编号',20,7,NULL,NULL,NULL,'',0,1,2,NULL,159,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101884,'receivables_plan_id','期数',21,7,NULL,NULL,NULL,'',0,0,3,NULL,1,0,'2021-08-02 11:10:31',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101885,'return_time','回款日期',4,7,NULL,NULL,NULL,'',0,1,4,NULL,181,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101886,'money','回款金额',6,7,NULL,NULL,255,'',0,1,5,NULL,181,0,'2021-05-07 13:58:21',1,NULL,50,2,NULL,NULL,NULL,NULL),(1101887,'return_type','回款方式',3,7,NULL,NULL,NULL,'',0,0,6,'支票,现金,邮政汇款,电汇,网上转账,支付宝,微信支付,其他',191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101888,'remark','备注',2,7,NULL,NULL,255,'',0,0,7,NULL,191,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101889,'customer_id','客户名称',15,8,NULL,NULL,NULL,'',0,1,1,NULL,181,0,'2021-08-02 11:01:53',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101890,'contract_id','合同编号',20,8,NULL,NULL,11,'',0,1,2,NULL,181,0,'2021-08-02 11:01:53',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101891,'money','计划回款金额',6,8,NULL,NULL,NULL,'',0,1,3,NULL,181,0,'2021-08-02 11:01:53',1,NULL,50,2,NULL,NULL,NULL,NULL),(1101892,'return_date','计划回款日期',4,8,NULL,NULL,NULL,'',0,1,4,NULL,183,0,'2021-08-02 11:01:53',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101893,'remind','提前几天提醒',5,8,NULL,NULL,11,'',0,0,5,NULL,1,0,NULL,1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101894,'remark','备注',2,8,NULL,NULL,1000,'',0,0,6,NULL,1,0,NULL,1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101895,'visit_number','回访编号',1,17,NULL,NULL,NULL,'',1,1,0,NULL,177,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101896,'visit_time','回访时间',13,17,NULL,NULL,NULL,'',0,1,1,NULL,181,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101897,'owner_user_id','回访人',28,17,NULL,NULL,NULL,'',0,1,2,NULL,149,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101898,'return_visit_type','回访形式',3,17,NULL,NULL,NULL,'',0,0,3,'见面拜访,电话,短信,邮件,微信',191,0,'2021-03-24 16:55:24',2,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101899,'customer_id','客户名称',15,17,NULL,NULL,NULL,'',0,1,4,NULL,149,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101900,'contacts_id','联系人',17,17,NULL,NULL,NULL,'',0,0,5,NULL,159,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101901,'contract_id','合同编号',20,17,NULL,NULL,NULL,'',0,1,6,NULL,159,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101902,'satisficing','客户满意度',3,17,NULL,NULL,NULL,'',0,0,7,'很满意,满意,一般,不满意,很不满意',191,0,'2021-03-24 16:55:24',2,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101903,'flied_itvzix','客户反馈',2,17,NULL,NULL,1000,'',0,0,8,NULL,191,0,'2021-03-24 16:55:24',0,NULL,50,NULL,NULL,NULL,NULL,NULL),(1101905,'invoice_apply_number','发票申请编号',1,18,NULL,NULL,NULL,'',1,1,0,NULL,176,0,'2021-05-07 13:58:07',1,NULL,50,NULL,'0,0',NULL,NULL,NULL),(1101906,'customer_id','客户名称',15,18,NULL,NULL,NULL,'',0,1,1,NULL,148,0,'2021-05-07 13:58:07',1,NULL,50,NULL,'0,1',NULL,NULL,NULL),(1101907,'contract_id','合同编号',20,18,NULL,NULL,NULL,'',0,1,2,NULL,148,0,'2021-05-07 13:58:07',1,NULL,50,NULL,'1,0',NULL,NULL,NULL),(1101908,'contract_money','合同金额',6,18,NULL,NULL,NULL,'',0,0,3,NULL,144,0,'2021-05-07 13:58:07',1,NULL,50,2,'1,1',NULL,NULL,NULL),(1101909,'invoice_money','开票金额',6,18,NULL,NULL,NULL,'',0,1,4,NULL,148,0,'2021-05-07 13:58:07',1,NULL,50,2,'2,0',NULL,NULL,NULL),(1101910,'invoice_date','开票日期',13,18,NULL,NULL,NULL,'',0,0,5,NULL,190,0,'2021-05-07 13:58:07',1,NULL,50,NULL,'2,1',NULL,NULL,NULL),(1101911,'invoice_type','开票类型',3,18,NULL,NULL,NULL,'',0,1,6,'增值税专用发票,增值税普通发票,国税通用机打发票,地税通用机打发票,收据',158,0,'2021-05-07 13:58:07',1,NULL,50,NULL,'3,0',NULL,NULL,NULL),(1101912,'remark','备注',2,18,NULL,NULL,255,'',0,0,7,NULL,190,0,'2021-05-07 13:58:07',1,NULL,50,NULL,'3,1',NULL,NULL,NULL),(1101913,'return_type','回款方式',3,8,NULL,NULL,NULL,'',0,0,6,'支票,现金,邮政汇款,电汇,网上转账,支付宝,微信支付,其他',0,0,'2021-03-24 16:55:24',1,NULL,50,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `wk_crm_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_field_config`
--

DROP TABLE IF EXISTS `wk_crm_field_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_field_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `field_name` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT '字段名称',
  `field_type` int(11) NOT NULL DEFAULT '1' COMMENT '字段类型 1 keyword 2 date 3 number 4 nested 5 datetime',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `label` int(11) NOT NULL COMMENT 'label',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `field_name` (`field_name`,`label`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100294 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='字段配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_field_config`
--

LOCK TABLES `wk_crm_field_config` WRITE;
/*!40000 ALTER TABLE `wk_crm_field_config` DISABLE KEYS */;
INSERT INTO `wk_crm_field_config` VALUES (100257,'flied_dzmbcn',4,'2020-08-03 18:46:43',6),(100258,'flied_ivcdhc',4,'2020-08-03 18:47:30',3),(100259,'flied_pyrnyn',1,'2020-08-03 19:12:42',1),(100260,'flied_dknbbe',4,'2020-08-03 19:12:42',1),(100261,'flied_jhsivt',1,'2020-08-03 19:15:51',2),(100262,'flied_bcethz',3,'2020-08-04 17:17:04',2),(100263,'flied_jeqgso',1,'2020-08-04 17:17:04',2),(100264,'flied_mjrdbe',1,'2020-08-05 11:17:16',2),(100265,'flied_mtfnrf',1,'2020-08-05 11:17:17',2),(100266,'flied_dlyjjb',2,'2020-08-06 15:27:17',1),(100267,'flied_wxpcbx',3,'2020-08-06 15:27:18',1),(100268,'flied_kjhmgc',4,'2020-08-06 15:27:18',2),(100269,'flied_gdcrxx',2,'2020-08-06 15:27:18',2),(100270,'flied_xfhonw',1,'2020-08-06 15:27:18',3),(100271,'flied_fdncyr',2,'2020-08-06 15:27:18',3),(100272,'flied_ijtnfc',3,'2020-08-06 15:27:18',3),(100273,'flied_wuggiv',1,'2020-08-06 15:27:18',4),(100274,'flied_mswlgq',4,'2020-08-06 15:27:18',4),(100275,'flied_nmkltw',2,'2020-08-06 15:27:18',4),(100276,'flied_jokwgt',3,'2020-08-06 15:27:19',4),(100277,'flied_drfhhl',1,'2020-08-06 15:27:19',5),(100278,'flied_uvqlpy',4,'2020-08-06 15:27:19',5),(100279,'flied_temgvq',2,'2020-08-06 15:27:19',5),(100280,'flied_lxujya',3,'2020-08-06 15:27:19',5),(100281,'flied_kixhfg',1,'2020-08-06 15:27:19',6),(100282,'flied_lzwnik',2,'2020-08-06 15:27:19',6),(100283,'flied_dununn',3,'2020-08-06 15:27:19',6),(100284,'flied_cqlfka',1,'2020-08-06 15:27:19',7),(100285,'flied_ylgnov',4,'2020-08-06 15:27:19',7),(100286,'flied_umnxvp',2,'2020-08-06 15:27:19',7),(100287,'flied_mhbkno',3,'2020-08-06 15:27:19',7),(100288,'flied_bthxmi',1,'2020-08-06 15:27:20',17),(100289,'flied_xqimlp',4,'2020-08-06 15:27:20',17),(100290,'flied_oojrlh',2,'2020-08-06 15:27:20',17),(100291,'flied_tmboyd',3,'2020-08-06 15:27:20',17),(100292,'flied_grasid',1,'2020-08-12 18:14:51',2),(100293,'flied_ilvojx',1,'2020-08-19 17:17:04',1);
/*!40000 ALTER TABLE `wk_crm_field_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_field_extend`
--

DROP TABLE IF EXISTS `wk_crm_field_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_field_extend` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_field_id` int(11) NOT NULL COMMENT '对应主字段id',
  `field_name` varchar(20) NOT NULL COMMENT '自定义字段英文标识',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '字段名称',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '字段类型 1 单行文本 2 多行文本 3 单选 4日期 5 数字 6 小数 7 手机  8 文件 9 多选 10 人员 11 附件 12 部门 13 日期时间 14 邮箱 15客户 16 商机 17 联系人 18 地图 19 产品类型 20 合同 21 回款计划',
  `remark` varchar(60) DEFAULT NULL COMMENT '字段说明',
  `input_tips` varchar(255) DEFAULT NULL COMMENT '输入提示',
  `max_length` int(11) DEFAULT NULL COMMENT '最大长度',
  `default_value` varchar(5000) DEFAULT '' COMMENT '默认值',
  `is_unique` int(11) DEFAULT '0' COMMENT '是否唯一 1 是 0 否',
  `is_null` int(11) DEFAULT '0' COMMENT '是否必填 1 是 0 否',
  `sorting` int(11) DEFAULT '1' COMMENT '排序 从小到大',
  `options` longtext COMMENT '如果类型是选项，此处不能为空，多个选项以，隔开',
  `operating` int(11) DEFAULT '255' COMMENT '是否允许编辑',
  `is_hidden` int(11) NOT NULL DEFAULT '0' COMMENT '是否隐藏  0不隐藏 1隐藏',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `field_type` int(11) NOT NULL DEFAULT '0' COMMENT '字段来源  0.自定义 1.原始固定 2原始字段但值存在扩展表中',
  `style_percent` int(11) DEFAULT '50' COMMENT '样式百分比%',
  `precisions` int(11) DEFAULT NULL COMMENT '精度，允许的最大小数位',
  `form_position` varchar(10) DEFAULT NULL COMMENT '表单定位 坐标格式： 1,1',
  `max_num_restrict` varchar(20) DEFAULT NULL COMMENT '限制的最大数值',
  `min_num_restrict` varchar(20) DEFAULT NULL COMMENT '限制的最小数值',
  `form_assist_id` int(11) DEFAULT NULL COMMENT '表单辅助id，前端生成',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自定义字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_field_extend`
--

LOCK TABLES `wk_crm_field_extend` WRITE;
/*!40000 ALTER TABLE `wk_crm_field_extend` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_field_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_field_sort`
--

DROP TABLE IF EXISTS `wk_crm_field_sort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_field_sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `field_id` int(11) DEFAULT NULL COMMENT '字段ID',
  `field_name` varchar(50) DEFAULT NULL COMMENT '字段名称',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `label` int(11) NOT NULL COMMENT '标签 1 线索 2 客户 3 联系人 4 产品 5 商机 6 合同 7回款8.回款计划',
  `type` int(11) DEFAULT NULL COMMENT '字段类型',
  `style` int(11) DEFAULT NULL COMMENT '字段宽度',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '字段排序',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `is_hide` int(11) NOT NULL DEFAULT '1' COMMENT '是否隐藏 0、不隐藏 1、隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `label` (`user_id`,`field_name`,`label`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2427 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='字段排序表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_field_sort`
--

LOCK TABLES `wk_crm_field_sort` WRITE;
/*!40000 ALTER TABLE `wk_crm_field_sort` DISABLE KEYS */;
INSERT INTO `wk_crm_field_sort` VALUES (1961,1101837,'leadsName','线索名称',1,1,100,0,14773,0),(1962,1101838,'email','邮箱',1,14,100,1,14773,0),(1963,1101839,'source','线索来源',1,3,100,2,14773,0),(1964,1101840,'mobile','手机',1,7,100,3,14773,0),(1965,1101841,'telephone','电话',1,1,100,4,14773,0),(1966,1101842,'address','地址',1,1,100,5,14773,0),(1967,1101843,'industry','客户行业',1,3,100,6,14773,0),(1968,1101844,'level','客户级别',1,3,100,7,14773,0),(1969,1101845,'nextTime','下次联系时间',1,13,100,8,14773,0),(1970,1101846,'remark','备注',1,2,100,9,14773,0),(1971,NULL,'lastTime','最后跟进时间',1,4,100,10,14773,0),(1972,NULL,'lastContent','最后跟进记录',1,2,100,11,14773,0),(1973,NULL,'ownerUserName','负责人',1,1,100,12,14773,0),(1974,NULL,'ownerDeptName','所属部门',1,1,100,13,14773,0),(1975,NULL,'updateTime','更新时间',1,13,100,14,14773,0),(1976,NULL,'createTime','创建时间',1,13,100,15,14773,0),(1977,NULL,'createUserName','创建人',1,1,100,16,14773,0),(1978,1101827,'customerName','客户名称',2,1,100,0,14773,0),(1979,1101828,'source','客户来源',2,3,100,1,14773,0),(1980,1101829,'mobile','手机',2,7,100,2,14773,0),(1981,1101830,'telephone','电话',2,1,100,3,14773,0),(1982,1101831,'website','网址',2,1,100,4,14773,0),(1983,1101836,'email','邮箱',2,14,100,5,14773,0),(1984,1101832,'industry','客户行业',2,3,100,6,14773,0),(1985,1101833,'level','客户级别',2,3,100,7,14773,0),(1986,1101834,'nextTime','下次联系时间',2,13,100,8,14773,0),(1987,1101835,'remark','备注',2,2,100,9,14773,0),(1988,NULL,'status','锁定状态',2,5,100,10,14773,0),(1989,NULL,'dealStatus','成交状态',2,3,100,11,14773,0),(1990,NULL,'lastTime','最后跟进时间',2,13,100,12,14773,0),(1991,NULL,'lastContent','最后跟进记录',2,2,100,13,14773,0),(1992,NULL,'detailAddress','详细地址',2,1,100,14,14773,0),(1993,NULL,'address','地区定位',2,18,100,15,14773,0),(1994,NULL,'poolDay','距进入公海天数',2,5,100,16,14773,0),(1995,NULL,'ownerUserName','负责人',2,1,100,17,14773,0),(1996,NULL,'teamMemberIds','相关团队',2,10,100,18,14773,0),(1997,NULL,'ownerDeptName','所属部门',2,1,100,19,14773,0),(1998,NULL,'updateTime','更新时间',2,13,100,20,14773,0),(1999,NULL,'createTime','创建时间',2,13,100,21,14773,0),(2000,NULL,'createUserName','创建人',2,1,100,22,14773,0),(2001,1101864,'businessName','商机名称',5,1,100,0,14773,0),(2002,1101865,'customerName','客户名称',5,15,100,1,14773,0),(2003,1101866,'money','商机金额',5,6,100,2,14773,0),(2004,1101867,'dealDate','预计成交日期',5,13,100,3,14773,0),(2005,1101868,'remark','备注',5,2,100,4,14773,0),(2006,NULL,'typeName','商机状态组',5,3,100,5,14773,0),(2007,NULL,'statusName','商机阶段',5,3,100,6,14773,0),(2008,NULL,'lastTime','最后跟进时间',5,13,100,7,14773,0),(2009,NULL,'ownerUserName','负责人',5,1,100,8,14773,0),(2010,NULL,'teamMemberIds','相关团队',5,10,100,9,14773,0),(2011,NULL,'ownerDeptName','所属部门',5,1,100,10,14773,0),(2012,NULL,'updateTime','更新时间',5,13,100,11,14773,0),(2013,NULL,'createTime','创建时间',5,13,100,12,14773,0),(2014,NULL,'createUserName','创建人',5,1,100,13,14773,0),(2015,1101895,'visitNumber','回访编号',17,1,100,0,14773,0),(2016,1101896,'visitTime','回访时间',17,13,100,1,14773,0),(2017,1101897,'ownerUserName','回访人',17,28,100,2,14773,0),(2018,1101898,'returnVisitType','回访形式',17,3,100,3,14773,0),(2019,1101899,'customerName','客户名称',17,15,100,4,14773,0),(2020,1101900,'contactsName','联系人',17,17,100,5,14773,0),(2021,1101901,'contractNum','合同编号',17,20,100,6,14773,0),(2022,1101902,'satisficing','客户满意度',17,3,100,7,14773,0),(2023,1101903,'fliedItvzix','客户反馈',17,2,100,8,14773,0),(2024,NULL,'updateTime','更新时间',17,13,100,9,14773,0),(2025,NULL,'createTime','创建时间',17,13,100,10,14773,0),(2026,NULL,'createUserName','创建人',17,1,100,11,14773,0),(2027,1101858,'name','产品名称',4,1,100,0,14773,0),(2028,1101859,'categoryName','产品类型',4,19,100,1,14773,0),(2029,1101860,'unit','产品单位',4,3,100,2,14773,0),(2030,1101861,'num','产品编码',4,1,100,3,14773,0),(2031,1101862,'price','价格',4,6,100,4,14773,0),(2032,1101863,'description','产品描述',4,1,100,5,14773,0),(2033,NULL,'status','是否上下架',4,5,100,6,14773,0),(2034,NULL,'ownerUserName','负责人',4,1,100,7,14773,0),(2035,NULL,'ownerDeptName','所属部门',4,1,100,8,14773,0),(2036,NULL,'updateTime','更新时间',4,13,100,9,14773,0),(2037,NULL,'createTime','创建时间',4,13,100,10,14773,0),(2038,NULL,'createUserName','创建人',4,1,100,11,14773,0),(2039,1101847,'name','姓名',3,1,100,0,14773,0),(2040,1101848,'customerName','客户名称',3,15,100,1,14773,0),(2041,1101849,'mobile','手机',3,7,100,2,14773,0),(2042,1101850,'telephone','电话',3,1,100,3,14773,0),(2043,1101851,'email','邮箱',3,14,100,4,14773,0),(2044,1101852,'post','职务',3,1,100,5,14773,0),(2045,1101853,'policymakers','是否关键决策人',3,3,100,6,14773,0),(2046,1101854,'address','地址',3,1,100,7,14773,0),(2047,1101855,'nextTime','下次联系时间',3,13,100,8,14773,0),(2048,1101856,'remark','备注',3,2,100,9,14773,0),(2049,1101857,'sex','性别',3,3,100,10,14773,0),(2050,NULL,'lastTime','最后跟进时间',3,13,100,11,14773,0),(2051,NULL,'ownerUserName','负责人',3,1,100,12,14773,0),(2052,NULL,'teamMemberIds','相关团队',3,10,100,13,14773,0),(2053,NULL,'ownerDeptName','所属部门',3,1,100,14,14773,0),(2054,NULL,'updateTime','更新时间',3,13,100,15,14773,0),(2055,NULL,'createTime','创建时间',3,13,100,16,14773,0),(2056,NULL,'createUserName','创建人',3,1,100,17,14773,0),(2057,1101870,'num','合同编号',6,1,100,0,14773,0),(2058,1101869,'name','合同名称',6,1,100,1,14773,0),(2059,1101871,'customerName','客户名称',6,15,100,2,14773,0),(2060,1101872,'businessName','商机名称',6,16,100,3,14773,0),(2061,1101873,'money','合同金额',6,6,100,4,14773,0),(2062,1101874,'orderDate','下单时间',6,4,100,5,14773,0),(2063,1101875,'startTime','合同开始时间',6,4,100,6,14773,0),(2064,1101876,'endTime','合同结束时间',6,4,100,7,14773,0),(2065,1101877,'contactsName','客户签约人',6,17,100,8,14773,0),(2066,1101878,'companyUserName','公司签约人',6,10,100,9,14773,0),(2067,1101879,'remark','备注',6,2,100,10,14773,0),(2068,1101880,'fliedXucqai','合同类型',6,3,100,11,14773,0),(2069,NULL,'checkStatus','审核状态',6,5,100,12,14773,0),(2070,NULL,'receivedMoney','已收款金额',6,6,100,13,14773,0),(2071,NULL,'unreceivedMoney','未收款金额',6,6,100,14,14773,0),(2072,NULL,'lastTime','最后跟进时间',6,13,100,15,14773,0),(2073,NULL,'ownerUserName','负责人',6,1,100,16,14773,0),(2074,NULL,'teamMemberIds','相关团队',6,10,100,17,14773,0),(2075,NULL,'ownerDeptName','所属部门',6,1,100,18,14773,0),(2076,NULL,'updateTime','更新时间',6,13,100,19,14773,0),(2077,NULL,'createTime','创建时间',6,13,100,20,14773,0),(2078,NULL,'createUserName','创建人',6,1,100,21,14773,0),(2079,1101881,'number','回款编号',7,1,100,0,14773,0),(2080,1101882,'customerName','客户名称',7,15,100,1,14773,0),(2081,1101883,'contractNum','合同编号',7,20,100,2,14773,0),(2082,1101884,'planNum','期数',7,21,100,3,14773,0),(2083,1101885,'returnTime','回款日期',7,4,100,4,14773,0),(2084,1101886,'money','回款金额',7,6,100,5,14773,0),(2085,1101887,'returnType','回款方式',7,3,100,6,14773,0),(2086,1101888,'remark','备注',7,2,100,7,14773,0),(2087,NULL,'checkStatus','审核状态',7,5,100,8,14773,0),(2088,NULL,'contractMoney','合同金额',7,6,100,9,14773,0),(2089,NULL,'ownerUserName','负责人',7,1,100,10,14773,0),(2090,NULL,'teamMemberIds','相关团队',7,10,100,11,14773,0),(2091,NULL,'ownerDeptName','所属部门',7,1,100,12,14773,0),(2092,NULL,'updateTime','更新时间',7,13,100,13,14773,0),(2093,NULL,'createTime','创建时间',7,13,100,14,14773,0),(2094,NULL,'createUserName','创建人',7,1,100,15,14773,0),(2095,1101905,'invoiceApplyNumber','发票申请编号',18,1,100,0,14773,0),(2096,1101906,'customerName','客户名称',18,15,100,1,14773,0),(2097,1101907,'contractNum','合同编号',18,20,100,2,14773,0),(2098,1101908,'contractMoney','合同金额',18,6,100,3,14773,0),(2099,1101909,'invoiceMoney','开票金额',18,6,100,4,14773,0),(2100,1101910,'invoiceDate','开票日期',18,13,100,5,14773,0),(2101,1101911,'invoiceType','开票类型',18,3,100,6,14773,0),(2102,1101912,'remark','备注',18,2,100,7,14773,0),(2103,NULL,'ownerUserName','负责人',18,1,100,8,14773,0),(2104,NULL,'checkStatus','审核状态',18,5,100,9,14773,0),(2105,NULL,'invoiceStatus','开票状态',18,5,100,10,14773,0),(2106,NULL,'invoiceNumber','发票号码',18,1,100,11,14773,0),(2107,NULL,'realInvoiceDate','实际开票日期',18,4,100,12,14773,0),(2108,NULL,'logisticsNumber','物流单号',18,1,100,13,14773,0),(2109,NULL,'ownerDeptName','所属部门',18,1,100,14,14773,0),(2110,NULL,'updateTime','更新时间',18,13,100,15,14773,0),(2111,NULL,'createTime','创建时间',18,13,100,16,14773,0),(2112,NULL,'createUserName','创建人',18,1,100,17,14773,0),(2113,1101827,'customerName','客户名称',2,1,100,0,14774,0),(2114,1101828,'source','客户来源',2,3,100,1,14774,0),(2115,1101829,'mobile','手机',2,7,100,2,14774,0),(2116,1101830,'telephone','电话',2,1,100,3,14774,0),(2117,1101831,'website','网址',2,1,100,4,14774,0),(2118,1101836,'email','邮箱',2,14,100,5,14774,0),(2119,1101832,'industry','客户行业',2,3,100,6,14774,0),(2120,1101833,'level','客户级别',2,3,100,7,14774,0),(2121,1101834,'nextTime','下次联系时间',2,13,100,8,14774,0),(2122,1101835,'remark','备注',2,2,100,9,14774,0),(2123,NULL,'status','锁定状态',2,5,100,10,14774,0),(2124,NULL,'dealStatus','成交状态',2,3,100,11,14774,0),(2125,NULL,'lastTime','最后跟进时间',2,13,100,12,14774,0),(2126,NULL,'lastContent','最后跟进记录',2,2,100,13,14774,0),(2127,NULL,'detailAddress','详细地址',2,1,100,14,14774,0),(2128,NULL,'address','地区定位',2,18,100,15,14774,0),(2129,NULL,'poolDay','距进入公海天数',2,5,100,16,14774,0),(2130,NULL,'ownerUserName','负责人',2,1,100,17,14774,0),(2131,NULL,'teamMemberIds','相关团队',2,10,100,18,14774,0),(2132,NULL,'ownerDeptName','所属部门',2,1,100,19,14774,0),(2133,NULL,'updateTime','更新时间',2,13,100,20,14774,0),(2134,NULL,'createTime','创建时间',2,13,100,21,14774,0),(2135,NULL,'createUserName','创建人',2,1,100,22,14774,0),(2136,1101837,'leadsName','线索名称',1,1,100,0,14778,0),(2137,1101838,'email','邮箱',1,14,100,1,14778,0),(2138,1101839,'source','线索来源',1,3,100,2,14778,0),(2139,1101840,'mobile','手机',1,7,100,3,14778,0),(2140,1101841,'telephone','电话',1,1,100,4,14778,0),(2141,1101842,'address','地址',1,1,100,5,14778,0),(2142,1101843,'industry','客户行业',1,3,100,6,14778,0),(2143,1101844,'level','客户级别',1,3,100,7,14778,0),(2144,1101845,'nextTime','下次联系时间',1,13,100,8,14778,0),(2145,1101846,'remark','备注',1,2,100,9,14778,0),(2146,NULL,'lastTime','最后跟进时间',1,4,100,10,14778,0),(2147,NULL,'lastContent','最后跟进记录',1,2,100,11,14778,0),(2148,NULL,'ownerUserName','负责人',1,1,100,12,14778,0),(2149,NULL,'ownerDeptName','所属部门',1,1,100,13,14778,0),(2150,NULL,'updateTime','更新时间',1,13,100,14,14778,0),(2151,NULL,'createTime','创建时间',1,13,100,15,14778,0),(2152,NULL,'createUserName','创建人',1,1,100,16,14778,0),(2153,1101827,'customerName','客户名称',2,1,100,0,14778,0),(2154,1101828,'source','客户来源',2,3,100,1,14778,0),(2155,1101829,'mobile','手机',2,7,100,2,14778,0),(2156,1101830,'telephone','电话',2,1,100,3,14778,0),(2157,1101831,'website','网址',2,1,100,4,14778,0),(2158,1101836,'email','邮箱',2,14,100,5,14778,0),(2159,1101832,'industry','客户行业',2,3,100,6,14778,0),(2160,1101833,'level','客户级别',2,3,100,7,14778,0),(2161,1101834,'nextTime','下次联系时间',2,13,100,8,14778,0),(2162,1101835,'remark','备注',2,2,100,9,14778,0),(2163,NULL,'status','锁定状态',2,5,100,10,14778,0),(2164,NULL,'dealStatus','成交状态',2,3,100,11,14778,0),(2165,NULL,'lastTime','最后跟进时间',2,13,100,12,14778,0),(2166,NULL,'lastContent','最后跟进记录',2,2,100,13,14778,0),(2167,NULL,'detailAddress','详细地址',2,1,100,14,14778,0),(2168,NULL,'address','地区定位',2,18,100,15,14778,0),(2169,NULL,'poolDay','距进入公海天数',2,5,100,16,14778,0),(2170,NULL,'ownerUserName','负责人',2,1,100,17,14778,0),(2171,NULL,'teamMemberIds','相关团队',2,10,100,18,14778,0),(2172,NULL,'ownerDeptName','所属部门',2,1,100,19,14778,0),(2173,NULL,'updateTime','更新时间',2,13,100,20,14778,0),(2174,NULL,'createTime','创建时间',2,13,100,21,14778,0),(2175,NULL,'createUserName','创建人',2,1,100,22,14778,0),(2176,1101864,'businessName','商机名称',5,1,100,0,14778,0),(2177,1101865,'customerName','客户名称',5,15,100,1,14778,0),(2178,1101866,'money','商机金额',5,6,100,2,14778,0),(2179,1101867,'dealDate','预计成交日期',5,13,100,3,14778,0),(2180,1101868,'remark','备注',5,2,100,4,14778,0),(2181,NULL,'typeName','商机状态组',5,3,100,5,14778,0),(2182,NULL,'statusName','商机阶段',5,3,100,6,14778,0),(2183,NULL,'lastTime','最后跟进时间',5,13,100,7,14778,0),(2184,NULL,'ownerUserName','负责人',5,1,100,8,14778,0),(2185,NULL,'teamMemberIds','相关团队',5,10,100,9,14778,0),(2186,NULL,'ownerDeptName','所属部门',5,1,100,10,14778,0),(2187,NULL,'updateTime','更新时间',5,13,100,11,14778,0),(2188,NULL,'createTime','创建时间',5,13,100,12,14778,0),(2189,NULL,'createUserName','创建人',5,1,100,13,14778,0),(2190,1101870,'num','合同编号',6,1,100,0,14778,0),(2191,1101869,'name','合同名称',6,1,100,1,14778,0),(2192,1101871,'customerName','客户名称',6,15,100,2,14778,0),(2193,1101872,'businessName','商机名称',6,16,100,3,14778,0),(2194,1101873,'money','合同金额',6,6,100,4,14778,0),(2195,1101874,'orderDate','下单时间',6,4,100,5,14778,0),(2196,1101875,'startTime','合同开始时间',6,4,100,6,14778,0),(2197,1101876,'endTime','合同结束时间',6,4,100,7,14778,0),(2198,1101877,'contactsName','客户签约人',6,17,100,8,14778,0),(2199,1101878,'companyUserName','公司签约人',6,10,100,9,14778,0),(2200,1101879,'remark','备注',6,2,100,10,14778,0),(2201,1101880,'fliedXucqai','合同类型',6,3,100,11,14778,0),(2202,NULL,'checkStatus','审核状态',6,5,100,12,14778,0),(2203,NULL,'receivedMoney','已收款金额',6,6,100,13,14778,0),(2204,NULL,'unreceivedMoney','未收款金额',6,6,100,14,14778,0),(2205,NULL,'lastTime','最后跟进时间',6,13,100,15,14778,0),(2206,NULL,'ownerUserName','负责人',6,1,100,16,14778,0),(2207,NULL,'teamMemberIds','相关团队',6,10,100,17,14778,0),(2208,NULL,'ownerDeptName','所属部门',6,1,100,18,14778,0),(2209,NULL,'updateTime','更新时间',6,13,100,19,14778,0),(2210,NULL,'createTime','创建时间',6,13,100,20,14778,0),(2211,NULL,'createUserName','创建人',6,1,100,21,14778,0),(2212,1101905,'invoiceApplyNumber','发票申请编号',18,1,100,0,14778,0),(2213,1101906,'customerName','客户名称',18,15,100,1,14778,0),(2214,1101907,'contractNum','合同编号',18,20,100,2,14778,0),(2215,1101908,'contractMoney','合同金额',18,6,100,3,14778,0),(2216,1101909,'invoiceMoney','开票金额',18,6,100,4,14778,0),(2217,1101910,'invoiceDate','开票日期',18,13,100,5,14778,0),(2218,1101911,'invoiceType','开票类型',18,3,100,6,14778,0),(2219,1101912,'remark','备注',18,2,100,7,14778,0),(2220,NULL,'ownerUserName','负责人',18,1,100,8,14778,0),(2221,NULL,'checkStatus','审核状态',18,5,100,9,14778,0),(2222,NULL,'invoiceStatus','开票状态',18,5,100,10,14778,0),(2223,NULL,'invoiceNumber','发票号码',18,1,100,11,14778,0),(2224,NULL,'realInvoiceDate','实际开票日期',18,4,100,12,14778,0),(2225,NULL,'logisticsNumber','物流单号',18,1,100,13,14778,0),(2226,NULL,'ownerDeptName','所属部门',18,1,100,14,14778,0),(2227,NULL,'updateTime','更新时间',18,13,100,15,14778,0),(2228,NULL,'createTime','创建时间',18,13,100,16,14778,0),(2229,NULL,'createUserName','创建人',18,1,100,17,14778,0),(2230,1101837,'leadsName','线索名称',1,1,100,0,14774,0),(2231,1101838,'email','邮箱',1,14,100,1,14774,0),(2232,1101839,'source','线索来源',1,3,100,2,14774,0),(2233,1101840,'mobile','手机',1,7,100,3,14774,0),(2234,1101841,'telephone','电话',1,1,100,4,14774,0),(2235,1101842,'address','地址',1,1,100,5,14774,0),(2236,1101843,'industry','客户行业',1,3,100,6,14774,0),(2237,1101844,'level','客户级别',1,3,100,7,14774,0),(2238,1101845,'nextTime','下次联系时间',1,13,100,8,14774,0),(2239,1101846,'remark','备注',1,2,100,9,14774,0),(2240,NULL,'lastTime','最后跟进时间',1,4,100,10,14774,0),(2241,NULL,'lastContent','最后跟进记录',1,2,100,11,14774,0),(2242,NULL,'ownerUserName','负责人',1,1,100,12,14774,0),(2243,NULL,'ownerDeptName','所属部门',1,1,100,13,14774,0),(2244,NULL,'updateTime','更新时间',1,13,100,14,14774,0),(2245,NULL,'createTime','创建时间',1,13,100,15,14774,0),(2246,NULL,'createUserName','创建人',1,1,100,16,14774,0),(2247,1101837,'leadsName','线索名称',1,1,100,0,14777,0),(2248,1101838,'email','邮箱',1,14,100,1,14777,0),(2249,1101839,'source','线索来源',1,3,100,2,14777,0),(2250,1101840,'mobile','手机',1,7,100,3,14777,0),(2251,1101841,'telephone','电话',1,1,100,4,14777,0),(2252,1101842,'address','地址',1,1,100,5,14777,0),(2253,1101843,'industry','客户行业',1,3,100,6,14777,0),(2254,1101844,'level','客户级别',1,3,100,7,14777,0),(2255,1101845,'nextTime','下次联系时间',1,13,100,8,14777,0),(2256,1101846,'remark','备注',1,2,100,9,14777,0),(2257,NULL,'lastTime','最后跟进时间',1,4,100,10,14777,0),(2258,NULL,'lastContent','最后跟进记录',1,2,100,11,14777,0),(2259,NULL,'ownerUserName','负责人',1,1,100,12,14777,0),(2260,NULL,'ownerDeptName','所属部门',1,1,100,13,14777,0),(2261,NULL,'updateTime','更新时间',1,13,100,14,14777,0),(2262,NULL,'createTime','创建时间',1,13,100,15,14777,0),(2263,NULL,'createUserName','创建人',1,1,100,16,14777,0),(2264,1101905,'invoiceApplyNumber','发票申请编号',18,1,100,0,14777,0),(2265,1101906,'customerName','客户名称',18,15,100,1,14777,0),(2266,1101907,'contractNum','合同编号',18,20,100,2,14777,0),(2267,1101908,'contractMoney','合同金额',18,6,100,3,14777,0),(2268,1101909,'invoiceMoney','开票金额',18,6,100,4,14777,0),(2269,1101910,'invoiceDate','开票日期',18,13,100,5,14777,0),(2270,1101911,'invoiceType','开票类型',18,3,100,6,14777,0),(2271,1101912,'remark','备注',18,2,100,7,14777,0),(2272,NULL,'ownerUserName','负责人',18,1,100,8,14777,0),(2273,NULL,'checkStatus','审核状态',18,5,100,9,14777,0),(2274,NULL,'invoiceStatus','开票状态',18,5,100,10,14777,0),(2275,NULL,'invoiceNumber','发票号码',18,1,100,11,14777,0),(2276,NULL,'realInvoiceDate','实际开票日期',18,4,100,12,14777,0),(2277,NULL,'logisticsNumber','物流单号',18,1,100,13,14777,0),(2278,NULL,'ownerDeptName','所属部门',18,1,100,14,14777,0),(2279,NULL,'updateTime','更新时间',18,13,100,15,14777,0),(2280,NULL,'createTime','创建时间',18,13,100,16,14777,0),(2281,NULL,'createUserName','创建人',18,1,100,17,14777,0),(2282,1101837,'leadsName','线索名称',1,1,100,0,14780,0),(2283,1101838,'email','邮箱',1,14,100,1,14780,0),(2284,1101839,'source','线索来源',1,3,100,2,14780,0),(2285,1101840,'mobile','手机',1,7,100,3,14780,0),(2286,1101841,'telephone','电话',1,1,100,4,14780,0),(2287,1101842,'address','地址',1,1,100,5,14780,0),(2288,1101843,'industry','客户行业',1,3,100,6,14780,0),(2289,1101844,'level','客户级别',1,3,100,7,14780,0),(2290,1101845,'nextTime','下次联系时间',1,13,100,8,14780,0),(2291,1101846,'remark','备注',1,2,100,9,14780,0),(2292,NULL,'lastTime','最后跟进时间',1,4,100,10,14780,0),(2293,NULL,'lastContent','最后跟进记录',1,2,100,11,14780,0),(2294,NULL,'ownerUserName','负责人',1,1,100,12,14780,0),(2295,NULL,'ownerDeptName','所属部门',1,1,100,13,14780,0),(2296,NULL,'updateTime','更新时间',1,13,100,14,14780,0),(2297,NULL,'createTime','创建时间',1,13,100,15,14780,0),(2298,NULL,'createUserName','创建人',1,1,100,16,14780,0),(2299,1101827,'customerName','客户名称',2,1,100,0,14780,0),(2300,1101828,'source','客户来源',2,3,100,1,14780,0),(2301,1101829,'mobile','手机',2,7,100,2,14780,0),(2302,1101830,'telephone','电话',2,1,100,3,14780,0),(2303,1101831,'website','网址',2,1,100,4,14780,0),(2304,1101836,'email','邮箱',2,14,100,5,14780,0),(2305,1101832,'industry','客户行业',2,3,100,6,14780,0),(2306,1101833,'level','客户级别',2,3,100,7,14780,0),(2307,1101834,'nextTime','下次联系时间',2,13,100,8,14780,0),(2308,1101835,'remark','备注',2,2,100,9,14780,0),(2309,NULL,'status','锁定状态',2,5,100,10,14780,0),(2310,NULL,'dealStatus','成交状态',2,3,100,11,14780,0),(2311,NULL,'lastTime','最后跟进时间',2,13,100,12,14780,0),(2312,NULL,'lastContent','最后跟进记录',2,2,100,13,14780,0),(2313,NULL,'detailAddress','详细地址',2,1,100,14,14780,0),(2314,NULL,'address','地区定位',2,18,100,15,14780,0),(2315,NULL,'poolDay','距进入公海天数',2,5,100,16,14780,0),(2316,NULL,'ownerUserName','负责人',2,1,100,17,14780,0),(2317,NULL,'teamMemberIds','相关团队',2,10,100,18,14780,0),(2318,NULL,'ownerDeptName','所属部门',2,1,100,19,14780,0),(2319,NULL,'updateTime','更新时间',2,13,100,20,14780,0),(2320,NULL,'createTime','创建时间',2,13,100,21,14780,0),(2321,NULL,'createUserName','创建人',2,1,100,22,14780,0),(2322,1101847,'name','姓名',3,1,100,0,14780,0),(2323,1101848,'customerName','客户名称',3,15,100,1,14780,0),(2324,1101849,'mobile','手机',3,7,100,2,14780,0),(2325,1101850,'telephone','电话',3,1,100,3,14780,0),(2326,1101851,'email','邮箱',3,14,100,4,14780,0),(2327,1101852,'post','职务',3,1,100,5,14780,0),(2328,1101853,'policymakers','是否关键决策人',3,3,100,6,14780,0),(2329,1101854,'address','地址',3,1,100,7,14780,0),(2330,1101855,'nextTime','下次联系时间',3,13,100,8,14780,0),(2331,1101856,'remark','备注',3,2,100,9,14780,0),(2332,1101857,'sex','性别',3,3,100,10,14780,0),(2333,NULL,'lastTime','最后跟进时间',3,13,100,11,14780,0),(2334,NULL,'ownerUserName','负责人',3,1,100,12,14780,0),(2335,NULL,'teamMemberIds','相关团队',3,10,100,13,14780,0),(2336,NULL,'ownerDeptName','所属部门',3,1,100,14,14780,0),(2337,NULL,'updateTime','更新时间',3,13,100,15,14780,0),(2338,NULL,'createTime','创建时间',3,13,100,16,14780,0),(2339,NULL,'createUserName','创建人',3,1,100,17,14780,0),(2340,1101864,'businessName','商机名称',5,1,100,0,14780,0),(2341,1101865,'customerName','客户名称',5,15,100,1,14780,0),(2342,1101866,'money','商机金额',5,6,100,2,14780,0),(2343,1101867,'dealDate','预计成交日期',5,13,100,3,14780,0),(2344,1101868,'remark','备注',5,2,100,4,14780,0),(2345,NULL,'typeName','商机状态组',5,3,100,5,14780,0),(2346,NULL,'statusName','商机阶段',5,3,100,6,14780,0),(2347,NULL,'lastTime','最后跟进时间',5,13,100,7,14780,0),(2348,NULL,'ownerUserName','负责人',5,1,100,8,14780,0),(2349,NULL,'teamMemberIds','相关团队',5,10,100,9,14780,0),(2350,NULL,'ownerDeptName','所属部门',5,1,100,10,14780,0),(2351,NULL,'updateTime','更新时间',5,13,100,11,14780,0),(2352,NULL,'createTime','创建时间',5,13,100,12,14780,0),(2353,NULL,'createUserName','创建人',5,1,100,13,14780,0),(2354,1101870,'num','合同编号',6,1,100,0,14780,0),(2355,1101869,'name','合同名称',6,1,100,1,14780,0),(2356,1101871,'customerName','客户名称',6,15,100,2,14780,0),(2357,1101872,'businessName','商机名称',6,16,100,3,14780,0),(2358,1101873,'money','合同金额',6,6,100,4,14780,0),(2359,1101874,'orderDate','下单时间',6,4,100,5,14780,0),(2360,1101875,'startTime','合同开始时间',6,4,100,6,14780,0),(2361,1101876,'endTime','合同结束时间',6,4,100,7,14780,0),(2362,1101877,'contactsName','客户签约人',6,17,100,8,14780,0),(2363,1101878,'companyUserName','公司签约人',6,10,100,9,14780,0),(2364,1101879,'remark','备注',6,2,100,10,14780,0),(2365,1101880,'fliedXucqai','合同类型',6,3,100,11,14780,0),(2366,NULL,'checkStatus','审核状态',6,5,100,12,14780,0),(2367,NULL,'receivedMoney','已收款金额',6,6,100,13,14780,0),(2368,NULL,'unreceivedMoney','未收款金额',6,6,100,14,14780,0),(2369,NULL,'lastTime','最后跟进时间',6,13,100,15,14780,0),(2370,NULL,'ownerUserName','负责人',6,1,100,16,14780,0),(2371,NULL,'teamMemberIds','相关团队',6,10,100,17,14780,0),(2372,NULL,'ownerDeptName','所属部门',6,1,100,18,14780,0),(2373,NULL,'updateTime','更新时间',6,13,100,19,14780,0),(2374,NULL,'createTime','创建时间',6,13,100,20,14780,0),(2375,NULL,'createUserName','创建人',6,1,100,21,14780,0),(2376,1101837,'leadsName','线索名称',1,1,100,0,14779,0),(2377,1101838,'email','邮箱',1,14,100,1,14779,0),(2378,1101839,'source','线索来源',1,3,100,2,14779,0),(2379,1101840,'mobile','手机',1,7,100,3,14779,0),(2380,1101841,'telephone','电话',1,1,100,4,14779,0),(2381,1101842,'address','地址',1,1,100,5,14779,0),(2382,1101843,'industry','客户行业',1,3,100,6,14779,0),(2383,1101844,'level','客户级别',1,3,100,7,14779,0),(2384,1101845,'nextTime','下次联系时间',1,13,100,8,14779,0),(2385,1101846,'remark','备注',1,2,100,9,14779,0),(2386,NULL,'lastTime','最后跟进时间',1,4,100,10,14779,0),(2387,NULL,'lastContent','最后跟进记录',1,2,100,11,14779,0),(2388,NULL,'ownerUserName','负责人',1,1,100,12,14779,0),(2389,NULL,'ownerDeptName','所属部门',1,1,100,13,14779,0),(2390,NULL,'updateTime','更新时间',1,13,100,14,14779,0),(2391,NULL,'createTime','创建时间',1,13,100,15,14779,0),(2392,NULL,'createUserName','创建人',1,1,100,16,14779,0),(2393,1101905,'invoiceApplyNumber','发票申请编号',18,1,100,0,14780,0),(2394,1101906,'customerName','客户名称',18,15,100,1,14780,0),(2395,1101907,'contractNum','合同编号',18,20,100,2,14780,0),(2396,1101908,'contractMoney','合同金额',18,6,100,3,14780,0),(2397,1101909,'invoiceMoney','开票金额',18,6,100,4,14780,0),(2398,1101910,'invoiceDate','开票日期',18,13,100,5,14780,0),(2399,1101911,'invoiceType','开票类型',18,3,100,6,14780,0),(2400,1101912,'remark','备注',18,2,100,7,14780,0),(2401,NULL,'ownerUserName','负责人',18,1,100,8,14780,0),(2402,NULL,'checkStatus','审核状态',18,5,100,9,14780,0),(2403,NULL,'invoiceStatus','开票状态',18,5,100,10,14780,0),(2404,NULL,'invoiceNumber','发票号码',18,1,100,11,14780,0),(2405,NULL,'realInvoiceDate','实际开票日期',18,4,100,12,14780,0),(2406,NULL,'logisticsNumber','物流单号',18,1,100,13,14780,0),(2407,NULL,'ownerDeptName','所属部门',18,1,100,14,14780,0),(2408,NULL,'updateTime','更新时间',18,13,100,15,14780,0),(2409,NULL,'createTime','创建时间',18,13,100,16,14780,0),(2410,NULL,'createUserName','创建人',18,1,100,17,14780,0),(2411,1101889,'customerName','客户名称',8,15,100,0,14773,0),(2412,1101890,'contractNum','合同编号',8,20,100,1,14773,0),(2413,1101891,'money','计划回款金额',8,6,100,2,14773,0),(2414,1101892,'returnDate','计划回款日期',8,4,100,3,14773,0),(2415,1101893,'remind','提前几天提醒',8,5,100,4,14773,0),(2416,1101894,'remark','备注',8,2,100,5,14773,0),(2417,1101913,'returnType','回款方式',8,3,100,6,14773,0),(2418,NULL,'num','期数',8,1,100,7,14773,0),(2419,NULL,'ownerUserName','负责人',8,1,100,8,14773,0),(2420,NULL,'realReceivedMoney','实际回款金额',8,6,100,9,14773,0),(2421,NULL,'realReturnDate','实际回款时间',8,13,100,10,14773,0),(2422,NULL,'unreceivedMoney','未回款金额',8,6,100,11,14773,0),(2423,NULL,'receivedStatus','回款状态',8,3,100,12,14773,0),(2424,NULL,'updateTime','更新时间',8,13,100,13,14773,0),(2425,NULL,'createTime','创建时间',8,13,100,14,14773,0),(2426,NULL,'createUserName','创建人',8,1,100,15,14773,0);
/*!40000 ALTER TABLE `wk_crm_field_sort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_instrument_sort`
--

DROP TABLE IF EXISTS `wk_crm_instrument_sort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_instrument_sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `model_id` int(11) NOT NULL COMMENT '模块id 1、合同金额目标及完成情况 2、数据汇总 3、回款金额目标及完成情况 4、业绩指标完成率 5、销售漏斗 6、遗忘提醒 7、排行榜',
  `list` int(11) NOT NULL COMMENT '列 1左侧 2右侧',
  `sort` int(11) NOT NULL COMMENT '排序',
  `is_hidden` int(11) NOT NULL DEFAULT '0' COMMENT '是否隐藏 0显示 1隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='仪表盘排序表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_instrument_sort`
--

LOCK TABLES `wk_crm_instrument_sort` WRITE;
/*!40000 ALTER TABLE `wk_crm_instrument_sort` DISABLE KEYS */;
INSERT INTO `wk_crm_instrument_sort` VALUES (1,14777,1,1,0,1),(2,14777,5,1,1,1),(3,14777,7,1,2,1),(4,14777,2,2,0,1),(5,14777,4,2,1,1),(6,14777,6,2,2,1);
/*!40000 ALTER TABLE `wk_crm_instrument_sort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_invoice`
--

DROP TABLE IF EXISTS `wk_crm_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '发票id',
  `invoice_apply_number` varchar(255) NOT NULL COMMENT '发票申请编号',
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `contract_id` int(11) DEFAULT NULL COMMENT '合同id',
  `invoice_money` decimal(10,2) NOT NULL COMMENT '开票金额',
  `invoice_date` date DEFAULT NULL COMMENT '开票日期',
  `invoice_type` int(11) NOT NULL COMMENT '开票类型',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `title_type` int(11) DEFAULT NULL COMMENT '抬头类型 1单位 2个人',
  `invoice_title` varchar(255) DEFAULT NULL COMMENT '开票抬头',
  `tax_number` varchar(255) DEFAULT NULL COMMENT '纳税识别号',
  `deposit_bank` varchar(255) DEFAULT NULL COMMENT '开户行',
  `deposit_account` varchar(255) DEFAULT NULL COMMENT '开户账户',
  `deposit_address` varchar(255) DEFAULT NULL COMMENT '开票地址',
  `telephone` varchar(255) DEFAULT NULL COMMENT '电话',
  `contacts_name` varchar(255) DEFAULT NULL COMMENT '联系人名称',
  `contacts_mobile` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `contacts_address` varchar(255) DEFAULT NULL COMMENT '邮寄地址',
  `examine_record_id` int(11) DEFAULT NULL COMMENT '审批记录id',
  `check_status` int(11) DEFAULT NULL COMMENT '审核状态 0待审核、1通过、2拒绝、3审核中、4撤回',
  `owner_user_id` bigint(20) NOT NULL COMMENT '负责人id',
  `invoice_number` varchar(32) DEFAULT NULL COMMENT '发票号码',
  `real_invoice_date` date DEFAULT NULL COMMENT '实际开票日期',
  `logistics_number` varchar(255) DEFAULT NULL COMMENT '物流单号',
  `invoice_status` int(11) NOT NULL DEFAULT '0' COMMENT '开票状态 0 未开票， 1 已开票',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次id',
  PRIMARY KEY (`invoice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='发票表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_invoice`
--

LOCK TABLES `wk_crm_invoice` WRITE;
/*!40000 ALTER TABLE `wk_crm_invoice` DISABLE KEYS */;
INSERT INTO `wk_crm_invoice` VALUES (1,'0001',2,1,100000.00,'2024-09-19',1,'',1,NULL,'0001','中国银行','414565212565236523',NULL,'14767815683','王明源','14767815683','中国-佛山',1004975,3,14773,NULL,NULL,NULL,0,14773,'2024-09-19 15:11:38','2024-09-19 15:11:38','3a7bcc43b3a440ad8ec941f1563a0b63');
/*!40000 ALTER TABLE `wk_crm_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_invoice_data`
--

DROP TABLE IF EXISTS `wk_crm_invoice_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_invoice_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL COMMENT '字段id',
  `name` varchar(255) NOT NULL COMMENT '字段名称',
  `value` longtext COMMENT '字段值',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `batch_id` (`batch_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='发票扩展字段数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_invoice_data`
--

LOCK TABLES `wk_crm_invoice_data` WRITE;
/*!40000 ALTER TABLE `wk_crm_invoice_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_invoice_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_invoice_info`
--

DROP TABLE IF EXISTS `wk_crm_invoice_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_invoice_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '发票信息id',
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `title_type` int(11) DEFAULT NULL COMMENT '抬头类型 1单位 2个人',
  `invoice_title` varchar(255) DEFAULT NULL COMMENT '开票抬头',
  `tax_number` varchar(255) DEFAULT NULL COMMENT '纳税识别号',
  `deposit_bank` varchar(255) DEFAULT NULL COMMENT '开户行',
  `deposit_account` varchar(255) DEFAULT NULL COMMENT '开户账户',
  `deposit_address` varchar(255) DEFAULT NULL COMMENT '开票地址',
  `telephone` varchar(255) DEFAULT NULL COMMENT '电话',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='发票详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_invoice_info`
--

LOCK TABLES `wk_crm_invoice_info` WRITE;
/*!40000 ALTER TABLE `wk_crm_invoice_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_invoice_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_leads`
--

DROP TABLE IF EXISTS `wk_crm_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_leads` (
  `leads_id` int(11) NOT NULL AUTO_INCREMENT,
  `is_transform` int(11) DEFAULT '0' COMMENT '1已转化 0 未转化',
  `followup` int(11) DEFAULT NULL COMMENT '跟进状态 0未跟进1已跟进',
  `leads_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '线索名称',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `next_time` datetime DEFAULT NULL COMMENT '下次联系时间',
  `telephone` varchar(100) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(100) DEFAULT '' COMMENT '地址',
  `remark` varchar(800) DEFAULT '' COMMENT '备注',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `owner_user_id` bigint(20) DEFAULT NULL COMMENT '负责人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次 比如附件批次',
  `is_receive` int(11) DEFAULT NULL COMMENT '1 分配',
  `last_time` datetime DEFAULT NULL COMMENT '最后跟进时间',
  `last_content` varchar(1024) DEFAULT NULL COMMENT '最后一条跟进记录',
  PRIMARY KEY (`leads_id`) USING BTREE,
  KEY `owner_user_id` (`owner_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线索表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_leads`
--

LOCK TABLES `wk_crm_leads` WRITE;
/*!40000 ALTER TABLE `wk_crm_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_leads_data`
--

DROP TABLE IF EXISTS `wk_crm_leads_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_leads_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '字段名称',
  `value` longtext,
  `create_time` datetime NOT NULL,
  `batch_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `batch_id` (`batch_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='线索自定义字段存值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_leads_data`
--

LOCK TABLES `wk_crm_leads_data` WRITE;
/*!40000 ALTER TABLE `wk_crm_leads_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_leads_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_leads_user_star`
--

DROP TABLE IF EXISTS `wk_crm_leads_user_star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_leads_user_star` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `leads_id` int(11) NOT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`leads_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户线索标星关系表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_leads_user_star`
--

LOCK TABLES `wk_crm_leads_user_star` WRITE;
/*!40000 ALTER TABLE `wk_crm_leads_user_star` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_leads_user_star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_marketing`
--

DROP TABLE IF EXISTS `wk_crm_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '营销id',
  `marketing_name` varchar(30) NOT NULL COMMENT '营销名称',
  `crm_type` int(11) NOT NULL DEFAULT '1' COMMENT '1线索  2客户',
  `end_time` datetime NOT NULL COMMENT '截止时间',
  `relation_user_id` varchar(200) NOT NULL COMMENT '关联人员ID',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1启用  0禁用',
  `second` int(11) NOT NULL DEFAULT '0' COMMENT '每个客户只能填写次数 0 1',
  `field_data_id` text NOT NULL COMMENT '营销内容填写字段',
  `browse` int(11) DEFAULT '0' COMMENT '浏览数',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `share_num` int(11) DEFAULT '0' COMMENT '分享数',
  `submit_num` int(11) DEFAULT '0' COMMENT '提交数',
  `synopsis` longtext COMMENT '简介',
  `main_file_ids` varchar(255) DEFAULT NULL COMMENT '首图id',
  `detail_file_ids` varchar(255) DEFAULT NULL COMMENT '详细文件集',
  `address` varchar(255) DEFAULT NULL COMMENT '活动地址',
  `marketing_type` varchar(255) DEFAULT NULL COMMENT '活动类型',
  `marketing_money` decimal(11,2) DEFAULT NULL COMMENT '活动金额',
  `relation_dept_id` varchar(255) DEFAULT NULL COMMENT '关联部门id',
  PRIMARY KEY (`marketing_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='营销表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_marketing`
--

LOCK TABLES `wk_crm_marketing` WRITE;
/*!40000 ALTER TABLE `wk_crm_marketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_marketing_field`
--

DROP TABLE IF EXISTS `wk_crm_marketing_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_marketing_field` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `field_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '自定义字段英文标识',
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '字段名称',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '字段类型 1 单行文本 2 多行文本 3 单选 4日期 5 数字 6 小数 7 手机  8 文件 9 多选 10 人员 11 附件 12 部门 13 日期时间 14 邮箱 15客户 16 商机 17 联系人 18 地图 19 产品类型 20 合同 21 回款计划',
  `remark` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '字段说明',
  `input_tips` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '输入提示',
  `max_length` int(11) DEFAULT NULL COMMENT '最大长度',
  `default_value` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '默认值',
  `is_unique` int(11) DEFAULT '0' COMMENT '是否唯一 1 是 0 否',
  `is_null` int(11) DEFAULT '0' COMMENT '是否必填 1 是 0 否',
  `sorting` int(11) DEFAULT '1' COMMENT '排序 从小到大',
  `options` longtext CHARACTER SET utf8mb4 COMMENT '如果类型是选项，此处不能为空，多个选项以，隔开',
  `operating` int(11) DEFAULT '0' COMMENT '是否可以删除修改 0 改删 1 改 2 删 3 无',
  `is_hidden` int(11) NOT NULL DEFAULT '0' COMMENT '是否隐藏  0不隐藏 1隐藏',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `form_id` int(11) DEFAULT NULL COMMENT '表单Id',
  `field_type` int(11) NOT NULL DEFAULT '0' COMMENT '字段来源  0.自定义 1.原始固定 2原始字段但值存在扩展表中',
  PRIMARY KEY (`field_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='市场活动字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_marketing_field`
--

LOCK TABLES `wk_crm_marketing_field` WRITE;
/*!40000 ALTER TABLE `wk_crm_marketing_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_marketing_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_marketing_form`
--

DROP TABLE IF EXISTS `wk_crm_marketing_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_marketing_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '名称',
  `remarks` varchar(500) DEFAULT NULL COMMENT '描述',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `status` int(11) DEFAULT '1' COMMENT '1启用，0禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` int(11) DEFAULT '0' COMMENT '1已删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_user_id` bigint(20) DEFAULT NULL COMMENT '删除人ID',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='市场活动表单信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_marketing_form`
--

LOCK TABLES `wk_crm_marketing_form` WRITE;
/*!40000 ALTER TABLE `wk_crm_marketing_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_marketing_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_marketing_info`
--

DROP TABLE IF EXISTS `wk_crm_marketing_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_marketing_info` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `marketing_id` int(11) NOT NULL COMMENT '关联ID',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0未同步  1同步成功  2同步失败',
  `field_info` text NOT NULL COMMENT '营销内容填写字段内容',
  `device` varchar(50) NOT NULL COMMENT '设备号',
  `owner_user_id` bigint(20) NOT NULL COMMENT '关联ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='营销数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_marketing_info`
--

LOCK TABLES `wk_crm_marketing_info` WRITE;
/*!40000 ALTER TABLE `wk_crm_marketing_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_marketing_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_number_setting`
--

DROP TABLE IF EXISTS `wk_crm_number_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_number_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设置id',
  `pid` int(11) NOT NULL COMMENT '父级设置id',
  `sort` int(11) NOT NULL COMMENT '编号顺序',
  `type` int(11) NOT NULL COMMENT '编号类型 1文本 2日期 3数字',
  `value` varchar(255) DEFAULT NULL COMMENT '文本内容或日期格式或起始编号',
  `increase_number` int(11) DEFAULT NULL COMMENT '递增数',
  `reset_type` int(11) DEFAULT NULL COMMENT '重新编号周期 1每天 2每月 3每年 4从不',
  `last_number` int(11) DEFAULT NULL COMMENT '上次生成的编号',
  `last_date` date DEFAULT NULL COMMENT '上次生成的时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`setting_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统自动生成编号设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_number_setting`
--

LOCK TABLES `wk_crm_number_setting` WRITE;
/*!40000 ALTER TABLE `wk_crm_number_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_number_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_owner_record`
--

DROP TABLE IF EXISTS `wk_crm_owner_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_owner_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录表ID',
  `type_id` int(11) NOT NULL COMMENT '对象id',
  `type` int(11) NOT NULL COMMENT '对象类型',
  `pre_owner_user_id` bigint(20) DEFAULT NULL COMMENT '上一负责人',
  `post_owner_user_id` bigint(20) DEFAULT NULL COMMENT '接手负责人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='负责人变更记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_owner_record`
--

LOCK TABLES `wk_crm_owner_record` WRITE;
/*!40000 ALTER TABLE `wk_crm_owner_record` DISABLE KEYS */;
INSERT INTO `wk_crm_owner_record` VALUES (1,1,9,14773,NULL,'2024-09-19 21:42:38'),(2,3,9,14773,NULL,'2024-09-20 21:35:00'),(3,3,9,NULL,14773,'2024-09-20 21:35:53');
/*!40000 ALTER TABLE `wk_crm_owner_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_print_record`
--

DROP TABLE IF EXISTS `wk_crm_print_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_print_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `crm_type` int(11) NOT NULL COMMENT '关联crm对象',
  `type_id` int(11) NOT NULL COMMENT '对象id',
  `template_id` int(11) NOT NULL COMMENT '模板id',
  `record_content` longtext COMMENT '打印记录',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='打印记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_print_record`
--

LOCK TABLES `wk_crm_print_record` WRITE;
/*!40000 ALTER TABLE `wk_crm_print_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_print_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_print_template`
--

DROP TABLE IF EXISTS `wk_crm_print_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_print_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `template_name` varchar(255) NOT NULL COMMENT '模板名称',
  `type` int(11) NOT NULL COMMENT '关联对象',
  `content` longtext COMMENT '模板',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`template_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='打印模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_print_template`
--

LOCK TABLES `wk_crm_print_template` WRITE;
/*!40000 ALTER TABLE `wk_crm_print_template` DISABLE KEYS */;
INSERT INTO `wk_crm_print_template` VALUES (20,'合同条款打印模板',6,'<p style=\"text-align: center; line-height: 1; margin-bottom: 15px;\"><span style=\"font-size: 36px; font-family: simsun, serif;\">***有限公司</span></p><p style=\"text-align: center; line-height: 1; margin-bottom: 15px;\"><span style=\"font-size: 36px; font-family: simsun, serif;\">销售合同</span></p><p style=\"text-align: right;\"><span style=\"font-size: 14px; font-family: simsun, serif; color: #525151;\">合同编号：<span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.num\">{合同编号}</span></span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">甲方：<span class=\"wk-print-tag-wukong wk-tiny-color--customer\" contenteditable=\"true\" data-wk-tag=\"customer.customer_name\">{客户名称}</span><u></u></span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">乙方：郑州卡卡罗特软件科技有限公司</span></p><p style=\"line-height: 1.75;\">&nbsp;</p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">甲乙双方本着相互信任，真诚合作的原则，经双方友好协商，就乙方为甲方提供特定服务达成一致意见，特签订本合同。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\"><strong>一、服务内容</strong></span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">1、乙方同意向甲方提供的特定服务。服务的内容的标准见附件A。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">2、如果乙方在工作中因自身过错而发生任何错误或遗漏，乙方应无条件更正，而不另外收费，并对因此而对甲方造成的损失承担赔偿责任，赔偿以附件A所载明的该项服务内容对应之服务费为限。若因甲方原因造成工作的延误，将由甲方承担相应的损失。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">3、乙方的服务承诺：</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">&nbsp; &nbsp; 1）乙方接到甲方通过电话、信函传真、电子邮件、网上提交等方式提出关于附件A所列服务的请求后，在两个有效工作日内给予响应并提供服务。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">&nbsp; &nbsp; 2）乙方提供给甲方的服务，必须按照合同附件A规定的标准进行。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">4、产品明细：</span></p><table style=\"border-collapse: collapse; width: 100%; float: right;\" border=\"1\" data-wk-table-tag=\"table\"><tbody><tr data-wk-table-tr-tag=\"header\"><td style=\"background-color: #ffffff;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">产品名称</span></strong></td><td style=\"background-color: #ffffff;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">产品类别</span></strong></td><td style=\"background-color: #ffffff;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">单位</span></strong></td><td style=\"background-color: #ffffff;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">价格</span></strong></td><td style=\"background-color: #ffffff;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">售价</span></strong></td><td style=\"background-color: #ffffff;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">数量</span></strong></td><td style=\"background-color: #ffffff;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">折扣</span></strong></td><td style=\"background-color: #ffffff;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">合计</span></strong></td></tr><tr data-wk-table-tr-tag=\"value\"><td data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.name\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{产品名称}</span></span></td><td data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.category_name\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{产品类别}</span></span></td><td data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.单位\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{单位}</span></span></td><td data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.price\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{价格}</span></span></td><td data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.sales_price\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{售价}</span></span></td><td data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.sales_num\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{数量}</span></span></td><td data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.discount\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{折扣}</span></span></td><td data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.subtotal\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{合计}</span></span></td></tr></tbody></table><p style=\"line-height: 1.75;\"><span style=\"font-family: simsun, serif;\"><span style=\"font-size: 14px;\">整单折扣：<span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-tag=\"contract.discount_rate\">{整单折扣}</span></span><span style=\"font-size: 14px;\">&nbsp; &nbsp;产品总金额（元）：<span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-tag=\"contract.total_price\">{产品总金额}</span></span></span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\"><strong>二、服务费的支付</strong></span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">1、服务费总金额为<u>&nbsp; &nbsp;&nbsp;<span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.money\">{合同金额}</span>&nbsp; &nbsp;</u>元人民币(人民币大写：<u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u>元整)。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">2、本费用结构仅限於附件A中列明的工作。如果甲方要求扩大项目范围，或因甲方改变已经议定的项目内容导致乙方需重复进行项目步骤，乙方将需要重新评估上述费用结构。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">3、甲乙双方一致同意项目服务费按一次性以人民币形式支付。服务完成后，甲方将在验收确认服务完成合格，并且乙方发出该阶段工作的费用账单及正式有效的税务发票后3个工作日内，向乙方支付约定的费用。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">4、有关发票方面的任何问题，甲方应在收到发票后及时书面通知乙方，便乙方及时作出解释或解决问题，以使甲方能按时付款。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">5、乙方将自行承担项目实施范围内合理的差旅费用。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">6、乙方同意免除项目杂费。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">7、本协议有效期为：&nbsp; <u>&nbsp; &nbsp;<span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.start_time\">{合同开始时间}</span></u><u>&nbsp; &nbsp; </u>&nbsp; 起&nbsp; <u>&nbsp; &nbsp;&nbsp;<span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.end_time\">{合同结束时间}</span></u><u>&nbsp; &nbsp; </u>&nbsp;止</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\"><strong>三、服务的变更</strong></span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">甲方可以提前个工作日以书面形式要求变更或增加所提供的服务。该等变更最终应由双方互相商定认可，其中包括与该等变更有关的任何费用调整。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\"><strong>四、争议处理</strong></span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">甲乙双方如对协议条款规定的理解有异议，或者对与协议有关的事项发生争议，双方应本着友好合作的精神进行协商。协商不能解决的，任何一方可向仲裁委员会提起仲裁。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\"><strong>五、其他</strong></span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">1、本合同中所用的标题仅为方便而设，而不影响对本合同的解释。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">2、附件A是本合同不可分割的组成部分，与本合同具有同等法律效力。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">3、本合同未尽事宜，由甲乙双方协商后产生书面文件，作为本合同的补充条款，具备与本合同同等法律效力。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">4、对本合同内容的任何修改和变更需要，用书面形式，并经双方确认后生效。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">(以下无正文)</span></p><p style=\"line-height: 1.75;\">&nbsp;</p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">甲方（签章）&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;乙方（签章）</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">代表签字：&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;代表签字：</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">日期：&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;日期：</span></p>',0,'2020-08-22 11:40:42',NULL),(21,'合同订单打印模板',6,'<p style=\"text-align: center; line-height: 2;\"><span style=\"font-size: 36px; font-family: simsun, serif;\">合同订单</span></p><p style=\"line-height: 2; text-align: right;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">合同编号：<span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.num\">{合同编号}</span></span></p><table style=\"border-collapse: collapse; width: 102.185%; height: 147px;\" border=\"1\"><tbody><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">合同名称：</span><span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.name\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{合同名称}</span></span><span style=\"font-size: 14px; font-family: simsun, serif;\">&nbsp;</span></td><td style=\"width: 52.3571%; height: 21px;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">客户名称：</span><span class=\"wk-print-tag-wukong wk-tiny-color--customer\" contenteditable=\"true\" data-wk-tag=\"customer.customer_name\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{客户名称}</span></span></td></tr><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">合同总金额：</span><span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.money\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{合同金额}</span></span></td><td style=\"width: 52.3571%; height: 21px;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">负责人：</span><span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.owner_user_name\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{负责人}</span></span></td></tr><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">相关商机：</span><span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.business_name\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{商机名称}</span></span><span style=\"font-size: 14px; font-family: simsun, serif;\">&nbsp;</span></td><td style=\"width: 52.3571%; height: 21px;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">签订时间：</span><span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.order_date\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{下单时间}</span></span></td></tr><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">开始时间：</span><span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.start_time\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{合同开始时间}</span></span></td><td style=\"width: 52.3571%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">结束时间：</span><span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.end_time\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{合同结束时间}</span></span></td></tr><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">备注：<span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"false\" data-wk-tag=\"contract.remark\">{备注}</span></span></td><td style=\"width: 52.3571%; height: 21px;\">&nbsp;</td></tr></tbody></table><p style=\"line-height: 2;\">&nbsp;</p><p style=\"line-height: 2;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">产品明细：</span></p><table style=\"border-collapse: collapse; width: 102.185%; height: 60px; line-height: 2;\" border=\"1\" data-wk-table-tag=\"table\"><tbody><tr data-wk-table-tr-tag=\"header\"><td style=\"width: 16.2207%;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">产品名称</span></strong></td><td style=\"width: 16.2207%;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">产品类别</span></strong></td><td style=\"width: 9.53177%;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">单位</span></strong></td><td style=\"width: 13.8796%;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">标准价格</span></strong></td><td style=\"width: 13.8796%;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">销售单价</span></strong></td><td style=\"width: 9.699%;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">数量</span></strong></td><td style=\"width: 9.699%;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">折扣</span></strong></td><td style=\"width: 9.69447%;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">合计</span></strong></td></tr><tr data-wk-table-tr-tag=\"value\"><td style=\"width: 16.2207%;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.name\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{产品名称}</span></span></td><td style=\"width: 16.2207%;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.category_name\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{产品类别}</span></span></td><td style=\"width: 9.53177%;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.单位\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{单位}</span></span></td><td style=\"width: 13.8796%;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.price\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{价格}</span></span></td><td style=\"width: 13.8796%;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.sales_price\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{售价}</span></span></td><td style=\"width: 9.699%;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.sales_num\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{数量}</span></span></td><td style=\"width: 9.699%;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.discount\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{折扣}</span></span></td><td style=\"width: 9.69447%;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.subtotal\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{合计}</span></span></td></tr></tbody></table><p style=\"text-align: right; line-height: 2;\"><span style=\"font-family: simsun, serif;\">产品总金额：</span><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-tag=\"contract.total_price\"><span style=\"font-family: simsun, serif;\">{产品总金额}</span></span></p><p>&nbsp;</p><p>&nbsp;</p>',0,'2020-08-22 11:40:42',NULL),(22,'商机打印模板',5,'<p style=\"text-align: center; line-height: 1; margin-bottom: 15px;\"><span style=\"font-size: 36px; font-family: simsun, serif;\">***有限公司</span></p><p style=\"text-align: center; line-height: 1; margin-bottom: 15px;\"><span style=\"font-size: 36px; font-family: simsun, serif;\">商机</span></p><table style=\"border-collapse: collapse; width: 100.337%; height: 138px;\" border=\"1\"><tbody><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">商机名称：</span><span class=\"wk-print-tag-wukong wk-tiny-color--business\" contenteditable=\"true\" data-wk-tag=\"business.business_name\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{商机名称}</span></span></td><td style=\"width: 50%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">客户名称：</span><span class=\"wk-print-tag-wukong wk-tiny-color--customer\" contenteditable=\"true\" data-wk-tag=\"customer.customer_name\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{客户名称}</span></span></td></tr><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">商机状态组：</span><span class=\"wk-print-tag-wukong wk-tiny-color--business\" contenteditable=\"true\" data-wk-tag=\"business.type_name\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{商机状态组}</span></span></td><td style=\"width: 50%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">商机阶段：</span><span class=\"wk-print-tag-wukong wk-tiny-color--business\" contenteditable=\"true\" data-wk-tag=\"business.status_name\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{商机阶段}</span></span></td></tr><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">预计成交时间：</span><span class=\"wk-print-tag-wukong wk-tiny-color--business\" contenteditable=\"true\" data-wk-tag=\"business.deal_date\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{预计成交日期}</span></span></td><td style=\"width: 50%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">商机金额（元）：</span><span class=\"wk-print-tag-wukong wk-tiny-color--business\" contenteditable=\"true\" data-wk-tag=\"business.money\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{商机金额}</span></span></td></tr><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">负责人：</span><span class=\"wk-print-tag-wukong wk-tiny-color--business\" contenteditable=\"true\" data-wk-tag=\"business.owner_user_name\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{负责人}</span></span></td><td style=\"width: 50%; height: 21px;\">&nbsp;</td></tr></tbody></table><p style=\"text-align: left; line-height: 2;\">&nbsp;</p><p style=\"text-align: left; line-height: 2;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">产品明细：</span></p><table style=\"border-collapse: collapse; width: 100%; height: 65px; line-height: 2;\" border=\"1\" data-wk-table-tag=\"table\"><tbody><tr style=\"height: 31px;\" data-wk-table-tr-tag=\"header\"><td style=\"height: 31px;\" data-wk-table-td-tag=\"name\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: simsun, serif;\">产品名称</span></strong></span></td><td style=\"height: 31px;\" data-wk-table-td-tag=\"name\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: simsun, serif;\">产品类型</span></strong></span></td><td style=\"height: 31px;\" data-wk-table-td-tag=\"name\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: simsun, serif;\">单位</span></strong></span></td><td style=\"height: 31px;\" data-wk-table-td-tag=\"name\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: simsun, serif;\">价格</span></strong></span></td><td style=\"height: 31px;\" data-wk-table-td-tag=\"name\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: simsun, serif;\">售价</span></strong></span></td><td style=\"height: 31px;\" data-wk-table-td-tag=\"name\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: simsun, serif;\">数量</span></strong></span></td><td style=\"height: 31px;\" data-wk-table-td-tag=\"name\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: simsun, serif;\">折扣</span></strong></span></td><td style=\"height: 31px;\" data-wk-table-td-tag=\"name\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: simsun, serif;\">合计</span></strong></span></td></tr><tr style=\"height: 38px;\" data-wk-table-tr-tag=\"value\"><td style=\"height: 34px;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.name\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{产品名称}</span></span></td><td style=\"height: 34px;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.category_id\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{产品类型}</span></span></td><td style=\"height: 34px;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.单位\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{单位}</span></span></td><td style=\"height: 34px;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.price\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{价格}</span></span></td><td style=\"height: 34px;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.sales_price\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{售价}</span></span></td><td style=\"height: 34px;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.sales_num\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{数量}</span></span></td><td style=\"height: 34px;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.discount\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{折扣}</span></span></td><td style=\"height: 34px;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.subtotal\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{合计}</span></span></td></tr></tbody></table><p style=\"text-align: left; line-height: 2;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">整单折扣：</span><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-tag=\"business.discount_rate\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{整单折扣}</span></span><span style=\"font-size: 14px; font-family: simsun, serif;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;产品总金额（元）：</span><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-tag=\"business.total_price\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{产品总金额}</span></span></p>',0,'2020-08-22 11:40:42',NULL),(23,'回款打印模板',7,'<p style=\"text-align: center; line-height: 1; margin-bottom: 15px;\"><span style=\"font-size: 36px; font-family: simsun, serif;\">***有限公司</span></p><p style=\"text-align: center; line-height: 1; margin-bottom: 15px;\"><span style=\"font-size: 36px; font-family: simsun, serif;\">回款单</span></p><table style=\"border-collapse: collapse; width: 100.842%; height: 146px;\" border=\"1\"><tbody><tr style=\"height: 18px;\"><td style=\"width: 50%; height: 18px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">客户名称：</span><span class=\"wk-print-tag-wukong wk-tiny-color--receivables\" contenteditable=\"true\" data-wk-tag=\"receivables.customer_name\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{客户名称}</span></span></td><td style=\"width: 50%; height: 18px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">回款编号：</span><span class=\"wk-print-tag-wukong wk-tiny-color--receivables\" contenteditable=\"true\" data-wk-tag=\"receivables.number\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{回款编号}</span></span></td></tr><tr style=\"height: 18px;\"><td style=\"width: 50%; height: 18px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">回款日期：</span><span class=\"wk-print-tag-wukong wk-tiny-color--receivables\" contenteditable=\"true\" data-wk-tag=\"receivables.return_time\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{回款日期}</span></span></td><td style=\"width: 50%; height: 18px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">回款方式：</span><span class=\"wk-print-tag-wukong wk-tiny-color--receivables\" contenteditable=\"true\" data-wk-tag=\"receivables.return_type\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{回款方式}</span></span></td></tr><tr style=\"height: 18px;\"><td style=\"width: 50%; height: 18px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">回款期数：</span><span class=\"wk-print-tag-wukong wk-tiny-color--receivables\" contenteditable=\"true\" data-wk-tag=\"receivables.plan_num\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{期数}</span></span></td><td style=\"width: 50%; height: 18px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">回款金额（元）：</span><span class=\"wk-print-tag-wukong wk-tiny-color--receivables\" contenteditable=\"true\" data-wk-tag=\"receivables.money\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{回款金额}</span></span></td></tr><tr style=\"height: 18px;\"><td style=\"width: 50%; height: 18px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">负责人：</span><span class=\"wk-print-tag-wukong wk-tiny-color--receivables\" contenteditable=\"true\" data-wk-tag=\"receivables.owner_user_name\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{负责人}</span></span></td><td style=\"width: 50%; height: 18px;\">&nbsp;</td></tr><tr style=\"height: 18px;\"><td style=\"width: 50%; height: 18px;\" colspan=\"2\"><span style=\"font-family: simsun, serif; font-size: 14px;\">备注：</span><span class=\"wk-print-tag-wukong wk-tiny-color--receivables\" contenteditable=\"true\" data-wk-tag=\"receivables.remark\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{备注}</span></span></td></tr></tbody></table>',0,'2020-08-22 11:40:42',NULL);
/*!40000 ALTER TABLE `wk_crm_print_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_product`
--

DROP TABLE IF EXISTS `wk_crm_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `name` varchar(255) NOT NULL COMMENT '产品名称',
  `num` varchar(255) DEFAULT NULL COMMENT '产品编码',
  `unit` varchar(255) DEFAULT NULL COMMENT '单位',
  `price` decimal(18,2) DEFAULT '0.00' COMMENT '价格',
  `status` int(11) DEFAULT NULL COMMENT '状态 1 上架 0 下架 3 删除',
  `category_id` int(11) DEFAULT NULL COMMENT '产品分类ID',
  `description` text COMMENT '产品描述',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `owner_user_id` bigint(20) DEFAULT NULL COMMENT '负责人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次ID',
  `old_product_id` int(11) DEFAULT NULL COMMENT '旧产品id',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_product`
--

LOCK TABLES `wk_crm_product` WRITE;
/*!40000 ALTER TABLE `wk_crm_product` DISABLE KEYS */;
INSERT INTO `wk_crm_product` VALUES (1,'微信小程序','0001',NULL,987.20,1,14767,'开发小程序',14773,14773,'2024-09-18 20:36:35','2024-09-18 21:22:08','3146577dee9c4002921b3409c91d0c51',NULL),(2,'web开发','00002',NULL,10000.00,1,14767,'开发网页',14773,14773,'2024-09-18 21:23:38','2024-09-18 21:23:38','b99ca99450934076ae2dce0c82bca199',NULL);
/*!40000 ALTER TABLE `wk_crm_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_product_category`
--

DROP TABLE IF EXISTS `wk_crm_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(200) DEFAULT '' COMMENT '分类名称',
  `pid` int(11) DEFAULT '0' COMMENT '父级分类ID',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14768 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_product_category`
--

LOCK TABLES `wk_crm_product_category` WRITE;
/*!40000 ALTER TABLE `wk_crm_product_category` DISABLE KEYS */;
INSERT INTO `wk_crm_product_category` VALUES (14767,'默认',0);
/*!40000 ALTER TABLE `wk_crm_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_product_data`
--

DROP TABLE IF EXISTS `wk_crm_product_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_product_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL COMMENT '字段ID',
  `name` varchar(255) NOT NULL COMMENT '字段名称',
  `value` longtext COMMENT '字段值',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `batch_id` (`batch_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='产品自定义字段存值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_product_data`
--

LOCK TABLES `wk_crm_product_data` WRITE;
/*!40000 ALTER TABLE `wk_crm_product_data` DISABLE KEYS */;
INSERT INTO `wk_crm_product_data` VALUES (2,1101860,'unit','个','2024-09-18 21:22:08','3146577dee9c4002921b3409c91d0c51'),(3,1101860,'unit','个','2024-09-18 21:23:38','b99ca99450934076ae2dce0c82bca199');
/*!40000 ALTER TABLE `wk_crm_product_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_product_detail_img`
--

DROP TABLE IF EXISTS `wk_crm_product_detail_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_product_detail_img` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图像ID',
  `product_id` int(11) DEFAULT NULL COMMENT '产品id',
  `remarks` longtext COMMENT '评论',
  `main_file_ids` varchar(1024) DEFAULT NULL COMMENT '主图',
  `detail_file_ids` varchar(1024) DEFAULT NULL COMMENT '详细信息文件 ID集',
  PRIMARY KEY (`img_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='产品详情图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_product_detail_img`
--

LOCK TABLES `wk_crm_product_detail_img` WRITE;
/*!40000 ALTER TABLE `wk_crm_product_detail_img` DISABLE KEYS */;
INSERT INTO `wk_crm_product_detail_img` VALUES (1,1,NULL,'1836395225204002816','1836395249988145152'),(2,2,NULL,'1836395595481354240','1836395632273788928');
/*!40000 ALTER TABLE `wk_crm_product_detail_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_product_user`
--

DROP TABLE IF EXISTS `wk_crm_product_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_product_user` (
  `product_user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_ids` varchar(255) NOT NULL COMMENT '产品ID集',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID集',
  PRIMARY KEY (`product_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='产品员工小程序显示关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_product_user`
--

LOCK TABLES `wk_crm_product_user` WRITE;
/*!40000 ALTER TABLE `wk_crm_product_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_product_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_receivables`
--

DROP TABLE IF EXISTS `wk_crm_receivables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_receivables` (
  `receivables_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回款ID',
  `number` varchar(100) DEFAULT NULL COMMENT '回款编号',
  `receivables_plan_id` int(11) DEFAULT NULL COMMENT '回款计划ID',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `contract_id` int(11) DEFAULT NULL COMMENT '合同ID',
  `check_status` int(11) DEFAULT NULL COMMENT '0待审核、1通过、2拒绝、3审核中 4:撤回 5 未提交',
  `examine_record_id` int(11) DEFAULT NULL COMMENT '审核记录ID',
  `return_time` date DEFAULT NULL COMMENT '回款日期',
  `return_type` varchar(100) DEFAULT NULL COMMENT '回款方式',
  `money` decimal(17,2) DEFAULT NULL COMMENT '回款金额',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `owner_user_id` bigint(20) DEFAULT NULL COMMENT '负责人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `batch_id` varchar(32) NOT NULL COMMENT '批次',
  PRIMARY KEY (`receivables_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='回款表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_receivables`
--

LOCK TABLES `wk_crm_receivables` WRITE;
/*!40000 ALTER TABLE `wk_crm_receivables` DISABLE KEYS */;
INSERT INTO `wk_crm_receivables` VALUES (1,'0001',NULL,2,1,3,1004976,'2024-09-18','网上转账',100000.00,'',14773,14773,'2024-09-19 15:14:27','2024-09-19 15:14:27',NULL,'f9d22e27d7764700b2b5cca137c7c014');
/*!40000 ALTER TABLE `wk_crm_receivables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_receivables_data`
--

DROP TABLE IF EXISTS `wk_crm_receivables_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_receivables_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL COMMENT '字段ID',
  `name` varchar(255) NOT NULL COMMENT '字段名称',
  `value` longtext COMMENT '字段值',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `batch_id` (`batch_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='回款自定义字段存值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_receivables_data`
--

LOCK TABLES `wk_crm_receivables_data` WRITE;
/*!40000 ALTER TABLE `wk_crm_receivables_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_receivables_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_receivables_plan`
--

DROP TABLE IF EXISTS `wk_crm_receivables_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_receivables_plan` (
  `receivables_plan_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回款计划ID',
  `num` varchar(100) DEFAULT NULL COMMENT '期数',
  `receivables_id` int(11) DEFAULT NULL COMMENT '回款ID',
  `status` int(11) DEFAULT NULL COMMENT '1完成 0 未完成',
  `money` decimal(18,2) DEFAULT NULL COMMENT '计划回款金额',
  `return_date` datetime DEFAULT NULL COMMENT '计划回款日期',
  `return_type` varchar(255) DEFAULT NULL COMMENT '计划回款方式',
  `remind` int(11) DEFAULT NULL COMMENT '提前几天提醒',
  `remind_date` datetime DEFAULT NULL COMMENT '提醒日期',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `owner_user_id` bigint(20) DEFAULT NULL COMMENT '负责人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `batch_id` varchar(32) DEFAULT NULL COMMENT '附件批次ID',
  `real_received_money` decimal(18,2) DEFAULT NULL COMMENT '实际回款金额',
  `real_return_date` datetime DEFAULT NULL COMMENT '实际回款日期',
  `unreceived_money` decimal(18,2) DEFAULT NULL COMMENT '未回款金额',
  `received_status` int(11) DEFAULT '0' COMMENT '回款状态 0 待回款 1 回款完成 2 部分回款 3 作废 4 逾期 5 待生效',
  `contract_id` int(11) NOT NULL COMMENT '合同ID',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户ID',
  PRIMARY KEY (`receivables_plan_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='回款计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_receivables_plan`
--

LOCK TABLES `wk_crm_receivables_plan` WRITE;
/*!40000 ALTER TABLE `wk_crm_receivables_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_receivables_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_receivables_plan_data`
--

DROP TABLE IF EXISTS `wk_crm_receivables_plan_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_receivables_plan_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '字段名称',
  `value` longtext,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `batch_id` (`batch_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='回款计划自定义字段存值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_receivables_plan_data`
--

LOCK TABLES `wk_crm_receivables_plan_data` WRITE;
/*!40000 ALTER TABLE `wk_crm_receivables_plan_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_receivables_plan_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_return_visit`
--

DROP TABLE IF EXISTS `wk_crm_return_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_return_visit` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回访id',
  `visit_number` varchar(255) NOT NULL COMMENT '回访编号',
  `visit_time` datetime DEFAULT NULL COMMENT '回访时间',
  `owner_user_id` bigint(20) DEFAULT NULL COMMENT '回访人id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `contract_id` int(11) DEFAULT NULL COMMENT '合同id',
  `contacts_id` int(11) DEFAULT NULL COMMENT '联系人id',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次id',
  PRIMARY KEY (`visit_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='回访表\r\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_return_visit`
--

LOCK TABLES `wk_crm_return_visit` WRITE;
/*!40000 ALTER TABLE `wk_crm_return_visit` DISABLE KEYS */;
INSERT INTO `wk_crm_return_visit` VALUES (1,'0001','2024-09-19 15:13:21',14773,2,1,NULL,14773,'2024-09-19 15:13:39','2024-09-19 15:13:39','593a3ab7a21b493abe68e460cd84c10c');
/*!40000 ALTER TABLE `wk_crm_return_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_return_visit_data`
--

DROP TABLE IF EXISTS `wk_crm_return_visit_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_return_visit_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL COMMENT '字段ID',
  `name` varchar(255) NOT NULL COMMENT '字段名称',
  `value` longtext COMMENT '字段值',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='回访扩展数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_return_visit_data`
--

LOCK TABLES `wk_crm_return_visit_data` WRITE;
/*!40000 ALTER TABLE `wk_crm_return_visit_data` DISABLE KEYS */;
INSERT INTO `wk_crm_return_visit_data` VALUES (1,1101898,'returnVisitType','电话','2024-09-19 15:13:39','593a3ab7a21b493abe68e460cd84c10c'),(2,1101902,'satisficing','很满意','2024-09-19 15:13:39','593a3ab7a21b493abe68e460cd84c10c'),(3,1101903,'fliedItvzix','','2024-09-19 15:13:39','593a3ab7a21b493abe68e460cd84c10c');
/*!40000 ALTER TABLE `wk_crm_return_visit_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_role_field`
--

DROP TABLE IF EXISTS `wk_crm_role_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_role_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `label` int(11) NOT NULL COMMENT 'crm模块',
  `field_id` int(11) DEFAULT NULL COMMENT '字段id',
  `field_name` varchar(255) DEFAULT NULL COMMENT '字段标识',
  `name` varchar(255) DEFAULT NULL COMMENT '字段名称',
  `auth_level` int(11) NOT NULL COMMENT '权限 1不可编辑不可查看 2可查看不可编辑 3可编辑可查看',
  `operate_type` int(11) NOT NULL COMMENT '操作权限 1都可以设置 2只有查看权限可设置 3只有编辑权限可设置 4都不能设置',
  `mask_type` int(11) DEFAULT '0' COMMENT '掩码类型 0 都不隐藏 1 列表隐藏详情不隐藏 2 都隐藏',
  `field_type` int(11) DEFAULT NULL COMMENT '  0自定义字段 1原始字段 2原始字段但值在data表 3关联表的字段 4系统字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色字段授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_role_field`
--

LOCK TABLES `wk_crm_role_field` WRITE;
/*!40000 ALTER TABLE `wk_crm_role_field` DISABLE KEYS */;
INSERT INTO `wk_crm_role_field` VALUES (1,180170,2,1101827,'customer_name','客户名称',3,3,0,1),(2,180170,2,1101828,'source','客户来源',3,1,0,2),(3,180170,2,1101829,'mobile','手机',3,1,0,1),(4,180170,2,1101830,'telephone','电话',3,1,0,1),(5,180170,2,1101831,'website','网址',3,1,0,1),(6,180170,2,1101832,'industry','客户行业',3,1,0,2),(7,180170,2,1101833,'level','客户级别',3,1,0,2),(8,180170,2,1101834,'next_time','下次联系时间',3,4,0,1),(9,180170,2,1101835,'remark','备注',3,1,0,1),(10,180170,2,1101836,'email','邮箱',3,1,0,1),(11,180170,2,NULL,'create_user_name','创建人',2,2,0,1),(12,180170,2,NULL,'create_time','创建时间',2,2,0,1),(13,180170,2,NULL,'update_time','更新时间',2,2,0,1),(14,180170,2,NULL,'owner_user_name','负责人',2,4,0,1),(15,180170,2,NULL,'owner_dept_name','所属部门',2,4,0,1),(16,180170,2,NULL,'last_content','最后跟进记录',2,2,0,1),(17,180170,2,NULL,'last_time','最后跟进时间',2,2,0,1),(18,180170,2,NULL,'receive_time','负责人获取客户时间',2,2,0,1),(19,180170,2,NULL,'deal_status','成交状态',2,4,0,1),(20,180170,2,NULL,'status','锁定状态',2,2,0,1),(21,180170,2,NULL,'pool_day','距进入公海天数',2,2,0,1),(22,180170,3,1101847,'name','姓名',3,1,0,1),(23,180170,3,1101848,'customer_id','客户名称',3,4,0,1),(24,180170,3,1101849,'mobile','手机',3,1,0,1),(25,180170,3,1101850,'telephone','电话',3,1,0,1),(26,180170,3,1101851,'email','邮箱',3,1,0,1),(27,180170,3,1101852,'post','职务',3,1,0,1),(28,180170,3,1101853,'policymakers','是否关键决策人',3,1,0,2),(29,180170,3,1101854,'address','地址',3,1,0,1),(30,180170,3,1101855,'next_time','下次联系时间',3,4,0,1),(31,180170,3,1101856,'remark','备注',3,1,0,1),(32,180170,3,1101857,'sex','性别',3,1,0,2),(33,180170,3,NULL,'create_user_name','创建人',2,2,0,1),(34,180170,3,NULL,'create_time','创建时间',2,2,0,1),(35,180170,3,NULL,'update_time','更新时间',2,2,0,1),(36,180170,3,NULL,'owner_user_name','负责人',2,4,0,1),(37,180170,3,NULL,'owner_dept_name','所属部门',2,4,0,1),(38,180170,3,NULL,'last_time','最后跟进时间',2,2,0,1),(39,180170,5,1101864,'business_name','商机名称',3,1,0,1),(40,180170,5,1101865,'customer_id','客户名称',3,4,0,1),(41,180170,5,1101866,'money','商机金额',3,1,0,1),(42,180170,5,1101867,'deal_date','预计成交日期',3,1,0,1),(43,180170,5,1101868,'remark','备注',3,1,0,1),(44,180170,5,NULL,'create_user_name','创建人',2,2,0,1),(45,180170,5,NULL,'create_time','创建时间',2,2,0,1),(46,180170,5,NULL,'update_time','更新时间',2,2,0,1),(47,180170,5,NULL,'owner_user_name','负责人',2,4,0,1),(48,180170,5,NULL,'owner_dept_name','所属部门',2,4,0,1),(49,180170,5,NULL,'type_name','商机阶段',2,2,0,1),(50,180170,5,NULL,'status_name','商机状态组',2,2,0,1),(51,180170,5,NULL,'last_time','最后跟进时间',2,2,0,1),(52,180170,6,1101869,'name','合同名称',3,1,0,1),(53,180170,6,1101870,'num','合同编号',3,3,0,1),(54,180170,6,1101871,'customer_id','客户名称',3,1,0,1),(55,180170,6,1101872,'business_id','商机名称',3,1,0,1),(56,180170,6,1101873,'money','合同金额',3,1,0,1),(57,180170,6,1101874,'order_date','下单时间',3,1,0,1),(58,180170,6,1101875,'start_time','合同开始时间',3,1,0,1),(59,180170,6,1101876,'end_time','合同结束时间',3,1,0,1),(60,180170,6,1101877,'contacts_id','客户签约人',3,1,0,1),(61,180170,6,1101878,'company_user_id','公司签约人',3,1,0,1),(62,180170,6,1101879,'remark','备注',3,1,0,1),(63,180170,6,1101880,'flied_xucqai','合同类型',3,1,0,0),(64,180170,6,NULL,'create_user_name','创建人',2,2,0,1),(65,180170,6,NULL,'create_time','创建时间',2,2,0,1),(66,180170,6,NULL,'update_time','更新时间',2,2,0,1),(67,180170,6,NULL,'owner_user_name','负责人',2,4,0,1),(68,180170,6,NULL,'owner_dept_name','所属部门',2,4,0,1),(69,180170,6,NULL,'last_time','最后跟进时间',2,2,0,1),(70,180170,6,NULL,'last_content','最后跟进记录',2,2,0,1),(71,180170,6,NULL,'received_money','已收款金额',2,2,0,1),(72,180170,6,NULL,'unreceived_money','未收款金额',2,2,0,1),(73,180170,6,NULL,'check_status','审核状态',2,4,0,1),(74,180170,1,1101837,'leads_name','线索名称',3,3,0,1),(75,180170,1,1101838,'email','邮箱',3,1,0,1),(76,180170,1,1101839,'source','线索来源',3,1,0,2),(77,180170,1,1101840,'mobile','手机',3,1,0,1),(78,180170,1,1101841,'telephone','电话',3,1,0,1),(79,180170,1,1101842,'address','地址',3,1,0,1),(80,180170,1,1101843,'industry','客户行业',3,1,0,2),(81,180170,1,1101844,'level','客户级别',3,1,0,2),(82,180170,1,1101845,'next_time','下次联系时间',3,4,0,1),(83,180170,1,1101846,'remark','备注',3,1,0,1),(84,180170,1,NULL,'create_user_name','创建人',2,2,0,1),(85,180170,1,NULL,'create_time','创建时间',2,2,0,1),(86,180170,1,NULL,'update_time','更新时间',2,2,0,1),(87,180170,1,NULL,'owner_user_name','负责人',2,4,0,1),(88,180170,1,NULL,'owner_dept_name','所属部门',2,4,0,1),(89,180170,1,NULL,'last_content','最后跟进记录',2,2,0,1),(90,180170,1,NULL,'last_time','最后跟进时间',2,2,0,1),(91,180170,18,1101905,'invoice_apply_number','发票申请编号',3,1,0,1),(92,180170,18,1101906,'customer_id','客户名称',3,4,0,1),(93,180170,18,1101907,'contract_id','合同编号',3,4,0,1),(94,180170,18,1101908,'contract_money','合同金额',3,4,0,1),(95,180170,18,1101909,'invoice_money','开票金额',3,1,0,1),(96,180170,18,1101910,'invoice_date','开票日期',3,1,0,1),(97,180170,18,1101911,'invoice_type','开票类型',3,1,0,1),(98,180170,18,1101912,'remark','备注',3,1,0,1),(99,180170,18,NULL,'create_user_name','创建人',2,2,0,1),(100,180170,18,NULL,'create_time','创建时间',2,2,0,1),(101,180170,18,NULL,'update_time','更新时间',2,2,0,1),(102,180170,18,NULL,'owner_user_name','负责人',2,4,0,1),(103,180170,18,NULL,'owner_dept_name','所属部门',2,4,0,1);
/*!40000 ALTER TABLE `wk_crm_role_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_scene`
--

DROP TABLE IF EXISTS `wk_crm_scene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_scene` (
  `scene_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '分类',
  `name` varchar(50) NOT NULL COMMENT '场景名称',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `sort` int(11) NOT NULL COMMENT '排序ID',
  `data` text NOT NULL COMMENT '属性值',
  `is_hide` int(11) NOT NULL COMMENT '1隐藏',
  `is_system` int(11) NOT NULL COMMENT '1系统0自定义',
  `bydata` varchar(50) DEFAULT NULL COMMENT '系统参数',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`scene_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=688 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='场景';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_scene`
--

LOCK TABLES `wk_crm_scene` WRITE;
/*!40000 ALTER TABLE `wk_crm_scene` DISABLE KEYS */;
INSERT INTO `wk_crm_scene` VALUES (621,1,'全部线索',14773,0,'',0,1,'all','2024-09-18 18:02:35','2024-09-18 18:02:35'),(622,1,'我负责的线索',14773,0,'',0,1,'self','2024-09-18 18:02:35','2024-09-18 18:02:35'),(623,1,'下属负责的线索',14773,0,'',0,1,'child','2024-09-18 18:02:35','2024-09-18 18:02:35'),(624,1,'已转化的线索',14773,0,'[{\"values\":[\"1\"],\"name\":\"isTransform\",\"type\":1}]',0,1,'transform','2024-09-18 18:02:35','2024-09-18 18:02:35'),(625,1,'我关注的线索',14773,0,'[{\"values\":[\"1\"],\"name\":\"isTransform\",\"type\":1}]',0,1,'star','2024-09-18 18:02:35','2024-09-18 18:02:35'),(626,2,'全部客户',14773,0,'',0,1,'all','2024-09-18 18:02:39','2024-09-18 18:02:39'),(627,2,'我负责的客户',14773,0,'',0,1,'self','2024-09-18 18:02:39','2024-09-18 18:02:39'),(628,2,'下属负责的客户',14773,0,'',0,1,'child','2024-09-18 18:02:39','2024-09-18 18:02:39'),(629,2,'我关注的客户',14773,0,'',0,1,'star','2024-09-18 18:02:39','2024-09-18 18:02:39'),(630,5,'全部商机',14773,0,'',0,1,'all','2024-09-18 18:03:27','2024-09-18 18:03:27'),(631,5,'我负责的商机',14773,0,'',0,1,'self','2024-09-18 18:03:27','2024-09-18 18:03:27'),(632,5,'下属负责的商机',14773,0,'',0,1,'child','2024-09-18 18:03:27','2024-09-18 18:03:27'),(633,5,'我关注的商机',14773,0,'',0,1,'star','2024-09-18 18:03:27','2024-09-18 18:03:27'),(634,5,'赢单商机',14773,0,'[{\"values\":[1],\"name\":\"isEnd\",\"type\":1}]',0,1,'','2024-09-18 18:03:27','2024-09-18 18:03:27'),(635,5,'输单商机',14773,0,'[{\"values\":[2],\"name\":\"isEnd\",\"type\":1}]',0,1,'','2024-09-18 18:03:27','2024-09-18 18:03:27'),(636,5,'无效商机',14773,0,'[{\"values\":[3],\"name\":\"isEnd\",\"type\":1}]',0,1,'','2024-09-18 18:03:27','2024-09-18 18:03:27'),(637,5,'进行中的商机',14773,0,'[{\"values\":[0],\"name\":\"isEnd\",\"type\":1}]',0,1,'','2024-09-18 18:03:27','2024-09-18 18:03:27'),(638,17,'全部回访',14773,0,'',0,1,'all','2024-09-18 18:05:31','2024-09-18 18:05:31'),(639,17,'我负责的回访',14773,0,'',0,1,'self','2024-09-18 18:05:31','2024-09-18 18:05:31'),(640,17,'下属负责的回访',14773,0,'',0,1,'child','2024-09-18 18:05:31','2024-09-18 18:05:31'),(641,4,'全部产品',14773,0,'',0,1,'all','2024-09-18 20:36:44','2024-09-18 20:36:44'),(642,4,'上架的产品',14773,0,'[{\"values\":[1],\"name\":\"status\",\"type\":1}]',0,1,'','2024-09-18 20:36:44','2024-09-18 20:36:44'),(643,4,'下架的产品',14773,0,'[{\"values\":[0],\"name\":\"status\",\"type\":1}]',0,1,'','2024-09-18 20:36:44','2024-09-18 20:36:44'),(644,3,'全部联系人',14773,0,'',0,1,'all','2024-09-18 21:28:11','2024-09-18 21:28:11'),(645,3,'我负责的联系人',14773,0,'',0,1,'self','2024-09-18 21:28:11','2024-09-18 21:28:11'),(646,3,'下属负责的联系人',14773,0,'',0,1,'child','2024-09-18 21:28:11','2024-09-18 21:28:11'),(647,3,'我关注的联系人',14773,0,'',0,1,'star','2024-09-18 21:28:11','2024-09-18 21:28:11'),(648,6,'全部合同',14773,0,'',0,1,'all','2024-09-18 21:32:14','2024-09-18 21:32:14'),(649,6,'我负责的合同',14773,0,'',0,1,'self','2024-09-18 21:32:14','2024-09-18 21:32:14'),(650,6,'下属负责的合同',14773,0,'',0,1,'child','2024-09-18 21:32:14','2024-09-18 21:32:14'),(651,7,'全部回款',14773,0,'',0,1,'all','2024-09-18 21:34:49','2024-09-18 21:34:49'),(652,7,'我负责的回款',14773,0,'',0,1,'self','2024-09-18 21:34:49','2024-09-18 21:34:49'),(653,7,'下属负责的回款',14773,0,'',0,1,'child','2024-09-18 21:34:49','2024-09-18 21:34:49'),(654,18,'全部发票',14773,0,'',0,1,'all','2024-09-18 21:59:22','2024-09-18 21:59:22'),(655,18,'我负责的发票',14773,0,'',0,1,'self','2024-09-18 21:59:22','2024-09-18 21:59:22'),(656,18,'下属负责的发票',14773,0,'',0,1,'child','2024-09-18 21:59:22','2024-09-18 21:59:22'),(657,2,'全部客户',14774,0,'',0,1,'all','2024-09-20 10:26:59','2024-09-20 10:26:59'),(658,2,'我负责的客户',14774,0,'',0,1,'self','2024-09-20 10:26:59','2024-09-20 10:26:59'),(659,2,'下属负责的客户',14774,0,'',0,1,'child','2024-09-20 10:26:59','2024-09-20 10:26:59'),(660,2,'我关注的客户',14774,0,'',0,1,'star','2024-09-20 10:26:59','2024-09-20 10:26:59'),(661,2,'全部客户',14780,0,'',0,1,'all','2024-10-13 11:16:57','2024-10-13 11:16:57'),(662,2,'我负责的客户',14780,0,'',0,1,'self','2024-10-13 11:16:57','2024-10-13 11:16:57'),(663,2,'下属负责的客户',14780,0,'',0,1,'child','2024-10-13 11:16:57','2024-10-13 11:16:57'),(664,2,'我关注的客户',14780,0,'',0,1,'star','2024-10-13 11:16:57','2024-10-13 11:16:57'),(665,3,'全部联系人',14780,0,'',0,1,'all','2024-10-13 11:16:59','2024-10-13 11:16:59'),(666,3,'我负责的联系人',14780,0,'',0,1,'self','2024-10-13 11:16:59','2024-10-13 11:16:59'),(667,3,'下属负责的联系人',14780,0,'',0,1,'child','2024-10-13 11:16:59','2024-10-13 11:16:59'),(668,3,'我关注的联系人',14780,0,'',0,1,'star','2024-10-13 11:16:59','2024-10-13 11:16:59'),(669,5,'全部商机',14780,0,'',0,1,'all','2024-10-13 11:17:01','2024-10-13 11:17:01'),(670,5,'我负责的商机',14780,0,'',0,1,'self','2024-10-13 11:17:01','2024-10-13 11:17:01'),(671,5,'下属负责的商机',14780,0,'',0,1,'child','2024-10-13 11:17:01','2024-10-13 11:17:01'),(672,5,'我关注的商机',14780,0,'',0,1,'star','2024-10-13 11:17:01','2024-10-13 11:17:01'),(673,5,'赢单商机',14780,0,'[{\"values\":[1],\"name\":\"isEnd\",\"type\":1}]',0,1,'','2024-10-13 11:17:01','2024-10-13 11:17:01'),(674,5,'输单商机',14780,0,'[{\"values\":[2],\"name\":\"isEnd\",\"type\":1}]',0,1,'','2024-10-13 11:17:01','2024-10-13 11:17:01'),(675,5,'无效商机',14780,0,'[{\"values\":[3],\"name\":\"isEnd\",\"type\":1}]',0,1,'','2024-10-13 11:17:01','2024-10-13 11:17:01'),(676,5,'进行中的商机',14780,0,'[{\"values\":[0],\"name\":\"isEnd\",\"type\":1}]',0,1,'','2024-10-13 11:17:01','2024-10-13 11:17:01'),(677,6,'全部合同',14780,0,'',0,1,'all','2024-10-13 11:17:03','2024-10-13 11:17:03'),(678,6,'我负责的合同',14780,0,'',0,1,'self','2024-10-13 11:17:03','2024-10-13 11:17:03'),(679,6,'下属负责的合同',14780,0,'',0,1,'child','2024-10-13 11:17:03','2024-10-13 11:17:03'),(680,18,'全部发票',14780,0,'',0,1,'all','2024-10-14 09:39:22','2024-10-14 09:39:22'),(681,18,'我负责的发票',14780,0,'',0,1,'self','2024-10-14 09:39:22','2024-10-14 09:39:22'),(682,18,'下属负责的发票',14780,0,'',0,1,'child','2024-10-14 09:39:22','2024-10-14 09:39:22'),(683,1,'全部线索',14780,0,'',0,1,'all','2024-10-14 09:39:34','2024-10-14 09:39:34'),(684,1,'我负责的线索',14780,0,'',0,1,'self','2024-10-14 09:39:34','2024-10-14 09:39:34'),(685,1,'下属负责的线索',14780,0,'',0,1,'child','2024-10-14 09:39:34','2024-10-14 09:39:34'),(686,1,'已转化的线索',14780,0,'[{\"values\":[\"1\"],\"name\":\"isTransform\",\"type\":1}]',0,1,'transform','2024-10-14 09:39:34','2024-10-14 09:39:34'),(687,1,'我关注的线索',14780,0,'[{\"values\":[\"1\"],\"name\":\"isTransform\",\"type\":1}]',0,1,'star','2024-10-14 09:39:34','2024-10-14 09:39:34');
/*!40000 ALTER TABLE `wk_crm_scene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_scene_default`
--

DROP TABLE IF EXISTS `wk_crm_scene_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_scene_default` (
  `default_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type` int(11) NOT NULL COMMENT '类型',
  `user_id` bigint(20) NOT NULL COMMENT '人员ID',
  `scene_id` int(11) NOT NULL COMMENT '场景ID',
  PRIMARY KEY (`default_id`) USING BTREE,
  UNIQUE KEY `default_id` (`default_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='场景默认关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_scene_default`
--

LOCK TABLES `wk_crm_scene_default` WRITE;
/*!40000 ALTER TABLE `wk_crm_scene_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_scene_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_crm_team_members`
--

DROP TABLE IF EXISTS `wk_crm_team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_crm_team_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '类型，同crm类型',
  `type_id` int(11) NOT NULL COMMENT '对应类型主键ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `power` int(11) DEFAULT NULL COMMENT '1 只读 2 读写 3 负责人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `expires_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `type` (`type`,`type_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='crm团队成员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_crm_team_members`
--

LOCK TABLES `wk_crm_team_members` WRITE;
/*!40000 ALTER TABLE `wk_crm_team_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_crm_team_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_email_account`
--

DROP TABLE IF EXISTS `wk_email_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_email_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_account` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱账号',
  `email_password` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱密码',
  `send_nick` varchar(225) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发送昵称',
  `configuration_mode` int(11) DEFAULT '1' COMMENT '配置邮箱方式 1：自动配置 2：手动配置',
  `service_type` varchar(11) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收信服务类型 :POP3、IMAP',
  `receiving_server` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收信服务器地址',
  `is_receiving` int(11) DEFAULT '1' COMMENT '收信服务器是否启用ssl 代理 0：未启用 1：已启用',
  `receiving_ssl` varchar(12) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收信服务器 SSL 端口',
  `smtp_server` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'SMTP服务器',
  `is_smtp` int(11) DEFAULT '1' COMMENT 'smtp服务器是否启用ssl 代理 0：未启用 1：已启用',
  `smtp_ssl` varchar(12) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'smtp端口号',
  `signature` longtext COLLATE utf8mb4_bin COMMENT '个性签名',
  `email_count` int(11) DEFAULT NULL COMMENT '邮件总数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='邮箱账号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_email_account`
--

LOCK TABLES `wk_email_account` WRITE;
/*!40000 ALTER TABLE `wk_email_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_email_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_email_file`
--

DROP TABLE IF EXISTS `wk_email_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_email_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '文件名称',
  `file_size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `batch_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件批次ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `batch_id` (`batch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='邮箱附件名称表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_email_file`
--

LOCK TABLES `wk_email_file` WRITE;
/*!40000 ALTER TABLE `wk_email_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_email_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_email_lately`
--

DROP TABLE IF EXISTS `wk_email_lately`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_email_lately` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id 为空时表示不是列表客户 不为空时表示客户',
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(225) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='邮箱最近联系人';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_email_lately`
--

LOCK TABLES `wk_email_lately` WRITE;
/*!40000 ALTER TABLE `wk_email_lately` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_email_lately` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_email_record`
--

DROP TABLE IF EXISTS `wk_email_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_email_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_account_id` int(11) DEFAULT NULL COMMENT '发送账号id',
  `sender` varchar(225) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发送人昵称',
  `sender_email` longtext COLLATE utf8mb4_bin COMMENT '发送人邮箱',
  `receipt_name` longtext COLLATE utf8mb4_bin COMMENT '收据名称',
  `receipt_emails` longtext COLLATE utf8mb4_bin COMMENT '收件人邮箱集合 逗号分隔',
  `cc_name` longtext COLLATE utf8mb4_bin COMMENT '抄送名称',
  `cc_emails` longtext COLLATE utf8mb4_bin COMMENT '抄送邮箱 逗号隔开',
  `theme` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '主题',
  `attachment` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '附件',
  `content` longtext COLLATE utf8mb4_bin COMMENT '内容',
  `email_type` int(11) DEFAULT NULL COMMENT '邮箱类型 1：收件箱 2：发件箱 3：草稿箱 4：删除箱 5：垃圾箱',
  `is_read` int(11) DEFAULT '0' COMMENT '是否已读取 0：未读 1：已读',
  `is_start` int(11) DEFAULT '0' COMMENT '是否标星 0：未标星  1：已标星',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `record_type` int(11) DEFAULT NULL COMMENT '记录类型 1：发送 2：保存草稿 3：删除邮件 4：星标邮件 5：垃圾邮件 ',
  `message_id` int(11) DEFAULT NULL COMMENT '邮件消息id',
  `batch_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '批次ID',
  `is_del` int(11) DEFAULT '0' COMMENT '0:未删除 1：已删除',
  `email_uid` bigint(20) DEFAULT NULL COMMENT '邮件uid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='邮件记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_email_record`
--

LOCK TABLES `wk_email_record` WRITE;
/*!40000 ALTER TABLE `wk_email_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_email_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_examine`
--

DROP TABLE IF EXISTS `wk_examine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_examine` (
  `examine_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '审批类型ID',
  `examine_init_id` bigint(20) DEFAULT NULL COMMENT '审批类型初始化Id',
  `label` int(10) unsigned DEFAULT NULL COMMENT '0 OA 1 合同 2 回款 3发票 4薪资 5 采购审核 6采购退货审核 7销售审核 8 销售退货审核 9付款单审核10 回款单审核11盘点审核12调拨审核',
  `examine_icon` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图标',
  `examine_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '审批类型名称',
  `recheck_type` int(11) DEFAULT NULL COMMENT '撤回之后重新审核操作 1 从第一层开始 2 从拒绝的层级开始',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `status` int(11) DEFAULT NULL COMMENT '1 正常 2 停用 3 删除 ',
  `batch_id` varchar(36) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '批次ID',
  `remarks` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `user_ids` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '可见范围（员工）',
  `dept_ids` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '可见范围（部门）',
  `oa_type` int(11) DEFAULT '0' COMMENT '1 普通审批 2 请假审批 3 出差审批 4 加班审批 5 差旅报销 6 借款申请 0 自定义审批',
  PRIMARY KEY (`examine_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1072988 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='审批类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_examine`
--

LOCK TABLES `wk_examine` WRITE;
/*!40000 ALTER TABLE `wk_examine` DISABLE KEYS */;
INSERT INTO `wk_examine` VALUES (25375,25375,2,NULL,'回款审批流程',1,NULL,3,3,'38e4ecd1525111ebbe7418c04d26d688','','2021-05-07 14:00:50',14773,NULL,NULL,0),(25376,25376,1,NULL,'合同审批流程',1,NULL,3,1,'38e4f6e4525111ebbe7418c04d26d688','说明','2021-05-07 14:00:50',14773,NULL,NULL,0),(25377,25377,3,NULL,'发票审批流程',1,NULL,0,1,'38e4f798525111ebbe7418c04d26d688','','2021-05-07 14:00:50',0,NULL,NULL,0),(1072979,1072979,0,'wk wk-l-record,#3ABCFB','普通审批',1,'2019-04-26 15:06:34',3,1,'38efbcd2525111ebbe7418c04d26d688','普通审批','2021-05-07 14:00:50',3,'','',1),(1072980,1072980,0,'wk wk-leave,#00CAAB','请假审批',1,'2019-04-17 18:52:44',3,1,'38efbdd4525111ebbe7418c04d26d688','请假审批','2021-05-07 14:00:50',3,'','',2),(1072981,1072981,0,'wk wk-trip,#3ABCFB','出差审批',1,'2019-04-17 18:52:50',3,1,'38efbe57525111ebbe7418c04d26d688','出差审批','2021-05-07 14:00:50',3,'','',3),(1072982,1072982,0,'wk wk-overtime,#FAAD14','加班审批',1,'2019-04-17 18:52:59',3,1,'38efbe9f525111ebbe7418c04d26d688','加班审批','2021-05-07 14:00:50',3,'','',4),(1072983,1072983,0,'wk wk-reimbursement,#3ABCFB','差旅报销',1,'2019-04-17 18:53:13',3,1,'38efbee2525111ebbe7418c04d26d688','差旅报销','2021-05-07 14:00:50',3,'','',5),(1072984,1072984,0,'wk wk-go-out,#FF6033','借款申请',1,'2019-04-17 18:54:44',3,1,'38efbf24525111ebbe7418c04d26d688','借款申请','2021-05-07 14:00:50',3,'','',6),(1072985,25375,2,NULL,'回款审批流程',1,'2024-09-21 16:10:45',14773,2,'676e6d22c2a7468b906c0ccedf629829','','2024-09-21 16:10:45',14773,NULL,NULL,0),(1072986,1072986,0,'wk wk-approval-11,#3ABCFB','调休审批',1,'2024-10-10 09:05:10',14773,1,'6490183028154b858175334e15fad6b5','员工按需调休','2024-10-10 09:05:11',14773,'',',14852,',0),(1072987,1072987,1,NULL,'001',1,'2024-10-11 10:07:05',14773,3,'9952c400c8da42b68063fdbe3c0ce415','001流','2024-10-11 10:07:04',14773,NULL,NULL,0);
/*!40000 ALTER TABLE `wk_examine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_examine_condition`
--

DROP TABLE IF EXISTS `wk_examine_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_examine_condition` (
  `condition_id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '条件名称',
  `flow_id` int(11) NOT NULL COMMENT '审批流程ID',
  `priority` int(11) NOT NULL COMMENT '优先级 数字越低优先级越高',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `batch_id` varchar(36) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '批次ID',
  PRIMARY KEY (`condition_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='审批条件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_examine_condition`
--

LOCK TABLES `wk_examine_condition` WRITE;
/*!40000 ALTER TABLE `wk_examine_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_examine_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_examine_condition_data`
--

DROP TABLE IF EXISTS `wk_examine_condition_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_examine_condition_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_id` int(11) NOT NULL COMMENT '条件ID',
  `flow_id` int(11) NOT NULL COMMENT '审批流程ID',
  `field_id` int(11) DEFAULT NULL COMMENT '字段ID',
  `field_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字段名称',
  `condition_type` int(11) DEFAULT NULL COMMENT '连接条件 1 等于 2 大于 3 小于 4 大于等于 5 小于等于 6 两者之间 7 包含 8 员工 9 部门 10 角色',
  `value` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '值，json数组格式',
  `batch_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '批次ID',
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字段中文名称',
  `type` int(11) DEFAULT NULL COMMENT '字段类型 1 单行文本 2 多行文本 3 单选 4日期 5 数字 6 小数 7 手机  8 文件 9 多选 10 人员 11 附件 12 部门 13 日期时间 14 邮箱 15客户 16 商机 17 联系人 18 地图 19 产品类型 20 合同 21 回款计划',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='审批条件扩展字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_examine_condition_data`
--

LOCK TABLES `wk_examine_condition_data` WRITE;
/*!40000 ALTER TABLE `wk_examine_condition_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_examine_condition_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_examine_flow`
--

DROP TABLE IF EXISTS `wk_examine_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_examine_flow` (
  `flow_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审核流程ID',
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '流程名称',
  `examine_id` bigint(20) unsigned DEFAULT NULL COMMENT '审批ID',
  `examine_type` int(11) NOT NULL COMMENT '0 条件 1 指定成员 2 主管 3 角色 4 发起人自选 5 连续多级主管',
  `examine_error_handling` int(11) NOT NULL DEFAULT '1' COMMENT '审批找不到用户或者条件均不满足时怎么处理 1 自动通过 2 管理员审批',
  `condition_id` int(11) NOT NULL DEFAULT '0' COMMENT '条件ID',
  `sort` int(11) NOT NULL COMMENT '执行顺序，不可为空',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `batch_id` varchar(36) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '批次ID',
  PRIMARY KEY (`flow_id`) USING BTREE,
  KEY `examine_id` (`examine_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1163347 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='审批流程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_examine_flow`
--

LOCK TABLES `wk_examine_flow` WRITE;
/*!40000 ALTER TABLE `wk_examine_flow` DISABLE KEYS */;
INSERT INTO `wk_examine_flow` VALUES (1163333,'业务审批6375',25375,4,2,0,1,NULL,3,'38e4ecd1525111ebbe7418c04d26d688'),(1163334,'业务审批3841',25376,4,2,0,1,NULL,3,'38e4f6e4525111ebbe7418c04d26d688'),(1163335,'业务审批3682',25377,4,2,0,1,NULL,0,'38e4f798525111ebbe7418c04d26d688'),(1163336,'办公审批3621',1072979,4,2,0,1,'2019-04-26 15:06:34',3,'38efbcd2525111ebbe7418c04d26d688'),(1163337,'办公审批1325',1072980,4,2,0,1,'2019-04-17 18:52:44',3,'38efbdd4525111ebbe7418c04d26d688'),(1163338,'办公审批6681',1072981,4,2,0,1,'2019-04-17 18:52:50',3,'38efbe57525111ebbe7418c04d26d688'),(1163339,'办公审批2494',1072982,4,2,0,1,'2019-04-17 18:52:59',3,'38efbe9f525111ebbe7418c04d26d688'),(1163340,'办公审批8739',1072983,4,2,0,1,'2019-04-17 18:53:13',3,'38efbee2525111ebbe7418c04d26d688'),(1163341,'办公审批8180',1072984,4,2,0,1,'2019-04-17 18:54:44',3,'38efbf24525111ebbe7418c04d26d688'),(1163342,'审批人',1072985,2,2,0,1,'2024-09-21 16:10:45',14773,'676e6d22c2a7468b906c0ccedf629829'),(1163343,'业务审批6375',1072985,4,2,0,2,'2024-09-21 16:10:45',14773,'676e6d22c2a7468b906c0ccedf629829'),(1163344,'审批人',1072986,1,2,0,1,'2024-10-10 09:05:12',14773,'6490183028154b858175334e15fad6b5'),(1163345,'审批人',1072987,1,2,0,1,'2024-10-11 10:07:05',14773,'9952c400c8da42b68063fdbe3c0ce415'),(1163346,'审批人',1072987,2,2,0,2,'2024-10-11 10:07:05',14773,'9952c400c8da42b68063fdbe3c0ce415');
/*!40000 ALTER TABLE `wk_examine_flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_examine_flow_continuous_superior`
--

DROP TABLE IF EXISTS `wk_examine_flow_continuous_superior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_examine_flow_continuous_superior` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL COMMENT '审批流程ID',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `max_level` int(11) DEFAULT NULL COMMENT '角色审批的最高级别或者组织架构的第N级',
  `type` int(11) DEFAULT NULL COMMENT '1 指定角色 2 组织架构的最上级',
  `batch_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '批次ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='审批流程连续多级主管审批记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_examine_flow_continuous_superior`
--

LOCK TABLES `wk_examine_flow_continuous_superior` WRITE;
/*!40000 ALTER TABLE `wk_examine_flow_continuous_superior` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_examine_flow_continuous_superior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_examine_flow_member`
--

DROP TABLE IF EXISTS `wk_examine_flow_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_examine_flow_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL COMMENT '审批流程ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '审批人ID',
  `type` int(11) DEFAULT NULL COMMENT '1 依次审批 2 会签 3 或签',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序规则',
  `batch_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '批次ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='审批流程指定成员记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_examine_flow_member`
--

LOCK TABLES `wk_examine_flow_member` WRITE;
/*!40000 ALTER TABLE `wk_examine_flow_member` DISABLE KEYS */;
INSERT INTO `wk_examine_flow_member` VALUES (1,1163344,14773,1,0,'6490183028154b858175334e15fad6b5'),(2,1163345,14776,1,0,'9952c400c8da42b68063fdbe3c0ce415');
/*!40000 ALTER TABLE `wk_examine_flow_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_examine_flow_optional`
--

DROP TABLE IF EXISTS `wk_examine_flow_optional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_examine_flow_optional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL COMMENT '审核流程ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '审批人ID',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `choose_type` int(11) DEFAULT NULL COMMENT '选择类型 1 自选一人 2 自选多人',
  `type` int(11) DEFAULT NULL COMMENT '1 依次审批 2 会签 3 或签',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序规则',
  `batch_id` varchar(36) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '批次ID',
  `range_type` int(11) DEFAULT NULL COMMENT '选择范围 1 全公司 2 指定成员 3 指定角色 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `flow_id` (`flow_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1313993 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='审批流程自选成员记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_examine_flow_optional`
--

LOCK TABLES `wk_examine_flow_optional` WRITE;
/*!40000 ALTER TABLE `wk_examine_flow_optional` DISABLE KEYS */;
INSERT INTO `wk_examine_flow_optional` VALUES (1313980,1163333,NULL,NULL,2,1,0,'38e4ecd1525111ebbe7418c04d26d688',1),(1313981,1163334,NULL,NULL,2,1,0,'38e4f6e4525111ebbe7418c04d26d688',1),(1313982,1163335,NULL,NULL,2,1,0,'38e4f798525111ebbe7418c04d26d688',1),(1313983,1163333,NULL,NULL,2,1,0,'38e4ecd1525111ebbe7418c04d26d688',1),(1313984,1163334,NULL,NULL,2,1,0,'38e4f6e4525111ebbe7418c04d26d688',1),(1313985,1163335,NULL,NULL,2,1,0,'38e4f798525111ebbe7418c04d26d688',1),(1313986,1163336,NULL,NULL,2,1,0,'38efbcd2525111ebbe7418c04d26d688',1),(1313987,1163337,NULL,NULL,2,1,0,'38efbdd4525111ebbe7418c04d26d688',1),(1313988,1163338,NULL,NULL,2,1,0,'38efbe57525111ebbe7418c04d26d688',1),(1313989,1163339,NULL,NULL,2,1,0,'38efbe9f525111ebbe7418c04d26d688',1),(1313990,1163340,NULL,NULL,2,1,0,'38efbee2525111ebbe7418c04d26d688',1),(1313991,1163341,NULL,NULL,2,1,0,'38efbf24525111ebbe7418c04d26d688',1),(1313992,1163343,NULL,NULL,2,1,1,'676e6d22c2a7468b906c0ccedf629829',1);
/*!40000 ALTER TABLE `wk_examine_flow_optional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_examine_flow_role`
--

DROP TABLE IF EXISTS `wk_examine_flow_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_examine_flow_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL COMMENT '审核流程ID',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `type` int(11) DEFAULT NULL COMMENT '2 会签 3 或签',
  `batch_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '批次ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='审批流程角色审批记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_examine_flow_role`
--

LOCK TABLES `wk_examine_flow_role` WRITE;
/*!40000 ALTER TABLE `wk_examine_flow_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_examine_flow_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_examine_flow_superior`
--

DROP TABLE IF EXISTS `wk_examine_flow_superior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_examine_flow_superior` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL COMMENT '审核流程ID',
  `parent_level` int(11) DEFAULT NULL COMMENT '直属上级级别 1 代表直属上级 2 代表 直属上级的上级',
  `type` int(11) DEFAULT NULL COMMENT '找不到上级时，是否由上一级上级代审批 0 否 1 是',
  `batch_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '批次ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='审批流程主管审批记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_examine_flow_superior`
--

LOCK TABLES `wk_examine_flow_superior` WRITE;
/*!40000 ALTER TABLE `wk_examine_flow_superior` DISABLE KEYS */;
INSERT INTO `wk_examine_flow_superior` VALUES (1,1163342,1,1,'676e6d22c2a7468b906c0ccedf629829'),(2,1163346,1,1,'9952c400c8da42b68063fdbe3c0ce415');
/*!40000 ALTER TABLE `wk_examine_flow_superior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_examine_manager_user`
--

DROP TABLE IF EXISTS `wk_examine_manager_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_examine_manager_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `examine_id` bigint(20) unsigned NOT NULL COMMENT '审批ID',
  `user_id` bigint(20) NOT NULL COMMENT '管理员ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '从小到大',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `examine_id` (`examine_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=527849 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='审批管理员设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_examine_manager_user`
--

LOCK TABLES `wk_examine_manager_user` WRITE;
/*!40000 ALTER TABLE `wk_examine_manager_user` DISABLE KEYS */;
INSERT INTO `wk_examine_manager_user` VALUES (527837,25375,14773,0),(527838,25376,14773,0),(527839,25377,14773,0),(527840,1072979,14773,0),(527841,1072980,14773,0),(527842,1072981,14773,0),(527843,1072982,14773,0),(527844,1072983,14773,0),(527845,1072984,14773,0),(527846,1072985,14773,1),(527847,1072986,14773,1),(527848,1072987,14778,1);
/*!40000 ALTER TABLE `wk_examine_manager_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_examine_record`
--

DROP TABLE IF EXISTS `wk_examine_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_examine_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审核记录ID',
  `examine_id` bigint(20) NOT NULL COMMENT '审核ID',
  `label` int(11) DEFAULT NULL COMMENT '业务类型',
  `flow_id` int(11) NOT NULL COMMENT '流程ID',
  `type_id` int(11) DEFAULT NULL COMMENT '关联业务主键ID',
  `examine_status` int(11) DEFAULT NULL COMMENT '审核状态 0 未审核 1 审核通过 2 审核拒绝 3 审核中 4 已撤回',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `update_user_id` bigint(20) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1004983 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='审核记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_examine_record`
--

LOCK TABLES `wk_examine_record` WRITE;
/*!40000 ALTER TABLE `wk_examine_record` DISABLE KEYS */;
INSERT INTO `wk_examine_record` VALUES (1004974,25376,1,1163334,1,1,'2024-09-18 21:34:29',14773,'2024-09-18 21:34:29',14773),(1004975,25377,3,1163335,1,3,'2024-09-19 15:11:39',14773,'2024-09-19 15:11:39',14773),(1004976,25375,2,1163333,1,3,'2024-09-19 15:14:27',14773,'2024-09-19 15:14:27',14773),(1004977,1072979,0,1163336,1,1,'2024-09-20 10:18:58',14773,'2024-09-20 10:18:58',14773),(1004978,1072982,0,1163339,2,3,'2024-09-20 10:25:41',14773,'2024-09-20 10:25:41',14773),(1004980,1072981,0,1163338,3,4,'2024-09-20 10:46:10',14773,'2024-09-20 10:46:10',14773),(1004981,1072984,0,1163341,4,4,'2024-10-10 09:48:44',14773,'2024-10-10 09:48:44',14773),(1004982,1072982,0,1163339,5,1,'2024-10-10 09:53:26',14773,'2024-10-10 09:53:26',14773);
/*!40000 ALTER TABLE `wk_examine_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_examine_record_log`
--

DROP TABLE IF EXISTS `wk_examine_record_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_examine_record_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `examine_id` bigint(20) NOT NULL COMMENT '审批ID',
  `flow_id` int(11) NOT NULL COMMENT '审批流程ID',
  `record_id` int(11) NOT NULL COMMENT '审批记录ID',
  `type` int(11) DEFAULT NULL COMMENT '1 依次审批 2 会签 3 或签',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `examine_status` int(11) NOT NULL COMMENT '审核状态0待审核、1通过、2拒绝、3审核中 4:撤回 5 未提交 6 创建 7 已删除 8 作废',
  `examine_user_id` bigint(20) DEFAULT '0' COMMENT '审核人ID',
  `examine_role_id` int(11) DEFAULT '0' COMMENT '审核角色ID',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `batch_id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '批次ID',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '审核备注',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1137848 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='审核流程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_examine_record_log`
--

LOCK TABLES `wk_examine_record_log` WRITE;
/*!40000 ALTER TABLE `wk_examine_record_log` DISABLE KEYS */;
INSERT INTO `wk_examine_record_log` VALUES (1137829,25376,1163334,1004974,NULL,0,6,0,0,14773,'2024-09-18 21:34:29',NULL,'867f285b800545ecae2d08346130cdbd',NULL),(1137830,25376,1163334,1004974,1,0,1,14773,0,14773,'2024-09-18 21:34:30','2024-09-19 15:09:26','0d45b29b3aa94f14a1d0a1c46dc08e92',''),(1137831,25377,1163335,1004975,NULL,0,6,0,0,14773,'2024-09-19 15:11:39',NULL,'9a632938775d46e6965b8f18d0372e25',NULL),(1137832,25377,1163335,1004975,1,0,3,14777,0,14773,'2024-09-19 15:11:39','2024-09-19 15:11:39','186044de9d4f4bbea8295511de6920d4',NULL),(1137833,25375,1163333,1004976,NULL,0,6,0,0,14773,'2024-09-19 15:14:27',NULL,'ec9f5c674ab74da88bdca7bdf2822bbc',NULL),(1137834,25375,1163333,1004976,1,0,3,14776,0,14773,'2024-09-19 15:14:27','2024-09-19 15:14:27','9f36a641393842998277190310dbf73d',NULL),(1137835,1072979,1163336,1004977,NULL,0,6,0,0,14773,'2024-09-20 10:18:58',NULL,'d9db9893705e48d18aa290129040c6be',NULL),(1137836,1072979,1163336,1004977,1,0,1,14774,0,14773,'2024-09-20 10:18:58','2024-09-20 10:30:27','556ebb636c804eceb4385d200ab0798c','没有意见'),(1137837,1072982,1163339,1004978,NULL,0,6,0,0,14773,'2024-09-20 10:25:41',NULL,'c8392e64543347b6be76e3340c45ac3e',NULL),(1137838,1072982,1163339,1004978,1,0,3,14775,0,14773,'2024-09-20 10:25:41','2024-09-20 10:25:41','61f5d2e02e5f4d1c92f91ab6309440ff',NULL),(1137842,1072981,1163338,1004980,NULL,0,6,0,0,14773,'2024-09-20 10:46:10',NULL,'3f71c58e0b1e441db6d4c15cdeb51d6c',NULL),(1137843,1072981,1163338,1004980,1,0,4,14777,0,14773,'2024-09-20 10:46:10','2024-09-20 15:48:03','d0d5dbd7a7e5487180d0e9ba60e05b52','不需要了'),(1137844,1072984,1163341,1004981,NULL,0,6,0,0,14773,'2024-10-10 09:48:44',NULL,'5f9348768e6247a5a24714b46137bd0a',NULL),(1137845,1072984,1163341,1004981,1,0,4,14773,0,14773,'2024-10-10 09:48:45','2024-10-10 18:58:18','2c7e73c79b8b4dc4828a7df51266d14c','不需要了'),(1137846,1072982,1163339,1004982,NULL,0,6,0,0,14773,'2024-10-10 09:53:26',NULL,'3b74c5e3909b4e34b5ea61fa586e9ac3',NULL),(1137847,1072982,1163339,1004982,1,0,1,14773,0,14773,'2024-10-10 09:53:27','2024-10-10 14:39:19','c58cb64083f94c93944c659232c7453d','没有意见');
/*!40000 ALTER TABLE `wk_examine_record_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_examine_record_optional`
--

DROP TABLE IF EXISTS `wk_examine_record_optional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_examine_record_optional` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `flow_id` int(11) NOT NULL COMMENT '流程ID',
  `record_id` int(11) NOT NULL COMMENT '审核记录ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序。从小到大',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='审核自选成员选择成员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_examine_record_optional`
--

LOCK TABLES `wk_examine_record_optional` WRITE;
/*!40000 ALTER TABLE `wk_examine_record_optional` DISABLE KEYS */;
INSERT INTO `wk_examine_record_optional` VALUES (326,1163334,1004974,14773,0),(327,1163335,1004975,14777,0),(328,1163333,1004976,14776,0),(329,1163336,1004977,14774,0),(330,1163339,1004978,14775,0),(333,1163338,1004980,14777,0),(334,1163341,1004981,14773,0),(335,1163339,1004982,14773,0);
/*!40000 ALTER TABLE `wk_examine_record_optional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_km_action_record`
--

DROP TABLE IF EXISTS `wk_km_action_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_km_action_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL COMMENT '1 浏览 2 删除',
  `type` int(11) NOT NULL COMMENT '1 知识库 2 文件夹 3 文档 4 文件 ',
  `type_id` int(11) NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='知识库操作记录（最近使用）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_km_action_record`
--

LOCK TABLES `wk_km_action_record` WRITE;
/*!40000 ALTER TABLE `wk_km_action_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_km_action_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_km_auth`
--

DROP TABLE IF EXISTS `wk_km_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_km_auth` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `is_open` int(11) DEFAULT NULL COMMENT '是否公开 0 私有 1 公开',
  `open_auth` int(11) DEFAULT NULL COMMENT '公开权限 2 均可编辑 3 均可见，不可编辑',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='文档文件夹权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_km_auth`
--

LOCK TABLES `wk_km_auth` WRITE;
/*!40000 ALTER TABLE `wk_km_auth` DISABLE KEYS */;
INSERT INTO `wk_km_auth` VALUES (87,1,2),(88,1,2),(89,1,2),(90,1,2),(91,1,2);
/*!40000 ALTER TABLE `wk_km_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_km_auth_user`
--

DROP TABLE IF EXISTS `wk_km_auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_km_auth_user` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `auth` int(11) DEFAULT NULL COMMENT '私有权限 1 所有权限 2 编辑权限 3只读权限',
  `create_time` datetime DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='知识库权限用户关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_km_auth_user`
--

LOCK TABLES `wk_km_auth_user` WRITE;
/*!40000 ALTER TABLE `wk_km_auth_user` DISABLE KEYS */;
INSERT INTO `wk_km_auth_user` VALUES (142,87,14773,1,'2020-08-22 16:11:27',14773),(143,88,14773,1,'2020-08-22 16:11:27',14773),(144,89,14773,1,'2020-08-22 16:11:27',14773),(145,90,14773,1,'2020-08-22 16:11:27',14773),(146,91,14773,1,'2020-08-22 16:11:27',14773);
/*!40000 ALTER TABLE `wk_km_auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_km_collect`
--

DROP TABLE IF EXISTS `wk_km_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_km_collect` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '1 知识库 2 文件夹 3 文件',
  `type_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='知识库收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_km_collect`
--

LOCK TABLES `wk_km_collect` WRITE;
/*!40000 ALTER TABLE `wk_km_collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_km_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_km_document`
--

DROP TABLE IF EXISTS `wk_km_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_km_document` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '文档标题',
  `content` longtext COLLATE utf8mb4_bin,
  `type` int(11) NOT NULL COMMENT '3 富文本 4 文件',
  `parent_id` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1' COMMENT '-1 删除 0 草稿 1 正常 2 模板',
  `library_id` int(11) DEFAULT NULL,
  `folder_id` int(11) NOT NULL COMMENT '文件夹id',
  `auth_id` int(11) DEFAULT NULL,
  `label_ids` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标签id',
  `create_time` datetime NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_user_id` bigint(20) DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`document_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='知识库文档表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_km_document`
--

LOCK TABLES `wk_km_document` WRITE;
/*!40000 ALTER TABLE `wk_km_document` DISABLE KEYS */;
INSERT INTO `wk_km_document` VALUES (85,'产品需求文档','<div id=\"wk-knowledge-title-wukong\">\n<p id=\"wk-knowledge-content-wukong\">产品需求文档</p>\n</div>\n<h1 style=\"mso-pagination: widow-orphan;\">基本信息</h1>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">目标上线时间：请输入时间</p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">项目人员</h1>\n<p class=\"MsoNormal\" style=\"margin-left: 21.0pt; text-align: left; text-indent: -21.0pt; mso-pagination: widow-orphan; mso-list: l0 level1 lfo1;\" align=\"left\"><!-- [if !supportLists]--><span lang=\"EN-US\"><span style=\"mso-list: Ignore;\">l<span style=\"font-style: normal; font-variant: normal; font-stretch: normal; line-height: normal;\">&nbsp; </span></span></span><!--[endif]-->产品：请输入人员<a name=\"_GoBack\"></a></p>\n<p class=\"MsoNormal\" style=\"margin-left: 21.0pt; text-align: left; text-indent: -21.0pt; mso-pagination: widow-orphan; mso-list: l0 level1 lfo1;\" align=\"left\"><!-- [if !supportLists]--><span lang=\"EN-US\"><span style=\"mso-list: Ignore;\">l<span style=\"font-style: normal; font-variant: normal; font-stretch: normal; line-height: normal;\">&nbsp; </span></span></span><!--[endif]-->设计：请输入人员</p>\n<p class=\"MsoNormal\" style=\"margin-left: 21.0pt; text-align: left; text-indent: -21.0pt; mso-pagination: widow-orphan; mso-list: l0 level1 lfo1;\" align=\"left\"><!-- [if !supportLists]--><span lang=\"EN-US\"><span style=\"mso-list: Ignore;\">l<span style=\"font-style: normal; font-variant: normal; font-stretch: normal; line-height: normal;\">&nbsp; </span></span></span><!--[endif]-->研发：请输入人员</p>\n<p class=\"MsoNormal\" style=\"margin-left: 21.0pt; text-align: left; text-indent: -21.0pt; mso-pagination: widow-orphan; mso-list: l0 level1 lfo1;\" align=\"left\"><!-- [if !supportLists]--><span lang=\"EN-US\"><span style=\"mso-list: Ignore;\">l<span style=\"font-style: normal; font-variant: normal; font-stretch: normal; line-height: normal;\">&nbsp; </span></span></span><!--[endif]-->测试：请输入人员</p>\n<p class=\"MsoNormal\" style=\"margin-left: 36.0pt; text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">需求背景</h1>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">描述产品需求诞生的背景；我们为什么要做这件事情，和战略方向的契合点。</p>\n<h1 style=\"mso-pagination: widow-orphan;\">产品目标</h1>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">描述产品的目标用户，以及期望通过产品实现的核心目标。</p>\n<p class=\"MsoNormal\" style=\"margin-left: 36.0pt; text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">衡量指标</h1>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">用于衡量产品成功的关键指标</p>\n<p class=\"MsoNormal\" style=\"margin-left: 36.0pt; text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"margin-left: 36.0pt; text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">产品需求</p>\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\n<td style=\"width: 106.5pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n<td style=\"width: 106.5pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">作为</p>\n</td>\n<td style=\"width: 106.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">我想要的</p>\n</td>\n<td style=\"width: 106.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">以便于</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 1;\">\n<td style=\"width: 106.5pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">1</span></p>\n</td>\n<td style=\"width: 106.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">产品经理</p>\n</td>\n<td style=\"width: 106.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">从模版直接创建产品需求文档的功能</p>\n</td>\n<td style=\"width: 106.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">快速并有条理的进行需求文档的撰写</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 2; mso-yfti-lastrow: yes;\">\n<td style=\"width: 106.5pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">2</span></p>\n</td>\n<td style=\"width: 106.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">团队负责人</p>\n</td>\n<td style=\"width: 106.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">自定义文档模版的能力</p>\n</td>\n<td style=\"width: 106.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">规范不同场景下的撰写文档的格式和要求</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">功能及界面设计</h1>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">描述详细功能设计，以及相关的线框设计、视觉设计图。</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">+</span>上传图片</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">+</span>上传附件</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">问题</p>\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\n<td style=\"width: 47.95pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"64\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">#</span></p>\n</td>\n<td style=\"width: 224.75pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"300\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">问题</p>\n</td>\n<td style=\"width: 153.0pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"204\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">结论</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 1;\">\n<td style=\"width: 47.95pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"64\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">1</span></p>\n</td>\n<td style=\"width: 224.75pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"300\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">描述评审、研发等过程中发现的问题</p>\n</td>\n<td style=\"width: 153.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"204\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">描述最终讨论得出的决定</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 2; mso-yfti-lastrow: yes; height: 22.15pt;\">\n<td style=\"width: 47.95pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.15pt;\" valign=\"top\" width=\"64\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">2</span></p>\n</td>\n<td style=\"width: 224.75pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.15pt;\" valign=\"top\" width=\"300\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n<td style=\"width: 153.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.15pt;\" valign=\"top\" width=\"204\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n</tr>\n</tbody>\n</table>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">暂不支持</h1>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">由于受限团队目标、技术、时间等不支持的功能</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">附录</h1>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">+</span>上传附件</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>',3,0,1,25,0,87,NULL,'2020-08-22 16:11:27',14773,'2020-08-22 16:11:27',NULL,NULL),(86,'会议纪要','<div id=\"wk-knowledge-title-wukong\">\n<p id=\"wk-knowledge-content-wukong\" style=\"font-size: 24pt; font-weight: bold;\">会议纪要</p>\n</div>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">产品研发团队的周会纪要</p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">日期：请输入日期</p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">与会人员：请输入人员</p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">目标</h1>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">制定本次会议的目标或者描述会议的上下文。</p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">议程</h1>\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\n<td style=\"width: 47.95pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"64\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">#</span></p>\n</td>\n<td style=\"width: 165.05pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"220\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">议题</p>\n</td>\n<td style=\"width: 106.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">负责人</p>\n</td>\n<td style=\"width: 106.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">时间</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 1; mso-yfti-lastrow: yes;\">\n<td style=\"width: 47.95pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"64\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">1</span></p>\n</td>\n<td style=\"width: 165.05pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"220\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">议题内容描述</p>\n</td>\n<td style=\"width: 106.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">人员姓名</p>\n</td>\n<td style=\"width: 106.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">持续时间</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">记录</h1>\n<p class=\"MsoListParagraph\" style=\"margin-left: 21.0pt; text-align: left; text-indent: -21.0pt; mso-char-indent-count: 0; mso-pagination: widow-orphan; mso-list: l0 level1 lfo1;\" align=\"left\"><!-- [if !supportLists]--><span lang=\"EN-US\"><span style=\"mso-list: Ignore;\">l<span style=\"font-style: normal; font-variant: normal; font-stretch: normal; line-height: normal;\">&nbsp; </span></span></span><!--[endif]-->会议要点<span lang=\"EN-US\">1</span></p>\n<p class=\"MsoListParagraph\" style=\"margin-left: 21.0pt; text-align: left; text-indent: -21.0pt; mso-char-indent-count: 0; mso-pagination: widow-orphan; mso-list: l0 level1 lfo1;\" align=\"left\"><!-- [if !supportLists]--><span lang=\"EN-US\"><span style=\"mso-list: Ignore;\">l<span style=\"font-style: normal; font-variant: normal; font-stretch: normal; line-height: normal;\">&nbsp; </span></span></span><!--[endif]-->会议要点<span lang=\"EN-US\">2</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\"><a name=\"_GoBack\"></a>后续工作</h1>\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\n<td style=\"width: 62.1pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"83\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">负责人</p>\n</td>\n<td style=\"width: 150.9pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"201\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">工作安排</p>\n</td>\n<td style=\"width: 106.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">执行人</p>\n</td>\n<td style=\"width: 106.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">截止时间</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 1; mso-yfti-lastrow: yes;\">\n<td style=\"width: 62.1pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"83\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">人员姓名</p>\n</td>\n<td style=\"width: 150.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"201\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">工作安排项</p>\n</td>\n<td style=\"width: 106.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">人员姓名</p>\n</td>\n<td style=\"width: 106.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">截止时间</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>',3,0,1,25,0,88,NULL,'2020-08-22 16:11:27',14773,'2020-08-22 16:11:27',NULL,NULL),(87,'技术文档','<div id=\"wk-knowledge-title-wukong\">\n<p id=\"wk-knowledge-content-wukong\" style=\"font-size: 24pt; font-weight: bold;\">技术文档</p>\n</div>\n<p class=\"MsoNormal\">标题</p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\">在这里描述</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan; tab-stops: 45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt 412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">1//</span>在这里编写代码</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">2</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">3</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">4</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">5</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">+ </span>上传图片</p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\"><a name=\"_GoBack\"></a><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\">标题</p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\">在这里描述</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan; tab-stops: 45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt 412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">1//</span>在这里编写代码</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">2</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">3</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">4</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">5</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">+ </span>上传图片</p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>',3,0,1,25,0,89,NULL,'2020-08-22 16:11:27',14773,'2020-08-22 16:11:27',NULL,NULL),(88,'竞品分析','<div id=\"wk-knowledge-title-wukong\">\n<p id=\"wk-knowledge-content-wukong\" style=\"font-size: 24pt; font-weight: bold;\">竞品分析</p>\n</div>\n<h1 style=\"mso-pagination: widow-orphan;\">目的</h1>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">描述做这次竞品分析的目的，因为不同的目的侧重点也会有所差异。</p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">可能是为了寻找可借鉴学习之处；可能是为了摸查竞争对手情况做好应对策略；也有可能是作为融资计划的参考<a name=\"_GoBack\"></a>数据。</p>\n<h1 style=\"mso-pagination: widow-orphan;\">市场分析</h1>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">描述目前行业市场的相关信息，可以通过以下渠道收集信息：</p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">从公司内部市场、运营部门、管理层等收集信息；行业媒体平台新闻及论坛及<span lang=\"EN-US\">QQ</span>群，搜索引擎，比如艾瑞咨询，<span lang=\"EN-US\">AppAnnie</span>；行业专家博客、微博、微信公众账号订阅。</p>\n<h1 style=\"mso-pagination: widow-orphan;\">竞品概况</h1>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">描述竞品相关的一些信息，比如公司团队状况、产品定位、核心数据分析、盈利模式等等。</p>\n<h1 style=\"mso-pagination: widow-orphan;\">产品分析</h1>\n<h2 style=\"mso-pagination: widow-orphan;\">产品功能</h2>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">可以从产品基本信息、产品功能逻辑、产品渠道（平台）等方面进行分析。</p>\n<h2 style=\"mso-pagination: widow-orphan;\">产品交互设计</h2>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">通过截图的方式对比交互和设计内容，可以包含：主要风格、色彩体系、布局结构、品质感、字体、功能页面比较。</p>\n<h2 style=\"mso-pagination: widow-orphan;\">技术分析</h2>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">以移动<span lang=\"EN-US\">App</span>举例，技术分析包含：应用大小、启动时长、功能页面加载时长、<span lang=\"EN-US\">CPU</span>、内存消耗、崩溃率、版本迭代速度等。 这需要根据不同产品进行不同的技术分析。</p>\n<h1 style=\"mso-pagination: widow-orphan;\">产品优劣势</h1>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">综合评价所选竞品的优势势，以及各自其中的机会和威胁。</p>\n<h1 style=\"mso-pagination: widow-orphan;\">总结</h1>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">分析的结论一般可以包括两大部分，一是对研究对象的分析总结，二是对自己的行动建议。</p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>',3,0,1,25,0,90,NULL,'2020-08-22 16:11:27',14773,'2020-08-22 16:11:27',NULL,NULL),(89,'产品规划','<div id=\"wk-knowledge-title-wukong\">\n<p id=\"wk-knowledge-content-wukong\" style=\"font-size: 24pt; font-weight: bold;\">产品规划</p>\n</div>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">发布时间：请输入日期</p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">产品负责人：请输入人员</p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\"><span lang=\"EN-US\">Sprint 1</span></h1>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">时间：请输入起止时间</p>\n<p>工作项：</p>\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">该冲刺的工作项</p>\n</td>\n<td style=\"width: 77.95pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">执行人</p>\n</td>\n<td style=\"width: 127.6pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">截止时间</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 1;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">工作项<span lang=\"EN-US\">1</span></p>\n</td>\n<td style=\"width: 77.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">人员姓名</p>\n</td>\n<td style=\"width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">截止时间</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 2; mso-yfti-lastrow: yes;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">工作项<span lang=\"EN-US\">2</span></p>\n</td>\n<td style=\"width: 77.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n<td style=\"width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n</tr>\n</tbody>\n</table>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\"><span lang=\"EN-US\">Sprint 2</span></h1>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">时间：请输入起止时间</p>\n<p>工作项：</p>\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">该冲刺的工作项</p>\n</td>\n<td style=\"width: 77.95pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">执行人</p>\n</td>\n<td style=\"width: 127.6pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">截止时间</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 1;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">工作项<span lang=\"EN-US\">1</span></p>\n</td>\n<td style=\"width: 77.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">人员姓名</p>\n</td>\n<td style=\"width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">截止时间</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 2; mso-yfti-lastrow: yes;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">工作项<span lang=\"EN-US\">2</span></p>\n</td>\n<td style=\"width: 77.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n<td style=\"width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n</tr>\n</tbody>\n</table>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\"><span lang=\"EN-US\">Sprint 3<a name=\"_GoBack\"></a></span></h1>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">时间：请输入起止时间</p>\n<p>工作项：</p>\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">该冲刺的工作项</p>\n</td>\n<td style=\"width: 77.95pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">执行人</p>\n</td>\n<td style=\"width: 127.6pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">截止时间</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 1;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">工作项<span lang=\"EN-US\">1</span></p>\n</td>\n<td style=\"width: 77.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">人员姓名</p>\n</td>\n<td style=\"width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">截止时间</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 2; mso-yfti-lastrow: yes;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">工作项<span lang=\"EN-US\">2</span></p>\n</td>\n<td style=\"width: 77.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n<td style=\"width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n</tr>\n</tbody>\n</table>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>',3,0,1,25,0,91,NULL,'2020-08-22 16:11:27',14773,'2020-08-22 16:11:27',NULL,NULL);
/*!40000 ALTER TABLE `wk_km_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_km_document_favor`
--

DROP TABLE IF EXISTS `wk_km_document_favor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_km_document_favor` (
  `favor_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`favor_id`) USING BTREE,
  UNIQUE KEY `wk_km_document_favor_document_id_create_user_id_uindex` (`document_id`,`create_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='文档点赞表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_km_document_favor`
--

LOCK TABLES `wk_km_document_favor` WRITE;
/*!40000 ALTER TABLE `wk_km_document_favor` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_km_document_favor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_km_document_label`
--

DROP TABLE IF EXISTS `wk_km_document_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_km_document_label` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `color` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`label_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='文档标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_km_document_label`
--

LOCK TABLES `wk_km_document_label` WRITE;
/*!40000 ALTER TABLE `wk_km_document_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_km_document_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_km_document_share`
--

DROP TABLE IF EXISTS `wk_km_document_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_km_document_share` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) DEFAULT NULL COMMENT '文档id',
  `share_user_ids` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分享内部成员id',
  `share_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '外部分享链接',
  `token` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '外部查看文档的唯一标识',
  `status` int(11) DEFAULT NULL COMMENT '1 启用 0 关闭分享',
  `create_user_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `close_user_id` bigint(20) DEFAULT NULL,
  `close_time` datetime DEFAULT NULL,
  PRIMARY KEY (`share_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='文档分享';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_km_document_share`
--

LOCK TABLES `wk_km_document_share` WRITE;
/*!40000 ALTER TABLE `wk_km_document_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_km_document_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_km_folder`
--

DROP TABLE IF EXISTS `wk_km_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_km_folder` (
  `folder_id` int(11) NOT NULL AUTO_INCREMENT,
  `library_id` int(11) DEFAULT NULL COMMENT '知识库id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父id',
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `status` int(11) DEFAULT '1' COMMENT '-1 删除 1 正常',
  `create_user_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `auth_id` int(11) DEFAULT NULL,
  `delete_user_id` bigint(20) DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`folder_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='知识库文件夹';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_km_folder`
--

LOCK TABLES `wk_km_folder` WRITE;
/*!40000 ALTER TABLE `wk_km_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_km_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_km_knowledge_library`
--

DROP TABLE IF EXISTS `wk_km_knowledge_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_km_knowledge_library` (
  `library_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '知识库名称',
  `description` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '简介',
  `is_open` int(11) NOT NULL COMMENT '是否公开 1 公开 2 私有',
  `status` int(11) DEFAULT '1' COMMENT '-1 删除 1 正常 2 模板',
  `is_system_cover` int(11) DEFAULT NULL COMMENT '0 否 1 是',
  `cover_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '知识库封面',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_user_id` bigint(20) DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`library_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='知识库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_km_knowledge_library`
--

LOCK TABLES `wk_km_knowledge_library` WRITE;
/*!40000 ALTER TABLE `wk_km_knowledge_library` DISABLE KEYS */;
INSERT INTO `wk_km_knowledge_library` VALUES (25,'产品研发','提供完善的产品流程文档',0,1,1,'https://www.72crm.com/api/uploads/kw/1.png',14773,'2020-08-22 16:11:27',NULL,NULL,NULL);
/*!40000 ALTER TABLE `wk_km_knowledge_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_km_knowledge_library_user`
--

DROP TABLE IF EXISTS `wk_km_knowledge_library_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_km_knowledge_library_user` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `library_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role` int(11) DEFAULT NULL COMMENT '1 创建人 2 管理员 3 成员',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='知识库成员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_km_knowledge_library_user`
--

LOCK TABLES `wk_km_knowledge_library_user` WRITE;
/*!40000 ALTER TABLE `wk_km_knowledge_library_user` DISABLE KEYS */;
INSERT INTO `wk_km_knowledge_library_user` VALUES (55,25,14773,1);
/*!40000 ALTER TABLE `wk_km_knowledge_library_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_announcement`
--

DROP TABLE IF EXISTS `wk_oa_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_announcement` (
  `announcement_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` longtext COMMENT '内容',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `dept_ids` longtext COMMENT '通知部门',
  `owner_user_ids` longtext COMMENT '通知人',
  `read_user_ids` varchar(255) DEFAULT NULL COMMENT '已读用户',
  PRIMARY KEY (`announcement_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_announcement`
--

LOCK TABLES `wk_oa_announcement` WRITE;
/*!40000 ALTER TABLE `wk_oa_announcement` DISABLE KEYS */;
INSERT INTO `wk_oa_announcement` VALUES (1,'放假','明天放假不用上班',14773,'2024-10-09 18:11:48','2024-10-09 18:11:48',NULL,NULL,',14852,','',NULL),(2,'学习外语','去董事长办公室学外语',14773,'2024-10-09 18:19:12','2024-10-09 18:19:12',NULL,NULL,'',',14778,',NULL),(3,'001','001',14773,'2024-10-09 18:41:23','2024-10-09 18:41:23',NULL,NULL,'',',14773,14778,',NULL),(4,'003','003',14773,'2024-10-09 18:46:11','2024-10-09 18:46:11',NULL,NULL,',14852,','',NULL),(5,'004','004',14773,'2024-10-09 18:46:44','2024-10-09 18:46:44',NULL,NULL,'',',14778,',NULL),(6,'006','006',14773,'2024-10-09 18:47:53','2024-10-09 18:47:53',NULL,NULL,'',',14774,',NULL),(7,'007','007',14773,'2024-10-09 18:55:09','2024-10-09 18:55:09',NULL,NULL,'',',14777,',NULL),(8,'100','100',14773,'2024-10-09 19:04:55','2024-10-09 19:04:55',NULL,NULL,'',',14777,',NULL),(9,'放假','明天放假不用上班',14773,'2024-10-09 19:52:20','2024-10-09 19:52:20',NULL,NULL,',14852,','',NULL),(10,'休假','明天休假',14773,'2024-10-09 20:02:16','2024-10-09 20:02:16',NULL,NULL,',14852,','',NULL),(11,'放假02','放假02',14773,'2024-10-09 20:30:13','2024-10-09 20:30:13',NULL,NULL,',14852,','',NULL),(12,'放假03','放假03',14773,'2024-10-09 20:33:19','2024-10-09 20:33:19',NULL,NULL,',14852,','',NULL),(13,'放假04','放假04',14773,'2024-10-09 20:40:34','2024-10-09 20:40:34',NULL,NULL,'',',14777,14775,',NULL);
/*!40000 ALTER TABLE `wk_oa_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_calendar_type`
--

DROP TABLE IF EXISTS `wk_oa_calendar_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_calendar_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日历类型id',
  `type_name` varchar(255) NOT NULL COMMENT '类型名称',
  `color` varchar(20) DEFAULT NULL COMMENT '颜色',
  `type` int(11) DEFAULT NULL COMMENT '1 系统类型 2 自定义类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建用户id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `sort` int(11) DEFAULT '1',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='日程类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_calendar_type`
--

LOCK TABLES `wk_oa_calendar_type` WRITE;
/*!40000 ALTER TABLE `wk_oa_calendar_type` DISABLE KEYS */;
INSERT INTO `wk_oa_calendar_type` VALUES (492,'分配的任务','1',1,'2020-01-13 09:44:05',14773,NULL,1),(493,'需联系的线索','5',1,'2020-01-13 09:44:05',14773,NULL,2),(494,'需联系的客户','2',1,'2020-01-13 09:44:05',14773,NULL,3),(495,'需联系的商机','6',1,'2020-01-13 09:44:05',14773,NULL,4),(496,'预计成交的商机','7',1,'2020-01-13 09:44:05',14773,NULL,5),(497,'即将到期的合同','3',1,'2020-01-13 09:44:05',14773,NULL,6),(498,'计划回款','4',1,'2020-01-13 09:44:05',14773,NULL,7),(499,'开会','#53D397',2,'2020-01-13 09:44:05',14773,NULL,1),(501,'团建','#53D397',2,'2024-09-21 13:52:40',14773,NULL,1),(502,'001','#53D397',2,'2024-10-09 21:19:51',14777,NULL,1);
/*!40000 ALTER TABLE `wk_oa_calendar_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_calendar_type_user`
--

DROP TABLE IF EXISTS `wk_oa_calendar_type_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_calendar_type_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `type_id` int(11) NOT NULL COMMENT '日程类型id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8945 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户关联日程类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_calendar_type_user`
--

LOCK TABLES `wk_oa_calendar_type_user` WRITE;
/*!40000 ALTER TABLE `wk_oa_calendar_type_user` DISABLE KEYS */;
INSERT INTO `wk_oa_calendar_type_user` VALUES (8745,14778,501),(8746,14774,501),(8747,14775,501),(8748,14776,501),(8760,14778,502),(8761,14774,502),(8762,14775,502),(8763,14776,502),(8850,14777,492),(8851,14777,493),(8852,14777,494),(8884,14780,492),(8885,14780,493),(8886,14780,494),(8887,14780,495),(8888,14780,496),(8889,14780,497),(8890,14780,498),(8942,14773,492),(8943,14773,493),(8944,14773,494);
/*!40000 ALTER TABLE `wk_oa_calendar_type_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_event`
--

DROP TABLE IF EXISTS `wk_oa_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '标题',
  `type_id` int(11) NOT NULL COMMENT '日程类型',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `owner_user_ids` varchar(100) DEFAULT NULL COMMENT '参与人',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `repetition_type` int(11) DEFAULT '1' COMMENT '重复类型 1从不重复 2每天 3每周 4每月 5每年',
  `repeat_rate` int(11) DEFAULT NULL COMMENT '重复频率',
  `repeat_time` varchar(255) DEFAULT NULL COMMENT '3:周/4:月',
  `end_type` int(11) DEFAULT NULL COMMENT '结束类型 1从不 2重复次数 3结束日期',
  `end_type_config` varchar(40) DEFAULT NULL COMMENT '2:次数/3:时间',
  `repeat_start_time` datetime NOT NULL COMMENT '循环开始时间',
  `repeat_end_time` datetime DEFAULT NULL COMMENT '循环结束时间',
  `batch_id` varchar(32) DEFAULT NULL COMMENT '批次id ',
  PRIMARY KEY (`event_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_event`
--

LOCK TABLES `wk_oa_event` WRITE;
/*!40000 ALTER TABLE `wk_oa_event` DISABLE KEYS */;
INSERT INTO `wk_oa_event` VALUES (1,'团建',501,'2024-09-28 09:00:00','2024-09-28 09:00:00','14773',14773,'2024-09-28 16:27:47',NULL,1,NULL,NULL,NULL,NULL,'2024-09-28 09:00:00','2024-09-28 09:00:00','16e7ff81314b4d7eabed3a7e48e96bbb'),(2,'日程01',499,'2024-10-09 09:00:00','2024-10-09 09:00:00','14773',14773,'2024-10-09 21:43:26',NULL,1,NULL,NULL,NULL,NULL,'2024-10-09 09:00:00','2024-10-09 09:00:00','4f38bebccb7e4e3faa52d705988d49fb');
/*!40000 ALTER TABLE `wk_oa_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_event_notice`
--

DROP TABLE IF EXISTS `wk_oa_event_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_event_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL COMMENT '日程ID',
  `type` int(11) NOT NULL COMMENT '1分钟 2小时 3天',
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日程提醒设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_event_notice`
--

LOCK TABLES `wk_oa_event_notice` WRITE;
/*!40000 ALTER TABLE `wk_oa_event_notice` DISABLE KEYS */;
INSERT INTO `wk_oa_event_notice` VALUES (1,1,1,5),(2,2,1,5);
/*!40000 ALTER TABLE `wk_oa_event_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_event_relation`
--

DROP TABLE IF EXISTS `wk_oa_event_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_event_relation` (
  `eventrelation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日程关联业务表',
  `event_id` int(11) NOT NULL COMMENT '日程ID',
  `customer_ids` varchar(200) DEFAULT NULL COMMENT '客户IDs',
  `contacts_ids` varchar(200) DEFAULT NULL COMMENT '联系人IDs',
  `business_ids` varchar(200) DEFAULT NULL COMMENT '商机IDs',
  `contract_ids` varchar(200) DEFAULT NULL COMMENT '合同IDs',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`eventrelation_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日程关联业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_event_relation`
--

LOCK TABLES `wk_oa_event_relation` WRITE;
/*!40000 ALTER TABLE `wk_oa_event_relation` DISABLE KEYS */;
INSERT INTO `wk_oa_event_relation` VALUES (1,2,'3','','','','2024-10-09 21:43:26');
/*!40000 ALTER TABLE `wk_oa_event_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_event_update_record`
--

DROP TABLE IF EXISTS `wk_oa_event_update_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_event_update_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `time` bigint(20) NOT NULL COMMENT '标题',
  `status` int(11) DEFAULT NULL COMMENT '1 删除本次 2 修改本次 3 修改本次及以后',
  `new_event_id` int(11) DEFAULT NULL COMMENT '新的事件id',
  `batch_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='日程更新记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_event_update_record`
--

LOCK TABLES `wk_oa_event_update_record` WRITE;
/*!40000 ALTER TABLE `wk_oa_event_update_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_oa_event_update_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_examine`
--

DROP TABLE IF EXISTS `wk_oa_examine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_examine` (
  `examine_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审批id',
  `category_id` int(11) NOT NULL DEFAULT '1' COMMENT '审批类型id',
  `content` varchar(800) DEFAULT NULL COMMENT '内容',
  `remark` varchar(800) DEFAULT NULL COMMENT '备注',
  `type_id` varchar(32) DEFAULT NULL COMMENT '请假类型',
  `money` decimal(18,2) DEFAULT NULL COMMENT '差旅、报销总金额',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `duration` decimal(18,2) DEFAULT NULL COMMENT '时长',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `batch_id` varchar(32) DEFAULT NULL COMMENT '附件批次id',
  `examine_record_id` int(11) DEFAULT NULL COMMENT '审核记录ID',
  `examine_status` int(11) DEFAULT NULL COMMENT '审核状态 0 未审核 1 审核通过 2 审核拒绝 3 审核中 4 已撤回',
  PRIMARY KEY (`examine_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='审批表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_examine`
--

LOCK TABLES `wk_oa_examine` WRITE;
/*!40000 ALTER TABLE `wk_oa_examine` DISABLE KEYS */;
INSERT INTO `wk_oa_examine` VALUES (1,1072979,'明天我要请假','我要去和女朋友开房',NULL,NULL,NULL,NULL,NULL,14773,'2024-09-20 10:18:58','2024-09-20 10:18:58','462fc661261aa751c18dd15588c26939',1004977,1),(2,1072982,'全tm给我加班','',NULL,NULL,'2024-09-20 10:24:47','2024-10-20 10:24:50',31.00,14773,'2024-09-20 10:25:41','2024-09-20 10:25:41','4ada258d4d598a21e8097185ff847ad5',1004978,3),(3,1072981,'和女秘书去度蜜月','女秘书要给我放松放松',NULL,NULL,NULL,NULL,10.00,14773,'2024-09-20 10:35:23','2024-09-20 10:46:10','84ce3c1fde123627008d065ec675a71a',1004980,4),(4,1072984,'借款买房','向公司借10万元买房',NULL,100000.00,NULL,NULL,NULL,14773,'2024-10-10 09:48:42','2024-10-10 09:48:47','9424bead17627a1f50b82f5043551cc2',1004981,4),(5,1072982,'我喜欢加班','我喜欢加班',NULL,NULL,'2024-10-10 09:52:44','2024-10-31 00:00:00',21.00,14773,'2024-10-10 09:53:24','2024-10-10 09:53:29','34284c6d933ee89a54fc841dad34bd9f',1004982,1);
/*!40000 ALTER TABLE `wk_oa_examine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_examine_category`
--

DROP TABLE IF EXISTS `wk_oa_examine_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_examine_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '名称',
  `remarks` varchar(500) DEFAULT NULL COMMENT '描述',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `type` int(11) DEFAULT '0' COMMENT '1 普通审批 2 请假审批 3 出差审批 4 加班审批 5 差旅报销 6 借款申请 0 自定义审批',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `status` int(11) DEFAULT '1' COMMENT '1启用，0禁用',
  `is_sys` int(11) DEFAULT NULL COMMENT '1为系统类型，不能删除',
  `examine_type` int(11) DEFAULT NULL COMMENT '1固定2自选',
  `user_ids` varchar(500) DEFAULT NULL COMMENT '可见范围（员工）',
  `dept_ids` varchar(500) DEFAULT NULL COMMENT '可见范围（部门）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` int(11) DEFAULT '0' COMMENT '1已删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_user_id` bigint(20) DEFAULT NULL COMMENT '删除人ID',
  PRIMARY KEY (`category_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72985 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='审批类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_examine_category`
--

LOCK TABLES `wk_oa_examine_category` WRITE;
/*!40000 ALTER TABLE `wk_oa_examine_category` DISABLE KEYS */;
INSERT INTO `wk_oa_examine_category` VALUES (72979,'普通审批','普通审批','wk wk-l-record,#3ABCFB',1,3,1,1,2,'','','2019-04-26 15:06:34','2019-04-26 15:06:34',0,NULL,NULL),(72980,'请假审批','请假审批','wk wk-leave,#00CAAB',2,3,1,1,2,'','','2019-04-17 18:52:44','2019-04-17 18:52:44',0,NULL,NULL),(72981,'出差审批','出差审批','wk wk-trip,#3ABCFB',3,3,1,1,2,'','','2019-04-17 18:52:50','2019-04-17 18:52:50',0,NULL,NULL),(72982,'加班审批','加班审批','wk wk-overtime,#FAAD14',4,3,1,1,2,'','','2019-04-17 18:52:59','2019-04-17 18:52:59',0,NULL,NULL),(72983,'差旅报销','差旅报销','wk wk-reimbursement,#3ABCFB',5,3,1,1,2,'','','2019-04-17 18:53:13','2019-04-17 18:53:13',0,NULL,NULL),(72984,'借款申请','借款申请','wk wk-go-out,#FF6033',6,3,1,1,2,'','','2019-04-17 18:54:44','2019-04-17 18:54:44',0,NULL,NULL);
/*!40000 ALTER TABLE `wk_oa_examine_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_examine_data`
--

DROP TABLE IF EXISTS `wk_oa_examine_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_examine_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL COMMENT '字段id',
  `name` varchar(255) NOT NULL COMMENT '字段名称',
  `value` longtext,
  `create_time` datetime NOT NULL,
  `batch_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='oa审批自定义字段存值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_examine_data`
--

LOCK TABLES `wk_oa_examine_data` WRITE;
/*!40000 ALTER TABLE `wk_oa_examine_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_oa_examine_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_examine_field`
--

DROP TABLE IF EXISTS `wk_oa_examine_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_examine_field` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `field_name` varchar(255) DEFAULT NULL COMMENT '自定义字段英文标识',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '字段名称',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '字段类型 1 单行文本 2 多行文本 3 单选 4日期 5 数字 6 小数 7 手机  8 文件 9 多选 10 人员 11 附件 12 部门 13 日期时间 14 邮箱 15客户 16 商机 17 联系人 18 地图 19 产品类型 20 合同 21 回款计划',
  `remark` varchar(60) DEFAULT NULL COMMENT '字段说明',
  `input_tips` varchar(255) DEFAULT NULL COMMENT '输入提示',
  `max_length` int(11) DEFAULT NULL COMMENT '最大长度',
  `default_value` varchar(5000) DEFAULT '' COMMENT '默认值',
  `is_unique` int(11) DEFAULT '0' COMMENT '是否唯一 1 是 0 否',
  `is_null` int(11) DEFAULT '0' COMMENT '是否必填 1 是 0 否',
  `sorting` int(11) DEFAULT '1' COMMENT '排序 从小到大',
  `options` longtext COMMENT '如果类型是选项，此处不能为空，多个选项以，隔开',
  `operating` int(11) DEFAULT '255' COMMENT '是否可以删除修改',
  `is_hidden` int(11) NOT NULL DEFAULT '0' COMMENT '是否隐藏  0不隐藏 1隐藏',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `examine_category_id` int(11) DEFAULT NULL COMMENT '审批ID label为10需要',
  `field_type` int(11) NOT NULL DEFAULT '0' COMMENT '字段来源  0.自定义 1.原始固定 2原始字段但值存在扩展表中',
  `style_percent` int(11) DEFAULT '50' COMMENT '样式百分比%',
  `precisions` int(11) DEFAULT NULL COMMENT '精度，允许的最大小数位',
  `form_position` varchar(10) DEFAULT NULL COMMENT '表单定位 坐标格式： 1,1',
  `max_num_restrict` varchar(20) DEFAULT NULL COMMENT '限制的最大数值',
  `min_num_restrict` varchar(20) DEFAULT NULL COMMENT '限制的最小数值',
  `form_assist_id` int(11) DEFAULT NULL COMMENT '表单辅助id，前端生成',
  PRIMARY KEY (`field_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=574 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自定义字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_examine_field`
--

LOCK TABLES `wk_oa_examine_field` WRITE;
/*!40000 ALTER TABLE `wk_oa_examine_field` DISABLE KEYS */;
INSERT INTO `wk_oa_examine_field` VALUES (548,'content','审批内容',1,NULL,'',NULL,'',0,1,0,NULL,3,0,'2021-01-09 16:03:54',1072979,1,50,NULL,NULL,NULL,NULL,NULL),(549,'remark','备注',2,NULL,'',1000,'',0,0,1,NULL,3,0,'2021-01-09 16:03:54',1072979,1,50,NULL,NULL,NULL,NULL,NULL),(550,'type_id','请假类型',3,NULL,'',NULL,'年假',0,1,0,'年假,事假,病假,产假,调休,婚假,丧假,其他',3,0,'2021-01-09 16:03:54',1072980,1,50,NULL,NULL,NULL,NULL,NULL),(551,'content','审批内容',1,NULL,'',NULL,'',0,1,1,NULL,3,0,'2021-01-09 16:03:54',1072980,1,50,NULL,NULL,NULL,NULL,NULL),(552,'start_time','开始时间',13,NULL,'',NULL,'',0,1,2,NULL,3,0,'2021-01-09 16:03:54',1072980,1,50,NULL,NULL,NULL,NULL,NULL),(553,'end_time','结束时间',13,NULL,'',NULL,'',0,1,3,NULL,3,0,'2021-01-09 16:03:54',1072980,1,50,NULL,NULL,NULL,NULL,NULL),(554,'duration','时长（天）',6,NULL,'',NULL,'',0,1,4,NULL,3,0,'2021-05-07 13:58:14',1072980,1,50,2,NULL,NULL,NULL,NULL),(555,'remark','备注',2,NULL,'',1000,'',0,0,5,NULL,3,0,'2021-01-09 16:03:54',1072980,1,50,NULL,NULL,NULL,NULL,NULL),(556,'content','出差事由',1,NULL,'',NULL,'',0,1,0,NULL,3,0,'2021-01-09 16:03:54',1072981,1,50,NULL,NULL,NULL,NULL,NULL),(557,'remark','备注',2,NULL,'',1000,'',0,0,1,NULL,3,0,'2021-01-09 16:03:54',1072981,1,50,NULL,NULL,NULL,NULL,NULL),(558,'duration','出差总天数',6,NULL,'',NULL,'',0,1,2,NULL,3,0,'2021-05-07 13:58:14',1072981,1,50,2,NULL,NULL,NULL,NULL),(559,'cause','行程明细',22,NULL,'',NULL,'',0,1,2,NULL,3,0,'2021-01-09 16:03:54',1072981,1,50,NULL,NULL,NULL,NULL,NULL),(560,'content','加班原因',1,NULL,'',NULL,'',0,1,0,NULL,3,0,'2021-01-09 16:03:54',1072982,1,50,NULL,NULL,NULL,NULL,NULL),(561,'start_time','开始时间',13,NULL,'',NULL,'',0,1,1,NULL,3,0,'2021-01-09 16:03:54',1072982,1,50,NULL,NULL,NULL,NULL,NULL),(562,'end_time','结束时间',13,NULL,'',NULL,'',0,1,2,NULL,3,0,'2021-01-09 16:03:54',1072982,1,50,NULL,NULL,NULL,NULL,NULL),(563,'duration','加班总天数',6,NULL,'',NULL,'',0,1,3,NULL,3,0,'2021-05-07 13:58:14',1072982,1,50,2,NULL,NULL,NULL,NULL),(564,'remark','备注',2,NULL,'',1000,'',0,0,4,NULL,3,0,'2021-01-09 16:03:54',1072982,1,50,NULL,NULL,NULL,NULL,NULL),(565,'content','差旅事由',1,NULL,'',NULL,'',0,1,0,NULL,3,0,'2021-01-09 16:03:54',1072983,1,50,NULL,NULL,NULL,NULL,NULL),(566,'money','报销总金额',6,NULL,'',0,'',0,1,1,NULL,3,0,'2021-05-07 13:58:14',1072983,1,50,2,NULL,NULL,NULL,NULL),(567,'remark','备注',2,NULL,'',1000,'',0,0,2,NULL,3,0,'2021-01-09 16:03:54',1072983,1,50,NULL,NULL,NULL,NULL,NULL),(568,'cause','费用明细',23,NULL,'',1000,'',0,0,2,NULL,3,0,'2021-01-09 16:03:54',1072983,1,50,NULL,NULL,NULL,NULL,NULL),(569,'content','借款事由',1,NULL,'',NULL,'',0,1,0,NULL,3,0,'2021-01-09 16:03:54',1072984,1,50,NULL,NULL,NULL,NULL,NULL),(570,'money','借款金额（元）',6,NULL,'',0,'',0,1,1,NULL,3,0,'2021-05-07 13:58:14',1072984,1,50,2,NULL,NULL,NULL,NULL),(571,'remark','备注',2,NULL,'',1000,'',0,0,2,NULL,3,0,'2021-01-09 16:03:54',1072984,1,50,NULL,NULL,NULL,NULL,NULL),(572,'content','审批事由',2,NULL,NULL,0,'',0,1,0,NULL,1,0,'2024-10-10 01:05:40',1072986,1,50,NULL,'0,0',NULL,NULL,NULL),(573,'remark','备注',2,NULL,NULL,0,'',0,0,1,NULL,1,0,'2024-10-10 01:05:41',1072986,1,50,NULL,'0,1',NULL,NULL,NULL);
/*!40000 ALTER TABLE `wk_oa_examine_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_examine_field_extend`
--

DROP TABLE IF EXISTS `wk_oa_examine_field_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_examine_field_extend` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_field_id` int(11) NOT NULL COMMENT '对应主字段id',
  `field_name` varchar(255) DEFAULT NULL COMMENT '自定义字段英文标识',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '字段名称',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '字段类型 1 单行文本 2 多行文本 3 单选 4日期 5 数字 6 小数 7 手机  8 文件 9 多选 10 人员 11 附件 12 部门 13 日期时间 14 邮箱 15客户 16 商机 17 联系人 18 地图 19 产品类型 20 合同 21 回款计划',
  `remark` varchar(60) DEFAULT NULL COMMENT '字段说明',
  `input_tips` varchar(255) DEFAULT NULL COMMENT '输入提示',
  `max_length` int(11) DEFAULT NULL COMMENT '最大长度',
  `default_value` varchar(3000) DEFAULT '' COMMENT '默认值',
  `is_unique` int(11) DEFAULT '0' COMMENT '是否唯一 1 是 0 否',
  `is_null` int(11) DEFAULT '0' COMMENT '是否必填 1 是 0 否',
  `sorting` int(11) DEFAULT '1' COMMENT '排序 从小到大',
  `options` longtext COMMENT '如果类型是选项，此处不能为空，多个选项以，隔开',
  `operating` int(11) DEFAULT '255' COMMENT '是否可以删除修改',
  `is_hidden` int(11) NOT NULL DEFAULT '0' COMMENT '是否隐藏  0不隐藏 1隐藏',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `field_type` int(11) NOT NULL DEFAULT '0' COMMENT '字段来源  0.自定义 1.原始固定 2原始字段但值存在扩展表中',
  `style_percent` int(11) DEFAULT '50' COMMENT '样式百分比%',
  `precisions` int(11) DEFAULT NULL COMMENT '精度，允许的最大小数位',
  `form_position` varchar(10) DEFAULT NULL COMMENT '表单定位 坐标格式： 1,1',
  `max_num_restrict` varchar(20) DEFAULT NULL COMMENT '限制的最大数值',
  `min_num_restrict` varchar(20) DEFAULT NULL COMMENT '限制的最小数值',
  `form_assist_id` int(11) DEFAULT NULL COMMENT '表单辅助id，前端生成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自定义字段表延长表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_examine_field_extend`
--

LOCK TABLES `wk_oa_examine_field_extend` WRITE;
/*!40000 ALTER TABLE `wk_oa_examine_field_extend` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_oa_examine_field_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_examine_log`
--

DROP TABLE IF EXISTS `wk_oa_examine_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_examine_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `record_id` int(11) DEFAULT NULL COMMENT '审批记录ID',
  `examine_step_id` bigint(20) DEFAULT NULL COMMENT '审核步骤ID',
  `examine_status` int(11) DEFAULT NULL COMMENT '审核状态 0 未审核 1 审核通过 2 审核拒绝4 撤回审核',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `examine_user` bigint(20) DEFAULT NULL COMMENT '审核人',
  `examine_time` datetime DEFAULT NULL COMMENT '审核时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '审核备注',
  `is_recheck` int(11) DEFAULT '0' COMMENT '是否是撤回之前的日志 0或者null为新数据 1：撤回之前的数据',
  `order_id` int(11) DEFAULT NULL COMMENT '排序id',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='审核日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_examine_log`
--

LOCK TABLES `wk_oa_examine_log` WRITE;
/*!40000 ALTER TABLE `wk_oa_examine_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_oa_examine_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_examine_record`
--

DROP TABLE IF EXISTS `wk_oa_examine_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_examine_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审核记录ID',
  `examine_id` int(11) DEFAULT NULL COMMENT '审批ID',
  `examine_step_id` bigint(20) DEFAULT NULL COMMENT '当前进行的审批步骤ID',
  `examine_status` int(11) DEFAULT NULL COMMENT '审核状态 0 未审核 1 审核通过 2 审核拒绝 3 审核中 4 已撤回',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '审核备注',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='审核记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_examine_record`
--

LOCK TABLES `wk_oa_examine_record` WRITE;
/*!40000 ALTER TABLE `wk_oa_examine_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_oa_examine_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_examine_relation`
--

DROP TABLE IF EXISTS `wk_oa_examine_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_examine_relation` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审批关联业务表',
  `examine_id` int(11) DEFAULT NULL COMMENT '审批ID',
  `customer_ids` varchar(255) DEFAULT NULL COMMENT '客户IDs',
  `contacts_ids` varchar(255) DEFAULT NULL COMMENT '联系人IDs',
  `business_ids` varchar(255) DEFAULT NULL COMMENT '商机IDs',
  `contract_ids` varchar(255) DEFAULT NULL COMMENT '合同IDs',
  `status` int(11) DEFAULT '1' COMMENT '状态1可用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='审批关联业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_examine_relation`
--

LOCK TABLES `wk_oa_examine_relation` WRITE;
/*!40000 ALTER TABLE `wk_oa_examine_relation` DISABLE KEYS */;
INSERT INTO `wk_oa_examine_relation` VALUES (1,1,'','','','',1,'2024-09-20 10:18:58'),(2,2,'','','','',1,'2024-09-20 10:25:41'),(4,3,'','','','',1,'2024-09-20 10:46:10'),(5,4,'','','','',1,'2024-10-10 09:48:47'),(6,5,'','','','',1,'2024-10-10 09:53:29');
/*!40000 ALTER TABLE `wk_oa_examine_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_examine_sort`
--

DROP TABLE IF EXISTS `wk_oa_examine_sort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_examine_sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `category_id` int(11) DEFAULT NULL COMMENT '审批类型id',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='审批类型排序';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_examine_sort`
--

LOCK TABLES `wk_oa_examine_sort` WRITE;
/*!40000 ALTER TABLE `wk_oa_examine_sort` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_oa_examine_sort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_examine_step`
--

DROP TABLE IF EXISTS `wk_oa_examine_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_examine_step` (
  `step_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `step_type` int(11) DEFAULT NULL COMMENT '步骤类型1、负责人主管，2、指定用户（任意一人），3、指定用户（多人会签）,4、上一级审批人主管',
  `category_id` int(11) NOT NULL COMMENT '审批ID',
  `check_user_id` varchar(500) DEFAULT NULL COMMENT '审批人ID (使用逗号隔开) ,1,2,',
  `step_num` int(11) DEFAULT '1' COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`step_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='审批步骤表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_examine_step`
--

LOCK TABLES `wk_oa_examine_step` WRITE;
/*!40000 ALTER TABLE `wk_oa_examine_step` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_oa_examine_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_examine_travel`
--

DROP TABLE IF EXISTS `wk_oa_examine_travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_examine_travel` (
  `travel_id` int(11) NOT NULL AUTO_INCREMENT,
  `examine_id` int(11) NOT NULL COMMENT '审批ID',
  `start_address` varchar(100) DEFAULT NULL COMMENT '出发地',
  `start_time` datetime DEFAULT NULL COMMENT '出发时间',
  `end_address` varchar(100) DEFAULT NULL COMMENT '目的地',
  `end_time` datetime DEFAULT NULL COMMENT '到达时间',
  `traffic` decimal(18,2) DEFAULT NULL COMMENT '交通费',
  `stay` decimal(18,2) DEFAULT NULL COMMENT '住宿费',
  `diet` decimal(18,2) DEFAULT NULL COMMENT '餐饮费',
  `other` decimal(18,2) DEFAULT NULL COMMENT '其他费用',
  `money` decimal(18,2) DEFAULT NULL COMMENT '金额',
  `vehicle` varchar(255) DEFAULT NULL COMMENT '交通工具',
  `trip` varchar(50) DEFAULT NULL COMMENT '单程往返（单程、往返）',
  `duration` decimal(18,2) DEFAULT NULL COMMENT '时长',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `batch_id` varchar(32) DEFAULT NULL COMMENT '批次id',
  PRIMARY KEY (`travel_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='差旅行程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_examine_travel`
--

LOCK TABLES `wk_oa_examine_travel` WRITE;
/*!40000 ALTER TABLE `wk_oa_examine_travel` DISABLE KEYS */;
INSERT INTO `wk_oa_examine_travel` VALUES (2,3,'佛山','2024-09-20 10:34:15','成都','2024-09-30 00:00:00',NULL,NULL,NULL,NULL,NULL,'飞机','往返',10.00,NULL,NULL);
/*!40000 ALTER TABLE `wk_oa_examine_travel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_log`
--

DROP TABLE IF EXISTS `wk_oa_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '1' COMMENT '日志类型（1日报，2周报，3月报）',
  `title` varchar(50) DEFAULT NULL COMMENT '日志标题',
  `content` text COMMENT '日志内容',
  `tomorrow` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '明日工作内容',
  `question` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '遇到问题',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `send_user_ids` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '通知人',
  `send_dept_ids` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '通知部门',
  `read_user_ids` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '已读人',
  `batch_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件批次ID',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='工作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_log`
--

LOCK TABLES `wk_oa_log` WRITE;
/*!40000 ALTER TABLE `wk_oa_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_oa_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_log_bulletin`
--

DROP TABLE IF EXISTS `wk_oa_log_bulletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_log_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) DEFAULT NULL COMMENT '日志ID',
  `type` int(11) DEFAULT NULL COMMENT '关联类型 1 客户 2 商机 3 合同 4 回款 5 跟进记录 ',
  `type_id` int(11) DEFAULT NULL COMMENT '类型ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='工作日志与业务ID关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_log_bulletin`
--

LOCK TABLES `wk_oa_log_bulletin` WRITE;
/*!40000 ALTER TABLE `wk_oa_log_bulletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_oa_log_bulletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_log_record`
--

DROP TABLE IF EXISTS `wk_oa_log_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_log_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) NOT NULL,
  `customer_num` int(11) DEFAULT '0' COMMENT '客户数量',
  `business_num` int(11) DEFAULT '0' COMMENT '商机数量',
  `contract_num` int(11) DEFAULT '0' COMMENT '合同数量',
  `receivables_money` decimal(10,2) DEFAULT '0.00' COMMENT '回款金额',
  `activity_num` int(11) DEFAULT '0' COMMENT '跟进记录',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='日志关联销售简报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_log_record`
--

LOCK TABLES `wk_oa_log_record` WRITE;
/*!40000 ALTER TABLE `wk_oa_log_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_oa_log_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_log_relation`
--

DROP TABLE IF EXISTS `wk_oa_log_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_log_relation` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志关联业务表',
  `log_id` int(11) DEFAULT NULL COMMENT '日志ID',
  `customer_ids` varchar(512) DEFAULT NULL COMMENT '客户IDs',
  `contacts_ids` varchar(512) DEFAULT NULL COMMENT '联系人IDs',
  `business_ids` varchar(512) DEFAULT NULL COMMENT '商机IDs',
  `contract_ids` varchar(512) DEFAULT NULL COMMENT '合同IDs',
  `status` int(11) DEFAULT NULL COMMENT '状态1可用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志关联业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_log_relation`
--

LOCK TABLES `wk_oa_log_relation` WRITE;
/*!40000 ALTER TABLE `wk_oa_log_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_oa_log_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_log_rule`
--

DROP TABLE IF EXISTS `wk_oa_log_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_log_rule` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态 0停用 1启用',
  `member_user_id` varchar(255) DEFAULT NULL COMMENT '需要提交的员工id，“,”分割',
  `type` int(11) DEFAULT NULL COMMENT '日志类型 1日报 2周报 3月报',
  `effective_day` varchar(255) DEFAULT NULL COMMENT '每周需要统计的日期 1-6是周一到周六 7是周日',
  `start_day` int(11) DEFAULT NULL COMMENT '开始日期',
  `start_time` varchar(255) DEFAULT NULL COMMENT '开始时间',
  `end_day` int(11) DEFAULT NULL COMMENT '结束日期',
  `end_time` varchar(255) DEFAULT NULL COMMENT '结束时间',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='日程日志规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_log_rule`
--

LOCK TABLES `wk_oa_log_rule` WRITE;
/*!40000 ALTER TABLE `wk_oa_log_rule` DISABLE KEYS */;
INSERT INTO `wk_oa_log_rule` VALUES (265,1,'14775',1,'1,2,3,4,5',NULL,'00:00',NULL,'23:00',0,'2020-08-22 11:40:42'),(266,1,'14778',2,NULL,1,NULL,7,NULL,0,'2020-08-22 11:40:42'),(267,1,'14774',3,NULL,1,NULL,31,NULL,0,'2020-08-22 11:40:42');
/*!40000 ALTER TABLE `wk_oa_log_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_oa_log_user_favour`
--

DROP TABLE IF EXISTS `wk_oa_log_user_favour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_oa_log_user_favour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `log_id` int(11) NOT NULL COMMENT '日志id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户点赞日志关系表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_oa_log_user_favour`
--

LOCK TABLES `wk_oa_log_user_favour` WRITE;
/*!40000 ALTER TABLE `wk_oa_log_user_favour` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_oa_log_user_favour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_work`
--

DROP TABLE IF EXISTS `wk_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_work` (
  `work_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `name` varchar(50) DEFAULT NULL COMMENT '项目名字',
  `status` int(11) DEFAULT '1' COMMENT '状态 1启用 3归档 2 删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `description` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '描述',
  `color` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '颜色',
  `is_open` int(11) NOT NULL DEFAULT '1' COMMENT '是否所有人可见 1 是 0 否',
  `owner_role` int(11) DEFAULT NULL COMMENT '公开项目成员角色id',
  `archive_time` datetime DEFAULT NULL COMMENT '归档时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `is_system_cover` int(11) DEFAULT NULL COMMENT '是否是系统自带封面 0不是 1是',
  `cover_url` varchar(255) DEFAULT NULL COMMENT '项目封面路径 仅系统自带封面需要',
  `batch_id` varchar(32) DEFAULT NULL,
  `owner_user_id` varchar(255) DEFAULT NULL COMMENT '项目成员',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`work_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_work`
--

LOCK TABLES `wk_work` WRITE;
/*!40000 ALTER TABLE `wk_work` DISABLE KEYS */;
INSERT INTO `wk_work` VALUES (1,'找个对象',1,'2024-09-28 17:27:34',14773,'2024年找个女朋友','#53D397',0,NULL,NULL,NULL,1,'https://file.72crm.com/static/pc/images/pm/project-cover-8.jpg','805c97f215e74a44ae34ed2762a32adc',',14773,14778,','2024-10-08 20:27:49'),(2,'测试项目',1,'2024-09-28 17:51:43',14773,'测试项目负责人复发漏洞','#53D397',1,180173,NULL,NULL,1,'https://file.72crm.com/static/pc/images/pm/project-cover-3.jpg','22bf53e0c8094c3da568d25f8a24e037','',NULL),(3,'测试项目2',1,'2024-09-28 17:54:40',14773,'测试项目2 获取参数','#53D397',1,180173,NULL,NULL,1,'https://file.72crm.com/static/pc/images/pm/project-cover-6.jpg','8eafa5ba94874425b1c34dd4537c3da8',',14773,14778,14774,14775,14776,14777,',NULL),(4,'测试mybait自动插入',1,'2024-09-29 10:13:43',14773,'测试mybait自动插入','#53D397',1,180173,NULL,NULL,1,'https://file.72crm.com/static/pc/images/pm/project-cover-7.jpg','c77bbbfc61ce47afb85acc7520732dc2','',NULL),(5,'测试返回值',1,'2024-10-08 16:32:55',14773,'测试返回值','#20C1BD',0,NULL,NULL,NULL,1,'https://file.72crm.com/static/pc/images/pm/project-cover-1.jpg','da43cb942a074c3799b5ea8d89de52cb',',14773,',NULL);
/*!40000 ALTER TABLE `wk_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_work_collect`
--

DROP TABLE IF EXISTS `wk_work_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_work_collect` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目收藏id',
  `work_id` int(11) NOT NULL COMMENT '项目id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='项目收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_work_collect`
--

LOCK TABLES `wk_work_collect` WRITE;
/*!40000 ALTER TABLE `wk_work_collect` DISABLE KEYS */;
INSERT INTO `wk_work_collect` VALUES (1,2,14773,'2024-10-08 13:52:23');
/*!40000 ALTER TABLE `wk_work_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_work_order`
--

DROP TABLE IF EXISTS `wk_work_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_work_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `work_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `order_num` int(11) NOT NULL DEFAULT '999',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='项目排序表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_work_order`
--

LOCK TABLES `wk_work_order` WRITE;
/*!40000 ALTER TABLE `wk_work_order` DISABLE KEYS */;
INSERT INTO `wk_work_order` VALUES (16,1,14773,1),(17,2,14773,2),(18,3,14773,3),(19,4,14773,4),(20,5,14773,5);
/*!40000 ALTER TABLE `wk_work_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_work_task`
--

DROP TABLE IF EXISTS `wk_work_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_work_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务表',
  `name` varchar(100) DEFAULT NULL COMMENT '任务名称',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `main_user_id` bigint(20) DEFAULT NULL COMMENT '负责人ID',
  `owner_user_id` varchar(255) DEFAULT NULL COMMENT '团队成员ID',
  `create_time` datetime DEFAULT NULL COMMENT '新建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(11) DEFAULT '1' COMMENT '完成状态 1正在进行2延期3归档 5结束',
  `class_id` int(11) DEFAULT '-1' COMMENT '分类id',
  `label_id` varchar(255) DEFAULT NULL COMMENT '标签 ,号拼接',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '描述',
  `pid` int(11) DEFAULT '0' COMMENT '上级ID',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `stop_time` datetime DEFAULT NULL COMMENT '结束时间',
  `priority` int(11) DEFAULT '0' COMMENT '优先级 从大到小 3高 2中 1低 0无',
  `work_id` int(11) DEFAULT '0' COMMENT '项目ID',
  `is_top` int(11) DEFAULT '0' COMMENT '工作台展示 0收件箱 1今天要做，2下一步要做，3以后要做',
  `is_open` int(11) DEFAULT '1' COMMENT '是否公开',
  `order_num` int(11) DEFAULT '999' COMMENT '排序ID',
  `top_order_num` int(11) DEFAULT '999' COMMENT '我的任务排序ID',
  `archive_time` datetime DEFAULT NULL COMMENT '归档时间',
  `ishidden` int(11) DEFAULT '0' COMMENT '是否删除 0 未删除 1 删除',
  `hidden_time` datetime DEFAULT NULL COMMENT '删除时间',
  `batch_id` varchar(50) DEFAULT NULL COMMENT '批次',
  `is_archive` int(11) DEFAULT '0' COMMENT '1归档',
  PRIMARY KEY (`task_id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_work_task`
--

LOCK TABLES `wk_work_task` WRITE;
/*!40000 ALTER TABLE `wk_work_task` DISABLE KEYS */;
INSERT INTO `wk_work_task` VALUES (1,'要个微信',14773,14773,',14773,','2024-09-29 10:55:16','2024-10-08 10:45:02',5,1,',1,3,',NULL,0,NULL,NULL,3,1,0,1,999,999,'2024-09-30 10:49:33',1,'2024-10-08 10:45:02','98f14d1d6f0849de8db0cce6b7f2d6a7',1),(3,'发邮件',14773,14778,',14773,','2024-09-30 10:56:56','2024-10-08 10:08:03',5,-1,NULL,NULL,0,'2024-10-08 00:00:00',NULL,0,0,0,1,999,999,NULL,1,'2024-10-08 10:08:03','a4b39d23d4394dd89f5e92d4d8fd8d0b',0),(4,'测试任务',14773,14773,',14773,','2024-09-30 11:03:10','2024-09-30 11:03:19',1,4,',2,',NULL,0,NULL,'2024-09-30 00:00:00',0,2,0,1,999,999,'2024-09-30 11:03:19',0,NULL,'7a565afe6dc9e49bc2d8d3151b5131bb',1),(5,'1111',14773,14773,',14773,','2024-09-30 11:03:10','2024-10-11 10:46:33',5,-1,NULL,NULL,4,NULL,NULL,0,0,0,1,999,999,NULL,0,NULL,'7a565afe6dc9e49bc2d8d3151b5131bb',0),(6,'2222',14773,14777,',14773,','2024-09-30 11:03:10','2024-09-30 11:03:10',1,-1,NULL,NULL,4,NULL,'2024-09-30 00:00:00',0,0,0,1,999,999,NULL,0,NULL,'7a565afe6dc9e49bc2d8d3151b5131bb',0),(7,'约会',14773,14773,',14773,','2024-10-08 15:58:03','2024-10-08 19:53:14',1,-1,',4,','和女朋友约会',0,'2024-10-08 00:00:00','2024-10-31 00:00:00',0,0,0,1,999,1,NULL,0,NULL,'5af2906390a3aed89b23ced40b531c0b',0),(8,'买奶茶',14773,14773,',14773,','2024-10-08 15:58:02','2024-10-08 15:58:02',5,-1,NULL,NULL,7,NULL,'2024-10-23 00:00:00',0,0,0,1,999,999,NULL,0,NULL,'5af2906390a3aed89b23ced40b531c0b',0),(9,'吃饭',14773,14773,',14773,','2024-10-08 15:58:02','2024-10-08 15:58:02',5,-1,NULL,NULL,7,NULL,'2024-10-23 00:00:00',0,0,0,1,999,999,NULL,0,NULL,'5af2906390a3aed89b23ced40b531c0b',0),(10,'看电影',14773,14773,',14773,','2024-10-08 15:58:02','2024-10-08 15:58:02',5,-1,NULL,NULL,7,NULL,NULL,0,0,0,1,999,999,NULL,0,NULL,'5af2906390a3aed89b23ced40b531c0b',0),(11,'001',14773,14773,',14773,','2024-10-08 19:52:50','2024-10-11 10:42:56',1,-1,',4,1,',NULL,0,NULL,NULL,3,0,0,1,999,2,NULL,0,NULL,'59728ce8866b41368d6b60329e20474a',0),(12,'3333',14773,14773,',14773,','2024-10-11 10:47:19',NULL,1,-1,NULL,NULL,4,NULL,NULL,0,0,0,1,999,999,NULL,0,NULL,'549471294a754ddf8e9c0a6097fe8093',0),(13,'完成计划报表',14773,14773,',14773,','2024-10-11 10:48:46',NULL,1,-1,NULL,NULL,0,NULL,NULL,0,0,0,1,999,999,NULL,0,NULL,'76321b432493496eae04ad145fa6e800',0);
/*!40000 ALTER TABLE `wk_work_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_work_task_class`
--

DROP TABLE IF EXISTS `wk_work_task_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_work_task_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务分类表',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `status` int(11) DEFAULT '0' COMMENT '状态1正常',
  `work_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_work_task_class`
--

LOCK TABLES `wk_work_task_class` WRITE;
/*!40000 ALTER TABLE `wk_work_task_class` DISABLE KEYS */;
INSERT INTO `wk_work_task_class` VALUES (1,'要做','2024-09-28 17:27:35',14773,0,1,1),(2,'在做','2024-09-28 17:27:35',14773,0,1,0),(3,'待定','2024-09-28 17:27:35',14773,0,1,2),(4,'要做','2024-09-28 17:51:44',14773,0,2,1),(5,'在做','2024-09-28 17:51:44',14773,0,2,2),(6,'待定','2024-09-28 17:51:44',14773,0,2,3),(7,'要做','2024-09-28 17:54:40',14773,0,3,1),(8,'在做','2024-09-28 17:54:40',14773,0,3,2),(9,'待定','2024-09-28 17:54:40',14773,0,3,3),(10,'要做','2024-09-29 10:13:44',14773,0,4,1),(11,'在做','2024-09-29 10:13:44',14773,0,4,2),(12,'待定','2024-09-29 10:13:44',14773,0,4,3),(13,'不知道','2024-09-29 16:29:10',14773,0,1,3),(14,'要做','2024-10-08 16:32:55',14773,0,5,1),(15,'在做','2024-10-08 16:32:55',14773,0,5,2),(16,'待定','2024-10-08 16:32:55',14773,0,5,3);
/*!40000 ALTER TABLE `wk_work_task_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_work_task_comment`
--

DROP TABLE IF EXISTS `wk_work_task_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_work_task_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论表',
  `user_id` bigint(20) NOT NULL COMMENT '评论人ID',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容(答案)',
  `create_time` datetime DEFAULT NULL COMMENT '新建时间',
  `main_id` int(11) DEFAULT '0' COMMENT '主评论的id',
  `pid` bigint(20) DEFAULT '0' COMMENT '回复对象ID',
  `status` int(11) DEFAULT '1' COMMENT '状态 ',
  `type_id` int(11) DEFAULT '0' COMMENT '评论项目任务ID 或评论其他模块ID',
  `favour` int(11) DEFAULT '0' COMMENT '赞',
  `type` int(11) DEFAULT '0' COMMENT '评论分类 1：任务评论  2：日志评论',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_work_task_comment`
--

LOCK TABLES `wk_work_task_comment` WRITE;
/*!40000 ALTER TABLE `wk_work_task_comment` DISABLE KEYS */;
INSERT INTO `wk_work_task_comment` VALUES (3,14773,'计划很好','2024-10-08 19:07:36',0,0,1,7,0,1);
/*!40000 ALTER TABLE `wk_work_task_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_work_task_label`
--

DROP TABLE IF EXISTS `wk_work_task_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_work_task_label` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '标签名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `color` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '颜色',
  PRIMARY KEY (`label_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_work_task_label`
--

LOCK TABLES `wk_work_task_label` WRITE;
/*!40000 ALTER TABLE `wk_work_task_label` DISABLE KEYS */;
INSERT INTO `wk_work_task_label` VALUES (1,'微信','2024-09-30 10:33:10',14773,0,'#53D397'),(2,'测试标签','2024-09-30 11:02:27',14773,0,'#8983F3'),(3,'001标签','2024-10-08 10:44:55',14773,0,'#53D397'),(4,'恋爱','2024-10-08 15:58:01',14773,0,'#53D397');
/*!40000 ALTER TABLE `wk_work_task_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_work_task_label_order`
--

DROP TABLE IF EXISTS `wk_work_task_label_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_work_task_label_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `order_num` int(11) NOT NULL DEFAULT '999',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='项目标签排序表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_work_task_label_order`
--

LOCK TABLES `wk_work_task_label_order` WRITE;
/*!40000 ALTER TABLE `wk_work_task_label_order` DISABLE KEYS */;
INSERT INTO `wk_work_task_label_order` VALUES (5,3,14773,1),(6,1,14773,2),(7,2,14773,3),(8,4,14773,4);
/*!40000 ALTER TABLE `wk_work_task_label_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_work_task_log`
--

DROP TABLE IF EXISTS `wk_work_task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_work_task_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目日志表',
  `user_id` bigint(20) NOT NULL COMMENT '操作人ID',
  `content` text COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT '0' COMMENT '状态 4删除',
  `task_id` int(11) DEFAULT '0' COMMENT '任务ID',
  `work_id` int(11) DEFAULT '0' COMMENT '项目ID',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_work_task_log`
--

LOCK TABLES `wk_work_task_log` WRITE;
/*!40000 ALTER TABLE `wk_work_task_log` DISABLE KEYS */;
INSERT INTO `wk_work_task_log` VALUES (1,14773,'添加了新任务 要个微信','2024-09-29 10:55:16',0,1,0),(2,14773,'增加了标签:微信','2024-09-30 10:42:34',0,1,0),(3,14773,'删除了标签 微信','2024-09-30 10:42:50',0,1,0),(4,14773,'增加了标签:微信','2024-09-30 10:42:51',0,1,0),(5,14773,'删除了标签 微信','2024-09-30 10:42:52',0,1,0),(6,14773,'增加了标签:微信','2024-09-30 10:42:53',0,1,0),(7,14773,'删除了标签 微信','2024-09-30 10:42:53',0,1,0),(8,14773,'增加了标签:微信','2024-09-30 10:43:10',0,1,0),(9,14773,'删除了标签 微信','2024-09-30 10:45:36',0,1,0),(10,14773,'增加了标签:微信','2024-09-30 10:45:38',0,1,0),(11,14773,'删除了标签 微信2','2024-09-30 10:45:57',0,1,0),(12,14773,'增加了标签:微信2','2024-09-30 10:45:57',0,1,0),(13,14773,'删除了标签 微信2','2024-09-30 10:45:58',0,1,0),(14,14773,'增加了标签:微信2','2024-09-30 10:45:59',0,1,0),(15,14773,'将优先级修改为:高','2024-09-30 10:46:45',0,1,0),(16,14773,'添加了任务 上去搭讪','2024-09-30 10:47:36',0,2,0),(17,14773,'添加了新任务 发邮件','2024-09-30 10:56:56',0,3,0),(18,14773,'添加了新任务 测试任务','2024-09-30 11:03:10',0,4,0),(19,14773,'将状态修改为:完成','2024-10-08 10:07:33',0,3,0),(20,14773,'将状态修改为:未完成','2024-10-08 10:07:38',0,3,0),(21,14773,'将状态修改为:完成','2024-10-08 10:07:58',0,3,0),(22,14773,'把任务开始时间修改为:2024-10-02','2024-10-08 10:42:29',0,3,0),(23,14773,'把任务开始时间修改为:2024-10-08','2024-10-08 10:42:35',0,3,0),(24,14773,'将状态修改为:完成','2024-10-08 10:44:38',0,1,0),(25,14773,'增加了标签:001标签','2024-10-08 10:44:57',0,1,0),(26,14773,'添加了新任务 约会','2024-10-08 15:58:03',0,7,0),(27,14773,'增加了标签:恋爱','2024-10-08 15:59:07',0,7,0),(28,14773,'添加了新任务 001','2024-10-08 19:52:50',0,11,0),(29,14773,'将优先级修改为:高','2024-10-08 19:59:11',0,11,0),(30,14773,'增加了标签:恋爱','2024-10-08 19:59:31',0,11,0),(31,14773,'将状态修改为:完成','2024-10-08 20:00:03',0,11,0),(32,14773,'将状态修改为:未完成','2024-10-08 20:00:04',0,11,0),(33,14773,'增加了标签:微信','2024-10-11 10:42:56',0,11,0),(34,14773,'将状态修改为:完成','2024-10-11 10:44:24',0,4,0),(35,14773,'将状态修改为:未完成','2024-10-11 10:45:20',0,4,0),(36,14773,'将状态修改为:完成','2024-10-11 10:45:22',0,4,0),(37,14773,'将状态修改为:未完成','2024-10-11 10:45:23',0,4,0),(38,14773,'将状态修改为:完成','2024-10-11 10:45:28',0,4,0),(39,14773,'将状态修改为:未完成','2024-10-11 10:45:42',0,4,0),(40,14773,'将状态修改为:完成','2024-10-11 10:45:48',0,4,0),(41,14773,'将状态修改为:未完成','2024-10-11 10:46:14',0,4,0),(42,14773,'将状态修改为:完成','2024-10-11 10:46:14',0,4,0),(43,14773,'将状态修改为:未完成','2024-10-11 10:46:15',0,4,0),(44,14773,'添加了任务 3333','2024-10-11 10:47:19',0,12,0),(45,14773,'添加了新任务 完成计划报表','2024-10-11 10:48:46',0,13,0);
/*!40000 ALTER TABLE `wk_work_task_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_work_task_relation`
--

DROP TABLE IF EXISTS `wk_work_task_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_work_task_relation` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务关联业务表',
  `task_id` int(11) DEFAULT NULL COMMENT '任务ID',
  `customer_ids` varchar(255) DEFAULT NULL COMMENT '客户IDs',
  `contacts_ids` varchar(255) DEFAULT NULL COMMENT '联系人IDs',
  `business_ids` varchar(255) DEFAULT NULL COMMENT '商机IDs',
  `contract_ids` varchar(255) DEFAULT NULL COMMENT '合同IDs',
  `status` int(11) DEFAULT NULL COMMENT '状态1可用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务关联业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_work_task_relation`
--

LOCK TABLES `wk_work_task_relation` WRITE;
/*!40000 ALTER TABLE `wk_work_task_relation` DISABLE KEYS */;
INSERT INTO `wk_work_task_relation` VALUES (1,4,'','','','',NULL,'2024-09-30 11:03:10'),(2,7,',3,',',3,','','',NULL,'2024-10-08 15:58:03');
/*!40000 ALTER TABLE `wk_work_task_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_work_user`
--

DROP TABLE IF EXISTS `wk_work_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_work_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_id` int(11) NOT NULL COMMENT '项目ID',
  `user_id` bigint(20) NOT NULL COMMENT '成员ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目成员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_work_user`
--

LOCK TABLES `wk_work_user` WRITE;
/*!40000 ALTER TABLE `wk_work_user` DISABLE KEYS */;
INSERT INTO `wk_work_user` VALUES (3,1,14773,180172),(10,3,14773,180172),(11,3,14778,180173),(12,3,14774,180173),(13,3,14775,180173),(14,3,14776,180173),(15,3,14777,180173),(16,5,14773,180172),(17,1,14778,180173);
/*!40000 ALTER TABLE `wk_work_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-21 19:53:34
