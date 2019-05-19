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
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `employee_num` varchar(100) NOT NULL,
  `teacher_name` varchar(10) NOT NULL,
  `teacher_password` varchar(255) NOT NULL,
  `teacher_gender` varchar(1) NOT NULL,
  `education_background` varchar(100) DEFAULT NULL,
  `professional_titles` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `face_img` varchar(255) DEFAULT NULL,
  `teacher_nickname` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `teacher_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employee_num`),
  KEY `teacher_category` (`teacher_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('1','1','-79-2458108-15-12833-53-7610282-21-2489652114-1514','1','1','教授','1','1','1','1','1','1'),('11','11','-79-2458108-15-12833-53-7610282-21-2489652114-1514','1','1','教授','1','1','1','1','1','1'),('12','12','-46-81-865773-7616441836-6895-44-1046655-15-41-50-6','2','2','教授','2','2','2','2','2','1'),('13','13','-68-11046-18-1391104400-32-37-50115-33111979823-238','3','3','教授','3','3','3','3','3','1'),('14','14','-79-2458108-15-12833-53-7610282-21-2489652114-1514','1','1','教授','1','1','1','1','1','1'),('15','15','-46-81-865773-7616441836-6895-44-1046655-15-41-50-6','2','2','教授','2','2','2','2','2','1'),('16','16','-68-11046-18-1391104400-32-37-50115-33111979823-238','3','3','教授','3','3','3','3','3','1'),('17','17','-79-2458108-15-12833-53-7610282-21-2489652114-1514','1','1','教授','1','1','1','1','1','1'),('18','18','-46-81-865773-7616441836-6895-44-1046655-15-41-50-6','2','2','教授','2','2','2','2','2','1'),('19','19','-68-11046-18-1391104400-32-37-50115-33111979823-238','3','3','教授','3','3','3','3','3','1'),('2','2','-46-81-865773-7616441836-6895-44-1046655-15-41-50-6','2','2','教授','2','2','2','2','2','1'),('3','3','-68-11046-18-1391104400-32-37-50115-33111979823-238','3','3','教授','3','3','3','3','3','1'),('4','4','-79-2458108-15-12833-53-7610282-21-2489652114-1514','1','1','教授','1','1','1','1','1','1'),('5','5','-46-81-865773-7616441836-6895-44-1046655-15-41-50-6','2','2','教授','2','2','2','2','2','1'),('6','6','-68-11046-18-1391104400-32-37-50115-33111979823-238','3','3','教授','3','3','3','3','3','1'),('7','7','-79-2458108-15-12833-53-7610282-21-2489652114-1514','1','1','教授','1','1','1','1','1','1'),('8','8','-46-81-865773-7616441836-6895-44-1046655-15-41-50-6','2','2','教授','2','2','2','2','2','1'),('9','9','-68-11046-18-1391104400-32-37-50115-33111979823-238','3','3','教授','3','3','3','3','3','1');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-19 19:38:01
