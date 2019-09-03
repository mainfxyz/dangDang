CREATE DATABASE  IF NOT EXISTS `book` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `book`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: book
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `name` char(12) NOT NULL,
  `type` char(12) NOT NULL,
  `price` float NOT NULL,
  `jj` varchar(255) DEFAULT NULL,
  `sy` int(11) NOT NULL,
  `jprice` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('呼啦圈','呼啦圈',89,'规格: 加强版重2.6斤1.7米紫色,加强版重2.6斤1.7米混色,加强版重2.6斤1.7米粉色,经典2斤（较难转 不送跳绳）,加强版重2.6斤1.7米蓝色,升级版重2.3斤 1.6米混色',7343,45),('收腹滚轮','滚轮',23.4,'健腹轮腹肌轮家用马甲线健身器材运动体育用品男女收腹滚轮',3432,22),('跳绳','跳绳',50,'加粗棉麻集体长跳绳5米7米10米多人跳大跳绳团体儿童学生成人群体',22,45);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check` BEFORE UPDATE ON `book` FOR EACH ROW BEGIN
if (new.sy<0 or new.price<=0) then
	SIGNAL SQLSTATE 'TX000' SET MESSAGE_TEXT = '不能为负数';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment` varchar(255) DEFAULT NULL,
  `degree` int(3) DEFAULT NULL,
  `userName` char(12) NOT NULL,
  `bookName` char(12) NOT NULL,
  PRIMARY KEY (`userName`,`bookName`),
  KEY `cb` (`bookName`),
  CONSTRAINT `cb` FOREIGN KEY (`bookName`) REFERENCES `book` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cu` FOREIGN KEY (`userName`) REFERENCES `user` (`user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `t` BEFORE INSERT ON `comments` FOR EACH ROW BEGIN
	IF new.bookName not in(SELECT bookName FROM `order` WHERE new.userName=`order`.userName)THEN
		SIGNAL SQLSTATE 'TX000' SET MESSAGE_TEXT = 'You haven not bought this commodity,can not commentary';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `gwc`
--

DROP TABLE IF EXISTS `gwc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gwc` (
  `userName` char(12) CHARACTER SET utf8 NOT NULL,
  `bookName` char(12) CHARACTER SET utf8 NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`userName`,`bookName`),
  KEY `gb` (`bookName`),
  CONSTRAINT `gb` FOREIGN KEY (`bookName`) REFERENCES `book` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gu` FOREIGN KEY (`userName`) REFERENCES `user` (`user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gwc`
--

LOCK TABLES `gwc` WRITE;
/*!40000 ALTER TABLE `gwc` DISABLE KEYS */;
INSERT INTO `gwc` VALUES ('q','跳绳',4);
/*!40000 ALTER TABLE `gwc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `no` char(20) NOT NULL,
  `userName` char(12) NOT NULL,
  `bookName` char(12) NOT NULL,
  `state` char(12) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `ou` (`userName`),
  KEY `bookName` (`bookName`,`userName`),
  CONSTRAINT `ob` FOREIGN KEY (`bookName`) REFERENCES `book` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ou` FOREIGN KEY (`userName`) REFERENCES `user` (`user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('1529036971425','q','跳绳','交易完成',1),('1529913328948','q','跳绳','交易完成',1),('2','black','收腹滚轮','交易完成',3),('3','q','跳绳','代付款',1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `numjy` AFTER INSERT ON `order` FOR EACH ROW BEGIN
SELECT sy into @n FROM	book WHERE book.`name`=new.bookName;#n是剩余的书的个数
set @m=new.num;#m是交易的个数
set @n=@n-@m;
if @m<0 or @n<0 then
	SIGNAL SQLSTATE 'TX000' SET MESSAGE_TEXT = '<0 error';
end if;
UPDATE book SET sy:=@n where `name`=new.bookName;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user` char(12) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `passwd` char(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('black','small'),('lin','s'),('mainf','xyz'),('q','q'),('root','123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'book'
--

--
-- Dumping routines for database 'book'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-02 18:35:15
