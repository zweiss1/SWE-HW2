-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cookingdb
-- ------------------------------------------------------
-- Server version	8.0.41

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

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `recipeid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(200) NOT NULL,
  `instructions` varchar(200) NOT NULL,
  `protein` varchar(20) NOT NULL,
  PRIMARY KEY (`recipeid`),
  UNIQUE KEY `id_UNIQUE` (`recipeid`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_protein` (`protein`),
  CONSTRAINT `fk_protein` FOREIGN KEY (`protein`) REFERENCES `ingredients` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Chicken Surprise','A delightfully chewy dish that takes minimal preparation','1. Cut up the chicken. \n2. Enjoy!','chicken'),(2,'Tofu on Rice','Tired of eating just one bland food for dinner? Now you can have two!','1. Make tofu.\r\n2. Make rice.\r\n3. This is the tricky bit: put the tofu on the rice.','tofu'),(9,'Tofu Pizza','Ever wished you could have pizza without feeling guilty about missing out on a delicious tofu dinner? Now you don\'t have to!','1. Make pizza dough out of thin air. Flour is for the weak.\r\n2. Smash the tomatoes into a sauce and spread it on the dough.\r\n3. Chop tofu and add it.\r\n4. Bake it.','tofu'),(10,'Fried Egg','Ever wished your eggs could be fried? Wish no longer!','1. Fry your egg.\r\n2. Add salt.\r\n3. Add pepper.','egg'),(11,'Yellow Chicken','I figured chicken would probably turn yellow if you put a bunch of turmeric on it. I haven\'t tried it, though.','1. Cook chicken. I don\'t care how.\r\n2. Smother it in turmeric until it looks like a cut straight off of Big Bird.','chicken'),(12,'Beef Onion Rice','Ever wished you could have your three favorite foods in one compact dish? Well, if your three favorite foods are beef, onion, and rice, then this is the dish for you!','1. Cook beef.\r\n2. Cook onion.\r\n3. Cook rice.\r\n4. Mix and eat!','beef'),(14,'Evil Burger','Ever wished your burger could hate you just for being yourself? Now it can!','1. Mix the evilpowder with water to make the buns.\r\n2. Cook the beef patty.\r\n3. Add onion, garlic, salt, pepper, and tomato.','beef'),(15,'Hard-boiled Egg','Ever wished your eggs could be chalkier and less satisfying to eat? Now they can be!','1. Boil the egg.\r\n2. Add salt.\r\n3. Regret.','egg'),(16,'Evil Hard-boiled Egg','Ever wished your already-unsatisfying breakfast could hate you just as much as you hate it? Now it can!','1. Boil the egg.\r\n2. Add salt and evil powder.\r\n3. Regret.','egg'),(17,'Egg Surprise','The surprise is that instead of egg, it\'s tofu.','1. Make tofu.\r\n2. Convince everyone you\'re making eggs.','tofu');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-09  0:27:40
