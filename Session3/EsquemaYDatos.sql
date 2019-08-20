-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dbalquiler
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('0365412368','Luis Quintero','norte','lquinte@espol.edu.ec'),('092457879','edison.angel@tia.com.ec','Edison Angel','Luque y Chimborazo'),('0931025548','Erick Miranda','Sur','emiranda@est.ups.edu.ec'),('123456787','Edison Zambrano','edison.angel@tia.com.ec','Guasmo'),('4444444','Isabel Rodriguez','Luque y Chimborazo','isabel.rodriguez@tia.com.ec'),('6969','EVERYBODY GO TO THE DISCOTEK','Chimborazo y Luque','isabel.rodriguez@tia.com.ec'),('77777','Luque y Chimborazo','mafer.guerrero@tia.com.ec','Mafer Guerrero'),('777777','isabel.rodriguez@tia.com.ec','Mafer Guerrero','Luque y Chimborazo'),('77777755','Fabricio Tello','ABC','fabricio.tello@tia.com.ec');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computador`
--

DROP TABLE IF EXISTS `computador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computador` (
  `pantalla` varchar(50) DEFAULT NULL,
  `disco` varchar(45) DEFAULT NULL,
  `memoria` varchar(45) DEFAULT NULL,
  `procesador` varchar(45) DEFAULT NULL,
  `sistemaOperativo` varchar(45) DEFAULT NULL,
  `caracteristicasAd` varchar(45) DEFAULT NULL,
  `codigo` varchar(10) NOT NULL,
  PRIMARY KEY (`codigo`),
  CONSTRAINT `id_equipo_comp` FOREIGN KEY (`codigo`) REFERENCES `equipo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computador`
--

LOCK TABLES `computador` WRITE;
/*!40000 ALTER TABLE `computador` DISABLE KEYS */;
INSERT INTO `computador` VALUES ('14 \"','1TB','8GB','Intel i3','Windows 10','Camara web integrada, 3 puertos usb','1001'),('14 \"','1TB','4GB','Intel i3','Windows 10','Camara web integrada, 3 puertos usb','1002'),('14 \"','1TB','8GB','Intel i3','Windows 10','tarjeta grafica','1003');
/*!40000 ALTER TABLE `computador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `codigo` varchar(10) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `costoAlquiler` float DEFAULT NULL,
  `tipo_equipo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES ('1001','Computador portatil 14\'\'','LENOVO',70,'COMPUTADOR'),('1002','Computador portatil 14\'\'','HP',60,'COMPUTADOR'),('1003','Computador de escritorio 15\'\'','HP',70,'COMPUTADOR'),('1011','Impresora Laser multifuncion','HP',60,'IMPRESORA');
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impresora`
--

DROP TABLE IF EXISTS `impresora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impresora` (
  `tipoImpresion` varchar(8) NOT NULL,
  `conexionWifi` tinyint(1) DEFAULT NULL,
  `codigo` varchar(10) NOT NULL,
  PRIMARY KEY (`codigo`),
  CONSTRAINT `id_equipo` FOREIGN KEY (`codigo`) REFERENCES `equipo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impresora`
--

LOCK TABLES `impresora` WRITE;
/*!40000 ALTER TABLE `impresora` DISABLE KEYS */;
INSERT INTO `impresora` VALUES ('LASER',1,'1011');
/*!40000 ALTER TABLE `impresora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenalquiler`
--

DROP TABLE IF EXISTS `ordenalquiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenalquiler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `diasAlquiler` smallint(2) DEFAULT NULL,
  `id_cliente` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente_orden_idx` (`id_cliente`),
  CONSTRAINT `id_cliente_orden` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenalquiler`
--

LOCK TABLES `ordenalquiler` WRITE;
/*!40000 ALTER TABLE `ordenalquiler` DISABLE KEYS */;
INSERT INTO `ordenalquiler` VALUES (1,'2019-08-20 12:11:34',4,'4444444');
/*!40000 ALTER TABLE `ordenalquiler` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-20 14:57:11
