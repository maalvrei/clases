CREATE DATABASE  IF NOT EXISTS `colegio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `colegio`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: colegio
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `Codigo_alumno` int NOT NULL,
  `DNI` varchar(12) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `Apellidos` varchar(80) NOT NULL,
  `sexo` char(1) DEFAULT 'F',
  `Direccion` varchar(150) NOT NULL,
  `Localidad` varchar(45) NOT NULL,
  `provincia` varchar(30) DEFAULT NULL,
  `CodigoPostal` int unsigned DEFAULT NULL,
  `Telefono_fijo` varchar(9) DEFAULT NULL,
  `telefonoM` varchar(9) DEFAULT NULL,
  `correoPersonal` varchar(150) DEFAULT NULL,
  `Codigo_asignatura` int NOT NULL,
  `Fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`Codigo_alumno`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`),
  KEY `Codigo_asignatura_idx` (`Codigo_asignatura`),
  CONSTRAINT `alumnos_asignatura_fk` FOREIGN KEY (`Codigo_asignatura`) REFERENCES `asignaturas` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `alumnos_chk_1` CHECK (((`sexo` = _utf8mb4'F') or (`sexo` = _utf8mb4'M')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (100,'30400125K','Pepe','García López','F','C/Mayor, 25','Córdoba','Córdoba',14001,'630120120','630120120','Pepe30400125K@gmail.com',1,'1981-11-22'),(101,'75123123J','Carmen','Moreno García','F','C/Murcia, 37','Torrejon','Madrid',28100,NULL,'612345678','Carmen75123123J@gmail.com',4,'1981-11-22'),(102,'75414141B','Juan','Merino García','F','C/Menendez Pelayo, 12','Lucena','Córdoba',14001,NULL,'698741523','Juan75414141B@gmail.com',1,'1980-04-27'),(103,'30789789F','Carlos','Pérez Estrada','F','C/Atocha, 45','Andujar','Jaen',14003,NULL,'692548725','Carlos30789789F@gmail.com',2,'1981-01-02'),(104,'30115958X','Pepe','Mona Lisa','F','del Pez, 5','Madrid','Madrid',28010,'915247852','604811551','Pepe30115958X@gmail.com',3,'1981-01-05'),(105,'48411578F','Antonio','Mona Cuca','F','del Oso, 6','Fuenlabrada','Madrid',28020,'915795135','684951735','Antonio48411578F@gmail.com',4,'1982-09-04'),(106,'25148952G','Carlos','Pérez López','F','de la Oca, 8','Madrid','Madrid',28034,'915744812','694781257','Carlos25148952G@gmail.com',1,'1981-02-17'),(107,'35648257J','Lolo','García Domingo','F','del Ornitorrinco, 96','Parla','Madrid',28945,'918763157','694758266','Lolo35648257J@gmail.com',5,'1982-04-12'),(108,'X5184966Y','Lucía','Arellano López','F','C/ Tendillas','Córdoba','Córdoba',28100,'957145522','630447788','LucíaX5184966Y@gmail.com',3,'1980-12-30'),(109,'36456632G','Maria','Fernadez','F','Calderilla','Alicante','Alicante',24562,'96478632','677889910','Maria36456632G@gmail.com',1,'1981-06-12'),(110,'5146352s','Carmen','Rodriguez Lopez','F','C/ Arganzuela, 32','Madrid','Madrid',28021,'91552010','627203050','Carmen5146352s@gmail.com',2,'1981-06-12'),(111,'301452162K','Ana',' Torres García','F','C/Tendillas, 3','Córdoba','Córdoba',14002,NULL,'666121212','Ana301452162K@gmail.com',4,'1983-06-20'),(112,'32156411A','Carmen',' Perez','F','Espoz','Alcorcon','Madrid',28540,'91963852','655444111','Carmen32156411A@gmail.com',6,'1981-10-22'),(113,'45720896J','Luis',' Arnaz','F','Mina','Madrid','Madrid',28010,'91478874','699888777','Luis45720896J@gmail.com',8,'1980-10-22'),(114,'08456123B','Berto',' Galan','F','Mayor','Povedilla','Malaga',29010,'95840001','688145541','Berto08456123B@gmail.com',9,'1981-11-02'),(115,'36452125C','Carlos',' Quijano','F','Oriente','Coruña','Coruña',15014,'98777110','699100200','Carlos36452125C@gmail.com',7,'1981-01-25'),(116,'44563365D','Felipe','Calderon','F','Juanjo','Alcala de Henares','Madrid',28450,'91223655','641041022','Felipe44563365D@gmail.com',4,'1980-05-14'),(117,'45145254E','Elsa','Gomez','F','fray de Leon','Madrid','Madrid',28013,'91445221','655223101','Elsa45145254E@gmail.com',2,'1981-06-17'),(118,'46464797a','sara','garciaperez','F','real 5','jaen','jaen',46002,'949646464','64646464','sara46464797a@gmail.com',1,'1982-07-12'),(119,'464646464k','jose','torres alameda','F','mayor 4','barcelona','barcelona',8001,'946496464','66464646','jose464646464k@gmail.com',4,'1980-12-30'),(120,'636796749h','carlos','jimenz alto','F','madrid 9','ciudad real','cuidad real',6001,'964679679','69996464','carlos636796749h@gmail.com',5,'1981-01-02'),(121,'30222333G ','maite','leongarcia','F','C/Mayor, 25','Alcázar de San Juan','Ciudad Real',30520,'926205020','64667767','maite30222333G @gmail.com',9,'1981-08-04'),(122,'49126859D','Timo','Alvarez Hurtado','M','San Patricio 79','La Puebla de Cazalla','Sevilla',41540,'957855478','784512456','Timo49126859D@gmail.com',4,'1996-04-12'),(123,'49176459D','Jaime','Mochuelo','M','Victoria 1','La Puebla de Cazalla','Sevilla',41540,'985475344','644512458','Jaime49176459D@gmail.com',7,'1996-12-28');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignaturas` (
  `Codigo` int NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Creditos` int NOT NULL,
  `Departamento` varchar(60) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
INSERT INTO `asignaturas` VALUES (1,'Administración de Base de Datos',20,'Base de Datos'),(2,'Sistemas Operativos Distribuídos',15,'Sistemas Operativos'),(3,'Metodología de la Programación I',18,'Programación de Sistemas'),(4,'Base de datos Distribuídas',12,'Base de Datos'),(5,'Sistemas Multiproceso',12,'Sistemas Operativos'),(6,'Sistemas Expertos',10,'Inteligencia Artificial'),(7,'Metodología de la Programación II',18,'Programación de Sistemas'),(8,'Programación con Java',19,'Programación de Sistemas'),(9,'Ingeniería del Software I',15,'Base de Datos'),(10,'Ingeniería del Software II',14,'Base de Datos'),(11,'Programación orientada a objetos',10,'Programación de Sistemas'),(12,'Oracle 12c',10,'Base de Datos'),(13,'Oracle 11g',12,'Base de datos'),(14,'MySQL',12,'Base de datos');
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-28 11:05:24
