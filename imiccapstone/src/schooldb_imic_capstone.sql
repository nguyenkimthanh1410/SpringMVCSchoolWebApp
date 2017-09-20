-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: schooldb
-- ------------------------------------------------------
-- Server version	5.6.37-log

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

CREATE DATABASE schooldb;

USE schooldb;
--
-- Table structure for table `tblclass`
--

DROP TABLE IF EXISTS `tblclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblclass` (
  `sClassId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sClassName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `teacherId` bigint(20) unsigned DEFAULT NULL,
  `lastUpdated` date DEFAULT NULL,
  `lastUpdatedBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sClassId`),
  KEY `teacherId_idx` (`teacherId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblclass`
--

LOCK TABLES `tblclass` WRITE;
/*!40000 ALTER TABLE `tblclass` DISABLE KEYS */;
INSERT INTO `tblclass` VALUES (1,'Java core 1','2017-09-10','2017-10-10',22,'2017-09-16','thanh'),(2,'Java core','2017-09-10','2017-10-10',22,'2017-09-16','thanh'),(3,'Python1','2017-09-16','2017-09-23',25,'2017-09-16','thanh'),(4,'Python 2','2017-09-16','2017-09-30',25,'2017-09-16','thanh'),(5,'J2EE-1','2017-09-17','2017-10-14',22,'2017-09-16','thanh'),(6,'DAS-1','2017-09-16','2017-10-07',22,'2017-09-16','thanh'),(7,'Computer Architecture -1','2017-09-28','2017-10-04',25,'2017-09-16','thanh'),(8,'Psychology -1','2017-09-30','2017-10-28',26,'2017-09-16','admin'),(9,'Electronic Automation','2017-09-27','2017-09-26',22,'2017-09-16','admin'),(10,'sdsf','2017-09-17','2017-09-17',22,'2017-09-17','thanh'),(11,'Testing class -2','2017-09-17','2017-09-17',26,'2017-09-17','thanh');
/*!40000 ALTER TABLE `tblclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpermission`
--

DROP TABLE IF EXISTS `tblpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpermission` (
  `permissionId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `permissionNAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `vName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `function` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`permissionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpermission`
--

LOCK TABLES `tblpermission` WRITE;
/*!40000 ALTER TABLE `tblpermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblregistration`
--

DROP TABLE IF EXISTS `tblregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblregistration` (
  `regisId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) unsigned NOT NULL,
  `sClassId` bigint(20) unsigned NOT NULL,
  `regisDate` date NOT NULL,
  `lastUpdated` date DEFAULT NULL,
  `lastUpdatedBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`regisId`),
  KEY `FK_registration_class` (`sClassId`),
  KEY `fk_registration_user_idx` (`userId`),
  CONSTRAINT `fk_registration_class` FOREIGN KEY (`sClassId`) REFERENCES `tblclass` (`sClassId`),
  CONSTRAINT `fk_registration_user` FOREIGN KEY (`userId`) REFERENCES `tbluser` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblregistration`
--

LOCK TABLES `tblregistration` WRITE;
/*!40000 ALTER TABLE `tblregistration` DISABLE KEYS */;
INSERT INTO `tblregistration` VALUES (1,24,4,'2017-09-25','2017-09-17','thanh'),(2,24,8,'2017-09-17','2017-09-17','thanh'),(3,24,9,'2017-09-17','2017-09-17','thanh'),(4,24,5,'2017-09-21','2017-09-17','thanh');
/*!40000 ALTER TABLE `tblregistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrole`
--

DROP TABLE IF EXISTS `tblrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrole` (
  `roleId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrole`
--

LOCK TABLES `tblrole` WRITE;
/*!40000 ALTER TABLE `tblrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrolepermission`
--

DROP TABLE IF EXISTS `tblrolepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrolepermission` (
  `rolePermId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `roleId` bigint(20) unsigned NOT NULL,
  `permissionId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`rolePermId`),
  KEY `fk_rolepermission_role` (`roleId`),
  KEY `fk_rolepermission_permission` (`permissionId`),
  CONSTRAINT `fk_rolepermission_permission` FOREIGN KEY (`permissionId`) REFERENCES `tblpermission` (`permissionId`),
  CONSTRAINT `fk_rolepermission_role` FOREIGN KEY (`roleId`) REFERENCES `tblrole` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrolepermission`
--

LOCK TABLES `tblrolepermission` WRITE;
/*!40000 ALTER TABLE `tblrolepermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrolepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbluser`
--

DROP TABLE IF EXISTS `tbluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbluser` (
  `userId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `gender` int(11) NOT NULL,
  `dob` datetime NOT NULL,
  `active` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `lastUpdated` datetime DEFAULT NULL,
  `lastUpdatedBy` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userName` (`userName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluser`
--

LOCK TABLES `tbluser` WRITE;
/*!40000 ALTER TABLE `tbluser` DISABLE KEYS */;
INSERT INTO `tbluser` VALUES (22,'cs2','tam','Thanh Tam','Nguyen',0,'2017-09-16 00:00:00',1,'nguyenthanhtam1811@gmail.com','042315689','Giai Phong',2,'2017-09-17 13:22:45','thanh'),(23,'cs3','thanh','Minh Chau','Le',1,'1975-03-06 00:00:00',2,'minhchau@gmail.com','04265000000','USA',3,'2017-09-17 10:26:19','thanh'),(24,'cs24','thanh','Thanh','Nguyen',0,'2017-09-16 00:00:00',1,'kimthanhnguyen@gmail.com','0123456789','Hanoi',3,'2017-09-17 10:25:47','thanh'),(25,'cs25','quangtan','Quang Tan','Nguyen',1,'2017-09-17 10:18:00',1,'quangtan@gmail.com','0105200000055','Dong Anh, Ha Noi',2,'2017-09-17 10:19:52','thanh'),(26,'cs26','1234568','Kim Phuong','Tran',0,'2017-09-17 10:19:00',1,'kimphuong@gmail.com','0123456789','Soc Son, Hanoi',2,'2017-09-17 10:23:29','thanh');
/*!40000 ALTER TABLE `tbluser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbluserrole`
--

DROP TABLE IF EXISTS `tbluserrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbluserrole` (
  `userRoleId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) unsigned DEFAULT NULL,
  `roleId` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`userRoleId`),
  KEY `userId_idx` (`userId`),
  KEY `roleId_idx` (`roleId`),
  CONSTRAINT `roleId` FOREIGN KEY (`roleId`) REFERENCES `tblrole` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `tbluser` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluserrole`
--

LOCK TABLES `tbluserrole` WRITE;
/*!40000 ALTER TABLE `tbluserrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbluserrole` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-17 20:39:15
