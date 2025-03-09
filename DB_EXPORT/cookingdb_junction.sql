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
-- Table structure for table `junction`
--

DROP TABLE IF EXISTS `junction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `junction` (
  `recipe_name` varchar(45) NOT NULL,
  `ingredient_name` varchar(45) NOT NULL,
  PRIMARY KEY (`recipe_name`,`ingredient_name`),
  KEY `ingredient_name` (`ingredient_name`),
  CONSTRAINT `junction_ibfk_1` FOREIGN KEY (`recipe_name`) REFERENCES `recipes` (`name`),
  CONSTRAINT `junction_ibfk_2` FOREIGN KEY (`ingredient_name`) REFERENCES `ingredients` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `junction`
--

LOCK TABLES `junction` WRITE;
/*!40000 ALTER TABLE `junction` DISABLE KEYS */;
INSERT INTO `junction` VALUES ('Beef Onion Rice','beef'),('Evil Burger','beef'),('Chicken Surprise','chicken'),('Yellow Chicken','chicken'),('Evil Hard-boiled Egg','egg'),('Fried Egg','egg'),('Hard-boiled Egg','egg'),('Evil Burger','evilpowder'),('Evil Hard-boiled Egg','evilpowder'),('Beef Onion Rice','onion'),('Evil Burger','onion'),('Evil Burger','pepper'),('Fried Egg','pepper'),('Beef Onion Rice','rice'),('Tofu on Rice','rice'),('Evil Burger','salt'),('Evil Hard-boiled Egg','salt'),('Fried Egg','salt'),('Hard-boiled Egg','salt'),('Egg Surprise','tofu'),('Tofu on Rice','tofu'),('Tofu Pizza','tofu'),('Evil Burger','tomato'),('Tofu Pizza','tomato'),('Yellow Chicken','turmeric');
/*!40000 ALTER TABLE `junction` ENABLE KEYS */;
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
