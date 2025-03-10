-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: wk_hrm_single
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分布式事务的日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undo_log`
--

LOCK TABLES `undo_log` WRITE;
/*!40000 ALTER TABLE `undo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `undo_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_achievement_appraisal`
--

DROP TABLE IF EXISTS `wk_hrm_achievement_appraisal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_achievement_appraisal` (
  `appraisal_id` int(11) NOT NULL AUTO_INCREMENT,
  `appraisal_name` varchar(50) DEFAULT NULL COMMENT '考核名称',
  `cycle_type` int(11) DEFAULT NULL COMMENT '1 月 2 季 3 年 4 半年',
  `start_time` date DEFAULT NULL COMMENT '考核开始时间',
  `end_time` date DEFAULT NULL COMMENT '考核结束时间',
  `table_id` int(11) DEFAULT NULL COMMENT '考核表模板id',
  `written_by` int(11) DEFAULT '1' COMMENT '考核目标填写人 1 本人',
  `result_confirmors` varchar(1024) DEFAULT NULL COMMENT '考核结果确认人\n',
  `full_score` decimal(7,2) DEFAULT NULL COMMENT '考评总分数',
  `is_force` int(11) DEFAULT NULL COMMENT '是否开启强制分布 1 是 0 否',
  `employee_ids` varchar(1024) DEFAULT NULL COMMENT '考核员工',
  `dept_ids` varchar(1024) DEFAULT NULL COMMENT '考核部门',
  `appraisal_steps` int(11) DEFAULT '-1' COMMENT '考核步骤进度',
  `activate_steps` int(11) DEFAULT '-1' COMMENT '进行中步骤进度',
  `status` int(11) DEFAULT '0' COMMENT '绩效状态 0 未开启考核 1 绩效填写中 2 绩效评定中 3 结果确认中 4 归档',
  `is_stop` int(11) DEFAULT '0' COMMENT '是否终止 0 否 1 是',
  `stop_time` datetime DEFAULT NULL COMMENT '终止时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`appraisal_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='绩效考核';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_achievement_appraisal`
--

LOCK TABLES `wk_hrm_achievement_appraisal` WRITE;
/*!40000 ALTER TABLE `wk_hrm_achievement_appraisal` DISABLE KEYS */;
INSERT INTO `wk_hrm_achievement_appraisal` VALUES (1,'11月考核',1,'2024-11-01','2024-11-30',48,1,',1,',100.00,1,'',',19,',0,1,1,1,'2024-10-14 09:57:41',14773,'2024-10-14 09:56:09','2024-10-14 09:57:41'),(2,'001',1,'2024-10-13','2024-11-14',48,1,',1,',100.00,0,'',',19,',-1,-1,0,0,NULL,14773,'2024-10-14 10:01:24','2024-10-14 10:01:39');
/*!40000 ALTER TABLE `wk_hrm_achievement_appraisal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_achievement_appraisal_evaluators`
--

DROP TABLE IF EXISTS `wk_hrm_achievement_appraisal_evaluators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_achievement_appraisal_evaluators` (
  `evaluators_id` int(11) NOT NULL AUTO_INCREMENT,
  `appraisal_id` int(11) NOT NULL COMMENT '考核id',
  `type` int(11) NOT NULL COMMENT '1 员工本人 2 直属上级 3 所在部门负责人 4 上级部门负责人 5 指定目标确认人',
  `employee_id` int(11) DEFAULT NULL COMMENT '指定确认人id',
  `weight` decimal(5,2) NOT NULL COMMENT '权重',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`evaluators_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='考核结果评定人';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_achievement_appraisal_evaluators`
--

LOCK TABLES `wk_hrm_achievement_appraisal_evaluators` WRITE;
/*!40000 ALTER TABLE `wk_hrm_achievement_appraisal_evaluators` DISABLE KEYS */;
INSERT INTO `wk_hrm_achievement_appraisal_evaluators` VALUES (1,1,2,NULL,70.00,1),(2,1,4,NULL,30.00,2),(4,2,1,NULL,100.00,1);
/*!40000 ALTER TABLE `wk_hrm_achievement_appraisal_evaluators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_achievement_appraisal_score_level`
--

DROP TABLE IF EXISTS `wk_hrm_achievement_appraisal_score_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_achievement_appraisal_score_level` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `appraisal_id` int(11) NOT NULL COMMENT '考核id',
  `level_name` varchar(50) NOT NULL COMMENT '等级名称',
  `min_score` decimal(7,2) DEFAULT NULL COMMENT '最小分数',
  `max_score` decimal(7,2) NOT NULL COMMENT '最大分数',
  `min_num` int(11) NOT NULL COMMENT '最小人数比例',
  `max_num` int(11) NOT NULL COMMENT '最大人数比例',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`level_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='考核评定规则等级';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_achievement_appraisal_score_level`
--

LOCK TABLES `wk_hrm_achievement_appraisal_score_level` WRITE;
/*!40000 ALTER TABLE `wk_hrm_achievement_appraisal_score_level` DISABLE KEYS */;
INSERT INTO `wk_hrm_achievement_appraisal_score_level` VALUES (1,1,'S',85.00,100.00,10,15,1),(2,1,'A',75.00,84.00,50,55,2),(3,1,'B',60.00,74.00,30,35,3),(4,1,'C',0.00,59.00,10,15,4),(9,2,'S',85.00,100.00,10,15,1),(10,2,'A',75.00,84.00,50,55,2),(11,2,'B',60.00,74.00,30,35,3),(12,2,'C',0.00,59.00,10,15,4);
/*!40000 ALTER TABLE `wk_hrm_achievement_appraisal_score_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_achievement_appraisal_target_confirmors`
--

DROP TABLE IF EXISTS `wk_hrm_achievement_appraisal_target_confirmors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_achievement_appraisal_target_confirmors` (
  `target_confirmors_id` int(11) NOT NULL AUTO_INCREMENT,
  `appraisal_id` int(11) DEFAULT NULL COMMENT '考核id',
  `type` int(11) DEFAULT NULL COMMENT '1 员工本人 2 直属上级 3 所在部门负责人 4 上级部门负责人 5 指定目标确认人',
  `employee_id` int(11) DEFAULT NULL COMMENT '指定确认人id',
  `sort` int(11) DEFAULT NULL COMMENT '步骤号 从小到大',
  PRIMARY KEY (`target_confirmors_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='考核目标确认人';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_achievement_appraisal_target_confirmors`
--

LOCK TABLES `wk_hrm_achievement_appraisal_target_confirmors` WRITE;
/*!40000 ALTER TABLE `wk_hrm_achievement_appraisal_target_confirmors` DISABLE KEYS */;
INSERT INTO `wk_hrm_achievement_appraisal_target_confirmors` VALUES (1,1,1,NULL,1),(3,2,1,NULL,1);
/*!40000 ALTER TABLE `wk_hrm_achievement_appraisal_target_confirmors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_achievement_employee_appraisal`
--

DROP TABLE IF EXISTS `wk_hrm_achievement_employee_appraisal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_achievement_employee_appraisal` (
  `employee_appraisal_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL COMMENT '员工id',
  `appraisal_id` int(11) DEFAULT NULL COMMENT '绩效id',
  `status` int(11) DEFAULT NULL COMMENT '考核状态 1 待填写 2 待目标确认 3 待评定 4 待结果确认 5 终止绩效 6 考核完成',
  `score` double(10,2) DEFAULT NULL COMMENT '评分',
  `level_id` int(11) DEFAULT NULL COMMENT '考核结果',
  `read_status` int(11) DEFAULT '0' COMMENT '结果阅读状态 0 未读 1 已读',
  `follow_up_employee_id` int(11) DEFAULT NULL COMMENT '跟进员工id',
  `follow_sort` int(11) DEFAULT NULL COMMENT '跟进员工排序',
  `create_time` datetime DEFAULT NULL,
  `is_draft` int(11) DEFAULT '0' COMMENT '是否为草稿 0否 1是',
  PRIMARY KEY (`employee_appraisal_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='员工绩效考核';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_achievement_employee_appraisal`
--

LOCK TABLES `wk_hrm_achievement_employee_appraisal` WRITE;
/*!40000 ALTER TABLE `wk_hrm_achievement_employee_appraisal` DISABLE KEYS */;
INSERT INTO `wk_hrm_achievement_employee_appraisal` VALUES (1,1,1,5,NULL,NULL,0,1,1,'2024-10-14 09:57:05',0),(2,2,1,5,NULL,NULL,0,2,1,'2024-10-14 09:57:05',0);
/*!40000 ALTER TABLE `wk_hrm_achievement_employee_appraisal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_achievement_employee_evaluato`
--

DROP TABLE IF EXISTS `wk_hrm_achievement_employee_evaluato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_achievement_employee_evaluato` (
  `employee_evaluato_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_appraisal_id` int(11) DEFAULT NULL COMMENT '员工端考核id',
  `appraisal_id` int(11) DEFAULT NULL COMMENT '绩效id',
  `employee_id` int(11) NOT NULL COMMENT '确认人',
  `weight` decimal(5,2) DEFAULT NULL COMMENT '权重',
  `score` decimal(7,2) DEFAULT NULL COMMENT '评分',
  `level_id` int(11) DEFAULT NULL COMMENT '考核等级',
  `evaluate` varchar(1024) DEFAULT NULL COMMENT '评语',
  `reject_reason` varchar(1024) DEFAULT NULL COMMENT '驳回原因',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(11) DEFAULT '0' COMMENT '0 待评定 1 已评定',
  PRIMARY KEY (`employee_evaluato_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='员工绩效结果评定表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_achievement_employee_evaluato`
--

LOCK TABLES `wk_hrm_achievement_employee_evaluato` WRITE;
/*!40000 ALTER TABLE `wk_hrm_achievement_employee_evaluato` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_achievement_employee_evaluato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_achievement_employee_evaluato_seg`
--

DROP TABLE IF EXISTS `wk_hrm_achievement_employee_evaluato_seg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_achievement_employee_evaluato_seg` (
  `employee_evaluato_seg_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_appraisal_id` int(11) DEFAULT NULL COMMENT '员工端考核id',
  `employee_evaluato_id` int(11) DEFAULT NULL COMMENT '结果评定id',
  `seg_id` int(11) DEFAULT NULL COMMENT '考核项id',
  `employee_id` int(11) NOT NULL COMMENT '（评定人/确定人/员工）id',
  `score` decimal(7,2) DEFAULT NULL COMMENT '评分',
  `evaluate` varchar(1024) DEFAULT NULL COMMENT '评语',
  `status` int(11) DEFAULT '1' COMMENT '0 待评定 1 已评定',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`employee_evaluato_seg_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='员工绩效考核项评定表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_achievement_employee_evaluato_seg`
--

LOCK TABLES `wk_hrm_achievement_employee_evaluato_seg` WRITE;
/*!40000 ALTER TABLE `wk_hrm_achievement_employee_evaluato_seg` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_achievement_employee_evaluato_seg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_achievement_employee_result_confirmors`
--

DROP TABLE IF EXISTS `wk_hrm_achievement_employee_result_confirmors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_achievement_employee_result_confirmors` (
  `confirmors_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL COMMENT '（评定人/确定人/员工）id',
  `appraisal_id` int(11) DEFAULT NULL COMMENT '绩效id',
  `status` int(11) DEFAULT '0' COMMENT '0 未确认 1 已确认',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`confirmors_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='绩效结果确认表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_achievement_employee_result_confirmors`
--

LOCK TABLES `wk_hrm_achievement_employee_result_confirmors` WRITE;
/*!40000 ALTER TABLE `wk_hrm_achievement_employee_result_confirmors` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_achievement_employee_result_confirmors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_achievement_employee_seg`
--

DROP TABLE IF EXISTS `wk_hrm_achievement_employee_seg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_achievement_employee_seg` (
  `seg_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_appraisal_id` int(11) DEFAULT NULL,
  `temp_seg_id` int(11) DEFAULT '0' COMMENT '模板考核项id',
  `employee_id` int(11) DEFAULT NULL COMMENT '（评定人/确定人/员工）id',
  `seg_name` varchar(50) DEFAULT NULL COMMENT '考核项名称',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `is_fixed` int(11) DEFAULT NULL COMMENT '是否固定 1 是 0 否',
  `weight` decimal(5,2) DEFAULT NULL COMMENT '权重 -1 员工写权重比 0~100',
  `schedule` int(11) DEFAULT '0' COMMENT '目标进度',
  `explain_desc` varchar(1024) DEFAULT NULL COMMENT '完成情况说明',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`seg_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='员工绩效考核项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_achievement_employee_seg`
--

LOCK TABLES `wk_hrm_achievement_employee_seg` WRITE;
/*!40000 ALTER TABLE `wk_hrm_achievement_employee_seg` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_achievement_employee_seg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_achievement_employee_seg_item`
--

DROP TABLE IF EXISTS `wk_hrm_achievement_employee_seg_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_achievement_employee_seg_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `seg_id` int(11) DEFAULT NULL COMMENT '考核项id',
  `temp_item_id` int(11) DEFAULT '0' COMMENT '模板考核项id',
  `item_name` varchar(50) DEFAULT NULL COMMENT '选项名称',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='员工考核项选项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_achievement_employee_seg_item`
--

LOCK TABLES `wk_hrm_achievement_employee_seg_item` WRITE;
/*!40000 ALTER TABLE `wk_hrm_achievement_employee_seg_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_achievement_employee_seg_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_achievement_employee_target_confirm`
--

DROP TABLE IF EXISTS `wk_hrm_achievement_employee_target_confirm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_achievement_employee_target_confirm` (
  `employee_confirm_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_appraisal_id` int(11) DEFAULT NULL COMMENT '员工端考核id',
  `appraisal_id` int(11) DEFAULT NULL COMMENT '绩效id',
  `employee_id` int(11) NOT NULL COMMENT '确认人',
  `reject_reason` varchar(1024) DEFAULT NULL COMMENT '驳回原因',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(11) DEFAULT '0' COMMENT '0 待确认 1 已确认 2 驳回 ',
  PRIMARY KEY (`employee_confirm_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='员工考核目标确认表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_achievement_employee_target_confirm`
--

LOCK TABLES `wk_hrm_achievement_employee_target_confirm` WRITE;
/*!40000 ALTER TABLE `wk_hrm_achievement_employee_target_confirm` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_achievement_employee_target_confirm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_achievement_seg`
--

DROP TABLE IF EXISTS `wk_hrm_achievement_seg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_achievement_seg` (
  `seg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考核项id',
  `table_id` int(11) DEFAULT NULL COMMENT '考核类型id(有个类型表)',
  `seg_name` varchar(50) DEFAULT NULL COMMENT '考核项名称',
  `is_fixed` int(11) DEFAULT NULL COMMENT '是否固定 1 是 0 否',
  `weight` decimal(5,2) DEFAULT NULL COMMENT '权重 -1 员工写权重比 0~100',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`seg_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='绩效考核项模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_achievement_seg`
--

LOCK TABLES `wk_hrm_achievement_seg` WRITE;
/*!40000 ALTER TABLE `wk_hrm_achievement_seg` DISABLE KEYS */;
INSERT INTO `wk_hrm_achievement_seg` VALUES (34,49,'目标（O）',0,NULL,1),(37,48,'社会主义核心价值观',1,0.50,1),(38,48,'关键绩效（KP）',0,NULL,1);
/*!40000 ALTER TABLE `wk_hrm_achievement_seg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_achievement_seg_item`
--

DROP TABLE IF EXISTS `wk_hrm_achievement_seg_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_achievement_seg_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考核子项id',
  `seg_id` int(11) DEFAULT NULL COMMENT '考核项id',
  `item_name` varchar(50) DEFAULT NULL COMMENT '选项名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='考核子项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_achievement_seg_item`
--

LOCK TABLES `wk_hrm_achievement_seg_item` WRITE;
/*!40000 ALTER TABLE `wk_hrm_achievement_seg_item` DISABLE KEYS */;
INSERT INTO `wk_hrm_achievement_seg_item` VALUES (100,34,'关键结果（kr）',1),(101,34,'关键结果（kr）',2),(102,34,'关键结果（kr）',3),(110,37,'富强、民主、文明、和谐',1),(111,37,'自由、平等、公正、法治',2),(112,37,'爱国、敬业、诚信、友善',3),(113,38,'KPI指标1',1),(114,38,'KPI指标2',2),(115,38,'KPI指标3',3),(116,38,'KPI指标4',4);
/*!40000 ALTER TABLE `wk_hrm_achievement_seg_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_achievement_table`
--

DROP TABLE IF EXISTS `wk_hrm_achievement_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_achievement_table` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考核类型id',
  `table_name` varchar(50) DEFAULT NULL COMMENT '考核类型名称（KPI/okr）',
  `type` int(11) DEFAULT NULL COMMENT '1 OKR模板 2 KPI模板',
  `description` longtext COMMENT '考核表描述',
  `is_emp_weight` int(11) DEFAULT '0' COMMENT '是否员工填写权重 0 否 1 是',
  `status` int(11) DEFAULT '1' COMMENT ' 1 使用 0 删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建用户id',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='绩效考核类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_achievement_table`
--

LOCK TABLES `wk_hrm_achievement_table` WRITE;
/*!40000 ALTER TABLE `wk_hrm_achievement_table` DISABLE KEYS */;
INSERT INTO `wk_hrm_achievement_table` VALUES (48,'KPI模板',2,'1.结果导向原则：以业绩目标考核为主，员工要时刻关注岗位目标、充分理解团队目标，个人目标要支撑团队目标。\n2.关键绩效（KP）由本岗位岗位职责、重点工作、团队目标等分解而来。\n3.KPI为衡量该关键绩效（KP）的关键业绩指标，要目标明确、可量化、易计算。\n4.固定项考核指公司可根据实际情况设定固定考核指标，适用于考核范围内所有人员，员工不可编辑 。例如：行为态度类考核、能力素质类考核等。\n5.末尾淘汰机制',1,1,'2020-06-22 10:10:09',14773),(49,'OKR模板',1,'1.OKR的主要目标是明确公司和团队的“目标”以及明确每个目标达成的可衡量的“关键结果”。\n2.个人首先要充分理解团队整体目标，个人目标的设定要支撑团队目标。\n3.本着“挑战导向”原则，目标一定要具有挑战性，超越当前现状，可衡量，可分解；关键成果是支持目标落地的具体事项，也要可衡量。\n4.目标一般不超过5项，每个目标一般拆解为1-3个关键成果，权重总和为100%。',1,1,'2020-06-23 10:43:46',14773);
/*!40000 ALTER TABLE `wk_hrm_achievement_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_action_record`
--

DROP TABLE IF EXISTS `wk_hrm_action_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_action_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'ip地址',
  `type` int(11) DEFAULT NULL COMMENT '操作类型 1 员工 2 招聘管理 3 候选人 4 绩效管理',
  `type_id` int(11) DEFAULT NULL COMMENT '操作对象id',
  `behavior` int(11) DEFAULT NULL COMMENT '操作行为 1 新建 2 编辑 3 删除 4 转正 5 调岗 6 晋升 7 降级 8 转全职员工 9 离职 10 参保方案',
  `content` longtext CHARACTER SET utf8mb4 COMMENT '内容',
  `create_user_id` bigint(20) NOT NULL COMMENT '操作人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `types` (`type`,`type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='hrm员工操作记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_action_record`
--

LOCK TABLES `wk_hrm_action_record` WRITE;
/*!40000 ALTER TABLE `wk_hrm_action_record` DISABLE KEYS */;
INSERT INTO `wk_hrm_action_record` VALUES (1,'100.75.29.25',1,1,1,'[\"新建了员工\"]',14773,'2024-10-12 14:41:47'),(2,'100.75.29.25',1,2,1,'[\"新建了员工\"]',14773,'2024-10-12 14:48:44'),(3,'100.75.29.25',1,3,1,'[\"新建了员工\"]',14773,'2024-10-12 14:55:04'),(4,'100.75.29.25',1,4,1,'[\"新建了员工\"]',14773,'2024-10-12 14:59:47'),(5,'100.75.29.25',1,5,1,'[\"新建了员工\"]',14773,'2024-10-12 15:02:12'),(6,'100.75.29.25',1,2,2,'[\"将证件号码 由空修改为440823200808011447。\",\"将出生日期 由空修改为2008-08-01 00:00:00。\",\"将年龄 由空修改为16。\"]',14773,'2024-10-12 15:02:47'),(7,'100.75.29.25',1,4,2,'[\"将部门 由18修改为20。\",\"将司龄 由12修改为空。\"]',14773,'2024-10-12 15:05:18'),(8,'100.75.29.25',1,5,2,'[\"将部门 由18修改为22。\",\"将司龄 由1修改为空。\"]',14773,'2024-10-12 15:05:41'),(9,'100.75.29.25',1,3,2,'[\"将部门 由空修改为23。\",\"将司龄 由1修改为空。\"]',14773,'2024-10-12 15:06:11'),(10,'100.75.29.25',1,6,1,'[\"新建了员工\"]',14773,'2024-10-12 15:13:09'),(11,'100.75.29.25',1,6,2,'[\"将部门 由空修改为24。\",\"将司龄 由1修改为空。\"]',14773,'2024-10-12 15:14:20'),(12,'100.75.29.25',1,7,1,'[\"新建了员工\"]',14773,'2024-10-12 15:16:20'),(13,'100.75.29.25',2,1,1,'[\"新建了职位\"]',14773,'2024-10-12 15:18:18'),(14,'100.75.29.25',1,8,1,'[\"新建了员工\"]',14773,'2024-10-12 15:20:40'),(15,'100.75.29.25',1,7,2,'[\"将岗位 由空修改为测试部长/测试工程师。\",\"将司龄 由0修改为空。\"]',14773,'2024-10-12 15:23:04'),(16,'100.75.29.25',1,6,2,'[\"将岗位 由空修改为法务部长/法务部律师。\",\"将招聘渠道 由空修改为内部举荐。\",\"将司龄 由1修改为空。\"]',14773,'2024-10-12 15:23:53'),(17,'100.75.29.25',1,2,2,'[\"将岗位 由空修改为java工程师。\",\"将司龄 由4修改为空。\"]',14773,'2024-10-12 15:24:19'),(18,'100.75.29.25',1,5,2,'[\"将岗位 由空修改为销售部部长/销售。\",\"将司龄 由1修改为空。\"]',14773,'2024-10-12 15:25:56'),(19,'100.75.29.25',2,2,1,'[\"新建了职位\"]',14773,'2024-10-12 15:35:33'),(20,'100.75.29.25',1,4,2,'[\"将岗位 由空修改为运维部部长/运维工程师。\",\"将工作城市 由湖南省,长沙市,长沙县修改为广东省,佛山市,南海区。\",\"将司龄 由12修改为空。\"]',14773,'2024-10-12 15:36:15'),(21,'100.75.29.25',2,3,1,'[\"新建了职位\"]',14773,'2024-10-12 15:38:53'),(22,'100.75.29.25',3,1,1,'[\"新建了候选人\"]',14773,'2024-10-12 15:40:32'),(23,'100.75.29.25',1,1,2,'[\"将国家地区 由空修改为中国。\",\"将民族 由空修改为汉族。\",\"将籍贯 由空修改为广东省,湛江市。\",\"将生日 由空修改为1011。\"]',14773,'2024-10-12 16:33:30'),(24,'100.75.29.25',1,1,1,'[\"新建了教育经历\"]',14773,'2024-10-12 16:35:03'),(25,'100.75.29.25',1,1,1,'[\"新建了联系人\"]',14773,'2024-10-12 16:35:35'),(26,'100.75.29.25',1,1,1,'[\"新建了合同信息\"]',14773,'2024-10-12 16:48:20'),(27,'100.75.29.25',1,5,2,'[\"将招聘渠道 由空修改为企业官网。\",\"将司龄 由2修改为空。\"]',14773,'2024-10-13 11:28:18'),(28,'100.75.29.25',1,5,2,'[\"将招聘渠道 由283修改为001。\",\"将司龄 由2修改为空。\"]',14773,'2024-10-13 11:39:51'),(29,'100.75.29.25',1,5,2,'[\"将招聘渠道 由001修改为004。\",\"将司龄 由2修改为空。\"]',14773,'2024-10-13 11:40:29'),(30,'100.75.29.25',1,1,2,'[\"将招聘渠道 由空修改为003。\",\"将司龄 由2修改为空。\"]',14773,'2024-10-13 11:42:00'),(31,'100.75.29.25',1,4,2,'[\"将招聘渠道 由空修改为002。\",\"将司龄 由13修改为空。\"]',14773,'2024-10-13 12:02:22'),(32,'100.75.29.25',3,2,1,'[\"新建了候选人\"]',14773,'2024-10-13 15:53:15'),(33,'100.75.29.25',1,1,2,'[\"将是否已婚 由否修改为是。\"]',14773,'2024-10-14 08:31:57'),(34,'100.75.29.25',1,9,2,'[\"将姓名 由李明修改为空。\",\"将手机 由15698741563修改为空。\",\"将性别 由男修改为空。\",\"将生日类型 由阳历修改为空。\"]',14773,'2024-10-14 09:20:30'),(35,'100.75.29.25',1,9,1,'[\"新建了员工\"]',14773,'2024-10-14 09:20:30'),(36,'100.75.29.25',4,1,2,'[\"开启了考核\"]',14773,'2024-10-14 09:57:05'),(37,'100.75.29.25',4,2,2,'[\"开启了考核\"]',14773,'2024-10-14 09:57:05'),(38,'100.75.29.25',4,1,2,'[\"终止了考核\"]',14773,'2024-10-14 09:57:41'),(39,'100.75.29.25',4,2,2,'[\"终止了考核\"]',14773,'2024-10-14 09:57:41');
/*!40000 ALTER TABLE `wk_hrm_action_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_attendance_clock`
--

DROP TABLE IF EXISTS `wk_hrm_attendance_clock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_attendance_clock` (
  `clock_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '打卡记录id',
  `clock_employee_id` int(11) DEFAULT NULL,
  `clock_time` datetime NOT NULL COMMENT '打卡时间',
  `clock_type` int(11) NOT NULL COMMENT '打卡类型 1 上班打卡 2 下班打卡',
  `attendance_time` datetime NOT NULL COMMENT '上班日期',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '打卡类型 1手机端打卡 2手工录入',
  `address` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '考勤地址',
  `lng` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '精度',
  `lat` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '维度',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`clock_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='打卡记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_attendance_clock`
--

LOCK TABLES `wk_hrm_attendance_clock` WRITE;
/*!40000 ALTER TABLE `wk_hrm_attendance_clock` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_attendance_clock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_config`
--

DROP TABLE IF EXISTS `wk_hrm_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '配置类型 1 淘汰原因 2 薪资初始化配置1 3 薪资初始化配置2 4 社保初始化配置1 5 社保初始化配置2',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='人力资源配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_config`
--

LOCK TABLES `wk_hrm_config` WRITE;
/*!40000 ALTER TABLE `wk_hrm_config` DISABLE KEYS */;
INSERT INTO `wk_hrm_config` VALUES (145,2,'0','2020-06-09 14:38:43'),(146,3,'0','2020-06-09 14:38:43'),(147,4,'1','2020-06-09 14:38:43'),(148,5,'1','2020-06-09 14:38:43'),(154,1,'沟通表达能力差','2024-10-12 08:05:23'),(155,1,'候选人放弃','2024-10-12 08:05:23'),(156,1,'薪资要求过高','2024-10-12 08:05:23'),(157,1,'稳定性较差','2024-10-12 08:05:23'),(158,1,'相关经验少','2024-10-12 08:05:23'),(159,1,'学历达不到要求','2024-10-12 08:05:23');
/*!40000 ALTER TABLE `wk_hrm_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_dept`
--

DROP TABLE IF EXISTS `wk_hrm_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '父级ID 顶级部门为0',
  `dept_type` int(11) DEFAULT NULL COMMENT '1 公司 2 部门',
  `name` varchar(64) NOT NULL COMMENT '部门名称',
  `code` varchar(64) DEFAULT NULL COMMENT '部门编码',
  `main_employee_id` int(11) DEFAULT NULL COMMENT '部门负责人ID',
  `leader_employee_id` int(11) DEFAULT NULL COMMENT '分管领导',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建用户id',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_dept`
--

LOCK TABLES `wk_hrm_dept` WRITE;
/*!40000 ALTER TABLE `wk_hrm_dept` DISABLE KEYS */;
INSERT INTO `wk_hrm_dept` VALUES (18,0,1,'全公司','1',2,2,NULL,14773),(19,18,2,'开发部','K001',1,1,'2024-10-12 14:34:32',14773),(20,18,2,'运维部','Y001',4,4,'2024-10-12 14:39:24',14773),(21,18,2,'测试部','C001',7,7,'2024-10-12 14:56:48',14773),(22,18,2,'销售部','X001',5,5,'2024-10-12 14:57:31',14773),(23,18,2,'外交部','W001',3,3,'2024-10-12 14:57:48',14773),(24,18,1,'法务部','F001',6,6,'2024-10-12 15:13:31',14773),(25,18,1,'人事部','R001',8,8,'2024-10-12 15:18:45',14773);
/*!40000 ALTER TABLE `wk_hrm_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee`
--

DROP TABLE IF EXISTS `wk_hrm_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工id',
  `employee_name` varchar(255) NOT NULL COMMENT '员工姓名',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
  `country` varchar(40) DEFAULT NULL COMMENT '国家地区',
  `nation` varchar(40) DEFAULT NULL COMMENT '民族',
  `id_type` int(11) DEFAULT NULL COMMENT '证件类型 1 身份证 2 港澳通行证 3 台湾通行证 4 护照 5 其他',
  `id_number` varchar(255) DEFAULT NULL COMMENT '证件号码',
  `sex` int(11) DEFAULT NULL COMMENT '性别 1 男 2 女',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `native_place` varchar(40) DEFAULT NULL COMMENT '籍贯',
  `date_of_birth` datetime DEFAULT NULL COMMENT '出生日期',
  `birthday_type` int(11) DEFAULT '1' COMMENT '生日类型 1 阳历 2 农历',
  `birthday` varchar(20) DEFAULT NULL COMMENT '生日 示例：0323',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `address` varchar(255) DEFAULT NULL COMMENT '户籍地址',
  `highest_education` int(11) DEFAULT NULL COMMENT '最高学历',
  `entry_time` datetime DEFAULT NULL COMMENT '入职时间',
  `probation` int(11) DEFAULT NULL COMMENT '试用期 0 无试用期',
  `become_time` datetime DEFAULT NULL COMMENT '转正日期',
  `job_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '员工职位编号',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '直属上级ID',
  `post` varchar(255) DEFAULT NULL COMMENT '职位',
  `post_level` varchar(255) DEFAULT NULL COMMENT '岗位职级',
  `work_address` varchar(40) DEFAULT NULL COMMENT '工作地点',
  `work_detail_address` varchar(40) DEFAULT NULL COMMENT '工作详细地址',
  `work_city` varchar(40) DEFAULT NULL COMMENT '工作城市',
  `channel_id` int(11) DEFAULT NULL COMMENT '招聘渠道',
  `employment_forms` int(11) DEFAULT NULL COMMENT '聘用形式 1 正式 2 非正式',
  `status` int(11) DEFAULT NULL COMMENT '员工状态 1正式 2试用  3实习 4兼职 5劳务 6顾问 7返聘 8外包',
  `company_age_start_time` datetime DEFAULT NULL COMMENT '司龄开始日期',
  `company_age` int(11) DEFAULT '0' COMMENT '司龄',
  `entry_status` int(11) DEFAULT NULL COMMENT '入职状态 1 在职 2 待入职 3 待离职 4 离职',
  `candidate_id` int(11) DEFAULT NULL COMMENT '候选人id',
  `is_del` int(11) DEFAULT '0' COMMENT '0 未删除 1 删除',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee`
--

LOCK TABLES `wk_hrm_employee` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee` DISABLE KEYS */;
INSERT INTO `wk_hrm_employee` VALUES (1,'刘嘉明','14767815683','中国','汉族',1,'440823200310110819',1,NULL,'广东省,湛江市','2003-10-11 00:00:00',1,'1011',21,'广东湛江',8,'2024-10-12 00:00:00',6,'2025-04-12 00:00:00','20220070204',19,NULL,'开发工程师','','深圳','','广东省,深圳市,福田区',293,1,2,'2024-10-12 00:00:00',2,1,NULL,0,14773,'2024-10-12 14:41:47','2024-10-14 08:31:57'),(2,'王天风','14565826595','','',1,'440823200808011447',1,NULL,'','2008-08-01 00:00:00',1,'',16,'',9,'2024-10-09 00:00:00',1,'2024-11-09 00:00:00','20220070205',19,NULL,'java工程师','','','','辽宁省,沈阳市,皇姑区',NULL,1,2,'2024-10-09 00:00:00',4,1,NULL,0,14773,'2024-10-12 14:48:44','2024-10-12 15:24:19'),(3,'胡歌','15685658655',NULL,NULL,1,'12000019880709054X',1,NULL,NULL,'1988-07-09 00:00:00',1,NULL,36,NULL,9,'2024-10-12 00:00:00',NULL,NULL,'20220070101',23,NULL,'','','江门','','广东省,江门市,江海区',NULL,2,6,'2024-10-12 00:00:00',1,1,NULL,0,14773,'2024-10-12 14:55:04','2024-10-12 15:06:11'),(4,'张学铭','14568563586',NULL,NULL,1,'110000192208031258',1,NULL,NULL,'1922-08-03 00:00:00',1,NULL,102,NULL,7,'2024-10-01 00:00:00',6,'2025-04-01 00:00:00','20220070303',20,NULL,'运维部部长/运维工程师','','','','广东省,佛山市,南海区',280,1,2,'2024-10-01 00:00:00',14,1,NULL,0,14773,'2024-10-12 14:59:47','2024-10-13 12:02:22'),(5,'王牧风','145685236854',NULL,NULL,1,'440823193412263362',1,NULL,NULL,'1934-12-26 00:00:00',1,NULL,89,NULL,8,'2024-10-12 00:00:00',1,'2024-11-12 00:00:00','20220060103',22,NULL,'销售部部长/销售','','','','云南省,临沧市,耿马傣族佤族自治县',295,1,2,'2024-10-12 00:00:00',2,1,NULL,0,14773,'2024-10-12 15:02:11','2024-10-13 11:40:29'),(6,'张三','145685658',NULL,NULL,1,'440823200511207713',NULL,NULL,NULL,'2005-11-20 00:00:00',1,NULL,18,NULL,8,'2024-10-12 00:00:00',1,'2024-11-12 00:00:00','20220090807',24,NULL,'法务部长/法务部律师','','','','广东省,汕头市,潮阳区',277,1,2,'2024-10-12 00:00:00',1,1,NULL,0,14773,'2024-10-12 15:13:09','2024-10-12 15:23:53'),(7,'张嘉嘉','14568536513',NULL,NULL,1,'440823197312070078',1,NULL,NULL,'1973-12-07 00:00:00',1,NULL,50,NULL,8,'2024-10-19 00:00:00',1,'2024-11-19 00:00:00','20220090101',21,NULL,'测试部长/测试工程师','','','','广东省,湛江市,遂溪县',NULL,1,2,'2024-10-19 00:00:00',0,1,NULL,0,14773,'2024-10-12 15:16:20','2024-10-12 15:23:04'),(8,'李世民','456856852368',NULL,NULL,1,'440823198409108938',1,NULL,NULL,'1984-09-10 00:00:00',1,NULL,40,NULL,9,'2024-10-01 00:00:00',0,'2024-10-01 00:00:00','20220060201',25,NULL,'人事部长/HR',NULL,'',NULL,'广东省,佛山市,顺德区',NULL,1,1,'2024-10-01 00:00:00',12,1,NULL,0,14773,'2024-10-12 15:20:40','2024-10-12 15:24:00'),(9,'李明','15698741563',NULL,NULL,NULL,NULL,1,'',NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-10-14 00:00:00',0,'2024-10-14 00:00:00','20070305',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2024-10-14 00:00:00',1,1,NULL,0,14773,'2024-10-14 09:20:30','2024-10-14 09:20:30');
/*!40000 ALTER TABLE `wk_hrm_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_abnormal_change_record`
--

DROP TABLE IF EXISTS `wk_hrm_employee_abnormal_change_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_abnormal_change_record` (
  `change_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '异动类型 1 新入职 2 离职 3 转正 4 调岗',
  `employee_id` int(11) DEFAULT NULL COMMENT '异动员工id',
  `change_time` datetime DEFAULT NULL COMMENT '异动时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`change_record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='员工异常表动记录表（薪资列表统计需要）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_abnormal_change_record`
--

LOCK TABLES `wk_hrm_employee_abnormal_change_record` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_abnormal_change_record` DISABLE KEYS */;
INSERT INTO `wk_hrm_employee_abnormal_change_record` VALUES (1,1,1,'2024-10-12 14:41:47','2024-10-12 14:41:47'),(2,1,2,'2024-10-12 14:48:44','2024-10-12 14:48:44'),(3,1,3,'2024-10-12 14:55:04','2024-10-12 14:55:04'),(4,1,4,'2024-10-12 14:59:47','2024-10-12 14:59:48'),(5,1,5,'2024-10-12 15:02:12','2024-10-12 15:02:12'),(6,1,6,'2024-10-12 15:13:09','2024-10-12 15:13:09'),(7,1,7,'2024-10-12 15:16:20','2024-10-12 15:16:20'),(8,1,8,'2024-10-12 15:20:40','2024-10-12 15:20:40'),(9,1,9,'2024-10-14 09:20:30','2024-10-14 09:20:30');
/*!40000 ALTER TABLE `wk_hrm_employee_abnormal_change_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_candidate`
--

DROP TABLE IF EXISTS `wk_hrm_employee_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `employee_id` int(11) DEFAULT NULL COMMENT '员工id',
  `candidate_id` int(11) DEFAULT NULL COMMENT '候选人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='员工候选人关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_candidate`
--

LOCK TABLES `wk_hrm_employee_candidate` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_employee_candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_certificate`
--

DROP TABLE IF EXISTS `wk_hrm_employee_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_certificate` (
  `certificate_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '证书id',
  `employee_id` int(11) DEFAULT NULL COMMENT '员工id',
  `certificate_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '证书名称',
  `certificate_level` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '证书级别',
  `certificate_num` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '证书编号',
  `start_time` datetime DEFAULT NULL COMMENT '有效起始日期',
  `end_time` datetime DEFAULT NULL COMMENT '有效结束日期',
  `issuing_authority` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '发证机构',
  `issuing_time` datetime DEFAULT NULL COMMENT '发证日期',
  `remarks` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`certificate_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='员工证书';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_certificate`
--

LOCK TABLES `wk_hrm_employee_certificate` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_employee_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_change_record`
--

DROP TABLE IF EXISTS `wk_hrm_employee_change_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_change_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `employee_id` int(11) DEFAULT NULL COMMENT '员工id',
  `change_type` int(11) DEFAULT NULL COMMENT '变动类型 4 转正 5调岗 6晋升 7降级 8转为全职员工',
  `change_reason` int(11) DEFAULT NULL COMMENT '异动原因 1 组织架构调整 2个人申请 3 工作安排 4 违规违纪 5 绩效不达标 6 个人身体原因 7 不适应当前岗位',
  `old_dept` int(11) DEFAULT NULL COMMENT '原部门',
  `new_dept` int(11) DEFAULT NULL COMMENT '新部门',
  `old_post` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原岗位',
  `new_post` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '新岗位',
  `old_post_level` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '新职级',
  `new_post_level` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '新职级',
  `old_work_address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '原工作地点',
  `new_work_address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '新工作地点',
  `old_parent_id` int(11) DEFAULT NULL COMMENT '原直属上级',
  `new_parent_id` int(11) DEFAULT NULL COMMENT '新直属上级',
  `probation` int(11) DEFAULT NULL COMMENT '试用期',
  `effect_time` datetime DEFAULT NULL COMMENT '生效时间',
  `create_user_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='员工岗位/职位变更记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_change_record`
--

LOCK TABLES `wk_hrm_employee_change_record` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_change_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_employee_change_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_contacts`
--

DROP TABLE IF EXISTS `wk_hrm_employee_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_contacts` (
  `contacts_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '联系人id',
  `employee_id` int(11) DEFAULT NULL COMMENT '（评定人/确定人/员工）id',
  `contacts_name` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系人名称',
  `relation` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '关系',
  `contacts_phone` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系人电话',
  `contacts_work_unit` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系人工作单位',
  `contacts_post` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系儿职务',
  `contacts_address` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系人地址',
  `create_time` datetime DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`contacts_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='员工联系人';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_contacts`
--

LOCK TABLES `wk_hrm_employee_contacts` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_contacts` DISABLE KEYS */;
INSERT INTO `wk_hrm_employee_contacts` VALUES (1,1,'刘星','父子','15913578934','','','','2024-10-12 16:35:35',NULL);
/*!40000 ALTER TABLE `wk_hrm_employee_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_contacts_data`
--

DROP TABLE IF EXISTS `wk_hrm_employee_contacts_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_contacts_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `label_group` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL COMMENT '字段名称',
  `field_value` longtext COMMENT '字段值',
  `field_value_desc` longtext COMMENT '字段值描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `contacts_id` int(11) NOT NULL COMMENT 'contacts_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户扩展字段数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_contacts_data`
--

LOCK TABLES `wk_hrm_employee_contacts_data` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_contacts_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_employee_contacts_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_contract`
--

DROP TABLE IF EXISTS `wk_hrm_employee_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_contract` (
  `contract_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '合同id',
  `employee_id` int(11) NOT NULL,
  `contract_num` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '合同编号',
  `contract_type` int(11) DEFAULT NULL COMMENT '1、固定期限劳动合同 2、无固定期限劳动合同 3、已完成一定工作任务为期限的劳动合同 4、实习协议 5、劳务合同 6、返聘协议 7、劳务派遣合同 8、借调合同 9、其他',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `term` int(11) DEFAULT NULL COMMENT '期限',
  `status` int(11) DEFAULT NULL COMMENT '合同状态  0未执行 1 执行中、 2已到期、 ',
  `sign_company` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '签约公司',
  `sign_time` datetime DEFAULT NULL COMMENT '合同签订日期',
  `remarks` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `is_expire_remind` int(11) DEFAULT NULL COMMENT '是否到期提醒 0 否 1 是',
  `sort` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL,
  `batch_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`contract_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='员工合同';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_contract`
--

LOCK TABLES `wk_hrm_employee_contract` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_contract` DISABLE KEYS */;
INSERT INTO `wk_hrm_employee_contract` VALUES (1,1,'A00HGJI0JPO128',1,'2024-10-12 00:00:00','2024-10-12 00:00:00',1,1,NULL,'2024-10-12 00:00:00',NULL,NULL,NULL,'2024-10-12 16:48:20',14773,'2db041f6749330820898e01d2c7ce85b');
/*!40000 ALTER TABLE `wk_hrm_employee_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_data`
--

DROP TABLE IF EXISTS `wk_hrm_employee_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `label_group` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL COMMENT '字段名称',
  `field_value` longtext COMMENT '字段值',
  `field_value_desc` longtext COMMENT '字段值描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `employee_id` int(11) NOT NULL COMMENT 'employee_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户扩展字段数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_data`
--

LOCK TABLES `wk_hrm_employee_data` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_data` DISABLE KEYS */;
INSERT INTO `wk_hrm_employee_data` VALUES (1,1128,2,'手机号码','14767815683','14767815683','2024-10-12 14:41:46',1),(2,1130,2,'QQ','','','2024-10-12 14:41:46',1),(3,1131,2,'微信','','','2024-10-12 14:41:46',1),(4,1132,2,'现居住地','','','2024-10-12 14:41:46',1),(5,1133,2,'紧急联系人','','','2024-10-12 14:41:46',1),(6,1134,2,'紧急联系人电话','','','2024-10-12 14:41:46',1),(7,1128,2,'手机号码','14565826595','14565826595','2024-10-12 14:48:43',2),(8,1130,2,'QQ','','','2024-10-12 14:48:43',2),(9,1131,2,'微信','','','2024-10-12 14:48:43',2),(10,1132,2,'现居住地','','','2024-10-12 14:48:43',2),(11,1133,2,'紧急联系人','','','2024-10-12 14:48:43',2),(12,1134,2,'紧急联系人电话','','','2024-10-12 14:48:43',2),(13,1128,2,'手机号码','15685658655','15685658655','2024-10-12 14:55:04',3),(14,1130,2,'QQ','','','2024-10-12 14:55:04',3),(15,1131,2,'微信','','','2024-10-12 14:55:04',3),(16,1132,2,'现居住地','','','2024-10-12 14:55:04',3),(17,1133,2,'紧急联系人','','','2024-10-12 14:55:04',3),(18,1134,2,'紧急联系人电话','','','2024-10-12 14:55:04',3),(19,1128,2,'手机号码','14568563586','14568563586','2024-10-12 14:59:47',4),(20,1130,2,'QQ','','','2024-10-12 14:59:47',4),(21,1131,2,'微信','','','2024-10-12 14:59:47',4),(22,1132,2,'现居住地','','','2024-10-12 14:59:47',4),(23,1133,2,'紧急联系人','','','2024-10-12 14:59:47',4),(24,1134,2,'紧急联系人电话','','','2024-10-12 14:59:47',4),(25,1128,2,'手机号码','145685236854','145685236854','2024-10-12 15:02:11',5),(26,1130,2,'QQ','','','2024-10-12 15:02:11',5),(27,1131,2,'微信','','','2024-10-12 15:02:11',5),(28,1132,2,'现居住地','','','2024-10-12 15:02:11',5),(29,1133,2,'紧急联系人','','','2024-10-12 15:02:11',5),(30,1134,2,'紧急联系人电话','','','2024-10-12 15:02:11',5),(31,1104,1,'英文名','','','2024-10-12 15:02:47',2),(32,1113,1,'是否已婚','','','2024-10-12 15:02:47',2),(33,1114,1,'是否已育','','','2024-10-12 15:02:47',2),(34,1117,1,'政治面貌','','','2024-10-12 15:02:47',2),(35,1120,1,'健康状态','','','2024-10-12 15:02:47',2),(36,1128,2,'手机号码','145685658','145685658','2024-10-12 15:13:09',6),(37,1130,2,'QQ','','','2024-10-12 15:13:09',6),(38,1131,2,'微信','','','2024-10-12 15:13:09',6),(39,1132,2,'现居住地','','','2024-10-12 15:13:09',6),(40,1133,2,'紧急联系人','','','2024-10-12 15:13:09',6),(41,1134,2,'紧急联系人电话','','','2024-10-12 15:13:09',6),(42,1128,2,'手机号码','14568536513','14568536513','2024-10-12 15:16:20',7),(43,1130,2,'QQ','','','2024-10-12 15:16:20',7),(44,1131,2,'微信','','','2024-10-12 15:16:20',7),(45,1132,2,'现居住地','','','2024-10-12 15:16:20',7),(46,1133,2,'紧急联系人','','','2024-10-12 15:16:20',7),(47,1134,2,'紧急联系人电话','','','2024-10-12 15:16:20',7),(48,1128,2,'手机号码','456856852368','456856852368','2024-10-12 15:20:39',8),(49,1130,2,'QQ','','','2024-10-12 15:20:39',8),(50,1131,2,'微信','','','2024-10-12 15:20:39',8),(51,1132,2,'现居住地','','','2024-10-12 15:20:39',8),(52,1133,2,'紧急联系人','','','2024-10-12 15:20:39',8),(53,1134,2,'紧急联系人电话','','','2024-10-12 15:20:39',8),(59,1104,1,'英文名','liujiaming','liujiaming','2024-10-14 08:31:56',1),(60,1113,1,'是否已婚','是','是','2024-10-14 08:31:56',1),(61,1114,1,'是否已育','否','否','2024-10-14 08:31:56',1),(62,1117,1,'政治面貌','共青团员','共青团员','2024-10-14 08:31:56',1),(63,1120,1,'健康状态','健康','健康','2024-10-14 08:31:56',1),(64,1128,1,'手机号码','15698741563','15698741563','2024-10-14 09:20:29',9),(65,1130,1,'QQ','','','2024-10-14 09:20:29',9),(66,1131,1,'微信','','','2024-10-14 09:20:29',9),(67,1132,1,'现居住地','','','2024-10-14 09:20:29',9),(68,1133,1,'紧急联系人','','','2024-10-14 09:20:29',9),(69,1134,1,'紧急联系人电话','','','2024-10-14 09:20:29',9);
/*!40000 ALTER TABLE `wk_hrm_employee_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_education_experience`
--

DROP TABLE IF EXISTS `wk_hrm_employee_education_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_education_experience` (
  `education_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL COMMENT '教育经历id',
  `education` int(11) DEFAULT NULL COMMENT '学历 1小学、2初中、3中专、4中职、5中技、6高中、7大专、8本科、9硕士、10博士、11博士后、12其他',
  `graduate_school` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '毕业院校',
  `major` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '专业',
  `admission_time` datetime DEFAULT NULL COMMENT '入学时间',
  `graduation_time` datetime DEFAULT NULL COMMENT '毕业时间',
  `teaching_methods` int(11) DEFAULT NULL COMMENT '教学方式 1 全日制、2成人教育、3远程教育、4自学考试、5其他',
  `is_first_degree` int(11) DEFAULT NULL COMMENT '是否第一学历 0 否 1 是',
  `create_time` datetime DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`education_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='员工教育经历';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_education_experience`
--

LOCK TABLES `wk_hrm_employee_education_experience` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_education_experience` DISABLE KEYS */;
INSERT INTO `wk_hrm_employee_education_experience` VALUES (1,1,8,'佛山大学','物联网工程','2022-09-04 00:00:00','2026-07-01 00:00:00',1,1,'2024-10-12 16:35:03',NULL);
/*!40000 ALTER TABLE `wk_hrm_employee_education_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_field`
--

DROP TABLE IF EXISTS `wk_hrm_employee_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_field` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `field_name` varchar(255) DEFAULT NULL COMMENT '自定义字段英文标识',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '字段名称',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '字段类型 1 单行文本 2 多行文本 3 单选 4日期 5 数字 6 小数 7 手机  8 文件 9 多选   10 日期时间 11 邮箱 12 籍贯地区',
  `component_type` int(11) NOT NULL DEFAULT '1' COMMENT '关联表类型 0 不需要关联 1 hrm员工 2 hrm部门 3 hrm职位 4 系统用户 5 系统部门 6 招聘渠道',
  `label` int(11) DEFAULT NULL COMMENT '标签 1 个人信息 2 岗位信息 3 合同 4 工资社保',
  `label_group` int(11) NOT NULL COMMENT '标签分组 * 1 员工个人信息 2 通讯信息 3 教育经历 4 工作经历 5 证书/证件 6 培训经历 7 联系人\n        * 11 岗位信息 12 离职信息 \n        * 21 合同信息 \n        * 31 工资卡信息 32 社保信息',
  `remark` varchar(60) DEFAULT NULL COMMENT '字段说明',
  `input_tips` varchar(255) DEFAULT NULL COMMENT '输入提示',
  `max_length` int(11) DEFAULT NULL COMMENT '最大长度',
  `default_value` varchar(5000) DEFAULT '' COMMENT '默认值',
  `is_unique` int(11) DEFAULT '0' COMMENT '是否唯一 1 是 0 否',
  `is_null` int(11) DEFAULT '0' COMMENT '是否必填 1 是 0 否',
  `sorting` int(11) DEFAULT '1' COMMENT '排序 从小到大',
  `options` longtext COMMENT '如果类型是选项，此处不能为空，使用kv格式',
  `is_fixed` int(11) NOT NULL DEFAULT '0' COMMENT '是否固定字段 0 否 1 是',
  `operating` int(11) DEFAULT '255' COMMENT '操作权限',
  `is_hidden` int(11) NOT NULL DEFAULT '0' COMMENT '是否隐藏  0不隐藏 1隐藏',
  `is_update_value` int(11) DEFAULT '1' COMMENT '是否可以修改值 0 否 1 是',
  `is_head_field` int(11) DEFAULT '0' COMMENT '是否在列表头展示 0 否 1 是',
  `is_import_field` int(11) DEFAULT '0' COMMENT '是否需要导入字段 0 否 1 是',
  `is_employee_visible` int(11) NOT NULL DEFAULT '1' COMMENT '是否员工可见 0 否 1 是',
  `is_employee_update` int(11) NOT NULL DEFAULT '0' COMMENT '是否员工可修改 0 否 1 是 2 禁用否',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `style_percent` int(11) DEFAULT '50' COMMENT '样式百分比%',
  `precisions` int(11) DEFAULT NULL COMMENT '精度，允许的最大小数位',
  `form_position` varchar(10) DEFAULT NULL COMMENT '表单定位 坐标格式： 1,1',
  `max_num_restrict` varchar(20) DEFAULT NULL COMMENT '限制的最大数值',
  `min_num_restrict` varchar(20) DEFAULT NULL COMMENT '限制的最小数值',
  `form_assist_id` int(11) DEFAULT NULL COMMENT '表单辅助id，前端生成',
  PRIMARY KEY (`field_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1161 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自定义字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_field`
--

LOCK TABLES `wk_hrm_employee_field` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_field` DISABLE KEYS */;
INSERT INTO `wk_hrm_employee_field` VALUES (1103,'employee_name','姓名',1,0,1,1,'','',50,'',0,1,1,'',1,48,0,1,1,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1104,'flied_hukzra','英文名',1,1,1,1,'','',50,'',0,0,2,'',0,255,0,1,0,1,1,0,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1105,'mobile','手机',7,0,1,1,'','11位手机号',11,'',1,1,3,'',1,48,0,1,1,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1106,'id_type','证件类型',3,0,1,1,'','',1,'',0,0,4,'[{\"name\":\"身份证\",\"value\":1},{\"name\":\"港澳通行证\",\"value\":2},{\"name\":\"台湾通行证\",\"value\":3},{\"name\":\"护照\",\"value\":4},{\"name\":\"其他\",\"value\":5}]',1,48,0,1,1,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1107,'id_number','证件号码',1,0,1,1,'','',255,'',0,0,5,'',1,48,0,1,1,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1108,'sex','性别',3,0,1,1,'','',1,'',0,0,6,'[{\"name\":\"男\",\"value\":1},{\"name\":\"女\",\"value\":2}]',1,48,0,1,1,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1109,'date_of_birth','出生日期',4,0,1,1,'','',1,'',0,0,7,'',1,48,0,0,1,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1110,'birthday_type','生日类型',3,0,1,1,'','',50,'',0,0,8,'[{\"name\":\"阳历\",\"value\":1},{\"name\":\"农历\",\"value\":2}]',1,48,0,1,0,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1111,'birthday','生日',1,0,1,1,'','示例 : 0323',50,'',0,0,9,'',1,62,0,1,1,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1112,'age','年龄',5,0,1,1,'','',50,'',0,0,10,'',1,48,0,0,1,0,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1113,'flied_bbnpqh','是否已婚',3,0,1,1,'','',50,'',0,0,11,'[{\"name\":\"是\",\"value\":\"是\"},{\"name\":\"否\",\"value\":\"否\"}]',0,191,0,1,1,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1114,'flied_dxnkqj','是否已育',3,0,1,1,'','',50,'',0,0,12,'[{\"name\":\"是\",\"value\":\"是\"},{\"name\":\"否\",\"value\":\"否\"}]',0,191,0,1,1,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1115,'country','国家地区',3,0,1,1,'','',50,'',0,0,13,'[{\"name\":\"中国\",\"value\":\"中国\"},{\"name\":\"中国香港\",\"value\":\"中国香港\"},{\"name\":\"中国澳门\",\"value\":\"中国澳门\"},{\"name\":\"中国台湾\",\"value\":\"中国台湾\"}]',1,62,0,1,1,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1116,'nation','民族',3,0,1,1,'','',50,'',0,0,14,'[{\"name\":\"汉族\",\"value\":\"汉族\"},{\"name\":\"满族\",\"value\":\"满族\"},{\"name\":\"蒙古族\",\"value\":\"蒙古族\"},{\"name\":\"回族\",\"value\":\"回族\"},{\"name\":\"藏族\",\"value\":\"藏族\"},{\"name\":\"维吾尔族\",\"value\":\"维吾尔族\"},{\"name\":\"苗族\",\"value\":\"苗族\"},{\"name\":\"彝族\",\"value\":\"彝族\"},{\"name\":\"壮族\",\"value\":\"壮族\"},{\"name\":\"布依族\",\"value\":\"布依族\"},{\"name\":\"侗族\",\"value\":\"侗族\"},{\"name\":\"瑶族\",\"value\":\"瑶族\"},{\"name\":\"白族\",\"value\":\"白族\"},{\"name\":\"土家族\",\"value\":\"土家族\"},{\"name\":\"哈尼族\",\"value\":\"哈尼族\"},{\"name\":\"哈萨克族\",\"value\":\"哈萨克族\"},{\"name\":\"傣族\",\"value\":\"傣族\"},{\"name\":\"黎族\",\"value\":\"黎族\"},{\"name\":\"傈僳族\",\"value\":\"傈僳族\"},{\"name\":\"佤族\",\"value\":\"佤族\"},{\"name\":\"畲族\",\"value\":\"畲族\"},{\"name\":\"高山族\",\"value\":\"高山族\"},{\"name\":\"拉祜族\",\"value\":\"拉祜族\"},{\"name\":\"水族\",\"value\":\"水族\"},{\"name\":\"东乡族\",\"value\":\"东乡族\"},{\"name\":\"纳西族\",\"value\":\"纳西族\"},{\"name\":\"景颇族\",\"value\":\"景颇族\"},{\"name\":\"柯尔克孜族\",\"value\":\"柯尔克孜族\"},{\"name\":\"土族\",\"value\":\"土族\"},{\"name\":\"达斡尔族\",\"value\":\"达斡尔族\"},{\"name\":\"仫佬族\",\"value\":\"仫佬族\"},{\"name\":\"羌族\",\"value\":\"羌族\"},{\"name\":\"布朗族\",\"value\":\"布朗族\"},{\"name\":\"撒拉族\",\"value\":\"撒拉族\"},{\"name\":\"毛南族\",\"value\":\"毛南族\"},{\"name\":\"仡佬族\",\"value\":\"仡佬族\"},{\"name\":\"锡伯族\",\"value\":\"锡伯族\"},{\"name\":\"阿昌族\",\"value\":\"阿昌族\"},{\"name\":\"普米族\",\"value\":\"普米族\"},{\"name\":\"朝鲜族\",\"value\":\"朝鲜族\"},{\"name\":\"塔吉克族\",\"value\":\"塔吉克族\"},{\"name\":\"怒族\",\"value\":\"怒族\"},{\"name\":\"乌孜别克族\",\"value\":\"乌孜别克族\"},{\"name\":\"俄罗斯族\",\"value\":\"俄罗斯族\"},{\"name\":\"鄂温克族\",\"value\":\"鄂温克族\"},{\"name\":\"德昂族\",\"value\":\"德昂族\"},{\"name\":\"保安族\",\"value\":\"保安族\"},{\"name\":\"裕固族\",\"value\":\"裕固族\"},{\"name\":\"京族\",\"value\":\"京族\"},{\"name\":\"塔塔尔族\",\"value\":\"塔塔尔族\"},{\"name\":\"独龙族\",\"value\":\"独龙族\"},{\"name\":\"鄂伦春族\",\"value\":\"鄂伦春族\"},{\"name\":\"赫哲族\",\"value\":\"赫哲族\"},{\"name\":\"门巴族\",\"value\":\"门巴族\"},{\"name\":\"珞巴族\",\"value\":\"珞巴族\"},{\"name\":\"基诺族\",\"value\":\"基诺族\"}]',1,62,0,1,1,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1117,'flied_luxpii','政治面貌',1,0,1,1,'','',50,'',0,0,15,'',0,62,0,1,1,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1118,'native_place','籍贯',54,7,1,1,'','',50,'',0,0,16,'',1,62,0,1,1,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1119,'address','户籍所在地',1,0,1,1,'','',255,'',0,0,17,'',1,190,0,1,1,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1120,'flied_mosheh','健康状态',1,0,1,1,'','',255,'',0,0,18,'',0,254,0,1,1,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1121,'highest_education','最高学历',3,0,1,1,'','',50,'',0,0,19,'[{\"name\":\"小学\",\"value\":1},{\"name\":\"初中\",\"value\":2},{\"name\":\"中专\",\"value\":3},{\"name\":\"中职\",\"value\":4},{\"name\":\"中技\",\"value\":5},{\"name\":\"高中\",\"value\":6},{\"name\":\"大专\",\"value\":7},{\"name\":\"本科\",\"value\":8},{\"name\":\"硕士\",\"value\":9},{\"name\":\"博士\",\"value\":10},{\"name\":\"博士后\",\"value\":11},{\"name\":\"其他\",\"value\":12}]',1,62,0,1,1,1,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1122,'contacts_name','联系人姓名',1,0,1,7,'','',255,'',0,1,1,'',1,62,0,1,0,0,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1123,'relation','关系',1,0,1,7,'','',255,'',0,0,1,'',1,62,0,1,0,0,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1124,'contacts_phone','联系人电话',7,0,1,7,'','',255,'',0,0,1,'',1,62,0,1,0,0,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1125,'contacts_work_unit','联系人工作单位',1,0,1,7,'','',255,'',0,0,1,'',1,62,0,1,0,0,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1126,'contacts_post','联系人职务',1,0,1,7,'','',255,'',0,0,1,'',1,62,0,1,0,0,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1127,'contacts_address','联系人地址',1,0,1,7,'','',255,'',0,0,1,'',1,62,0,1,0,0,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1128,'flied_kwbova','手机号码',7,0,1,2,'','',255,'',0,0,1,'',0,255,0,1,0,0,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1129,'email','个人邮箱',14,0,1,2,'','',255,'',0,0,2,'',1,48,0,1,0,0,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1130,'flied_dbwahc','QQ',1,0,1,2,'','',255,'',0,0,3,'',0,255,0,1,0,0,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1131,'flied_utxiir','微信',1,0,1,2,'','',255,'',0,0,4,'',0,255,0,1,0,0,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1132,'flied_mhktwv','现居住地',1,0,1,2,'','',255,'',0,0,5,'',0,255,0,1,0,0,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1133,'flied_qppedz','紧急联系人',1,0,1,2,'','',255,'',0,0,6,'',0,255,0,1,0,0,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1134,'flied_dumavf','紧急联系人电话',7,0,1,2,'','',255,'',0,0,7,'',0,255,0,1,0,0,1,1,'2024-10-12 00:08:00',50,NULL,NULL,NULL,NULL,NULL),(1135,'job_number','工号',1,0,2,11,'','',50,'',1,1,4,'',1,48,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1136,'entry_time','入职日期',4,0,2,11,'','',50,'',0,1,1,'',1,48,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1137,'dept_id','部门',12,2,2,11,'','',50,'',0,0,5,'',1,48,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1138,'post','岗位',1,0,2,11,'','',50,'',0,0,7,'',1,48,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1139,'parent_id','直属上级',10,1,2,11,'','',50,'',0,0,6,'',1,48,0,1,1,0,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1140,'post_level','职级',1,0,2,11,'','',50,'',0,0,8,'',1,62,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1141,'work_city','工作城市',40,0,2,11,'','',255,'',0,0,11,'',1,48,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1142,'work_address','工作地点',1,0,2,11,'','',255,'',0,0,9,'',1,62,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1143,'work_detail_address','详细工作地点',1,0,2,11,'','',255,'',0,0,10,'',1,62,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1144,'employment_forms','聘用形式',3,0,2,11,'','',255,'',0,1,13,'[{\"name\":\"正式\",\"value\":1},{\"name\":\"非正式\",\"value\":2}]',1,48,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1145,'probation','试用期',3,0,2,11,'','',50,'',0,0,2,'[{\"name\":\"无试用期\",\"value\":0},{\"name\":\"1个月\",\"value\":1},{\"name\":\"2个月\",\"value\":2},{\"name\":\"3个月\",\"value\":3},{\"name\":\"4个月\",\"value\":4},{\"name\":\"5个月\",\"value\":5},{\"name\":\"6个月\",\"value\":6}]',1,48,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1146,'become_time','转正日期',4,0,2,11,'','',50,'',0,0,3,'',1,48,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1147,'company_age_start_time','司龄开始日期',4,0,2,11,'','',255,'',0,0,14,'',1,50,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1148,'company_age','司龄',5,0,2,11,'','',255,'',0,0,15,'',1,48,0,0,1,0,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1149,'channel_id','招聘渠道',55,6,2,11,'','',255,'',0,0,12,'',1,62,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1150,'status','员工状态',3,0,2,11,'','',255,'',0,0,13,'[{\"name\":\"正式\",\"value\":1},{\"name\":\"试用\",\"value\":2},{\"name\":\"实习\",\"value\":3},{\"name\":\"兼职\",\"value\":4},{\"name\":\"劳务\",\"value\":5},{\"name\":\"顾问\",\"value\":6},{\"name\":\"返聘\",\"value\":7},{\"name\":\"外包\",\"value\":8},{\"name\":\"待离职\",\"value\":9},{\"name\":\"已离职\",\"value\":10}]',1,48,0,1,1,0,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1151,'contract_type','合同类型',3,0,3,21,'','',255,'',0,0,1,'[{\"name\":\"固定期限劳动合同\",\"value\":1},{\"name\":\"无固定期限劳动合同\",\"value\":2},{\"name\":\"已完成一定工作任务为期限的劳动合同\",\"value\":3},{\"name\":\"实习协议\",\"value\":4},{\"name\":\"劳务合同\",\"value\":5},{\"name\":\"返聘协议\",\"value\":6},{\"name\":\"劳务派遣合同\",\"value\":7},{\"name\":\"借调合同\",\"value\":8},{\"name\":\"其他\",\"value\":9}]',1,48,0,1,1,0,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1152,'start_time','现合同开始日期',4,0,3,21,'','',255,'',0,0,2,'',1,48,0,1,1,0,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1153,'end_time','现合同结束日期',4,0,3,21,'','',255,'',0,0,3,'',1,48,0,1,1,0,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1154,'term','现合同期限',5,0,3,21,'','',255,'',0,0,4,'',1,48,0,1,1,0,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1155,'salary_card_num','工资卡卡号',1,0,4,31,'','',255,'',0,0,1,'',1,48,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1156,'account_opening_city','工资卡开户城市',1,0,4,31,'','',255,'',0,0,2,'',1,48,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1157,'bank_name','银行名称',1,0,4,31,'','',255,'',0,0,4,'',1,48,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1158,'opening_bank','工资卡开户行',1,0,4,31,'','',255,'',0,0,5,'',1,48,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1159,'social_security_num','个人社保账号',1,0,4,32,'','',255,'',0,0,1,'',1,48,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL),(1160,'accumulation_fund_num','个人公积金账号',1,0,4,32,'','',255,'',0,0,2,'',1,48,0,1,1,1,1,0,'2021-08-02 14:04:01',50,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `wk_hrm_employee_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_field_config`
--

DROP TABLE IF EXISTS `wk_hrm_employee_field_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_field_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字段id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '字段排序',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `is_hide` int(11) NOT NULL DEFAULT '1' COMMENT '是否隐藏 0、不隐藏 1、隐藏',
  `width` int(11) DEFAULT NULL COMMENT '字段宽度',
  `field_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `label` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='字段排序表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_field_config`
--

LOCK TABLES `wk_hrm_employee_field_config` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_field_config` DISABLE KEYS */;
INSERT INTO `wk_hrm_employee_field_config` VALUES (1,1,14773,0,100,1103,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(2,2,14773,0,100,1105,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(3,3,14773,0,100,1106,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(4,4,14773,0,100,1107,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(5,5,14773,0,100,1108,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(6,6,14773,0,100,1109,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(7,7,14773,0,100,1111,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(8,8,14773,0,100,1112,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(9,9,14773,0,100,1113,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(10,10,14773,0,100,1114,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(11,11,14773,0,100,1115,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(12,12,14773,0,100,1116,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(13,13,14773,0,100,1117,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(14,14,14773,0,100,1118,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(15,15,14773,0,100,1119,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(16,16,14773,0,100,1120,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(17,17,14773,0,100,1121,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(18,18,14773,0,100,1136,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(19,19,14773,0,100,1145,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(20,20,14773,0,100,1146,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(21,21,14773,0,100,1135,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(22,22,14773,0,100,1137,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(23,23,14773,0,100,1139,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(24,24,14773,0,100,1138,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(25,25,14773,0,100,1140,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(26,26,14773,0,100,1142,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(27,27,14773,0,100,1143,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(28,28,14773,0,100,1141,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(29,29,14773,0,100,1149,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(30,30,14773,0,100,1144,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(31,31,14773,0,100,1150,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(32,32,14773,0,100,1147,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(33,33,14773,0,100,1148,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(34,34,14773,0,100,1151,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(35,35,14773,0,100,1152,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(36,36,14773,0,100,1153,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(37,37,14773,0,100,1154,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(38,38,14773,0,100,1155,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(39,39,14773,0,100,1156,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(40,40,14773,0,100,1157,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(41,41,14773,0,100,1158,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(42,42,14773,0,100,1159,'2024-10-11 20:31:29','2024-10-11 12:31:29'),(43,43,14773,0,100,1160,'2024-10-11 20:31:29','2024-10-11 12:31:29');
/*!40000 ALTER TABLE `wk_hrm_employee_field_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_field_manage`
--

DROP TABLE IF EXISTS `wk_hrm_employee_field_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_field_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_status` int(11) NOT NULL DEFAULT '1' COMMENT '入职状态 1 在职 2 待入职 ',
  `field_id` int(11) DEFAULT NULL COMMENT '字段id',
  `field_name` varchar(255) DEFAULT NULL COMMENT '字段标识',
  `name` varchar(255) DEFAULT NULL COMMENT '字段名称',
  `is_manage_visible` int(11) NOT NULL DEFAULT '1' COMMENT '是否管理员可见 0 否 1 是  2 禁用否 3 禁用是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自定义字段管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_field_manage`
--

LOCK TABLES `wk_hrm_employee_field_manage` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_field_manage` DISABLE KEYS */;
INSERT INTO `wk_hrm_employee_field_manage` VALUES (113,1,1103,'employee_name','姓名',3),(114,1,1104,'flied_hukzra','英文名',0),(115,1,1105,'mobile','手机',3),(116,1,1106,'id_type','证件类型',1),(117,1,1107,'id_number','证件号码',1),(118,1,1108,'sex','性别',1),(119,1,1109,'date_of_birth','出生日期',0),(120,1,1110,'birthday_type','生日类型',0),(121,1,1111,'birthday','生日',0),(122,1,1112,'age','年龄',0),(123,1,1113,'flied_bbnpqh','是否已婚',0),(124,1,1114,'flied_dxnkqj','是否已育',0),(125,1,1115,'country','国家地区',0),(126,1,1116,'nation','民族',0),(127,1,1117,'flied_luxpii','政治面貌',0),(128,1,1118,'native_place','籍贯',0),(129,1,1119,'address','户籍所在地',0),(130,1,1120,'flied_mosheh','健康状态',0),(131,1,1121,'highest_education','最高学历',1),(132,1,1135,'job_number','工号',3),(133,1,1136,'entry_time','入职日期',3),(134,1,1137,'dept_id','部门',1),(135,1,1138,'post','岗位',1),(136,1,1139,'parent_id','直属上级',1),(137,1,1140,'post_level','职级',0),(138,1,1141,'work_city','工作城市',1),(139,1,1142,'work_address','工作地点',1),(140,1,1143,'work_detail_address','详细工作地点',0),(141,1,1144,'employment_forms','聘用形式',3),(142,1,1145,'probation','试用期',3),(143,1,1147,'company_age_start_time','司龄开始日期',0),(144,1,1149,'channel_id','招聘渠道',0),(145,1,1150,'status','员工状态',3),(176,2,1103,'employee_name','姓名',3),(177,2,1104,'flied_hukzra','英文名',0),(178,2,1105,'mobile','手机',3),(179,2,1106,'id_type','证件类型',1),(180,2,1107,'id_number','证件号码',1),(181,2,1108,'sex','性别',1),(182,2,1109,'date_of_birth','出生日期',0),(183,2,1110,'birthday_type','生日类型',0),(184,2,1111,'birthday','生日',0),(185,2,1112,'age','年龄',0),(186,2,1113,'flied_bbnpqh','是否已婚',0),(187,2,1114,'flied_dxnkqj','是否已育',0),(188,2,1115,'country','国家地区',0),(189,2,1116,'nation','民族',0),(190,2,1117,'flied_luxpii','政治面貌',0),(191,2,1118,'native_place','籍贯',0),(192,2,1119,'address','户籍所在地',0),(193,2,1120,'flied_mosheh','健康状态',0),(194,2,1121,'highest_education','最高学历',0),(195,2,1135,'job_number','工号',0),(196,2,1136,'entry_time','入职日期',3),(197,2,1137,'dept_id','部门',1),(198,2,1138,'post','岗位',1),(199,2,1139,'parent_id','直属上级',1),(200,2,1140,'post_level','职级',0),(201,2,1141,'work_city','工作城市',1),(202,2,1142,'work_address','工作地点',0),(203,2,1143,'work_detail_address','详细工作地点',0),(204,2,1144,'employment_forms','聘用形式',3),(205,2,1145,'probation','试用期',3),(206,2,1147,'company_age_start_time','司龄开始日期',0),(207,2,1149,'channel_id','招聘渠道',0),(208,2,1150,'status','员工状态',3);
/*!40000 ALTER TABLE `wk_hrm_employee_field_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_file`
--

DROP TABLE IF EXISTS `wk_hrm_employee_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_file` (
  `employee_file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工附件id',
  `employee_id` int(11) NOT NULL COMMENT '员工id',
  `file_id` bigint(20) NOT NULL COMMENT 'admin模块附件id',
  `type` int(11) DEFAULT NULL COMMENT '1 员工基本资料 2 员工档案资料 3 员工离职资料',
  `sub_type` int(11) NOT NULL COMMENT '11、身份证原件 12、学历证明 13、个人证件照 14、身份证复印件 15、工资银行卡 16、社保卡 17、公积金卡 18、获奖证书 19、其他 21、劳动合同 22、入职简历 23、入职登记表 24、入职体检单 25、离职证明 26、转正申请表 27、其他\n31、离职审批 32、离职证明 33 、其他\n',
  `create_user_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`employee_file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='员工附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_file`
--

LOCK TABLES `wk_hrm_employee_file` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_employee_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_quit_info`
--

DROP TABLE IF EXISTS `wk_hrm_employee_quit_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_quit_info` (
  `quit_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '离职信息id',
  `employee_id` int(11) DEFAULT NULL,
  `plan_quit_time` datetime DEFAULT NULL COMMENT '计划离职日期',
  `apply_quit_time` datetime DEFAULT NULL COMMENT '申请离职日期',
  `salary_settlement_time` datetime DEFAULT NULL COMMENT '薪资结算日期',
  `quit_type` int(11) DEFAULT NULL COMMENT '离职类型 1 主动离职 2 被动离职 3 退休',
  `quit_reason` int(11) DEFAULT NULL COMMENT '离职原因 1家庭原因 2身体原因 3薪资原因 4交通不便 5工作压力 6管理问题 7无晋升机会 8职业规划 9合同到期放弃续签 10其他个人原因  11试用期内辞退 12违反公司条例 13组织调整/裁员 14绩效不达标辞退 15合同到期不续签 16 其他原因被动离职',
  `remarks` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `old_status` int(11) DEFAULT NULL COMMENT '离职前状态',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`quit_info_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='离职信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_quit_info`
--

LOCK TABLES `wk_hrm_employee_quit_info` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_quit_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_employee_quit_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_salary_card`
--

DROP TABLE IF EXISTS `wk_hrm_employee_salary_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_salary_card` (
  `salary_card_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL COMMENT '工资卡id(不是卡号)',
  `salary_card_num` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '工资卡卡号',
  `account_opening_city` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '开户城市',
  `bank_name` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '银行名称',
  `opening_bank` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '工资卡开户行',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`salary_card_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='员工薪资卡信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_salary_card`
--

LOCK TABLES `wk_hrm_employee_salary_card` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_salary_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_employee_salary_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_social_security_info`
--

DROP TABLE IF EXISTS `wk_hrm_employee_social_security_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_social_security_info` (
  `social_security_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工公积金信息id',
  `employee_id` int(11) DEFAULT NULL,
  `is_first_social_security` int(11) DEFAULT NULL COMMENT '是否首次缴纳社保 0 否 1 是',
  `is_first_accumulation_fund` int(11) DEFAULT NULL COMMENT '是否首次缴纳公积金 0 否 1 是',
  `social_security_num` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '社保号',
  `accumulation_fund_num` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '公积金账号',
  `social_security_start_month` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '参保起始月份（2020.05）',
  `scheme_id` int(11) DEFAULT NULL COMMENT '参保方案',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`social_security_info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='员工公积金信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_social_security_info`
--

LOCK TABLES `wk_hrm_employee_social_security_info` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_social_security_info` DISABLE KEYS */;
INSERT INTO `wk_hrm_employee_social_security_info` VALUES (1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-12 16:48:24'),(2,5,NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-13 11:27:52');
/*!40000 ALTER TABLE `wk_hrm_employee_social_security_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_training_experience`
--

DROP TABLE IF EXISTS `wk_hrm_employee_training_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_training_experience` (
  `training_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '培训经历id',
  `employee_id` int(11) DEFAULT NULL COMMENT '（评定人/确定人/员工）id',
  `training_course` varchar(40) COLLATE utf8mb4_bin NOT NULL COMMENT '培训课程',
  `training_organ_name` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '培训机构名称',
  `start_time` datetime DEFAULT NULL COMMENT '培训开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '培训结束时间',
  `training_duration` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '培训时长',
  `training_results` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '培训成绩',
  `training_certificate_name` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '培训课程名称',
  `remarks` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`training_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='培训经历';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_training_experience`
--

LOCK TABLES `wk_hrm_employee_training_experience` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_training_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_employee_training_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_employee_work_experience`
--

DROP TABLE IF EXISTS `wk_hrm_employee_work_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_employee_work_experience` (
  `work_exp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工工作经历id',
  `employee_id` int(11) NOT NULL COMMENT '（评定人/确定人/员工）id',
  `work_unit` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '工作单位',
  `post` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '职务',
  `work_start_time` datetime DEFAULT NULL COMMENT '工作开始时间',
  `work_end_time` datetime DEFAULT NULL COMMENT '工作结束时间',
  `leaving_reason` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '离职原因',
  `witness` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '证明人',
  `witness_phone` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '证明人手机号',
  `work_remarks` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '工作备注',
  `create_time` datetime DEFAULT NULL,
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`work_exp_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='员工工作经历';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_employee_work_experience`
--

LOCK TABLES `wk_hrm_employee_work_experience` WRITE;
/*!40000 ALTER TABLE `wk_hrm_employee_work_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_employee_work_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_field_extend`
--

DROP TABLE IF EXISTS `wk_hrm_field_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_field_extend` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_field_id` int(11) NOT NULL COMMENT '对应主字段id',
  `field_name` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT '自定义字段英文标识',
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '字段名称',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '字段类型',
  `remark` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '字段说明',
  `input_tips` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '输入提示',
  `max_length` int(11) DEFAULT NULL COMMENT '最大长度',
  `default_value` varchar(5000) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '默认值',
  `is_unique` int(11) DEFAULT '0' COMMENT '是否唯一 1 是 0 否',
  `is_null` int(11) DEFAULT '0' COMMENT '是否必填 1 是 0 否',
  `sorting` int(11) DEFAULT '1' COMMENT '排序 从小到大',
  `options` longtext CHARACTER SET utf8mb4 COMMENT '如果类型是选项，此处不能为空，多个选项以，隔开',
  `operating` int(11) DEFAULT '255' COMMENT '是否允许编辑',
  `is_hidden` int(11) NOT NULL DEFAULT '0' COMMENT '是否隐藏  0不隐藏 1隐藏',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `field_type` int(11) NOT NULL DEFAULT '0' COMMENT '字段来源  0.自定义 1.原始固定 2原始字段但值存在扩展表中',
  `style_percent` int(11) DEFAULT '50' COMMENT '样式百分比%',
  `precisions` int(11) DEFAULT NULL COMMENT '精度，允许的最大小数位',
  `form_position` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '表单定位 坐标格式： 1,1',
  `max_num_restrict` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '限制的最大数值',
  `min_num_restrict` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '限制的最小数值',
  `form_assist_id` int(11) DEFAULT NULL COMMENT '表单辅助id，前端生成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='扩展自定义字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_field_extend`
--

LOCK TABLES `wk_hrm_field_extend` WRITE;
/*!40000 ALTER TABLE `wk_hrm_field_extend` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_field_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_insurance_month_emp_project_record`
--

DROP TABLE IF EXISTS `wk_hrm_insurance_month_emp_project_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_insurance_month_emp_project_record` (
  `emp_project_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参保项目记录id',
  `i_emp_record_id` int(11) NOT NULL COMMENT '参保员工记录id',
  `project_id` int(11) DEFAULT NULL COMMENT '后台配置项目id',
  `type` int(11) NOT NULL COMMENT '1 养老保险基数 2 医疗保险基数 3 失业保险基数 4 工伤保险基数 5 生育保险基数 6 补充大病医疗保险 7 补充养老保险 8 公积金',
  `project_name` varchar(40) DEFAULT NULL COMMENT '项目名称',
  `default_amount` decimal(10,2) DEFAULT NULL COMMENT '默认基数',
  `corporate_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '公司比例',
  `personal_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '个人比例',
  `corporate_amount` decimal(10,2) NOT NULL COMMENT '公司缴纳金额',
  `personal_amount` decimal(10,2) NOT NULL COMMENT '个人缴纳金额',
  PRIMARY KEY (`emp_project_record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='员工每月参保项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_insurance_month_emp_project_record`
--

LOCK TABLES `wk_hrm_insurance_month_emp_project_record` WRITE;
/*!40000 ALTER TABLE `wk_hrm_insurance_month_emp_project_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_insurance_month_emp_project_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_insurance_month_emp_record`
--

DROP TABLE IF EXISTS `wk_hrm_insurance_month_emp_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_insurance_month_emp_record` (
  `i_emp_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工每月社保记录id',
  `i_record_id` int(11) DEFAULT NULL COMMENT '每月生成社保id',
  `employee_id` int(11) DEFAULT NULL COMMENT '员工id',
  `scheme_id` int(11) DEFAULT NULL COMMENT '社保方案id',
  `year` int(11) DEFAULT NULL COMMENT '年',
  `month` int(11) DEFAULT NULL COMMENT '月',
  `personal_insurance_amount` decimal(10,2) DEFAULT NULL COMMENT '个人社保金额',
  `personal_provident_fund_amount` decimal(10,2) DEFAULT NULL COMMENT '个人公积金金额',
  `corporate_insurance_amount` decimal(10,2) DEFAULT NULL COMMENT '公司社保金额',
  `corporate_provident_fund_amount` decimal(10,2) DEFAULT NULL COMMENT '公司社保金额',
  `create_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '每月社保状态 0 停保 1 正常',
  PRIMARY KEY (`i_emp_record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='员工每月社保记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_insurance_month_emp_record`
--

LOCK TABLES `wk_hrm_insurance_month_emp_record` WRITE;
/*!40000 ALTER TABLE `wk_hrm_insurance_month_emp_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_insurance_month_emp_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_insurance_month_record`
--

DROP TABLE IF EXISTS `wk_hrm_insurance_month_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_insurance_month_record` (
  `i_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '每月社保记录id',
  `title` varchar(40) DEFAULT NULL COMMENT '报表名称',
  `year` int(11) DEFAULT NULL COMMENT '年份',
  `month` int(11) DEFAULT NULL COMMENT '月份',
  `num` int(11) DEFAULT NULL COMMENT '参保人数',
  `status` int(11) DEFAULT '0' COMMENT '每月社保状态 0 未归档 1 已归档',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`i_record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='每月社保记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_insurance_month_record`
--

LOCK TABLES `wk_hrm_insurance_month_record` WRITE;
/*!40000 ALTER TABLE `wk_hrm_insurance_month_record` DISABLE KEYS */;
INSERT INTO `wk_hrm_insurance_month_record` VALUES (1,'10月社保报表',2024,10,0,0,'2024-10-14 10:25:40');
/*!40000 ALTER TABLE `wk_hrm_insurance_month_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_insurance_project`
--

DROP TABLE IF EXISTS `wk_hrm_insurance_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_insurance_project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参保项目id',
  `scheme_id` int(11) NOT NULL COMMENT '参保方案id',
  `type` int(11) NOT NULL COMMENT '1 养老保险基数 2 医疗保险基数 3 失业保险基数 4 工伤保险基数 5 生育保险基数 6 补充大病医疗保险 7 补充养老保险 8 残保险 9 社保自定义 10 公积金 11 公积金自定义',
  `project_name` varchar(40) DEFAULT NULL COMMENT '项目名称',
  `default_amount` decimal(10,2) DEFAULT NULL COMMENT '默认基数',
  `corporate_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '公司比例',
  `personal_proportion` decimal(5,2) DEFAULT '0.00' COMMENT '个人比例',
  `corporate_amount` decimal(10,2) NOT NULL COMMENT '公司缴纳金额',
  `personal_amount` decimal(10,2) NOT NULL COMMENT '个人缴纳金额',
  `is_del` int(11) NOT NULL DEFAULT '1' COMMENT '1 删除 0 使用',
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='参保项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_insurance_project`
--

LOCK TABLES `wk_hrm_insurance_project` WRITE;
/*!40000 ALTER TABLE `wk_hrm_insurance_project` DISABLE KEYS */;
INSERT INTO `wk_hrm_insurance_project` VALUES (13,3,1,'',2464.00,16.00,8.00,394.24,197.12,1),(14,3,2,'',2464.00,8.00,2.00,197.12,49.28,1),(15,3,3,'',2464.00,0.20,0.00,4.93,0.00,1),(16,3,4,'',2464.00,0.70,0.30,17.25,7.39,1),(17,3,5,'',2464.00,1.00,0.00,24.64,0.00,1),(18,3,10,'',3057.00,10.00,10.00,306.00,306.00,1),(19,1,1,'',0.00,0.00,0.00,0.00,0.00,1),(20,1,2,'',0.00,0.00,0.00,0.00,0.00,1),(21,1,3,'',0.00,0.00,0.00,0.00,0.00,1),(22,1,4,'',0.00,0.00,0.00,0.00,0.00,1),(23,1,5,'',0.00,0.00,0.00,0.00,0.00,1),(24,1,10,'',0.00,0.00,0.00,0.00,0.00,1);
/*!40000 ALTER TABLE `wk_hrm_insurance_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_insurance_scheme`
--

DROP TABLE IF EXISTS `wk_hrm_insurance_scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_insurance_scheme` (
  `scheme_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '社保方案id',
  `scheme_name` varchar(40) NOT NULL COMMENT '方案名称',
  `city` varchar(40) NOT NULL COMMENT '参保城市',
  `house_type` varchar(50) DEFAULT NULL COMMENT '户籍类型',
  `scheme_type` int(11) NOT NULL COMMENT '参保类型 1 比例 2 金额',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '1 删除 0 使用',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`scheme_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='社保方案表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_insurance_scheme`
--

LOCK TABLES `wk_hrm_insurance_scheme` WRITE;
/*!40000 ALTER TABLE `wk_hrm_insurance_scheme` DISABLE KEYS */;
INSERT INTO `wk_hrm_insurance_scheme` VALUES (1,'001','广东省,湛江市,遂溪县','',1,0,14773,'2024-10-12 14:28:04');
/*!40000 ALTER TABLE `wk_hrm_insurance_scheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_notes`
--

DROP TABLE IF EXISTS `wk_hrm_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_notes` (
  `notes_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '备忘录id',
  `content` varchar(1024) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `reminder_time` datetime NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`notes_id`) USING BTREE,
  KEY `wk_hrm_notes_employee_id_index` (`employee_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='备忘录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_notes`
--

LOCK TABLES `wk_hrm_notes` WRITE;
/*!40000 ALTER TABLE `wk_hrm_notes` DISABLE KEYS */;
INSERT INTO `wk_hrm_notes` VALUES (1,'过生日',1,'2024-11-11 00:00:00','2024-10-14 08:11:43',14773),(2,'吃饭',1,'2024-10-14 00:00:00','2024-10-14 08:12:05',14773);
/*!40000 ALTER TABLE `wk_hrm_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_recruit_candidate`
--

DROP TABLE IF EXISTS `wk_hrm_recruit_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_recruit_candidate` (
  `candidate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '候选人id',
  `candidate_name` varchar(255) NOT NULL COMMENT '候选人名称',
  `mobile` varchar(255) NOT NULL COMMENT '手机',
  `sex` int(11) NOT NULL COMMENT '性别 1男 2女',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `post_id` int(11) NOT NULL COMMENT '职位id',
  `stage_num` int(11) NOT NULL DEFAULT '0' COMMENT '面试轮次 ',
  `work_time` int(11) DEFAULT NULL COMMENT '工作年限',
  `education` int(11) NOT NULL COMMENT '学历 1小学 2初中 3高中 4大专 5本科 6硕士 7博士',
  `graduate_school` varchar(255) DEFAULT NULL COMMENT '毕业院校',
  `latest_work_place` varchar(255) DEFAULT NULL COMMENT '最近工作单位',
  `channel_id` int(11) DEFAULT NULL COMMENT '招聘渠道',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(11) DEFAULT '1' COMMENT '候选人状态 1 新候选人 2初选通过 3安排面试 4面试通过 5已发offer 6待入职 7已淘汰 8已入职',
  `eliminate` varchar(255) DEFAULT NULL COMMENT '淘汰原因',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `status_update_time` datetime DEFAULT NULL COMMENT '状态更新时间',
  `entry_time` datetime DEFAULT NULL COMMENT '入职时间',
  `batch_id` varchar(255) NOT NULL COMMENT '批次id',
  PRIMARY KEY (`candidate_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='招聘候选人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_recruit_candidate`
--

LOCK TABLES `wk_hrm_recruit_candidate` WRITE;
/*!40000 ALTER TABLE `wk_hrm_recruit_candidate` DISABLE KEYS */;
INSERT INTO `wk_hrm_recruit_candidate` VALUES (1,'柳岩','14568568565',1,22,'3257715328@qq.com',3,0,2,5,'佛山大学','飞书',NULL,NULL,1,NULL,'2024-10-12 15:40:32',14773,'2024-10-12 15:40:32',NULL,'ef9811f379304216b4f445c3ada30591'),(2,'李明','14767815683',1,NULL,'12345678@QQ.com',1,0,3,6,'中山大学','腾讯集团',279,NULL,1,NULL,'2024-10-13 15:53:15',14773,'2024-10-13 15:53:15',NULL,'488c94edc5034dd69ef08ea600f0c857');
/*!40000 ALTER TABLE `wk_hrm_recruit_candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_recruit_channel`
--

DROP TABLE IF EXISTS `wk_hrm_recruit_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_recruit_channel` (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '招聘渠道id',
  `is_sys` int(11) DEFAULT '0' COMMENT '是否系统默认0 否 1 是',
  `status` int(11) DEFAULT '1' COMMENT '状态 0 禁用 1 启用',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='招聘渠道表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_recruit_channel`
--

LOCK TABLES `wk_hrm_recruit_channel` WRITE;
/*!40000 ALTER TABLE `wk_hrm_recruit_channel` DISABLE KEYS */;
INSERT INTO `wk_hrm_recruit_channel` VALUES (267,1,1,'前程无忧'),(268,1,1,'智联招聘'),(269,1,1,'拉勾网'),(270,1,1,'猎聘网'),(271,1,1,'中国人才热线'),(272,1,1,'58同城'),(273,1,1,'赶集网'),(274,1,1,'BOSS直聘'),(275,1,1,'大街网'),(276,1,1,'中华英才网'),(277,1,1,'内部举荐'),(278,1,1,'员工推荐'),(279,1,1,'微信招聘'),(280,1,1,'其他');
/*!40000 ALTER TABLE `wk_hrm_recruit_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_recruit_interview`
--

DROP TABLE IF EXISTS `wk_hrm_recruit_interview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_recruit_interview` (
  `interview_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '面试id',
  `candidate_id` int(11) NOT NULL COMMENT '候选人id',
  `type` int(11) DEFAULT NULL COMMENT '面试方式 1现场面试 2电话面试 3视频面试',
  `stage_num` int(11) NOT NULL DEFAULT '1' COMMENT '面试轮次',
  `interview_employee_id` int(11) DEFAULT NULL COMMENT '面试官id',
  `other_interview_employee_ids` varchar(255) DEFAULT NULL COMMENT '其他面试官',
  `interview_time` datetime NOT NULL COMMENT '面试时间',
  `address` varchar(255) DEFAULT NULL COMMENT '面试地址',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `result` int(11) DEFAULT '1' COMMENT '面试情况 1面试未完成 2面试通过 3面试未通过 4 面试取消',
  `evaluate` varchar(255) DEFAULT NULL COMMENT '评价',
  `cancel_reason` varchar(255) DEFAULT NULL COMMENT '取消原因',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`interview_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='面试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_recruit_interview`
--

LOCK TABLES `wk_hrm_recruit_interview` WRITE;
/*!40000 ALTER TABLE `wk_hrm_recruit_interview` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_recruit_interview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_recruit_post`
--

DROP TABLE IF EXISTS `wk_hrm_recruit_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_recruit_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职位id',
  `post_name` varchar(255) NOT NULL COMMENT '职位名称',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门id',
  `job_nature` int(11) DEFAULT NULL COMMENT '工作性质 1 全职 2实习 3兼职',
  `city` varchar(255) DEFAULT NULL COMMENT '工作城市',
  `recruit_num` int(11) DEFAULT '0' COMMENT '招聘人数',
  `reason` varchar(255) DEFAULT NULL COMMENT '招聘原因',
  `work_time` int(11) DEFAULT NULL COMMENT '工作经验 1不限 2一年以内 3一至三年 4三至五年 5五至十年 6十年以上',
  `education_require` int(11) DEFAULT NULL COMMENT '学历要求 1不限 2高中及以上 3大专及以上 4本科及以上 5硕士及以上 6博士',
  `min_salary` decimal(10,2) DEFAULT NULL COMMENT '开始薪资 -1 面议',
  `max_salary` decimal(10,2) DEFAULT NULL COMMENT '结束薪资 -1 面议',
  `salary_unit` int(11) DEFAULT NULL COMMENT '薪资单位 1 元/年 2 元/月',
  `min_age` int(11) DEFAULT NULL COMMENT '最小年龄 -1 不限',
  `max_age` int(11) DEFAULT NULL COMMENT '最大年龄 -1 不限',
  `latest_entry_time` datetime DEFAULT NULL COMMENT '最迟到岗时间',
  `owner_employee_id` int(11) DEFAULT NULL COMMENT '负责人id',
  `interview_employee_ids` varchar(255) DEFAULT NULL COMMENT '面试官',
  `description` longtext COMMENT '职位描述',
  `emergency_level` int(11) DEFAULT NULL COMMENT '紧急程度 1紧急 2 一般',
  `post_type_id` int(11) DEFAULT NULL COMMENT '职位类型',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `batch_id` varchar(255) DEFAULT NULL COMMENT '批次id',
  `status` int(11) DEFAULT '1' COMMENT '0 停止  1 启用',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='招聘职位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_recruit_post`
--

LOCK TABLES `wk_hrm_recruit_post` WRITE;
/*!40000 ALTER TABLE `wk_hrm_recruit_post` DISABLE KEYS */;
INSERT INTO `wk_hrm_recruit_post` VALUES (1,'java工程师',19,1,'广东省,湛江市,遂溪县',10,'新业务需求',1,4,7000.00,11000.00,1,19,35,'2024-10-31 00:00:00',1,'1',NULL,2,15,'2024-10-12 15:18:18',14773,NULL,1),(2,'运维工程师',20,1,'广东省,佛山市,南海区',10,'新的业务需求',3,4,6000.00,9000.00,1,19,30,'2024-10-31 00:00:00',4,'4,8','负责新系统的运维工作',2,59,'2024-10-12 15:35:33',14773,NULL,1),(3,'测试工程师',21,1,'广东省,佛山市,南海区',5,'新业务需求',3,4,5000.00,10000.00,1,19,30,NULL,8,'7,8','负责系统测试工作',1,49,'2024-10-12 15:38:53',14773,NULL,1);
/*!40000 ALTER TABLE `wk_hrm_recruit_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_recruit_post_type`
--

DROP TABLE IF EXISTS `wk_hrm_recruit_post_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_recruit_post_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `name` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '类型名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级类型id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1041 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='职位类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_recruit_post_type`
--

LOCK TABLES `wk_hrm_recruit_post_type` WRITE;
/*!40000 ALTER TABLE `wk_hrm_recruit_post_type` DISABLE KEYS */;
INSERT INTO `wk_hrm_recruit_post_type` VALUES (1,'高级管理',0),(2,'高级管理职位',1),(3,'高级管理职位',2),(4,'总裁/总经理/CEO',2),(5,'副总裁/副总经理/VP',2),(6,'分公司/代表处负责人',2),(7,'区域负责人(辖多个分公司)',2),(8,'总助/CEO助理/董事长助理',2),(9,'合伙人',2),(10,'联合创始人',2),(11,'董事会秘书',2),(12,'技术',0),(13,'后端开发',12),(14,'后端开发',13),(15,'Java',13),(16,'C++',13),(17,'PHP',13),(18,'数据挖掘',13),(19,'C',13),(20,'C#',13),(21,'.NET',13),(22,'Hadoop',13),(23,'Python',13),(24,'Delphi',13),(25,'VB',13),(26,'Perl',13),(27,'Ruby',13),(28,'Node.js',13),(29,'搜索算法',13),(30,'Golang',13),(31,'推荐算法',13),(32,'Erlang',13),(33,'算法工程师',13),(34,'语音/视频/图形开发',13),(35,'数据采集',13),(36,'移动开发',12),(37,'UE4',36),(38,'移动开发',36),(39,'HTML5',36),(40,'Android',36),(41,'iOS',36),(42,'WP',36),(43,'移动web前端',36),(44,'Flash开发',36),(45,'JavaScript',36),(46,'U3D',36),(47,'COCOS2DX',36),(48,'测试',12),(49,'测试工程师',48),(50,'自动化测试',48),(51,'功能测试',48),(52,'性能测试',48),(53,'测试开发',48),(54,'移动端测试',48),(55,'游戏测试',48),(56,'硬件测试',48),(57,'软件测试',48),(58,'运维/技术支持',12),(59,'运维工程师',58),(60,'运维开发工程师',58),(61,'网络工程师',58),(62,'系统工程师',58),(63,'IT技术支持',58),(64,'系统管理员',58),(65,'网络安全',58),(66,'系统安全',58),(67,'DBA',58),(68,'数据',12),(69,'数据',68),(70,'ETL工程师',68),(71,'数据仓库',68),(72,'数据开发',68),(73,'数据挖掘',68),(74,'数据分析师',68),(75,'数据架构师',68),(76,'算法研究员',68),(77,'项目管理',12),(78,'项目经理',77),(79,'项目主管',77),(80,'项目助理',77),(81,'项目专员',77),(82,'实施顾问',77),(83,'实施工程师',77),(84,'需求分析工程师',77),(85,'硬件开发',12),(86,'硬件',85),(87,'嵌入式',85),(88,'自动化',85),(89,'单片机',85),(90,'电路设计',85),(91,'驱动开发',85),(92,'系统集成',85),(93,'FPGA开发',85),(94,'DSP开发',85),(95,'ARM开发',85),(96,'PCB工艺',85),(97,'射频工程师',85),(98,'前端开发',12),(99,'前端开发',98),(100,'web前端',98),(101,'JavaScript',98),(102,'Flash开发',98),(103,'HTML5',98),(104,'通信',12),(105,'通信技术工程师',104),(106,'通信研发工程师',104),(107,'数据通信工程师',104),(108,'移动通信工程师',104),(109,'电信网络工程师',104),(110,'电信交换工程师',104),(111,'有线传输工程师',104),(112,'无线射频工程师',104),(113,'通信电源工程师',104),(114,'通信标准化工程师',104),(115,'通信项目专员',104),(116,'通信项目经理',104),(117,'核心网工程师',104),(118,'通信测试工程师',104),(119,'通信设备工程师',104),(120,'光通信工程师',104),(121,'光传输工程师',104),(122,'光网络工程师',104),(123,'电子/半导体',12),(124,'电子工程师',123),(125,'电气工程师',123),(126,'FAE',123),(127,'电气设计工程师',123),(128,'高端技术职位',12),(129,'高端技术职位',128),(130,'技术经理',128),(131,'技术总监',128),(132,'测试经理',128),(133,'架构师',128),(134,'CTO',128),(135,'运维总监',128),(136,'技术合伙人',128),(137,'人工智能',12),(138,'智能驾驶系统工程师',137),(139,'反欺诈/风控算法',137),(140,'人工智能',137),(141,'自然语言处理',137),(142,'机器学习',137),(143,'深度学习',137),(144,'语音识别',137),(145,'图像识别',137),(146,'算法研究员',137),(147,'销售技术支持',12),(148,'销售技术支持',147),(149,'售前工程师',147),(150,'售后工程师',147),(151,'其他技术职位',12),(152,'其他技术职位',151),(153,'产品',0),(154,'产品经理',153),(155,'硬件产品经理',154),(156,'产品经理',154),(157,'网页产品经理',154),(158,'移动产品经理',154),(159,'产品助理',154),(160,'数据产品经理',154),(161,'电商产品经理',154),(162,'游戏策划',154),(163,'产品专员',154),(164,'高端产品职位',153),(165,'高端产品职位',164),(166,'产品总监',164),(167,'游戏制作人',164),(168,'产品VP',164),(169,'其他产品职位',153),(170,'其他产品职位',169),(171,'设计',0),(172,'视觉设计',171),(173,'漫画师',172),(174,'人像修图师',172),(175,'视觉设计',172),(176,'视觉设计师',172),(177,'网页设计师',172),(178,'Flash设计师',172),(179,'APP设计师',172),(180,'UI设计师',172),(181,'平面设计师',172),(182,'美术设计师（2D/3D）',172),(183,'广告设计师',172),(184,'多媒体设计师',172),(185,'原画师',172),(186,'游戏特效',172),(187,'游戏界面设计师',172),(188,'游戏场景',172),(189,'游戏角色',172),(190,'游戏动作',172),(191,'CAD设计/制图',172),(192,'美工',172),(193,'包装设计',172),(194,'设计师助理',172),(195,'动画设计师',172),(196,'插画师',172),(197,'交互设计',171),(198,'交互设计师',197),(199,'无线交互设计师',197),(200,'网页交互设计师',197),(201,'硬件交互设计师',197),(202,'用户研究',171),(203,'数据分析师',202),(204,'用户研究员',202),(205,'游戏数值策划',202),(206,'UX设计师',202),(207,'用户研究经理',202),(208,'用户研究总监',202),(209,'高端设计职位',171),(210,'高端设计职位',209),(211,'设计经理/主管',209),(212,'设计总监',209),(213,'视觉设计经理',209),(214,'视觉设计总监',209),(215,'交互设计经理/主管',209),(216,'交互设计总监',209),(217,'非视觉设计',171),(218,'展览/展示设计',217),(219,'非视觉设计',217),(220,'服装/纺织设计',217),(221,'工业设计',217),(222,'橱柜设计',217),(223,'家具设计',217),(224,'家居设计',217),(225,'珠宝设计',217),(226,'室内设计',217),(227,'陈列设计',217),(228,'其他设计职位',171),(229,'其他设计职位',228),(230,'运营',0),(231,'运营',230),(232,'数据标注',231),(233,'直播运营',231),(234,'车辆运营',231),(235,'跨境电商运营',231),(236,'网店店长',231),(237,'运营',231),(238,'用户运营',231),(239,'产品运营',231),(240,'数据运营',231),(241,'内容运营',231),(242,'活动运营',231),(243,'商家运营',231),(244,'品类运营',231),(245,'游戏运营',231),(246,'网络推广',231),(247,'网站运营',231),(248,'新媒体运营',231),(249,'社区运营',231),(250,'微信运营',231),(251,'微博运营',231),(252,'策略运营',231),(253,'线下拓展运营',231),(254,'电商运营',231),(255,'运营助理/专员',231),(256,'内容审核',231),(257,'销售运营',231),(258,'编辑',230),(259,'编辑',258),(260,'副主编',258),(261,'内容编辑',258),(262,'文案策划',258),(263,'网站编辑',258),(264,'记者',258),(265,'采编',258),(266,'客服',230),(267,'售前咨询',266),(268,'售后咨询',266),(269,'网络客服',266),(270,'客服经理',266),(271,'客服专员/助理',266),(272,'客服主管',266),(273,'客服总监',266),(274,'电话客服',266),(275,'咨询热线/呼叫中心客服',266),(276,'高端运营职位',230),(277,'高端运营职位',276),(278,'主编',276),(279,'运营总监',276),(280,'COO',276),(281,'客服总监',276),(282,'运营经理/主管',276),(283,'其他运营职位',230),(284,'其他运营职位',283),(285,'市场',0),(286,'政府事务',285),(287,'政策研究',286),(288,'企业党建',286),(289,'政府关系',286),(290,'市场/营销',285),(291,'选址开发',290),(292,'游戏推广',290),(293,'市场营销',290),(294,'市场策划',290),(295,'市场顾问',290),(296,'市场推广',290),(297,'SEO',290),(298,'SEM',290),(299,'商务渠道',290),(300,'商业数据分析',290),(301,'活动策划',290),(302,'网络营销',290),(303,'海外市场',290),(304,'APP推广',290),(305,'公关媒介',285),(306,'公关媒介',305),(307,'媒介经理',305),(308,'广告协调',305),(309,'品牌公关',305),(310,'媒介专员',305),(311,'活动策划执行',305),(312,'媒介策划',305),(313,'会务会展',285),(314,'会务会展',313),(315,'会议活动销售',313),(316,'会议活动策划',313),(317,'会议活动执行',313),(318,'会展活动销售',313),(319,'会展活动策划',313),(320,'会展活动执行',313),(321,'广告',285),(322,'广告',321),(323,'广告创意',321),(324,'美术指导',321),(325,'广告设计师',321),(326,'策划经理',321),(327,'文案',321),(328,'广告制作',321),(329,'媒介投放',321),(330,'媒介合作',321),(331,'媒介顾问',321),(332,'广告审核',321),(333,'高端市场职位',285),(334,'高端市场职位',333),(335,'市场总监',333),(336,'CMO',333),(337,'公关总监',333),(338,'媒介总监',333),(339,'创意总监',333),(340,'其他市场职位',285),(341,'其他市场职位',340),(342,'人事/财务/行政',0),(343,'人力资源',342),(344,'人力资源主管',343),(345,'招聘',343),(346,'HRBP',343),(347,'人力资源专员/助理',343),(348,'培训',343),(349,'薪资福利',343),(350,'绩效考核',343),(351,'人力资源经理',343),(352,'人力资源VP/CHO',343),(353,'人力资源总监',343),(354,'员工关系',343),(355,'组织发展',343),(356,'行政',342),(357,'行政专员/助理',356),(358,'前台',356),(359,'行政主管',356),(360,'经理助理',356),(361,'后勤',356),(362,'商务司机',356),(363,'行政经理',356),(364,'行政总监',356),(365,'财务',342),(366,'成本',365),(367,'财务',365),(368,'会计',365),(369,'出纳',365),(370,'财务顾问',365),(371,'结算',365),(372,'税务',365),(373,'审计',365),(374,'风控',365),(375,'财务经理',365),(376,'CFO',365),(377,'财务总监',365),(378,'财务主管',365),(379,'法务',342),(380,'法务专员/助理',379),(381,'律师',379),(382,'法律顾问',379),(383,'法务主管',379),(384,'法务经理',379),(385,'法务总监',379),(386,'其他职能职位',342),(387,'其他职能职位',386),(388,'销售',0),(389,'销售',388),(390,'销售',389),(391,'销售专员',389),(392,'销售经理',389),(393,'客户代表',389),(394,'大客户代表',389),(395,'BD经理',389),(396,'商务渠道',389),(397,'渠道销售',389),(398,'代理商销售',389),(399,'销售助理',389),(400,'电话销售',389),(401,'销售顾问',389),(402,'商品经理',389),(403,'广告销售',389),(404,'网络营销',389),(405,'营销主管',389),(406,'销售工程师',389),(407,'客户经理',389),(408,'销售管理',388),(409,'销售管理',408),(410,'销售总监',408),(411,'商务总监',408),(412,'区域总监',408),(413,'城市经理',408),(414,'销售VP',408),(415,'团队经理',408),(416,'其他销售职位',388),(417,'其他销售职位',416),(418,'传媒',0),(419,'采编/写作/出版',418),(420,'采编/写作/出版',419),(421,'记者',419),(422,'编辑',419),(423,'采编',419),(424,'撰稿人',419),(425,'出版发行',419),(426,'校对录入',419),(427,'总编',419),(428,'自媒体',419),(429,'公关媒介',418),(430,'公关媒介',429),(431,'媒介经理',429),(432,'媒介专员',429),(433,'广告协调',429),(434,'品牌公关',429),(435,'活动策划执行',429),(436,'媒介策划',429),(437,'会务会展',418),(438,'会务会展',437),(439,'会议活动销售',437),(440,'会议活动策划',437),(441,'会议活动执行',437),(442,'会展活动销售',437),(443,'会展活动策划',437),(444,'会展活动执行',437),(445,'广告',418),(446,'广告',445),(447,'广告创意',445),(448,'美术指导',445),(449,'广告设计师',445),(450,'策划经理',445),(451,'文案',445),(452,'广告制作',445),(453,'媒介投放',445),(454,'媒介合作',445),(455,'媒介顾问',445),(456,'广告审核',445),(457,'影视媒体',418),(458,'主持人/DJ',457),(459,'主播助理',457),(460,'灯光师',457),(461,'剪辑师',457),(462,'影视特效',457),(463,'影视媒体',457),(464,'艺人助理',457),(465,'统筹制片人',457),(466,'执行制片人',457),(467,'导演/编导',457),(468,'摄影/摄像',457),(469,'视频编辑',457),(470,'音频编辑',457),(471,'经纪人',457),(472,'后期制作',457),(473,'影视制作',457),(474,'影视发行',457),(475,'影视策划',457),(476,'主播',457),(477,'演员/配音/模特',457),(478,'化妆/造型/服装',457),(479,'放映管理',457),(480,'录音/音效',457),(481,'制片人',457),(482,'编剧',457),(483,'其他传媒职位',418),(484,'其他传媒职位',483),(485,'金融',0),(486,'投融资',485),(487,'投融资',486),(488,'投资经理',486),(489,'行业研究',486),(490,'资产管理',486),(491,'投资总监',486),(492,'投资VP',486),(493,'投资合伙人',486),(494,'融资',486),(495,'并购',486),(496,'投后管理',486),(497,'投资助理',486),(498,'其他投融资职位',486),(499,'投资顾问',486),(500,'风控',485),(501,'风控',500),(502,'律师',500),(503,'资信评估',500),(504,'合规稽查',500),(505,'税务审计',485),(506,'审计',505),(507,'法务',505),(508,'会计',505),(509,'清算',505),(510,'银行',485),(511,'银行',510),(512,'信用卡销售',510),(513,'分析师',510),(514,'柜员',510),(515,'商务渠道',510),(516,'大堂经理',510),(517,'理财顾问',510),(518,'客户经理',510),(519,'信贷管理',510),(520,'风控',510),(521,'互联网金融',485),(522,'互联网金融',521),(523,'金融产品经理',521),(524,'风控',521),(525,'催收员',521),(526,'分析师',521),(527,'投资经理',521),(528,'交易员',521),(529,'理财顾问',521),(530,'合规稽查',521),(531,'审计',521),(532,'清算',521),(533,'保险',485),(534,'保险业务',533),(535,'精算师',533),(536,'保险理赔',533),(537,'证券',485),(538,'证券',537),(539,'证券经纪人',537),(540,'证券分析师',537),(541,'其他金融职位',485),(542,'其他金融职位',541),(543,'教育培训',0),(544,'教育产品研发',543),(545,'教育产品研发',544),(546,'课程设计',544),(547,'课程编辑',544),(548,'教师',544),(549,'培训研究',544),(550,'培训师',544),(551,'培训策划',544),(552,'其他教育产品研发职位',544),(553,'教育行政',543),(554,'园长/副园长',553),(555,'教育行政',553),(556,'校长/副校长',553),(557,'教务管理',553),(558,'教学管理',553),(559,'班主任/辅导员',553),(560,'教师',543),(561,'日语教师',560),(562,'其他外语教师',560),(563,'语文教师',560),(564,'数学教师',560),(565,'物理教师',560),(566,'化学教师',560),(567,'生物教师',560),(568,'教师',560),(569,'助教',560),(570,'高中教师',560),(571,'初中教师',560),(572,'小学教师',560),(573,'幼教',560),(574,'理科教师',560),(575,'文科教师',560),(576,'英语教师',560),(577,'音乐教师',560),(578,'美术教师',560),(579,'体育教师',560),(580,'就业老师',560),(581,'IT培训',543),(582,'IT培训',581),(583,'JAVA培训讲师',581),(584,'Android培训讲师',581),(585,'iOS培训讲师',581),(586,'PHP培训讲师',581),(587,'.NET培训讲师',581),(588,'C++培训讲师',581),(589,'Unity 3D培训讲师',581),(590,'Web前端培训讲师',581),(591,'软件测试培训讲师',581),(592,'动漫培训讲师',581),(593,'UI设计培训讲师',581),(594,'职业培训',543),(595,'财会培训讲师',594),(596,'HR培训讲师',594),(597,'培训师',594),(598,'拓展培训',594),(599,'招生',543),(600,'课程顾问',599),(601,'招生顾问',599),(602,'留学顾问',599),(603,'特长培训',543),(604,'武术教练',603),(605,'轮滑教练',603),(606,'表演教师',603),(607,'机器人教师',603),(608,'书法教师',603),(609,'钢琴教师',603),(610,'吉他教师',603),(611,'古筝教师',603),(612,'教练',603),(613,'舞蹈教练',603),(614,'瑜伽教练',603),(615,'瘦身顾问',603),(616,'游泳教练',603),(617,'健身教练',603),(618,'篮球/羽毛球教练',603),(619,'跆拳道教练',603),(620,'其他教育培训职位',543),(621,'其他教育培训职位',620),(622,'医疗健康',0),(623,'临床试验',622),(624,'临床研究',623),(625,'临床协调',623),(626,'临床数据分析',623),(627,'医学总监',623),(628,'医生/医技',622),(629,'医生助理',628),(630,'医学影像',628),(631,'B超医生',628),(632,'中医',628),(633,'医师',628),(634,'心理医生',628),(635,'药剂师',628),(636,'牙科医生',628),(637,'康复治疗师',628),(638,'验光师',628),(639,'放射科医师',628),(640,'检验科医师',628),(641,'其他医生职位',628),(642,'护士/护理',622),(643,'护士长',642),(644,'护士/护理',642),(645,'导医',642),(646,'健康整形',622),(647,'健康整形',646),(648,'营养师',646),(649,'整形师',646),(650,'理疗师',646),(651,'针灸推拿',646),(652,'生物制药',622),(653,'生物制药',652),(654,'药品注册',652),(655,'药品生产',652),(656,'医学总监',652),(657,'医药研发',652),(658,'医疗器械',622),(659,'医疗器械注册',658),(660,'医疗器械生产/质量管理',658),(661,'医疗器械研发',658),(662,'药店',622),(663,'药店店长',662),(664,'执业药师/驻店药师',662),(665,'药店店员',662),(666,'医学营销/媒体',622),(667,'医学营销/媒体',666),(668,'医疗器械销售',666),(669,'医学编辑',666),(670,'药学编辑',666),(671,'医药代表',666),(672,'健康顾问',666),(673,'医美咨询',666),(674,'其他医疗健康职位',622),(675,'其他医疗健康职位',674),(676,'采购/贸易',0),(677,'采购',676),(678,'采购',677),(679,'采购总监',677),(680,'采购经理',677),(681,'采购专员',677),(682,'买手',677),(683,'采购工程师',677),(684,'采购主管',677),(685,'采购助理',677),(686,'进出口贸易',676),(687,'进出口贸易',686),(688,'外贸经理',686),(689,'外贸专员',686),(690,'外贸业务员',686),(691,'贸易跟单',686),(692,'其他采购/贸易职位',676),(693,'其他采购/贸易类职位',692),(694,'供应链/物流',0),(695,'物流',694),(696,'物流',695),(697,'供应链专员',695),(698,'供应链经理',695),(699,'物流专员',695),(700,'物流经理',695),(701,'物流运营',695),(702,'物流跟单',695),(703,'贸易跟单',695),(704,'物仓调度',695),(705,'物仓项目',695),(706,'运输经理/主管',695),(707,'货运代理专员',695),(708,'货运代理经理',695),(709,'水/空/陆运操作',695),(710,'报关员',695),(711,'报检员',695),(712,'核销员',695),(713,'单证员',695),(714,'仓储',694),(715,'仓储',714),(716,'仓储物料经理',714),(717,'仓储物料专员',714),(718,'仓储物料项目',714),(719,'仓储管理',714),(720,'仓库文员',714),(721,'配/理/拣/发货',714),(722,'运输',694),(723,'运输',722),(724,'货运司机',722),(725,'集装箱管理',722),(726,'配送',722),(727,'快递',722),(728,'高端供应链职位',694),(729,'高端供应链职位',728),(730,'供应链总监',728),(731,'物流总监',728),(732,'其他供应链职位',694),(733,'其他供应链职位',732),(734,'房地产/建筑',0),(735,'房地产规划开发',734),(736,'房地产规划开发',735),(737,'房产策划',735),(738,'地产项目管理',735),(739,'地产招投标',735),(740,'设计装修与市政建设',734),(741,'弱电工程师',740),(742,'给排水工程师',740),(743,'暖通工程师',740),(744,'幕墙工程师',740),(745,'软装设计师',740),(746,'施工员',740),(747,'测绘/测量',740),(748,'材料员',740),(749,'BIM工程师',740),(750,'装修项目经理',740),(751,'设计装修与市政建设',740),(752,'高级建筑工程师',740),(753,'建筑工程师',740),(754,'建筑设计师',740),(755,'土木/土建/结构工程师',740),(756,'室内设计',740),(757,'园林设计',740),(758,'城市规划设计',740),(759,'工程监理',740),(760,'工程造价',740),(761,'预结算',740),(762,'工程资料管理',740),(763,'建筑施工现场管理',740),(764,'景观设计',740),(765,'房地产经纪',734),(766,'房地产经纪',765),(767,'地产置业顾问',765),(768,'地产评估',765),(769,'地产中介',765),(770,'物业管理',734),(771,'物业维修',770),(772,'绿化工',770),(773,'物业管家',770),(774,'物业经理',770),(775,'物业租赁销售 ',770),(776,'物业招商管理',770),(777,'高端房地产职位',734),(778,'高端房地产职位',777),(779,'地产项目总监',777),(780,'地产策划总监',777),(781,'地产招投标总监',777),(782,'物业总监',777),(783,'房地产销售总监',777),(784,'其他房地产职位',734),(785,'其他房地产职位',784),(786,'咨询/翻译/法律',0),(787,'咨询/调研',786),(788,'知识产权/专利/商标代理人',787),(789,'心理咨询',787),(790,'婚恋咨询',787),(791,'咨询/调研',787),(792,'企业管理咨询',787),(793,'咨询总监',787),(794,'数据分析师',787),(795,'咨询经理',787),(796,'财务咨询顾问',787),(797,'IT咨询顾问',787),(798,'人力资源顾问',787),(799,'咨询项目管理',787),(800,'战略咨询',787),(801,'猎头顾问',787),(802,'市场调研',787),(803,'其他咨询顾问',787),(804,'律师',786),(805,'知识产权律师',804),(806,'律师助理',804),(807,'专利律师',804),(808,'事务所律师',804),(809,'公司法务',804),(810,'翻译',786),(811,'英语翻译',810),(812,'日语翻译',810),(813,'韩语/朝鲜语翻译',810),(814,'法语翻译',810),(815,'同声传译  ',810),(816,'德语翻译',810),(817,'俄语翻译',810),(818,'西班牙语翻译',810),(819,'其他语种翻译',810),(820,'其他咨询类职位',786),(821,'其他咨询/翻译类职位',820),(822,'管培生/储备干部',0),(823,'管培生',822),(824,'管理培训生',823),(825,'储备干部',823),(826,'其他管培生职位',822),(827,'其他实习/培训/储备职位',826),(828,'旅游',0),(829,'旅游服务',828),(830,'旅游服务',829),(831,'计调',829),(832,'签证',829),(833,'旅游顾问',829),(834,'导游',829),(835,'预定票务',829),(836,'旅游产品开发/策划',828),(837,'旅游产品开发/策划',836),(838,'旅游产品经理',836),(839,'旅游策划师',836),(840,'其他旅游职位',828),(841,'其他旅游职位',840),(842,'服务业',0),(843,'安保/家政/维修',842),(844,'保安',843),(845,'保洁',843),(846,'保姆',843),(847,'月嫂',843),(848,'育婴师',843),(849,'护工',843),(850,'安检员',843),(851,'手机维修',843),(852,'家电维修',843),(853,'保安经理',843),(854,'宠物服务',842),(855,'宠物美容',854),(856,'宠物医生',854),(857,'婚礼/花艺',842),(858,'花艺师',857),(859,'婚礼策划师',857),(860,'美容保健',842),(861,'彩妆顾问',860),(862,'纹绣师',860),(863,'美体师',860),(864,'美发学徒',860),(865,'美容店长',860),(866,'足疗师',860),(867,'按摩师',860),(868,'发型师',860),(869,'美甲师',860),(870,'化妆师',860),(871,'养发师',860),(872,'美容师/顾问',860),(873,'酒店',842),(874,'礼仪迎宾',873),(875,'前厅经理',873),(876,'客房经理',873),(877,'收银',873),(878,'酒店前台',873),(879,'客房服务员',873),(880,'酒店经理',873),(881,'餐饮',842),(882,'后厨',881),(883,'配菜打荷',881),(884,'茶艺师',881),(885,'西点师',881),(886,'餐饮学徒',881),(887,'面点师',881),(888,'行政总厨',881),(889,'厨师长',881),(890,'传菜员',881),(891,'洗碗工',881),(892,'凉菜厨师',881),(893,'中餐厨师',881),(894,'西餐厨师',881),(895,'日式厨师',881),(896,'烧烤师傅',881),(897,'餐饮',881),(898,'收银',881),(899,'服务员',881),(900,'厨师',881),(901,'咖啡师',881),(902,'送餐员',881),(903,'餐饮店长',881),(904,'领班',881),(905,'零售',842),(906,'督导/巡店',905),(907,'陈列员',905),(908,'理货员',905),(909,'防损员',905),(910,'卖场经理',905),(911,'收银',905),(912,'导购',905),(913,'店员/营业员',905),(914,'门店店长',905),(915,'运动健身',842),(916,'会籍顾问',915),(917,'救生员',915),(918,'健身',915),(919,'瑜伽教练',915),(920,'瘦身顾问',915),(921,'游泳教练',915),(922,'美体教练',915),(923,'舞蹈教练',915),(924,'健身教练',915),(925,'其他服务业职位',842),(926,'其他服务业职位',925),(927,'生产制造',0),(928,'生产营运',927),(929,'生产营运',928),(930,'厂长/工厂经理',928),(931,'生产总监',928),(932,'生产经理/车间主任',928),(933,'生产组长/拉长',928),(934,'生产员',928),(935,'生产设备管理',928),(936,'生产计划/物料控制',928),(937,'生产跟单',928),(938,'质量安全',927),(939,'质检员',938),(940,'质量管理/测试',938),(941,'可靠度工程师',938),(942,'故障分析师',938),(943,'认证工程师',938),(944,'体系工程师',938),(945,'审核员',938),(946,'安全员',938),(947,'汽车质量工程师',938),(948,'新能源',927),(949,'电池工程师',948),(950,'电机工程师',948),(951,'线束设计',948),(952,'充电桩设计',948),(953,'汽车制造',927),(954,'汽车设计',953),(955,'车身/造型设计',953),(956,'底盘工程师',953),(957,'动力系统工程师',953),(958,'汽车电子工程师',953),(959,'汽车零部件设计',953),(960,'汽车项目管理',953),(961,'内外饰设计工程师',953),(962,'总装工程师',953),(963,'汽车销售与服务',927),(964,'汽车销售',963),(965,'汽车配件销售',963),(966,'汽车服务顾问',963),(967,'汽车维修',963),(968,'汽车美容',963),(969,'汽车定损理赔',963),(970,'二手车评估师',963),(971,'4S店店长/维修站长',963),(972,'汽车改装工程师',963),(973,'机械设计/制造',927),(974,'机械设计/制造',973),(975,'热传导',973),(976,'精益工程师',973),(977,'机械工程师',973),(978,'机械设计师',973),(979,'机械设备工程师',973),(980,'机械维修/保养',973),(981,'机械制图',973),(982,'机械结构工程师',973),(983,'工业工程师',973),(984,'工艺/制程工程师',973),(985,'材料工程师',973),(986,'机电工程师',973),(987,'CNC/数控',973),(988,'冲压工程师',973),(989,'夹具工程师',973),(990,'模具工程师',973),(991,'焊接工程师',973),(992,'注塑工程师',973),(993,'铸造/锻造工程师',973),(994,'化工',927),(995,'化工工程师',994),(996,'实验室技术员',994),(997,'化学分析',994),(998,'涂料研发',994),(999,'化妆品研发',994),(1000,'食品/饮料研发',994),(1001,'服装/纺织/皮革',927),(1002,'服装/纺织设计',1001),(1003,'面料辅料开发',1001),(1004,'打样/制版',1001),(1005,'服装/纺织/皮革跟单',1001),(1006,'技工/普工',927),(1007,'缝纫工',1006),(1008,'搬运工',1006),(1009,'普工/操作工',1006),(1010,'叉车',1006),(1011,'铲车',1006),(1012,'焊工',1006),(1013,'氩弧焊工',1006),(1014,'电工',1006),(1015,'木工',1006),(1016,'漆工',1006),(1017,'车工',1006),(1018,'磨工',1006),(1019,'铣工',1006),(1020,'钳工',1006),(1021,'钻工',1006),(1022,'铆工',1006),(1023,'钣金',1006),(1024,'抛光',1006),(1025,'机修工',1006),(1026,'折弯工',1006),(1027,'电镀工',1006),(1028,'喷塑工',1006),(1029,'注塑工',1006),(1030,'组装工',1006),(1031,'包装工',1006),(1032,'空调工',1006),(1033,'电梯工',1006),(1034,'锅炉工',1006),(1035,'学徒工',1006),(1036,'其他生产制造职位',927),(1037,'其他生产制造职位',1036),(1038,'其他',0),(1039,'其他职位类别',1038),(1040,'其他职位',1039);
/*!40000 ALTER TABLE `wk_hrm_recruit_post_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_archives`
--

DROP TABLE IF EXISTS `wk_hrm_salary_archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '薪资档案id',
  `change_reason` int(11) NOT NULL COMMENT '调薪原因 1 入职核定 2 转正 3 晋升 4 调动 5 年中调薪 6 年度调薪 7 特别调薪 8 其他',
  `change_data` date NOT NULL COMMENT '最近调整日期',
  `employee_id` int(11) NOT NULL COMMENT '员工id',
  `change_type` int(11) DEFAULT '0' COMMENT '0 未定薪 1 已定薪 2 已调薪',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `wk_hrm_salary_archives_change_reason_index` (`change_reason`) USING BTREE,
  KEY `wk_hrm_salary_archives_employee_id_index` (`employee_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='薪资档案表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_archives`
--

LOCK TABLES `wk_hrm_salary_archives` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_archives` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_salary_archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_archives_option`
--

DROP TABLE IF EXISTS `wk_hrm_salary_archives_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_archives_option` (
  `employee_id` int(11) NOT NULL COMMENT '员工id',
  `is_pro` int(11) NOT NULL COMMENT '是否是试用期 0 正式 1 试用期',
  `code` int(11) NOT NULL COMMENT '薪资项code',
  `name` varchar(20) NOT NULL COMMENT '薪资项名称',
  `value` varchar(20) NOT NULL COMMENT '薪资',
  KEY `wk_hrm_salary_archives_option_employee_id_index` (`employee_id`) USING BTREE,
  KEY `wk_hrm_salary_archives_option_is_pro_index` (`is_pro`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='薪资档案选项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_archives_option`
--

LOCK TABLES `wk_hrm_salary_archives_option` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_archives_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_salary_archives_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_change_record`
--

DROP TABLE IF EXISTS `wk_hrm_salary_change_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_change_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '定薪调薪记录id',
  `employee_id` int(11) NOT NULL COMMENT '员工id',
  `record_type` int(11) NOT NULL DEFAULT '1' COMMENT '记录类型 1 定薪 2 调薪',
  `change_reason` int(11) NOT NULL COMMENT '调薪原因 1 入职核定 2 转正 3 晋升 4 调动 5 年中调薪 6 年度调薪 7 特别调薪 8 其他',
  `enable_date` date NOT NULL COMMENT '生效时间',
  `pro_before_sum` varchar(20) NOT NULL DEFAULT '0' COMMENT '试用期调整前工资',
  `pro_after_sum` varchar(20) NOT NULL DEFAULT '0' COMMENT '试用期调整后工资',
  `pro_salary` varchar(4096) NOT NULL DEFAULT '' COMMENT '试用期工资明细',
  `before_sum` varchar(20) NOT NULL DEFAULT '0' COMMENT '正式调整前工资 json',
  `after_sum` varchar(20) NOT NULL DEFAULT '0' COMMENT '正式调整后工资',
  `salary` varchar(4096) NOT NULL DEFAULT '' COMMENT '正式工资明细 json',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0 未生效 1 已生效 2 已取消',
  `employee_status` int(11) DEFAULT NULL,
  `before_total` varchar(20) NOT NULL DEFAULT '0' COMMENT '调整前总薪资',
  `after_total` varchar(20) NOT NULL DEFAULT '0' COMMENT '调整后总薪资',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `wk_hrm_salary_change_record_employee_id_index` (`employee_id`) USING BTREE,
  KEY `wk_hrm_salary_change_record_status_index` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='定薪调薪记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_change_record`
--

LOCK TABLES `wk_hrm_salary_change_record` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_change_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_salary_change_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_change_template`
--

DROP TABLE IF EXISTS `wk_hrm_salary_change_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_change_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '调薪模板id',
  `template_name` varchar(20) NOT NULL COMMENT '模板名称',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否默认 0 否 1 是',
  `value` varchar(4096) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='调薪模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_change_template`
--

LOCK TABLES `wk_hrm_salary_change_template` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_change_template` DISABLE KEYS */;
INSERT INTO `wk_hrm_salary_change_template` VALUES (1,'默认模板',1,'[{\"code\":10101,\"name\":\"基本工资\"},{\"code\":10102,\"name\":\"岗位工资\"},{\"code\":10103,\"name\":\"职务工资\"}]','2020-11-24 21:20:43',0);
/*!40000 ALTER TABLE `wk_hrm_salary_change_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_config`
--

DROP TABLE IF EXISTS `wk_hrm_salary_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '薪资初始配置id',
  `salary_cycle_start_day` int(11) DEFAULT NULL COMMENT '计薪周期开始日',
  `salary_cycle_end_day` int(11) DEFAULT NULL COMMENT '计薪周期结束日',
  `pay_type` int(11) DEFAULT NULL COMMENT '发薪日期类型 1 当月 2 次月',
  `pay_day` int(11) DEFAULT NULL COMMENT '发薪日期',
  `social_security_month_type` int(11) DEFAULT NULL COMMENT '对应社保自然月 0上月 1当月 2次月',
  `salary_start_month` varchar(20) DEFAULT NULL COMMENT '薪酬起始月份（例2020.05）',
  `social_security_start_month` varchar(20) DEFAULT NULL COMMENT '社保开始月（例2020.05）',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='薪资初始配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_config`
--

LOCK TABLES `wk_hrm_salary_config` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_config` DISABLE KEYS */;
INSERT INTO `wk_hrm_salary_config` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,'2024-10');
/*!40000 ALTER TABLE `wk_hrm_salary_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_group`
--

DROP TABLE IF EXISTS `wk_hrm_salary_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '薪资组id',
  `group_name` varchar(50) DEFAULT NULL COMMENT '薪资组名称',
  `dept_ids` varchar(1024) DEFAULT NULL COMMENT '部门范围',
  `employee_ids` varchar(1024) DEFAULT NULL COMMENT '员工范围',
  `salary_standard` varchar(20) DEFAULT '21.75' COMMENT '月计薪标准',
  `change_rule` varchar(20) DEFAULT '按转正/调薪前后的工资混合计算' COMMENT '转正、调薪月规则',
  `rule_id` int(11) DEFAULT NULL COMMENT '计税规则id',
  `create_time` datetime NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='薪资组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_group`
--

LOCK TABLES `wk_hrm_salary_group` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_salary_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_month_emp_record`
--

DROP TABLE IF EXISTS `wk_hrm_salary_month_emp_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_month_emp_record` (
  `s_emp_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工每月薪资记录id',
  `s_record_id` int(11) DEFAULT NULL COMMENT '每月生成薪资id',
  `employee_id` int(11) DEFAULT NULL COMMENT '员工id',
  `actual_work_day` decimal(10,2) DEFAULT NULL COMMENT '实际计薪时长',
  `need_work_day` decimal(10,2) DEFAULT NULL COMMENT '月计薪时长',
  `year` int(11) DEFAULT NULL COMMENT '年',
  `month` int(11) DEFAULT NULL COMMENT '月',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`s_emp_record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='员工每月薪资记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_month_emp_record`
--

LOCK TABLES `wk_hrm_salary_month_emp_record` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_month_emp_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_salary_month_emp_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_month_option_value`
--

DROP TABLE IF EXISTS `wk_hrm_salary_month_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_month_option_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '每月员工薪资项id',
  `s_emp_record_id` int(11) DEFAULT NULL COMMENT '每月员工薪资记录id',
  `code` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='每月员工薪资项表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_month_option_value`
--

LOCK TABLES `wk_hrm_salary_month_option_value` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_month_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_salary_month_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_month_record`
--

DROP TABLE IF EXISTS `wk_hrm_salary_month_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_month_record` (
  `s_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '每月薪资记录id',
  `title` varchar(40) DEFAULT NULL COMMENT '报表标题',
  `year` int(11) DEFAULT NULL COMMENT '年',
  `month` int(11) DEFAULT NULL COMMENT '月',
  `num` int(11) DEFAULT NULL COMMENT '计薪人数',
  `start_time` date DEFAULT NULL COMMENT '计薪开始日期',
  `end_time` date DEFAULT NULL COMMENT '计薪结束日期',
  `personal_insurance_amount` decimal(10,2) DEFAULT NULL COMMENT '个人社保金额',
  `personal_provident_fund_amount` decimal(10,2) DEFAULT NULL COMMENT '个人公积金金额',
  `corporate_insurance_amount` decimal(10,2) DEFAULT NULL COMMENT '公司社保金额',
  `corporate_provident_fund_amount` decimal(10,2) DEFAULT NULL COMMENT '公司社保金额',
  `expected_pay_salary` decimal(10,2) DEFAULT NULL COMMENT '预应发工资',
  `personal_tax` decimal(10,2) DEFAULT NULL COMMENT '个人所得税',
  `real_pay_salary` decimal(10,2) DEFAULT NULL COMMENT '预计实发工资',
  `option_head` longtext COMMENT '薪资项表头',
  `examine_record_id` int(11) DEFAULT NULL COMMENT '审核记录id',
  `check_status` int(11) DEFAULT '5' COMMENT '状态  0待审核、1通过、2拒绝、3审核中 4:撤回 5 未提交  10 历史薪资 11核算完成',
  `create_user_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`s_record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='每月薪资记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_month_record`
--

LOCK TABLES `wk_hrm_salary_month_record` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_month_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_salary_month_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_option`
--

DROP TABLE IF EXISTS `wk_hrm_salary_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统薪资项id',
  `code` int(11) DEFAULT NULL,
  `parent_code` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_fixed` int(11) DEFAULT NULL COMMENT '是否固定 0 否 1 是',
  `is_plus` int(11) DEFAULT NULL COMMENT '是否加项 0 减 1 加',
  `is_tax` int(11) DEFAULT NULL COMMENT '是否计税 0 否 1 是',
  `is_show` int(11) DEFAULT NULL COMMENT '是否展示 0 否 1 是',
  `is_compute` int(11) DEFAULT NULL COMMENT '是否参与薪资计算 0 否 1 是',
  `is_open` int(11) DEFAULT NULL COMMENT '是否打开',
  PRIMARY KEY (`option_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1311 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统薪资项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_option`
--

LOCK TABLES `wk_hrm_salary_option` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_option` DISABLE KEYS */;
INSERT INTO `wk_hrm_salary_option` VALUES (1161,10,0,'基本工资',NULL,0,1,1,1,1,1),(1165,20,0,'津补贴','企业给员工提供的福利',0,1,1,1,1,1),(1170,30,0,'浮动工资','浮动工资需要在每月算薪前手工录入',0,1,1,1,1,1),(1172,40,0,'奖金',NULL,0,1,1,1,1,1),(1176,50,0,'提成工资',NULL,0,1,1,1,1,1),(1178,60,0,'计件工资',NULL,0,1,1,1,1,1),(1180,70,0,'计时工资',NULL,0,1,1,1,1,1),(1182,80,0,'工龄/司龄工资',NULL,0,1,1,1,1,1),(1185,90,0,'职称工资',NULL,0,1,1,1,1,1),(1189,100,0,'代扣代缴','公司代替个人缴纳的费用，如个人社保、个人公积金。该类别下的薪酬项，将从应纳税所得额中扣除，影响个税计算',0,0,1,1,1,1),(1192,110,0,'企业社保','该类别下的薪酬项，不参与工资计算，只参与企业成本统计或社保成本分析',0,1,0,1,0,1),(1194,120,0,'企业公积金','该类别下的薪酬项，不参与工资计算，只参与企业成本统计或社保成本分析',0,1,0,1,0,1),(1196,130,0,'税前补发','税前补发，与该月的工资一起发放，需参与计税',0,1,0,1,1,1),(1198,140,0,'税前补扣','税前从该月的工资中补扣的金额，会影响本月的应税工资总额',0,0,0,1,1,1),(1200,150,0,'税后补发','税后补发，不参与该月工资计算，会影响当月的实际所得',0,1,0,1,1,1),(1202,160,0,'税后补扣','从税后的工资中补扣的款项，不参与该月的工资计税',0,0,0,1,1,1),(1206,170,0,'特殊计税项','其它里的科目不参与工资计算，但要计税',0,1,1,1,1,1),(1208,180,0,'加班工资','公司按员工加班时长计算的加班报酬',1,1,1,1,1,1),(1210,190,0,'考勤扣款明细',NULL,1,0,1,1,1,1),(1217,200,0,'考勤扣款合计',NULL,1,0,1,1,0,1),(1219,210,0,'应发工资',NULL,1,2,2,1,0,1),(1221,220,0,'应税工资',NULL,1,2,2,1,0,1),(1223,230,0,'个人所得税',NULL,1,2,2,1,0,1),(1225,240,0,'实发工资',NULL,1,2,2,1,0,1),(1269,10101,10,'基本工资','劳动合同中约定的标准工资。',0,1,1,1,1,1),(1270,10102,10,'岗位工资','根据岗位、责任、技能要求等，不同岗位，工资不同。',0,1,1,1,1,1),(1271,10103,10,'职务工资','根据职务高低、业务技术水平等因素的不同，工资不同，随职务变动而变动。',0,1,1,1,1,1),(1272,20101,20,'住房补贴','为职工解决住房问题而给予的补贴资助。',0,1,1,1,1,1),(1273,20102,20,'高温津贴','用人单位安排劳动者在高温天气下工作，当温度高于33℃，应支付高温补贴。',0,1,1,1,1,1),(1274,20103,20,'交通补贴','企业按月按标准支付的交通补贴',0,1,1,1,1,1),(1275,20104,20,'餐补','企业不统一供餐，而是按月按标准支付的午饭或晚餐补贴',0,1,1,1,1,1),(1276,30101,30,'绩效工资','以员工的实际劳动成果或表现为考核标准，支付一定的奖励工资。',0,1,1,1,1,1),(1277,40101,40,'季度奖','对于表现优秀的员工，按季度给予一定的奖励工资。',0,1,1,1,1,1),(1278,40102,40,'全勤奖','对于按公司规定到岗工作，未出现任何迟到、早退的员工给予的奖励，一般以月度为考核期限。',0,1,1,1,1,1),(1279,40103,40,'推荐奖','企业在招揽人才的过程中，对推荐人才并顺利入职的内部员工，给予的奖励工资。',0,1,1,1,1,1),(1280,50101,50,'销售提成','对于销售或业务人员，通常按照一定的比例，企业和员工之间对盈利进行分成。',0,1,1,1,1,1),(1281,60101,60,'计件工资','根据职工完成的劳动数量和按事先规定的计件单价计算和支付的工资。',0,1,1,1,1,1),(1282,70101,70,'计时工资','根据职工的工作时间,按照工资标准、等级计算和支付的工资',0,1,1,1,1,1),(1283,80101,80,'工龄工资','企业按照员工的工作年数，即员工的工作经验和劳动贡献的积累给予的经济补偿。',0,1,1,1,1,1),(1284,80102,80,'司龄工资','司龄工资是按照劳动者在在公司做的时间的长短进行相应工资的计算。',0,1,1,1,1,1),(1285,90101,90,'职称工资','工资高低与职称挂钩，职称越高，工资越高。',0,1,1,1,1,1),(1286,90102,90,'技能工资','以员工个人所掌握的知识、技术和所具备的能力为基础来进行工资报酬的支付。',0,1,1,1,1,1),(1287,90103,90,'学历工资','根据员工在教育机构取得的学历而给予适当的津贴。',0,1,1,1,1,1),(1288,100101,100,'个人社保','社保中个人缴纳的部分',0,0,1,1,1,1),(1289,100102,100,'个人公积金','公积金中个人缴纳的部分',0,0,1,1,1,1),(1290,110101,110,'企业社保','企业承担的社保费用',0,1,0,1,0,1),(1291,120101,120,'企业公积金','企业承担的公积金费用',0,1,0,1,0,1),(1292,130101,130,'税前补发','如上月漏发，这月补发的工资',0,1,0,1,1,1),(1293,140101,140,'税前补扣','如上月未扣，这月补扣的扣款；',0,0,0,1,1,1),(1294,150101,150,'税后补发','其它税后补发',0,1,0,1,1,1),(1295,160101,160,'党费','向党组织交纳的用于党的事业和党的活动的经费，由公司代收。',0,0,0,1,1,1),(1296,160102,160,'工会费','员工缴纳的，工会组织开展各项活动所需要的费用',0,0,0,1,1,1),(1297,160103,160,'补充医疗','企业在基本医疗保险的基础上，为员工缴纳的额外补充医疗保险。',0,0,0,1,1,1),(1298,170101,170,'商业保险金','商业保险金不参与计算，但要计税',0,1,1,1,1,1),(1299,180101,180,'加班工资','按一定的比例，按加班时长计算加班工资',1,1,1,1,1,1),(1300,190101,190,'迟到扣款','员工无故迟到，需扣除一定的工资作为惩戒',1,0,1,1,1,1),(1301,190102,190,'早退扣款','员工无故早退，需扣除一定的工资作为惩戒',1,0,1,1,1,1),(1302,190103,190,'旷工扣款','员工无故旷工，需扣除一定的工资作为惩戒',1,0,1,1,1,1),(1303,190104,190,'假期扣款','员工因请事假、病假等，工作日未能到岗，需扣除一定的工资',1,0,1,1,1,1),(1304,190105,190,'缺卡扣款','员工无故缺卡，需扣除一定的金额作为惩戒',1,0,1,1,1,1),(1305,190106,190,'综合扣款','按月累计迟到和早退时长或次数，计算的考勤扣款金额',1,0,1,1,1,1),(1306,200101,200,'考勤扣款合计','迟到、早退、旷工、缺卡、请假等6中异常考勤的扣款合计',1,0,1,1,0,1),(1307,210101,210,'应发工资','应发工资=员工工资总额-请假扣款-考勤扣款等',1,2,2,1,0,1),(1308,220101,220,'应税工资','应税工资=应发工资-个人社保-个人公积金-每月减除费用',1,2,2,1,0,1),(1309,230101,230,'个人所得税','根据个税计算规则，计算的每月应缴纳个税',1,2,2,1,0,1),(1310,240101,240,'实发工资','员工每月获得的实际收入。',1,2,2,1,0,1);
/*!40000 ALTER TABLE `wk_hrm_salary_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_option_template`
--

DROP TABLE IF EXISTS `wk_hrm_salary_option_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_option_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统薪资项模板',
  `code` int(11) DEFAULT NULL,
  `parent_code` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_fixed` int(11) DEFAULT NULL COMMENT '是否固定 0 否 1 是',
  `is_plus` int(11) DEFAULT NULL COMMENT '是否加项 0 减 1 加 2 计算所得',
  `is_tax` int(11) DEFAULT NULL COMMENT '是否计税 0 否 1 是',
  `is_show` int(11) DEFAULT NULL COMMENT '是否展示 0 否 1 是',
  `is_compute` int(11) DEFAULT NULL COMMENT '是否参与薪资计算 0 否 1 是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统薪资项模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_option_template`
--

LOCK TABLES `wk_hrm_salary_option_template` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_option_template` DISABLE KEYS */;
INSERT INTO `wk_hrm_salary_option_template` VALUES (1,10,0,'基本工资',NULL,0,1,1,1,1),(2,10101,10,'基本工资','劳动合同中约定的标准工资。',0,1,1,1,1),(3,10102,10,'岗位工资','根据岗位、责任、技能要求等，不同岗位，工资不同。',0,1,1,1,1),(4,10103,10,'职务工资','根据职务高低、业务技术水平等因素的不同，工资不同，随职务变动而变动。',0,1,1,1,1),(5,20,0,'津补贴','企业给员工提供的福利',0,1,1,1,1),(6,20101,20,'住房补贴','为职工解决住房问题而给予的补贴资助。',0,1,1,1,1),(7,20102,20,'高温津贴','用人单位安排劳动者在高温天气下工作，当温度高于33℃，应支付高温补贴。',0,1,1,1,1),(8,20103,20,'交通补贴','企业按月按标准支付的交通补贴',0,1,1,1,1),(9,20104,20,'餐补','企业不统一供餐，而是按月按标准支付的午饭或晚餐补贴',0,1,1,1,1),(10,30,0,'浮动工资','浮动工资需要在每月算薪前手工录入',0,1,1,1,1),(11,30101,30,'绩效工资','以员工的实际劳动成果或表现为考核标准，支付一定的奖励工资。',0,1,1,1,1),(12,40,0,'奖金',NULL,0,1,1,1,1),(13,40101,40,'季度奖','对于表现优秀的员工，按季度给予一定的奖励工资。',0,1,1,1,1),(14,40102,40,'全勤奖','对于按公司规定到岗工作，未出现任何迟到、早退的员工给予的奖励，一般以月度为考核期限。',0,1,1,1,1),(15,40103,40,'推荐奖','企业在招揽人才的过程中，对推荐人才并顺利入职的内部员工，给予的奖励工资。',0,1,1,1,1),(16,50,0,'提成工资',NULL,0,1,1,1,1),(17,50101,50,'销售提成','对于销售或业务人员，通常按照一定的比例，企业和员工之间对盈利进行分成。',0,1,1,1,1),(18,60,0,'计件工资',NULL,0,1,1,1,1),(19,60101,60,'计件工资','根据职工完成的劳动数量和按事先规定的计件单价计算和支付的工资。',0,1,1,1,1),(20,70,0,'计时工资',NULL,0,1,1,1,1),(21,70101,70,'计时工资','根据职工的工作时间,按照工资标准、等级计算和支付的工资',0,1,1,1,1),(22,80,0,'工龄/司龄工资',NULL,0,1,1,1,1),(23,80101,80,'工龄工资','企业按照员工的工作年数，即员工的工作经验和劳动贡献的积累给予的经济补偿。',0,1,1,1,1),(24,80102,80,'司龄工资','司龄工资是按照劳动者在在公司做的时间的长短进行相应工资的计算。',0,1,1,1,1),(25,90,0,'职称工资',NULL,0,1,1,1,1),(26,90101,90,'职称工资','工资高低与职称挂钩，职称越高，工资越高。',0,1,1,1,1),(27,90102,90,'技能工资','以员工个人所掌握的知识、技术和所具备的能力为基础来进行工资报酬的支付。',0,1,1,1,1),(28,90103,90,'学历工资','根据员工在教育机构取得的学历而给予适当的津贴。',0,1,1,1,1),(29,100,0,'代扣代缴','公司代替个人缴纳的费用，如个人社保、个人公积金。该类别下的薪酬项，将从应纳税所得额中扣除，影响个税计算',0,0,1,1,1),(30,100101,100,'个人社保','社保中个人缴纳的部分',0,0,1,1,1),(31,100102,100,'个人公积金','公积金中个人缴纳的部分',0,0,1,1,1),(32,110,0,'企业社保','该类别下的薪酬项，不参与工资计算，只参与企业成本统计或社保成本分析',0,1,0,1,0),(33,110101,110,'企业社保','企业承担的社保费用',0,1,0,1,0),(34,120,0,'企业公积金','该类别下的薪酬项，不参与工资计算，只参与企业成本统计或社保成本分析',0,1,0,1,0),(35,120101,120,'企业公积金','企业承担的公积金费用',0,1,0,1,0),(36,130,0,'税前补发','税前补发，与该月的工资一起发放，需参与计税',0,1,0,1,1),(37,130101,130,'税前补发','如上月漏发，这月补发的工资',0,1,0,1,1),(38,140,0,'税前补扣','税前从该月的工资中补扣的金额，会影响本月的应税工资总额',0,0,0,1,1),(39,140101,140,'税前补扣','如上月未扣，这月补扣的扣款；',0,0,0,1,1),(40,150,0,'税后补发','税后补发，不参与该月工资计算，会影响当月的实际所得',0,1,0,1,1),(41,150101,150,'税后补发','其它税后补发',0,1,0,1,1),(42,160,0,'税后补扣','从税后的工资中补扣的款项，不参与该月的工资计税',0,0,0,1,1),(43,160101,160,'党费','向党组织交纳的用于党的事业和党的活动的经费，由公司代收。',0,0,0,1,1),(44,160102,160,'工会费','员工缴纳的，工会组织开展各项活动所需要的费用',0,0,0,1,1),(45,160103,160,'补充医疗','企业在基本医疗保险的基础上，为员工缴纳的额外补充医疗保险。',0,0,0,1,1),(46,170,0,'特殊计税项','其它里的科目不参与工资计算，但要计税',0,1,1,1,1),(47,170101,170,'商业保险金','商业保险金不参与计算，但要计税',0,1,1,1,1),(48,180,0,'加班工资','公司按员工加班时长计算的加班报酬',1,1,1,1,1),(49,180101,180,'加班工资','按一定的比例，按加班时长计算加班工资',1,1,1,1,1),(50,190,0,'考勤扣款明细',NULL,1,0,1,1,1),(51,190101,190,'迟到扣款','员工无故迟到，需扣除一定的工资作为惩戒',1,0,1,1,1),(52,190102,190,'早退扣款','员工无故早退，需扣除一定的工资作为惩戒',1,0,1,1,1),(53,190103,190,'旷工扣款','员工无故旷工，需扣除一定的工资作为惩戒',1,0,1,1,1),(54,190104,190,'假期扣款','员工因请事假、病假等，工作日未能到岗，需扣除一定的工资',1,0,1,1,1),(55,190105,190,'缺卡扣款','员工无故缺卡，需扣除一定的金额作为惩戒',1,0,1,1,1),(56,190106,190,'综合扣款','按月累计迟到和早退时长或次数，计算的考勤扣款金额',1,0,1,1,1),(57,200,0,'考勤扣款合计',NULL,1,0,1,1,0),(58,200101,200,'考勤扣款合计','迟到、早退、旷工、缺卡、请假等6中异常考勤的扣款合计',1,0,1,1,0),(59,210,0,'应发工资',NULL,1,2,NULL,1,0),(60,210101,210,'应发工资','应发工资=员工工资总额-请假扣款-考勤扣款等',1,2,NULL,1,0),(61,220,0,'应税工资',NULL,1,2,NULL,1,0),(62,220101,220,'应税工资','应税工资=应发工资-个人社保-个人公积金-每月减除费用',1,2,NULL,1,0),(63,230,0,'个人所得税',NULL,1,2,NULL,1,0),(64,230101,230,'个人所得税','根据个税计算规则，计算的每月应缴纳个税',1,2,NULL,1,0),(65,240,0,'实发工资',NULL,1,2,NULL,1,0),(66,240101,240,'实发工资','员工每月获得的实际收入。',1,2,NULL,1,0);
/*!40000 ALTER TABLE `wk_hrm_salary_option_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_slip`
--

DROP TABLE IF EXISTS `wk_hrm_salary_slip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_slip` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工资条id',
  `record_id` int(11) NOT NULL COMMENT '工资条发放记录id',
  `s_emp_record_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL COMMENT '员工id',
  `year` int(11) DEFAULT NULL COMMENT '年',
  `month` int(11) DEFAULT NULL COMMENT '月',
  `read_status` int(11) NOT NULL DEFAULT '0' COMMENT '查看状态 0 未读 1 已读',
  `real_salary` decimal(10,2) NOT NULL COMMENT '实发工资',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发放时间',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建用户的id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `wk_hrm_salary_slip_read_status_index` (`read_status`) USING BTREE,
  KEY `wk_hrm_salary_slip_record_id_index` (`record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='工资条';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_slip`
--

LOCK TABLES `wk_hrm_salary_slip` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_slip` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_salary_slip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_slip_option`
--

DROP TABLE IF EXISTS `wk_hrm_salary_slip_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_slip_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工资条工资项id',
  `slip_id` int(11) NOT NULL COMMENT '工资条id',
  `name` varchar(20) NOT NULL COMMENT '薪资项名称',
  `type` int(11) NOT NULL COMMENT '选项类型 1 分类 2 薪资项',
  `code` int(11) NOT NULL DEFAULT '0' COMMENT '薪资项code',
  `value` varchar(50) NOT NULL DEFAULT '' COMMENT '薪资项value',
  `remark` varchar(50) NOT NULL DEFAULT '' COMMENT '备注',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级分类id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建用户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `wk_hrm_salary_slip_option_slip_id_index` (`slip_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='工资条工资项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_slip_option`
--

LOCK TABLES `wk_hrm_salary_slip_option` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_slip_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_salary_slip_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_slip_record`
--

DROP TABLE IF EXISTS `wk_hrm_salary_slip_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_slip_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '发工资条记录id',
  `s_record_id` int(11) NOT NULL COMMENT '每月薪资记录id',
  `salary_num` int(11) NOT NULL COMMENT '薪资表总人数',
  `pay_num` int(11) NOT NULL COMMENT '发放人数',
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建用户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `wk_hrm_salary_slip_record_year_month_index` (`year`,`month`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='发工资条记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_slip_record`
--

LOCK TABLES `wk_hrm_salary_slip_record` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_slip_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_salary_slip_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_slip_template`
--

DROP TABLE IF EXISTS `wk_hrm_salary_slip_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_slip_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工资表模板id',
  `template_name` varchar(20) NOT NULL COMMENT '工资表模板名称',
  `hide_empty` int(11) NOT NULL DEFAULT '0' COMMENT '是否隐藏空的工资项 0 不隐藏 1 隐藏',
  `default_option` int(11) NOT NULL DEFAULT '0' COMMENT '是否是默认模板项 0 否 1 是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='工资表模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_slip_template`
--

LOCK TABLES `wk_hrm_salary_slip_template` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_slip_template` DISABLE KEYS */;
INSERT INTO `wk_hrm_salary_slip_template` VALUES (1,'默认模板',0,1,'2020-11-24 21:20:42',0);
/*!40000 ALTER TABLE `wk_hrm_salary_slip_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_slip_template_option`
--

DROP TABLE IF EXISTS `wk_hrm_salary_slip_template_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_slip_template_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工资条模板id',
  `template_id` int(11) NOT NULL COMMENT '模板id',
  `name` varchar(20) NOT NULL COMMENT '薪资项名称',
  `type` int(11) NOT NULL COMMENT '选项类型 1 分类 2 薪资项',
  `code` int(11) NOT NULL DEFAULT '0' COMMENT '薪资项code',
  `remark` varchar(50) NOT NULL DEFAULT '' COMMENT '备注',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级分类id',
  `is_hide` int(11) NOT NULL DEFAULT '0' COMMENT '是否隐藏 0 否 1 是',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='工资条模板项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_slip_template_option`
--

LOCK TABLES `wk_hrm_salary_slip_template_option` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_slip_template_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_salary_slip_template_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_salary_tax_rule`
--

DROP TABLE IF EXISTS `wk_hrm_salary_tax_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_salary_tax_rule` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规则id',
  `rule_name` varchar(50) NOT NULL COMMENT '规则名称',
  `tax_type` int(11) DEFAULT NULL COMMENT '个税类型 1 工资薪金所得税 2 劳务报酬所得税 3 不计税',
  `is_tax` int(11) DEFAULT NULL COMMENT '是否计税 0 否 1 是',
  `marking_point` int(11) DEFAULT NULL COMMENT '起征点',
  `decimal_point` int(11) DEFAULT NULL COMMENT '个税结果(保留小数点)',
  `cycle_type` int(11) DEFAULT NULL COMMENT '计税周期类型 1 上年12月到今年11月（对应的工资发放方式为次月发上月工资） 2 今年1月到12月（对应的工资发放方式为当月发当月工资）',
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='计税规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_salary_tax_rule`
--

LOCK TABLES `wk_hrm_salary_tax_rule` WRITE;
/*!40000 ALTER TABLE `wk_hrm_salary_tax_rule` DISABLE KEYS */;
INSERT INTO `wk_hrm_salary_tax_rule` VALUES (49,'工资薪金所得税',1,1,5000,2,1),(50,'劳务报酬所得税',2,1,800,2,NULL),(51,'不计税',3,0,0,NULL,NULL);
/*!40000 ALTER TABLE `wk_hrm_salary_tax_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wk_hrm_user_attendance`
--

DROP TABLE IF EXISTS `wk_hrm_user_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wk_hrm_user_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `attendance_id` int(11) NOT NULL COMMENT '考勤组id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户和考勤组关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wk_hrm_user_attendance`
--

LOCK TABLES `wk_hrm_user_attendance` WRITE;
/*!40000 ALTER TABLE `wk_hrm_user_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `wk_hrm_user_attendance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-21 19:57:10
