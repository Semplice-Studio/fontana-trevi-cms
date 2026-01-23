-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: craft
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `administrativeArea` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dependentLocality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postalCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortingCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressLine1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressLine2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressLine3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organizationTaxId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bazadqcdzfklddlasasoobgwsofpouryzqjf` (`primaryOwnerId`),
  CONSTRAINT `fk_bazadqcdzfklddlasasoobgwsofpouryzqjf` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cllgzhfpdhnsfswgzjxvrdxdffryxdaxuiwl` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_wxtoqvfymuqneqcmdjixorwmuubdbwyzkter` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_xrnyhfyardzzznyaxoltuegnhwtgewzfxxcf` (`dateRead`),
  KEY `fk_ovcqowccldrzzaxvnzxbhtvpjgwuefgsogvj` (`pluginId`),
  CONSTRAINT `fk_drucnutxhtirkrzxibnxypzrjivfrlbhnnnh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ovcqowccldrzzaxvnzxbhtvpjgwuefgsogvj` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ybwpfblhaqpifzbnuiinxkuwdopfgqingrig` (`sessionId`,`volumeId`),
  KEY `idx_irxpgppanltfaukwbcivpzaruhhoncjapxts` (`volumeId`),
  CONSTRAINT `fk_ipkmbbepvfnztcepcfqxnluymwjeyibjkrde` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tlcsikjgwraxqwewyqdmdmvmymiryqqcpppo` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mimeType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kind` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unknown',
  `alt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_alkdlwfbrrboopkolbjdgtouyxmlcfrecoyu` (`filename`,`folderId`),
  KEY `idx_sseiccitckhasidxmurlfkxvowghbmrwjmaw` (`folderId`),
  KEY `idx_ioeztkjkxjgjsnruxnouabluniooueftfzlb` (`volumeId`),
  KEY `fk_elqwergzmtdiebtgfggjncafjjjacmmjsyka` (`uploaderId`),
  CONSTRAINT `fk_elqwergzmtdiebtgfggjncafjjjacmmjsyka` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hvzvonnpbipsinwcyjgscsxajriaahjtzsqc` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_idhapdwfxzxuwdizmikbtpobyxmmunkjbirt` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_naklgksbinocxhuntjgtybkqoigxeceiaknw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (9,2,2,1,'Circles-Copia.jpg','image/jpeg','image',NULL,1211,1211,402453,NULL,0,0,'2026-01-21 14:32:36','2026-01-21 14:32:37','2026-01-21 14:32:37'),(10,2,2,1,'hero-fontana.mp4','video/mp4','video',NULL,NULL,NULL,32020253,NULL,NULL,NULL,'2026-01-21 15:57:49','2026-01-21 15:57:50','2026-01-21 15:57:50'),(118,1,1,1,'01.jpeg','image/jpeg','image',NULL,1397,964,366321,NULL,NULL,NULL,'2026-01-23 16:19:59','2026-01-23 16:19:59','2026-01-23 16:19:59'),(119,1,1,1,'02.jpeg','image/jpeg','image',NULL,2245,750,338040,NULL,NULL,NULL,'2026-01-23 16:20:14','2026-01-23 16:20:14','2026-01-23 16:20:14'),(120,1,1,1,'03.jpeg','image/jpeg','image',NULL,1639,921,257571,NULL,NULL,NULL,'2026-01-23 16:20:19','2026-01-23 16:20:19','2026-01-23 16:20:19'),(121,1,1,1,'04.jpeg','image/jpeg','image',NULL,2179,1455,662156,NULL,NULL,NULL,'2026-01-23 16:20:23','2026-01-23 16:20:23','2026-01-23 16:20:23'),(122,1,1,1,'05.jpeg','image/jpeg','image',NULL,4000,1557,1778317,NULL,NULL,NULL,'2026-01-23 16:20:27','2026-01-23 16:20:27','2026-01-23 16:20:27');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_nynrzoqcenkyxktrhawerzzqdevnmjffbphf` (`siteId`),
  CONSTRAINT `fk_dquagxgbsoepstswfacpkrjdzcroujfwklsd` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nynrzoqcenkyxktrhawerzzqdevnmjffbphf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
INSERT INTO `assets_sites` VALUES (9,1,NULL),(9,2,NULL),(10,1,NULL),(10,2,NULL),(118,1,NULL),(118,2,NULL),(119,1,NULL),(119,2,NULL),(120,1,NULL),(120,2,NULL),(121,1,NULL),(121,2,NULL),(122,1,NULL),(122,2,NULL);
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ngnabspwdideyvddejeqnricdxqggbglfkaf` (`userId`),
  CONSTRAINT `fk_ngnabspwdideyvddejeqnricdxqggbglfkaf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulkopevents`
--

DROP TABLE IF EXISTS `bulkopevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkopevents` (
  `key` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `senderClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`key`,`senderClass`,`eventName`),
  KEY `idx_syjnkscwbcqftghdqjpepgdfngkprxfcigij` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulkopevents`
--

LOCK TABLES `bulkopevents` WRITE;
/*!40000 ALTER TABLE `bulkopevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulkopevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_stsqhxvytmmjocpzyaefrsarajmtqnzrieyw` (`groupId`),
  KEY `fk_bwndhcuxanpqwpoffyqetcfdvxiekdzedudc` (`parentId`),
  CONSTRAINT `fk_bwndhcuxanpqwpoffyqetcfdvxiekdzedudc` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_olkrizqayugxqtrrelvwfvsqaxwiwklhfsnm` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pcurukwgytppjreankzxykbhhqneprnzzcgb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wouyojboxrldgdrbjljcjufyuigpbyeybait` (`name`),
  KEY `idx_lytbtspcxhremfjbaobpwuuknqkypwjjazie` (`handle`),
  KEY `idx_nosmlaoebstkvdugpksjsqxhyoamjmkbqzjs` (`structureId`),
  KEY `idx_fwdwrxvzicsfysknsotskqhahmllnsaubctw` (`fieldLayoutId`),
  KEY `idx_cgvcrutxsnquynpcegumtggkbzzfaiclazkt` (`dateDeleted`),
  CONSTRAINT `fk_ameozzudrgstsnghjudsmwanixxhyvdtpgdz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_edweprmuuvmdjxkufxgvllytmsowhhhsuydv` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `template` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iwqddonaeehzvixidxriakxruykghlfnxjwt` (`groupId`,`siteId`),
  KEY `idx_pyjicqxdhxxhbnvfnlixqukziqqmeaztenkt` (`siteId`),
  CONSTRAINT `fk_hcsqvftkmbmjblhlmnzbtmfcsgakdlvfibsu` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vzrvpretivgedfyilaztfaeqieshpsyazahf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_uycrqslohpxneitqebnwgcjwifqeuvxvczgz` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_hosuppngmouevhkpfsnpbfkuwzwkqocvgdua` (`siteId`),
  KEY `fk_rarsfpkishmlarkfmscefgakgtxrbnazufgn` (`userId`),
  CONSTRAINT `fk_dvljxkwiftwzowkckpmxriuwnnpftrngthbd` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hosuppngmouevhkpfsnpbfkuwzwkqocvgdua` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rarsfpkishmlarkfmscefgakgtxrbnazufgn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
INSERT INTO `changedattributes` VALUES (1,1,'lastPasswordChangeDate','2026-01-22 14:28:21',0,NULL),(1,1,'password','2026-01-22 14:28:21',0,NULL),(11,1,'primaryOwnerId','2026-01-22 17:48:05',0,1),(11,1,'slug','2026-01-22 17:48:05',0,1),(11,1,'title','2026-01-22 17:48:05',0,1),(11,2,'enabledForSite','2026-01-22 10:00:06',1,1),(11,2,'primaryOwnerId','2026-01-22 17:48:05',1,1),(11,2,'title','2026-01-22 17:48:05',1,1),(29,1,'primaryOwnerId','2026-01-22 17:52:57',1,1),(29,1,'slug','2026-01-22 17:10:52',0,1),(29,1,'title','2026-01-22 17:52:57',1,1),(29,2,'primaryOwnerId','2026-01-22 17:52:57',0,1),(29,2,'slug','2026-01-22 17:52:57',0,1),(29,2,'title','2026-01-22 17:52:57',0,1),(52,1,'slug','2026-01-23 08:33:05',1,1),(52,1,'title','2026-01-23 08:33:05',1,1),(52,2,'slug','2026-01-23 08:33:05',0,1),(52,2,'title','2026-01-23 08:33:05',0,1),(55,1,'slug','2026-01-23 08:59:02',0,1),(55,1,'title','2026-01-23 08:59:02',0,1),(55,2,'slug','2026-01-23 08:56:52',1,1),(55,2,'title','2026-01-23 08:59:02',1,1),(56,1,'postDate','2026-01-23 08:56:51',0,1),(56,1,'slug','2026-01-23 08:56:51',0,1),(56,1,'status','2026-01-23 08:56:51',0,1),(56,1,'title','2026-01-23 08:56:51',0,1),(56,2,'postDate','2026-01-23 08:56:51',1,1),(56,2,'slug','2026-01-23 08:56:51',1,1),(56,2,'status','2026-01-23 08:56:51',1,1),(56,2,'title','2026-01-23 08:56:51',1,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_pplwbofgjkhgahigqrzknsxvyyqcxifmxqwh` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_jychgenftzzhlfpuowpjfmioiockcamvzarz` (`siteId`),
  KEY `fk_faqlygmtptzweiufqopctbccohggdckkpcro` (`fieldId`),
  KEY `fk_dbtpntfcgcsloasotewrhvorbkvwgebjebsr` (`userId`),
  CONSTRAINT `fk_bugbxsuwavukqwvmqnbjdrajyljvqdwjwvxo` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dbtpntfcgcsloasotewrhvorbkvwgebjebsr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_faqlygmtptzweiufqopctbccohggdckkpcro` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jychgenftzzhlfpuowpjfmioiockcamvzarz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
