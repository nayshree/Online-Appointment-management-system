-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: contra.cjrbdmxkv84s.ap-south-1.rds.amazonaws.com    Database: OAMS
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `appointment_master`
--

DROP TABLE IF EXISTS `appointment_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_master` (
  `AID` int NOT NULL AUTO_INCREMENT,
  `UID` int NOT NULL,
  `CID` int NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Files_1` blob,
  `Files_2` blob,
  `Status` varchar(30) NOT NULL DEFAULT 'pending',
  `Appoint_Booked` time NOT NULL,
  PRIMARY KEY (`AID`),
  KEY `uid_frky` (`UID`),
  KEY `cnsltnt` (`CID`),
  CONSTRAINT `aid_uid` FOREIGN KEY (`CID`) REFERENCES `consultant_master` (`CID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid` FOREIGN KEY (`UID`) REFERENCES `user_master` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_master`
--

LOCK TABLES `appointment_master` WRITE;
/*!40000 ALTER TABLE `appointment_master` DISABLE KEYS */;
INSERT INTO `appointment_master` VALUES (1,161,47,'2021-12-03','15:45:45',NULL,NULL,'Approved','00:00:00'),(37,161,48,'2021-05-18','21:53:00',NULL,NULL,'Approved','00:00:00'),(40,161,48,'2021-05-26','13:30:00',NULL,NULL,'pending','00:00:00'),(41,161,47,'2021-05-28','12:00:00',NULL,NULL,'pending','00:00:00');
/*!40000 ALTER TABLE `appointment_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `BID` int NOT NULL AUTO_INCREMENT,
  `Bname` varchar(45) DEFAULT NULL,
  `Aname` varchar(45) DEFAULT NULL,
  `Pname` varchar(45) DEFAULT NULL,
  `Cost` int DEFAULT NULL,
  PRIMARY KEY (`BID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (2,'Madhav','Parikh','Ronald Dalh',1200);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_master`
--

DROP TABLE IF EXISTS `complaint_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint_master` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `From_UID` int DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `c_uid_idx` (`uid`),
  CONSTRAINT `c_uid` FOREIGN KEY (`uid`) REFERENCES `user_master` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `F_UID` FOREIGN KEY (`uid`) REFERENCES `user_master` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_master`
--

LOCK TABLES `complaint_master` WRITE;
/*!40000 ALTER TABLE `complaint_master` DISABLE KEYS */;
INSERT INTO `complaint_master` VALUES (1,160,'Fees Related','High Fees',161),(2,160,'Service Related','Not Good',161),(5,160,'Address Related','Address not right',161),(6,161,'Fees Related','Behavior not appropriate',160),(7,160,'Address Related','Address was a bit incorrect but okay its fine',161),(8,161,'Behaviour Related','Behavior was not good',162);
/*!40000 ALTER TABLE `complaint_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultant_master`
--

DROP TABLE IF EXISTS `consultant_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultant_master` (
  `UID` int NOT NULL,
  `CID` int NOT NULL AUTO_INCREMENT,
  `Add_Line1` varchar(50) NOT NULL,
  `Add_Line2` varchar(50) NOT NULL,
  `Add_Line3` varchar(50) DEFAULT NULL,
  `Landmark` varchar(50) DEFAULT NULL,
  `Area` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Pincode` int NOT NULL,
  PRIMARY KEY (`CID`),
  UNIQUE KEY `UID` (`UID`),
  CONSTRAINT `uid_constraintss` FOREIGN KEY (`UID`) REFERENCES `user_master` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultant_master`
--

LOCK TABLES `consultant_master` WRITE;
/*!40000 ALTER TABLE `consultant_master` DISABLE KEYS */;
INSERT INTO `consultant_master` VALUES (160,47,'312','Block D','Surel apartments','near Judges bunglow','Bodakdev','Ahmedabad','Gujarat',365645),(162,48,'103-New street','Block C','Mahavir Apartment','near post offce','Navrangpura','Ahmedabad','Gujarat',390009);
/*!40000 ALTER TABLE `consultant_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_data`
--

DROP TABLE IF EXISTS `customer_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_data` (
  `data_id` int NOT NULL,
  `data_value` varchar(45) NOT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_data`
--

LOCK TABLES `customer_data` WRITE;
/*!40000 ALTER TABLE `customer_data` DISABLE KEYS */;
INSERT INTO `customer_data` VALUES (1,'Data1 - Nishant'),(2,'Data2 - Saumya'),(3,'Data3 - Rajat'),(4,'Data4 - Nayshree'),(5,'Data5 - Priyesh');
/*!40000 ALTER TABLE `customer_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `eid` int NOT NULL AUTO_INCREMENT,
  `ename` varchar(45) NOT NULL,
  `salary` varchar(45) NOT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=846 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'varsha','20000'),(2,'chandu','30000'),(12,'Madhav','1200'),(201,'bhupi','60000');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_master`
--

DROP TABLE IF EXISTS `feedback_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback_master` (
  `FID` int NOT NULL AUTO_INCREMENT,
  `UID` int NOT NULL,
  `Ratings` int NOT NULL,
  `Comments` varchar(100) DEFAULT NULL,
  `From_UID` int NOT NULL,
  PRIMARY KEY (`FID`),
  KEY `From_UID_idx` (`From_UID`),
  KEY `userid_idx` (`UID`),
  CONSTRAINT `From_UID` FOREIGN KEY (`From_UID`) REFERENCES `user_master` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userid` FOREIGN KEY (`UID`) REFERENCES `user_master` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_master`
--

LOCK TABLES `feedback_master` WRITE;
/*!40000 ALTER TABLE `feedback_master` DISABLE KEYS */;
INSERT INTO `feedback_master` VALUES (28,160,2,'Nice',161),(29,160,2,'Flawless process',161),(30,160,2,'Amazing work',161),(31,160,4,'Appreciable',161),(32,160,3,'Acceptable',161),(33,160,2,'Good',161),(36,162,2,'Nice Experience with you sir',161);
/*!40000 ALTER TABLE `feedback_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthlyscheduledetails`
--

DROP TABLE IF EXISTS `monthlyscheduledetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthlyscheduledetails` (
  `ID` int NOT NULL,
  `MonthlyID` int NOT NULL AUTO_INCREMENT,
  `Day_of_week` int DEFAULT NULL,
  `week_of_month` int DEFAULT NULL,
  `day_of_month` int DEFAULT NULL,
  PRIMARY KEY (`MonthlyID`),
  UNIQUE KEY `ID` (`ID`),
  CONSTRAINT `mnthly` FOREIGN KEY (`ID`) REFERENCES `schedule` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthlyscheduledetails`
--

LOCK TABLES `monthlyscheduledetails` WRITE;
/*!40000 ALTER TABLE `monthlyscheduledetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthlyscheduledetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profession_details`
--

DROP TABLE IF EXISTS `profession_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profession_details` (
  `PDID` int NOT NULL AUTO_INCREMENT,
  `Profession_Type_ID` int NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Details` varchar(100) NOT NULL,
  PRIMARY KEY (`PDID`),
  UNIQUE KEY `Details` (`Details`),
  KEY `ptid_cnstrnt` (`Profession_Type_ID`),
  CONSTRAINT `ptid_cnstrnt` FOREIGN KEY (`Profession_Type_ID`) REFERENCES `profession_type` (`Profession_Type_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profession_details`
--

LOCK TABLES `profession_details` WRITE;
/*!40000 ALTER TABLE `profession_details` DISABLE KEYS */;
INSERT INTO `profession_details` VALUES (1,2,'specialization','Cardiologist'),(2,2,'specialization','Hepatology'),(3,2,'specialization','Oncology'),(4,1,'specialization','Criminal'),(5,1,'specialization','Patent'),(6,2,'specialization','Neurologist'),(7,2,'specialization','Hemtalogy'),(8,2,'specialization','Infectious Disease'),(10,2,'qualification','Bachelor of Medicine,Surgery(MBBS,BMBS,MBChB,MBBCh)'),(11,2,'qualification','Doctor of Medicine (MD, Dr.MuD, Dr.Med)'),(12,2,'qualification','Doctor of Osteopathic Medicine (DO)'),(13,2,'qualification','Doctor of Medicine by research (MD(Res), DM)'),(14,2,'qualification','Doctor of Philosophy (PhD, DPhil)'),(15,2,'qualification','Master of Clinical Medicine (MCM)'),(16,2,'qualification','Master of Medical Science (MMSc, MMedSc)'),(17,2,'qualification','Master of Medicine (MM, MMed)'),(18,1,'qualification','LLB'),(19,1,'qualification','Master of Legal Studies (MLS)'),(20,1,'qualification','Master of Dispute Resolution (MDR)'),(21,1,'qualification','Juris Doctor (JD)'),(23,1,'specialization','Information technology'),(24,1,'specialization','Family');
/*!40000 ALTER TABLE `profession_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profession_master`
--

DROP TABLE IF EXISTS `profession_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profession_master` (
  `PID` int NOT NULL AUTO_INCREMENT,
  `CID` int NOT NULL,
  `Profession_Type_ID` int NOT NULL,
  `Specialization_1` varchar(50) DEFAULT NULL,
  `Specialization_2` varchar(50) DEFAULT NULL,
  `Specialization_3` varchar(50) DEFAULT NULL,
  `Qualification_1` varchar(50) DEFAULT NULL,
  `Qualification_2` varchar(50) DEFAULT NULL,
  `Qualification_3` varchar(50) DEFAULT NULL,
  `PAN_Card` varchar(10) NOT NULL,
  `GSTIN_No` varchar(15) NOT NULL,
  `Experience` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`PID`),
  UNIQUE KEY `CID` (`CID`),
  KEY `fkconprofession` (`Profession_Type_ID`),
  CONSTRAINT `cid_constraints` FOREIGN KEY (`CID`) REFERENCES `consultant_master` (`CID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkconprofession` FOREIGN KEY (`Profession_Type_ID`) REFERENCES `profession_type` (`Profession_Type_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profession_master`
--

LOCK TABLES `profession_master` WRITE;
/*!40000 ALTER TABLE `profession_master` DISABLE KEYS */;
INSERT INTO `profession_master` VALUES (1,47,2,'Cardiologist','Nuerologist','ENT','MBBS','BAMS','MB','YUGFJ2046V','','2 m'),(2,48,1,'General Surgeon (GS)','Dermatologist','Pediatrician','MBBS','BAMS','MB','DDWCH0856B','',NULL);
/*!40000 ALTER TABLE `profession_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profession_type`
--

DROP TABLE IF EXISTS `profession_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profession_type` (
  `Profession_Type_ID` int NOT NULL AUTO_INCREMENT,
  `Profession_Type` varchar(30) NOT NULL,
  PRIMARY KEY (`Profession_Type_ID`),
  UNIQUE KEY `Profession_Type` (`Profession_Type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profession_type`
--

LOCK TABLES `profession_type` WRITE;
/*!40000 ALTER TABLE `profession_type` DISABLE KEYS */;
INSERT INTO `profession_type` VALUES (2,'Doctor'),(1,'Lawyer');
/*!40000 ALTER TABLE `profession_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `STID` int NOT NULL,
  `CID` int NOT NULL,
  `ID` int NOT NULL AUTO_INCREMENT,
  `Start_Date` datetime NOT NULL,
  `End_Date` datetime NOT NULL,
  `Start_Time` datetime NOT NULL,
  `End_Time` datetime NOT NULL,
  `Limit` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CID` (`CID`),
  KEY `schedule_type_ID` (`STID`),
  CONSTRAINT `schdl` FOREIGN KEY (`STID`) REFERENCES `schedule_type_master` (`STID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schdl_consul` FOREIGN KEY (`CID`) REFERENCES `consultant_master` (`CID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,47,8,'2021-09-11 00:00:00','2021-11-03 00:00:00','2021-05-23 12:00:00','2021-05-23 18:00:00',8),(2,48,9,'2021-02-15 00:00:00','2021-03-15 00:00:00','2021-05-23 10:00:00','2021-05-23 16:00:00',8);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_type_master`
--

DROP TABLE IF EXISTS `schedule_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_type_master` (
  `STID` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(20) NOT NULL,
  PRIMARY KEY (`STID`),
  UNIQUE KEY `Type` (`Type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_type_master`
--

LOCK TABLES `schedule_type_master` WRITE;
/*!40000 ALTER TABLE `schedule_type_master` DISABLE KEYS */;
INSERT INTO `schedule_type_master` VALUES (1,'Daily'),(3,'Monthly'),(2,'Weekly');
/*!40000 ALTER TABLE `schedule_type_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_master`
--

DROP TABLE IF EXISTS `user_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_master` (
  `UTMID` int NOT NULL,
  `UID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(75) NOT NULL,
  `Email_ID` varchar(60) NOT NULL,
  `Phone_No` bigint NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `DOB` date NOT NULL,
  `Password` varchar(255) NOT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Pincode` int DEFAULT NULL,
  `Activation` varchar(12) NOT NULL,
  `Activation_Log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UID`),
  UNIQUE KEY `Email_ID` (`Email_ID`),
  UNIQUE KEY `Phone_No` (`Phone_No`),
  KEY `UTMID` (`UTMID`),
  CONSTRAINT `usr_mstr` FOREIGN KEY (`UTMID`) REFERENCES `user_type_master` (`UTMID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_master`
--

LOCK TABLES `user_master` WRITE;
/*!40000 ALTER TABLE `user_master` DISABLE KEYS */;
INSERT INTO `user_master` VALUES (1,1,'admin','admin@admin.com',9426006271,'Male','0000-00-00','qwerty','Ahmedabad','Gujarat',380054,'Activated','2019-09-18 08:24:32'),(4,149,'Madhav','parikh.madhav1999@gmail.com',9998256749,'Male','1999-11-03','qwerty','Ahmedabad','Gujarat',380054,'Activated','2021-04-05 17:49:10'),(4,153,'Nimesh','nimesh@gmail.com',9426006279,'Male','1999-11-03','nita','Ahmedabad','Gujarat',380054,'Deactivated','2021-04-07 04:52:12'),(4,154,'Nishant Jain','nj27nishant@gmail.com',9521681348,'Male','2000-02-27','Abcde@123','Dungarpur','Rajasthan',314001,'Activated','2021-04-07 05:23:51'),(4,158,'nita','nitaa@gmail.com',9898587859,'Female','1999-07-01','police','Ahmedabad','Gujarat',280054,'Activated','2021-04-07 06:24:05'),(3,160,'Dr.Madhav Parikh','madhavparikh@gmail.com',5469658569,'Male','1999-11-03','qwerty','Ahmedabad','Gujarat',380054,'Activated','2021-04-07 08:43:06'),(4,161,'Trilok Sharma','strilok4031@gmail.com',9785469698,'Male','1999-05-05','trilok','Ahmedabad','Gujarat',380054,'Activated','2021-04-07 10:08:37'),(3,162,'Alok Sharma','alok@gmail.com',8889997678,'Male','1999-05-03','alok','Vadodara','Gujarat',380006,'Deactivated','2021-05-09 18:44:34'),(4,163,'Demo','Demo.Demo@gmail.com',9999999999,'Female','1982-11-30','Abcde@123','Ahmedabad','Gujarat',287879,'Activated','2021-05-22 11:48:02');
/*!40000 ALTER TABLE `user_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type_master`
--

DROP TABLE IF EXISTS `user_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type_master` (
  `UTMID` int NOT NULL AUTO_INCREMENT,
  `User_Type` varchar(15) NOT NULL,
  PRIMARY KEY (`UTMID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type_master`
--

LOCK TABLES `user_type_master` WRITE;
/*!40000 ALTER TABLE `user_type_master` DISABLE KEYS */;
INSERT INTO `user_type_master` VALUES (1,'admin'),(2,'manager'),(3,'consultant'),(4,'user');
/*!40000 ALTER TABLE `user_type_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weeklyscheduledetails`
--

DROP TABLE IF EXISTS `weeklyscheduledetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weeklyscheduledetails` (
  `ID` int NOT NULL,
  `WeeklyID` int NOT NULL AUTO_INCREMENT,
  `OnMonday` tinyint(1) DEFAULT NULL,
  `OnTuesday` tinyint(1) DEFAULT NULL,
  `OnWednesday` tinyint(1) DEFAULT NULL,
  `OnThursday` tinyint(1) DEFAULT NULL,
  `OnFriday` tinyint(1) DEFAULT NULL,
  `OnSaturday` tinyint(1) DEFAULT NULL,
  `OnSunday` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`WeeklyID`),
  KEY `ID` (`ID`),
  CONSTRAINT `weekly` FOREIGN KEY (`ID`) REFERENCES `schedule` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weeklyscheduledetails`
--

LOCK TABLES `weeklyscheduledetails` WRITE;
/*!40000 ALTER TABLE `weeklyscheduledetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `weeklyscheduledetails` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-03 16:37:30
