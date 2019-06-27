-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: lombaku
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.10.1-log

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
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (2,'test');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lomba`
--

DROP TABLE IF EXISTS `lomba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lomba` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(300) NOT NULL,
  `mulai_daftar` date NOT NULL,
  `akhir_daftar` date NOT NULL,
  `mulai_lomba` date NOT NULL,
  `akhir_lomba` date NOT NULL,
  `deskripsi` text NOT NULL,
  `user` int(11) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `kategori` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lomba`
--

LOCK TABLES `lomba` WRITE;
/*!40000 ALTER TABLE `lomba` DISABLE KEYS */;
INSERT INTO `lomba` VALUES (1,'Schematics','2019-01-05','2019-01-19','2019-01-21','2019-02-20','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus',31,1,NULL),(2,'Gemastik','2019-05-19','2019-06-02','2019-06-04','2019-07-04','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus',92,1,NULL),(3,'IToday','2019-05-21','2019-06-04','2019-06-06','2019-07-06','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus',131,0,NULL),(4,'Arkavidia','2019-05-25','2019-06-08','2019-06-10','2019-07-10','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus',110,0,NULL),(5,'COMPFEST','2019-03-02','2019-03-16','2019-03-18','2019-04-17','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus',51,0,NULL),(6,'Cyber Jawara','2019-02-13','2019-02-27','2019-03-01','2019-03-31','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus',117,1,NULL),(7,'Cyber Defence Competition','2019-03-28','2019-04-11','2019-04-13','2019-05-13','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus',64,0,NULL),(8,'IT Fest','2019-06-14','2019-06-28','2019-06-30','2019-07-30','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus',76,0,NULL),(9,'Test','2019-01-27','2019-01-29','2019-01-21','2019-01-14','test',3,0,2);
/*!40000 ALTER TABLE `lomba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peserta`
--

DROP TABLE IF EXISTS `peserta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peserta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `lomba` int(11) NOT NULL,
  `tanggal_daftar` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peserta`
--

LOCK TABLES `peserta` WRITE;
/*!40000 ALTER TABLE `peserta` DISABLE KEYS */;
INSERT INTO `peserta` VALUES (1,66,1,'2019-01-17',0),(2,56,1,'2019-01-16',0),(3,52,1,'2019-01-11',0),(4,22,1,'2019-01-11',0),(5,117,1,'2019-01-11',0),(6,17,1,'2019-01-17',0),(7,111,1,'2019-01-06',0),(8,112,1,'2019-01-19',0),(9,16,1,'2019-01-09',0),(10,100,2,'2019-05-31',0),(11,101,2,'2019-06-01',0),(12,40,2,'2019-05-31',0),(13,8,2,'2019-05-29',0),(14,7,2,'2019-05-26',0),(15,32,2,'2019-05-19',0),(16,19,2,'2019-05-31',0),(17,13,2,'2019-05-19',0),(18,9,2,'2019-05-21',0),(19,92,3,'2019-05-29',0),(20,104,3,'2019-06-03',0),(21,4,3,'2019-05-23',0),(22,85,3,'2019-05-23',0),(23,60,3,'2019-05-26',0),(24,38,3,'2019-06-02',0),(25,128,3,'2019-06-01',0),(26,94,3,'2019-06-04',0),(27,36,3,'2019-05-26',0),(28,119,4,'2019-05-27',0),(29,23,4,'2019-06-01',0),(30,38,4,'2019-06-05',0),(31,109,4,'2019-05-28',0),(32,118,4,'2019-06-02',0),(33,24,4,'2019-06-01',0),(34,75,4,'2019-06-01',0),(35,59,4,'2019-06-04',0),(36,13,4,'2019-06-04',0),(37,64,5,'2019-03-10',0),(38,17,5,'2019-03-12',0),(39,35,5,'2019-03-03',0),(40,54,5,'2019-03-15',0),(41,51,5,'2019-03-09',0),(42,72,5,'2019-03-04',0),(43,66,5,'2019-03-06',0),(44,24,5,'2019-03-06',0),(45,31,5,'2019-03-12',0),(46,44,6,'2019-02-20',0),(47,110,6,'2019-02-21',0),(48,20,6,'2019-02-14',0),(49,39,6,'2019-02-19',0),(50,22,6,'2019-02-15',0),(51,18,6,'2019-02-13',0),(52,72,6,'2019-02-21',0),(53,128,6,'2019-02-26',0),(54,44,6,'2019-02-15',0),(55,76,7,'2019-04-10',0),(56,72,7,'2019-04-08',0),(57,108,7,'2019-04-07',0),(58,66,7,'2019-04-06',0),(59,57,7,'2019-04-04',0),(60,92,7,'2019-04-04',0),(61,67,7,'2019-04-07',0),(62,86,7,'2019-03-28',0),(63,81,7,'2019-03-30',0),(64,41,8,'2019-06-25',0),(65,38,8,'2019-06-26',0),(66,10,8,'2019-06-23',0),(67,57,8,'2019-06-22',-1),(68,28,8,'2019-06-28',1),(69,42,8,'2019-06-14',1),(70,42,8,'2019-06-18',1),(71,67,8,'2019-06-19',1),(72,51,8,'2019-06-22',1),(74,76,6,'2019-06-26',0),(75,3,9,'2019-06-27',0);
/*!40000 ALTER TABLE `peserta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Admin','admin@lombaku.com','admin',1),(4,'Btari','btari@lombaku.com','123',0),(5,'Aliya','aliya@lombaku.com','123',0),(6,'Tsabitah','tsabitah@lombaku.com','123',0),(7,'Ignatius','ignatius@lombaku.com','123',0),(8,'Dwiki','dwiki@lombaku.com','123',0),(9,'Iskandar','iskandar@lombaku.com','123',0),(10,'Kevin','kevin@lombaku.com','123',0),(11,'Angga','angga@lombaku.com','123',0),(12,'Wijaya','wijaya@lombaku.com','123',0),(13,'Segara','segara@lombaku.com','123',0),(14,'Bhagas','bhagas@lombaku.com','123',0),(15,'Dagsapurwa','dagsapurwa@lombaku.com','123',0),(16,'Imam','imam@lombaku.com','123',0),(17,'Rafii','rafii@lombaku.com','123',0),(18,'Dzakwan','dzakwan@lombaku.com','123',0),(19,'Joseph','joseph@lombaku.com','123',0),(20,'Eric','eric@lombaku.com','123',0),(21,'Amadeo','amadeo@lombaku.com','123',0),(22,'Seloatmodjo','seloatmodjo@lombaku.com','123',0),(23,'Zakiya','zakiya@lombaku.com','123',0),(24,'Azizah','azizah@lombaku.com','123',0),(25,'Cahyaningtyas','cahyaningtyas@lombaku.com','123',0),(26,'Julius','julius@lombaku.com','123',0),(27,'Vincentius','vincentius@lombaku.com','123',0),(28,'Tanubrata','tanubrata@lombaku.com','123',0),(29,'Mochamad','mochamad@lombaku.com','123',0),(30,'Haikal','haikal@lombaku.com','123',0),(31,'Ghiffari','ghiffari@lombaku.com','123',0),(32,'Patrick','patrick@lombaku.com','123',0),(33,'Cipta','cipta@lombaku.com','123',0),(34,'Winata','winata@lombaku.com','123',0),(35,'Achmad','achmad@lombaku.com','123',0),(36,'Fikri','fikri@lombaku.com','123',0),(37,'Adidharma','adidharma@lombaku.com','123',0),(38,'Bintang','bintang@lombaku.com','123',0),(39,'Nuralamsyah','nuralamsyah@lombaku.com','123',0),(40,'Karina','karina@lombaku.com','123',0),(41,'Soraya','soraya@lombaku.com','123',0),(42,'Puspitasari','puspitasari@lombaku.com','123',0),(43,'Wasilatul','wasilatul@lombaku.com','123',0),(44,'Dewi','dewi@lombaku.com','123',0),(45,'Ningrum','ningrum@lombaku.com','123',0),(46,'Alifiannisa','alifiannisa@lombaku.com','123',0),(47,'Alyahasna','alyahasna@lombaku.com','123',0),(48,'Wighneswara','wighneswara@lombaku.com','123',0),(49,'Atika','atika@lombaku.com','123',0),(50,'Rizki','rizki@lombaku.com','123',0),(51,'Nurakhmah','nurakhmah@lombaku.com','123',0),(52,'Sherly','sherly@lombaku.com','123',0),(53,'Rosa','rosa@lombaku.com','123',0),(54,'Anggraeni','anggraeni@lombaku.com','123',0),(55,'Arief','arief@lombaku.com','123',0),(56,'Prasetyo','prasetyo@lombaku.com','123',0),(57,'Dwi','dwi@lombaku.com','123',0),(58,'Prasetya','prasetya@lombaku.com','123',0),(59,'Armunanta','armunanta@lombaku.com','123',0),(60,'Hisam','hisam@lombaku.com','123',0),(61,'Widi','widi@lombaku.com','123',0),(62,'Prayoga','prayoga@lombaku.com','123',0),(63,'Putri','putri@lombaku.com','123',0),(64,'Endah','endah@lombaku.com','123',0),(65,'Annas','annas@lombaku.com','123',0),(66,'Nuril','nuril@lombaku.com','123',0),(67,'Iman','iman@lombaku.com','123',0),(68,'Muhammad','muhammad@lombaku.com','123',0),(69,'Yusuf','yusuf@lombaku.com','123',0),(70,'Mukharom','mukharom@lombaku.com','123',0),(71,'Yasinta','yasinta@lombaku.com','123',0),(72,'Yusniawati','yusniawati@lombaku.com','123',0),(73,'Ivan','ivan@lombaku.com','123',0),(74,'Indrakusuma','indrakusuma@lombaku.com','123',0),(75,'Abraham','abraham@lombaku.com','123',0),(76,'Wong','wong@lombaku.com','123',0),(77,'Iqbal','iqbal@lombaku.com','123',0),(78,'Imani','imani@lombaku.com','123',0),(79,'Atfan','atfan@lombaku.com','123',0),(80,'Raja','raja@lombaku.com','123',0),(81,'Permata','permata@lombaku.com','123',0),(82,'Boy','boy@lombaku.com','123',0),(83,'Mangatur','mangatur@lombaku.com','123',0),(84,'Simarmata','simarmata@lombaku.com','123',0),(85,'Paksi','paksi@lombaku.com','123',0),(86,'Ario','ario@lombaku.com','123',0),(87,'Pamungkas','pamungkas@lombaku.com','123',0),(88,'Fadly','fadly@lombaku.com','123',0),(89,'Hasan','hasan@lombaku.com','123',0),(90,'Najatul','najatul@lombaku.com','123',0),(91,'Muslim','muslim@lombaku.com','123',0),(92,'Dinatra','dinatra@lombaku.com','123',0),(93,'Bima','bima@lombaku.com','123',0),(94,'Satria','satria@lombaku.com','123',0),(95,'Ramadhan','ramadhan@lombaku.com','123',0),(96,'Indira','indira@lombaku.com','123',0),(97,'Nursyamsina','nursyamsina@lombaku.com','123',0),(98,'Hazimi','hazimi@lombaku.com','123',0),(99,'Bayu','bayu@lombaku.com','123',0),(100,'Novaldi','novaldi@lombaku.com','123',0),(101,'Novan','novan@lombaku.com','123',0),(102,'Ardhana','ardhana@lombaku.com','123',0),(103,'Ida','ida@lombaku.com','123',0),(104,'Bagus','bagus@lombaku.com','123',0),(105,'Rai','rai@lombaku.com','123',0),(106,'Widnyana','widnyana@lombaku.com','123',0),(107,'Claus','claus@lombaku.com','123',0),(108,'Peter','peter@lombaku.com','123',0),(109,'Christo','christo@lombaku.com','123',0),(110,'Hutabarat','hutabarat@lombaku.com','123',0),(111,'Affan','affan@lombaku.com','123',0),(112,'Ahsanul','ahsanul@lombaku.com','123',0),(113,'Habib','habib@lombaku.com','123',0),(114,'Tria','tria@lombaku.com','123',0),(115,'Nur','nur@lombaku.com','123',0),(116,'Aisyah','aisyah@lombaku.com','123',0),(117,'Amini','amini@lombaku.com','123',0),(118,'Timothyus','timothyus@lombaku.com','123',0),(119,'Tanner','tanner@lombaku.com','123',0),(120,'Leonita','leonita@lombaku.com','123',0),(121,'Megasarah','megasarah@lombaku.com','123',0),(122,'Ruth','ruth@lombaku.com','123',0),(123,'Sitompul','sitompul@lombaku.com','123',0),(124,'Philip','philip@lombaku.com','123',0),(125,'Antoni','antoni@lombaku.com','123',0),(126,'Siahaan','siahaan@lombaku.com','123',0),(127,'Chaniyah','chaniyah@lombaku.com','123',0),(128,'Zulfa','zulfa@lombaku.com','123',0),(129,'Mukhlishah','mukhlishah@lombaku.com','123',0),(130,'Fandy','fandy@lombaku.com','123',0),(131,'Kuncoro','kuncoro@lombaku.com','123',0),(132,'Adianto','adianto@lombaku.com','123',0),(133,'Elkana','elkana@lombaku.com','123',0),(134,'Hans','hans@lombaku.com','123',0),(135,'Widersen','widersen@lombaku.com','123',0),(136,'Test','test@test.com','test',0);
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

-- Dump completed on 2019-06-27 20:54:52