INSERT INTO `changedfields` VALUES (2,1,5,'17bd8943-7c32-4e2e-a7ea-7199a5dde208','2026-01-23 16:21:38',0,1),(2,2,5,'17bd8943-7c32-4e2e-a7ea-7199a5dde208','2026-01-22 17:52:57',0,1),(11,1,6,'8a8999b5-fe5e-4226-9093-65d582264591','2026-01-22 17:48:04',0,1),(11,1,7,'4017fac0-2898-4409-ad1e-ec6249c689f6','2026-01-22 17:48:04',0,1),(11,1,8,'d4c1a906-0f18-4a89-9e5a-507ca13c89ff','2026-01-22 17:48:04',0,1),(11,1,9,'7f0b6c56-6b6d-468c-8db8-50efb3a4a289','2026-01-22 17:48:04',0,1),(11,1,12,'cb0fb487-6cd3-42cf-acdd-fd5fc50078c1','2026-01-22 17:48:04',0,1),(11,1,13,'2c7837c0-d6c7-4020-98eb-d25a07225f81','2026-01-22 17:48:05',0,1),(29,1,16,'2bc8b0ff-8abd-4868-a4fa-9818af2a25b0','2026-01-22 17:10:52',0,1),(29,2,7,'d69862f2-0a28-456d-8a2d-d4bd68742237','2026-01-22 17:52:57',0,1),(29,2,8,'bf8b14fd-f17b-49b0-9f54-2c1de26ac35b','2026-01-22 17:52:57',0,1),(29,2,16,'2bc8b0ff-8abd-4868-a4fa-9818af2a25b0','2026-01-22 17:52:57',0,1),(29,2,16,'5528d40c-9778-484c-af27-6e73d4bceb76','2026-01-22 17:52:57',0,1),(29,2,16,'b98f0d65-c090-4667-acc2-d43a013294fb','2026-01-22 17:52:57',0,1),(52,1,17,'58689691-2514-4290-9e6b-78c0a104ed12','2026-01-23 08:33:05',1,1),(52,2,17,'58689691-2514-4290-9e6b-78c0a104ed12','2026-01-23 08:33:05',0,1),(53,1,16,'f83f07a8-5734-47b8-941d-4b87564fc96d','2026-01-23 08:33:05',1,1),(53,2,16,'f83f07a8-5734-47b8-941d-4b87564fc96d','2026-01-23 08:33:05',0,1),(55,1,17,'58689691-2514-4290-9e6b-78c0a104ed12','2026-01-23 08:59:02',0,1),(55,2,7,'ea0e9734-e321-41b5-a238-cfda14ef1495','2026-01-23 08:56:52',1,1),(55,2,8,'16a2ecaa-edfd-4aa8-b125-906d04fb3fb9','2026-01-23 08:56:52',1,1),(55,2,17,'58689691-2514-4290-9e6b-78c0a104ed12','2026-01-23 08:56:52',1,1),(56,1,7,'583e4528-253a-49b4-8bc8-fcf8e3b5b97c','2026-01-23 08:53:14',0,1),(56,1,16,'178cb144-75a4-4ec7-8ff8-b1aebb236b2a','2026-01-23 08:53:21',0,1),(56,2,7,'583e4528-253a-49b4-8bc8-fcf8e3b5b97c','2026-01-23 08:56:51',1,1),(56,2,16,'178cb144-75a4-4ec7-8ff8-b1aebb236b2a','2026-01-23 08:56:51',1,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentblocks`
--

DROP TABLE IF EXISTS `contentblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_istakjflyjivkmuwsbsiorwvnpzmswiupdvh` (`primaryOwnerId`),
  KEY `idx_kqvnyfqpuygoonqogcjxijugjtbizinbnlzv` (`fieldId`),
  CONSTRAINT `fk_nxkrlnnuamnmeqbswmafnzquhdsazwloerak` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oxjgexnpsqfhxscheaqkthhfmmyjzhoakokb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wtvebgbmcsygbmzcsmpdpvofelkztbgndjql` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentblocks`
--

LOCK TABLES `contentblocks` WRITE;
/*!40000 ALTER TABLE `contentblocks` DISABLE KEYS */;
INSERT INTO `contentblocks` VALUES (53,52,17);
/*!40000 ALTER TABLE `contentblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_fralsfbcykszdoxjmvyqfofnzipaqchkumcl` (`userId`),
  CONSTRAINT `fk_fralsfbcykszdoxjmvyqfofnzipaqchkumcl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fingerprint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gnwcuzlhjigfgmeskifbwmpmsmhvinuwjcni` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_eecqkvdvwwrhmljlgcgdjysecurndnwqqrbm` (`creatorId`,`provisional`),
  KEY `idx_hrfdlrtffcrspcjmmdghxaevxurohuhkvqpf` (`saved`),
  KEY `fk_oifhpmmxihwibpeghiucjdzmqbkqwqubfqoo` (`canonicalId`),
  CONSTRAINT `fk_eeiwnpzhwjabmukkrqyajrdwjhacfoeduivj` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_oifhpmmxihwibpeghiucjdzmqbkqwqubfqoo` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
INSERT INTO `drafts` VALUES (2,NULL,1,0,'First draft',NULL,0,NULL,0),(24,NULL,1,0,'First draft',NULL,0,NULL,1),(26,NULL,1,0,'First draft',NULL,0,NULL,1);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_pshqbkmchphwurtxidsqwplutbxnqsgmtqrr` (`elementId`,`timestamp`,`userId`),
  KEY `fk_ghwjdqbhwwxvevmqtdojggjxwbkshivxtfwh` (`userId`),
  KEY `fk_uibbrdtsjsphudaesrdlqjvydsxtgqaekclf` (`siteId`),
  KEY `fk_ntnfubgqadmbirnkqhjffuhyjunuwiwrkpug` (`draftId`),
  CONSTRAINT `fk_ghwjdqbhwwxvevmqtdojggjxwbkshivxtfwh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kepxxyejbriwaehjkhfphyrlrojfobtkepwr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ntnfubgqadmbirnkqhjffuhyjunuwiwrkpug` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uibbrdtsjsphudaesrdlqjvydsxtgqaekclf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
INSERT INTO `elementactivity` VALUES (1,1,1,NULL,'view','2026-01-21 10:49:40'),(2,1,1,NULL,'edit','2026-01-23 16:20:32'),(2,1,1,NULL,'save','2026-01-23 16:21:38'),(2,1,1,NULL,'view','2026-01-23 16:21:33'),(5,1,1,NULL,'view','2026-01-21 14:01:16'),(11,1,2,NULL,'edit','2026-01-22 17:51:54'),(11,1,1,NULL,'save','2026-01-22 17:47:53'),(11,1,2,NULL,'view','2026-01-22 17:52:50'),(29,1,2,NULL,'edit','2026-01-22 17:52:54'),(29,1,1,NULL,'view','2026-01-23 09:28:18'),(52,1,2,NULL,'save','2026-01-23 08:33:05'),(52,1,1,NULL,'view','2026-01-23 08:52:48'),(55,1,1,NULL,'save','2026-01-23 08:59:02'),(55,1,1,NULL,'view','2026-01-23 08:59:09'),(56,1,1,NULL,'save','2026-01-23 08:56:51'),(56,1,1,NULL,'view','2026-01-23 08:58:57'),(62,1,1,NULL,'edit','2026-01-23 09:14:32'),(62,1,1,NULL,'view','2026-01-23 09:16:06'),(80,1,1,NULL,'view','2026-01-23 09:28:18'),(105,1,1,NULL,'view','2026-01-23 14:37:27');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tbdrzikogwanzjxfuzpkwsrnfcrlbgafpaoc` (`dateDeleted`),
  KEY `idx_lzbjujiltscicujhyjdjisyadvbkandojdfo` (`fieldLayoutId`),
  KEY `idx_kwjpadrhklbxakvuggjyjhpmeeszkjkeafrf` (`type`),
  KEY `idx_jqrboclrxqfnkeeeaavudrdfefhfuysgafqy` (`enabled`),
  KEY `idx_ocvyjrixfhexdqyiplbzjybpaqghsibmjilq` (`canonicalId`),
  KEY `idx_wfnggtctplweirkgotuijflkjucmaxvbksxx` (`archived`,`dateCreated`),
  KEY `idx_hznlkxzchbrcpyinwoftylbthfsmaodavikq` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_smnhvussmptsfcdaqvrwrgzppljipqrhdjbu` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_fhotnoezexpeljpxqtxvgywglzwvfxvfvbgk` (`draftId`),
  KEY `fk_hkptgjlgklwsrikynhvrupeovazwerejebfm` (`revisionId`),
  CONSTRAINT `fk_bgplwgwdtgbsclvzpmcsmanvvvzxhzmsidde` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_fhotnoezexpeljpxqtxvgywglzwvfxvfvbgk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hkptgjlgklwsrikynhvrupeovazwerejebfm` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_riwzqhibwjzpecmsyrqvvdnxcmbnmjxpxzpk` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2026-01-21 10:24:45','2026-01-22 14:28:20',NULL,NULL,NULL,'48181e7e-e47d-4df2-bd64-b38d7e272794'),(2,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2026-01-21 12:13:20','2026-01-23 16:21:38',NULL,NULL,NULL,'6ca1e5dd-b0b5-4919-bdb2-06dae48875e1'),(5,NULL,2,NULL,5,'craft\\elements\\Entry',1,0,'2026-01-21 14:00:20','2026-01-21 14:00:20',NULL,NULL,NULL,'234ce77a-3355-4eac-8e0d-6a3599833523'),(9,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2026-01-21 14:32:35','2026-01-21 14:33:19',NULL,'2026-01-21 14:33:19',NULL,'e77b98ad-7182-479f-b728-cbc0102e7cdc'),(10,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2026-01-21 15:57:49','2026-01-21 15:57:49',NULL,NULL,NULL,'bacfe83e-4db8-4f1f-9181-6cdbf3c2788c'),(11,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-01-21 15:58:33','2026-01-22 17:52:57',NULL,'2026-01-22 17:52:57',NULL,'b8de7f8a-68ca-45e5-bc9f-1e6d74ce0438'),(18,NULL,NULL,NULL,6,'craft\\elements\\GlobalSet',1,0,'2026-01-22 10:31:18','2026-01-22 18:00:49',NULL,NULL,NULL,'85074937-dff7-4c16-9d2c-0c76875fea4a'),(26,2,NULL,10,4,'craft\\elements\\Entry',1,0,'2026-01-22 16:13:12','2026-01-22 16:13:12',NULL,NULL,NULL,'befa8d29-e64b-4e07-989f-8c6a2a5bfc6e'),(29,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2026-01-22 16:26:26','2026-01-22 17:52:57',NULL,NULL,NULL,'7119e720-15c5-46f1-b621-cf65fd5dad81'),(30,2,NULL,11,4,'craft\\elements\\Entry',1,0,'2026-01-22 16:26:26','2026-01-22 16:26:26',NULL,NULL,NULL,'5019175d-5618-4c65-bf4f-9519811c734c'),(31,29,NULL,12,7,'craft\\elements\\Entry',1,0,'2026-01-22 16:26:26','2026-01-22 16:26:26',NULL,NULL,NULL,'bbd97f0e-c8a1-4ada-b09d-c8d5049ce0d5'),(34,2,NULL,13,4,'craft\\elements\\Entry',1,0,'2026-01-22 17:10:52','2026-01-22 17:10:52',NULL,NULL,NULL,'a9db594e-b78b-47ea-a418-411d416e4ed7'),(35,29,NULL,14,7,'craft\\elements\\Entry',1,0,'2026-01-22 17:10:52','2026-01-22 17:10:52',NULL,NULL,NULL,'0e1fad25-a850-419a-bb34-047bd6dec6c9'),(39,2,NULL,15,4,'craft\\elements\\Entry',1,0,'2026-01-22 17:48:04','2026-01-22 17:48:04',NULL,NULL,NULL,'3c7be505-84f5-4da5-9b08-2a7e5e8c70d3'),(40,11,NULL,16,5,'craft\\elements\\Entry',1,0,'2026-01-22 17:48:04','2026-01-22 17:48:04',NULL,'2026-01-22 17:52:57',NULL,'61b964b0-d73c-42f3-a3dd-d1186de84c49'),(45,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-01-22 17:52:57','2026-01-22 17:52:57',NULL,NULL,NULL,'0233de5b-1a0c-4a58-a5e3-faf8ecc1275a'),(46,2,NULL,17,4,'craft\\elements\\Entry',1,0,'2026-01-22 17:52:57','2026-01-22 17:52:57',NULL,NULL,NULL,'5e77aad9-cc8c-4ca3-8298-9ffc0137d681'),(47,45,NULL,18,5,'craft\\elements\\Entry',1,0,'2026-01-22 17:52:57','2026-01-22 17:52:57',NULL,NULL,NULL,'ff188030-8d40-48c9-812f-5a28a37c7c2b'),(48,29,NULL,19,7,'craft\\elements\\Entry',1,0,'2026-01-22 17:52:57','2026-01-22 17:52:57',NULL,NULL,NULL,'033147f1-c98f-4543-835e-18edce20c99f'),(52,NULL,24,NULL,9,'craft\\elements\\Entry',1,0,'2026-01-23 08:32:53','2026-01-23 08:33:05',NULL,NULL,NULL,'3264eaca-662a-4887-8b3c-c224ff02d939'),(53,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-01-23 08:32:53','2026-01-23 08:33:05',NULL,NULL,NULL,'6f249755-f49c-487a-80d2-3951fdfdeb53'),(55,NULL,26,NULL,9,'craft\\elements\\Entry',1,0,'2026-01-23 08:52:56','2026-01-23 08:59:14',NULL,'2026-01-23 08:59:14',NULL,'45e341d6-4022-460b-b583-f256f615a168'),(56,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2026-01-23 08:53:00','2026-01-23 08:59:02',NULL,'2026-01-23 08:59:02',NULL,'1714785d-a084-4827-9fc4-0ed2e0fc6b6d'),(62,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-01-23 09:07:48','2026-01-23 09:16:13',NULL,'2026-01-23 09:16:13',NULL,'11a68b30-934f-47bd-8a4f-7403009c47ea'),(63,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2026-01-23 09:07:48','2026-01-23 09:16:12',NULL,'2026-01-23 09:16:12',1,'b3b7e349-3905-439e-8c74-16b44ff1ae9a'),(64,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2026-01-23 09:07:48','2026-01-23 09:16:12',NULL,'2026-01-23 09:16:12',1,'f129d736-d5b5-4b6d-98f3-2fbea50804de'),(65,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2026-01-23 09:07:48','2026-01-23 09:16:13',NULL,'2026-01-23 09:16:13',1,'3f73d92a-831a-4b53-9e28-ced56b100950'),(66,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2026-01-23 09:07:48','2026-01-23 09:16:13',NULL,'2026-01-23 09:16:13',1,'6c197f1a-0173-403c-b070-d8030da6a694'),(67,2,NULL,20,4,'craft\\elements\\Entry',1,0,'2026-01-23 09:07:48','2026-01-23 09:07:48',NULL,NULL,NULL,'2a564127-f1b9-4542-be02-7ebb1b0cfc5d'),(68,62,NULL,21,9,'craft\\elements\\Entry',1,0,'2026-01-23 09:07:48','2026-01-23 09:07:48',NULL,'2026-01-23 09:16:13',NULL,'96bc4c82-f10e-4744-9774-cc12c8986633'),(69,63,NULL,22,11,'craft\\elements\\Entry',1,0,'2026-01-23 09:07:48','2026-01-23 09:07:48',NULL,'2026-01-23 09:16:12',NULL,'a7522e64-8959-4985-a5fe-bceb8c29200e'),(70,64,NULL,23,11,'craft\\elements\\Entry',1,0,'2026-01-23 09:07:48','2026-01-23 09:07:48',NULL,'2026-01-23 09:16:12',NULL,'55827cfc-eaae-47db-a799-17ae39a526ac'),(71,65,NULL,24,11,'craft\\elements\\Entry',1,0,'2026-01-23 09:07:48','2026-01-23 09:07:49',NULL,'2026-01-23 09:16:13',NULL,'85a8a2c9-f18b-4c60-bde1-3a9eff02a422'),(72,66,NULL,25,11,'craft\\elements\\Entry',1,0,'2026-01-23 09:07:48','2026-01-23 09:07:49',NULL,'2026-01-23 09:16:13',NULL,'cb4c52cf-aa9c-41c2-ba2b-b7eb7ad062c8'),(80,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2026-01-23 09:16:12','2026-01-23 09:16:12',NULL,NULL,NULL,'c94368b4-2bd8-46bb-9797-a8309bcfaa19'),(81,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2026-01-23 09:16:12','2026-01-23 09:16:12',NULL,NULL,NULL,'d3fefcb5-010f-4481-821f-44f25c3ef7aa'),(82,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2026-01-23 09:16:12','2026-01-23 09:16:12',NULL,NULL,NULL,'ecaece3a-4865-43d5-9959-f5f8f75444b1'),(83,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2026-01-23 09:16:12','2026-01-23 09:16:12',NULL,NULL,NULL,'d03d7e18-6974-4c9a-944e-9f3dd8735d0c'),(84,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2026-01-23 09:16:12','2026-01-23 09:16:12',NULL,NULL,NULL,'05327554-9927-4e42-b348-31a585e1a71a'),(85,2,NULL,26,4,'craft\\elements\\Entry',1,0,'2026-01-23 09:16:12','2026-01-23 09:16:13',NULL,NULL,NULL,'0c06a310-4792-4abb-a99e-7a9baed034df'),(86,80,NULL,27,9,'craft\\elements\\Entry',1,0,'2026-01-23 09:16:12','2026-01-23 09:16:13',NULL,NULL,NULL,'9de68988-5df6-4141-955f-87d01d3cc50c'),(87,81,NULL,28,11,'craft\\elements\\Entry',1,0,'2026-01-23 09:16:12','2026-01-23 09:16:13',NULL,NULL,NULL,'58347847-0f1b-4978-90aa-4e290b10039b'),(88,82,NULL,29,11,'craft\\elements\\Entry',1,0,'2026-01-23 09:16:12','2026-01-23 09:16:13',NULL,NULL,NULL,'42f7e2eb-f669-4266-b8af-2b67ba21addf'),(89,83,NULL,30,11,'craft\\elements\\Entry',1,0,'2026-01-23 09:16:12','2026-01-23 09:16:13',NULL,NULL,NULL,'0a856c4a-5481-4c1e-8b0b-ef455ac4de18'),(90,84,NULL,31,11,'craft\\elements\\Entry',1,0,'2026-01-23 09:16:12','2026-01-23 09:16:13',NULL,NULL,NULL,'b439284a-32ed-4b4c-bfd4-336d5f2aa3ec'),(94,NULL,NULL,NULL,12,'craft\\elements\\Entry',1,0,'2026-01-23 14:04:36','2026-01-23 14:04:36',NULL,NULL,NULL,'ac7a95f5-ee2a-41f5-8610-c08d088a63ea'),(95,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2026-01-23 14:04:36','2026-01-23 14:04:36',NULL,NULL,NULL,'4c2687b3-c5d5-446e-afea-9d94b8bb5e1a'),(96,2,NULL,32,4,'craft\\elements\\Entry',1,0,'2026-01-23 14:04:36','2026-01-23 14:04:36',NULL,NULL,NULL,'cdb557b1-ebaa-49e6-9724-d387bac73b1c'),(97,94,NULL,33,12,'craft\\elements\\Entry',1,0,'2026-01-23 14:04:36','2026-01-23 14:04:36',NULL,NULL,NULL,'f344f964-8604-414b-a671-643646522470'),(98,95,NULL,34,11,'craft\\elements\\Entry',1,0,'2026-01-23 14:04:36','2026-01-23 14:04:36',NULL,NULL,NULL,'c9f3306e-c868-4c89-b35d-3a66551086b1'),(105,NULL,NULL,NULL,13,'craft\\elements\\Entry',1,0,'2026-01-23 14:24:08','2026-01-23 14:24:08',NULL,NULL,NULL,'3ebe06c9-5bd6-4656-a27d-96436c507232'),(106,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2026-01-23 14:24:08','2026-01-23 14:24:08',NULL,NULL,NULL,'d4a557f8-ce4d-406b-9989-a821ae23d15a'),(107,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2026-01-23 14:24:08','2026-01-23 14:24:08',NULL,NULL,NULL,'4519fedf-5dc6-4140-9589-59337b90c638'),(108,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2026-01-23 14:24:08','2026-01-23 14:24:08',NULL,NULL,NULL,'19430d19-f964-4f0d-84be-acb3ac17bef1'),(109,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2026-01-23 14:24:08','2026-01-23 14:24:08',NULL,NULL,NULL,'b9d56750-f12c-453e-980a-be8947b29b2b'),(110,2,NULL,35,4,'craft\\elements\\Entry',1,0,'2026-01-23 14:24:08','2026-01-23 14:24:08',NULL,NULL,NULL,'71ed55ca-7bcd-4554-9331-24a890b9945d'),(111,105,NULL,36,13,'craft\\elements\\Entry',1,0,'2026-01-23 14:24:08','2026-01-23 14:24:08',NULL,NULL,NULL,'888a78f5-86d4-4e0e-a29e-11f421d29bda'),(112,106,NULL,37,11,'craft\\elements\\Entry',1,0,'2026-01-23 14:24:08','2026-01-23 14:24:08',NULL,NULL,NULL,'be11f107-fa03-47e2-9639-6d394024343a'),(113,107,NULL,38,11,'craft\\elements\\Entry',1,0,'2026-01-23 14:24:08','2026-01-23 14:24:08',NULL,NULL,NULL,'f3eaab87-ef03-4a81-92b1-ba14ea4b3dab'),(114,108,NULL,39,11,'craft\\elements\\Entry',1,0,'2026-01-23 14:24:08','2026-01-23 14:24:08',NULL,NULL,NULL,'6c6d0971-4378-4d72-a539-913db9c18508'),(115,109,NULL,40,11,'craft\\elements\\Entry',1,0,'2026-01-23 14:24:08','2026-01-23 14:24:08',NULL,NULL,NULL,'eb964571-5019-4410-807f-d58bf009cabb'),(118,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2026-01-23 16:19:59','2026-01-23 16:19:59',NULL,NULL,NULL,'57b2293c-53a6-4b55-b0b4-c78232982ef3'),(119,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2026-01-23 16:20:14','2026-01-23 16:20:14',NULL,NULL,NULL,'43a88cab-5ee3-447d-9148-7fa843a5cec3'),(120,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2026-01-23 16:20:19','2026-01-23 16:20:19',NULL,NULL,NULL,'f06e1e47-d9f6-4be6-8610-91992b4fe42f'),(121,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2026-01-23 16:20:22','2026-01-23 16:20:22',NULL,NULL,NULL,'5fabad72-e35e-4e96-9d27-5fd65ccc0011'),(122,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2026-01-23 16:20:26','2026-01-23 16:20:26',NULL,NULL,NULL,'76fed8f6-8651-44c8-bc12-92b7b6258784'),(123,NULL,NULL,NULL,15,'craft\\elements\\Entry',1,0,'2026-01-23 16:21:38','2026-01-23 16:21:38',NULL,NULL,NULL,'2d31afc7-82dd-40fd-ad7c-4685cd0fd219'),(124,2,NULL,41,4,'craft\\elements\\Entry',1,0,'2026-01-23 16:21:38','2026-01-23 16:21:38',NULL,NULL,NULL,'3a3556aa-f85a-4763-a3db-f992fefb4d79'),(125,123,NULL,42,15,'craft\\elements\\Entry',1,0,'2026-01-23 16:21:38','2026-01-23 16:21:38',NULL,NULL,NULL,'4c20ebb0-fb24-466f-a9d6-7e3b2ab3fafd');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_ievekaaqfytzqpruddnzrhuupdaltegwipjx` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_uxuejmltkgnxlndsojvdcsostefxkrmpxkpm` (`ownerId`),
  CONSTRAINT `fk_uxuejmltkgnxlndsojvdcsostefxkrmpxkpm` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zsvbzxeodavazfhjkafergsmyzghjlolruan` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
INSERT INTO `elements_owners` VALUES (11,2,1),(29,2,2),(31,30,2),(35,34,2),(35,39,2),(40,39,1),(45,2,1),(47,46,1),(47,67,1),(47,85,1),(47,96,1),(47,110,1),(47,124,1),(48,46,2),(48,67,2),(48,85,2),(48,96,2),(48,110,2),(48,124,2),(53,52,1),(56,55,1),(62,2,4),(63,62,1),(64,62,2),(65,62,3),(66,62,4),(68,67,4),(69,68,1),(70,68,2),(71,68,3),(72,68,4),(80,2,3),(81,80,1),(82,80,2),(83,80,3),(84,80,4),(86,85,4),(86,96,3),(86,110,3),(86,124,3),(87,86,1),(88,86,2),(89,86,3),(90,86,4),(94,2,4),(95,94,1),(97,96,5),(97,110,4),(97,124,4),(98,97,1),(105,2,5),(106,105,1),(107,105,2),(108,105,3),(109,105,4),(111,110,5),(111,124,5),(112,111,1),(113,111,2),(114,111,3),(115,111,4),(123,2,6),(125,124,6);
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xbseerpobhmrinmgvxwtfnxgzapmhdyqygyj` (`elementId`,`siteId`),
  KEY `idx_mleonydsxqukcteezbghayknnyhnjkphjsaq` (`siteId`),
  KEY `idx_rixydghfhlhfdszkohilxuseockcqtdsruyp` (`title`,`siteId`),
  KEY `idx_gvcmrjzxowmmfezkjctlimoduoasvngmyihx` (`slug`,`siteId`),
  KEY `idx_ajqykqacysyvxbpewqfifgjuucczwzozqrps` (`enabled`),
  KEY `idx_belasrpatuzsneptlwqxmrwmeejklskqbxsv` (`uri`,`siteId`),
  CONSTRAINT `fk_chotowtvyempjrrgzatopvddhjvwfblzptml` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vfftsftyuegszvwonkwoignkwktvbwjxoqos` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2026-01-21 10:24:45','2026-01-21 10:24:45','c3d34526-5333-40f5-a600-48915ee475e3'),(2,2,1,'Homepage','homepage','__home__',NULL,1,'2026-01-21 12:13:20','2026-01-21 12:13:20','c7c01db5-9326-4b4c-a1ee-50b908c129d2'),(3,2,2,'Homepage','homepage','__home__',NULL,1,'2026-01-21 12:13:20','2026-01-21 12:13:20','f6f5f4d0-b2e0-4264-ba0a-dd40470d0fc3'),(8,5,1,NULL,'__temp_vfaqlvfpmfdihlloktpewxqvhqsrjjotnmwx',NULL,NULL,1,'2026-01-21 14:00:20','2026-01-21 14:00:20','ab6c96ca-47a7-4df1-8335-1b9017c51b2e'),(9,5,2,NULL,'__temp_vfaqlvfpmfdihlloktpewxqvhqsrjjotnmwx',NULL,NULL,1,'2026-01-21 14:00:20','2026-01-21 14:00:20','521e49fe-49ef-43b3-98cb-eb30785fe0a5'),(16,9,1,'Circles Copia',NULL,NULL,NULL,1,'2026-01-21 14:32:35','2026-01-21 14:32:35','05cce988-b7f3-4cb1-a04a-64dbf0d32600'),(17,9,2,'Circles Copia',NULL,NULL,NULL,1,'2026-01-21 14:32:37','2026-01-21 14:32:37','91d062c8-4cbf-4e0b-83ae-2dabb8c4e279'),(18,10,1,'Hero fontana',NULL,NULL,NULL,1,'2026-01-21 15:57:49','2026-01-21 15:57:49','33276279-a854-4ba4-a2ff-4d39e945851a'),(19,10,2,'Hero fontana',NULL,NULL,NULL,1,'2026-01-21 15:57:50','2026-01-21 15:57:50','23fb1d13-e031-4341-91db-26f8ad1f325b'),(20,11,1,NULL,NULL,NULL,'{\"2c7837c0-d6c7-4020-98eb-d25a07225f81\": {\"type\": \"url\", \"title\": \"Acquista i biglietti\", \"value\": \"https://google.it\", \"target\": \"_blank\"}, \"4017fac0-2898-4409-ad1e-ec6249c689f6\": \"La Fontana di Trevi,\", \"6a7056b8-5a93-4e11-b979-ddca12bf63ad\": [10], \"6f85adcd-9983-4bdd-83b4-b40299697ec5\": \"speciale\", \"7f0b6c56-6b6d-468c-8db8-50efb3a4a289\": \"tra arte, storia e meraviglia.\", \"8a8999b5-fe5e-4226-9093-65d582264591\": \"un capolavoro senza tempo\", \"cb0fb487-6cd3-42cf-acdd-fd5fc50078c1\": \"Nessuna segnalazione.\", \"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\": \"Un nuovo accesso per vivere da vicino uno dei simboli più amati di Roma,\"}',1,'2026-01-21 15:58:33','2026-01-22 17:48:04','c5428869-12bd-4566-8668-35d22ab5b7a2'),(21,11,2,NULL,'__temp_jjiaqdirfzcmeorzwkixekzornuvgnbfouxd',NULL,'{\"4017fac0-2898-4409-ad1e-ec6249c689f6\": \"test\", \"6a7056b8-5a93-4e11-b979-ddca12bf63ad\": [10], \"6f85adcd-9983-4bdd-83b4-b40299697ec5\": \"speciale\", \"8a8999b5-fe5e-4226-9093-65d582264591\": \"test\", \"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\": \"test\"}',1,'2026-01-21 15:58:33','2026-01-21 15:58:33','358c87f8-0cbf-4b6c-98ff-9ae8af181b3c'),(34,18,1,NULL,NULL,NULL,'{\"42119478-8531-4043-b8e4-cb408a6b35eb\": \"21:00\", \"a211aabe-547c-446e-9ab1-7775fd3fa616\": [{\"col1\": \"Lunedì\", \"col3\": \"11:30\", \"col4\": \"22:00\", \"col5\": \"Lunedì 2 e 16 febbraio l’ingresso sarà dalle 14.00\"}, {\"col1\": \"Martedì\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Mercoledì\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Giovedì\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Venerdì\", \"col3\": \"11:30\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Sabato\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Domenica\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}]}',1,'2026-01-22 10:31:18','2026-01-22 10:34:07','00c88f0f-6b0e-468f-abbb-78073c0f3b22'),(35,18,2,NULL,NULL,NULL,'{\"42119478-8531-4043-b8e4-cb408a6b35eb\": \"21:00\", \"a211aabe-547c-446e-9ab1-7775fd3fa616\": [{\"col1\": \"Monday\", \"col3\": \"11:30\", \"col4\": \"22:00\", \"col5\": \"Monday February 2 and 16, entry will be from 14:00\"}, {\"col1\": \"Tuesday\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Wednesday\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Thursday\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Friday\", \"col3\": \"11:30\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Saturday\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Sunday\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}]}',1,'2026-01-22 10:31:18','2026-01-22 18:00:49','7d0961b5-b671-49e1-a95d-b8b979145074'),(50,26,1,'Homepage','homepage','__home__',NULL,1,'2026-01-22 16:13:12','2026-01-22 16:13:12','101ff2f3-836f-460c-9ca2-275f718add23'),(51,26,2,'Homepage','homepage','__home__',NULL,1,'2026-01-22 16:13:12','2026-01-22 16:13:12','390d3d4b-1c53-4a64-9f0f-21fa992f9959'),(56,29,1,NULL,NULL,NULL,'{\"2bc8b0ff-8abd-4868-a4fa-9818af2a25b0\": \"<h2>Se sei residente a Roma?</h2><p>Se risiedi a Roma o nella Città Metropolitana puoi entrare <strong>gratuitamente</strong> presentando la carta di identità.</p>\", \"5528d40c-9778-484c-af27-6e73d4bceb76\": \"<p>Il contributo di accesso aiuta a proteggere la Fontana di Trevi e a migliorare l\'esperienza di visita.</p><ul><li>Più tutela e manutenzione</li><li>Migliore gestione dei flussi</li></ul>\", \"b98f0d65-c090-4667-acc2-d43a013294fb\": \"<h4><strong>Se non sei residente a Roma</strong></h4><p>Il biglietto, dal <strong>costo di 2 €</strong>, consente l\'accesso al catino della Fontana di Trevi.</p><h4><strong>Puoi acquistare</strong></h4><ul><li>un biglietto open e utilizzarlo in qualsiasi giorno</li><li>un biglietto per data e orario specifico</li></ul><h4><strong>Puoi pagare</strong></h4><ul><li>all\'ingresso, solo con carta</li><li>online e accedere direttamente con il QR Code</li></ul>\", \"bf8b14fd-f17b-49b0-9f54-2c1de26ac35b\": \"Scopri come entrare, quando visitare e perché è previsto un contributo.\", \"d69862f2-0a28-456d-8a2d-d4bd68742237\": \"Modalità di visita e accesso\"}',1,'2026-01-22 16:26:26','2026-01-22 17:10:52','44aca2ed-3928-45f4-b6b0-9682b29a694a'),(57,29,2,NULL,NULL,NULL,'{\"2bc8b0ff-8abd-4868-a4fa-9818af2a25b0\": \"<h2>Are you a resident of Rome?</h2><p>If you live in Rome or the Metropolitan City you can enter <strong>for free</strong> by presenting an ID document.</p>\", \"5528d40c-9778-484c-af27-6e73d4bceb76\": \"<p>The access contribution helps protect the Trevi Fountain and improve the visiting experience.</p><ul><li>More protection and maintenance</li><li>Better crowd management</li></ul>\", \"b98f0d65-c090-4667-acc2-d43a013294fb\": \"<h4><strong>If you are not a resident of Rome</strong></h4><p>The ticket, at a <strong>cost of €2</strong>, grants access to the basin of the Trevi Fountain.</p><h4><strong>You can purchase</strong></h4><ul><li>an open ticket and use it on any day</li><li>a ticket for a specific date and time</li></ul><h4><strong>You can pay</strong></h4><ul><li>at the entrance, card only</li><li>online and access directly with the QR Code</li></ul>\", \"bf8b14fd-f17b-49b0-9f54-2c1de26ac35b\": \"Find out how to enter, when to visit, and why a contribution is required.\", \"d69862f2-0a28-456d-8a2d-d4bd68742237\": \"Visit options and access\"}',1,'2026-01-22 16:26:26','2026-01-22 17:52:57','4774a79b-fbf1-4dee-a5c5-bae9cb896923'),(58,30,1,'Homepage','homepage','__home__',NULL,1,'2026-01-22 16:26:26','2026-01-22 16:26:26','33582771-baca-4347-a27a-1fb8300ac195'),(59,30,2,'Homepage','homepage','__home__',NULL,1,'2026-01-22 16:26:26','2026-01-22 16:26:26','ba261095-261a-4d09-8ee9-478ea527c7b8'),(60,31,1,NULL,NULL,NULL,'{\"2bc8b0ff-8abd-4868-a4fa-9818af2a25b0\": \"<p>Se risiedi a Roma o nella Città Metropolitana puoi entrare <strong>gratuitamente</strong> presentando la carta di identità.</p>\", \"5528d40c-9778-484c-af27-6e73d4bceb76\": \"<p>Il contributo di accesso aiuta a proteggere la Fontana di Trevi e a migliorare l\'esperienza di visita.</p><ul><li>Più tutela e manutenzione</li><li>Migliore gestione dei flussi</li></ul>\", \"b98f0d65-c090-4667-acc2-d43a013294fb\": \"<h4><strong>Se non sei residente a Roma</strong></h4><p>Il biglietto, dal <strong>costo di 2 €</strong>, consente l\'accesso al catino della Fontana di Trevi.</p><h4><strong>Puoi acquistare</strong></h4><ul><li>un biglietto open e utilizzarlo in qualsiasi giorno</li><li>un biglietto per data e orario specifico</li></ul><h4><strong>Puoi pagare</strong></h4><ul><li>all\'ingresso, solo con carta</li><li>online e accedere direttamente con il QR Code</li></ul>\", \"bf8b14fd-f17b-49b0-9f54-2c1de26ac35b\": \"Scopri come entrare, quando visitare e perché è previsto un contributo.\", \"d69862f2-0a28-456d-8a2d-d4bd68742237\": \"Modalità di visita e accesso\"}',1,'2026-01-22 16:26:26','2026-01-22 16:26:26','2e65fc3a-60bd-4903-9cc3-2de456e36293'),(61,31,2,NULL,NULL,NULL,'{\"b98f0d65-c090-4667-acc2-d43a013294fb\": \"<h4><strong>Se non sei residente a Roma</strong></h4><p>Il biglietto, dal <strong>costo di 2 €</strong>, consente l\'accesso al catino della Fontana di Trevi.</p><h4><strong>Puoi acquistare</strong></h4><ul><li>un biglietto open e utilizzarlo in qualsiasi giorno</li><li>un biglietto per data e orario specifico</li></ul><h4><strong>Puoi pagare</strong></h4><ul><li>all\'ingresso, solo con carta</li><li>online e accedere direttamente con il QR Code</li></ul>\", \"bf8b14fd-f17b-49b0-9f54-2c1de26ac35b\": \"Scopri come entrare, quando visitare e perché è previsto un contributo.\", \"d69862f2-0a28-456d-8a2d-d4bd68742237\": \"Modalità di visita e accesso\"}',1,'2026-01-22 16:26:26','2026-01-22 16:26:26','6360caa2-f591-4944-86c0-dedb85eaef44'),(66,34,1,'Homepage','homepage','__home__',NULL,1,'2026-01-22 17:10:52','2026-01-22 17:10:52','81ab53c8-dfe7-4ea4-8c58-2d9b9918774e'),(67,34,2,'Homepage','homepage','__home__',NULL,1,'2026-01-22 17:10:52','2026-01-22 17:10:52','22f93352-e741-4910-9d13-f0298def70a3'),(68,35,1,NULL,NULL,NULL,'{\"2bc8b0ff-8abd-4868-a4fa-9818af2a25b0\": \"<h2>Se sei residente a Roma?</h2><p>Se risiedi a Roma o nella Città Metropolitana puoi entrare <strong>gratuitamente</strong> presentando la carta di identità.</p>\", \"5528d40c-9778-484c-af27-6e73d4bceb76\": \"<p>Il contributo di accesso aiuta a proteggere la Fontana di Trevi e a migliorare l\'esperienza di visita.</p><ul><li>Più tutela e manutenzione</li><li>Migliore gestione dei flussi</li></ul>\", \"b98f0d65-c090-4667-acc2-d43a013294fb\": \"<h4><strong>Se non sei residente a Roma</strong></h4><p>Il biglietto, dal <strong>costo di 2 €</strong>, consente l\'accesso al catino della Fontana di Trevi.</p><h4><strong>Puoi acquistare</strong></h4><ul><li>un biglietto open e utilizzarlo in qualsiasi giorno</li><li>un biglietto per data e orario specifico</li></ul><h4><strong>Puoi pagare</strong></h4><ul><li>all\'ingresso, solo con carta</li><li>online e accedere direttamente con il QR Code</li></ul>\", \"bf8b14fd-f17b-49b0-9f54-2c1de26ac35b\": \"Scopri come entrare, quando visitare e perché è previsto un contributo.\", \"d69862f2-0a28-456d-8a2d-d4bd68742237\": \"Modalità di visita e accesso\"}',1,'2026-01-22 17:10:52','2026-01-22 17:10:52','5735e779-4353-46e0-95eb-59975af99372'),(69,35,2,NULL,NULL,NULL,'{\"b98f0d65-c090-4667-acc2-d43a013294fb\": \"<h4><strong>Se non sei residente a Roma</strong></h4><p>Il biglietto, dal <strong>costo di 2 €</strong>, consente l\'accesso al catino della Fontana di Trevi.</p><h4><strong>Puoi acquistare</strong></h4><ul><li>un biglietto open e utilizzarlo in qualsiasi giorno</li><li>un biglietto per data e orario specifico</li></ul><h4><strong>Puoi pagare</strong></h4><ul><li>all\'ingresso, solo con carta</li><li>online e accedere direttamente con il QR Code</li></ul>\", \"bf8b14fd-f17b-49b0-9f54-2c1de26ac35b\": \"Scopri come entrare, quando visitare e perché è previsto un contributo.\", \"d69862f2-0a28-456d-8a2d-d4bd68742237\": \"Modalità di visita e accesso\"}',1,'2026-01-22 17:10:52','2026-01-22 17:10:52','15157def-cccd-46c7-afdf-20d6beb1f96f'),(76,39,1,'Homepage','homepage','__home__',NULL,1,'2026-01-22 17:48:04','2026-01-22 17:48:04','dc1f0afc-3c92-44c4-ae5b-38da46b678d2'),(77,39,2,'Homepage','homepage','__home__',NULL,1,'2026-01-22 17:48:04','2026-01-22 17:48:04','8755fea2-b34e-4748-a095-512a6ff874ae'),(78,40,1,NULL,NULL,NULL,'{\"2c7837c0-d6c7-4020-98eb-d25a07225f81\": {\"type\": \"url\", \"title\": \"Acquista i biglietti\", \"value\": \"https://google.it\", \"target\": \"_blank\"}, \"4017fac0-2898-4409-ad1e-ec6249c689f6\": \"La Fontana di Trevi,\", \"6a7056b8-5a93-4e11-b979-ddca12bf63ad\": [10], \"6f85adcd-9983-4bdd-83b4-b40299697ec5\": \"speciale\", \"7f0b6c56-6b6d-468c-8db8-50efb3a4a289\": \"tra arte, storia e meraviglia.\", \"8a8999b5-fe5e-4226-9093-65d582264591\": \"un capolavoro senza tempo\", \"cb0fb487-6cd3-42cf-acdd-fd5fc50078c1\": \"Nessuna segnalazione.\", \"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\": \"Un nuovo accesso per vivere da vicino uno dei simboli più amati di Roma,\"}',1,'2026-01-22 17:48:05','2026-01-22 17:48:05','46dc5d64-de2f-4893-a172-d1c8a9c47372'),(79,40,2,NULL,'__temp_jjiaqdirfzcmeorzwkixekzornuvgnbfouxd',NULL,'{\"4017fac0-2898-4409-ad1e-ec6249c689f6\": \"test\", \"6a7056b8-5a93-4e11-b979-ddca12bf63ad\": [10], \"6f85adcd-9983-4bdd-83b4-b40299697ec5\": \"speciale\", \"8a8999b5-fe5e-4226-9093-65d582264591\": \"test\", \"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\": \"test\"}',1,'2026-01-22 17:48:05','2026-01-22 17:48:05','6c356f30-76db-4b1c-9245-6c53461559f8'),(88,45,2,NULL,NULL,NULL,'{\"2c7837c0-d6c7-4020-98eb-d25a07225f81\": {\"type\": \"url\", \"title\": \"Buy tickets\", \"value\": \"https://google.it\", \"target\": \"_blank\"}, \"4017fac0-2898-4409-ad1e-ec6249c689f6\": \"The Trevi Fountain,\", \"6a7056b8-5a93-4e11-b979-ddca12bf63ad\": [10], \"6f85adcd-9983-4bdd-83b4-b40299697ec5\": \"speciale\", \"7f0b6c56-6b6d-468c-8db8-50efb3a4a289\": \"between art, history, and wonder.\", \"8a8999b5-fe5e-4226-9093-65d582264591\": \"a timeless masterpiece\", \"cb0fb487-6cd3-42cf-acdd-fd5fc50078c1\": \"Nothing to report\", \"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\": \"A new access to experience up close one of Rome\'s most beloved symbols,\"}',1,'2026-01-22 17:52:57','2026-01-22 17:52:57','a67c1856-799e-4743-8c85-5de983107932'),(89,45,1,NULL,NULL,NULL,'{\"2c7837c0-d6c7-4020-98eb-d25a07225f81\": {\"type\": \"url\", \"title\": \"Acquista i biglietti\", \"value\": \"https://google.it\", \"target\": \"_blank\"}, \"4017fac0-2898-4409-ad1e-ec6249c689f6\": \"La Fontana di Trevi,\", \"6a7056b8-5a93-4e11-b979-ddca12bf63ad\": [10], \"6f85adcd-9983-4bdd-83b4-b40299697ec5\": \"speciale\", \"7f0b6c56-6b6d-468c-8db8-50efb3a4a289\": \"tra arte, storia e meraviglia.\", \"8a8999b5-fe5e-4226-9093-65d582264591\": \"un capolavoro senza tempo\", \"cb0fb487-6cd3-42cf-acdd-fd5fc50078c1\": \"Nessuna segnalazione.\", \"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\": \"Un nuovo accesso per vivere da vicino uno dei simboli più amati di Roma,\"}',1,'2026-01-22 17:52:57','2026-01-22 17:52:57','5fd4802b-fa86-4aac-9553-84be91339d15'),(90,46,2,'Homepage','homepage','__home__',NULL,1,'2026-01-22 17:52:57','2026-01-22 17:52:57','f09dc5cf-c8d4-4545-8b10-8a8eb5abef8b'),(91,46,1,'Homepage','homepage','__home__',NULL,1,'2026-01-22 17:52:57','2026-01-22 17:52:57','89bc1e25-aa96-4dbd-9e4e-2ea63e41d977'),(92,47,2,NULL,NULL,NULL,'{\"2c7837c0-d6c7-4020-98eb-d25a07225f81\": {\"type\": \"url\", \"title\": \"Buy tickets\", \"value\": \"https://google.it\", \"target\": \"_blank\"}, \"4017fac0-2898-4409-ad1e-ec6249c689f6\": \"The Trevi Fountain,\", \"6a7056b8-5a93-4e11-b979-ddca12bf63ad\": [10], \"6f85adcd-9983-4bdd-83b4-b40299697ec5\": \"speciale\", \"7f0b6c56-6b6d-468c-8db8-50efb3a4a289\": \"between art, history, and wonder.\", \"8a8999b5-fe5e-4226-9093-65d582264591\": \"a timeless masterpiece\", \"cb0fb487-6cd3-42cf-acdd-fd5fc50078c1\": \"Nothing to report\", \"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\": \"A new access to experience up close one of Rome\'s most beloved symbols,\"}',1,'2026-01-22 17:52:57','2026-01-22 17:52:57','900e894f-2cfa-4440-bef9-6701903de27a'),(93,47,1,NULL,NULL,NULL,'{\"2c7837c0-d6c7-4020-98eb-d25a07225f81\": {\"type\": \"url\", \"title\": \"Acquista i biglietti\", \"value\": \"https://google.it\", \"target\": \"_blank\"}, \"4017fac0-2898-4409-ad1e-ec6249c689f6\": \"La Fontana di Trevi,\", \"6a7056b8-5a93-4e11-b979-ddca12bf63ad\": [10], \"6f85adcd-9983-4bdd-83b4-b40299697ec5\": \"speciale\", \"7f0b6c56-6b6d-468c-8db8-50efb3a4a289\": \"tra arte, storia e meraviglia.\", \"8a8999b5-fe5e-4226-9093-65d582264591\": \"un capolavoro senza tempo\", \"cb0fb487-6cd3-42cf-acdd-fd5fc50078c1\": \"Nessuna segnalazione.\", \"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\": \"Un nuovo accesso per vivere da vicino uno dei simboli più amati di Roma,\"}',1,'2026-01-22 17:52:57','2026-01-22 17:52:57','f2e607a4-78ba-4874-984a-9448ea4c8bda'),(94,48,2,NULL,NULL,NULL,'{\"2bc8b0ff-8abd-4868-a4fa-9818af2a25b0\": \"<h2>Are you a resident of Rome?</h2><p>If you live in Rome or the Metropolitan City you can enter <strong>for free</strong> by presenting an ID document.</p>\", \"5528d40c-9778-484c-af27-6e73d4bceb76\": \"<p>The access contribution helps protect the Trevi Fountain and improve the visiting experience.</p><ul><li>More protection and maintenance</li><li>Better crowd management</li></ul>\", \"b98f0d65-c090-4667-acc2-d43a013294fb\": \"<h4><strong>If you are not a resident of Rome</strong></h4><p>The ticket, at a <strong>cost of €2</strong>, grants access to the basin of the Trevi Fountain.</p><h4><strong>You can purchase</strong></h4><ul><li>an open ticket and use it on any day</li><li>a ticket for a specific date and time</li></ul><h4><strong>You can pay</strong></h4><ul><li>at the entrance, card only</li><li>online and access directly with the QR Code</li></ul>\", \"bf8b14fd-f17b-49b0-9f54-2c1de26ac35b\": \"Find out how to enter, when to visit, and why a contribution is required.\", \"d69862f2-0a28-456d-8a2d-d4bd68742237\": \"Visit options and access\"}',1,'2026-01-22 17:52:57','2026-01-22 17:52:57','3b44c5c8-2a24-4b16-9762-528dd0be7a04'),(95,48,1,NULL,NULL,NULL,'{\"2bc8b0ff-8abd-4868-a4fa-9818af2a25b0\": \"<h2>Se sei residente a Roma?</h2><p>Se risiedi a Roma o nella Città Metropolitana puoi entrare <strong>gratuitamente</strong> presentando la carta di identità.</p>\", \"5528d40c-9778-484c-af27-6e73d4bceb76\": \"<p>Il contributo di accesso aiuta a proteggere la Fontana di Trevi e a migliorare l\'esperienza di visita.</p><ul><li>Più tutela e manutenzione</li><li>Migliore gestione dei flussi</li></ul>\", \"b98f0d65-c090-4667-acc2-d43a013294fb\": \"<h4><strong>Se non sei residente a Roma</strong></h4><p>Il biglietto, dal <strong>costo di 2 €</strong>, consente l\'accesso al catino della Fontana di Trevi.</p><h4><strong>Puoi acquistare</strong></h4><ul><li>un biglietto open e utilizzarlo in qualsiasi giorno</li><li>un biglietto per data e orario specifico</li></ul><h4><strong>Puoi pagare</strong></h4><ul><li>all\'ingresso, solo con carta</li><li>online e accedere direttamente con il QR Code</li></ul>\", \"bf8b14fd-f17b-49b0-9f54-2c1de26ac35b\": \"Scopri come entrare, quando visitare e perché è previsto un contributo.\", \"d69862f2-0a28-456d-8a2d-d4bd68742237\": \"Modalità di visita e accesso\"}',1,'2026-01-22 17:52:57','2026-01-22 17:52:57','6cf0be44-76a5-43d6-8de4-26f195894a41'),(102,52,2,NULL,'__temp_ziacgxlftgsvdedwkkmtvuwmlbmfuertzfvy',NULL,NULL,1,'2026-01-23 08:32:53','2026-01-23 08:33:05','d6e9cbeb-2398-46d9-9ad7-9285061372ad'),(103,52,1,NULL,'__temp_ziacgxlftgsvdedwkkmtvuwmlbmfuertzfvy',NULL,NULL,1,'2026-01-23 08:32:53','2026-01-23 08:33:05','4f65938d-e6a0-488e-8f31-3185b277c574'),(104,53,2,NULL,NULL,NULL,'{\"f83f07a8-5734-47b8-941d-4b87564fc96d\": \"<p>bvb</p>\"}',1,'2026-01-23 08:32:53','2026-01-23 08:33:05','59fddd30-9e44-4d63-9b39-d4d5cf10e2bb'),(105,53,1,NULL,NULL,NULL,'{\"f83f07a8-5734-47b8-941d-4b87564fc96d\": \"<p>bvb</p>\"}',1,'2026-01-23 08:32:53','2026-01-23 08:33:05','2384b60e-4b31-419b-886b-4c286c1cb832'),(108,55,1,NULL,'__temp_rappfzrrljkaxivtjlzcmtcwyvnekurqgaxh',NULL,NULL,1,'2026-01-23 08:52:56','2026-01-23 08:59:02','ce41270d-0d8b-4858-9de3-f53f31f2db00'),(109,55,2,NULL,'__temp_knxowheuufvbuadzveyfvctizcdaqivycwhz',NULL,NULL,1,'2026-01-23 08:52:56','2026-01-23 08:56:51','ef8be8a7-b7ee-4551-b402-cb362f6130e1'),(110,56,1,NULL,'',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p><strong>Puoi acquistarlo:</strong></p><ul><li>online, dal sito <a href=\\\"https://vivaticket.com/\\\">vivaticket.com</a></li><li>presso i punti vendita del Sistema Musei e i Punti Informativi Turistici</li><li>all\'ingresso, solo con carta</li></ul><p><strong>Il biglietto è gratuito per:</strong></p><ul><li>i bambini <strong>da 0 a 5 anni</strong></li><li>le persone <strong>con disabilità e i loro accompagnatori</strong></li></ul><p><strong>Metodi di pagamento</strong></p><p>Tradizionali</p><p> </p><p>Alternativi</p><p> </p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"1. Acquista il biglietto\"}',1,'2026-01-23 08:53:00','2026-01-23 08:56:51','c8b07166-8c0c-418b-910c-7d657e1c3dd4'),(111,56,2,NULL,'',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p><strong>Puoi acquistarlo:</strong></p><ul><li>online, dal sito <a href=\\\"https://vivaticket.com/\\\">vivaticket.com</a></li><li>presso i punti vendita del Sistema Musei e i Punti Informativi Turistici</li><li>all\'ingresso, solo con carta</li></ul><p><strong>Il biglietto è gratuito per:</strong></p><ul><li>i bambini <strong>da 0 a 5 anni</strong></li><li>le persone <strong>con disabilità e i loro accompagnatori</strong></li></ul><p><strong>Metodi di pagamento</strong></p><p>Tradizionali</p><p> </p><p>Alternativi</p><p> </p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"1. Acquista il biglietto\"}',1,'2026-01-23 08:53:00','2026-01-23 08:56:51','cd61d290-6dd9-4a66-8ecc-9fa2aa205482'),(122,62,1,NULL,NULL,NULL,'{\"16a2ecaa-edfd-4aa8-b125-906d04fb3fb9\": \"Indicazioni pratiche per l\'accesso alla Fontana di Trevi\", \"ea0e9734-e321-41b5-a238-cfda14ef1495\": \"Come funziona l\'accesso\"}',1,'2026-01-23 09:07:48','2026-01-23 09:07:48','2abd216a-aa3a-46fa-92f4-5f6ab9ca0a4f'),(123,62,2,NULL,'__temp_ktdvsfwnajsacscyrmayhjmhcvymqjeaxodh',NULL,'{\"16a2ecaa-edfd-4aa8-b125-906d04fb3fb9\": \"Indicazioni pratiche per l\'accesso alla Fontana di Trevi\", \"ea0e9734-e321-41b5-a238-cfda14ef1495\": \"Come funziona l\'accesso\"}',1,'2026-01-23 09:07:48','2026-01-23 09:07:48','89f2a54a-514c-4611-bcfc-154a9cc64531'),(124,63,1,NULL,NULL,NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<h4><strong>Puoi acquistarlo:</strong></h4><ul><li>online, dal sito <a href=\\\"https://vivaticket.com/\\\">vivaticket.com</a></li><li>presso i punti vendita del Sistema Musei e i Punti Informativi Turistici</li><li>all\'ingresso, solo con carta</li></ul><h4><strong>Il biglietto è gratuito per:</strong></h4><ul><li>i bambini <strong>da 0 a 5 anni</strong></li><li>le persone <strong>con disabilità e i loro accompagnatori</strong></li></ul><h4><strong>Metodi di pagamento</strong></h4><p>Tradizionali</p><p> </p><p>Alternativi</p><p> </p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"1. Acquista il biglietto\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:07:48','2026-01-23 09:07:48','fccc9a1a-1a5a-40db-8bdc-c9d2c70415ba'),(125,63,2,NULL,'__temp_veywfvvweibmfmsafqgevxhbenzbkqhehexj',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<h4><strong>Puoi acquistarlo:</strong></h4><ul><li>online, dal sito <a href=\\\"https://vivaticket.com/\\\">vivaticket.com</a></li><li>presso i punti vendita del Sistema Musei e i Punti Informativi Turistici</li><li>all\'ingresso, solo con carta</li></ul><h4><strong>Il biglietto è gratuito per:</strong></h4><ul><li>i bambini <strong>da 0 a 5 anni</strong></li><li>le persone <strong>con disabilità e i loro accompagnatori</strong></li></ul><h4><strong>Metodi di pagamento</strong></h4><p>Tradizionali</p><p> </p><p>Alternativi</p><p> </p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"1. Acquista il biglietto\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:07:48','2026-01-23 09:07:48','08c647a9-d4d6-4540-8b0f-bc3082d21e3d'),(126,64,1,NULL,NULL,NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>Il punto di ingresso è raggiungibile da Via della Stamperia, dove un operatore con apposito scanner ne verificherà la validità.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"2. Raggiungi l\'ingresso\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:07:48','2026-01-23 09:07:48','60ca2dc6-d0ff-4afe-81ef-b3975b321ed6'),(127,64,2,NULL,NULL,NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>Il punto di ingresso è raggiungibile da Via della Stamperia, dove un operatore con apposito scanner ne verificherà la validità.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"2. Raggiungi l\'ingresso\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:07:48','2026-01-23 09:07:48','3bc27da8-2ab2-4343-8a8e-963ec9d37f4b'),(128,65,1,NULL,'__temp_ozfcznvvlhxluntzjmmmnvcwuhuquakuhlbr',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<h4><strong>Regole importanti</strong></h4><p>Per rispettare e preservare la Fontana di Trevi e assicurare una visita piacevole per tutti:</p><ul><li>Non mangiare o bere</li><li>Non fumare</li><li>Non sedersi sul bordo della vasca</li></ul><p>Grazie per aiutare a preservare la Fontana di Trevi.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"3. Accedi all\'area monumentale\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:07:48','2026-01-23 09:07:48','fac4b126-3676-4b08-9641-810db720a832'),(129,65,2,NULL,'__temp_ozfcznvvlhxluntzjmmmnvcwuhuquakuhlbr',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<h4><strong>Regole importanti</strong></h4><p>Per rispettare e preservare la Fontana di Trevi e assicurare una visita piacevole per tutti:</p><ul><li>Non mangiare o bere</li><li>Non fumare</li><li>Non sedersi sul bordo della vasca</li></ul><p>Grazie per aiutare a preservare la Fontana di Trevi.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"3. Accedi all\'area monumentale\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:07:48','2026-01-23 09:07:48','4f8d7b3a-234e-46c2-a00e-49f8b4aeb7cb'),(130,66,1,NULL,'__temp_savflrtcnarnhgxuggttabyfhmlzlmitbpvr',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>L\'uscita si trova sul lato opposto dell\'ingresso. Seguire le indicazioni del personale per defluire in sicurezza.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"4. Uscita\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:07:48','2026-01-23 09:07:48','a855516d-79f0-4303-a09b-d46efd557e50'),(131,66,2,NULL,'__temp_savflrtcnarnhgxuggttabyfhmlzlmitbpvr',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>L\'uscita si trova sul lato opposto dell\'ingresso. Seguire le indicazioni del personale per defluire in sicurezza.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"4. Uscita\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:07:48','2026-01-23 09:07:48','91d2792d-5c53-4c0d-ac32-35388c2a7360'),(132,67,1,'Homepage','homepage','__home__',NULL,1,'2026-01-23 09:07:48','2026-01-23 09:07:48','e6c626bb-6a5e-4725-a545-9e1038a199d5'),(133,67,2,'Homepage','homepage','__home__',NULL,1,'2026-01-23 09:07:48','2026-01-23 09:07:48','03b972fe-b767-4e83-b79a-e7a72a3950c3'),(134,68,1,NULL,NULL,NULL,'{\"16a2ecaa-edfd-4aa8-b125-906d04fb3fb9\": \"Indicazioni pratiche per l\'accesso alla Fontana di Trevi\", \"ea0e9734-e321-41b5-a238-cfda14ef1495\": \"Come funziona l\'accesso\"}',1,'2026-01-23 09:07:48','2026-01-23 09:07:48','4fbe1a66-9774-4997-b117-21a5df61daa7'),(135,68,2,NULL,'__temp_ktdvsfwnajsacscyrmayhjmhcvymqjeaxodh',NULL,'{\"16a2ecaa-edfd-4aa8-b125-906d04fb3fb9\": \"Indicazioni pratiche per l\'accesso alla Fontana di Trevi\", \"ea0e9734-e321-41b5-a238-cfda14ef1495\": \"Come funziona l\'accesso\"}',1,'2026-01-23 09:07:48','2026-01-23 09:07:48','86be4357-38ec-45b9-9a49-fcdefeee6f12'),(136,69,1,NULL,NULL,NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<h4><strong>Puoi acquistarlo:</strong></h4><ul><li>online, dal sito <a href=\\\"https://vivaticket.com/\\\">vivaticket.com</a></li><li>presso i punti vendita del Sistema Musei e i Punti Informativi Turistici</li><li>all\'ingresso, solo con carta</li></ul><h4><strong>Il biglietto è gratuito per:</strong></h4><ul><li>i bambini <strong>da 0 a 5 anni</strong></li><li>le persone <strong>con disabilità e i loro accompagnatori</strong></li></ul><h4><strong>Metodi di pagamento</strong></h4><p>Tradizionali</p><p> </p><p>Alternativi</p><p> </p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"1. Acquista il biglietto\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:07:48','2026-01-23 09:07:48','893b5362-df3d-44a6-8240-bef8f4d44c43'),(137,69,2,NULL,'__temp_veywfvvweibmfmsafqgevxhbenzbkqhehexj',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<h4><strong>Puoi acquistarlo:</strong></h4><ul><li>online, dal sito <a href=\\\"https://vivaticket.com/\\\">vivaticket.com</a></li><li>presso i punti vendita del Sistema Musei e i Punti Informativi Turistici</li><li>all\'ingresso, solo con carta</li></ul><h4><strong>Il biglietto è gratuito per:</strong></h4><ul><li>i bambini <strong>da 0 a 5 anni</strong></li><li>le persone <strong>con disabilità e i loro accompagnatori</strong></li></ul><h4><strong>Metodi di pagamento</strong></h4><p>Tradizionali</p><p> </p><p>Alternativi</p><p> </p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"1. Acquista il biglietto\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:07:48','2026-01-23 09:07:48','7d0bf596-7ea7-4677-9c95-28d2107672bd'),(138,70,1,NULL,NULL,NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>Il punto di ingresso è raggiungibile da Via della Stamperia, dove un operatore con apposito scanner ne verificherà la validità.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"2. Raggiungi l\'ingresso\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:07:48','2026-01-23 09:07:48','e1766ae4-4cad-4da5-8878-a118caa8fb1c'),(139,70,2,NULL,NULL,NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>Il punto di ingresso è raggiungibile da Via della Stamperia, dove un operatore con apposito scanner ne verificherà la validità.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"2. Raggiungi l\'ingresso\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:07:48','2026-01-23 09:07:48','dad582e7-7154-4b32-b826-cfbed28c95b4'),(140,71,1,NULL,'__temp_ozfcznvvlhxluntzjmmmnvcwuhuquakuhlbr',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<h4><strong>Regole importanti</strong></h4><p>Per rispettare e preservare la Fontana di Trevi e assicurare una visita piacevole per tutti:</p><ul><li>Non mangiare o bere</li><li>Non fumare</li><li>Non sedersi sul bordo della vasca</li></ul><p>Grazie per aiutare a preservare la Fontana di Trevi.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"3. Accedi all\'area monumentale\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:07:49','2026-01-23 09:07:49','e6a0a1f5-3b64-4be5-a339-eda134ac7f8f'),(141,71,2,NULL,'__temp_ozfcznvvlhxluntzjmmmnvcwuhuquakuhlbr',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<h4><strong>Regole importanti</strong></h4><p>Per rispettare e preservare la Fontana di Trevi e assicurare una visita piacevole per tutti:</p><ul><li>Non mangiare o bere</li><li>Non fumare</li><li>Non sedersi sul bordo della vasca</li></ul><p>Grazie per aiutare a preservare la Fontana di Trevi.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"3. Accedi all\'area monumentale\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:07:49','2026-01-23 09:07:49','a981668f-a964-4e7f-9110-6a88345583a9'),(142,72,1,NULL,'__temp_savflrtcnarnhgxuggttabyfhmlzlmitbpvr',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>L\'uscita si trova sul lato opposto dell\'ingresso. Seguire le indicazioni del personale per defluire in sicurezza.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"4. Uscita\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:07:49','2026-01-23 09:07:49','b21b7574-d90c-49ac-a94f-fd1729ab20b5'),(143,72,2,NULL,'__temp_savflrtcnarnhgxuggttabyfhmlzlmitbpvr',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>L\'uscita si trova sul lato opposto dell\'ingresso. Seguire le indicazioni del personale per defluire in sicurezza.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"4. Uscita\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:07:49','2026-01-23 09:07:49','d920c569-c47a-4c52-bdb1-d234493bc981'),(158,80,1,NULL,NULL,NULL,'{\"16a2ecaa-edfd-4aa8-b125-906d04fb3fb9\": \"Indicazioni pratiche per l\'accesso alla Fontana di Trevi\", \"e19d53cc-8756-40dc-b9bc-478295f5d7f9\": {\"type\": \"url\", \"title\": \"Acquista i biglietti\", \"value\": \"https://google.it\", \"target\": \"_blank\"}, \"e8f09ef2-465a-441c-82da-1c62d10a493b\": \"Sostieni la bellezza della città\", \"ea0e9734-e321-41b5-a238-cfda14ef1495\": \"Come funziona l\'accesso\"}',1,'2026-01-23 09:16:12','2026-01-23 09:16:12','e508aca6-b389-472e-ac9a-d622f0d05d4f'),(159,80,2,NULL,'__temp_ktdvsfwnajsacscyrmayhjmhcvymqjeaxodh',NULL,'{\"16a2ecaa-edfd-4aa8-b125-906d04fb3fb9\": \"Indicazioni pratiche per l\'accesso alla Fontana di Trevi\", \"ea0e9734-e321-41b5-a238-cfda14ef1495\": \"Come funziona l\'accesso\"}',1,'2026-01-23 09:16:12','2026-01-23 09:16:12','1fba888b-f730-44ce-afa4-891e6ff7f7c6'),(160,81,1,NULL,NULL,NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<h4><strong>Puoi acquistarlo:</strong></h4><ul><li>online, dal sito <a href=\\\"https://vivaticket.com/\\\">vivaticket.com</a></li><li>presso i punti vendita del Sistema Musei e i Punti Informativi Turistici</li><li>all\'ingresso, solo con carta</li></ul><h4><strong>Il biglietto è gratuito per:</strong></h4><ul><li>i bambini <strong>da 0 a 5 anni</strong></li><li>le persone <strong>con disabilità e i loro accompagnatori</strong></li></ul><h4><strong>Metodi di pagamento</strong></h4><p>Tradizionali</p><p> </p><p>Alternativi</p><p> </p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"1. Acquista il biglietto\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:16:12','2026-01-23 09:16:12','dafe2f78-3484-427d-8063-ab7d6a8f98e7'),(161,81,2,NULL,'__temp_veywfvvweibmfmsafqgevxhbenzbkqhehexj',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<h4><strong>Puoi acquistarlo:</strong></h4><ul><li>online, dal sito <a href=\\\"https://vivaticket.com/\\\">vivaticket.com</a></li><li>presso i punti vendita del Sistema Musei e i Punti Informativi Turistici</li><li>all\'ingresso, solo con carta</li></ul><h4><strong>Il biglietto è gratuito per:</strong></h4><ul><li>i bambini <strong>da 0 a 5 anni</strong></li><li>le persone <strong>con disabilità e i loro accompagnatori</strong></li></ul><h4><strong>Metodi di pagamento</strong></h4><p>Tradizionali</p><p> </p><p>Alternativi</p><p> </p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"1. Acquista il biglietto\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:16:12','2026-01-23 09:16:12','f816bc6c-8ea7-44eb-b407-65c535d2953a'),(162,82,1,NULL,NULL,NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>Il punto di ingresso è raggiungibile da Via della Stamperia, dove un operatore con apposito scanner ne verificherà la validità.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"2. Raggiungi l\'ingresso\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:16:12','2026-01-23 09:16:12','c2fdd080-cdb7-4bc2-b0d1-8d971c3380bf'),(163,82,2,NULL,NULL,NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>Il punto di ingresso è raggiungibile da Via della Stamperia, dove un operatore con apposito scanner ne verificherà la validità.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"2. Raggiungi l\'ingresso\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:16:12','2026-01-23 09:16:12','8a542ecb-2ac8-4e39-a800-73d9be0efa80'),(164,83,1,NULL,'__temp_ozfcznvvlhxluntzjmmmnvcwuhuquakuhlbr',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<h4><strong>Regole importanti</strong></h4><p>Per rispettare e preservare la Fontana di Trevi e assicurare una visita piacevole per tutti:</p><ul><li>Non mangiare o bere</li><li>Non fumare</li><li>Non sedersi sul bordo della vasca</li></ul><p>Grazie per aiutare a preservare la Fontana di Trevi.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"3. Accedi all\'area monumentale\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:16:12','2026-01-23 09:16:12','28b77ed3-7195-4ec1-8e9c-40f9afb26558'),(165,83,2,NULL,'__temp_ozfcznvvlhxluntzjmmmnvcwuhuquakuhlbr',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<h4><strong>Regole importanti</strong></h4><p>Per rispettare e preservare la Fontana di Trevi e assicurare una visita piacevole per tutti:</p><ul><li>Non mangiare o bere</li><li>Non fumare</li><li>Non sedersi sul bordo della vasca</li></ul><p>Grazie per aiutare a preservare la Fontana di Trevi.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"3. Accedi all\'area monumentale\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:16:12','2026-01-23 09:16:12','7e8485b4-1076-43e3-bf24-eba1fe81a737'),(166,84,1,NULL,'__temp_savflrtcnarnhgxuggttabyfhmlzlmitbpvr',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>L\'uscita si trova sul lato opposto dell\'ingresso. Seguire le indicazioni del personale per defluire in sicurezza.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"4. Uscita\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:16:12','2026-01-23 09:16:12','8948e696-07d8-4a22-b4f4-c1a723d60a88'),(167,84,2,NULL,'__temp_savflrtcnarnhgxuggttabyfhmlzlmitbpvr',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>L\'uscita si trova sul lato opposto dell\'ingresso. Seguire le indicazioni del personale per defluire in sicurezza.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"4. Uscita\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:16:12','2026-01-23 09:16:12','9287e9d9-8ceb-4804-afa2-19468a47129c'),(168,85,1,'Homepage','homepage','__home__',NULL,1,'2026-01-23 09:16:13','2026-01-23 09:16:13','6e2b9a6d-5ac3-4c0d-8085-e8f424064eda'),(169,85,2,'Homepage','homepage','__home__',NULL,1,'2026-01-23 09:16:13','2026-01-23 09:16:13','8bf53a92-a062-4462-9b30-de0123b1f132'),(170,86,1,NULL,NULL,NULL,'{\"16a2ecaa-edfd-4aa8-b125-906d04fb3fb9\": \"Indicazioni pratiche per l\'accesso alla Fontana di Trevi\", \"e19d53cc-8756-40dc-b9bc-478295f5d7f9\": {\"type\": \"url\", \"title\": \"Acquista i biglietti\", \"value\": \"https://google.it\", \"target\": \"_blank\"}, \"e8f09ef2-465a-441c-82da-1c62d10a493b\": \"Sostieni la bellezza della città\", \"ea0e9734-e321-41b5-a238-cfda14ef1495\": \"Come funziona l\'accesso\"}',1,'2026-01-23 09:16:13','2026-01-23 09:16:13','6bc1141f-1671-4b52-a4bc-3a63ac78bb13'),(171,86,2,NULL,'__temp_ktdvsfwnajsacscyrmayhjmhcvymqjeaxodh',NULL,'{\"16a2ecaa-edfd-4aa8-b125-906d04fb3fb9\": \"Indicazioni pratiche per l\'accesso alla Fontana di Trevi\", \"ea0e9734-e321-41b5-a238-cfda14ef1495\": \"Come funziona l\'accesso\"}',1,'2026-01-23 09:16:13','2026-01-23 09:16:13','5b484305-8fd8-4866-9e12-9d307604c2ba'),(172,87,1,NULL,NULL,NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<h4><strong>Puoi acquistarlo:</strong></h4><ul><li>online, dal sito <a href=\\\"https://vivaticket.com/\\\">vivaticket.com</a></li><li>presso i punti vendita del Sistema Musei e i Punti Informativi Turistici</li><li>all\'ingresso, solo con carta</li></ul><h4><strong>Il biglietto è gratuito per:</strong></h4><ul><li>i bambini <strong>da 0 a 5 anni</strong></li><li>le persone <strong>con disabilità e i loro accompagnatori</strong></li></ul><h4><strong>Metodi di pagamento</strong></h4><p>Tradizionali</p><p> </p><p>Alternativi</p><p> </p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"1. Acquista il biglietto\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:16:13','2026-01-23 09:16:13','7af0ea93-e841-4f13-a70c-efdbb7bc1a63'),(173,87,2,NULL,'__temp_veywfvvweibmfmsafqgevxhbenzbkqhehexj',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<h4><strong>Puoi acquistarlo:</strong></h4><ul><li>online, dal sito <a href=\\\"https://vivaticket.com/\\\">vivaticket.com</a></li><li>presso i punti vendita del Sistema Musei e i Punti Informativi Turistici</li><li>all\'ingresso, solo con carta</li></ul><h4><strong>Il biglietto è gratuito per:</strong></h4><ul><li>i bambini <strong>da 0 a 5 anni</strong></li><li>le persone <strong>con disabilità e i loro accompagnatori</strong></li></ul><h4><strong>Metodi di pagamento</strong></h4><p>Tradizionali</p><p> </p><p>Alternativi</p><p> </p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"1. Acquista il biglietto\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:16:13','2026-01-23 09:16:13','02b4f554-83ea-4e14-956c-dc577228fd75'),(174,88,1,NULL,NULL,NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>Il punto di ingresso è raggiungibile da Via della Stamperia, dove un operatore con apposito scanner ne verificherà la validità.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"2. Raggiungi l\'ingresso\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:16:13','2026-01-23 09:16:13','47912f76-c5ad-47ad-a3e1-9c0bf3ca83be'),(175,88,2,NULL,NULL,NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>Il punto di ingresso è raggiungibile da Via della Stamperia, dove un operatore con apposito scanner ne verificherà la validità.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"2. Raggiungi l\'ingresso\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:16:13','2026-01-23 09:16:13','314591d8-9159-4bd1-b81f-50e77c8c7dc8'),(176,89,1,NULL,'__temp_ozfcznvvlhxluntzjmmmnvcwuhuquakuhlbr',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<h4><strong>Regole importanti</strong></h4><p>Per rispettare e preservare la Fontana di Trevi e assicurare una visita piacevole per tutti:</p><ul><li>Non mangiare o bere</li><li>Non fumare</li><li>Non sedersi sul bordo della vasca</li></ul><p>Grazie per aiutare a preservare la Fontana di Trevi.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"3. Accedi all\'area monumentale\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:16:13','2026-01-23 09:16:13','9fccc236-95b4-462f-b09d-eb4598594204'),(177,89,2,NULL,'__temp_ozfcznvvlhxluntzjmmmnvcwuhuquakuhlbr',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<h4><strong>Regole importanti</strong></h4><p>Per rispettare e preservare la Fontana di Trevi e assicurare una visita piacevole per tutti:</p><ul><li>Non mangiare o bere</li><li>Non fumare</li><li>Non sedersi sul bordo della vasca</li></ul><p>Grazie per aiutare a preservare la Fontana di Trevi.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"3. Accedi all\'area monumentale\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:16:13','2026-01-23 09:16:13','227745ca-399e-4c7a-b843-c74f727acb12'),(178,90,1,NULL,'__temp_savflrtcnarnhgxuggttabyfhmlzlmitbpvr',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>L\'uscita si trova sul lato opposto dell\'ingresso. Seguire le indicazioni del personale per defluire in sicurezza.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"4. Uscita\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:16:13','2026-01-23 09:16:13','1063558e-cef3-4909-b831-79a4afce1b99'),(179,90,2,NULL,'__temp_savflrtcnarnhgxuggttabyfhmlzlmitbpvr',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>L\'uscita si trova sul lato opposto dell\'ingresso. Seguire le indicazioni del personale per defluire in sicurezza.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"4. Uscita\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": false}',1,'2026-01-23 09:16:13','2026-01-23 09:16:13','e6096ee0-7a6a-4956-8889-64ca4a0933ae'),(186,94,1,NULL,NULL,NULL,'{\"038658eb-97e3-48f7-be8c-a3f09a5b3289\": \"Domande Frequenti\", \"fe85ff9b-e33a-4093-ab5d-b076a19177bf\": \"Informazioni utili per entrare e visitare la Fontana di Trevi\"}',1,'2026-01-23 14:04:36','2026-01-23 14:04:36','4d9f43f1-53c9-4a2c-92ca-55010f6590a5'),(187,94,2,NULL,NULL,NULL,'{\"038658eb-97e3-48f7-be8c-a3f09a5b3289\": \"Domande Frequenti\", \"fe85ff9b-e33a-4093-ab5d-b076a19177bf\": \"Informazioni utili per entrare e visitare la Fontana di Trevi\"}',1,'2026-01-23 14:04:36','2026-01-23 14:04:36','9efff35a-7c2f-444f-a3f2-d9739981933f'),(188,95,1,NULL,'__temp_qgzustvkgoyckmcpabzbnutmandfoadnxduz',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>Sì. Per i visitatori non residenti è previsto un contributo di accesso di 2 € per entrare nel catino monumentale.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"È necessario acquistare un biglietto per entrare?\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:04:36','2026-01-23 14:04:36','9dd66cc5-f854-4a50-a022-0adc3c88468b'),(189,95,2,NULL,'__temp_qgzustvkgoyckmcpabzbnutmandfoadnxduz',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>Sì. Per i visitatori non residenti è previsto un contributo di accesso di 2 € per entrare nel catino monumentale.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"È necessario acquistare un biglietto per entrare?\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:04:36','2026-01-23 14:04:36','c86a7333-b5cb-4e6b-8d72-ef88f4d13062'),(190,96,1,'Homepage','homepage','__home__',NULL,1,'2026-01-23 14:04:36','2026-01-23 14:04:36','56fbebe5-7251-40b6-ae33-b4205a56161c'),(191,96,2,'Homepage','homepage','__home__',NULL,1,'2026-01-23 14:04:36','2026-01-23 14:04:36','eb8f59c9-e8df-41a5-a4ad-cce7480aac4d'),(192,97,1,NULL,NULL,NULL,'{\"038658eb-97e3-48f7-be8c-a3f09a5b3289\": \"Domande Frequenti\", \"fe85ff9b-e33a-4093-ab5d-b076a19177bf\": \"Informazioni utili per entrare e visitare la Fontana di Trevi\"}',1,'2026-01-23 14:04:36','2026-01-23 14:04:36','9d6d8a11-91f6-4e7f-a7af-a758f03dc856'),(193,97,2,NULL,NULL,NULL,'{\"038658eb-97e3-48f7-be8c-a3f09a5b3289\": \"Domande Frequenti\", \"fe85ff9b-e33a-4093-ab5d-b076a19177bf\": \"Informazioni utili per entrare e visitare la Fontana di Trevi\"}',1,'2026-01-23 14:04:36','2026-01-23 14:04:36','8eb0bdc6-26a0-40f6-a0f0-13a2d7c90117'),(194,98,1,NULL,'__temp_qgzustvkgoyckmcpabzbnutmandfoadnxduz',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>Sì. Per i visitatori non residenti è previsto un contributo di accesso di 2 € per entrare nel catino monumentale.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"È necessario acquistare un biglietto per entrare?\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:04:36','2026-01-23 14:04:36','a2bf17c0-5ed6-4919-baa3-6b03b6914cd2'),(195,98,2,NULL,'__temp_qgzustvkgoyckmcpabzbnutmandfoadnxduz',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>Sì. Per i visitatori non residenti è previsto un contributo di accesso di 2 € per entrare nel catino monumentale.</p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"È necessario acquistare un biglietto per entrare?\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:04:36','2026-01-23 14:04:36','b04a080b-b5a7-4d5b-8555-9dd326ca71bd'),(208,105,1,NULL,NULL,NULL,'{\"90a6eaa8-6efe-4b9f-b319-2856bcfd6c16\": true, \"925d49a2-f95a-4773-a6a2-e38a519f766f\": {\"type\": \"url\", \"title\": \"Ottieni Indicazioni\", \"value\": \"https://google.it\", \"target\": \"_blank\"}, \"eca70139-d2af-4f8d-80d5-902935f0f81a\": \"Come raggiungerci?\"}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','50284f4f-ea87-4700-8165-33a9bf72c17b'),(209,105,2,NULL,'__temp_ohfafydwfnxkgsgdeyueaizruoluvewhlwjv',NULL,'{\"90a6eaa8-6efe-4b9f-b319-2856bcfd6c16\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','2f4fa3fd-aaec-4e25-a400-9dd7c26368b8'),(210,106,1,NULL,'__temp_fywfxqccadrhmvtpxzsviwcaohltfquijmqa',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>È possibile raggiungere la Fontana di Trevi utilizzando la ciclabile lungo il Tevere, che attraversa gran parte della città.</p><p>Dalla ciclabile si può proseguire verso il centro storico e parcheggiare la bicicletta nelle rastrelliere più vicine, situate nelle aree limitrofe a Piazza Barberini e Piazza Venezia, per poi continuare a piedi fino all\'ingresso.</p><p><i>Si consiglia di non entrare in bicicletta nell\'area monumentale.</i></p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"In bicicletta\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','bb024391-505e-4799-ae74-7fdf89f31e93'),(211,106,2,NULL,'__temp_fywfxqccadrhmvtpxzsviwcaohltfquijmqa',NULL,'{\"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','b2d43f8b-24d8-431c-965e-e0d58a5b917a'),(212,107,1,NULL,'__temp_tokzraexactnhfyiqrrjxzxjpsysljaicrcd',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>La Fontana di Trevi è facilmente raggiungibile con autobus e metropolitana dalle principali aree della città.</p><h4><strong>Metropolitana</strong></h4><ul><li>Linea A — fermata Barberini ( <strong>circa 5 minuti a piedi</strong> )</li><li>Linea B e C - fermate Colosseo (proseguire a piedi o con un autobus fino al centro storico)</li></ul><h4><strong>Autobus</strong></h4><ul><li>Linee: 118, 190F, 30, 46, 60</li></ul><p>Le fermate più vicine si trovano in prossimità di Piazza Barberini e Piazza Venezia, entrambe collegate a pochi minuti a piedi dalla Fontana.</p><p><br /> </p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"Con i mezzi pubblici\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','c9c96dfa-f396-4d08-87cf-4ca662908e53'),(213,107,2,NULL,'__temp_tokzraexactnhfyiqrrjxzxjpsysljaicrcd',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>La Fontana di Trevi è facilmente raggiungibile con autobus e metropolitana dalle principali aree della città.</p><h4><strong>Metropolitana</strong></h4><ul><li>Linea A — fermata Barberini ( <strong>circa 5 minuti a piedi</strong> )</li><li>Linea B e C - fermate Colosseo (proseguire a piedi o con un autobus fino al centro storico)</li></ul><h4><strong>Autobus</strong></h4><ul><li>Linee: 118, 190F, 30, 46, 60</li></ul><p>Le fermate più vicine si trovano in prossimità di Piazza Barberini e Piazza Venezia, entrambe collegate a pochi minuti a piedi dalla Fontana.</p><p><br /> </p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"Con i mezzi pubblici\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','8315b129-8da7-49ba-b494-6710a4d2f844'),(214,108,1,NULL,'__temp_itwnzbcvuhpezqkhikzmzxlvlrsmxnjevgao',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>L\'area della Fontana di Trevi è all\'interno della Zona a Traffico Limitato (ZTL). Si consiglia di parcheggiare all\'esterno della ZTL* e proseguire a piedi o con i mezzi pubblici fino al centro storico.</p><h4><strong>Dal parcheggio:</strong></h4><ul><li>breve tratto a piedi verso Piazza Barberini</li><li>collegamenti con bus 118, 190F, 30, 46, 60</li><li>Metro Linea A (fermata Barberini)</li></ul><p><i>*Verifica sempre gli orari della ZTL prima di accedere in auto.</i></p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"In auto\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','c067f89a-9a85-4582-930c-1734311a8ee4'),(215,108,2,NULL,'__temp_itwnzbcvuhpezqkhikzmzxlvlrsmxnjevgao',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>L\'area della Fontana di Trevi è all\'interno della Zona a Traffico Limitato (ZTL). Si consiglia di parcheggiare all\'esterno della ZTL* e proseguire a piedi o con i mezzi pubblici fino al centro storico.</p><h4><strong>Dal parcheggio:</strong></h4><ul><li>breve tratto a piedi verso Piazza Barberini</li><li>collegamenti con bus 118, 190F, 30, 46, 60</li><li>Metro Linea A (fermata Barberini)</li></ul><p><i>*Verifica sempre gli orari della ZTL prima di accedere in auto.</i></p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"In auto\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','cb6d6e79-9f74-448b-93fc-c167c4e7f83b'),(216,109,1,NULL,'__temp_nsjuugazucilkuffrpwpcqxospxrdxobhpjl',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>Da <strong>Aeroporto di Fiumicino (FCO)</strong> raggiungi la Stazione Roma Termini con:</p><ul><li>Treno Leonardo Express</li><li>Servizi navetta dedicati</li></ul><p>Da <strong>Aeroporto di Ciampino (CIA)</strong> raggiungi la Stazione Roma Termini con:</p><ul><li>Servizi navetta</li><li>Treno regionale (via stazione Ciampino)</li></ul><p>Dalla Stazione Termini è possibile raggiungere facilmente la Fontana di Trevi utilizzando la metropolitana:</p><ul><li><strong>Linea A</strong> in direzione Battistini, <strong>fermata Barberini</strong></li><li><strong>Linea B</strong> in direzione Laurentina, <strong>fermata Cavour</strong></li></ul><p>Da entrambe le fermate si prosegue a piedi verso la Fontana di Trevi seguendo le indicazioni per il centro storico.</p><p><i>Per ulteriori dettagli sui collegamenti, consulta la sezione \\\"Con i mezzi pubblici\\\".</i></p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"Dall\'aeroporto\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','f0e5aaf8-5cfb-4944-be61-dee5067b74e3'),(217,109,2,NULL,'__temp_nsjuugazucilkuffrpwpcqxospxrdxobhpjl',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>Da <strong>Aeroporto di Fiumicino (FCO)</strong> raggiungi la Stazione Roma Termini con:</p><ul><li>Treno Leonardo Express</li><li>Servizi navetta dedicati</li></ul><p>Da <strong>Aeroporto di Ciampino (CIA)</strong> raggiungi la Stazione Roma Termini con:</p><ul><li>Servizi navetta</li><li>Treno regionale (via stazione Ciampino)</li></ul><p>Dalla Stazione Termini è possibile raggiungere facilmente la Fontana di Trevi utilizzando la metropolitana:</p><ul><li><strong>Linea A</strong> in direzione Battistini, <strong>fermata Barberini</strong></li><li><strong>Linea B</strong> in direzione Laurentina, <strong>fermata Cavour</strong></li></ul><p>Da entrambe le fermate si prosegue a piedi verso la Fontana di Trevi seguendo le indicazioni per il centro storico.</p><p><i>Per ulteriori dettagli sui collegamenti, consulta la sezione \\\"Con i mezzi pubblici\\\".</i></p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"Dall\'aeroporto\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','281055fc-c278-4ff0-af98-786a2b4dbf3b'),(218,110,1,'Homepage','homepage','__home__',NULL,1,'2026-01-23 14:24:08','2026-01-23 14:24:08','ae3699b5-142c-4798-b59a-78736b40caaf'),(219,110,2,'Homepage','homepage','__home__',NULL,1,'2026-01-23 14:24:08','2026-01-23 14:24:08','f1ac1e78-0561-4b7b-834a-ce56584fdec9'),(220,111,1,NULL,NULL,NULL,'{\"90a6eaa8-6efe-4b9f-b319-2856bcfd6c16\": true, \"925d49a2-f95a-4773-a6a2-e38a519f766f\": {\"type\": \"url\", \"title\": \"Ottieni Indicazioni\", \"value\": \"https://google.it\", \"target\": \"_blank\"}, \"eca70139-d2af-4f8d-80d5-902935f0f81a\": \"Come raggiungerci?\"}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','44fd1e84-42fa-4d13-9c1c-edf66fa67d8c'),(221,111,2,NULL,'__temp_ohfafydwfnxkgsgdeyueaizruoluvewhlwjv',NULL,'{\"90a6eaa8-6efe-4b9f-b319-2856bcfd6c16\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','1adddcc0-039e-4445-851f-e0be67b0b341'),(222,112,1,NULL,'__temp_fywfxqccadrhmvtpxzsviwcaohltfquijmqa',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>È possibile raggiungere la Fontana di Trevi utilizzando la ciclabile lungo il Tevere, che attraversa gran parte della città.</p><p>Dalla ciclabile si può proseguire verso il centro storico e parcheggiare la bicicletta nelle rastrelliere più vicine, situate nelle aree limitrofe a Piazza Barberini e Piazza Venezia, per poi continuare a piedi fino all\'ingresso.</p><p><i>Si consiglia di non entrare in bicicletta nell\'area monumentale.</i></p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"In bicicletta\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','58e00c35-7044-4f78-84cf-d1f393f3120f'),(223,112,2,NULL,'__temp_fywfxqccadrhmvtpxzsviwcaohltfquijmqa',NULL,'{\"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','a88b2bab-fbdf-4632-b39a-bd19612f8236'),(224,113,1,NULL,'__temp_tokzraexactnhfyiqrrjxzxjpsysljaicrcd',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>La Fontana di Trevi è facilmente raggiungibile con autobus e metropolitana dalle principali aree della città.</p><h4><strong>Metropolitana</strong></h4><ul><li>Linea A — fermata Barberini ( <strong>circa 5 minuti a piedi</strong> )</li><li>Linea B e C - fermate Colosseo (proseguire a piedi o con un autobus fino al centro storico)</li></ul><h4><strong>Autobus</strong></h4><ul><li>Linee: 118, 190F, 30, 46, 60</li></ul><p>Le fermate più vicine si trovano in prossimità di Piazza Barberini e Piazza Venezia, entrambe collegate a pochi minuti a piedi dalla Fontana.</p><p><br /> </p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"Con i mezzi pubblici\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','6a9b8f5a-5c38-4760-958b-32a38d891da3'),(225,113,2,NULL,'__temp_tokzraexactnhfyiqrrjxzxjpsysljaicrcd',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>La Fontana di Trevi è facilmente raggiungibile con autobus e metropolitana dalle principali aree della città.</p><h4><strong>Metropolitana</strong></h4><ul><li>Linea A — fermata Barberini ( <strong>circa 5 minuti a piedi</strong> )</li><li>Linea B e C - fermate Colosseo (proseguire a piedi o con un autobus fino al centro storico)</li></ul><h4><strong>Autobus</strong></h4><ul><li>Linee: 118, 190F, 30, 46, 60</li></ul><p>Le fermate più vicine si trovano in prossimità di Piazza Barberini e Piazza Venezia, entrambe collegate a pochi minuti a piedi dalla Fontana.</p><p><br /> </p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"Con i mezzi pubblici\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','1f4be65a-d415-4594-a090-162ac36f616c'),(226,114,1,NULL,'__temp_itwnzbcvuhpezqkhikzmzxlvlrsmxnjevgao',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>L\'area della Fontana di Trevi è all\'interno della Zona a Traffico Limitato (ZTL). Si consiglia di parcheggiare all\'esterno della ZTL* e proseguire a piedi o con i mezzi pubblici fino al centro storico.</p><h4><strong>Dal parcheggio:</strong></h4><ul><li>breve tratto a piedi verso Piazza Barberini</li><li>collegamenti con bus 118, 190F, 30, 46, 60</li><li>Metro Linea A (fermata Barberini)</li></ul><p><i>*Verifica sempre gli orari della ZTL prima di accedere in auto.</i></p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"In auto\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','56c4322c-99cd-4503-a01b-b3161c361c83'),(227,114,2,NULL,'__temp_itwnzbcvuhpezqkhikzmzxlvlrsmxnjevgao',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>L\'area della Fontana di Trevi è all\'interno della Zona a Traffico Limitato (ZTL). Si consiglia di parcheggiare all\'esterno della ZTL* e proseguire a piedi o con i mezzi pubblici fino al centro storico.</p><h4><strong>Dal parcheggio:</strong></h4><ul><li>breve tratto a piedi verso Piazza Barberini</li><li>collegamenti con bus 118, 190F, 30, 46, 60</li><li>Metro Linea A (fermata Barberini)</li></ul><p><i>*Verifica sempre gli orari della ZTL prima di accedere in auto.</i></p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"In auto\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','7cc8473b-5c55-4221-b851-9fe31a4e0bb0'),(228,115,1,NULL,'__temp_nsjuugazucilkuffrpwpcqxospxrdxobhpjl',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>Da <strong>Aeroporto di Fiumicino (FCO)</strong> raggiungi la Stazione Roma Termini con:</p><ul><li>Treno Leonardo Express</li><li>Servizi navetta dedicati</li></ul><p>Da <strong>Aeroporto di Ciampino (CIA)</strong> raggiungi la Stazione Roma Termini con:</p><ul><li>Servizi navetta</li><li>Treno regionale (via stazione Ciampino)</li></ul><p>Dalla Stazione Termini è possibile raggiungere facilmente la Fontana di Trevi utilizzando la metropolitana:</p><ul><li><strong>Linea A</strong> in direzione Battistini, <strong>fermata Barberini</strong></li><li><strong>Linea B</strong> in direzione Laurentina, <strong>fermata Cavour</strong></li></ul><p>Da entrambe le fermate si prosegue a piedi verso la Fontana di Trevi seguendo le indicazioni per il centro storico.</p><p><i>Per ulteriori dettagli sui collegamenti, consulta la sezione \\\"Con i mezzi pubblici\\\".</i></p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"Dall\'aeroporto\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','e06f1d0e-13ee-4614-b201-67aad4044bc4'),(229,115,2,NULL,'__temp_nsjuugazucilkuffrpwpcqxospxrdxobhpjl',NULL,'{\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\": \"<p>Da <strong>Aeroporto di Fiumicino (FCO)</strong> raggiungi la Stazione Roma Termini con:</p><ul><li>Treno Leonardo Express</li><li>Servizi navetta dedicati</li></ul><p>Da <strong>Aeroporto di Ciampino (CIA)</strong> raggiungi la Stazione Roma Termini con:</p><ul><li>Servizi navetta</li><li>Treno regionale (via stazione Ciampino)</li></ul><p>Dalla Stazione Termini è possibile raggiungere facilmente la Fontana di Trevi utilizzando la metropolitana:</p><ul><li><strong>Linea A</strong> in direzione Battistini, <strong>fermata Barberini</strong></li><li><strong>Linea B</strong> in direzione Laurentina, <strong>fermata Cavour</strong></li></ul><p>Da entrambe le fermate si prosegue a piedi verso la Fontana di Trevi seguendo le indicazioni per il centro storico.</p><p><i>Per ulteriori dettagli sui collegamenti, consulta la sezione \\\"Con i mezzi pubblici\\\".</i></p>\", \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\": \"Dall\'aeroporto\", \"b1660981-c27c-43ea-beb9-c0d158ecedbf\": true}',1,'2026-01-23 14:24:08','2026-01-23 14:24:08','d9eadeb7-b5ac-402a-9093-1a3ad04efc4a'),(234,118,1,'01',NULL,NULL,NULL,1,'2026-01-23 16:19:59','2026-01-23 16:19:59','29794a70-11ee-4f8b-bcce-cabb493337a1'),(235,118,2,'01',NULL,NULL,NULL,1,'2026-01-23 16:19:59','2026-01-23 16:19:59','a138ee8f-1090-42a4-b049-d220baf40eb1'),(236,119,1,'02',NULL,NULL,NULL,1,'2026-01-23 16:20:14','2026-01-23 16:20:14','3cb1363b-4c08-4cb2-b70e-783844c0bdf3'),(237,119,2,'02',NULL,NULL,NULL,1,'2026-01-23 16:20:14','2026-01-23 16:20:14','8839ef29-8c3d-45d9-a999-70454b0476de'),(238,120,1,'03',NULL,NULL,NULL,1,'2026-01-23 16:20:19','2026-01-23 16:20:19','707b4c13-7bf7-423c-ab99-75875a6fc5bf'),(239,120,2,'03',NULL,NULL,NULL,1,'2026-01-23 16:20:19','2026-01-23 16:20:19','09c8ae7d-fdf7-46d4-b227-7eee02fba475'),(240,121,1,'04',NULL,NULL,NULL,1,'2026-01-23 16:20:22','2026-01-23 16:20:22','01cc4623-6058-497a-a810-d6d1887a46a4'),(241,121,2,'04',NULL,NULL,NULL,1,'2026-01-23 16:20:23','2026-01-23 16:20:23','0c3c9fe7-0780-4271-8f4e-d4eb69520d89'),(242,122,1,'05',NULL,NULL,NULL,1,'2026-01-23 16:20:26','2026-01-23 16:20:26','e2787a85-b81f-43f0-9887-e70ac390be62'),(243,122,2,'05',NULL,NULL,NULL,1,'2026-01-23 16:20:27','2026-01-23 16:20:27','dfd140fc-c1ca-4e1a-8d6d-1a32bcd5b251'),(244,123,1,NULL,NULL,NULL,'{\"28f5ac77-d497-4208-a2a6-fe325d1117ed\": \"Dall\'Acquedotto Vergine dell\'antica Roma alla fontana barocca che conosciamo oggi\", \"3878e712-a1fb-4406-9907-5c745d251ee9\": [118, 119, 120, 121, 122], \"6162870f-ac91-4993-bd51-28c3eb5f6224\": \"Approfondisci la storia del monumento\", \"69779b94-0ba0-4bb1-bee0-4cfd598570ed\": {\"type\": \"url\", \"title\": \"Scopri di piú\", \"value\": \"https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_di_trevi_mostra_dell_acqua_vergine\", \"target\": \"_blank\"}, \"bebce23a-0c91-48bf-8d10-1b88344fe02a\": \"Una storia lunga duemila anni\"}',1,'2026-01-23 16:21:38','2026-01-23 16:21:38','ad1d5a10-6dd5-4f29-809e-5ea226d9e1e9'),(245,123,2,NULL,NULL,NULL,'{\"28f5ac77-d497-4208-a2a6-fe325d1117ed\": \"Dall\'Acquedotto Vergine dell\'antica Roma alla fontana barocca che conosciamo oggi\", \"3878e712-a1fb-4406-9907-5c745d251ee9\": [118, 119, 120, 121, 122], \"6162870f-ac91-4993-bd51-28c3eb5f6224\": \"Approfondisci la storia del monumento\", \"69779b94-0ba0-4bb1-bee0-4cfd598570ed\": {\"type\": \"url\", \"title\": \"Scopri di piú\", \"value\": \"https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_di_trevi_mostra_dell_acqua_vergine\", \"target\": \"_blank\"}, \"bebce23a-0c91-48bf-8d10-1b88344fe02a\": \"Una storia lunga duemila anni\"}',1,'2026-01-23 16:21:38','2026-01-23 16:21:38','420079f4-7c66-4b15-8f1f-75bf12e8465b'),(246,124,1,'Homepage','homepage','__home__',NULL,1,'2026-01-23 16:21:38','2026-01-23 16:21:38','928b5d73-ad6c-481c-955f-74f2c05e033e'),(247,124,2,'Homepage','homepage','__home__',NULL,1,'2026-01-23 16:21:38','2026-01-23 16:21:38','37e4c05b-175f-4dff-9a91-89fb82fe1314'),(248,125,1,NULL,NULL,NULL,'{\"28f5ac77-d497-4208-a2a6-fe325d1117ed\": \"Dall\'Acquedotto Vergine dell\'antica Roma alla fontana barocca che conosciamo oggi\", \"3878e712-a1fb-4406-9907-5c745d251ee9\": [118, 119, 120, 121, 122], \"6162870f-ac91-4993-bd51-28c3eb5f6224\": \"Approfondisci la storia del monumento\", \"69779b94-0ba0-4bb1-bee0-4cfd598570ed\": {\"type\": \"url\", \"title\": \"Scopri di piú\", \"value\": \"https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_di_trevi_mostra_dell_acqua_vergine\", \"target\": \"_blank\"}, \"bebce23a-0c91-48bf-8d10-1b88344fe02a\": \"Una storia lunga duemila anni\"}',1,'2026-01-23 16:21:38','2026-01-23 16:21:38','b1079c44-3706-441e-b99b-b49918fade30'),(249,125,2,NULL,NULL,NULL,'{\"28f5ac77-d497-4208-a2a6-fe325d1117ed\": \"Dall\'Acquedotto Vergine dell\'antica Roma alla fontana barocca che conosciamo oggi\", \"3878e712-a1fb-4406-9907-5c745d251ee9\": [118, 119, 120, 121, 122], \"6162870f-ac91-4993-bd51-28c3eb5f6224\": \"Approfondisci la storia del monumento\", \"69779b94-0ba0-4bb1-bee0-4cfd598570ed\": {\"type\": \"url\", \"title\": \"Scopri di piú\", \"value\": \"https://www.sovraintendenzaroma.it/i_luoghi/roma_medioevale_e_moderna/fontane/fontana_di_trevi_mostra_dell_acqua_vergine\", \"target\": \"_blank\"}, \"bebce23a-0c91-48bf-8d10-1b88344fe02a\": \"Una storia lunga duemila anni\"}',1,'2026-01-23 16:21:38','2026-01-23 16:21:38','6e865f1b-bd02-4d65-a6d7-8c483cfd7c8d');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `status` enum('live','pending','expired') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'live',
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_duwivtbvbtubnjyrseylvocfpaevygpsdbtl` (`postDate`),
  KEY `idx_hseyxvcndjkthqzjufhbvnzzsqmhclhihjge` (`expiryDate`),
  KEY `idx_pcffggzbulvqinyuuqatviacongtoodapzgm` (`status`),
  KEY `idx_hvlhgnhheaoheswmtkcafrqevuuzndgnrrbf` (`sectionId`),
  KEY `idx_sfndkbtxnpueumopyrgatsqyacqbfowtjvjd` (`typeId`),
  KEY `idx_vpdsmzdgzfsavtfqhqxmkcesiqywubmcxrup` (`primaryOwnerId`),
  KEY `idx_dmzsstvupfxrbuaiozelzfzobdrdlhkvzovh` (`fieldId`),
  KEY `fk_kjqxldyggngjjcuepcvrvyfzfujdrhhwcegv` (`parentId`),
  CONSTRAINT `fk_hgvlgbhpiyaengcthjgmxsonokkwazfnbwix` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hxasuybzrahtprrapgmdaqnfstoedkavtgij` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kjqxldyggngjjcuepcvrvyfzfujdrhhwcegv` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_symxjjiaqyvemezdyubwblaeddveonducmfq` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xcfwfveneveaorluhomwbqjqbbvtcsgxtean` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zahegthtevhcvurqmupvzvuhwhcwlrmiypwu` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (2,1,NULL,NULL,NULL,2,'2026-01-21 12:13:00',NULL,'live',NULL,NULL,'2026-01-21 12:13:20','2026-01-21 12:13:20'),(11,NULL,NULL,2,5,3,'2026-01-21 15:58:00',NULL,'live',0,0,'2026-01-21 15:58:33','2026-01-21 15:58:33'),(26,1,NULL,NULL,NULL,2,'2026-01-21 12:13:00',NULL,'live',NULL,NULL,'2026-01-22 16:13:12','2026-01-22 16:13:12'),(29,NULL,NULL,2,5,4,'2026-01-22 16:15:00',NULL,'live',NULL,NULL,'2026-01-22 16:26:26','2026-01-22 16:26:26'),(30,1,NULL,NULL,NULL,2,'2026-01-21 12:13:00',NULL,'live',NULL,NULL,'2026-01-22 16:26:26','2026-01-22 16:26:26'),(31,NULL,NULL,30,5,4,'2026-01-22 16:15:00',NULL,'live',NULL,NULL,'2026-01-22 16:26:26','2026-01-22 16:26:26'),(34,1,NULL,NULL,NULL,2,'2026-01-21 12:13:00',NULL,'live',NULL,NULL,'2026-01-22 17:10:52','2026-01-22 17:10:52'),(35,NULL,NULL,34,5,4,'2026-01-22 16:15:00',NULL,'live',NULL,NULL,'2026-01-22 17:10:52','2026-01-22 17:10:52'),(39,1,NULL,NULL,NULL,2,'2026-01-21 12:13:00',NULL,'live',NULL,NULL,'2026-01-22 17:48:04','2026-01-22 17:48:04'),(40,NULL,NULL,39,5,3,'2026-01-21 15:58:00',NULL,'live',NULL,NULL,'2026-01-22 17:48:05','2026-01-22 17:48:05'),(45,NULL,NULL,2,5,3,'2026-01-21 15:58:00',NULL,'live',NULL,NULL,'2026-01-22 17:52:57','2026-01-22 17:52:57'),(46,1,NULL,NULL,NULL,2,'2026-01-21 12:13:00',NULL,'live',NULL,NULL,'2026-01-22 17:52:57','2026-01-22 17:52:57'),(47,NULL,NULL,46,5,3,'2026-01-21 15:58:00',NULL,'live',NULL,NULL,'2026-01-22 17:52:57','2026-01-22 17:52:57'),(48,NULL,NULL,46,5,4,'2026-01-22 16:15:00',NULL,'live',NULL,NULL,'2026-01-22 17:52:57','2026-01-22 17:52:57'),(56,NULL,NULL,55,17,6,'2026-01-23 08:56:00',NULL,'live',0,0,'2026-01-23 08:53:00','2026-01-23 08:56:51'),(62,NULL,NULL,2,5,5,'2026-01-23 09:04:00',NULL,'live',0,0,'2026-01-23 09:07:48','2026-01-23 09:07:48'),(63,NULL,NULL,62,17,6,'2026-01-23 09:02:00',NULL,'live',0,0,'2026-01-23 09:07:48','2026-01-23 09:07:48'),(64,NULL,NULL,62,17,6,'2026-01-23 09:02:00',NULL,'live',0,0,'2026-01-23 09:07:48','2026-01-23 09:07:48'),(65,NULL,NULL,62,17,6,'2026-01-23 09:04:00',NULL,'live',0,0,'2026-01-23 09:07:48','2026-01-23 09:07:48'),(66,NULL,NULL,62,17,6,'2026-01-23 09:04:00',NULL,'live',0,0,'2026-01-23 09:07:48','2026-01-23 09:07:48'),(67,1,NULL,NULL,NULL,2,'2026-01-21 12:13:00',NULL,'live',NULL,NULL,'2026-01-23 09:07:48','2026-01-23 09:07:48'),(68,NULL,NULL,67,5,5,'2026-01-23 09:04:00',NULL,'live',NULL,NULL,'2026-01-23 09:07:48','2026-01-23 09:07:48'),(69,NULL,NULL,68,17,6,'2026-01-23 09:02:00',NULL,'live',NULL,NULL,'2026-01-23 09:07:48','2026-01-23 09:07:48'),(70,NULL,NULL,68,17,6,'2026-01-23 09:02:00',NULL,'live',NULL,NULL,'2026-01-23 09:07:48','2026-01-23 09:07:48'),(71,NULL,NULL,68,17,6,'2026-01-23 09:04:00',NULL,'live',NULL,NULL,'2026-01-23 09:07:49','2026-01-23 09:07:49'),(72,NULL,NULL,68,17,6,'2026-01-23 09:04:00',NULL,'live',NULL,NULL,'2026-01-23 09:07:49','2026-01-23 09:07:49'),(80,NULL,NULL,2,5,5,'2026-01-23 09:04:00',NULL,'live',NULL,NULL,'2026-01-23 09:16:12','2026-01-23 09:16:12'),(81,NULL,NULL,80,17,6,'2026-01-23 09:02:00',NULL,'live',NULL,NULL,'2026-01-23 09:16:12','2026-01-23 09:16:12'),(82,NULL,NULL,80,17,6,'2026-01-23 09:02:00',NULL,'live',NULL,NULL,'2026-01-23 09:16:12','2026-01-23 09:16:12'),(83,NULL,NULL,80,17,6,'2026-01-23 09:04:00',NULL,'live',NULL,NULL,'2026-01-23 09:16:12','2026-01-23 09:16:12'),(84,NULL,NULL,80,17,6,'2026-01-23 09:04:00',NULL,'live',NULL,NULL,'2026-01-23 09:16:12','2026-01-23 09:16:12'),(85,1,NULL,NULL,NULL,2,'2026-01-21 12:13:00',NULL,'live',NULL,NULL,'2026-01-23 09:16:13','2026-01-23 09:16:13'),(86,NULL,NULL,85,5,5,'2026-01-23 09:04:00',NULL,'live',NULL,NULL,'2026-01-23 09:16:13','2026-01-23 09:16:13'),(87,NULL,NULL,86,17,6,'2026-01-23 09:02:00',NULL,'live',NULL,NULL,'2026-01-23 09:16:13','2026-01-23 09:16:13'),(88,NULL,NULL,86,17,6,'2026-01-23 09:02:00',NULL,'live',NULL,NULL,'2026-01-23 09:16:13','2026-01-23 09:16:13'),(89,NULL,NULL,86,17,6,'2026-01-23 09:04:00',NULL,'live',NULL,NULL,'2026-01-23 09:16:13','2026-01-23 09:16:13'),(90,NULL,NULL,86,17,6,'2026-01-23 09:04:00',NULL,'live',NULL,NULL,'2026-01-23 09:16:13','2026-01-23 09:16:13'),(94,NULL,NULL,2,5,7,'2026-01-23 14:04:00',NULL,'live',NULL,NULL,'2026-01-23 14:04:36','2026-01-23 14:04:36'),(95,NULL,NULL,94,17,6,'2026-01-23 14:04:00',NULL,'live',NULL,NULL,'2026-01-23 14:04:36','2026-01-23 14:04:36'),(96,1,NULL,NULL,NULL,2,'2026-01-21 12:13:00',NULL,'live',NULL,NULL,'2026-01-23 14:04:36','2026-01-23 14:04:36'),(97,NULL,NULL,96,5,7,'2026-01-23 14:04:00',NULL,'live',NULL,NULL,'2026-01-23 14:04:36','2026-01-23 14:04:36'),(98,NULL,NULL,97,17,6,'2026-01-23 14:04:00',NULL,'live',NULL,NULL,'2026-01-23 14:04:36','2026-01-23 14:04:36'),(105,NULL,NULL,2,5,8,'2026-01-23 14:24:00',NULL,'live',NULL,NULL,'2026-01-23 14:24:08','2026-01-23 14:24:08'),(106,NULL,NULL,105,17,6,'2026-01-23 14:21:00',NULL,'live',NULL,NULL,'2026-01-23 14:24:08','2026-01-23 14:24:08'),(107,NULL,NULL,105,17,6,'2026-01-23 14:22:00',NULL,'live',NULL,NULL,'2026-01-23 14:24:08','2026-01-23 14:24:08'),(108,NULL,NULL,105,17,6,'2026-01-23 14:23:00',NULL,'live',NULL,NULL,'2026-01-23 14:24:08','2026-01-23 14:24:08'),(109,NULL,NULL,105,17,6,'2026-01-23 14:23:00',NULL,'live',NULL,NULL,'2026-01-23 14:24:08','2026-01-23 14:24:08'),(110,1,NULL,NULL,NULL,2,'2026-01-21 12:13:00',NULL,'live',NULL,NULL,'2026-01-23 14:24:08','2026-01-23 14:24:08'),(111,NULL,NULL,110,5,8,'2026-01-23 14:24:00',NULL,'live',NULL,NULL,'2026-01-23 14:24:08','2026-01-23 14:24:08'),(112,NULL,NULL,111,17,6,'2026-01-23 14:21:00',NULL,'live',NULL,NULL,'2026-01-23 14:24:08','2026-01-23 14:24:08'),(113,NULL,NULL,111,17,6,'2026-01-23 14:22:00',NULL,'live',NULL,NULL,'2026-01-23 14:24:08','2026-01-23 14:24:08'),(114,NULL,NULL,111,17,6,'2026-01-23 14:23:00',NULL,'live',NULL,NULL,'2026-01-23 14:24:08','2026-01-23 14:24:08'),(115,NULL,NULL,111,17,6,'2026-01-23 14:23:00',NULL,'live',NULL,NULL,'2026-01-23 14:24:08','2026-01-23 14:24:08'),(123,NULL,NULL,2,5,10,'2026-01-23 16:20:00',NULL,'live',NULL,NULL,'2026-01-23 16:21:38','2026-01-23 16:21:38'),(124,1,NULL,NULL,NULL,2,'2026-01-21 12:13:00',NULL,'live',NULL,NULL,'2026-01-23 16:21:38','2026-01-23 16:21:38'),(125,NULL,NULL,124,5,10,'2026-01-23 16:20:00',NULL,'live',NULL,NULL,'2026-01-23 16:21:38','2026-01-23 16:21:38');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_oerlaicxecthgihkxmrincdmfyzpagshruxu` (`authorId`),
  KEY `idx_bexpndprituheynerkkkglcpnizwbbhughrs` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_ecufdwpckabzvmlxszxaoiutfezqncoulunx` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lwtkgnikogmaonnkzaicistcnpabgfhtufdp` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `titleFormat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jcxypkohlpsmvptobkcuswunfanwalgqfjxx` (`fieldLayoutId`),
  KEY `idx_eskoceczifnslxvkfzdcrgeczkwymxurhlme` (`dateDeleted`),
  CONSTRAINT `fk_qkivbdnggjeoegoiaqpjncxcvaricpmbtbdk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,'Pagina','pagina',NULL,'file-lines',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2026-01-21 10:24:44','2026-01-21 10:24:44','2026-01-21 14:02:29','4ced0c63-4258-4a86-82c8-474b1efeb74f'),(2,4,'Homepage','homepage',NULL,'house','sky',1,'site',NULL,NULL,1,'site',NULL,1,'2026-01-21 12:13:07','2026-01-21 12:13:07',NULL,'5cdd6615-0e0c-4415-bc3f-302dc52b1104'),(3,5,'Hero','hero',NULL,NULL,NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2026-01-21 13:57:07','2026-01-21 14:13:57',NULL,'5a26f1f1-6170-408e-8b45-bcbf7104e0cb'),(4,7,'Visita','visita',NULL,NULL,NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2026-01-22 11:33:27','2026-01-22 11:33:27',NULL,'595345f1-a17e-4be3-ba5a-8f68332aebb5'),(5,9,'Accesso','accesso',NULL,NULL,NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2026-01-23 08:22:49','2026-01-23 08:47:28',NULL,'a3863fb4-135a-49f3-ae23-44953b9accbd'),(6,11,'Accordion','accordion',NULL,NULL,NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2026-01-23 08:51:48','2026-01-23 08:51:48',NULL,'0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871'),(7,12,'FAQ','faq',NULL,NULL,NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2026-01-23 14:03:49','2026-01-23 14:03:49',NULL,'4cb11d72-0266-4f9f-802d-c3475bfa5825'),(8,13,'Come Raggiungerci','comeRaggiungerci',NULL,NULL,NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2026-01-23 14:20:22','2026-01-23 14:20:22',NULL,'26bfffe4-8789-4b00-9205-cd260b179905'),(9,14,'Storia','storia',NULL,NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2026-01-23 16:06:11','2026-01-23 16:06:11','2026-01-23 16:14:27','535aee0e-a163-4378-9f85-745454e7442f'),(10,15,'Storia','storia',NULL,NULL,NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2026-01-23 16:16:08','2026-01-23 16:18:39',NULL,'6b86bf72-f0da-4653-b9fa-e32ee61e5a6f');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_unrppcuxwsefiqsznjdagaxqdjdmihfdiseo` (`dateDeleted`),
  KEY `idx_birwjtwfujmkhuhcjagkfxvdumgohrbejvbj` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"4e712e07-92fb-4d0c-a7ef-ee31d2784a9b\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"e2454871-e445-4004-8122-a69a35bc5d1b\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-01-16T15:49:33+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-21 10:24:44','2026-01-21 10:24:44','2026-01-21 14:02:29','a55a4b0f-5bae-4ec3-80b2-4d28994730fb'),(2,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"6f6486c1-8a0e-44a5-a6dc-d97d7ad723bb\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"a8236654-4d7f-42c4-ac9b-ec8a89a2c986\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2026-01-21T11:23:56+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-21 11:27:35','2026-01-21 11:27:35',NULL,'6eea3406-ad24-4139-a27f-1a436f338122'),(3,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"b32fee4a-b785-4593-b641-8ec9e2ebd449\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"20300ee1-01c8-40be-ad1e-8bff5b107720\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2026-01-21T11:27:25+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-21 11:28:57','2026-01-21 11:28:57',NULL,'bc79064d-7f81-491a-9d9c-5f526a6ab7e0'),(4,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"8e7da487-67eb-4dea-ba73-e13d550187ef\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"31ff07db-9032-449a-a421-83bdd6c5a652\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-01-21T11:36:15+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"17bd8943-7c32-4e2e-a7ea-7199a5dde208\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"97c36746-feb8-4bc1-8b32-3e3c3259b31b\", \"required\": false, \"dateAdded\": \"2026-01-21T13:59:51+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-21 12:13:07','2026-01-21 13:59:51',NULL,'86ea3328-3d9e-49b3-bebd-48e074338644'),(5,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"8289c216-05e0-4c73-8b21-b168d59c4ed4\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"4017fac0-2898-4409-ad1e-ec6249c689f6\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"aeb11d3b-b8f3-4a5a-b89e-309cead42890\", \"required\": true, \"dateAdded\": \"2026-01-21T14:25:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"8a8999b5-fe5e-4226-9093-65d582264591\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"4033fbd4-5d65-4515-96fd-2b54697b307d\", \"required\": false, \"dateAdded\": \"2026-01-21T14:25:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"46188251-46ab-4519-916a-28b77f5aabbe\", \"required\": true, \"dateAdded\": \"2026-01-21T14:25:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"7f0b6c56-6b6d-468c-8db8-50efb3a4a289\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"e10b9023-318a-4ed3-98ca-c905871af2b4\", \"required\": false, \"dateAdded\": \"2026-01-21T14:25:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"6a7056b8-5a93-4e11-b979-ddca12bf63ad\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"2fbf1bea-4c0f-4faf-b4df-d7c7faf27656\", \"required\": true, \"dateAdded\": \"2026-01-21T14:25:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"6f85adcd-9983-4bdd-83b4-b40299697ec5\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ff59314d-d88c-469c-bb11-d18989180be0\", \"required\": false, \"dateAdded\": \"2026-01-21T15:47:11+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"cb0fb487-6cd3-42cf-acdd-fd5fc50078c1\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"de834319-7a42-478c-9f63-192de7436f20\", \"required\": false, \"dateAdded\": \"2026-01-21T15:47:11+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"2c7837c0-d6c7-4020-98eb-d25a07225f81\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7a220bd6-7d45-4cd3-9d88-7f3e583ed063\", \"required\": false, \"dateAdded\": \"2026-01-21T15:47:11+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"a39fbbec-1e9a-4b67-9a20-c8614b1a58bf\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Titolo\", \"width\": 100, \"handle\": \"titolo\", \"warning\": null, \"fieldUid\": \"61bded43-ec93-419c-a052-66062d3b33a5\", \"required\": true, \"dateAdded\": \"2026-01-21T13:57:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"layoutElement:4017fac0-2898-4409-ad1e-ec6249c689f6\", \"layoutElement:8a8999b5-fe5e-4226-9093-65d582264591\", \"layoutElement:d4c1a906-0f18-4a89-9e5a-507ca13c89ff\", \"layoutElement:7f0b6c56-6b6d-468c-8db8-50efb3a4a289\"], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-21 13:57:07','2026-01-21 15:47:11',NULL,'fdfed2e9-5260-4498-af0a-959d7357dbd7'),(6,'craft\\elements\\GlobalSet','{\"tabs\": [{\"uid\": \"643c166d-8a1d-4a15-95f0-612955c5f587\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"a211aabe-547c-446e-9ab1-7775fd3fa616\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"0e998ccf-b819-41f0-88c2-01bfa99e19e2\", \"required\": false, \"dateAdded\": \"2026-01-22T10:31:17+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"42119478-8531-4043-b8e4-cb408a6b35eb\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"3673fc41-a579-4121-81bd-d598f59eca0a\", \"required\": false, \"dateAdded\": \"2026-01-22T10:31:17+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-22 10:31:18','2026-01-22 10:31:18',NULL,'1059e71f-e91e-4765-895c-3ce6871615f0'),(7,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"63e947e7-0dc1-43e2-9dd7-66f8eacc8bec\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"d69862f2-0a28-456d-8a2d-d4bd68742237\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Titolo\", \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"aeb11d3b-b8f3-4a5a-b89e-309cead42890\", \"required\": true, \"dateAdded\": \"2026-01-22T11:33:27+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"bf8b14fd-f17b-49b0-9f54-2c1de26ac35b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"46188251-46ab-4519-916a-28b77f5aabbe\", \"required\": true, \"dateAdded\": \"2026-01-22T11:33:27+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"b98f0d65-c090-4667-acc2-d43a013294fb\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Blocco di Testo Biglietti d\'ingresso\", \"width\": 100, \"handle\": \"richTextBiglietti\", \"warning\": null, \"fieldUid\": \"53fb3da5-7c03-494f-bf94-ae71f1ac40d0\", \"required\": false, \"dateAdded\": \"2026-01-22T16:01:45+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"5528d40c-9778-484c-af27-6e73d4bceb76\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Blocco di Testo Spiegazione\", \"width\": 100, \"handle\": \"richTextSpiegazione\", \"warning\": null, \"fieldUid\": \"53fb3da5-7c03-494f-bf94-ae71f1ac40d0\", \"required\": false, \"dateAdded\": \"2026-01-22T16:24:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"2bc8b0ff-8abd-4868-a4fa-9818af2a25b0\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Testo per residenti\", \"width\": 100, \"handle\": \"richTextResidenti\", \"warning\": null, \"fieldUid\": \"53fb3da5-7c03-494f-bf94-ae71f1ac40d0\", \"required\": false, \"dateAdded\": \"2026-01-22T16:24:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-22 11:33:27','2026-01-22 16:24:31',NULL,'86d80399-4779-43f4-8d37-90f469bd72f4'),(8,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"ac89596c-f1d5-4d12-b7f6-c250f62c400c\", \"name\": null, \"elements\": [{\"tip\": null, \"uid\": \"b9f1c8a9-2624-4e15-8954-611e89e15385\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"53fb3da5-7c03-494f-bf94-ae71f1ac40d0\", \"required\": false, \"dateAdded\": \"2026-01-23T08:22:43+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-23 08:22:43','2026-01-23 08:22:43',NULL,'ea2581f9-1929-492c-927a-3e5d938f4697'),(9,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"1fbd6445-daaf-417d-9cd2-713f9e005672\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"ea0e9734-e321-41b5-a238-cfda14ef1495\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Titolo\", \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"aeb11d3b-b8f3-4a5a-b89e-309cead42890\", \"required\": true, \"dateAdded\": \"2026-01-23T08:47:28+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"16a2ecaa-edfd-4aa8-b125-906d04fb3fb9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"46188251-46ab-4519-916a-28b77f5aabbe\", \"required\": true, \"dateAdded\": \"2026-01-23T08:47:28+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"58689691-2514-4290-9e6b-78c0a104ed12\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925\", \"required\": false, \"dateAdded\": \"2026-01-23T08:22:49+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"e19d53cc-8756-40dc-b9bc-478295f5d7f9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7a220bd6-7d45-4cd3-9d88-7f3e583ed063\", \"required\": false, \"dateAdded\": \"2026-01-23T09:13:40+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"e8f09ef2-465a-441c-82da-1c62d10a493b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Sottotitolo CTA\", \"width\": 100, \"handle\": \"sottotitoloCta\", \"warning\": null, \"fieldUid\": \"46188251-46ab-4519-916a-28b77f5aabbe\", \"required\": false, \"dateAdded\": \"2026-01-23T09:15:21+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"layoutElement:ea0e9734-e321-41b5-a238-cfda14ef1495\", \"layoutElement:16a2ecaa-edfd-4aa8-b125-906d04fb3fb9\"], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-23 08:22:49','2026-01-23 09:15:21',NULL,'28865409-8d10-43f4-b02b-974ddbd33870'),(10,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"74f58b26-7376-4860-9974-fe914476f308\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"f83f07a8-5734-47b8-941d-4b87564fc96d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"53fb3da5-7c03-494f-bf94-ae71f1ac40d0\", \"required\": false, \"dateAdded\": \"2026-01-23T08:32:36+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-23 08:32:36','2026-01-23 08:33:28',NULL,'83d77750-b674-42c7-b5dd-c39e063cdfa5'),(11,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"acc1981b-e110-4c68-bcc5-927504985dce\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Titolo\", \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"aeb11d3b-b8f3-4a5a-b89e-309cead42890\", \"required\": true, \"dateAdded\": \"2026-01-23T08:51:48+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"53fb3da5-7c03-494f-bf94-ae71f1ac40d0\", \"required\": false, \"dateAdded\": \"2026-01-23T08:51:48+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"b1660981-c27c-43ea-beb9-c0d158ecedbf\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Collassabile\", \"width\": 100, \"handle\": \"collassabile\", \"warning\": null, \"fieldUid\": \"c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368\", \"required\": false, \"dateAdded\": \"2026-01-23T09:01:59+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"layoutElement:583e4528-253a-49b4-8bc8-fcf8e3b5b97c\", \"layoutElement:178cb144-75a4-4ec7-8ff8-b1aebb236b2a\"], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-23 08:51:48','2026-01-23 09:01:59',NULL,'55cdd261-47da-4b50-8f0d-e4a5d74c0aa7'),(12,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"64ba2c73-b60a-42ff-83f9-5cbc8f0ab14d\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"038658eb-97e3-48f7-be8c-a3f09a5b3289\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Titolo\", \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"aeb11d3b-b8f3-4a5a-b89e-309cead42890\", \"required\": true, \"dateAdded\": \"2026-01-23T14:03:49+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"fe85ff9b-e33a-4093-ab5d-b076a19177bf\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"46188251-46ab-4519-916a-28b77f5aabbe\", \"required\": true, \"dateAdded\": \"2026-01-23T14:03:49+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"967be471-d4a8-4519-8b96-8263e61b1e9d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925\", \"required\": false, \"dateAdded\": \"2026-01-23T14:03:49+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-23 14:03:49','2026-01-23 14:03:49',NULL,'5cbca81a-d7b0-4930-abc6-8ca973ab3224'),(13,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"0c9cb9e4-de46-4db3-bb1b-17020f546388\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"eca70139-d2af-4f8d-80d5-902935f0f81a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Titolo\", \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"aeb11d3b-b8f3-4a5a-b89e-309cead42890\", \"required\": true, \"dateAdded\": \"2026-01-23T14:20:22+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"b1e3dde6-de30-4663-a435-1b2cdb7d505e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"46188251-46ab-4519-916a-28b77f5aabbe\", \"required\": false, \"dateAdded\": \"2026-01-23T14:20:22+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"aa846d16-d7af-4698-a749-77f630042dbf\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925\", \"required\": false, \"dateAdded\": \"2026-01-23T14:20:22+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"90a6eaa8-6efe-4b9f-b319-2856bcfd6c16\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Mappa Visibile\", \"width\": 100, \"handle\": \"mappaVisibile\", \"warning\": null, \"fieldUid\": \"c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368\", \"required\": false, \"dateAdded\": \"2026-01-23T14:22:09+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"925d49a2-f95a-4773-a6a2-e38a519f766f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7a220bd6-7d45-4cd3-9d88-7f3e583ed063\", \"required\": false, \"dateAdded\": \"2026-01-23T14:22:09+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-23 14:20:22','2026-01-23 14:22:38',NULL,'20ea14d6-dcf6-4ad8-949d-eb72c1352994'),(14,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"31ccdf19-b258-4fdb-ba7a-3ccec66e11b0\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"a33462fc-cdb7-4991-9c02-99bc901a5781\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-01-23T16:05:06+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-23 16:06:11','2026-01-23 16:06:11','2026-01-23 16:14:27','74be2ad7-3cfc-49a7-904f-7865155b58b8'),(15,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"96901437-f29f-40bd-b0e5-ba44de643b78\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"bebce23a-0c91-48bf-8d10-1b88344fe02a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Titolo\", \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"aeb11d3b-b8f3-4a5a-b89e-309cead42890\", \"required\": true, \"dateAdded\": \"2026-01-23T16:18:39+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"28f5ac77-d497-4208-a2a6-fe325d1117ed\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"46188251-46ab-4519-916a-28b77f5aabbe\", \"required\": false, \"dateAdded\": \"2026-01-23T16:18:39+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"69779b94-0ba0-4bb1-bee0-4cfd598570ed\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7a220bd6-7d45-4cd3-9d88-7f3e583ed063\", \"required\": false, \"dateAdded\": \"2026-01-23T16:18:39+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"6162870f-ac91-4993-bd51-28c3eb5f6224\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Descrizione CTA\", \"width\": 100, \"handle\": \"descrizioneCTA\", \"warning\": null, \"fieldUid\": \"46188251-46ab-4519-916a-28b77f5aabbe\", \"required\": false, \"dateAdded\": \"2026-01-23T16:18:39+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"3878e712-a1fb-4406-9907-5c745d251ee9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"97222eb3-1e43-486d-b4b7-bb82d1ed0c41\", \"required\": true, \"dateAdded\": \"2026-01-23T16:18:39+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"layoutElement:bebce23a-0c91-48bf-8d10-1b88344fe02a\"], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-23 16:16:08','2026-01-23 16:20:56',NULL,'df884a95-2f9a-46e8-816b-0834bc3443b8');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uanslissgberysyqzpcpizcnflvtemuasryl` (`handle`,`context`),
  KEY `idx_kpqsugpnaksfztxamrqggunghtszgpvblrxy` (`context`),
  KEY `idx_acraoafscsgobarntlbtckrdnnnshehuhntx` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,'Seo Title','seoTitle','global',NULL,NULL,0,'site',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":60,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-01-21 12:41:20','2026-01-21 12:41:20',NULL,'85867d07-76c5-49c6-b699-3f42a9ad4cc8'),(2,'Seo Description','seoDescription','global',NULL,NULL,0,'site',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":160,\"code\":false,\"initialRows\":4,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-01-21 12:42:25','2026-01-21 12:42:25',NULL,'3e7c6349-ae7b-4066-bcb6-380ea09b4f86'),(3,'Seo Image','seoImage','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSearchInput\":true,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2026-01-21 12:48:25','2026-01-21 12:48:25',NULL,'68308c87-e785-41d2-b15b-58aefafa2c8f'),(4,'Titolo2','title2','global',NULL,NULL,0,'site',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-01-21 13:47:22','2026-01-21 13:47:22','2026-01-21 14:14:30','61bded43-ec93-419c-a052-66062d3b33a5'),(5,'Blocchi','blocchi','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"5a26f1f1-6170-408e-8b45-bcbf7104e0cb\",\"group\":\"General\"},{\"uid\":\"595345f1-a17e-4be3-ba5a-8f68332aebb5\",\"group\":\"General\"},{\"uid\":\"a3863fb4-135a-49f3-ae23-44953b9accbd\",\"group\":\"General\"},{\"uid\":\"4cb11d72-0266-4f9f-802d-c3475bfa5825\",\"group\":\"General\"},{\"uid\":\"26bfffe4-8789-4b00-9205-cd260b179905\",\"group\":\"General\"},{\"uid\":\"6b86bf72-f0da-4653-b9fa-e32ee61e5a6f\",\"group\":\"General\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":50,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"cards\"}','2026-01-21 13:57:26','2026-01-23 16:16:10',NULL,'97c36746-feb8-4bc1-8b32-3e3c3259b31b'),(6,'Titolo Seconda Riga','titoloRiga2','global',NULL,NULL,0,'site',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-01-21 14:16:29','2026-01-21 14:16:29',NULL,'4033fbd4-5d65-4515-96fd-2b54697b307d'),(7,'Titolo Prima Riga','titolo','global',NULL,NULL,0,'site',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-01-21 14:21:48','2026-01-21 14:21:48',NULL,'aeb11d3b-b8f3-4a5a-b89e-309cead42890'),(8,'Sottotitolo','sottotitolo','global',NULL,NULL,0,'site',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-01-21 14:22:30','2026-01-21 14:22:30',NULL,'46188251-46ab-4519-916a-28b77f5aabbe'),(9,'Sottotitolo Seconda Riga','sottotitoloRiga2','global',NULL,NULL,0,'site',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-01-21 14:23:02','2026-01-21 14:23:02',NULL,'e10b9023-318a-4ed3-98ca-c905871af2b4'),(10,'Video Background','video','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:c0c8eabb-1d94-449c-b621-1252e3e75ea4\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSearchInput\":true,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2026-01-21 14:24:17','2026-01-21 14:24:17',NULL,'2fbf1bea-4c0f-4faf-b4df-d7c7faf27656'),(11,'Icona Avviso Manutenzione','iconaAvvisoManutenzione','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"customOptions\":false,\"options\":[{\"label\":\"speciale\",\"value\":\"speciale\",\"icon\":\"\",\"color\":\"\",\"default\":\"1\"},{\"label\":\"orologio\",\"value\":\"orologio\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"ticket\",\"value\":\"ticket\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"attenzione\",\"value\":\"attenzione\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"divieto\",\"value\":\"divieto\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"}]}','2026-01-21 15:41:04','2026-01-21 15:41:04',NULL,'ff59314d-d88c-469c-bb11-d18989180be0'),(12,'Testo Avviso Manutenzione','testoAvvisoManutenzione','global',NULL,NULL,0,'site',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-01-21 15:41:55','2026-01-21 15:41:55',NULL,'de834319-7a42-478c-9f63-192de7436f20'),(13,'Link CTA','linkCta','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Link','{\"advancedFields\":[\"target\",\"title\",\"ariaLabel\",\"download\"],\"fullGraphqlData\":true,\"maxLength\":255,\"showLabelField\":false,\"typeSettings\":{\"asset\":{\"sources\":\"*\",\"allowedKinds\":\"*\",\"showUnpermittedVolumes\":\"\",\"showUnpermittedFiles\":\"\"},\"entry\":{\"sources\":\"*\",\"showUnpermittedSections\":\"\",\"showUnpermittedEntries\":\"\"},\"url\":{\"allowRootRelativeUrls\":\"\",\"allowAnchors\":\"\",\"allowCustomSchemes\":\"\"}},\"types\":[\"url\",\"entry\",\"asset\",\"category\",\"email\",\"tel\",\"sms\"]}','2026-01-21 15:44:32','2026-01-21 15:45:12',NULL,'7a220bd6-7d45-4cd3-9d88-7f3e583ed063'),(14,'Orari','orari','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"columns\":{\"col1\":{\"heading\":\"Giorno\",\"handle\":\"giorno\",\"width\":\"\",\"type\":\"singleline\"},\"col3\":{\"heading\":\"Apertura\",\"handle\":\"apertura\",\"width\":\"\",\"type\":\"singleline\"},\"col4\":{\"heading\":\"Chiusura\",\"handle\":\"chiusura\",\"width\":\"\",\"type\":\"singleline\"},\"col5\":{\"heading\":\"Eccezione\",\"handle\":\"eccezione\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":null,\"maxRows\":7,\"minRows\":7,\"staticRows\":false}','2026-01-22 10:26:04','2026-01-22 10:26:46',NULL,'0e998ccf-b819-41f0-88c2-01bfa99e19e2'),(15,'Orario Ultimo Ingresso','orarioUltimoIngresso','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":\"21:00\",\"uiMode\":\"normal\"}','2026-01-22 10:29:30','2026-01-22 10:29:30',NULL,'3673fc41-a579-4121-81bd-d598f59eca0a'),(16,'Blocco di Testo','richText','global',NULL,NULL,0,'site',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"*\",\"characterLimit\":null,\"ckeConfig\":\"3a97014c-fc28-4af7-b816-5428f37b05c5\",\"createButtonLabel\":null,\"defaultTransform\":null,\"expandEntryButtons\":false,\"fullGraphqlData\":true,\"parseEmbeds\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"sourceEditingGroups\":[\"__ADMINS__\"],\"wordLimit\":null}','2026-01-22 16:01:36','2026-01-22 16:01:36',NULL,'53fb3da5-7c03-494f-bf94-ae71f1ac40d0'),(17,'Lista Info','listaInfo','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":\"Aggiungi\",\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871\",\"group\":\"General\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":1,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2026-01-23 08:22:43','2026-01-23 09:03:29',NULL,'ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925'),(18,'Switch','switch','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":true,\"offLabel\":\"Off\",\"onLabel\":\"On\"}','2026-01-23 09:01:08','2026-01-23 09:01:08',NULL,'c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368'),(19,'Lista Immagini','listaImmagini','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":true,\"showSearchInput\":true,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"cards\"}','2026-01-23 16:17:53','2026-01-23 16:17:53',NULL,'97222eb3-1e43-486d-b4b7-bb82d1ed0c41');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jsgfzkosiyygsriqxpcfgabhpiamoccluqyz` (`name`),
  KEY `idx_spvovatjqrpjbjibuurewrbofavkfvsfzacb` (`handle`),
  KEY `idx_qgkjynvimqdfexaxztfkxahgdtjnkihixzze` (`fieldLayoutId`),
  KEY `idx_hkscyguzrwjhxnqhyzajdyolwjjaqmobpmsq` (`sortOrder`),
  CONSTRAINT `fk_nuvzrjthdibvbpswzehbonxdhbvlrudtewwk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wpzhomfbqdxyhkeupobthepctfrpbzuxaeoy` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
INSERT INTO `globalsets` VALUES (18,'Orari Settimanali','orariSettimanali',6,1,'2026-01-22 10:31:18','2026-01-22 10:31:18','85074937-dff7-4c16-9d2c-0c76875fea4a');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[\"sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5:read\", \"sites.b2c3d4e5-f678-90ab-cdef-123456789012:read\", \"elements.drafts:read\", \"elements.revisions:read\", \"elements.inactive:read\", \"sections.45952d02-8da9-45dc-81df-be4fea47ce47:read\", \"nestedentryfields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0:read\", \"nestedentryfields.97c36746-feb8-4bc1-8b32-3e3c3259b31b:read\", \"nestedentryfields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925:read\", \"volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4:read\", \"volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4:read\", \"globalsets.85074937-dff7-4c16-9d2c-0c76875fea4a:read\"]',1,'2026-01-21 10:24:44','2026-01-23 09:30:16','fd6020f8-2e21-4f1d-af40-1c74e81c3000');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `accessToken` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_buhgahvtnzwppcgevwipqlhnhojderscapuh` (`accessToken`),
  UNIQUE KEY `idx_biuudntfgzdjroexlqyqiwhnjjzahwdcatle` (`name`),
  KEY `fk_meqrrpontwxtpqgrhirrmkwhgkrkdlgmhdhs` (`schemaId`),
  CONSTRAINT `fk_meqrrpontwxtpqgrhirrmkwhgkrkdlgmhdhs` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
INSERT INTO `gqltokens` VALUES (1,'Public Token','__PUBLIC__',1,NULL,'2026-01-23 16:29:28',NULL,'2026-01-21 16:02:41','2026-01-23 16:29:28','f83c7305-7d16-4c26-9157-825ea2535eae');
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transformString` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nofujpoxnihksrnrvwqzgrsuphngoehtfjoz` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransformindex`
--

LOCK TABLES `imagetransformindex` WRITE;
/*!40000 ALTER TABLE `imagetransformindex` DISABLE KEYS */;
INSERT INTO `imagetransformindex` VALUES (1,118,'craft\\imagetransforms\\ImageTransformer','01.jpeg',NULL,'_120x82_crop_center-center_none',1,0,0,'2026-01-23 16:19:59','2026-01-23 16:19:59','2026-01-23 16:20:00','d932d813-6ef4-43be-abf4-26c165fa7033'),(2,118,'craft\\imagetransforms\\ImageTransformer','01.jpeg',NULL,'_240x165_crop_center-center_none',1,0,0,'2026-01-23 16:19:59','2026-01-23 16:19:59','2026-01-23 16:20:00','947d25b7-0a7d-4dfc-a5ef-9aca3fd21614'),(3,119,'craft\\imagetransforms\\ImageTransformer','02.jpeg',NULL,'_120x40_crop_center-center_none',1,0,0,'2026-01-23 16:20:14','2026-01-23 16:20:14','2026-01-23 16:20:14','5f732aaa-d1b2-4dab-81f4-a251b6e2a432'),(4,119,'craft\\imagetransforms\\ImageTransformer','02.jpeg',NULL,'_240x80_crop_center-center_none',1,0,0,'2026-01-23 16:20:14','2026-01-23 16:20:14','2026-01-23 16:20:15','73e2b1e3-e47d-4123-8771-2f486e11f165'),(5,120,'craft\\imagetransforms\\ImageTransformer','03.jpeg',NULL,'_120x67_crop_center-center_none',1,0,0,'2026-01-23 16:20:20','2026-01-23 16:20:20','2026-01-23 16:20:20','613e2b5c-4744-4759-a054-4e3c35d58638'),(6,120,'craft\\imagetransforms\\ImageTransformer','03.jpeg',NULL,'_240x134_crop_center-center_none',1,0,0,'2026-01-23 16:20:20','2026-01-23 16:20:20','2026-01-23 16:20:21','94ea6bb7-fa50-4456-bd8a-c94e92f672c3'),(7,121,'craft\\imagetransforms\\ImageTransformer','04.jpeg',NULL,'_120x80_crop_center-center_none',1,0,0,'2026-01-23 16:20:23','2026-01-23 16:20:23','2026-01-23 16:20:23','cf936bc9-6677-4e83-bb2b-888fe4ad51bf'),(8,121,'craft\\imagetransforms\\ImageTransformer','04.jpeg',NULL,'_240x160_crop_center-center_none',1,0,0,'2026-01-23 16:20:23','2026-01-23 16:20:23','2026-01-23 16:20:23','914857e7-8a44-474a-82a0-22a80862c289'),(9,122,'craft\\imagetransforms\\ImageTransformer','05.jpeg',NULL,'_120x46_crop_center-center_none',1,0,0,'2026-01-23 16:20:27','2026-01-23 16:20:27','2026-01-23 16:20:28','e4a8fc8c-9c1c-4db6-b92d-3b486c19793c'),(10,122,'craft\\imagetransforms\\ImageTransformer','05.jpeg',NULL,'_240x93_crop_center-center_none',1,0,0,'2026-01-23 16:20:27','2026-01-23 16:20:27','2026-01-23 16:20:29','8deaa43c-18e3-4c31-9479-c50d7b5b9620');
/*!40000 ALTER TABLE `imagetransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `fill` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jyhospatvbcfhvyodasmpubugjkjjnxyzhfe` (`name`),
  KEY `idx_mpzpkxymudjusdyzzbrhvsoztqzpuklgkhyi` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'5.8.23','5.8.0.3',0,'zokheondmcsi','3@ocvmxfvkgp','2026-01-21 10:24:43','2026-01-23 16:20:56','5d8b9f54-85c0-4f7e-8827-367d127b314b');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qubfgffyjhjkyakamjphgfnbsygoxkcrjmig` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','23401a1d-3970-4b70-8479-6bd82de1f474'),(2,'craft','m221101_115859_create_entries_authors_table','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','0aca7cfe-5df5-4053-a350-46ba52a316fb'),(3,'craft','m221107_112121_add_max_authors_to_sections','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','44e58caf-289a-423b-b890-d8f29406e57e'),(4,'craft','m221205_082005_translatable_asset_alt_text','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','c02ae176-07df-4aa9-a163-6784e1768f9f'),(5,'craft','m230314_110309_add_authenticator_table','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','342d8c95-fecc-4670-b4ad-20a1aefb47f0'),(6,'craft','m230314_111234_add_webauthn_table','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','848bbc36-ef64-4fa5-b511-aedb3db0c8b3'),(7,'craft','m230503_120303_add_recoverycodes_table','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','8069a907-ef86-4b44-958b-44b6ab91cd6d'),(8,'craft','m230511_000000_field_layout_configs','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','d23b47c7-38d2-4ce9-b76b-e01b09ec87fb'),(9,'craft','m230511_215903_content_refactor','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','13e2b3a7-9c0d-44dc-932c-6dd9a29bc285'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','4b5494e8-524a-4bc2-91a8-ac770db818e1'),(11,'craft','m230524_000001_entry_type_icons','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','0be37402-1cc3-4aae-bfd1-5ca76c0a5638'),(12,'craft','m230524_000002_entry_type_colors','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','5a9b3aeb-c059-49a8-bbfd-94472849f149'),(13,'craft','m230524_220029_global_entry_types','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','cc0b5cbb-1bd5-413a-a15a-aefae010f09d'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','efa48b8f-4dc5-4f45-96a5-3e7ffbacc9e0'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','95e92199-f458-4e4a-97c7-9acb1f06834c'),(16,'craft','m230616_173810_kill_field_groups','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','8ba092a6-d34e-4ba8-8c4a-a0fe543e0c34'),(17,'craft','m230616_183820_remove_field_name_limit','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','e897744d-f490-4eb8-bcaa-f0120f28cbb7'),(18,'craft','m230617_070415_entrify_matrix_blocks','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','3f797b1d-9751-4cdf-a069-eb9a92e21c04'),(19,'craft','m230710_162700_element_activity','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','ad38462c-bec2-453b-956a-b5948fe3b8f7'),(20,'craft','m230820_162023_fix_cache_id_type','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','746fdbce-da8f-45c5-96ce-c4de227a3446'),(21,'craft','m230826_094050_fix_session_id_type','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','57c1fb8d-1de9-462d-9d11-73a0cdc4ba8c'),(22,'craft','m230904_190356_address_fields','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','00b0318d-457a-44d8-9efa-65fe485b0047'),(23,'craft','m230928_144045_add_subpath_to_volumes','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','3cec4407-af68-4cba-94e9-810585760b93'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','b9534c7d-e1af-454b-abe2-8d497f9f1024'),(25,'craft','m231213_030600_element_bulk_ops','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','abb21147-8a50-49ce-a775-6e986fee28cf'),(26,'craft','m240129_150719_sites_language_amend_length','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','b0277b59-12b6-45b8-8fe7-500f7e0db798'),(27,'craft','m240206_035135_convert_json_columns','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','78a953d3-c19a-49ec-900a-4f48a2b5343c'),(28,'craft','m240207_182452_address_line_3','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','f7983d29-4ae0-4f9b-8500-4952dd8b891b'),(29,'craft','m240302_212719_solo_preview_targets','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','53a90e8d-5d3b-475d-8184-8f2d6448f450'),(30,'craft','m240619_091352_add_auth_2fa_timestamp','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','29a46ba8-0b27-4dbb-8577-a5b7186d21f1'),(31,'craft','m240723_214330_drop_bulkop_fk','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','6e90aa3f-34b1-49db-a89e-404aa4436182'),(32,'craft','m240731_053543_soft_delete_fields','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','b79536ed-f206-4987-8906-f9a038ec1f0e'),(33,'craft','m240805_154041_sso_identities','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','e5ef907a-c269-4b69-8bd6-5fad04110c01'),(34,'craft','m240926_202248_track_entries_deleted_with_section','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','0967e7d1-2e53-4e52-afbe-0c8cd910c8b0'),(35,'craft','m241120_190905_user_affiliated_sites','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','aa351eb8-497b-43ab-ab6d-f9c14708ed00'),(36,'craft','m241125_122914_add_viewUsers_permission','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','0a21a145-9572-4322-aea2-85a137fd561d'),(37,'craft','m250119_135304_entry_type_overrides','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','f46bba7d-58d1-4544-9aa7-caf385a4d683'),(38,'craft','m250206_135036_search_index_queue','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','c9a63b3b-ffb7-4cc2-b2ea-b979c5ce5304'),(39,'craft','m250207_172349_bulkop_events','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','d1257bdb-b659-4e9c-b9b3-ab912ec9201a'),(40,'craft','m250315_131608_unlimited_authors','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','062a8698-6fb7-464d-b87d-573e47b434e1'),(41,'craft','m250403_171253_static_statuses','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','67fe55a2-6beb-4c5a-abbc-80de3a65db6a'),(42,'craft','m250512_164202_asset_mime_types','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','2b3b2d98-d6f9-4a4f-aa79-6a601054bc10'),(43,'craft','m250522_090843_add_deleteEntriesForSite_and_deletePeerEntriesForSite_permissions','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','38b5483e-e926-4a84-a007-54c1881ddec0'),(44,'craft','m250531_183058_content_blocks','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','9fd551ea-18c4-45b5-9c64-8a48c7f3ba20'),(45,'craft','m250623_105031_entry_type_descriptions','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','879ce41c-551e-4636-a784-e3ca0b1137b5'),(46,'plugin:ckeditor','Install','2026-01-22 15:56:20','2026-01-22 15:56:20','2026-01-22 15:56:20','a5fa3700-adee-4979-abc9-347387cc7ae1'),(47,'plugin:ckeditor','m230408_163704_v3_upgrade','2026-01-22 15:56:20','2026-01-22 15:56:20','2026-01-22 15:56:20','56c48204-a727-411a-a09d-0947a998692d'),(48,'plugin:super-table','m240115_000000_craft5','2026-01-23 08:48:22','2026-01-23 08:48:22','2026-01-23 08:48:22','e59ae54d-fa5a-4172-bc5e-d78cb8bdadf9');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kcjpjeojijfxnjamdztzyflsggwhymuqmwhw` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (1,'ckeditor','4.11.0','3.0.0.0','2026-01-22 15:56:20','2026-01-22 15:56:20','2026-01-22 15:56:20','d3b67746-8ebd-42ca-9a27-4f77bc898d44'),(2,'super-table','4.0.5','4.0.0','2026-01-23 08:48:22','2026-01-23 08:48:22','2026-01-23 08:48:22','dd9df9df-c802-4360-a686-cabe2f528992');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.headingLevels.0','2'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.headingLevels.1','3'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.headingLevels.2','4'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.json','\"@config/ckeditor/Simple.json\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.name','\"Simple\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.toolbar.0','\"heading\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.toolbar.1','\"|\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.toolbar.10','\"numberedList\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.toolbar.11','\"|\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.toolbar.12','\"blockQuote\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.toolbar.13','\"|\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.toolbar.14','\"undo\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.toolbar.15','\"redo\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.toolbar.2','\"bold\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.toolbar.3','\"italic\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.toolbar.4','\"underline\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.toolbar.5','\"strikethrough\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.toolbar.6','\"|\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.toolbar.7','\"link\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.toolbar.8','\"|\"'),('ckeditor.configs.3a97014c-fc28-4af7-b816-5428f37b05c5.toolbar.9','\"bulletedList\"'),('dateModified','1769185256'),('email.fromEmail','\"andrea@semplice.is\"'),('email.fromName','\"fonta-trevi\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.color','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.description','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.cardThumbAlignment','\"end\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.cardView.0','\"layoutElement:583e4528-253a-49b4-8bc8-fcf8e3b5b97c\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.cardView.1','\"layoutElement:178cb144-75a4-4ec7-8ff8-b1aebb236b2a\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elementCondition','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.0.dateAdded','\"2026-01-23T08:51:48+00:00\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.0.editCondition','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.0.elementCondition','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.0.fieldUid','\"aeb11d3b-b8f3-4a5a-b89e-309cead42890\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.0.handle','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.0.includeInCards','true'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.0.instructions','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.0.label','\"Titolo\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.0.providesThumbs','false'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.0.required','true'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.0.tip','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.0.uid','\"583e4528-253a-49b4-8bc8-fcf8e3b5b97c\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.0.userCondition','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.0.warning','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.0.width','100'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.1.dateAdded','\"2026-01-23T08:51:48+00:00\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.1.editCondition','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.1.elementCondition','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.1.fieldUid','\"53fb3da5-7c03-494f-bf94-ae71f1ac40d0\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.1.handle','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.1.includeInCards','true'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.1.instructions','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.1.label','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.1.providesThumbs','false'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.1.required','false'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.1.tip','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.1.uid','\"178cb144-75a4-4ec7-8ff8-b1aebb236b2a\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.1.userCondition','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.1.warning','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.1.width','100'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.2.dateAdded','\"2026-01-23T09:01:59+00:00\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.2.editCondition','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.2.elementCondition','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.2.fieldUid','\"c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.2.handle','\"collassabile\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.2.includeInCards','true'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.2.instructions','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.2.label','\"Collassabile\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.2.providesThumbs','false'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.2.required','false'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.2.tip','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.2.uid','\"b1660981-c27c-43ea-beb9-c0d158ecedbf\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.2.userCondition','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.2.warning','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.elements.2.width','100'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.name','\"Content\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.uid','\"acc1981b-e110-4c68-bcc5-927504985dce\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.fieldLayouts.55cdd261-47da-4b50-8f0d-e4a5d74c0aa7.tabs.0.userCondition','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.handle','\"accordion\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.hasTitleField','false'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.icon','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.name','\"Accordion\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.showSlugField','true'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.showStatusField','true'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.slugTranslationKeyFormat','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.slugTranslationMethod','\"site\"'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.titleFormat','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.titleTranslationKeyFormat','null'),('entryTypes.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871.titleTranslationMethod','\"site\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.color','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.description','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.cardThumbAlignment','\"end\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elementCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.0.dateAdded','\"2026-01-23T14:20:22+00:00\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.0.editCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.0.elementCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.0.fieldUid','\"aeb11d3b-b8f3-4a5a-b89e-309cead42890\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.0.handle','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.0.includeInCards','true'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.0.instructions','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.0.label','\"Titolo\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.0.providesThumbs','false'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.0.required','true'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.0.tip','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.0.uid','\"eca70139-d2af-4f8d-80d5-902935f0f81a\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.0.userCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.0.warning','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.0.width','100'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.1.dateAdded','\"2026-01-23T14:20:22+00:00\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.1.editCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.1.elementCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.1.fieldUid','\"46188251-46ab-4519-916a-28b77f5aabbe\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.1.handle','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.1.includeInCards','true'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.1.instructions','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.1.label','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.1.providesThumbs','false'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.1.required','false'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.1.tip','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.1.uid','\"b1e3dde6-de30-4663-a435-1b2cdb7d505e\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.1.userCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.1.warning','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.1.width','100'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.2.dateAdded','\"2026-01-23T14:20:22+00:00\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.2.editCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.2.elementCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.2.fieldUid','\"ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.2.handle','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.2.includeInCards','false'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.2.instructions','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.2.label','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.2.providesThumbs','false'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.2.required','false'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.2.tip','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.2.uid','\"aa846d16-d7af-4698-a749-77f630042dbf\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.2.userCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.2.warning','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.2.width','100'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.3.dateAdded','\"2026-01-23T14:22:09+00:00\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.3.editCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.3.elementCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.3.fieldUid','\"c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.3.handle','\"mappaVisibile\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.3.includeInCards','false'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.3.instructions','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.3.label','\"Mappa Visibile\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.3.providesThumbs','false'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.3.required','false'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.3.tip','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.3.uid','\"90a6eaa8-6efe-4b9f-b319-2856bcfd6c16\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.3.userCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.3.warning','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.3.width','100'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.4.dateAdded','\"2026-01-23T14:22:09+00:00\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.4.editCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.4.elementCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.4.fieldUid','\"7a220bd6-7d45-4cd3-9d88-7f3e583ed063\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.4.handle','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.4.includeInCards','false'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.4.instructions','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.4.label','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.4.providesThumbs','false'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.4.required','false'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.4.tip','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.4.uid','\"925d49a2-f95a-4773-a6a2-e38a519f766f\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.4.userCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.4.warning','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.elements.4.width','100'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.name','\"Content\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.uid','\"0c9cb9e4-de46-4db3-bb1b-17020f546388\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.fieldLayouts.20ea14d6-dcf6-4ad8-949d-eb72c1352994.tabs.0.userCondition','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.handle','\"comeRaggiungerci\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.hasTitleField','false'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.icon','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.name','\"Come Raggiungerci\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.showSlugField','true'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.showStatusField','true'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.slugTranslationKeyFormat','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.slugTranslationMethod','\"site\"'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.titleFormat','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.titleTranslationKeyFormat','null'),('entryTypes.26bfffe4-8789-4b00-9205-cd260b179905.titleTranslationMethod','\"site\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.color','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.description','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.cardThumbAlignment','\"end\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elementCondition','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.0.dateAdded','\"2026-01-23T14:03:49+00:00\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.0.editCondition','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.0.elementCondition','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.0.fieldUid','\"aeb11d3b-b8f3-4a5a-b89e-309cead42890\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.0.handle','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.0.includeInCards','true'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.0.instructions','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.0.label','\"Titolo\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.0.providesThumbs','false'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.0.required','true'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.0.tip','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.0.uid','\"038658eb-97e3-48f7-be8c-a3f09a5b3289\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.0.userCondition','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.0.warning','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.0.width','100'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.1.dateAdded','\"2026-01-23T14:03:49+00:00\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.1.editCondition','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.1.elementCondition','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.1.fieldUid','\"46188251-46ab-4519-916a-28b77f5aabbe\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.1.handle','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.1.includeInCards','true'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.1.instructions','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.1.label','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.1.providesThumbs','false'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.1.required','true'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.1.tip','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.1.uid','\"fe85ff9b-e33a-4093-ab5d-b076a19177bf\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.1.userCondition','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.1.warning','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.1.width','100'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.2.dateAdded','\"2026-01-23T14:03:49+00:00\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.2.editCondition','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.2.elementCondition','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.2.fieldUid','\"ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.2.handle','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.2.includeInCards','false'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.2.instructions','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.2.label','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.2.providesThumbs','false'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.2.required','false'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.2.tip','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.2.uid','\"967be471-d4a8-4519-8b96-8263e61b1e9d\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.2.userCondition','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.2.warning','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.elements.2.width','100'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.name','\"Content\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.uid','\"64ba2c73-b60a-42ff-83f9-5cbc8f0ab14d\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.fieldLayouts.5cbca81a-d7b0-4930-abc6-8ca973ab3224.tabs.0.userCondition','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.handle','\"faq\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.hasTitleField','false'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.icon','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.name','\"FAQ\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.showSlugField','true'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.showStatusField','true'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.slugTranslationKeyFormat','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.slugTranslationMethod','\"site\"'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.titleFormat','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.titleTranslationKeyFormat','null'),('entryTypes.4cb11d72-0266-4f9f-802d-c3475bfa5825.titleTranslationMethod','\"site\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.color','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.description','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.cardThumbAlignment','\"end\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elementCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.dateAdded','\"2026-01-22T11:33:27+00:00\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.editCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.elementCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.fieldUid','\"aeb11d3b-b8f3-4a5a-b89e-309cead42890\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.handle','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.includeInCards','true'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.instructions','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.label','\"Titolo\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.providesThumbs','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.required','true'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.tip','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.uid','\"d69862f2-0a28-456d-8a2d-d4bd68742237\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.userCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.warning','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.width','100'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.dateAdded','\"2026-01-22T11:33:27+00:00\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.editCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.elementCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.fieldUid','\"46188251-46ab-4519-916a-28b77f5aabbe\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.handle','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.includeInCards','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.instructions','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.label','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.providesThumbs','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.required','true'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.tip','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.uid','\"bf8b14fd-f17b-49b0-9f54-2c1de26ac35b\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.userCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.warning','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.width','100'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.2.dateAdded','\"2026-01-22T16:01:45+00:00\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.2.editCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.2.elementCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.2.fieldUid','\"53fb3da5-7c03-494f-bf94-ae71f1ac40d0\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.2.handle','\"richTextBiglietti\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.2.includeInCards','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.2.instructions','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.2.label','\"Blocco di Testo Biglietti d\'ingresso\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.2.providesThumbs','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.2.required','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.2.tip','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.2.uid','\"b98f0d65-c090-4667-acc2-d43a013294fb\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.2.userCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.2.warning','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.2.width','100'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.3.dateAdded','\"2026-01-22T16:24:31+00:00\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.3.editCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.3.elementCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.3.fieldUid','\"53fb3da5-7c03-494f-bf94-ae71f1ac40d0\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.3.handle','\"richTextSpiegazione\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.3.includeInCards','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.3.instructions','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.3.label','\"Blocco di Testo Spiegazione\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.3.providesThumbs','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.3.required','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.3.tip','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.3.uid','\"5528d40c-9778-484c-af27-6e73d4bceb76\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.3.userCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.3.warning','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.3.width','100'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.4.dateAdded','\"2026-01-22T16:24:31+00:00\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.4.editCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.4.elementCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.4.fieldUid','\"53fb3da5-7c03-494f-bf94-ae71f1ac40d0\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.4.handle','\"richTextResidenti\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.4.includeInCards','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.4.instructions','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.4.label','\"Testo per residenti\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.4.providesThumbs','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.4.required','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.4.tip','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.4.uid','\"2bc8b0ff-8abd-4868-a4fa-9818af2a25b0\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.4.userCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.4.warning','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.4.width','100'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.name','\"Content\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.uid','\"63e947e7-0dc1-43e2-9dd7-66f8eacc8bec\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.userCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.handle','\"visita\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.hasTitleField','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.icon','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.name','\"Visita\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.showSlugField','true'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.showStatusField','true'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.slugTranslationKeyFormat','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.slugTranslationMethod','\"site\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.titleFormat','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.titleTranslationKeyFormat','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.titleTranslationMethod','\"site\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.color','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.description','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.cardThumbAlignment','\"end\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.cardView.0','\"layoutElement:4017fac0-2898-4409-ad1e-ec6249c689f6\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.cardView.1','\"layoutElement:8a8999b5-fe5e-4226-9093-65d582264591\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.cardView.2','\"layoutElement:d4c1a906-0f18-4a89-9e5a-507ca13c89ff\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.cardView.3','\"layoutElement:7f0b6c56-6b6d-468c-8db8-50efb3a4a289\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.dateAdded','\"2026-01-21T14:25:31+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.fieldUid','\"aeb11d3b-b8f3-4a5a-b89e-309cead42890\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.handle','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.includeInCards','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.label','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.required','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.uid','\"4017fac0-2898-4409-ad1e-ec6249c689f6\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.dateAdded','\"2026-01-21T14:25:31+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.fieldUid','\"4033fbd4-5d65-4515-96fd-2b54697b307d\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.handle','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.includeInCards','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.label','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.required','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.uid','\"8a8999b5-fe5e-4226-9093-65d582264591\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.dateAdded','\"2026-01-21T14:25:31+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.fieldUid','\"46188251-46ab-4519-916a-28b77f5aabbe\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.handle','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.includeInCards','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.label','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.required','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.uid','\"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.dateAdded','\"2026-01-21T14:25:31+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.fieldUid','\"e10b9023-318a-4ed3-98ca-c905871af2b4\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.handle','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.includeInCards','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.label','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.required','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.uid','\"7f0b6c56-6b6d-468c-8db8-50efb3a4a289\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.dateAdded','\"2026-01-21T14:25:31+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.fieldUid','\"2fbf1bea-4c0f-4faf-b4df-d7c7faf27656\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.handle','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.includeInCards','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.label','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.required','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.uid','\"6a7056b8-5a93-4e11-b979-ddca12bf63ad\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.dateAdded','\"2026-01-21T15:47:11+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.fieldUid','\"ff59314d-d88c-469c-bb11-d18989180be0\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.handle','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.includeInCards','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.label','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.required','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.uid','\"6f85adcd-9983-4bdd-83b4-b40299697ec5\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.dateAdded','\"2026-01-21T15:47:11+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.fieldUid','\"de834319-7a42-478c-9f63-192de7436f20\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.handle','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.includeInCards','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.label','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.required','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.uid','\"cb0fb487-6cd3-42cf-acdd-fd5fc50078c1\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.dateAdded','\"2026-01-21T15:47:11+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.fieldUid','\"7a220bd6-7d45-4cd3-9d88-7f3e583ed063\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.handle','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.includeInCards','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.label','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.required','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.uid','\"2c7837c0-d6c7-4020-98eb-d25a07225f81\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.dateAdded','\"2026-01-21T13:57:06+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.fieldUid','\"61bded43-ec93-419c-a052-66062d3b33a5\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.handle','\"titolo\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.includeInCards','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.label','\"Titolo\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.required','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.uid','\"a39fbbec-1e9a-4b67-9a20-c8614b1a58bf\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.name','\"Content\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.uid','\"8289c216-05e0-4c73-8b21-b168d59c4ed4\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.handle','\"hero\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.hasTitleField','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.icon','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.name','\"Hero\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.showSlugField','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.showStatusField','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.slugTranslationKeyFormat','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.slugTranslationMethod','\"site\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.titleFormat','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.titleTranslationKeyFormat','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.titleTranslationMethod','\"site\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.color','\"sky\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.description','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.cardThumbAlignment','\"end\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elementCondition','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.autocapitalize','true'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.autocomplete','false'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.autocorrect','true'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.class','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.dateAdded','\"2026-01-21T11:36:15+00:00\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.disabled','false'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.elementCondition','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.id','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.includeInCards','false'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.inputType','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.instructions','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.label','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.max','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.min','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.name','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.orientation','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.placeholder','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.providesThumbs','false'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.readonly','false'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.required','true'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.size','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.step','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.tip','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.title','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.uid','\"31ff07db-9032-449a-a421-83bdd6c5a652\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.userCondition','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.warning','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.width','100'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.dateAdded','\"2026-01-21T13:59:51+00:00\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.editCondition','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.elementCondition','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.fieldUid','\"97c36746-feb8-4bc1-8b32-3e3c3259b31b\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.handle','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.includeInCards','false'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.instructions','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.label','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.providesThumbs','false'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.required','false'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.tip','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.uid','\"17bd8943-7c32-4e2e-a7ea-7199a5dde208\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.userCondition','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.warning','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.width','100'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.name','\"Content\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.uid','\"8e7da487-67eb-4dea-ba73-e13d550187ef\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.userCondition','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.handle','\"homepage\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.hasTitleField','true'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.icon','\"house\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.name','\"Homepage\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.showSlugField','true'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.showStatusField','true'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.slugTranslationKeyFormat','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.slugTranslationMethod','\"site\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.titleFormat','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.titleTranslationKeyFormat','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.titleTranslationMethod','\"site\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.color','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.description','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.cardThumbAlignment','\"end\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.cardView.0','\"layoutElement:bebce23a-0c91-48bf-8d10-1b88344fe02a\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elementCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.0.dateAdded','\"2026-01-23T16:18:39+00:00\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.0.editCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.0.elementCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.0.fieldUid','\"aeb11d3b-b8f3-4a5a-b89e-309cead42890\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.0.handle','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.0.includeInCards','true'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.0.instructions','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.0.label','\"Titolo\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.0.providesThumbs','false'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.0.required','true'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.0.tip','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.0.uid','\"bebce23a-0c91-48bf-8d10-1b88344fe02a\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.0.userCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.0.warning','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.0.width','100'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.1.dateAdded','\"2026-01-23T16:18:39+00:00\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.1.editCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.1.elementCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.1.fieldUid','\"46188251-46ab-4519-916a-28b77f5aabbe\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.1.handle','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.1.includeInCards','false'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.1.instructions','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.1.label','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.1.providesThumbs','false'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.1.required','false'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.1.tip','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.1.uid','\"28f5ac77-d497-4208-a2a6-fe325d1117ed\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.1.userCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.1.warning','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.1.width','100'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.2.dateAdded','\"2026-01-23T16:18:39+00:00\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.2.editCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.2.elementCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.2.fieldUid','\"7a220bd6-7d45-4cd3-9d88-7f3e583ed063\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.2.handle','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.2.includeInCards','false'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.2.instructions','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.2.label','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.2.providesThumbs','false'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.2.required','false'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.2.tip','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.2.uid','\"69779b94-0ba0-4bb1-bee0-4cfd598570ed\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.2.userCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.2.warning','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.2.width','100'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.3.dateAdded','\"2026-01-23T16:18:39+00:00\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.3.editCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.3.elementCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.3.fieldUid','\"46188251-46ab-4519-916a-28b77f5aabbe\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.3.handle','\"descrizioneCTA\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.3.includeInCards','false'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.3.instructions','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.3.label','\"Descrizione CTA\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.3.providesThumbs','false'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.3.required','false'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.3.tip','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.3.uid','\"6162870f-ac91-4993-bd51-28c3eb5f6224\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.3.userCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.3.warning','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.3.width','100'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.4.dateAdded','\"2026-01-23T16:18:39+00:00\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.4.editCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.4.elementCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.4.fieldUid','\"97222eb3-1e43-486d-b4b7-bb82d1ed0c41\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.4.handle','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.4.includeInCards','false'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.4.instructions','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.4.label','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.4.providesThumbs','false'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.4.required','true'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.4.tip','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.4.uid','\"3878e712-a1fb-4406-9907-5c745d251ee9\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.4.userCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.4.warning','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.elements.4.width','100'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.name','\"Content\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.uid','\"96901437-f29f-40bd-b0e5-ba44de643b78\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.fieldLayouts.df884a95-2f9a-46e8-816b-0834bc3443b8.tabs.0.userCondition','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.handle','\"storia\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.hasTitleField','false'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.icon','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.name','\"Storia\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.showSlugField','true'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.showStatusField','true'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.slugTranslationKeyFormat','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.slugTranslationMethod','\"site\"'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.titleFormat','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.titleTranslationKeyFormat','null'),('entryTypes.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f.titleTranslationMethod','\"site\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.color','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.description','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.cardThumbAlignment','\"end\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.cardView.0','\"layoutElement:ea0e9734-e321-41b5-a238-cfda14ef1495\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.cardView.1','\"layoutElement:16a2ecaa-edfd-4aa8-b125-906d04fb3fb9\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elementCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.0.dateAdded','\"2026-01-23T08:47:28+00:00\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.0.editCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.0.elementCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.0.fieldUid','\"aeb11d3b-b8f3-4a5a-b89e-309cead42890\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.0.handle','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.0.includeInCards','true'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.0.instructions','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.0.label','\"Titolo\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.0.providesThumbs','false'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.0.required','true'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.0.tip','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.0.uid','\"ea0e9734-e321-41b5-a238-cfda14ef1495\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.0.userCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.0.warning','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.0.width','100'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.1.dateAdded','\"2026-01-23T08:47:28+00:00\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.1.editCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.1.elementCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.1.fieldUid','\"46188251-46ab-4519-916a-28b77f5aabbe\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.1.handle','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.1.includeInCards','true'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.1.instructions','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.1.label','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.1.providesThumbs','false'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.1.required','true'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.1.tip','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.1.uid','\"16a2ecaa-edfd-4aa8-b125-906d04fb3fb9\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.1.userCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.1.warning','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.1.width','100'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.2.dateAdded','\"2026-01-23T08:22:49+00:00\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.2.editCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.2.elementCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.2.fieldUid','\"ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.2.handle','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.2.includeInCards','false'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.2.instructions','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.2.label','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.2.providesThumbs','false'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.2.required','false'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.2.tip','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.2.uid','\"58689691-2514-4290-9e6b-78c0a104ed12\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.2.userCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.2.warning','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.2.width','100'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.3.dateAdded','\"2026-01-23T09:13:40+00:00\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.3.editCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.3.elementCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.3.fieldUid','\"7a220bd6-7d45-4cd3-9d88-7f3e583ed063\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.3.handle','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.3.includeInCards','false'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.3.instructions','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.3.label','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.3.providesThumbs','false'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.3.required','false'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.3.tip','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.3.uid','\"e19d53cc-8756-40dc-b9bc-478295f5d7f9\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.3.userCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.3.warning','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.3.width','100'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.4.dateAdded','\"2026-01-23T09:15:21+00:00\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.4.editCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.4.elementCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.4.fieldUid','\"46188251-46ab-4519-916a-28b77f5aabbe\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.4.handle','\"sottotitoloCta\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.4.includeInCards','false'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.4.instructions','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.4.label','\"Sottotitolo CTA\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.4.providesThumbs','false'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.4.required','false'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.4.tip','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.4.uid','\"e8f09ef2-465a-441c-82da-1c62d10a493b\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.4.userCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.4.warning','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.elements.4.width','100'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.name','\"Content\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.uid','\"1fbd6445-daaf-417d-9cd2-713f9e005672\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.fieldLayouts.28865409-8d10-43f4-b02b-974ddbd33870.tabs.0.userCondition','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.handle','\"accesso\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.hasTitleField','false'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.icon','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.name','\"Accesso\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.showSlugField','true'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.showStatusField','true'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.slugTranslationKeyFormat','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.slugTranslationMethod','\"site\"'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.titleFormat','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.titleTranslationKeyFormat','null'),('entryTypes.a3863fb4-135a-49f3-ae23-44953b9accbd.titleTranslationMethod','\"site\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.columnSuffix','null'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.handle','\"orari\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.instructions','null'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.name','\"Orari\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.searchable','false'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.addRowLabel','\"Add a row\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.0','\"col1\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Giorno\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.1.__assoc__.1.1','\"giorno\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.0','\"col3\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.1.__assoc__.0.0','\"heading\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.1.__assoc__.0.1','\"Apertura\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.1.__assoc__.1.0','\"handle\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.1.__assoc__.1.1','\"apertura\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.1.__assoc__.2.0','\"width\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.1.__assoc__.2.1','\"\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.1.__assoc__.3.0','\"type\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.1.__assoc__.3.1','\"singleline\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.0','\"col4\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.1.__assoc__.0.0','\"heading\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.1.__assoc__.0.1','\"Chiusura\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.1.__assoc__.1.0','\"handle\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.1.__assoc__.1.1','\"chiusura\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.1.__assoc__.2.0','\"width\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.1.__assoc__.2.1','\"\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.1.__assoc__.3.0','\"type\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.1.__assoc__.3.1','\"singleline\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.0','\"col5\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.1.__assoc__.0.0','\"heading\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.1.__assoc__.0.1','\"Eccezione\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.1.__assoc__.1.0','\"handle\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.1.__assoc__.1.1','\"eccezione\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.1.__assoc__.2.0','\"width\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.1.__assoc__.2.1','\"\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.1.__assoc__.3.0','\"type\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.1.__assoc__.3.1','\"singleline\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.defaults','null'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.maxRows','7'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.minRows','7'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.staticRows','false'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.translationKeyFormat','null'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.translationMethod','\"site\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.type','\"craft\\\\fields\\\\Table\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.columnSuffix','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.handle','\"video\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.instructions','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.name','\"Video Background\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.searchable','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.allowedKinds','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.allowSelfRelations','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.allowSubfolders','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.allowUploads','true'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.branchLimit','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.defaultPlacement','\"end\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.defaultUploadLocationSource','\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.defaultUploadLocationSubpath','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.maintainHierarchy','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.maxRelations','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.minRelations','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.previewMode','\"full\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.restrictedDefaultUploadSubpath','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.restrictedLocationSource','\"volume:c0c8eabb-1d94-449c-b621-1252e3e75ea4\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.restrictedLocationSubpath','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.restrictFiles','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.restrictLocation','true'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.selectionLabel','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.showCardsInGrid','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.showSearchInput','true'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.showSiteMenu','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.showUnpermittedFiles','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.showUnpermittedVolumes','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.sources','\"*\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.targetSiteId','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.validateRelatedElements','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.viewMode','\"list\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.translationKeyFormat','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.translationMethod','\"none\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.type','\"craft\\\\fields\\\\Assets\"'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.columnSuffix','null'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.handle','\"orarioUltimoIngresso\"'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.instructions','null'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.name','\"Orario Ultimo Ingresso\"'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.searchable','false'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.settings.byteLimit','null'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.settings.charLimit','null'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.settings.code','false'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.settings.initialRows','4'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.settings.multiline','false'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.settings.placeholder','\"21:00\"'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.settings.uiMode','\"normal\"'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.translationKeyFormat','null'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.translationMethod','\"none\"'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.type','\"craft\\\\fields\\\\PlainText\"'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.columnSuffix','null'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.handle','\"seoDescription\"'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.instructions','null'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.name','\"Seo Description\"'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.searchable','false'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.settings.byteLimit','null'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.settings.charLimit','160'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.settings.code','false'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.settings.initialRows','4'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.settings.multiline','true'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.settings.placeholder','null'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.settings.uiMode','\"normal\"'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.translationKeyFormat','null'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.translationMethod','\"site\"'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.type','\"craft\\\\fields\\\\PlainText\"'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.columnSuffix','null'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.handle','\"titoloRiga2\"'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.instructions','null'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.name','\"Titolo Seconda Riga\"'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.searchable','false'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.settings.byteLimit','null'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.settings.charLimit','null'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.settings.code','false'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.settings.initialRows','4'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.settings.multiline','false'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.settings.placeholder','null'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.settings.uiMode','\"normal\"'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.translationKeyFormat','null'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.translationMethod','\"site\"'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.type','\"craft\\\\fields\\\\PlainText\"'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.columnSuffix','null'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.handle','\"sottotitolo\"'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.instructions','null'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.name','\"Sottotitolo\"'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.searchable','false'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.settings.byteLimit','null'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.settings.charLimit','null'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.settings.code','false'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.settings.initialRows','4'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.settings.multiline','false'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.settings.placeholder','null'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.settings.uiMode','\"normal\"'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.translationKeyFormat','null'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.translationMethod','\"site\"'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.type','\"craft\\\\fields\\\\PlainText\"'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.columnSuffix','null'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.handle','\"richText\"'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.instructions','null'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.name','\"Blocco di Testo\"'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.searchable','false'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.settings.availableTransforms','\"\"'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.settings.availableVolumes','\"*\"'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.settings.characterLimit','null'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.settings.ckeConfig','\"3a97014c-fc28-4af7-b816-5428f37b05c5\"'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.settings.createButtonLabel','null'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.settings.defaultTransform','null'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.settings.expandEntryButtons','false'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.settings.fullGraphqlData','true'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.settings.parseEmbeds','false'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.settings.purifierConfig','null'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.settings.purifyHtml','true'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.settings.showUnpermittedFiles','false'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.settings.showUnpermittedVolumes','false'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.settings.showWordCount','false'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.settings.sourceEditingGroups.0','\"__ADMINS__\"'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.settings.wordLimit','null'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.translationKeyFormat','null'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.translationMethod','\"site\"'),('fields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.columnSuffix','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.handle','\"seoImage\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.instructions','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.name','\"Seo Image\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.searchable','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.allowedKinds','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.allowSelfRelations','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.allowSubfolders','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.allowUploads','true'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.branchLimit','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.defaultPlacement','\"end\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.defaultUploadLocationSource','\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.defaultUploadLocationSubpath','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.maintainHierarchy','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.maxRelations','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.minRelations','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.previewMode','\"full\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.restrictedDefaultUploadSubpath','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.restrictedLocationSource','\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.restrictedLocationSubpath','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.restrictFiles','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.restrictLocation','true'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.selectionLabel','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.showCardsInGrid','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.showSearchInput','true'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.showSiteMenu','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.showUnpermittedFiles','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.showUnpermittedVolumes','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.sources','\"*\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.targetSiteId','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.validateRelatedElements','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.viewMode','\"list\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.translationKeyFormat','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.translationMethod','\"none\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.type','\"craft\\\\fields\\\\Assets\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.columnSuffix','null'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.handle','\"linkCta\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.instructions','null'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.name','\"Link CTA\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.searchable','false'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.advancedFields.0','\"target\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.advancedFields.1','\"title\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.advancedFields.2','\"ariaLabel\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.advancedFields.3','\"download\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.fullGraphqlData','true'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.maxLength','255'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.showLabelField','false'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.types.0','\"url\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.types.1','\"entry\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.types.2','\"asset\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.types.3','\"category\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.types.4','\"email\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.types.5','\"tel\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.types.6','\"sms\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.0','\"asset\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.1.__assoc__.0.0','\"sources\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.1.__assoc__.0.1','\"*\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.1.__assoc__.1.0','\"allowedKinds\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.1.__assoc__.1.1','\"*\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.1.__assoc__.2.0','\"showUnpermittedVolumes\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.1.__assoc__.2.1','\"\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.1.__assoc__.3.0','\"showUnpermittedFiles\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.1.__assoc__.3.1','\"\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.1.0','\"entry\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.1.1.__assoc__.0.0','\"sources\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.1.1.__assoc__.0.1','\"*\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.1.1.__assoc__.1.0','\"showUnpermittedSections\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.1.1.__assoc__.1.1','\"\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.1.1.__assoc__.2.0','\"showUnpermittedEntries\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.1.1.__assoc__.2.1','\"\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.2.0','\"url\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.2.1.__assoc__.0.0','\"allowRootRelativeUrls\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.2.1.__assoc__.0.1','\"\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.2.1.__assoc__.1.0','\"allowAnchors\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.2.1.__assoc__.1.1','\"\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.2.1.__assoc__.2.0','\"allowCustomSchemes\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.2.1.__assoc__.2.1','\"\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.translationKeyFormat','null'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.translationMethod','\"site\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.type','\"craft\\\\fields\\\\Link\"'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.columnSuffix','null'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.handle','\"seoTitle\"'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.instructions','null'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.name','\"Seo Title\"'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.searchable','false'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.settings.byteLimit','null'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.settings.charLimit','60'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.settings.code','false'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.settings.initialRows','4'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.settings.multiline','false'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.settings.placeholder','null'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.settings.uiMode','\"normal\"'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.translationKeyFormat','null'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.translationMethod','\"site\"'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.type','\"craft\\\\fields\\\\PlainText\"'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.columnSuffix','null'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.handle','\"listaImmagini\"'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.instructions','null'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.name','\"Lista Immagini\"'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.searchable','false'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.allowedKinds','null'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.allowSelfRelations','false'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.allowSubfolders','false'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.allowUploads','true'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.branchLimit','null'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.defaultPlacement','\"end\"'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.defaultUploadLocationSource','\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\"'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.defaultUploadLocationSubpath','null'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.maintainHierarchy','false'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.maxRelations','null'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.minRelations','null'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.previewMode','\"full\"'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.restrictedDefaultUploadSubpath','null'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.restrictedLocationSource','\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\"'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.restrictedLocationSubpath','null'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.restrictFiles','false'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.restrictLocation','false'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.selectionLabel','null'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.showCardsInGrid','true'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.showSearchInput','true'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.showSiteMenu','false'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.showUnpermittedFiles','false'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.showUnpermittedVolumes','false'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.sources.0','\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\"'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.targetSiteId','null'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.validateRelatedElements','false'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.settings.viewMode','\"cards\"'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.translationKeyFormat','null'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.translationMethod','\"site\"'),('fields.97222eb3-1e43-486d-b4b7-bb82d1ed0c41.type','\"craft\\\\fields\\\\Assets\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.columnSuffix','null'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.handle','\"blocchi\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.instructions','null'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.name','\"Blocchi\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.searchable','false'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.createButtonLabel','null'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.defaultIndexViewMode','\"cards\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.enableVersioning','false'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.0.__assoc__.0.1','\"5a26f1f1-6170-408e-8b45-bcbf7104e0cb\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.0.__assoc__.1.0','\"group\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.0.__assoc__.1.1','\"General\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.1.__assoc__.0.0','\"uid\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.1.__assoc__.0.1','\"595345f1-a17e-4be3-ba5a-8f68332aebb5\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.1.__assoc__.1.0','\"group\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.1.__assoc__.1.1','\"General\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.2.__assoc__.0.0','\"uid\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.2.__assoc__.0.1','\"a3863fb4-135a-49f3-ae23-44953b9accbd\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.2.__assoc__.1.0','\"group\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.2.__assoc__.1.1','\"General\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.3.__assoc__.0.0','\"uid\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.3.__assoc__.0.1','\"4cb11d72-0266-4f9f-802d-c3475bfa5825\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.3.__assoc__.1.0','\"group\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.3.__assoc__.1.1','\"General\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.4.__assoc__.0.0','\"uid\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.4.__assoc__.0.1','\"26bfffe4-8789-4b00-9205-cd260b179905\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.4.__assoc__.1.0','\"group\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.4.__assoc__.1.1','\"General\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.5.__assoc__.0.0','\"uid\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.5.__assoc__.0.1','\"6b86bf72-f0da-4653-b9fa-e32ee61e5a6f\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.5.__assoc__.1.0','\"group\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.5.__assoc__.1.1','\"General\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.includeTableView','false'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.maxEntries','null'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.minEntries','null'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.pageSize','50'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.propagationKeyFormat','null'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.propagationMethod','\"all\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.showCardsInGrid','false'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.viewMode','\"cards\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.translationKeyFormat','null'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.translationMethod','\"site\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.type','\"craft\\\\fields\\\\Matrix\"'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.columnSuffix','null'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.handle','\"listaInfo\"'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.instructions','null'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.name','\"Lista Info\"'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.searchable','false'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.settings.createButtonLabel','\"Aggiungi\"'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.settings.defaultIndexViewMode','\"cards\"'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.settings.enableVersioning','false'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.settings.entryTypes.0.__assoc__.0.1','\"0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871\"'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.settings.entryTypes.0.__assoc__.1.0','\"group\"'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.settings.entryTypes.0.__assoc__.1.1','\"General\"'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.settings.includeTableView','false'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.settings.maxEntries','null'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.settings.minEntries','1'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.settings.pageSize','null'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.settings.propagationKeyFormat','null'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.settings.propagationMethod','\"all\"'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.settings.showCardsInGrid','false'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.settings.viewMode','\"blocks\"'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.translationKeyFormat','null'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.translationMethod','\"site\"'),('fields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925.type','\"craft\\\\fields\\\\Matrix\"'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.columnSuffix','null'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.handle','\"titolo\"'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.instructions','null'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.name','\"Titolo Prima Riga\"'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.searchable','false'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.settings.byteLimit','null'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.settings.charLimit','null'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.settings.code','false'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.settings.initialRows','4'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.settings.multiline','false'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.settings.placeholder','null'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.settings.uiMode','\"normal\"'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.translationKeyFormat','null'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.translationMethod','\"site\"'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.type','\"craft\\\\fields\\\\PlainText\"'),('fields.c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368.columnSuffix','null'),('fields.c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368.handle','\"switch\"'),('fields.c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368.instructions','null'),('fields.c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368.name','\"Switch\"'),('fields.c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368.searchable','false'),('fields.c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368.settings.default','true'),('fields.c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368.settings.offLabel','\"Off\"'),('fields.c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368.settings.onLabel','\"On\"'),('fields.c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368.translationKeyFormat','null'),('fields.c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368.translationMethod','\"none\"'),('fields.c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368.type','\"craft\\\\fields\\\\Lightswitch\"'),('fields.de834319-7a42-478c-9f63-192de7436f20.columnSuffix','null'),('fields.de834319-7a42-478c-9f63-192de7436f20.handle','\"testoAvvisoManutenzione\"'),('fields.de834319-7a42-478c-9f63-192de7436f20.instructions','null'),('fields.de834319-7a42-478c-9f63-192de7436f20.name','\"Testo Avviso Manutenzione\"'),('fields.de834319-7a42-478c-9f63-192de7436f20.searchable','false'),('fields.de834319-7a42-478c-9f63-192de7436f20.settings.byteLimit','null'),('fields.de834319-7a42-478c-9f63-192de7436f20.settings.charLimit','null'),('fields.de834319-7a42-478c-9f63-192de7436f20.settings.code','false'),('fields.de834319-7a42-478c-9f63-192de7436f20.settings.initialRows','4'),('fields.de834319-7a42-478c-9f63-192de7436f20.settings.multiline','false'),('fields.de834319-7a42-478c-9f63-192de7436f20.settings.placeholder','null'),('fields.de834319-7a42-478c-9f63-192de7436f20.settings.uiMode','\"normal\"'),('fields.de834319-7a42-478c-9f63-192de7436f20.translationKeyFormat','null'),('fields.de834319-7a42-478c-9f63-192de7436f20.translationMethod','\"site\"'),('fields.de834319-7a42-478c-9f63-192de7436f20.type','\"craft\\\\fields\\\\PlainText\"'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.columnSuffix','null'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.handle','\"sottotitoloRiga2\"'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.instructions','null'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.name','\"Sottotitolo Seconda Riga\"'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.searchable','false'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.settings.byteLimit','null'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.settings.charLimit','null'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.settings.code','false'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.settings.initialRows','4'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.settings.multiline','false'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.settings.placeholder','null'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.settings.uiMode','\"normal\"'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.translationKeyFormat','null'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.translationMethod','\"site\"'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.type','\"craft\\\\fields\\\\PlainText\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.columnSuffix','null'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.handle','\"iconaAvvisoManutenzione\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.instructions','null'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.name','\"Icona Avviso Manutenzione\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.searchable','false'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.customOptions','false'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.0.0','\"label\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.0.1','\"speciale\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.1.0','\"value\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.1.1','\"speciale\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.2.0','\"icon\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.2.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.3.0','\"color\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.3.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.4.0','\"default\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.4.1','\"1\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.0.0','\"label\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.0.1','\"orologio\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.1.0','\"value\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.1.1','\"orologio\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.2.0','\"icon\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.2.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.3.0','\"color\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.3.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.4.0','\"default\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.4.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.0.0','\"label\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.0.1','\"ticket\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.1.0','\"value\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.1.1','\"ticket\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.2.0','\"icon\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.2.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.3.0','\"color\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.3.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.4.0','\"default\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.4.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.0.0','\"label\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.0.1','\"attenzione\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.1.0','\"value\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.1.1','\"attenzione\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.2.0','\"icon\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.2.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.3.0','\"color\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.3.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.4.0','\"default\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.4.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.0.0','\"label\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.0.1','\"divieto\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.1.0','\"value\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.1.1','\"divieto\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.2.0','\"icon\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.2.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.3.0','\"color\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.3.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.4.0','\"default\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.4.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.translationKeyFormat','null'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.translationMethod','\"none\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.type','\"craft\\\\fields\\\\Dropdown\"'),('fs.uploads.hasUrls','true'),('fs.uploads.name','\"Uploads\"'),('fs.uploads.settings.path','\"@webroot/uploads\"'),('fs.uploads.type','\"craft\\\\fs\\\\Local\"'),('fs.uploads.url','\"@web/uploads\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.cardThumbAlignment','\"end\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elementCondition','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.dateAdded','\"2026-01-22T10:31:17+00:00\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.editCondition','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.elementCondition','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.fieldUid','\"0e998ccf-b819-41f0-88c2-01bfa99e19e2\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.handle','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.includeInCards','false'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.instructions','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.label','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.providesThumbs','false'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.required','false'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.tip','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.uid','\"a211aabe-547c-446e-9ab1-7775fd3fa616\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.userCondition','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.warning','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.width','100'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.dateAdded','\"2026-01-22T10:31:17+00:00\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.editCondition','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.elementCondition','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.fieldUid','\"3673fc41-a579-4121-81bd-d598f59eca0a\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.handle','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.includeInCards','false'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.instructions','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.label','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.providesThumbs','false'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.required','false'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.tip','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.uid','\"42119478-8531-4043-b8e4-cb408a6b35eb\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.userCondition','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.warning','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.width','100'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.name','\"Content\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.uid','\"643c166d-8a1d-4a15-95f0-612955c5f587\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.userCondition','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.handle','\"orariSettimanali\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.name','\"Orari Settimanali\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.sortOrder','1'),('graphql.publicToken.enabled','true'),('graphql.publicToken.expiryDate','null'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.isPublic','true'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.name','\"Public Schema\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.0','\"sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.1','\"sites.b2c3d4e5-f678-90ab-cdef-123456789012:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.10','\"volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.11','\"globalsets.85074937-dff7-4c16-9d2c-0c76875fea4a:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.2','\"elements.drafts:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.3','\"elements.revisions:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.4','\"elements.inactive:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.5','\"sections.45952d02-8da9-45dc-81df-be4fea47ce47:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.6','\"nestedentryfields.53fb3da5-7c03-494f-bf94-ae71f1ac40d0:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.7','\"nestedentryfields.97c36746-feb8-4bc1-8b32-3e3c3259b31b:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.8','\"nestedentryfields.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.9','\"volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4:read\"'),('meta.__names__.0ac1c7a2-d9b0-4ec2-90a5-fe7721ba4871','\"Accordion\"'),('meta.__names__.0e998ccf-b819-41f0-88c2-01bfa99e19e2','\"Orari\"'),('meta.__names__.26bfffe4-8789-4b00-9205-cd260b179905','\"Come Raggiungerci\"'),('meta.__names__.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656','\"Video Background\"'),('meta.__names__.3673fc41-a579-4121-81bd-d598f59eca0a','\"Orario Ultimo Ingresso\"'),('meta.__names__.3a97014c-fc28-4af7-b816-5428f37b05c5','\"Simple\"'),('meta.__names__.3e7c6349-ae7b-4066-bcb6-380ea09b4f86','\"Seo Description\"'),('meta.__names__.4033fbd4-5d65-4515-96fd-2b54697b307d','\"Titolo Seconda Riga\"'),('meta.__names__.45952d02-8da9-45dc-81df-be4fea47ce47','\"Homepage\"'),('meta.__names__.46188251-46ab-4519-916a-28b77f5aabbe','\"Sottotitolo\"'),('meta.__names__.4cb11d72-0266-4f9f-802d-c3475bfa5825','\"FAQ\"'),('meta.__names__.53fb3da5-7c03-494f-bf94-ae71f1ac40d0','\"Blocco di Testo\"'),('meta.__names__.595345f1-a17e-4be3-ba5a-8f68332aebb5','\"Visita\"'),('meta.__names__.5a26f1f1-6170-408e-8b45-bcbf7104e0cb','\"Hero\"'),('meta.__names__.5cdd6615-0e0c-4415-bc3f-302dc52b1104','\"Homepage\"'),('meta.__names__.68308c87-e785-41d2-b15b-58aefafa2c8f','\"Seo Image\"'),('meta.__names__.6b86bf72-f0da-4653-b9fa-e32ee61e5a6f','\"Storia\"'),('meta.__names__.7a220bd6-7d45-4cd3-9d88-7f3e583ed063','\"Link CTA\"'),('meta.__names__.85074937-dff7-4c16-9d2c-0c76875fea4a','\"Orari Settimanali\"'),('meta.__names__.85867d07-76c5-49c6-b699-3f42a9ad4cc8','\"Seo Title\"'),('meta.__names__.8f7f8686-4145-4205-ace1-e67e6e7f91f5','\"Fontana Trevi - IT\"'),('meta.__names__.97222eb3-1e43-486d-b4b7-bb82d1ed0c41','\"Lista Immagini\"'),('meta.__names__.97c36746-feb8-4bc1-8b32-3e3c3259b31b','\"Blocchi\"'),('meta.__names__.9c5d5f1c-302b-432d-8889-3965d508b194','\"fonta-trevi\"'),('meta.__names__.a3863fb4-135a-49f3-ae23-44953b9accbd','\"Accesso\"'),('meta.__names__.ac4b2e80-4dbb-4a27-9fc5-9cb0a651a925','\"Lista Info\"'),('meta.__names__.aeb11d3b-b8f3-4a5a-b89e-309cead42890','\"Titolo Prima Riga\"'),('meta.__names__.c0c8eabb-1d94-449c-b621-1252e3e75ea4','\"Video\"'),('meta.__names__.c16b2bdf-ca6d-44c6-ad1b-a1dc706a0368','\"Switch\"'),('meta.__names__.de834319-7a42-478c-9f63-192de7436f20','\"Testo Avviso Manutenzione\"'),('meta.__names__.e10b9023-318a-4ed3-98ca-c905871af2b4','\"Sottotitolo Seconda Riga\"'),('meta.__names__.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4','\"Immagini\"'),('meta.__names__.fd6020f8-2e21-4f1d-af40-1c74e81c3000','\"Public Schema\"'),('meta.__names__.ff59314d-d88c-469c-bb11-d18989180be0','\"Icona Avviso Manutenzione\"'),('plugins.ckeditor.edition','\"standard\"'),('plugins.ckeditor.enabled','true'),('plugins.ckeditor.schemaVersion','\"3.0.0.0\"'),('plugins.super-table.edition','\"standard\"'),('plugins.super-table.enabled','true'),('plugins.super-table.schemaVersion','\"4.0.0\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.defaultPlacement','\"end\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.enableVersioning','true'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.entryTypes.0.uid','\"5cdd6615-0e0c-4415-bc3f-302dc52b1104\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.handle','\"homepage\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.maxAuthors','1'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.name','\"Homepage\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.previewTargets.0.label','\"Primary entry page\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.previewTargets.0.refresh','\"1\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.previewTargets.0.urlFormat','\"{url}\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.propagationMethod','\"all\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.siteSettings.8f7f8686-4145-4205-ace1-e67e6e7f91f5.enabledByDefault','true'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.siteSettings.8f7f8686-4145-4205-ace1-e67e6e7f91f5.hasUrls','true'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.siteSettings.8f7f8686-4145-4205-ace1-e67e6e7f91f5.template','null'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.siteSettings.8f7f8686-4145-4205-ace1-e67e6e7f91f5.uriFormat','\"__home__\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.siteSettings.b2c3d4e5-f678-90ab-cdef-123456789012.enabledByDefault','true'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.siteSettings.b2c3d4e5-f678-90ab-cdef-123456789012.hasUrls','true'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.siteSettings.b2c3d4e5-f678-90ab-cdef-123456789012.template','null'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.siteSettings.b2c3d4e5-f678-90ab-cdef-123456789012.uriFormat','\"__home__\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.type','\"single\"'),('siteGroups.9c5d5f1c-302b-432d-8889-3965d508b194.name','\"fonta-trevi\"'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.enabled','true'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.handle','\"default\"'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.hasUrls','true'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.language','\"it-IT\"'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.name','\"Fontana Trevi - IT\"'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.primary','true'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.siteGroup','\"9c5d5f1c-302b-432d-8889-3965d508b194\"'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.sortOrder','1'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.baseUrl','\"$PRIMARY_SITE_URL/en\"'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.enabled','\"true\"'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.handle','\"en\"'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.hasUrls','true'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.language','\"en-GB\"'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.name','\"Fontana Trevi - EN\"'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.primary','false'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.siteGroup','\"9c5d5f1c-302b-432d-8889-3965d508b194\"'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.sortOrder','2'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"fonta-trevi\"'),('system.retryDuration','null'),('system.schemaVersion','\"5.8.0.3\"'),('system.timeZone','\"Europe/Rome\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.altTranslationKeyFormat','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.altTranslationMethod','\"site\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.cardThumbAlignment','\"end\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elementCondition','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.autocapitalize','true'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.autocomplete','false'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.autocorrect','true'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.class','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.dateAdded','\"2026-01-21T11:27:25+00:00\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.disabled','false'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.elementCondition','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.id','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.includeInCards','false'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.inputType','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.instructions','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.label','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.max','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.min','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.name','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.orientation','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.placeholder','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.providesThumbs','false'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.readonly','false'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.requirable','false'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.size','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.step','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.tip','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.title','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.uid','\"20300ee1-01c8-40be-ad1e-8bff5b107720\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.userCondition','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.warning','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.width','100'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.name','\"Content\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.uid','\"b32fee4a-b785-4593-b641-8ec9e2ebd449\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.userCondition','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fs','\"uploads\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.handle','\"video\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.name','\"Video\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.sortOrder','2'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.subpath','\"video\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.titleTranslationKeyFormat','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.titleTranslationMethod','\"site\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.transformFs','\"\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.transformSubpath','\"\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.altTranslationKeyFormat','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.altTranslationMethod','\"site\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.cardThumbAlignment','\"end\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elementCondition','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.autocapitalize','true'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.autocomplete','false'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.autocorrect','true'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.class','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.dateAdded','\"2026-01-21T11:23:56+00:00\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.disabled','false'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.elementCondition','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.id','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.includeInCards','false'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.inputType','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.instructions','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.label','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.max','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.min','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.name','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.orientation','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.placeholder','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.providesThumbs','false'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.readonly','false'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.requirable','false'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.size','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.step','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.tip','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.title','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.uid','\"a8236654-4d7f-42c4-ac9b-ec8a89a2c986\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.userCondition','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.warning','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.width','100'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.name','\"Content\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.uid','\"6f6486c1-8a0e-44a5-a6dc-d97d7ad723bb\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.userCondition','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fs','\"uploads\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.handle','\"immagini\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.name','\"Immagini\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.sortOrder','1'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.subpath','\"immagini\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.titleTranslationKeyFormat','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.titleTranslationMethod','\"site\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.transformFs','\"\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_yjojgtmarvuewmhhmouvpkfoluyzyohcxyhs` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_zagsrfxwbaatmwuecokeiohbcoxfwmbiajcz` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=676 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vapvtgnduxduyvwuopmhbihopsatvcgwqahz` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_uvbwbalbgctcdsepybjrjowjsfnbssmocjoj` (`sourceId`),
  KEY `idx_cylkmfebgvrukupfqwqwvnxrodxeczthrpsj` (`targetId`),
  KEY `idx_zitzydwjaabuwzdhbszctshwgzmvlxhlavpc` (`sourceSiteId`),
  CONSTRAINT `fk_gyavxxszmajlrjwayxebdzdaywwjjzfnktik` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qzuqchmeurmouvraczuhwimngetvvtbeacyy` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vaaamdmftqvpqkeattqxsxyaghqhubnhhzcs` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (3,10,11,NULL,10,1,'2026-01-21 15:58:33','2026-01-21 15:58:33','597d5e4d-57d6-4feb-bacb-8d973f54ae68'),(9,10,40,NULL,10,1,'2026-01-22 17:48:05','2026-01-22 17:48:05','08b87fbf-720a-4556-b28b-23d7cfb86081'),(12,10,45,NULL,10,1,'2026-01-22 17:52:57','2026-01-22 17:52:57','cecbea86-189b-4df8-af0c-68e42881093b'),(13,10,47,NULL,10,1,'2026-01-22 17:52:57','2026-01-22 17:52:57','89a9377a-e3c9-4769-b7db-41f9b323c8e6'),(24,19,123,1,118,1,'2026-01-23 16:21:38','2026-01-23 16:21:38','def685ec-19cb-4645-b884-de5ed3e7cf01'),(25,19,123,1,119,2,'2026-01-23 16:21:38','2026-01-23 16:21:38','e80713d4-b229-4cd0-bd57-79ac9b1181e7'),(26,19,123,1,120,3,'2026-01-23 16:21:38','2026-01-23 16:21:38','08276e74-876a-4ff1-9524-8e3e9f60f0b2'),(27,19,123,1,121,4,'2026-01-23 16:21:38','2026-01-23 16:21:38','243840ba-f1d7-4117-9515-dcd945d40ca0'),(28,19,123,1,122,5,'2026-01-23 16:21:38','2026-01-23 16:21:38','ebbc0345-3d1b-44e3-85fc-746a03ce47ec'),(29,19,123,2,118,1,'2026-01-23 16:21:38','2026-01-23 16:21:38','dfdb51c6-e518-4775-9a1f-3b7135f16c4d'),(30,19,123,2,119,2,'2026-01-23 16:21:38','2026-01-23 16:21:38','c51b3377-f7d1-4de3-96b5-2ca5c100ec70'),(31,19,123,2,120,3,'2026-01-23 16:21:38','2026-01-23 16:21:38','f1b8ee32-c607-49d2-9bd6-d250f8b2ca71'),(32,19,123,2,121,4,'2026-01-23 16:21:38','2026-01-23 16:21:38','27aea1a8-a6ee-47d8-901f-18f37f960dc3'),(33,19,123,2,122,5,'2026-01-23 16:21:38','2026-01-23 16:21:38','e973482d-3030-4fd8-96b8-570f97520a46'),(34,19,125,1,118,1,'2026-01-23 16:21:38','2026-01-23 16:21:38','f3b90770-a8be-4d2d-abfb-1f46217d4e6c'),(35,19,125,1,119,2,'2026-01-23 16:21:38','2026-01-23 16:21:38','13ca7b76-6023-461a-8345-a712227878aa'),(36,19,125,1,120,3,'2026-01-23 16:21:38','2026-01-23 16:21:38','fa03f325-5884-4105-a2ec-d47f5fd30619'),(37,19,125,1,121,4,'2026-01-23 16:21:38','2026-01-23 16:21:38','e7fb032b-6f44-4f41-9946-f4a25d8180df'),(38,19,125,1,122,5,'2026-01-23 16:21:38','2026-01-23 16:21:38','dd3c8baa-e3ae-47d5-a9c2-041c21730cc6'),(39,19,125,2,118,1,'2026-01-23 16:21:38','2026-01-23 16:21:38','6e0b05d5-ffb9-4cc0-b549-88025fbca149'),(40,19,125,2,119,2,'2026-01-23 16:21:38','2026-01-23 16:21:38','1adb2e10-d63b-4f7f-902d-6f31b0f91bd7'),(41,19,125,2,120,3,'2026-01-23 16:21:38','2026-01-23 16:21:38','e60bbb5b-b97b-4130-b10c-b7e6ea8182d3'),(42,19,125,2,121,4,'2026-01-23 16:21:38','2026-01-23 16:21:38','ff4d0a19-9611-4655-9a64-684a3f314380'),(43,19,125,2,122,5,'2026-01-23 16:21:38','2026-01-23 16:21:38','d0217187-99ef-431c-8903-cddf12c06d37');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('119a6d41','@craft/web/assets/datepickeri18n/dist'),('150369d8','@craft/web/assets/feed/dist'),('1a06e631','@craft/web/assets/velocity/dist'),('1c9afb7a','@craft/web/assets/animationblocker/dist'),('1f91e486','@craft/web/assets/jquerypayment/dist'),('1fc23be4','@craft/web/assets/jquerytouchevents/dist'),('23a3307a','@bower/jquery/dist'),('23ca3e58','@craft/web/assets/picturefill/dist'),('26c328d9','@craft/web/assets/vue/dist'),('28728358','@craft/web/assets/xregexp/dist'),('2a16549c','@craft/web/assets/craftsupport/dist'),('2cb8cee4','@craft/web/assets/timepicker/dist'),('32e3f082','@craft/web/assets/velocity/dist'),('37272d57','@craft/web/assets/jquerytouchevents/dist'),('373f76c7','@craft/web/assets/fileupload/dist'),('3774f235','@craft/web/assets/jquerypayment/dist'),('397f7bf2','@craft/web/assets/datepickeri18n/dist'),('3a4c0d75','@craft/web/assets/jquerypayment/dist'),('42eefc6c','@craft/web/assets/xregexp/dist'),('43d8df58','@craft/web/assets/jqueryui/dist'),('45dd857','@craft/web/assets/timepicker/dist'),('493f4f4e','@bower/jquery/dist'),('4956416c','@craft/web/assets/picturefill/dist'),('5073db2f','@craft/web/assets/htmx/dist'),('562b2a9a','@craft/web/assets/prismjs/dist'),('5da309f3','@craft/web/assets/fileupload/dist'),('5ee392fd','@craft/web/assets/animationblocker/dist'),('61da59fd','@bower/jquery/dist'),('64ba415e','@craft/web/assets/vue/dist'),('660536ab','@craft/web/assets/jqueryui/dist'),('6b3dc9eb','@craft/web/assets/jqueryui/dist'),('6c404f13','@craft/web/assets/dashboard/dist'),('709a9905','@craft/web/assets/velocity/dist'),('75461f40','@craft/web/assets/fileupload/dist'),('755e44d0','@craft/web/assets/jquerytouchevents/dist'),('7606844e','@craft/web/assets/animationblocker/dist'),('7896cd9c','@craft/web/assets/htmx/dist'),('7ece3c29','@craft/web/assets/prismjs/dist'),('80f981cc','@craft/web/assets/fieldsettings/dist'),('82251a65','@nystudio107/codeeditor/web/assets/dist'),('83106311','@craft/web/assets/axios/dist'),('85320148','@craft/web/assets/theme/dist'),('869054fa','@craft/web/assets/iframeresizer/dist'),('8dbaa295','@craft/web/assets/updateswidget/dist'),('8df15d4d','@craft/web/assets/d3/dist'),('8e289c51','@craft/web/assets/axios/dist'),('8ebcde2c','@craft/web/assets/admintable/dist'),('9795eb','@craft/web/assets/xregexp/dist'),('97c47b04','@craft/web/assets/cp/dist'),('98629e1c','@craft/web/assets/conditionbuilder/dist'),('9b8cd94c','@craft/web/assets/selectize/dist'),('9c99636e','@craft/web/assets/tailwindreset/dist'),('9ebf4b79','@craft/web/assets/pluginstore/dist'),('9f329dd3','@craft/web/assets/garnish/dist'),('a0efe8bb','@craft/web/assets/theme/dist'),('a1e67d5a','@craft/ckeditor/web/assets/ckeditor/dist'),('a34dbd09','@craft/web/assets/iframeresizer/dist'),('a5144bfe','@craft/web/assets/d3/dist'),('a81c977f','@craft/web/assets/fieldsettings/dist'),('a82cb4be','@craft/web/assets/d3/dist'),('abf575a2','@craft/web/assets/axios/dist'),('add717fb','@craft/web/assets/theme/dist'),('ae754249','@craft/web/assets/iframeresizer/dist'),('b08788af','@craft/web/assets/conditionbuilder/dist'),('b21992f7','@craft/web/assets/cp/dist'),('b2f28eb','@craft/web/assets/picturefill/dist'),('b300e0fb','@craft/web/assets/recententries/dist'),('b369cfff','@craft/web/assets/selectize/dist'),('b47c75dd','@craft/web/assets/tailwindreset/dist'),('b780aac4','@craft/web/assets/fabric/dist'),('b9448a9d','@craft/web/assets/tailwindreset/dist'),('bac3a6a4','@craft/web/assets/updater/dist'),('bf04d6de','@craft/ckeditor/web/assets/ckeconfig/dist'),('bf216db7','@craft/web/assets/cp/dist'),('c51cebb8','@craft/web/assets/tablesettings/dist'),('c5ed97b7','@craft/web/assets/matrix/dist'),('cad5b9ee','@craft/web/assets/queuemanager/dist'),('ccc5b7ab','@craft/web/assets/admintable/dist'),('cd3643ce','@craft/web/assets/utilities/dist'),('cf599584','@craft/web/assets/userpermissions/dist'),('dd1cd5f0','@craft/web/assets/fabric/dist'),('dd4bf454','@craft/web/assets/garnish/dist'),('e263e6a','@craft/web/assets/vue/dist'),('e420a118','@craft/web/assets/admintable/dist'),('e7bc8337','@craft/web/assets/userpermissions/dist'),('e7ece35','@craft/web/assets/editsection/dist'),('ed2d78ab','@craft/web/assets/graphiql/dist'),('f110a678','@craft/web/assets/selectize/dist'),('f5aee2e7','@craft/web/assets/garnish/dist'),('f5f9c343','@craft/web/assets/fabric/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_raicwpbzcqdxazegvdtapoftwaeqjniukmqh` (`canonicalId`,`num`),
  KEY `fk_wamjrdvketiwgfczdwahkgpjhjwyoanzoxuu` (`creatorId`),
  CONSTRAINT `fk_rjrivhzgqofkmvuwahegsevrucslfnwnwtyo` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wamjrdvketiwgfczdwahkgpjhjwyoanzoxuu` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (10,2,NULL,8,NULL),(11,2,1,9,'Applied “Draft 1”'),(12,29,1,1,NULL),(13,2,1,10,'Applied “Draft 1”'),(14,29,1,2,NULL),(15,2,1,11,'Applied “Draft 1”'),(16,11,1,3,NULL),(17,2,1,12,'Applied “Draft 1”'),(18,45,1,1,NULL),(19,29,1,3,NULL),(20,2,1,13,'Applied “Draft 1”'),(21,62,1,1,NULL),(22,63,1,1,NULL),(23,64,1,1,NULL),(24,65,1,1,NULL),(25,66,1,1,NULL),(26,2,1,14,'Applied “Draft 1”'),(27,80,1,1,NULL),(28,81,1,1,NULL),(29,82,1,1,NULL),(30,83,1,1,NULL),(31,84,1,1,NULL),(32,2,1,15,'Applied “Draft 1”'),(33,94,1,1,NULL),(34,95,1,1,NULL),(35,2,1,16,'Applied “Draft 1”'),(36,105,1,1,NULL),(37,106,1,1,NULL),(38,107,1,1,NULL),(39,108,1,1,NULL),(40,109,1,1,NULL),(41,2,1,17,'Applied “Draft 1”'),(42,123,1,1,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_mmgxzurplujxsuhkdynuqwevpfcpumgsnpfj` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' admin example com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' homepage '),(2,'slug',0,2,' homepage '),(2,'title',0,1,' homepage '),(2,'title',0,2,' homepage '),(9,'alt',0,1,''),(9,'alt',0,2,''),(9,'extension',0,1,' jpg '),(9,'extension',0,2,' jpg '),(9,'filename',0,1,' circles copia jpg '),(9,'filename',0,2,' circles copia jpg '),(9,'kind',0,1,' image '),(9,'kind',0,2,' image '),(9,'slug',0,1,''),(9,'slug',0,2,''),(9,'title',0,1,' circles copia '),(9,'title',0,2,' circles copia '),(10,'alt',0,1,''),(10,'alt',0,2,''),(10,'extension',0,1,' mp4 '),(10,'extension',0,2,' mp4 '),(10,'filename',0,1,' hero fontana mp4 '),(10,'filename',0,2,' hero fontana mp4 '),(10,'kind',0,1,' video '),(10,'kind',0,2,' video '),(10,'slug',0,1,''),(10,'slug',0,2,''),(10,'title',0,1,' hero fontana '),(10,'title',0,2,' hero fontana '),(11,'slug',0,1,''),(11,'slug',0,2,' temp jjiaqdirfzcmeorzwkixekzornuvgnbfouxd '),(11,'title',0,1,''),(11,'title',0,2,''),(18,'slug',0,1,''),(18,'slug',0,2,''),(29,'slug',0,1,''),(29,'slug',0,2,''),(29,'title',0,1,''),(29,'title',0,2,''),(45,'slug',0,1,''),(45,'slug',0,2,''),(45,'title',0,1,''),(45,'title',0,2,''),(52,'slug',0,1,' temp ziacgxlftgsvdedwkkmtvuwmlbmfuertzfvy '),(52,'slug',0,2,' temp ziacgxlftgsvdedwkkmtvuwmlbmfuertzfvy '),(52,'title',0,1,''),(52,'title',0,2,''),(53,'slug',0,1,''),(53,'slug',0,2,''),(62,'slug',0,1,''),(62,'slug',0,2,' temp ktdvsfwnajsacscyrmayhjmhcvymqjeaxodh '),(62,'title',0,1,''),(62,'title',0,2,''),(63,'slug',0,1,''),(63,'slug',0,2,' temp veywfvvweibmfmsafqgevxhbenzbkqhehexj '),(63,'title',0,1,''),(63,'title',0,2,''),(64,'slug',0,1,''),(64,'slug',0,2,''),(64,'title',0,1,''),(64,'title',0,2,''),(65,'slug',0,1,' temp ozfcznvvlhxluntzjmmmnvcwuhuquakuhlbr '),(65,'slug',0,2,' temp ozfcznvvlhxluntzjmmmnvcwuhuquakuhlbr '),(65,'title',0,1,''),(65,'title',0,2,''),(66,'slug',0,1,' temp savflrtcnarnhgxuggttabyfhmlzlmitbpvr '),(66,'slug',0,2,' temp savflrtcnarnhgxuggttabyfhmlzlmitbpvr '),(66,'title',0,1,''),(66,'title',0,2,''),(80,'slug',0,1,''),(80,'slug',0,2,' temp ktdvsfwnajsacscyrmayhjmhcvymqjeaxodh '),(80,'title',0,1,''),(80,'title',0,2,''),(81,'slug',0,1,''),(81,'slug',0,2,' temp veywfvvweibmfmsafqgevxhbenzbkqhehexj '),(81,'title',0,1,''),(81,'title',0,2,''),(82,'slug',0,1,''),(82,'slug',0,2,''),(82,'title',0,1,''),(82,'title',0,2,''),(83,'slug',0,1,' temp ozfcznvvlhxluntzjmmmnvcwuhuquakuhlbr '),(83,'slug',0,2,' temp ozfcznvvlhxluntzjmmmnvcwuhuquakuhlbr '),(83,'title',0,1,''),(83,'title',0,2,''),(84,'slug',0,1,' temp savflrtcnarnhgxuggttabyfhmlzlmitbpvr '),(84,'slug',0,2,' temp savflrtcnarnhgxuggttabyfhmlzlmitbpvr '),(84,'title',0,1,''),(84,'title',0,2,''),(94,'slug',0,1,''),(94,'slug',0,2,''),(94,'title',0,1,''),(94,'title',0,2,''),(95,'slug',0,1,' temp qgzustvkgoyckmcpabzbnutmandfoadnxduz '),(95,'slug',0,2,' temp qgzustvkgoyckmcpabzbnutmandfoadnxduz '),(95,'title',0,1,''),(95,'title',0,2,''),(105,'slug',0,1,''),(105,'slug',0,2,' temp ohfafydwfnxkgsgdeyueaizruoluvewhlwjv '),(105,'title',0,1,''),(105,'title',0,2,''),(106,'slug',0,1,' temp fywfxqccadrhmvtpxzsviwcaohltfquijmqa '),(106,'slug',0,2,' temp fywfxqccadrhmvtpxzsviwcaohltfquijmqa '),(106,'title',0,1,''),(106,'title',0,2,''),(107,'slug',0,1,' temp tokzraexactnhfyiqrrjxzxjpsysljaicrcd '),(107,'slug',0,2,' temp tokzraexactnhfyiqrrjxzxjpsysljaicrcd '),(107,'title',0,1,''),(107,'title',0,2,''),(108,'slug',0,1,' temp itwnzbcvuhpezqkhikzmzxlvlrsmxnjevgao '),(108,'slug',0,2,' temp itwnzbcvuhpezqkhikzmzxlvlrsmxnjevgao '),(108,'title',0,1,''),(108,'title',0,2,''),(109,'slug',0,1,' temp nsjuugazucilkuffrpwpcqxospxrdxobhpjl '),(109,'slug',0,2,' temp nsjuugazucilkuffrpwpcqxospxrdxobhpjl '),(109,'title',0,1,''),(109,'title',0,2,''),(118,'alt',0,1,''),(118,'alt',0,2,''),(118,'extension',0,1,' jpeg '),(118,'extension',0,2,' jpeg '),(118,'filename',0,1,' 01 jpeg '),(118,'filename',0,2,' 01 jpeg '),(118,'kind',0,1,' image '),(118,'kind',0,2,' image '),(118,'slug',0,1,''),(118,'slug',0,2,''),(118,'title',0,1,' 01 '),(118,'title',0,2,' 01 '),(119,'alt',0,1,''),(119,'alt',0,2,''),(119,'extension',0,1,' jpeg '),(119,'extension',0,2,' jpeg '),(119,'filename',0,1,' 02 jpeg '),(119,'filename',0,2,' 02 jpeg '),(119,'kind',0,1,' image '),(119,'kind',0,2,' image '),(119,'slug',0,1,''),(119,'slug',0,2,''),(119,'title',0,1,' 02 '),(119,'title',0,2,' 02 '),(120,'alt',0,1,''),(120,'alt',0,2,''),(120,'extension',0,1,' jpeg '),(120,'extension',0,2,' jpeg '),(120,'filename',0,1,' 03 jpeg '),(120,'filename',0,2,' 03 jpeg '),(120,'kind',0,1,' image '),(120,'kind',0,2,' image '),(120,'slug',0,1,''),(120,'slug',0,2,''),(120,'title',0,1,' 03 '),(120,'title',0,2,' 03 '),(121,'alt',0,1,''),(121,'alt',0,2,''),(121,'extension',0,1,' jpeg '),(121,'extension',0,2,' jpeg '),(121,'filename',0,1,' 04 jpeg '),(121,'filename',0,2,' 04 jpeg '),(121,'kind',0,1,' image '),(121,'kind',0,2,' image '),(121,'slug',0,1,''),(121,'slug',0,2,''),(121,'title',0,1,' 04 '),(121,'title',0,2,' 04 '),(122,'alt',0,1,''),(122,'alt',0,2,''),(122,'extension',0,1,' jpeg '),(122,'extension',0,2,' jpeg '),(122,'filename',0,1,' 05 jpeg '),(122,'filename',0,2,' 05 jpeg '),(122,'kind',0,1,' image '),(122,'kind',0,2,' image '),(122,'slug',0,1,''),(122,'slug',0,2,''),(122,'title',0,1,' 05 '),(122,'title',0,2,' 05 '),(123,'slug',0,1,''),(123,'slug',0,2,''),(123,'title',0,1,''),(123,'title',0,2,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindexqueue`
--

DROP TABLE IF EXISTS `searchindexqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ifeljawcsvrhuevdqozgraszshghmvsitpfj` (`elementId`,`siteId`,`reserved`),
  CONSTRAINT `fk_gesosoirkxwcmgbqoagnofabemcotghswbhw` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindexqueue`
--

LOCK TABLES `searchindexqueue` WRITE;
/*!40000 ALTER TABLE `searchindexqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchindexqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindexqueue_fields`
--

DROP TABLE IF EXISTS `searchindexqueue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue_fields` (
  `jobId` int NOT NULL,
  `fieldHandle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`jobId`,`fieldHandle`),
  UNIQUE KEY `idx_vtjbknpkwtxuvnoeosxpjhjpgckmrllxvtgc` (`jobId`,`fieldHandle`),
  CONSTRAINT `fk_snsprpzhthqadutaldrjbmbhqcrgumjekoxr` FOREIGN KEY (`jobId`) REFERENCES `searchindexqueue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindexqueue_fields`
--

LOCK TABLES `searchindexqueue_fields` WRITE;
/*!40000 ALTER TABLE `searchindexqueue_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchindexqueue_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ctmkogrwidwqoeltnqsgdvdxojshtfgeyrdf` (`handle`),
  KEY `idx_nlhcfggurqxisrxldphhxhprxglvblornkns` (`name`),
  KEY `idx_giwcipfaaiilljpaqisjthqsgsvyvbhnlyln` (`structureId`),
  KEY `idx_saaubxgjzmvvwfutacpteexnnoxjtqqnoger` (`dateDeleted`),
  CONSTRAINT `fk_qbfdqmwaeqtviqpapjqcrmqwbwpfeupoutrd` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'Homepage','homepage','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2026-01-21 12:13:19','2026-01-21 12:13:19',NULL,'45952d02-8da9-45dc-81df-be4fea47ce47');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_ymsuuzhziilgjluemdozpwqtcvgjwinyixgw` (`typeId`),
  CONSTRAINT `fk_ykizbbwasmfjcdzazldazbmyugtnxiplvtcz` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ymsuuzhziilgjluemdozpwqtcvgjwinyixgw` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
INSERT INTO `sections_entrytypes` VALUES (1,2,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `template` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ycydiqbfwgodnmnzdyrygkontbvgaosgiavm` (`sectionId`,`siteId`),
  KEY `idx_boagesluaryhgvyevcioghqaqckrjruebuql` (`siteId`),
  CONSTRAINT `fk_knldxdvsfndtzpltsirbhyofnydpdfgopfaa` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wkcqrlrsahkyyqivtcytpxkpqgipxfqcntpv` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__',NULL,1,'2026-01-21 12:13:19','2026-01-21 12:13:19','3872dcc5-02a4-4329-99fa-7dc68effbaef'),(2,1,2,1,'__home__',NULL,1,'2026-01-21 12:13:19','2026-01-21 12:13:19','78650746-cc17-4a08-a877-c477addadec1');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qwnmmepgdtudngkgahcchkdphjlegfucmxjn` (`uid`),
  KEY `idx_ktdionprffwfupnozbfkdpgqfpkzyxlebfkm` (`token`),
  KEY `idx_ndlulgkijibgvjvlqyyckjcnlgmpfdcrimjt` (`dateUpdated`),
  KEY `idx_pczzjluinrqmlkdmiszmqshuapxsrbezxlba` (`userId`),
  CONSTRAINT `fk_yigsjpclcvzntddijsuibqsxgjucoxpspndc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (8,1,'KJA9x7Y4MCr5iVg8X3YSAm_i6pE4fNrR8_X8eDkmjILaQ2zvhckDP87h50xumKTDTUHxDm1XSKsewCSN67d8MLQxIhpSJQyjxocs','2026-01-22 14:29:23','2026-01-22 14:40:06','5fc4ba77-c29b-459a-a23a-88c82a05339e'),(9,1,'u9HlIE3iMCbMmQq65aqAJu-F8teYbLcavJXg86IzMNHwEs3_REY7gdcQsgwG0aTbVCDFBOAPfQi-gNS_7IL7O48npzECPcKwHRGq','2026-01-22 15:47:50','2026-01-23 09:30:16','da452280-9aa5-43e8-b599-c4b7a8942345'),(11,1,'NyzbPkhcVY9Pcwiz_zc7P_0uLQoGkezc-auUXLl-55ptVFHedTXlC41j2Gu1givaCYbXeKDaAwEt8roOAuJzo_9X66qfbmBxzYK2','2026-01-23 13:32:43','2026-01-23 14:43:33','1a953c5e-9e9a-4dfd-a334-4ca939cf3886'),(12,1,'o_SScxL6beSlPns7_TLEKaud8DApzM8WLjqBFjxkpQRCAIoBOo3NzjrBnw1730YSaZ4TWf1TghcEkLqAdmSEqq3bxENfA5a1NUmk','2026-01-23 16:04:01','2026-01-23 16:09:16','cf1db600-ad3b-4bc8-a0b4-697ed6424e73'),(13,1,'REexla-D_eP8jDM4zlNms98KZh0jhUFzckN75V6RFRsnyE_GrDT7MyBmGzraOF4XQ2dDU3fbLpXo8F_VKu2gKADlTROsALleTAmg','2026-01-23 16:14:01','2026-01-23 16:15:26','f2dd6f1e-2c27-47f7-869c-c72d3fee8fb4'),(14,1,'ec18dmQxBKsRT1YS6eEwLp3rY-S7vMMmznbLlZTSXZa57Nwcztb04zRZJZshnQmEIhPr7JS2_X2acl9SXYXTSIPwp1-Ub29tEsfb','2026-01-23 16:15:26','2026-01-23 16:34:14','08bc7066-d314-40ad-83cb-98f6d6a8ecaf');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lqikdellzcookkcyvpypnttqmsvonbuxhcys` (`userId`,`message`),
  CONSTRAINT `fk_aoyegriwuvtbquubspeyyadfgkfdmzrfqgil` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dhldjlifbjxtvupmegjyoalsseghqvcjzozs` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'fonta-trevi','2026-01-21 10:24:43','2026-01-21 10:24:43',NULL,'9c5d5f1c-302b-432d-8889-3965d508b194');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_euhvlblwdpzntmbuzfwwijxiqcjmzzxetrwk` (`dateDeleted`),
  KEY `idx_dgjcxarasdubdelhtnosornwuzfpaozzcnhk` (`handle`),
  KEY `idx_parxgtnheuxjkswgmuprdikigzxkfsmnfnns` (`sortOrder`),
  KEY `fk_rmrwymymycrkophnsrcczehcndbfuaqfgehu` (`groupId`),
  CONSTRAINT `fk_rmrwymymycrkophnsrcczehcndbfuaqfgehu` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,'1','Fontana Trevi - IT','default','it-IT',1,'$PRIMARY_SITE_URL',1,'2026-01-21 10:24:43','2026-01-22 16:13:12',NULL,'8f7f8686-4145-4205-ace1-e67e6e7f91f5'),(2,1,0,'true','Fontana Trevi - EN','en','en-GB',1,'$PRIMARY_SITE_URL/en',2,'2026-01-21 11:04:12','2026-01-21 11:04:12',NULL,'b2c3d4e5-f678-90ab-cdef-123456789012');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `identityId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_ilihdhpzsfcwracxxtcvplypeluodusnache` (`userId`),
  CONSTRAINT `fk_ilihdhpzsfcwracxxtcvplypeluodusnache` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_azxsvzgbaidemprlfuxibhrzgktvbbplczwc` (`structureId`,`elementId`),
  KEY `idx_zxwnkwqgqanbfaavvilviucqrolcaeefygcv` (`root`),
  KEY `idx_xfhzaowbsqafpqwmpihvicitjhdgdlufyurg` (`lft`),
  KEY `idx_lhequrstegaqzrrxvfkvcgeacananqiidcat` (`rgt`),
  KEY `idx_cxwyyczwjqsmnydmbzvprikcncvzisauhccw` (`level`),
  KEY `idx_elrigvunysujbtzexgjxhfownfozdusnhaht` (`elementId`),
  CONSTRAINT `fk_pjkpidrblhksntwltndoumdrmyjzkypoqkzl` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jxssybncfczxifjbypqbcyqxfvbbwnomryyt` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zilvafjbgtcmqidsgxhrmyjbmiiyieqwxygf` (`key`,`language`),
  KEY `idx_yffijkfslaptuqunkcscaeejhvoxzjudvdow` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eyndwukhbtzfewhhgaqhivlbfqlvmkwvyblz` (`name`),
  KEY `idx_mxxijticbdgwsaignoekuwnrlshdfbgzrzld` (`handle`),
  KEY `idx_haieopofmhodhwnbukeduqdbtfvxstuacmpg` (`dateDeleted`),
  KEY `fk_nqnaxmgebbhijawqjafzdzllpkbskzhqwavv` (`fieldLayoutId`),
  CONSTRAINT `fk_nqnaxmgebbhijawqjafzdzllpkbskzhqwavv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xswrtvugihjckwdeenwhgsqtunuxzsarqgno` (`groupId`),
  CONSTRAINT `fk_hxnvzpxecnfedckykriruvnwccbwrqvfpikw` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wgxqunovegdsptmgudbohnyrzpigfljmshma` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gtzzqufgwdwnfhrstduhknrofwullafnlrpg` (`token`),
  KEY `idx_zwuhwgfaayznagxwmagorhvduxqquryvudqp` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_homrsrpsdwyxsldnyqwclwbufugruosyqvjo` (`handle`),
  KEY `idx_lsfdhfoshvietyfqftjurlyekkjhzdxheogz` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_msopwxtndaxpnpwvnhvapxdmuhroswcaeusk` (`groupId`,`userId`),
  KEY `idx_hvmctgawdzkmdytiwjphgemiwlufrwmelxsq` (`userId`),
  CONSTRAINT `fk_aesfeznmttilgbjkqyadunsgbrrbdqsudgcp` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qitoothilllgrtddhbgsrrdhpchrekosytak` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_razmspauyaiknsdmfisdbsotcuwhdoixbwmv` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ssporbiroesfwwhhzztfvtakklqkkayuvvvq` (`permissionId`,`groupId`),
  KEY `idx_ikuebbfqkfypzzewhiozoizgtqffolegcfsu` (`groupId`),
  CONSTRAINT `fk_knvibdyrcddmweitxqegxdahtiykjbskrgfi` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nftivqpakvyahgksqsjcjqcnhvaergwomcgr` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_urehrpkawsjnhfnbrndkoptfqcdbjctplwfv` (`permissionId`,`userId`),
  KEY `idx_lpisvptzwfgbpzuumxrggveppgsnbzhaxkmc` (`userId`),
  CONSTRAINT `fk_oalnqsovjosqbeeeevrejcjoxrauwrpbolcf` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sckyzamicrxljqeumslwdztxqidstojnbcjl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_sorbtkkvtrlequirduwmsdmedlswdqdyptit` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\": \"en\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `affiliatedSiteId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vhdtfcfwyfulvtxxulhowfdhnhpmnzzpdnve` (`active`),
  KEY `idx_lpkgbanfnvsctgxyunioyvbusgakrolfznjy` (`locked`),
  KEY `idx_ajzefyxynngndwkaosrcheratciupzdjrxom` (`pending`),
  KEY `idx_txgucswmtdshdfibczkomxhqhuxtezypdilk` (`suspended`),
  KEY `idx_ryvasiixzcrigkmhvarqravrxejasflmaoyd` (`verificationCode`),
  KEY `idx_aawnulbbntdllzsbegijywjuccevydzmezsh` (`email`),
  KEY `idx_qdkfkqvnpcvlbeylfzgtwstrvzwxfgpshdui` (`username`),
  KEY `fk_flwuxkeonrmaphpfardkwnhzyifiqiulxyra` (`photoId`),
  KEY `fk_rzsmkpzqiadvjkxfvkrctxwjhcteqmwkggmi` (`affiliatedSiteId`),
  CONSTRAINT `fk_flwuxkeonrmaphpfardkwnhzyifiqiulxyra` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rzsmkpzqiadvjkxfvkrctxwjhcteqmwkggmi` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_smsqtfpkygrwkrtnrtitddsmilsfoohckbqz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'admin@example.com','$2y$13$4Tb.KYt2pfuVKR4YbDIKNOIqGzYDgcOaaDRpEikr/Yu7mPMQEUoXe','2026-01-23 16:15:26',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2026-01-22 14:28:21','2026-01-21 10:24:45','2026-01-23 16:15:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qodtkmtwdxjyvwylkzdmrvqbqaoujekjdnpe` (`name`,`parentId`,`volumeId`),
  KEY `idx_tlcewnyecaqcmzokcfcoxwdnpuaxxgfsyqyk` (`parentId`),
  KEY `idx_wfticwomxdofgzvajgwwnpjjydvoimljjate` (`volumeId`),
  CONSTRAINT `fk_wdeodmdoxmwaqzhqyshkwkvbalcnqmrhxtll` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xphsnqpqoxzssjjuggbpnnnmsvqpssqjzjbc` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Immagini',NULL,'2026-01-21 11:27:35','2026-01-22 15:46:32','ee1984ef-5822-44f2-9469-02f33c8cad86'),(2,NULL,2,'Video',NULL,'2026-01-21 11:28:57','2026-01-22 15:46:32','93442e25-a95a-412f-b700-79bc3e5f1c35'),(3,NULL,NULL,'Temporary Uploads',NULL,'2026-01-21 14:31:51','2026-01-21 14:31:51','09b4cfaa-5e0c-4249-901b-00d860e8fa15'),(4,3,NULL,'user_1','user_1/','2026-01-21 14:31:51','2026-01-21 14:31:51','53cce686-2a65-4072-8b48-f353d0bd6099');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subpath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transformFs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transformSubpath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `altTranslationMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_clacxzdfravvgykotaxfclmzeofiivmtjcwn` (`name`),
  KEY `idx_vcnpqrithfyboyqexoqrahewxxnfoksqjcud` (`handle`),
  KEY `idx_yfaqwvnducliwrlwyqbcjggbcrtyhbjnvusw` (`fieldLayoutId`),
  KEY `idx_jperrqbaogzqqpdyyojntjayxlhowsbryldz` (`dateDeleted`),
  CONSTRAINT `fk_tdpjmxjafbagtjgjgyzgbcvomosiojgodnhd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES (1,2,'Immagini','immagini','uploads','immagini','','','site',NULL,'site',NULL,1,'2026-01-21 11:27:35','2026-01-21 11:27:35',NULL,'f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4'),(2,3,'Video','video','uploads','video','','','site',NULL,'site',NULL,2,'2026-01-21 11:28:57','2026-01-21 11:28:57',NULL,'c0c8eabb-1d94-449c-b621-1252e3e75ea4');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credential` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `credentialName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_lgwoyiqcwqtgctxzmpcwopbdcebysqqdjxho` (`userId`),
  CONSTRAINT `fk_lgwoyiqcwqtgctxzmpcwopbdcebysqqdjxho` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bgyuwccfrvscnfgospfkypfpztdsjwpxrxxl` (`userId`),
  CONSTRAINT `fk_bjqpxfgvbxqzncfaulwscdqtwildcweegbjk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',1,'2026-01-21 10:36:57','2026-01-21 10:36:57','9d2ab5ad-73ad-4439-b572-29d0a3a8c4f7'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2026-01-21 10:36:57','2026-01-21 10:36:57','64f3ebd1-0c9c-4a64-a498-3ae3d0ba9a6e'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2026-01-21 10:36:57','2026-01-21 10:36:57','4a01265c-9a88-422a-90fb-05b2818421dd'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2026-01-21 10:36:57','2026-01-21 10:36:57','0bad9ee2-a946-478b-80d6-2e83120b7fa2');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'craft'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-23 16:34:18
