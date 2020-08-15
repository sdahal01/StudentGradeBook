-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: localhost    Database: cpsc431
-- ------------------------------------------------------
-- Server version	5.7.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES UTF8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `Course_Number` varchar(5) NOT NULL,
  `Course_Name` varchar(20) DEFAULT NULL,
  `Course_Textbook` varchar(50) DEFAULT NULL,
  `Course_Unit` int(3) DEFAULT NULL,
  `Dep_Num` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Course_Number`),
  KEY `Dep_Num` (`Dep_Num`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Dep_Num`) REFERENCES `department` (`Dep_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('35476','CPSC 131','Data Structure and Algorithms',3,'35461'),('36587','MATH 338','Applied Statistics',3,'35462'),('37698','Econ 100','Intro to Economics',3,'35463'),('38709','Comm 100','Intro to Communication',3,'35465'),('39810','Buss 223','Bussiness and Accounting',3,'35464');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `Dep_Number` varchar(10) NOT NULL,
  `Dep_Name` varchar(50) DEFAULT NULL,
  `Dep_Phone` varchar(10) DEFAULT NULL,
  `Dep_Location` varchar(20) DEFAULT NULL,
  `Prof_SSN` int(9) DEFAULT NULL,
  PRIMARY KEY (`Dep_Number`),
  KEY `Prof_SSN` (`Prof_SSN`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`Prof_SSN`) REFERENCES `professor` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('35461','Computer Science','1234567890','CS400',342568824),('35462','Math','2345678901','MATH 320',432594258),('35463','Economics','2345678955','Econ 202',753621528),('35464','Business','2345678222','BUS 231',478558892),('35465','Communication','2344321232','COMM 222',105612572);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `SSN` int(9) NOT NULL,
  `Prof_Name` varchar(50) DEFAULT NULL,
  `Prof_Street` varchar(30) DEFAULT NULL,
  `Prof_City` varchar(30) DEFAULT NULL,
  `Prof_State` varchar(30) DEFAULT NULL,
  `Prof_Zipcode` int(5) DEFAULT NULL,
  `Prof_Phone` int(10) DEFAULT NULL,
  `Prof_Title` varchar(5) DEFAULT NULL,
  `Prof_Salary` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (105612572,'Susan Dahl','233456 Springfield Dr.','Los Angeles','CA',90001,2234123,'Mrs.','$82000'),(342568824,'Harry Smith','2445 Via Mancha','Laguna Niguel','CA',92677,9341234,'Mr.','$75000'),(432594258,'Paul Gomez','36657 Summer Land Drive','Santa Ana','CA',92701,2213243,'Mr.','$80000'),(478558892,'Carly Jacob','23345 Main St.','Los Angeles','CA',90001,2134423,'Mrs.','$75000'),(753621528,'Bob Lee','4432 Camino Rioja','San Juan Capistrano','CA',92624,3214456,'Mr.','$70000');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records` (
  `Course_Num` varchar(5) NOT NULL,
  `Section_Num` varchar(2) NOT NULL,
  `Student_Cwid` varchar(9) NOT NULL,
  `Grade` varchar(2) DEFAULT NULL,
  KEY `Course_Num` (`Course_Num`),
  KEY `Section_Num` (`Section_Num`),
  KEY `Student_Cwid` (`Student_Cwid`),
  CONSTRAINT `records_ibfk_1` FOREIGN KEY (`Course_Num`) REFERENCES `course` (`Course_Number`),
  CONSTRAINT `records_ibfk_2` FOREIGN KEY (`Section_Num`) REFERENCES `section` (`Section_Number`),
  CONSTRAINT `records_ibfk_3` FOREIGN KEY (`Student_Cwid`) REFERENCES `student` (`cwid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` VALUES ('36587','03','883214324','B'),('39810','09','883214324','C'),('38709','07','883214324','A'),('36587','04','223144158','A'),('37698','06','223144158','A'),('39810','10','223144158','A'),('36587','03','192837465','C'),('39810','09','192837465','B'),('38709','07','192837465','B'),('36587','04','918273645','B'),('37698','06','918273645','B'),('38709','08','918273645','B');
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `C_Num` varchar(5) NOT NULL,
  `Section_Number` varchar(2) NOT NULL,
  `ClassRoom` varchar(8) DEFAULT NULL,
  `DaysMeet` varchar(10) DEFAULT NULL,
  `Start_Time` varchar(6) DEFAULT NULL,
  `End_Time` varchar(6) DEFAULT NULL,
  `Seats` int(3) DEFAULT NULL,
  `P_SSN` int(9) DEFAULT NULL,
  PRIMARY KEY (`Section_Number`),
  KEY `P_SSN` (`P_SSN`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`P_SSN`) REFERENCES `professor` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES ('35476','01','CS 200','M/W','9AM','11AM',40,342568824),('35476','02','CS 301','T/TH','9AM','11AM',40,342568824),('36587','03','MATH 222','M/W','12PM','2PM',60,432594258),('36587','04','MATH 222','T/TH','12PM','2PM',60,432594258),('37698','05','Econ 110','M/W','3PM','5PM',45,753621528),('37698','06','Econ 110','T/TH','6PM','8PM',45,753621528),('38709','07','COMM 214','F/S','10AM','12PM',45,105612572),('38709','08','COMM 214','F/S','1PM','2PM',45,105612572),('39810','09','BUSS 110','F/S','1PM','2PM',45,478558892),('39810','10','BUSS 110','F/S','3PM','4PM',45,478558892);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `cwid` varchar(9) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` int(6) DEFAULT NULL,
  `phone` int(10) DEFAULT NULL,
  `degree` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cwid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('122133123','Edward','Pedro','25564 Maint St.','Long Beach',92631,9563342,'Economics'),('192837465','Henry','Verdugo','12332 Lake Forest','Laguna Hills',96236,1225432,'Math'),('213213445','Jake','Smith','43321 Fullerton St','Fullerton',90621,2314456,'Communication'),('221445223','Jake','Paul','13133 Pacific Cost Dr.','Newport',92603,2431123,'Math'),('223144158','Maria','Lacambra','9665 Calle Corta','Mission Viejo',92635,3245543,'Computer Science'),('233412345','Chad','Barar','23 Del Lago','Fullerton',90621,1232341,'Business'),('876654543','Brad','Delgado','23342 Vista Del Lago','Laguna Niguel',92677,2234213,'Business'),('883214324','Taylor','bob','213224 Via La Mancha','Laguna Niguel',92677,9392232,'Computer Science'),('918273645','Gerad','Verdugo','55 Grenada','Fullerton',90621,1225432,'Business'),('987765543','Harry','Walsh','98545 San Jaquin Hills','Mission Viejo',92630,8563342,'Computer Science');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test','$2y$10$um5QdcTfhFpyg8iPM4AOlewHQQNeTFN9Maz/zdNVuzULkmnQRVgW2','2019-05-15 15:34:45');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-15 22:53:47
