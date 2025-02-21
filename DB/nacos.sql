-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: nacos
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
-- Table structure for table `config_info`
--

DROP TABLE IF EXISTS `config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='config_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info`
--

LOCK TABLES `config_info` WRITE;
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
INSERT INTO `config_info` VALUES (1,'service.vgroupMapping.crm_tx_group','SEATA_GROUP','default','c21f969b5f03d33d43e04f8f136e7682','2020-10-12 09:06:43','2024-09-16 20:26:07',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(2,'service.vgroupMapping.admin_tx_group','SEATA_GROUP','default','c21f969b5f03d33d43e04f8f136e7682','2020-10-12 09:06:43','2024-09-16 20:26:10',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(3,'store.mode','SEATA_GROUP','db','d77d5e503ad1439f585ac494268b351b','2020-10-12 09:06:43','2024-09-16 20:26:07',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(4,'store.db.datasource','SEATA_GROUP','druid','3d650fb8a5df01600281d48c47c9fa60','2020-10-12 09:06:43','2024-09-16 20:26:07',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(5,'store.db.dbType','SEATA_GROUP','mysql','81c3b080dad537de7e10e0987a4bf52e','2020-10-12 09:06:43','2024-09-16 20:26:10',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(6,'store.db.driverClassName','SEATA_GROUP','com.mysql.jdbc.Driver','683cf0c3a5a56cec94dfac94ca16d760','2020-10-12 09:06:43','2024-09-16 20:26:05',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(7,'store.db.url','SEATA_GROUP','jdbc:mysql://100.75.29.25:3306/seata?useUnicode=true','c932f19721e3779a386f26b59b3e1c22','2020-10-12 09:06:43','2024-09-16 20:26:09',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(8,'store.db.user','SEATA_GROUP','root','63a9f0ea7bb98050796b649e85481845','2020-10-12 09:06:44','2024-09-16 20:26:09',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(9,'store.db.password','SEATA_GROUP','123456','e10adc3949ba59abbe56e057f20f883e','2020-10-12 09:06:44','2024-09-16 20:26:07',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(10,'store.db.minConn','SEATA_GROUP','5','e4da3b7fbbce2345d7772b0674a318d5','2020-10-12 09:06:44','2024-09-16 20:26:06',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(11,'store.db.maxConn','SEATA_GROUP','30','34173cb38f07f89ddbebc2ac9128303f','2020-10-12 09:06:44','2024-09-16 20:26:06',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(12,'store.db.globalTable','SEATA_GROUP','global_table','8b28fb6bb4c4f984df2709381f8eba2b','2020-10-12 09:06:44','2024-09-16 20:26:09',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(13,'store.db.branchTable','SEATA_GROUP','branch_table','54bcdac38cf62e103fe115bcf46a660c','2020-10-12 09:06:44','2024-09-16 20:26:08',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(14,'store.db.queryLimit','SEATA_GROUP','100','f899139df5e1059396431415e770c6dd','2020-10-12 09:06:44','2024-09-16 20:26:07',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(15,'store.db.lockTable','SEATA_GROUP','lock_table','55e0cae3b6dc6696b768db90098b8f2f','2020-10-12 09:06:44','2024-09-16 20:26:08',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(16,'store.db.maxWait','SEATA_GROUP','5000','a35fe7f7fe8217b4369a0af4244d1fca','2020-10-12 09:06:44','2024-09-16 20:26:09',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(17,'service.vgroupMapping.oa_tx_group','SEATA_GROUP','default','c21f969b5f03d33d43e04f8f136e7682','2020-10-12 09:06:43','2024-09-16 20:26:06',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(18,'service.vgroupMapping.examine_tx_group','SEATA_GROUP','default','c21f969b5f03d33d43e04f8f136e7682','2020-10-12 09:06:43','2024-09-16 20:26:08',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(19,'service.vgroupMapping.hrm_tx_group','SEATA_GROUP','default','c21f969b5f03d33d43e04f8f136e7682','2020-10-12 09:06:43','2024-09-16 20:26:06',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(33,'service.vgroupMapping.jxc_tx_group','SEATA_GROUP','default','c21f969b5f03d33d43e04f8f136e7682','2024-09-14 17:20:45','2024-09-16 20:26:08',NULL,'172.17.0.1','','',NULL,NULL,NULL,NULL,NULL),(34,'admin-flow-rules','SENTINEL_GROUP','[\r\n    {\r\n        \"resource\": \"adminResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','10058fdbc1d0f503f2995bb367f8e02a','2025-02-16 20:44:47','2025-02-16 21:59:21',NULL,'100.75.176.55','','','null','null','null','json','null'),(35,'bi-flow-rules','SENTINEL_GROUP','[\r\n    {\r\n        \"resource\": \"biResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','67bf846ebf0df2b40301605892df17e8','2025-02-16 21:49:00','2025-02-16 21:58:12',NULL,'100.75.176.55','','','null','null','null','json','null'),(36,'authorization-flow-rules','SENTINEL_GROUP','[\r\n    {\r\n        \"resource\": \"authorizationResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','491dfcdd5c868eb6a661699f8c2615a7','2025-02-16 21:50:22','2025-02-16 21:58:27',NULL,'100.75.176.55','','','null','null','null','json','null'),(37,'crm-flow-rules','SENTINEL_GROUP','[\r\n    {\r\n        \"resource\": \"crmResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','b7cd54715da847a1ee4861fbbea6cafb','2025-02-16 21:51:53','2025-02-16 21:51:53',NULL,'100.75.176.55','','',NULL,NULL,NULL,'json',NULL),(38,'examine-flow-rules','SENTINEL_GROUP','[\r\n    {\r\n        \"resource\": \"examineResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','b9a122fc56f97a3231bd36aa71163df0','2025-02-16 21:52:58','2025-02-16 21:52:58',NULL,'100.75.176.55','','',NULL,NULL,NULL,'json',NULL),(39,'gateway-flow-rules','SENTINEL_GROUP','[\r\n    {\r\n        \"resource\": \"gatewayResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','f10842d8dbce1a4a5240250ad28f6705','2025-02-16 21:54:13','2025-02-16 21:54:13',NULL,'100.75.176.55','','',NULL,NULL,NULL,'json',NULL),(40,'hrm-flow-rules','SENTINEL_GROUP','[\r\n    {\r\n        \"resource\": \"hrmResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','e6b0b059764b5c851b705b0d892b3f58','2025-02-16 21:55:18','2025-02-16 21:55:18',NULL,'100.75.176.55','','',NULL,NULL,NULL,'json',NULL),(41,'oa-flow-rules','SENTINEL_GROUP','[\r\n    {\r\n        \"resource\": \"oaResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','eebebe97c2e37e21459f74735d4bdd77','2025-02-16 21:56:29','2025-02-16 21:56:29',NULL,'100.75.176.55','','',NULL,NULL,NULL,'json',NULL),(42,'work-flow-rules','SENTINEL_GROUP','[\r\n    {\r\n        \"resource\": \"workResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','15e489d759e0f0fbc3b35d31a6b49eb9','2025-02-16 21:57:35','2025-02-16 21:57:35',NULL,'100.75.176.55','','',NULL,NULL,NULL,'json',NULL);
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_aggr`
--

DROP TABLE IF EXISTS `config_info_aggr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='增加租户字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_aggr`
--

LOCK TABLES `config_info_aggr` WRITE;
/*!40000 ALTER TABLE `config_info_aggr` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_aggr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_beta`
--

DROP TABLE IF EXISTS `config_info_beta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='config_info_beta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_beta`
--

LOCK TABLES `config_info_beta` WRITE;
/*!40000 ALTER TABLE `config_info_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_beta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_route`
--

DROP TABLE IF EXISTS `config_info_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_route` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `route_id` varchar(100) NOT NULL COMMENT '路由id',
  `uri` varchar(100) NOT NULL COMMENT 'uri路径',
  `predicates` text NOT NULL COMMENT '判定器',
  `filters` text COMMENT '过滤器',
  `orders` int(11) DEFAULT NULL COMMENT '排序',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `intercept` int(1) NOT NULL DEFAULT '1' COMMENT '是否拦截 1 是 0 否',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态：Y-有效，N-无效',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ux_gateway_routes_uri` (`uri`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='网关路由表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_route`
--

LOCK TABLES `config_info_route` WRITE;
/*!40000 ALTER TABLE `config_info_route` DISABLE KEYS */;
INSERT INTO `config_info_route` VALUES (101,'authorization','lb://authorization','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/authorization*/**\"}}]','[]',100,'用户认证相关接口',1,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(102,'admin','lb://admin','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/admin*/**\"}}]','[]',100,'系统管理相关接口',1,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(103,'login','lb://authorization/login','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/login\"}}]','[]',100,'用户登录相关接口',0,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(104,'logout','lb://authorization/logout','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/logout\"}}]','[]',100,'用户退出相关接口',0,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(105,'reLogin','lb://authorization/reLogin','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/reLogin\"}}]','[]',100,'用户重新登录相关接口',0,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(106,'crm','lb://crm','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/crm*/**\"}}]','[]',100,'客户管理相关接口',1,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(107,'hrm','lb://hrm','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/hrm*/**\"}}]','[]',100,'人力资源相关接口',1,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(108,'jxc','lb://jxc','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/jxc*/**\"}}]','[]',100,'进销存相关接口',1,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(109,'work','lb://work','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/work*/**\"}}]','[]',100,'项目管理相关接口',1,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(113,'oa','lb://oa','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/oa*/**\"}}]','[]',100,'OA相关接口',1,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(114,'email','lb://email','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/email*/**\"}}]','[]',100,'邮箱相关接口',1,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(115,'km','lb://km','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/km*/**\"}}]','[]',100,'知识库相关接口',1,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(116,'bi','lb://bi','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/bi*/**\"}}]','[]',100,'商业智能相关接口',1,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(117,'file','http://100.75.29.25:8012/onlinePreview','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/onlinePreview\"}}]','[]',100,'文件预览相关接口',0,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(118,'queryShareUrl','lb://km','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/documentShare/queryShareUrl/*\"}}]','[]',100,'知识库分享接口',0,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(119,'crmCallUpload','lb://crmCall/upload','[{\"name\":\"Path\",\"args\":{\"pattern\":\"crmCall/upload/*\"}}]','[]',100,'呼叫中心上传接口',0,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(123,'permission','lb://authorization/permission','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/permission\"}}]','[]',100,'用户权限验证接口',0,1,'2020-04-21 17:00:32','2020-04-21 17:00:32'),(124,'examine','lb://examine','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/examine*/**\"}}]','[]',100,'审批相关接口',1,1,'2020-04-21 17:00:32','2020-04-21 17:00:32');
/*!40000 ALTER TABLE `config_info_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_tag`
--

DROP TABLE IF EXISTS `config_info_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='config_info_tag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_tag`
--

LOCK TABLES `config_info_tag` WRITE;
/*!40000 ALTER TABLE `config_info_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_tags_relation`
--

DROP TABLE IF EXISTS `config_tags_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='config_tag_relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_tags_relation`
--

LOCK TABLES `config_tags_relation` WRITE;
/*!40000 ALTER TABLE `config_tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_tags_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_capacity`
--

DROP TABLE IF EXISTS `group_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='集群、各Group容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_capacity`
--

LOCK TABLES `group_capacity` WRITE;
/*!40000 ALTER TABLE `group_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `his_config_info`
--

DROP TABLE IF EXISTS `his_config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  KEY `idx_gmt_create` (`gmt_create`) USING BTREE,
  KEY `idx_gmt_modified` (`gmt_modified`) USING BTREE,
  KEY `idx_did` (`data_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='多租户改造';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `his_config_info`
--

LOCK TABLES `his_config_info` WRITE;
/*!40000 ALTER TABLE `his_config_info` DISABLE KEYS */;
INSERT INTO `his_config_info` VALUES (0,1,'admin-flow-rules','SENTINEL_GROUP','','[\r\n    {\r\n        \"resource\": \"testResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','7c490403dac091ab3096e1e663a36d45','2025-02-16 20:44:46','2025-02-16 20:44:47',NULL,'100.75.176.55','I',''),(0,2,'bi-flow-rules','SENTINEL_GROUP','','[\r\n    {\r\n        \"resource\": \"Bi_Resource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','0f9272a2b142c1436f5260e52ef1a339','2025-02-16 21:49:00','2025-02-16 21:49:00',NULL,'100.75.176.55','I',''),(0,3,'authorization-flow-rules','SENTINEL_GROUP','','[\r\n    {\r\n        \"resource\": \"Authorization_Resource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','74c7183ae684785ac26c227a1563c9ef','2025-02-16 21:50:22','2025-02-16 21:50:22',NULL,'100.75.176.55','I',''),(0,4,'crm-flow-rules','SENTINEL_GROUP','','[\r\n    {\r\n        \"resource\": \"crmResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','b7cd54715da847a1ee4861fbbea6cafb','2025-02-16 21:51:53','2025-02-16 21:51:53',NULL,'100.75.176.55','I',''),(0,5,'examine-flow-rules','SENTINEL_GROUP','','[\r\n    {\r\n        \"resource\": \"examineResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','b9a122fc56f97a3231bd36aa71163df0','2025-02-16 21:52:57','2025-02-16 21:52:58',NULL,'100.75.176.55','I',''),(0,6,'gateway-flow-rules','SENTINEL_GROUP','','[\r\n    {\r\n        \"resource\": \"gatewayResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','f10842d8dbce1a4a5240250ad28f6705','2025-02-16 21:54:13','2025-02-16 21:54:13',NULL,'100.75.176.55','I',''),(0,7,'hrm-flow-rules','SENTINEL_GROUP','','[\r\n    {\r\n        \"resource\": \"hrmResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','e6b0b059764b5c851b705b0d892b3f58','2025-02-16 21:55:17','2025-02-16 21:55:18',NULL,'100.75.176.55','I',''),(0,8,'oa-flow-rules','SENTINEL_GROUP','','[\r\n    {\r\n        \"resource\": \"oaResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','eebebe97c2e37e21459f74735d4bdd77','2025-02-16 21:56:29','2025-02-16 21:56:29',NULL,'100.75.176.55','I',''),(0,9,'work-flow-rules','SENTINEL_GROUP','','[\r\n    {\r\n        \"resource\": \"workResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','15e489d759e0f0fbc3b35d31a6b49eb9','2025-02-16 21:57:35','2025-02-16 21:57:35',NULL,'100.75.176.55','I',''),(35,10,'bi-flow-rules','SENTINEL_GROUP','','[\r\n    {\r\n        \"resource\": \"Bi_Resource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','0f9272a2b142c1436f5260e52ef1a339','2025-02-16 21:58:12','2025-02-16 21:58:12',NULL,'100.75.176.55','U',''),(36,11,'authorization-flow-rules','SENTINEL_GROUP','','[\r\n    {\r\n        \"resource\": \"Authorization_Resource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','74c7183ae684785ac26c227a1563c9ef','2025-02-16 21:58:26','2025-02-16 21:58:27',NULL,'100.75.176.55','U',''),(34,12,'admin-flow-rules','SENTINEL_GROUP','','[\r\n    {\r\n        \"resource\": \"testResource\",\r\n        \"limitApp\": \"default\",\r\n        \"grade\": 1,\r\n        \"count\": 10,\r\n        \"strategy\": 0,\r\n        \"controlBehavior\": 0,\r\n        \"clusterMode\": false\r\n    }\r\n]','7c490403dac091ab3096e1e663a36d45','2025-02-16 21:59:20','2025-02-16 21:59:21',NULL,'100.75.176.55','U','');
/*!40000 ALTER TABLE `his_config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(512) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('nacos','ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_capacity`
--

DROP TABLE IF EXISTS `tenant_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='租户容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_capacity`
--

LOCK TABLES `tenant_capacity` WRITE;
/*!40000 ALTER TABLE `tenant_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_info`
--

DROP TABLE IF EXISTS `tenant_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='tenant_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_info`
--

LOCK TABLES `tenant_info` WRITE;
/*!40000 ALTER TABLE `tenant_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('nacos','$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_admin_user`
--

DROP TABLE IF EXISTS `wk_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_admin_user` (
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `salt` varchar(32) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL,
  `num` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `post` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(30) DEFAULT NULL,
  `old_user_id` bigint(20) DEFAULT NULL,
  `is_del` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_admin_user`
--

LOCK TABLES `wk_admin_user` WRITE;
/*!40000 ALTER TABLE `wk_admin_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_admin_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-21 19:58:36
