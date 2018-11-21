/*
SQLyog v10.2 
MySQL - 5.6.30-log : Database - trade
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`trade` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `trade`;

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customer_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户OID',
  `real_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `customer_name` varchar(100) NOT NULL COMMENT '客户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `transaction_password` varchar(50) DEFAULT NULL COMMENT '交易密码',
  `alias` varchar(50) DEFAULT NULL COMMENT '别名(唯一,由用户或系统提供,字符+数字,位数不定),不能带名字,不能带uid,不能带id',
  `identification_no` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `mobile_no` varchar(20) NOT NULL COMMENT '手机号',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `age` smallint(6) DEFAULT NULL COMMENT '年龄',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `marriages` varchar(20) DEFAULT NULL COMMENT '婚姻',
  `qq_no` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `native_place` varchar(50) DEFAULT NULL COMMENT '籍贯地址',
  `nation` varchar(50) DEFAULT NULL COMMENT '籍贯',
  `industry` varchar(50) DEFAULT NULL COMMENT '从事行业',
  `contact_address` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `educational_background` varchar(20) DEFAULT NULL COMMENT '教育背景',
  `house_category` varchar(20) DEFAULT NULL COMMENT '住房',
  `current_province` varchar(20) DEFAULT NULL COMMENT '现居住省',
  `current_city` varchar(20) DEFAULT NULL COMMENT '现居住城市',
  `current_address` varchar(100) DEFAULT NULL COMMENT '现居住地址',
  `living_years` tinyint(4) DEFAULT NULL COMMENT '居住年限',
  `home_phone` varchar(20) DEFAULT NULL COMMENT '固话',
  `wechat_no` varchar(20) DEFAULT NULL COMMENT '微信号',
  `photo` varchar(200) DEFAULT NULL COMMENT '相片',
  `state` varchar(20) DEFAULT NULL COMMENT '会员状态（A:有效,I:无效如注销）',
  `rank` varchar(20) DEFAULT NULL COMMENT '用户等级',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`customer_oid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='客户';

/*Data for the table `customer` */

LOCK TABLES `customer` WRITE;

insert  into `customer`(`customer_oid`,`real_name`,`customer_name`,`password`,`transaction_password`,`alias`,`identification_no`,`mobile_no`,`email`,`birthday`,`age`,`sex`,`marriages`,`qq_no`,`native_place`,`nation`,`industry`,`contact_address`,`educational_background`,`house_category`,`current_province`,`current_city`,`current_address`,`living_years`,`home_phone`,`wechat_no`,`photo`,`state`,`rank`,`create_by`,`create_time`,`update_by`,`update_time`,`version_no`) values (1,'sa','sanlee','123','123',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2018-07-31 10:03:23',NULL,NULL,0),(2,'sa2','sanli','',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2018-07-31 10:04:02',NULL,NULL,0);

UNLOCK TABLES;

/*Table structure for table `delivery_goods` */

DROP TABLE IF EXISTS `delivery_goods`;

