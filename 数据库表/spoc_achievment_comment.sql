-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: spoc
-- ------------------------------------------------------
-- Server version	5.7.21-1

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
-- Table structure for table `achievment_comment`
--

DROP TABLE IF EXISTS `achievment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievment_comment` (
  `comment_id` varchar(255) NOT NULL,
  `achievement_id` varchar(255) DEFAULT NULL,
  `author_id` varchar(255) DEFAULT NULL,
  `comment_content` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `uploadTime` date DEFAULT NULL,
  `achievement_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `author_picture` varchar(255) DEFAULT NULL,
  `author_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievment_comment`
--

LOCK TABLES `achievment_comment` WRITE;
/*!40000 ALTER TABLE `achievment_comment` DISABLE KEYS */;
INSERT INTO `achievment_comment` VALUES ('2719986CCD6241FBB5DFD13EA8653366','10E778F0D0C74817801B749C4D141209','182056201','阿士大夫撒旦法师打发第三方','2019-05-17','产学研','/home/menahemli/Desktop/1313.jpg','何宇昌'),('40808886E62A4B1FAB451D4813B19D74','10E778F0D0C74817801B749C4D141209',NULL,'就爱上的两个几克拉的数据来看','2019-05-18','产学研',NULL,NULL),('DE07D7A1DAFB467CB452CBDFD44F0B77','10E778F0D0C74817801B749C4D141209','1','华东数控解答付款计划的开发和扩大手机号','2019-05-18','产学研','/home/menahemli/Desktop/1313.jpg','561'),('DF39FE1EABD2494B8CA3CFE5CEC943FD','10E778F0D0C74817801B749C4D141209','182056201','的萨芬看见俺打算离开房间辣都是附近路口','2019-05-17','产学研','/home/menahemli/Desktop/1313.jpg','何宇昌'),('EDB13ED9812D402B99F95EF0D2E752AA','10E778F0D0C74817801B749C4D141209','1','山东省地方或更换交换机看看','2019-05-18','产学研','/home/menahemli/Desktop/1313.jpg','561');
/*!40000 ALTER TABLE `achievment_comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-18 20:53:29