CREATE TABLE `delivery_goods` (
  `delivery_goods_oid` bigint(20) NOT NULL COMMENT '发货OID',
  `order_oid` bigint(20) DEFAULT NULL COMMENT '订单OID',
  `delivery_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发货时间',
  `delivery_comment` varchar(500) DEFAULT NULL COMMENT '发货备注',
  `state` varchar(10) DEFAULT NULL COMMENT '发货状态',
  `delivery_quantity` tinyint(4) DEFAULT NULL COMMENT '发货数量',
  `delivery_supplier` varchar(50) DEFAULT NULL COMMENT '发货供应商',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`delivery_goods_oid`),
  KEY `FK_Reference_36` (`order_oid`),
  CONSTRAINT `FK_Reference_36` FOREIGN KEY (`order_oid`) REFERENCES `orders` (`orders_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发货';

/*Data for the table `delivery_goods` */

LOCK TABLES `delivery_goods` WRITE;

UNLOCK TABLES;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `department_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键OID',
  `department_name` varchar(50) NOT NULL COMMENT '部门名称',
  `department_code` varchar(50) NOT NULL COMMENT '部门代号',
  `is_first` char(1) DEFAULT NULL COMMENT '是否第一级部门',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `state` varchar(20) DEFAULT NULL COMMENT '状态',
  `operation` varchar(50) DEFAULT NULL COMMENT '操作',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`department_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='department';

/*Data for the table `department` */

LOCK TABLES `department` WRITE;

UNLOCK TABLES;

/*Table structure for table `department_role` */

DROP TABLE IF EXISTS `department_role`;

CREATE TABLE `department_role` (
  `department_role_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门角色OID',
  `department_oid` bigint(20) DEFAULT NULL COMMENT '主键OID',
  `role_oid` bigint(20) DEFAULT NULL COMMENT '角色OID',
  `operation` varchar(50) DEFAULT NULL COMMENT '操作',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`department_role_oid`),
  KEY `FK_Reference_15` (`department_oid`),
  KEY `FK_Reference_16` (`role_oid`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`department_oid`) REFERENCES `department` (`department_oid`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`role_oid`) REFERENCES `role` (`role_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='department_role';

/*Data for the table `department_role` */

LOCK TABLES `department_role` WRITE;

UNLOCK TABLES;

/*Table structure for table `donation_cash_detail` */

DROP TABLE IF EXISTS `donation_cash_detail`;

CREATE TABLE `donation_cash_detail` (
  `donation_cash_detail_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '捐赠资金流水OID',
  `company_cash_oid` bigint(20) DEFAULT NULL COMMENT '平台帐户OID',
  `transaction_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '交易时间',
  `transaction_amount` decimal(15,2) DEFAULT NULL COMMENT '交易金额',
  `balance` decimal(15,2) DEFAULT NULL COMMENT '余额',
  `year` smallint(6) DEFAULT NULL COMMENT '年份',
  `month` smallint(6) DEFAULT NULL COMMENT '月份',
  `day` smallint(6) DEFAULT NULL COMMENT '天数',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`donation_cash_detail_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='捐赠资金流水';

/*Data for the table `donation_cash_detail` */

LOCK TABLES `donation_cash_detail` WRITE;

UNLOCK TABLES;

/*Table structure for table `email` */

DROP TABLE IF EXISTS `email`;

CREATE TABLE `email` (
  `email_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键OID',
  `receive_oid` bigint(20) DEFAULT NULL COMMENT '接收客户OID',
  `receive_name` varchar(100) DEFAULT NULL COMMENT '接收客户名',
  `subject` varchar(200) DEFAULT NULL COMMENT '主题',
  `state` varchar(50) DEFAULT NULL COMMENT '状态',
  `content` longtext NOT NULL COMMENT '内容',
  `send_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发送日期',
  `receive_date` timestamp NULL DEFAULT NULL COMMENT '接受日期',
  `mobile_number` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`email_oid`),
  KEY `FK_Reference_24` (`receive_oid`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`receive_oid`) REFERENCES `customer` (`customer_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发邮件';

/*Data for the table `email` */

LOCK TABLES `email` WRITE;

UNLOCK TABLES;

/*Table structure for table `fee_type` */

DROP TABLE IF EXISTS `fee_type`;

CREATE TABLE `fee_type` (
  `fee_type_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键OID',
  `fee_code` varchar(50) DEFAULT NULL COMMENT '费用编码',
  `fee_name` varchar(20) DEFAULT NULL COMMENT '费用名称',
  `fee_type` varchar(20) DEFAULT NULL COMMENT '费用类型 ( 收入与支出）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`fee_type_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='fee_type';

/*Data for the table `fee_type` */

LOCK TABLES `fee_type` WRITE;

UNLOCK TABLES;

/*Table structure for table `function_item` */

DROP TABLE IF EXISTS `function_item`;

CREATE TABLE `function_item` (
  `function_item_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键OID',
  `module_oid` bigint(20) DEFAULT NULL COMMENT '主键OID',
  `function_name` varchar(50) NOT NULL COMMENT '功能名称',
  `function_code` varchar(100) NOT NULL COMMENT '功能代号',
  `function_icon` varchar(200) NOT NULL COMMENT '功能图片',
  `function_action` varchar(200) NOT NULL COMMENT '功能URL',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `state` varchar(20) DEFAULT NULL COMMENT '状态',
  `operation` varchar(20) DEFAULT NULL COMMENT '操作',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`function_item_oid`),
  KEY `FK_Reference_20` (`module_oid`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`module_oid`) REFERENCES `module` (`module_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='function_item';

/*Data for the table `function_item` */

LOCK TABLES `function_item` WRITE;

UNLOCK TABLES;

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `goods_oid` bigint(20) NOT NULL COMMENT '商品OID',
  `supplier_oid` bigint(20) DEFAULT NULL COMMENT '供应商OID',
  `goods_category_oid` bigint(20) DEFAULT NULL COMMENT '商品分类OID',
  `goods_code` varchar(50) DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `goods_price` decimal(12,2) DEFAULT NULL COMMENT '商品价格',
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT '成本价格',
  `donation_amount` decimal(10,2) DEFAULT NULL COMMENT '捐赠金额',
  `donation_percentage` decimal(10,2) DEFAULT NULL COMMENT '捐赠比率',
  `effective_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '生效时间',
  `state` varchar(10) DEFAULT NULL COMMENT '状态',
  `length` decimal(10,2) DEFAULT NULL COMMENT '长',
  `width` decimal(10,2) DEFAULT NULL COMMENT '宽',
  `height` varchar(20) DEFAULT NULL COMMENT '高',
  `unit` decimal(10,2) DEFAULT NULL COMMENT '单位',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '重量',
  `size` decimal(10,2) DEFAULT NULL COMMENT '大小',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`goods_oid`),
  KEY `FK_Reference_6` (`supplier_oid`),
  KEY `FK_Reference_11` (`goods_category_oid`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`goods_category_oid`) REFERENCES `goods_category` (`goods_category_oid`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`supplier_oid`) REFERENCES `supplier` (`supplier_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

/*Data for the table `goods` */

LOCK TABLES `goods` WRITE;

UNLOCK TABLES;

/*Table structure for table `goods_category` */

DROP TABLE IF EXISTS `goods_category`;

CREATE TABLE `goods_category` (
  `goods_category_oid` bigint(20) NOT NULL COMMENT '商品分类OID',
  `category_code` varchar(20) DEFAULT NULL COMMENT '分类编号',
  `category_name` varchar(50) DEFAULT NULL COMMENT '分类名',
  `remark` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`goods_category_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类';

/*Data for the table `goods_category` */

LOCK TABLES `goods_category` WRITE;

UNLOCK TABLES;

/*Table structure for table `goods_damage` */

DROP TABLE IF EXISTS `goods_damage`;

CREATE TABLE `goods_damage` (
  `goods_damage_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键OID',
  `warehouse_unit_oid` bigint(20) DEFAULT NULL COMMENT '主键OID',
  `goods_oid` bigint(20) DEFAULT NULL COMMENT '商品OID',
  `quantity` bigint(20) DEFAULT NULL COMMENT '数量',
  `unit` varchar(10) DEFAULT NULL COMMENT '单位',
  `damage_date` date DEFAULT NULL COMMENT '出库日期',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`goods_damage_oid`),
  KEY `FK_Reference_5` (`warehouse_unit_oid`),
  KEY `FK_Reference_10` (`goods_oid`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`goods_oid`) REFERENCES `goods` (`goods_oid`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`warehouse_unit_oid`) REFERENCES `warehouse_unit` (`warehouse_unit_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报损';

/*Data for the table `goods_damage` */

LOCK TABLES `goods_damage` WRITE;

UNLOCK TABLES;

/*Table structure for table `grant_coupon` */

DROP TABLE IF EXISTS `grant_coupon`;

CREATE TABLE `grant_coupon` (
  `grant_coupon_oid` bigint(20) NOT NULL COMMENT '优惠券OID',
  `coupon_name` varchar(100) DEFAULT NULL COMMENT '优惠券名称',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT '优惠券编码',
  `remark` varchar(500) DEFAULT NULL COMMENT '描述',
  `state` varchar(10) DEFAULT NULL COMMENT '状态',
  `effective_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '有效时间',
  `coupon_quantity` tinyint(4) DEFAULT NULL COMMENT '优惠券数量',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券金额',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`grant_coupon_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发放优惠券';

/*Data for the table `grant_coupon` */

LOCK TABLES `grant_coupon` WRITE;

UNLOCK TABLES;

/*Table structure for table `inventory` */

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `inventory_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键OID',
  `warehouse_unit_oid` bigint(20) DEFAULT NULL COMMENT '主键OID',
  `goods_oid` bigint(20) DEFAULT NULL COMMENT '商品OID',
  `quantity` bigint(20) DEFAULT NULL COMMENT '数量',
  `unit` varchar(10) DEFAULT NULL COMMENT '单位',
  `inventory_date` date DEFAULT NULL COMMENT '盘点日期',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`inventory_oid`),
  KEY `FK_Reference_4` (`warehouse_unit_oid`),
  KEY `FK_Reference_9` (`goods_oid`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`warehouse_unit_oid`) REFERENCES `warehouse_unit` (`warehouse_unit_oid`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`goods_oid`) REFERENCES `goods` (`goods_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='盘点';

/*Data for the table `inventory` */

LOCK TABLES `inventory` WRITE;

UNLOCK TABLES;

/*Table structure for table `logistics` */

DROP TABLE IF EXISTS `logistics`;

CREATE TABLE `logistics` (
  `logistics_oid` bigint(20) NOT NULL COMMENT '物流OID',
  `order_oid` bigint(20) DEFAULT NULL COMMENT '订单OID',
  `logistics_company` varchar(100) DEFAULT NULL COMMENT '物流公司',
  `last_station` varchar(100) DEFAULT NULL COMMENT '上一站名',
  `current_station` varchar(100) DEFAULT NULL COMMENT '当前站名',
  `last_arrival_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上一站到达时间',
  `current_arrival_time` timestamp NULL DEFAULT NULL COMMENT '当前站到达时间',
  `contact_person` varchar(50) DEFAULT NULL COMMENT '联系人',
  `contact_telephone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `scan_person` varchar(50) DEFAULT NULL COMMENT '扫描人',
  `package_person` varchar(50) DEFAULT NULL COMMENT '打包人',
  `is_completed` char(1) DEFAULT NULL COMMENT '是否签收完成',
  `state` varchar(10) DEFAULT NULL COMMENT '状态',
  `remark` varchar(200) DEFAULT NULL COMMENT '描述',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`logistics_oid`),
  KEY `FK_Reference_35` (`order_oid`),
  CONSTRAINT `FK_Reference_35` FOREIGN KEY (`order_oid`) REFERENCES `orders` (`orders_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物流';

/*Data for the table `logistics` */

LOCK TABLES `logistics` WRITE;

UNLOCK TABLES;

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `message_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键OID',
  `receive_oid` bigint(20) DEFAULT NULL COMMENT '接收人OID',
  `subject` varchar(50) DEFAULT NULL COMMENT '主题',
  `state` varchar(50) DEFAULT NULL COMMENT '状态',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `callback_code` varchar(100) DEFAULT NULL COMMENT '回执代码',
  `content` varchar(1000) NOT NULL COMMENT '内容',
  `send_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发送日期',
  `receive_date` timestamp NULL DEFAULT NULL COMMENT '接受日期',
  `mobile_number` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`message_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短消息';

/*Data for the table `message` */

LOCK TABLES `message` WRITE;

UNLOCK TABLES;

/*Table structure for table `module` */

DROP TABLE IF EXISTS `module`;

CREATE TABLE `module` (
  `module_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键OID',
  `module_name` varchar(50) NOT NULL COMMENT '模块名',
  `module_code` varchar(100) NOT NULL COMMENT '模块编码',
  `state` varchar(20) DEFAULT NULL COMMENT '状态',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`module_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='module';

/*Data for the table `module` */

LOCK TABLES `module` WRITE;

UNLOCK TABLES;

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `notice_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `notice_category_oid` bigint(20) DEFAULT NULL COMMENT '通知分类OID',
  `title` varchar(500) DEFAULT NULL COMMENT '标题',
  `page_title` varchar(500) DEFAULT NULL COMMENT '页面标题',
  `content` longtext COMMENT '内容',
  `keyword` varchar(500) DEFAULT NULL COMMENT '关键字',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `hit` bigint(20) DEFAULT NULL COMMENT '点击数',
  `is_hot` varchar(1) DEFAULT NULL COMMENT '是否热门',
  `summary` varchar(500) DEFAULT NULL COMMENT '新闻公告简介',
  `subtitle` varchar(500) DEFAULT NULL COMMENT '副标题',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`notice_oid`),
  KEY `FK_Reference_21` (`notice_category_oid`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`notice_category_oid`) REFERENCES `notice_category` (`notice_category_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公告';

/*Data for the table `notice` */

LOCK TABLES `notice` WRITE;

UNLOCK TABLES;

/*Table structure for table `notice_category` */

DROP TABLE IF EXISTS `notice_category`;

CREATE TABLE `notice_category` (
  `notice_category_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(100) DEFAULT NULL COMMENT '编码',
  `name` varchar(100) DEFAULT NULL COMMENT '分类名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`notice_category_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公告分类';

/*Data for the table `notice_category` */

LOCK TABLES `notice_category` WRITE;

UNLOCK TABLES;

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `orders_oid` bigint(20) NOT NULL COMMENT '订单OID',
  `customer_oid` bigint(20) DEFAULT NULL COMMENT '客户OID',
  `order_code` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `state` varchar(10) DEFAULT NULL COMMENT '订单状态(F:完成,D:发货中,R:退货中,RM:退款中)',
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '订单时间',
  `effective_time` timestamp NULL DEFAULT NULL COMMENT '有效时间',
  `pay_type` varchar(10) DEFAULT NULL COMMENT '支付方式(C:现金,O:在线,AP:货到付款)',
  `order_comment` varchar(500) DEFAULT NULL COMMENT '订单备注',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`orders_oid`),
  KEY `FK_Reference_31` (`customer_oid`),
  CONSTRAINT `FK_Reference_31` FOREIGN KEY (`customer_oid`) REFERENCES `customer` (`customer_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';

/*Data for the table `orders` */

LOCK TABLES `orders` WRITE;

UNLOCK TABLES;

/*Table structure for table `query_condition` */

DROP TABLE IF EXISTS `query_condition`;

CREATE TABLE `query_condition` (
  `query_condition_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键OID',
  `code` varchar(20) DEFAULT NULL COMMENT '编号',
  `query_name` varchar(50) DEFAULT NULL COMMENT '表名,视图名',
  `column_name` varchar(50) DEFAULT NULL COMMENT '查询字段名',
  `alias_name` varchar(20) DEFAULT NULL COMMENT '别名',
  `prop_name` varchar(20) DEFAULT NULL COMMENT '对象属性名',
  `data_type` varchar(1) DEFAULT NULL COMMENT '数据类型->D：日期，C：集合',
  `content` longtext COMMENT '集合内容（静态数据）',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`query_condition_oid`),
  KEY `qc_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='query_condition';

/*Data for the table `query_condition` */

LOCK TABLES `query_condition` WRITE;

UNLOCK TABLES;

/*Table structure for table `question_answer` */

DROP TABLE IF EXISTS `question_answer`;

CREATE TABLE `question_answer` (
  `question_answer_oid` bigint(20) NOT NULL COMMENT '主健OID',
  `answer_content` longtext COMMENT '问题标题',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`question_answer_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提问答复';

/*Data for the table `question_answer` */

LOCK TABLES `question_answer` WRITE;

UNLOCK TABLES;

/*Table structure for table `question_list` */

DROP TABLE IF EXISTS `question_list`;

CREATE TABLE `question_list` (
  `question_list_oid` bigint(20) NOT NULL COMMENT '主健OID',
  `question_title` varchar(200) DEFAULT NULL COMMENT '问题标题',
  `question_content` longtext COMMENT '问题内容',
  `question_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '提问时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`question_list_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题列表';

/*Data for the table `question_list` */

LOCK TABLES `question_list` WRITE;

UNLOCK TABLES;

/*Table structure for table `return_goods` */

DROP TABLE IF EXISTS `return_goods`;

CREATE TABLE `return_goods` (
  `return_goods_oid` bigint(20) NOT NULL COMMENT '退货OID',
  `order_oid` bigint(20) DEFAULT NULL COMMENT '订单OID',
  `application_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '申请时间',
  `return_comment` varchar(500) DEFAULT NULL COMMENT '退货备注',
  `state` varchar(10) DEFAULT NULL COMMENT '退货状态',
  `return_quantity` tinyint(4) DEFAULT NULL COMMENT '退货数量',
  `return_amount` decimal(10,2) DEFAULT NULL COMMENT '退货金额',
  `return_reason` varchar(500) DEFAULT NULL COMMENT '退货原因',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`return_goods_oid`),
  KEY `FK_Reference_38` (`order_oid`),
  CONSTRAINT `FK_Reference_38` FOREIGN KEY (`order_oid`) REFERENCES `orders` (`orders_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退货';

/*Data for the table `return_goods` */

LOCK TABLES `return_goods` WRITE;

UNLOCK TABLES;

/*Table structure for table `return_goods_audit` */

DROP TABLE IF EXISTS `return_goods_audit`;

CREATE TABLE `return_goods_audit` (
  `return_goods_audit_oid` bigint(20) NOT NULL COMMENT '退货审批OID',
  `order_oid` bigint(20) DEFAULT NULL COMMENT '订单OID',
  `audit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '审批时间',
  `audit_comment` varchar(500) DEFAULT NULL COMMENT '审批意见',
  `state` varchar(10) DEFAULT NULL COMMENT '状态',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`return_goods_audit_oid`),
  KEY `FK_Reference_37` (`order_oid`),
  CONSTRAINT `FK_Reference_37` FOREIGN KEY (`order_oid`) REFERENCES `orders` (`orders_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退货审批';

/*Data for the table `return_goods_audit` */

LOCK TABLES `return_goods_audit` WRITE;

UNLOCK TABLES;

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色OID',
  `role_code` varchar(100) DEFAULT NULL COMMENT '角色代号',
  `name` varchar(50) NOT NULL COMMENT '角色名',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `state` varchar(20) DEFAULT NULL COMMENT '状态',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`role_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='role';

/*Data for the table `role` */

LOCK TABLES `role` WRITE;

UNLOCK TABLES;

/*Table structure for table `seller_cash` */

DROP TABLE IF EXISTS `seller_cash`;

CREATE TABLE `seller_cash` (
  `seller_cash_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商家资金OID',
  `total_amount` decimal(15,2) DEFAULT NULL COMMENT '个人资金总金额',
  `balance` decimal(15,2) DEFAULT NULL COMMENT '可用余额',
  `freeze_amount` decimal(15,2) DEFAULT NULL COMMENT '冻结资金',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`seller_cash_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家资金';

/*Data for the table `seller_cash` */

LOCK TABLES `seller_cash` WRITE;

UNLOCK TABLES;

/*Table structure for table `seller_cash_detail` */

DROP TABLE IF EXISTS `seller_cash_detail`;

CREATE TABLE `seller_cash_detail` (
  `seller_cash_detail_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资金明细OID',
  `order_code` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `transaction_amount` decimal(15,2) DEFAULT NULL COMMENT '交易金额',
  `transaction_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '交易时间',
  `balance` decimal(15,2) DEFAULT NULL COMMENT '可用余额',
  `total_amount` decimal(15,2) DEFAULT NULL COMMENT '总金额',
  `freeze_amount` decimal(15,2) DEFAULT NULL COMMENT '冻结金额',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`seller_cash_detail_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家资金流水';

/*Data for the table `seller_cash_detail` */

LOCK TABLES `seller_cash_detail` WRITE;

UNLOCK TABLES;

/*Table structure for table `seller_entering_condition` */

DROP TABLE IF EXISTS `seller_entering_condition`;

CREATE TABLE `seller_entering_condition` (
  `seller_entering_condition_oid` bigint(20) NOT NULL COMMENT '商家入驻条件OID',
  `guarentee_amount` decimal(10,2) DEFAULT NULL COMMENT '保证金',
  `annual_percentage` decimal(10,2) DEFAULT NULL COMMENT '年费扣点',
  `unit` varchar(10) DEFAULT NULL COMMENT '单位',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`seller_entering_condition_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家入驻条件';

/*Data for the table `seller_entering_condition` */

LOCK TABLES `seller_entering_condition` WRITE;

UNLOCK TABLES;

/*Table structure for table `seller_evaluation` */

DROP TABLE IF EXISTS `seller_evaluation`;

CREATE TABLE `seller_evaluation` (
  `seller_evaluation_oid` bigint(20) NOT NULL COMMENT '商家评价OID',
  `star_quantity` bigint(20) DEFAULT NULL COMMENT '星级评价',
  `evaluation_rank` varchar(10) DEFAULT NULL COMMENT '评价等级(G:好评,M:中评,B:差评)',
  `good_evaluation_percentage` decimal(5,2) DEFAULT NULL COMMENT '好评比例',
  `bad_evaluation_percentage` decimal(5,2) DEFAULT NULL COMMENT '中评比例',
  `media_evaluation_percentage` decimal(5,2) DEFAULT NULL COMMENT '差评比例',
  `comment` varchar(1000) DEFAULT NULL COMMENT '评论',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`seller_evaluation_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家评价';

/*Data for the table `seller_evaluation` */

LOCK TABLES `seller_evaluation` WRITE;

UNLOCK TABLES;

/*Table structure for table `shared_photo` */

DROP TABLE IF EXISTS `shared_photo`;

CREATE TABLE `shared_photo` (
  `shared_photo_oid` bigint(20) NOT NULL COMMENT '晒图OID',
  `customer_oid` bigint(20) DEFAULT NULL COMMENT '客户OID',
  `comment` varchar(1000) DEFAULT NULL COMMENT '评论',
  `shared_photo_address` varchar(1000) DEFAULT NULL COMMENT '晒图地址',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`shared_photo_oid`),
  KEY `FK_Reference_39` (`customer_oid`),
  CONSTRAINT `FK_Reference_39` FOREIGN KEY (`customer_oid`) REFERENCES `customer` (`customer_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='晒图';

/*Data for the table `shared_photo` */

LOCK TABLES `shared_photo` WRITE;

UNLOCK TABLES;

/*Table structure for table `stock_in` */

DROP TABLE IF EXISTS `stock_in`;

CREATE TABLE `stock_in` (
  `stock_in_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键OID',
  `warehouse_unit_oid` bigint(20) DEFAULT NULL COMMENT '主键OID',
  `goods_oid` bigint(20) DEFAULT NULL COMMENT '商品OID',
  `quantity` bigint(20) DEFAULT NULL COMMENT '数量',
  `unit` varchar(10) DEFAULT NULL COMMENT '单位',
  `store_date` date DEFAULT NULL COMMENT '入库日期',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`stock_in_oid`),
  KEY `FK_Reference_2` (`warehouse_unit_oid`),
  KEY `FK_Reference_7` (`goods_oid`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`warehouse_unit_oid`) REFERENCES `warehouse_unit` (`warehouse_unit_oid`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`goods_oid`) REFERENCES `goods` (`goods_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库';

/*Data for the table `stock_in` */

LOCK TABLES `stock_in` WRITE;

UNLOCK TABLES;

/*Table structure for table `stock_out` */

DROP TABLE IF EXISTS `stock_out`;

CREATE TABLE `stock_out` (
  `stock_out_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键OID',
  `warehouse_unit_oid` bigint(20) DEFAULT NULL COMMENT '主键OID',
  `goods_oid` bigint(20) DEFAULT NULL COMMENT '商品OID',
  `quantity` bigint(20) DEFAULT NULL COMMENT '数量',
  `unit` varchar(10) DEFAULT NULL COMMENT '单位',
  `deliver_date` date DEFAULT NULL COMMENT '出库日期',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`stock_out_oid`),
  KEY `FK_Reference_3` (`warehouse_unit_oid`),
  KEY `FK_Reference_8` (`goods_oid`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`warehouse_unit_oid`) REFERENCES `warehouse_unit` (`warehouse_unit_oid`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`goods_oid`) REFERENCES `goods` (`goods_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出库';

/*Data for the table `stock_out` */

LOCK TABLES `stock_out` WRITE;

UNLOCK TABLES;

/*Table structure for table `storefront` */

DROP TABLE IF EXISTS `storefront`;

CREATE TABLE `storefront` (
  `storefront_oid` bigint(20) NOT NULL COMMENT '店铺OID',
  `storefront_name` varchar(100) DEFAULT NULL COMMENT '店铺名',
  `storefront_code` varchar(50) DEFAULT NULL COMMENT '店铺编号',
  `setup_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '成立时间',
  `state` varchar(10) DEFAULT NULL COMMENT '商家状态（A:有效,I:无效如注销）',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`storefront_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺';

/*Data for the table `storefront` */

LOCK TABLES `storefront` WRITE;

UNLOCK TABLES;

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `supplier_oid` bigint(20) NOT NULL COMMENT '供应商OID',
  `supplier_name` varchar(100) DEFAULT NULL COMMENT '供应商',
  `state` varchar(10) DEFAULT NULL COMMENT '状态',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `supplier_category` varchar(200) DEFAULT NULL COMMENT '供应商分类',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`supplier_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商';

/*Data for the table `supplier` */

LOCK TABLES `supplier` WRITE;

UNLOCK TABLES;

/*Table structure for table `text_message` */

DROP TABLE IF EXISTS `text_message`;

CREATE TABLE `text_message` (
  `text_message_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键OID',
  `send_oid` bigint(20) DEFAULT NULL COMMENT '发送人OID',
  `receive_oid` bigint(20) DEFAULT NULL COMMENT '接收人OID',
  `subject` varchar(50) NOT NULL COMMENT '主题',
  `content` varchar(1000) NOT NULL COMMENT '内容',
  `send_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发送日期',
  `receive_date` timestamp NULL DEFAULT NULL COMMENT '接受日期',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`text_message_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内消息';

/*Data for the table `text_message` */

LOCK TABLES `text_message` WRITE;

UNLOCK TABLES;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '员工OID',
  `user_group_oid` bigint(20) DEFAULT NULL COMMENT '用户组OID',
  `real_name` varchar(50) NOT NULL COMMENT '真实姓名',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `alias` varchar(50) DEFAULT NULL COMMENT '别名(唯一,由用户或系统提供,字符+数字,位数不定),不能带名字,不能带uid,不能带id',
  `identification_no` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `mobile_no` varchar(20) NOT NULL COMMENT '手机号',
  `email` varchar(30) NOT NULL COMMENT '邮箱',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `age` smallint(6) DEFAULT NULL COMMENT '年龄',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `marriages` char(1) DEFAULT NULL COMMENT '婚姻',
  `qq_no` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `native_place` varchar(50) DEFAULT NULL COMMENT '籍贯所在地',
  `nation` varchar(50) DEFAULT NULL COMMENT '籍贯',
  `industry` varchar(50) DEFAULT NULL COMMENT '行业',
  `contact_address` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `educational_background` varchar(20) DEFAULT NULL COMMENT '教育背景',
  `enter_date` date DEFAULT NULL COMMENT '进入日期',
  `user_code` varchar(20) NOT NULL COMMENT '员工编号',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`user_oid`),
  KEY `FK_Reference_12` (`user_group_oid`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`user_group_oid`) REFERENCES `user_group` (`user_group_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user';

/*Data for the table `user` */

LOCK TABLES `user` WRITE;

UNLOCK TABLES;

/*Table structure for table `user_coupon` */

DROP TABLE IF EXISTS `user_coupon`;

CREATE TABLE `user_coupon` (
  `user_coupon_oid` bigint(20) NOT NULL COMMENT '领取优惠券OID',
  `remark` varchar(500) DEFAULT NULL COMMENT '描述',
  `state` varchar(10) DEFAULT NULL COMMENT '状态',
  `got_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '领用时间',
  `got_quantity` tinyint(4) DEFAULT NULL COMMENT '领用优惠券数量',
  `used_quantity` tinyint(4) DEFAULT NULL COMMENT '使用优惠券金额',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`user_coupon_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人领用优惠券';

/*Data for the table `user_coupon` */

LOCK TABLES `user_coupon` WRITE;

UNLOCK TABLES;

/*Table structure for table `user_group` */

DROP TABLE IF EXISTS `user_group`;

CREATE TABLE `user_group` (
  `user_group_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户组OID',
  `department_oid` bigint(20) DEFAULT NULL COMMENT '主键OID',
  `name` varchar(50) NOT NULL COMMENT '组名',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `state` varchar(20) DEFAULT NULL COMMENT '状态',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`user_group_oid`),
  KEY `FK_Reference_19` (`department_oid`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`department_oid`) REFERENCES `department` (`department_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user_group';

/*Data for the table `user_group` */

LOCK TABLES `user_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_role_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户角色OID',
  `user_oid` bigint(20) DEFAULT NULL COMMENT '员工OID',
  `role_oid` bigint(20) DEFAULT NULL COMMENT '角色OID',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`user_role_oid`),
  KEY `FK_Reference_13` (`user_oid`),
  KEY `FK_Reference_14` (`role_oid`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`user_oid`) REFERENCES `user` (`user_oid`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`role_oid`) REFERENCES `role` (`role_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user_role';

/*Data for the table `user_role` */

LOCK TABLES `user_role` WRITE;

UNLOCK TABLES;

/*Table structure for table `warehouse` */

DROP TABLE IF EXISTS `warehouse`;

CREATE TABLE `warehouse` (
  `warehouse_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键OID',
  `warehouse_code` varchar(50) DEFAULT NULL COMMENT '仓库编号',
  `warehouse_name` varchar(100) DEFAULT NULL COMMENT '仓库名',
  `area` decimal(12,2) DEFAULT NULL COMMENT '面积',
  `state` varchar(50) DEFAULT NULL COMMENT '状态',
  `mobile_number` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`warehouse_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库';

/*Data for the table `warehouse` */

LOCK TABLES `warehouse` WRITE;

UNLOCK TABLES;

/*Table structure for table `warehouse_unit` */

DROP TABLE IF EXISTS `warehouse_unit`;

CREATE TABLE `warehouse_unit` (
  `warehouse_unit_oid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键OID',
  `warehouse_oid` bigint(20) DEFAULT NULL COMMENT '主键OID',
  `warehouse_unit_code` varchar(50) DEFAULT NULL COMMENT '仓位编号',
  `warehouse_unit_name` varchar(100) DEFAULT NULL COMMENT '仓位名',
  `area` decimal(12,2) DEFAULT NULL COMMENT '面积',
  `state` varchar(50) DEFAULT NULL COMMENT '状态',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `create_by` bigint(20) NOT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`warehouse_unit_oid`),
  KEY `FK_Reference_1` (`warehouse_oid`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`warehouse_oid`) REFERENCES `warehouse` (`warehouse_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓位';

/*Data for the table `warehouse_unit` */

LOCK TABLES `warehouse_unit` WRITE;

UNLOCK TABLES;

/*Table structure for table `winning_lottery` */

DROP TABLE IF EXISTS `winning_lottery`;

CREATE TABLE `winning_lottery` (
  `winning_lottery_oid` bigint(20) NOT NULL COMMENT '主健OID',
  `announce_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '揭晓时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人OID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人OID',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version_no` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`winning_lottery_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='中奖';

/*Data for the table `winning_lottery` */

LOCK TABLES `winning_lottery` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
