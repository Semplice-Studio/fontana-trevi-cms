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
  `countryCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `administrativeArea` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dependentLocality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postalCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortingCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressLine1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressLine2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressLine3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organizationTaxId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `heading` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `uri` text COLLATE utf8mb4_unicode_ci,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `indexedVolumes` text COLLATE utf8mb4_unicode_ci,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mimeType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kind` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unknown',
  `alt` text COLLATE utf8mb4_unicode_ci,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `assets` VALUES (9,2,2,1,'Circles-Copia.jpg','image/jpeg','image',NULL,1211,1211,402453,NULL,0,0,'2026-01-21 14:32:36','2026-01-21 14:32:37','2026-01-21 14:32:37'),(10,2,2,1,'hero-fontana.mp4','video/mp4','video',NULL,NULL,NULL,32020253,NULL,NULL,NULL,'2026-01-21 15:57:49','2026-01-21 15:57:50','2026-01-21 15:57:50');
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
  `alt` text COLLATE utf8mb4_unicode_ci,
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
INSERT INTO `assets_sites` VALUES (9,1,NULL),(9,2,NULL),(10,1,NULL),(10,2,NULL);
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
  `auth2faSecret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `key` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senderClass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `uriFormat` text COLLATE utf8mb4_unicode_ci,
  `template` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `attribute` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `changedattributes` VALUES (1,1,'lastPasswordChangeDate','2026-01-22 14:28:21',0,NULL),(1,1,'password','2026-01-22 14:28:21',0,NULL),(11,1,'primaryOwnerId','2026-01-22 10:00:06',0,1),(11,1,'slug','2026-01-22 10:00:06',0,1),(11,1,'title','2026-01-22 10:00:06',0,1),(11,2,'enabledForSite','2026-01-22 10:00:06',1,1),(11,2,'primaryOwnerId','2026-01-22 10:00:06',1,1),(11,2,'title','2026-01-22 10:00:06',1,1);
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
  `layoutElementUid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
INSERT INTO `changedfields` VALUES (2,1,5,'17bd8943-7c32-4e2e-a7ea-7199a5dde208','2026-01-22 10:00:07',0,1),(11,1,13,'2c7837c0-d6c7-4020-98eb-d25a07225f81','2026-01-22 10:00:06',0,1);
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
  `accessToken` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_eecqkvdvwwrhmljlgcgdjysecurndnwqqrbm` (`creatorId`,`provisional`),
  KEY `idx_hrfdlrtffcrspcjmmdghxaevxurohuhkvqpf` (`saved`),
  KEY `fk_oifhpmmxihwibpeghiucjdzmqbkqwqubfqoo` (`canonicalId`),
  CONSTRAINT `fk_eeiwnpzhwjabmukkrqyajrdwjhacfoeduivj` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_oifhpmmxihwibpeghiucjdzmqbkqwqubfqoo` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
INSERT INTO `drafts` VALUES (2,NULL,1,0,'First draft',NULL,0,NULL,0);
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
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `elementactivity` VALUES (1,1,1,NULL,'view','2026-01-21 10:49:40'),(2,1,1,NULL,'edit','2026-01-22 09:59:56'),(2,1,1,NULL,'save','2026-01-22 10:00:07'),(2,1,1,NULL,'view','2026-01-22 11:45:06'),(5,1,1,NULL,'view','2026-01-21 14:01:16'),(11,1,1,NULL,'edit','2026-01-22 09:59:52'),(11,1,1,NULL,'view','2026-01-22 10:00:02');
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
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2026-01-21 10:24:45','2026-01-22 14:28:20',NULL,NULL,NULL,'48181e7e-e47d-4df2-bd64-b38d7e272794'),(2,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2026-01-21 12:13:20','2026-01-22 10:00:06',NULL,NULL,NULL,'6ca1e5dd-b0b5-4919-bdb2-06dae48875e1'),(3,2,NULL,1,4,'craft\\elements\\Entry',1,0,'2026-01-21 12:13:20','2026-01-21 12:13:20',NULL,NULL,NULL,'1f3fc280-381a-4d8d-90b5-798938e3ced3'),(5,NULL,2,NULL,5,'craft\\elements\\Entry',1,0,'2026-01-21 14:00:20','2026-01-21 14:00:20',NULL,NULL,NULL,'234ce77a-3355-4eac-8e0d-6a3599833523'),(6,2,NULL,2,4,'craft\\elements\\Entry',1,0,'2026-01-21 14:01:27','2026-01-21 14:01:27',NULL,NULL,NULL,'cd1969cc-7f01-441b-82cf-0ae7ecfd2d63'),(9,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2026-01-21 14:32:35','2026-01-21 14:33:19',NULL,'2026-01-21 14:33:19',NULL,'e77b98ad-7182-479f-b728-cbc0102e7cdc'),(10,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2026-01-21 15:57:49','2026-01-21 15:57:49',NULL,NULL,NULL,'bacfe83e-4db8-4f1f-9181-6cdbf3c2788c'),(11,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-01-21 15:58:33','2026-01-22 10:00:06',NULL,NULL,NULL,'b8de7f8a-68ca-45e5-bc9f-1e6d74ce0438'),(12,2,NULL,3,4,'craft\\elements\\Entry',1,0,'2026-01-21 15:58:32','2026-01-21 15:58:33',NULL,NULL,NULL,'d824657a-94a2-4e8a-ad4c-188e8a552c9b'),(13,11,NULL,4,5,'craft\\elements\\Entry',1,0,'2026-01-21 15:58:33','2026-01-21 15:58:33',NULL,NULL,NULL,'7aa0b2b4-daa2-4361-8095-29729dfd4dcd'),(16,2,NULL,5,4,'craft\\elements\\Entry',1,0,'2026-01-22 10:00:06','2026-01-22 10:00:07',NULL,NULL,NULL,'efc2206c-49a6-46c2-a2de-19ec9179bcd6'),(17,11,NULL,6,5,'craft\\elements\\Entry',1,0,'2026-01-22 10:00:06','2026-01-22 10:00:07',NULL,NULL,NULL,'7130cdc9-e3d2-406c-96fa-519dcd00a9a6'),(18,NULL,NULL,NULL,6,'craft\\elements\\GlobalSet',1,0,'2026-01-22 10:31:18','2026-01-22 10:35:36',NULL,NULL,NULL,'85074937-dff7-4c16-9d2c-0c76875fea4a');
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
  `key` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `elements_owners` VALUES (11,2,1),(13,12,1),(17,16,1);
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
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xbseerpobhmrinmgvxwtfnxgzapmhdyqygyj` (`elementId`,`siteId`),
  KEY `idx_mleonydsxqukcteezbghayknnyhnjkphjsaq` (`siteId`),
  KEY `idx_rixydghfhlhfdszkohilxuseockcqtdsruyp` (`title`,`siteId`),
  KEY `idx_gvcmrjzxowmmfezkjctlimoduoasvngmyihx` (`slug`,`siteId`),
  KEY `idx_ajqykqacysyvxbpewqfifgjuucczwzozqrps` (`enabled`),
  KEY `idx_belasrpatuzsneptlwqxmrwmeejklskqbxsv` (`uri`,`siteId`),
  CONSTRAINT `fk_chotowtvyempjrrgzatopvddhjvwfblzptml` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vfftsftyuegszvwonkwoignkwktvbwjxoqos` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2026-01-21 10:24:45','2026-01-21 10:24:45','c3d34526-5333-40f5-a600-48915ee475e3'),(2,2,1,'Homepage','homepage','__home__',NULL,1,'2026-01-21 12:13:20','2026-01-21 12:13:20','c7c01db5-9326-4b4c-a1ee-50b908c129d2'),(3,2,2,'Homepage','homepage','__home__',NULL,1,'2026-01-21 12:13:20','2026-01-21 12:13:20','f6f5f4d0-b2e0-4264-ba0a-dd40470d0fc3'),(4,3,1,'Homepage','homepage','__home__',NULL,1,'2026-01-21 12:13:20','2026-01-21 12:13:20','5561f331-2ad4-470d-a673-874314f4e715'),(5,3,2,'Homepage','homepage','__home__',NULL,1,'2026-01-21 12:13:20','2026-01-21 12:13:20','23bf036f-f4c8-4924-83d6-f2640aec68fe'),(8,5,1,NULL,'__temp_vfaqlvfpmfdihlloktpewxqvhqsrjjotnmwx',NULL,NULL,1,'2026-01-21 14:00:20','2026-01-21 14:00:20','ab6c96ca-47a7-4df1-8335-1b9017c51b2e'),(9,5,2,NULL,'__temp_vfaqlvfpmfdihlloktpewxqvhqsrjjotnmwx',NULL,NULL,1,'2026-01-21 14:00:20','2026-01-21 14:00:20','521e49fe-49ef-43b3-98cb-eb30785fe0a5'),(10,6,1,'Homepage','homepage','__home__',NULL,1,'2026-01-21 14:01:27','2026-01-21 14:01:27','e93713cf-fc1f-4581-ba81-07dc5ad324d7'),(11,6,2,'Homepage','homepage','__home__',NULL,1,'2026-01-21 14:01:27','2026-01-21 14:01:27','bbd4286c-47b9-4cb1-aef5-4b629b075412'),(16,9,1,'Circles Copia',NULL,NULL,NULL,1,'2026-01-21 14:32:35','2026-01-21 14:32:35','05cce988-b7f3-4cb1-a04a-64dbf0d32600'),(17,9,2,'Circles Copia',NULL,NULL,NULL,1,'2026-01-21 14:32:37','2026-01-21 14:32:37','91d062c8-4cbf-4e0b-83ae-2dabb8c4e279'),(18,10,1,'Hero fontana',NULL,NULL,NULL,1,'2026-01-21 15:57:49','2026-01-21 15:57:49','33276279-a854-4ba4-a2ff-4d39e945851a'),(19,10,2,'Hero fontana',NULL,NULL,NULL,1,'2026-01-21 15:57:50','2026-01-21 15:57:50','23fb1d13-e031-4341-91db-26f8ad1f325b'),(20,11,1,NULL,NULL,NULL,'{\"2c7837c0-d6c7-4020-98eb-d25a07225f81\": {\"type\": \"url\", \"title\": \"Compra i biglietti\", \"value\": \"https://google.it\", \"target\": \"_blank\"}, \"4017fac0-2898-4409-ad1e-ec6249c689f6\": \"test\", \"6a7056b8-5a93-4e11-b979-ddca12bf63ad\": [10], \"6f85adcd-9983-4bdd-83b4-b40299697ec5\": \"speciale\", \"7f0b6c56-6b6d-468c-8db8-50efb3a4a289\": \"test\", \"8a8999b5-fe5e-4226-9093-65d582264591\": \"test\", \"cb0fb487-6cd3-42cf-acdd-fd5fc50078c1\": \"test\", \"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\": \"test\"}',1,'2026-01-21 15:58:33','2026-01-22 10:00:06','c5428869-12bd-4566-8668-35d22ab5b7a2'),(21,11,2,NULL,'__temp_jjiaqdirfzcmeorzwkixekzornuvgnbfouxd',NULL,'{\"4017fac0-2898-4409-ad1e-ec6249c689f6\": \"test\", \"6a7056b8-5a93-4e11-b979-ddca12bf63ad\": [10], \"6f85adcd-9983-4bdd-83b4-b40299697ec5\": \"speciale\", \"8a8999b5-fe5e-4226-9093-65d582264591\": \"test\", \"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\": \"test\"}',1,'2026-01-21 15:58:33','2026-01-21 15:58:33','358c87f8-0cbf-4b6c-98ff-9ae8af181b3c'),(22,12,1,'Homepage','homepage','__home__',NULL,1,'2026-01-21 15:58:33','2026-01-21 15:58:33','7e89ad3f-7c1b-4c71-8363-405caf8e2927'),(23,12,2,'Homepage','homepage','__home__',NULL,1,'2026-01-21 15:58:33','2026-01-21 15:58:33','696d2419-7a69-4762-a825-6d63ddd75eb4'),(24,13,1,NULL,NULL,NULL,'{\"2c7837c0-d6c7-4020-98eb-d25a07225f81\": {\"type\": \"url\", \"title\": \"Compra i biglietti\", \"value\": \"https://google.it\"}, \"4017fac0-2898-4409-ad1e-ec6249c689f6\": \"test\", \"6a7056b8-5a93-4e11-b979-ddca12bf63ad\": [10], \"6f85adcd-9983-4bdd-83b4-b40299697ec5\": \"speciale\", \"7f0b6c56-6b6d-468c-8db8-50efb3a4a289\": \"test\", \"8a8999b5-fe5e-4226-9093-65d582264591\": \"test\", \"cb0fb487-6cd3-42cf-acdd-fd5fc50078c1\": \"test\", \"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\": \"test\"}',1,'2026-01-21 15:58:33','2026-01-21 15:58:33','d8604869-8c6f-4c8f-b54d-709a81835bc9'),(25,13,2,NULL,'__temp_jjiaqdirfzcmeorzwkixekzornuvgnbfouxd',NULL,'{\"4017fac0-2898-4409-ad1e-ec6249c689f6\": \"test\", \"6a7056b8-5a93-4e11-b979-ddca12bf63ad\": [10], \"6f85adcd-9983-4bdd-83b4-b40299697ec5\": \"speciale\", \"8a8999b5-fe5e-4226-9093-65d582264591\": \"test\", \"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\": \"test\"}',1,'2026-01-21 15:58:33','2026-01-21 15:58:33','11bf2528-79a8-4ef9-8ac9-3fb53d79a3f8'),(30,16,1,'Homepage','homepage','__home__',NULL,1,'2026-01-22 10:00:07','2026-01-22 10:00:07','5e72739a-3c04-486b-9797-d684b9a39de0'),(31,16,2,'Homepage','homepage','__home__',NULL,1,'2026-01-22 10:00:07','2026-01-22 10:00:07','97622c55-9970-45e8-86e9-404192f5e1a6'),(32,17,1,NULL,NULL,NULL,'{\"2c7837c0-d6c7-4020-98eb-d25a07225f81\": {\"type\": \"url\", \"title\": \"Compra i biglietti\", \"value\": \"https://google.it\", \"target\": \"_blank\"}, \"4017fac0-2898-4409-ad1e-ec6249c689f6\": \"test\", \"6a7056b8-5a93-4e11-b979-ddca12bf63ad\": [10], \"6f85adcd-9983-4bdd-83b4-b40299697ec5\": \"speciale\", \"7f0b6c56-6b6d-468c-8db8-50efb3a4a289\": \"test\", \"8a8999b5-fe5e-4226-9093-65d582264591\": \"test\", \"cb0fb487-6cd3-42cf-acdd-fd5fc50078c1\": \"test\", \"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\": \"test\"}',1,'2026-01-22 10:00:07','2026-01-22 10:00:07','63b3d155-e1d7-469f-9281-01a9bac3afd6'),(33,17,2,NULL,'__temp_jjiaqdirfzcmeorzwkixekzornuvgnbfouxd',NULL,'{\"4017fac0-2898-4409-ad1e-ec6249c689f6\": \"test\", \"6a7056b8-5a93-4e11-b979-ddca12bf63ad\": [10], \"6f85adcd-9983-4bdd-83b4-b40299697ec5\": \"speciale\", \"8a8999b5-fe5e-4226-9093-65d582264591\": \"test\", \"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\": \"test\"}',1,'2026-01-22 10:00:07','2026-01-22 10:00:07','0ec3019e-88a8-44e8-bd91-643ce3e67f14'),(34,18,1,NULL,NULL,NULL,'{\"42119478-8531-4043-b8e4-cb408a6b35eb\": \"21:00\", \"a211aabe-547c-446e-9ab1-7775fd3fa616\": [{\"col1\": \"Lunedì\", \"col3\": \"11:30\", \"col4\": \"22:00\", \"col5\": \"Lunedì 2 e 16 febbraio l’ingresso sarà dalle 14.00\"}, {\"col1\": \"Martedì\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Mercoledì\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Giovedì\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Venerdì\", \"col3\": \"11:30\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Sabato\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Domenica\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}]}',1,'2026-01-22 10:31:18','2026-01-22 10:34:07','00c88f0f-6b0e-468f-abbb-78073c0f3b22'),(35,18,2,NULL,NULL,NULL,'{\"42119478-8531-4043-b8e4-cb408a6b35eb\": \"21:00\", \"a211aabe-547c-446e-9ab1-7775fd3fa616\": [{\"col1\": \"Monday\", \"col3\": \"11:30\", \"col4\": \"22:00\", \"col5\": \"Monday February 2 and 16, entry will be from 2:00 PM\"}, {\"col1\": \"Tuesday\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Wednesday\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Thursday\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Friday\", \"col3\": \"11:30\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Saturday\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}, {\"col1\": \"Sunday\", \"col3\": \"9:00\", \"col4\": \"22:00\", \"col5\": \"\"}]}',1,'2026-01-22 10:31:18','2026-01-22 10:35:36','7d0961b5-b671-49e1-a95d-b8b979145074');
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
  `status` enum('live','pending','expired') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'live',
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
INSERT INTO `entries` VALUES (2,1,NULL,NULL,NULL,2,'2026-01-21 12:13:00',NULL,'live',NULL,NULL,'2026-01-21 12:13:20','2026-01-21 12:13:20'),(3,1,NULL,NULL,NULL,2,'2026-01-21 12:13:00',NULL,'live',NULL,NULL,'2026-01-21 12:13:20','2026-01-21 12:13:20'),(6,1,NULL,NULL,NULL,2,'2026-01-21 12:13:00',NULL,'live',NULL,NULL,'2026-01-21 14:01:27','2026-01-21 14:01:27'),(11,NULL,NULL,2,5,3,'2026-01-21 15:58:00',NULL,'live',NULL,NULL,'2026-01-21 15:58:33','2026-01-21 15:58:33'),(12,1,NULL,NULL,NULL,2,'2026-01-21 12:13:00',NULL,'live',NULL,NULL,'2026-01-21 15:58:33','2026-01-21 15:58:33'),(13,NULL,NULL,12,5,3,'2026-01-21 15:58:00',NULL,'live',NULL,NULL,'2026-01-21 15:58:33','2026-01-21 15:58:33'),(16,1,NULL,NULL,NULL,2,'2026-01-21 12:13:00',NULL,'live',NULL,NULL,'2026-01-22 10:00:07','2026-01-22 10:00:07'),(17,NULL,NULL,16,5,3,'2026-01-21 15:58:00',NULL,'live',NULL,NULL,'2026-01-22 10:00:07','2026-01-22 10:00:07');
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8mb4_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text COLLATE utf8mb4_unicode_ci,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jcxypkohlpsmvptobkcuswunfanwalgqfjxx` (`fieldLayoutId`),
  KEY `idx_eskoceczifnslxvkfzdcrgeczkwymxurhlme` (`dateDeleted`),
  CONSTRAINT `fk_qkivbdnggjeoegoiaqpjncxcvaricpmbtbdk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,'Pagina','pagina',NULL,'file-lines',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2026-01-21 10:24:44','2026-01-21 10:24:44','2026-01-21 14:02:29','4ced0c63-4258-4a86-82c8-474b1efeb74f'),(2,4,'Homepage','homepage',NULL,'house','sky',1,'site',NULL,NULL,1,'site',NULL,1,'2026-01-21 12:13:07','2026-01-21 12:13:07',NULL,'5cdd6615-0e0c-4415-bc3f-302dc52b1104'),(3,5,'Hero','hero',NULL,NULL,NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2026-01-21 13:57:07','2026-01-21 14:13:57',NULL,'5a26f1f1-6170-408e-8b45-bcbf7104e0cb'),(4,7,'Visita','visita',NULL,NULL,NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2026-01-22 11:33:27','2026-01-22 11:33:27',NULL,'595345f1-a17e-4be3-ba5a-8f68332aebb5');
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
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_unrppcuxwsefiqsznjdagaxqdjdmihfdiseo` (`dateDeleted`),
  KEY `idx_birwjtwfujmkhuhcjagkfxvdumgohrbejvbj` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"4e712e07-92fb-4d0c-a7ef-ee31d2784a9b\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"e2454871-e445-4004-8122-a69a35bc5d1b\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-01-16T15:49:33+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-21 10:24:44','2026-01-21 10:24:44','2026-01-21 14:02:29','a55a4b0f-5bae-4ec3-80b2-4d28994730fb'),(2,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"6f6486c1-8a0e-44a5-a6dc-d97d7ad723bb\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"a8236654-4d7f-42c4-ac9b-ec8a89a2c986\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2026-01-21T11:23:56+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-21 11:27:35','2026-01-21 11:27:35',NULL,'6eea3406-ad24-4139-a27f-1a436f338122'),(3,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"b32fee4a-b785-4593-b641-8ec9e2ebd449\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"20300ee1-01c8-40be-ad1e-8bff5b107720\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2026-01-21T11:27:25+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-21 11:28:57','2026-01-21 11:28:57',NULL,'bc79064d-7f81-491a-9d9c-5f526a6ab7e0'),(4,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"8e7da487-67eb-4dea-ba73-e13d550187ef\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"31ff07db-9032-449a-a421-83bdd6c5a652\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-01-21T11:36:15+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"17bd8943-7c32-4e2e-a7ea-7199a5dde208\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"97c36746-feb8-4bc1-8b32-3e3c3259b31b\", \"required\": false, \"dateAdded\": \"2026-01-21T13:59:51+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-21 12:13:07','2026-01-21 13:59:51',NULL,'86ea3328-3d9e-49b3-bebd-48e074338644'),(5,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"8289c216-05e0-4c73-8b21-b168d59c4ed4\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"4017fac0-2898-4409-ad1e-ec6249c689f6\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"aeb11d3b-b8f3-4a5a-b89e-309cead42890\", \"required\": true, \"dateAdded\": \"2026-01-21T14:25:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"8a8999b5-fe5e-4226-9093-65d582264591\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"4033fbd4-5d65-4515-96fd-2b54697b307d\", \"required\": false, \"dateAdded\": \"2026-01-21T14:25:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"46188251-46ab-4519-916a-28b77f5aabbe\", \"required\": true, \"dateAdded\": \"2026-01-21T14:25:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"7f0b6c56-6b6d-468c-8db8-50efb3a4a289\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"e10b9023-318a-4ed3-98ca-c905871af2b4\", \"required\": false, \"dateAdded\": \"2026-01-21T14:25:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"6a7056b8-5a93-4e11-b979-ddca12bf63ad\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"2fbf1bea-4c0f-4faf-b4df-d7c7faf27656\", \"required\": true, \"dateAdded\": \"2026-01-21T14:25:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"6f85adcd-9983-4bdd-83b4-b40299697ec5\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ff59314d-d88c-469c-bb11-d18989180be0\", \"required\": false, \"dateAdded\": \"2026-01-21T15:47:11+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"cb0fb487-6cd3-42cf-acdd-fd5fc50078c1\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"de834319-7a42-478c-9f63-192de7436f20\", \"required\": false, \"dateAdded\": \"2026-01-21T15:47:11+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"2c7837c0-d6c7-4020-98eb-d25a07225f81\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7a220bd6-7d45-4cd3-9d88-7f3e583ed063\", \"required\": false, \"dateAdded\": \"2026-01-21T15:47:11+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"a39fbbec-1e9a-4b67-9a20-c8614b1a58bf\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Titolo\", \"width\": 100, \"handle\": \"titolo\", \"warning\": null, \"fieldUid\": \"61bded43-ec93-419c-a052-66062d3b33a5\", \"required\": true, \"dateAdded\": \"2026-01-21T13:57:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [\"layoutElement:4017fac0-2898-4409-ad1e-ec6249c689f6\", \"layoutElement:8a8999b5-fe5e-4226-9093-65d582264591\", \"layoutElement:d4c1a906-0f18-4a89-9e5a-507ca13c89ff\", \"layoutElement:7f0b6c56-6b6d-468c-8db8-50efb3a4a289\"], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-21 13:57:07','2026-01-21 15:47:11',NULL,'fdfed2e9-5260-4498-af0a-959d7357dbd7'),(6,'craft\\elements\\GlobalSet','{\"tabs\": [{\"uid\": \"643c166d-8a1d-4a15-95f0-612955c5f587\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"a211aabe-547c-446e-9ab1-7775fd3fa616\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"0e998ccf-b819-41f0-88c2-01bfa99e19e2\", \"required\": false, \"dateAdded\": \"2026-01-22T10:31:17+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"42119478-8531-4043-b8e4-cb408a6b35eb\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"3673fc41-a579-4121-81bd-d598f59eca0a\", \"required\": false, \"dateAdded\": \"2026-01-22T10:31:17+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-22 10:31:18','2026-01-22 10:31:18',NULL,'1059e71f-e91e-4765-895c-3ce6871615f0'),(7,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"63e947e7-0dc1-43e2-9dd7-66f8eacc8bec\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"d69862f2-0a28-456d-8a2d-d4bd68742237\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Titolo\", \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"aeb11d3b-b8f3-4a5a-b89e-309cead42890\", \"required\": true, \"dateAdded\": \"2026-01-22T11:33:27+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": true, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"bf8b14fd-f17b-49b0-9f54-2c1de26ac35b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"46188251-46ab-4519-916a-28b77f5aabbe\", \"required\": true, \"dateAdded\": \"2026-01-22T11:33:27+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-01-22 11:33:27','2026-01-22 11:33:27',NULL,'86d80399-4779-43f4-8d37-90f469bd72f4');
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
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uanslissgberysyqzpcpizcnflvtemuasryl` (`handle`,`context`),
  KEY `idx_kpqsugpnaksfztxamrqggunghtszgpvblrxy` (`context`),
  KEY `idx_acraoafscsgobarntlbtckrdnnnshehuhntx` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,'Seo Title','seoTitle','global',NULL,NULL,0,'site',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":60,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-01-21 12:41:20','2026-01-21 12:41:20',NULL,'85867d07-76c5-49c6-b699-3f42a9ad4cc8'),(2,'Seo Description','seoDescription','global',NULL,NULL,0,'site',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":160,\"code\":false,\"initialRows\":4,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-01-21 12:42:25','2026-01-21 12:42:25',NULL,'3e7c6349-ae7b-4066-bcb6-380ea09b4f86'),(3,'Seo Image','seoImage','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSearchInput\":true,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2026-01-21 12:48:25','2026-01-21 12:48:25',NULL,'68308c87-e785-41d2-b15b-58aefafa2c8f'),(4,'Titolo2','title2','global',NULL,NULL,0,'site',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-01-21 13:47:22','2026-01-21 13:47:22','2026-01-21 14:14:30','61bded43-ec93-419c-a052-66062d3b33a5'),(5,'Blocchi','blocchi','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"5a26f1f1-6170-408e-8b45-bcbf7104e0cb\",\"group\":\"General\"},{\"uid\":\"595345f1-a17e-4be3-ba5a-8f68332aebb5\",\"group\":\"General\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":50,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"cards\"}','2026-01-21 13:57:26','2026-01-22 11:33:41',NULL,'97c36746-feb8-4bc1-8b32-3e3c3259b31b'),(6,'Titolo Seconda Riga','titoloRiga2','global',NULL,NULL,0,'site',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-01-21 14:16:29','2026-01-21 14:16:29',NULL,'4033fbd4-5d65-4515-96fd-2b54697b307d'),(7,'Titolo Prima Riga','titolo','global',NULL,NULL,0,'site',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-01-21 14:21:48','2026-01-21 14:21:48',NULL,'aeb11d3b-b8f3-4a5a-b89e-309cead42890'),(8,'Sottotitolo','sottotitolo','global',NULL,NULL,0,'site',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-01-21 14:22:30','2026-01-21 14:22:30',NULL,'46188251-46ab-4519-916a-28b77f5aabbe'),(9,'Sottotitolo Seconda Riga','sottotitoloRiga2','global',NULL,NULL,0,'site',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-01-21 14:23:02','2026-01-21 14:23:02',NULL,'e10b9023-318a-4ed3-98ca-c905871af2b4'),(10,'Video Background','video','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:c0c8eabb-1d94-449c-b621-1252e3e75ea4\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSearchInput\":true,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2026-01-21 14:24:17','2026-01-21 14:24:17',NULL,'2fbf1bea-4c0f-4faf-b4df-d7c7faf27656'),(11,'Icona Avviso Manutenzione','iconaAvvisoManutenzione','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"customOptions\":false,\"options\":[{\"label\":\"speciale\",\"value\":\"speciale\",\"icon\":\"\",\"color\":\"\",\"default\":\"1\"},{\"label\":\"orologio\",\"value\":\"orologio\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"ticket\",\"value\":\"ticket\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"attenzione\",\"value\":\"attenzione\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"divieto\",\"value\":\"divieto\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"}]}','2026-01-21 15:41:04','2026-01-21 15:41:04',NULL,'ff59314d-d88c-469c-bb11-d18989180be0'),(12,'Testo Avviso Manutenzione','testoAvvisoManutenzione','global',NULL,NULL,0,'site',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-01-21 15:41:55','2026-01-21 15:41:55',NULL,'de834319-7a42-478c-9f63-192de7436f20'),(13,'Link CTA','linkCta','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Link','{\"advancedFields\":[\"target\",\"title\",\"ariaLabel\",\"download\"],\"fullGraphqlData\":true,\"maxLength\":255,\"showLabelField\":false,\"typeSettings\":{\"asset\":{\"sources\":\"*\",\"allowedKinds\":\"*\",\"showUnpermittedVolumes\":\"\",\"showUnpermittedFiles\":\"\"},\"entry\":{\"sources\":\"*\",\"showUnpermittedSections\":\"\",\"showUnpermittedEntries\":\"\"},\"url\":{\"allowRootRelativeUrls\":\"\",\"allowAnchors\":\"\",\"allowCustomSchemes\":\"\"}},\"types\":[\"url\",\"entry\",\"asset\",\"category\",\"email\",\"tel\",\"sms\"]}','2026-01-21 15:44:32','2026-01-21 15:45:12',NULL,'7a220bd6-7d45-4cd3-9d88-7f3e583ed063'),(14,'Orari','orari','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"columns\":{\"col1\":{\"heading\":\"Giorno\",\"handle\":\"giorno\",\"width\":\"\",\"type\":\"singleline\"},\"col3\":{\"heading\":\"Apertura\",\"handle\":\"apertura\",\"width\":\"\",\"type\":\"singleline\"},\"col4\":{\"heading\":\"Chiusura\",\"handle\":\"chiusura\",\"width\":\"\",\"type\":\"singleline\"},\"col5\":{\"heading\":\"Eccezione\",\"handle\":\"eccezione\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":null,\"maxRows\":7,\"minRows\":7,\"staticRows\":false}','2026-01-22 10:26:04','2026-01-22 10:26:46',NULL,'0e998ccf-b819-41f0-88c2-01bfa99e19e2'),(15,'Orario Ultimo Ingresso','orarioUltimoIngresso','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":\"21:00\",\"uiMode\":\"normal\"}','2026-01-22 10:29:30','2026-01-22 10:29:30',NULL,'3673fc41-a579-4121-81bd-d598f59eca0a');
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[\"sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5:read\", \"sites.b2c3d4e5-f678-90ab-cdef-123456789012:read\", \"elements.drafts:read\", \"elements.revisions:read\", \"elements.inactive:read\", \"sections.45952d02-8da9-45dc-81df-be4fea47ce47:read\", \"nestedentryfields.97c36746-feb8-4bc1-8b32-3e3c3259b31b:read\", \"volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4:read\", \"volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4:read\", \"globalsets.85074937-dff7-4c16-9d2c-0c76875fea4a:read\"]',1,'2026-01-21 10:24:44','2026-01-22 10:50:09','fd6020f8-2e21-4f1d-af40-1c74e81c3000');
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
INSERT INTO `gqltokens` VALUES (1,'Public Token','__PUBLIC__',1,NULL,'2026-01-22 14:36:51',NULL,'2026-01-21 16:02:41','2026-01-22 14:36:51','f83c7305-7d16-4c26-9157-825ea2535eae');
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
  `transformer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transformString` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nofujpoxnihksrnrvwqzgrsuphngoehtfjoz` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransformindex`
--

LOCK TABLES `imagetransformindex` WRITE;
/*!40000 ALTER TABLE `imagetransformindex` DISABLE KEYS */;
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `fill` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'5.8.23','5.8.0.3',0,'gqfnesjqduxf','3@ezpsenckfx','2026-01-21 10:24:43','2026-01-22 11:43:01','5d8b9f54-85c0-4f7e-8827-367d127b314b');
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
  `track` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qubfgffyjhjkyakamjphgfnbsygoxkcrjmig` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','23401a1d-3970-4b70-8479-6bd82de1f474'),(2,'craft','m221101_115859_create_entries_authors_table','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','0aca7cfe-5df5-4053-a350-46ba52a316fb'),(3,'craft','m221107_112121_add_max_authors_to_sections','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','44e58caf-289a-423b-b890-d8f29406e57e'),(4,'craft','m221205_082005_translatable_asset_alt_text','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','c02ae176-07df-4aa9-a163-6784e1768f9f'),(5,'craft','m230314_110309_add_authenticator_table','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','342d8c95-fecc-4670-b4ad-20a1aefb47f0'),(6,'craft','m230314_111234_add_webauthn_table','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','848bbc36-ef64-4fa5-b511-aedb3db0c8b3'),(7,'craft','m230503_120303_add_recoverycodes_table','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','8069a907-ef86-4b44-958b-44b6ab91cd6d'),(8,'craft','m230511_000000_field_layout_configs','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','d23b47c7-38d2-4ce9-b76b-e01b09ec87fb'),(9,'craft','m230511_215903_content_refactor','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','13e2b3a7-9c0d-44dc-932c-6dd9a29bc285'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','4b5494e8-524a-4bc2-91a8-ac770db818e1'),(11,'craft','m230524_000001_entry_type_icons','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','0be37402-1cc3-4aae-bfd1-5ca76c0a5638'),(12,'craft','m230524_000002_entry_type_colors','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','5a9b3aeb-c059-49a8-bbfd-94472849f149'),(13,'craft','m230524_220029_global_entry_types','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','cc0b5cbb-1bd5-413a-a15a-aefae010f09d'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','efa48b8f-4dc5-4f45-96a5-3e7ffbacc9e0'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','95e92199-f458-4e4a-97c7-9acb1f06834c'),(16,'craft','m230616_173810_kill_field_groups','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','8ba092a6-d34e-4ba8-8c4a-a0fe543e0c34'),(17,'craft','m230616_183820_remove_field_name_limit','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','e897744d-f490-4eb8-bcaa-f0120f28cbb7'),(18,'craft','m230617_070415_entrify_matrix_blocks','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','3f797b1d-9751-4cdf-a069-eb9a92e21c04'),(19,'craft','m230710_162700_element_activity','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','ad38462c-bec2-453b-956a-b5948fe3b8f7'),(20,'craft','m230820_162023_fix_cache_id_type','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','746fdbce-da8f-45c5-96ce-c4de227a3446'),(21,'craft','m230826_094050_fix_session_id_type','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','57c1fb8d-1de9-462d-9d11-73a0cdc4ba8c'),(22,'craft','m230904_190356_address_fields','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','00b0318d-457a-44d8-9efa-65fe485b0047'),(23,'craft','m230928_144045_add_subpath_to_volumes','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','3cec4407-af68-4cba-94e9-810585760b93'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','b9534c7d-e1af-454b-abe2-8d497f9f1024'),(25,'craft','m231213_030600_element_bulk_ops','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','abb21147-8a50-49ce-a775-6e986fee28cf'),(26,'craft','m240129_150719_sites_language_amend_length','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','b0277b59-12b6-45b8-8fe7-500f7e0db798'),(27,'craft','m240206_035135_convert_json_columns','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','78a953d3-c19a-49ec-900a-4f48a2b5343c'),(28,'craft','m240207_182452_address_line_3','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','f7983d29-4ae0-4f9b-8500-4952dd8b891b'),(29,'craft','m240302_212719_solo_preview_targets','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','53a90e8d-5d3b-475d-8184-8f2d6448f450'),(30,'craft','m240619_091352_add_auth_2fa_timestamp','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','29a46ba8-0b27-4dbb-8577-a5b7186d21f1'),(31,'craft','m240723_214330_drop_bulkop_fk','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','6e90aa3f-34b1-49db-a89e-404aa4436182'),(32,'craft','m240731_053543_soft_delete_fields','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','b79536ed-f206-4987-8906-f9a038ec1f0e'),(33,'craft','m240805_154041_sso_identities','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','e5ef907a-c269-4b69-8bd6-5fad04110c01'),(34,'craft','m240926_202248_track_entries_deleted_with_section','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','0967e7d1-2e53-4e52-afbe-0c8cd910c8b0'),(35,'craft','m241120_190905_user_affiliated_sites','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','aa351eb8-497b-43ab-ab6d-f9c14708ed00'),(36,'craft','m241125_122914_add_viewUsers_permission','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','0a21a145-9572-4322-aea2-85a137fd561d'),(37,'craft','m250119_135304_entry_type_overrides','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','f46bba7d-58d1-4544-9aa7-caf385a4d683'),(38,'craft','m250206_135036_search_index_queue','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','c9a63b3b-ffb7-4cc2-b2ea-b979c5ce5304'),(39,'craft','m250207_172349_bulkop_events','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','d1257bdb-b659-4e9c-b9b3-ab912ec9201a'),(40,'craft','m250315_131608_unlimited_authors','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','062a8698-6fb7-464d-b87d-573e47b434e1'),(41,'craft','m250403_171253_static_statuses','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','67fe55a2-6beb-4c5a-abbc-80de3a65db6a'),(42,'craft','m250512_164202_asset_mime_types','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','2b3b2d98-d6f9-4a4f-aa79-6a601054bc10'),(43,'craft','m250522_090843_add_deleteEntriesForSite_and_deletePeerEntriesForSite_permissions','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','38b5483e-e926-4a84-a007-54c1881ddec0'),(44,'craft','m250531_183058_content_blocks','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','9fd551ea-18c4-45b5-9c64-8a48c7f3ba20'),(45,'craft','m250623_105031_entry_type_descriptions','2026-01-21 10:24:45','2026-01-21 10:24:45','2026-01-21 10:24:45','879ce41c-551e-4636-a784-e3ca0b1137b5');
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
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kcjpjeojijfxnjamdztzyflsggwhymuqmwhw` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('dateModified','1769081621'),('email.fromEmail','\"andrea@semplice.is\"'),('email.fromName','\"fonta-trevi\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.color','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.description','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.cardThumbAlignment','\"end\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elementCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.dateAdded','\"2026-01-22T11:33:27+00:00\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.editCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.elementCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.fieldUid','\"aeb11d3b-b8f3-4a5a-b89e-309cead42890\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.handle','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.includeInCards','true'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.instructions','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.label','\"Titolo\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.providesThumbs','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.required','true'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.tip','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.uid','\"d69862f2-0a28-456d-8a2d-d4bd68742237\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.userCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.warning','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.0.width','100'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.dateAdded','\"2026-01-22T11:33:27+00:00\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.editCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.elementCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.fieldUid','\"46188251-46ab-4519-916a-28b77f5aabbe\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.handle','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.includeInCards','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.instructions','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.label','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.providesThumbs','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.required','true'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.tip','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.uid','\"bf8b14fd-f17b-49b0-9f54-2c1de26ac35b\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.userCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.warning','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.elements.1.width','100'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.name','\"Content\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.uid','\"63e947e7-0dc1-43e2-9dd7-66f8eacc8bec\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.fieldLayouts.86d80399-4779-43f4-8d37-90f469bd72f4.tabs.0.userCondition','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.handle','\"visita\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.hasTitleField','false'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.icon','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.name','\"Visita\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.showSlugField','true'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.showStatusField','true'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.slugTranslationKeyFormat','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.slugTranslationMethod','\"site\"'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.titleFormat','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.titleTranslationKeyFormat','null'),('entryTypes.595345f1-a17e-4be3-ba5a-8f68332aebb5.titleTranslationMethod','\"site\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.color','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.description','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.cardThumbAlignment','\"end\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.cardView.0','\"layoutElement:4017fac0-2898-4409-ad1e-ec6249c689f6\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.cardView.1','\"layoutElement:8a8999b5-fe5e-4226-9093-65d582264591\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.cardView.2','\"layoutElement:d4c1a906-0f18-4a89-9e5a-507ca13c89ff\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.cardView.3','\"layoutElement:7f0b6c56-6b6d-468c-8db8-50efb3a4a289\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.dateAdded','\"2026-01-21T14:25:31+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.fieldUid','\"aeb11d3b-b8f3-4a5a-b89e-309cead42890\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.handle','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.includeInCards','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.label','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.required','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.uid','\"4017fac0-2898-4409-ad1e-ec6249c689f6\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.0.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.dateAdded','\"2026-01-21T14:25:31+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.fieldUid','\"4033fbd4-5d65-4515-96fd-2b54697b307d\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.handle','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.includeInCards','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.label','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.required','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.uid','\"8a8999b5-fe5e-4226-9093-65d582264591\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.1.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.dateAdded','\"2026-01-21T14:25:31+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.fieldUid','\"46188251-46ab-4519-916a-28b77f5aabbe\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.handle','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.includeInCards','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.label','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.required','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.uid','\"d4c1a906-0f18-4a89-9e5a-507ca13c89ff\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.2.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.dateAdded','\"2026-01-21T14:25:31+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.fieldUid','\"e10b9023-318a-4ed3-98ca-c905871af2b4\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.handle','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.includeInCards','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.label','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.required','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.uid','\"7f0b6c56-6b6d-468c-8db8-50efb3a4a289\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.3.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.dateAdded','\"2026-01-21T14:25:31+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.fieldUid','\"2fbf1bea-4c0f-4faf-b4df-d7c7faf27656\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.handle','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.includeInCards','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.label','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.required','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.uid','\"6a7056b8-5a93-4e11-b979-ddca12bf63ad\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.4.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.dateAdded','\"2026-01-21T15:47:11+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.fieldUid','\"ff59314d-d88c-469c-bb11-d18989180be0\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.handle','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.includeInCards','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.label','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.required','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.uid','\"6f85adcd-9983-4bdd-83b4-b40299697ec5\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.5.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.dateAdded','\"2026-01-21T15:47:11+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.fieldUid','\"de834319-7a42-478c-9f63-192de7436f20\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.handle','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.includeInCards','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.label','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.required','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.uid','\"cb0fb487-6cd3-42cf-acdd-fd5fc50078c1\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.6.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.dateAdded','\"2026-01-21T15:47:11+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.fieldUid','\"7a220bd6-7d45-4cd3-9d88-7f3e583ed063\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.handle','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.includeInCards','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.label','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.required','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.uid','\"2c7837c0-d6c7-4020-98eb-d25a07225f81\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.7.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.dateAdded','\"2026-01-21T13:57:06+00:00\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.editCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.elementCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.fieldUid','\"61bded43-ec93-419c-a052-66062d3b33a5\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.handle','\"titolo\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.includeInCards','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.instructions','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.label','\"Titolo\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.providesThumbs','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.required','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.tip','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.uid','\"a39fbbec-1e9a-4b67-9a20-c8614b1a58bf\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.warning','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.elements.8.width','100'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.name','\"Content\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.uid','\"8289c216-05e0-4c73-8b21-b168d59c4ed4\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.fieldLayouts.fdfed2e9-5260-4498-af0a-959d7357dbd7.tabs.0.userCondition','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.handle','\"hero\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.hasTitleField','false'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.icon','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.name','\"Hero\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.showSlugField','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.showStatusField','true'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.slugTranslationKeyFormat','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.slugTranslationMethod','\"site\"'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.titleFormat','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.titleTranslationKeyFormat','null'),('entryTypes.5a26f1f1-6170-408e-8b45-bcbf7104e0cb.titleTranslationMethod','\"site\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.color','\"sky\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.description','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.cardThumbAlignment','\"end\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elementCondition','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.autocapitalize','true'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.autocomplete','false'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.autocorrect','true'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.class','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.dateAdded','\"2026-01-21T11:36:15+00:00\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.disabled','false'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.elementCondition','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.id','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.includeInCards','false'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.inputType','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.instructions','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.label','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.max','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.min','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.name','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.orientation','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.placeholder','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.providesThumbs','false'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.readonly','false'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.required','true'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.size','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.step','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.tip','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.title','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.uid','\"31ff07db-9032-449a-a421-83bdd6c5a652\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.userCondition','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.warning','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.0.width','100'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.dateAdded','\"2026-01-21T13:59:51+00:00\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.editCondition','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.elementCondition','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.fieldUid','\"97c36746-feb8-4bc1-8b32-3e3c3259b31b\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.handle','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.includeInCards','false'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.instructions','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.label','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.providesThumbs','false'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.required','false'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.tip','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.uid','\"17bd8943-7c32-4e2e-a7ea-7199a5dde208\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.userCondition','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.warning','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.elements.1.width','100'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.name','\"Content\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.uid','\"8e7da487-67eb-4dea-ba73-e13d550187ef\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.fieldLayouts.86ea3328-3d9e-49b3-bebd-48e074338644.tabs.0.userCondition','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.handle','\"homepage\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.hasTitleField','true'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.icon','\"house\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.name','\"Homepage\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.showSlugField','true'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.showStatusField','true'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.slugTranslationKeyFormat','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.slugTranslationMethod','\"site\"'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.titleFormat','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.titleTranslationKeyFormat','null'),('entryTypes.5cdd6615-0e0c-4415-bc3f-302dc52b1104.titleTranslationMethod','\"site\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.columnSuffix','null'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.handle','\"orari\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.instructions','null'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.name','\"Orari\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.searchable','false'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.addRowLabel','\"Add a row\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.0','\"col1\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Giorno\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.1.__assoc__.1.1','\"giorno\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.0','\"col3\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.1.__assoc__.0.0','\"heading\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.1.__assoc__.0.1','\"Apertura\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.1.__assoc__.1.0','\"handle\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.1.__assoc__.1.1','\"apertura\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.1.__assoc__.2.0','\"width\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.1.__assoc__.2.1','\"\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.1.__assoc__.3.0','\"type\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.1.1.__assoc__.3.1','\"singleline\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.0','\"col4\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.1.__assoc__.0.0','\"heading\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.1.__assoc__.0.1','\"Chiusura\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.1.__assoc__.1.0','\"handle\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.1.__assoc__.1.1','\"chiusura\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.1.__assoc__.2.0','\"width\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.1.__assoc__.2.1','\"\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.1.__assoc__.3.0','\"type\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.2.1.__assoc__.3.1','\"singleline\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.0','\"col5\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.1.__assoc__.0.0','\"heading\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.1.__assoc__.0.1','\"Eccezione\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.1.__assoc__.1.0','\"handle\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.1.__assoc__.1.1','\"eccezione\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.1.__assoc__.2.0','\"width\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.1.__assoc__.2.1','\"\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.1.__assoc__.3.0','\"type\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.columns.__assoc__.3.1.__assoc__.3.1','\"singleline\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.defaults','null'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.maxRows','7'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.minRows','7'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.settings.staticRows','false'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.translationKeyFormat','null'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.translationMethod','\"site\"'),('fields.0e998ccf-b819-41f0-88c2-01bfa99e19e2.type','\"craft\\\\fields\\\\Table\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.columnSuffix','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.handle','\"video\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.instructions','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.name','\"Video Background\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.searchable','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.allowedKinds','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.allowSelfRelations','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.allowSubfolders','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.allowUploads','true'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.branchLimit','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.defaultPlacement','\"end\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.defaultUploadLocationSource','\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.defaultUploadLocationSubpath','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.maintainHierarchy','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.maxRelations','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.minRelations','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.previewMode','\"full\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.restrictedDefaultUploadSubpath','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.restrictedLocationSource','\"volume:c0c8eabb-1d94-449c-b621-1252e3e75ea4\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.restrictedLocationSubpath','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.restrictFiles','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.restrictLocation','true'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.selectionLabel','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.showCardsInGrid','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.showSearchInput','true'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.showSiteMenu','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.showUnpermittedFiles','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.showUnpermittedVolumes','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.sources','\"*\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.targetSiteId','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.validateRelatedElements','false'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.settings.viewMode','\"list\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.translationKeyFormat','null'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.translationMethod','\"none\"'),('fields.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656.type','\"craft\\\\fields\\\\Assets\"'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.columnSuffix','null'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.handle','\"orarioUltimoIngresso\"'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.instructions','null'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.name','\"Orario Ultimo Ingresso\"'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.searchable','false'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.settings.byteLimit','null'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.settings.charLimit','null'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.settings.code','false'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.settings.initialRows','4'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.settings.multiline','false'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.settings.placeholder','\"21:00\"'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.settings.uiMode','\"normal\"'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.translationKeyFormat','null'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.translationMethod','\"none\"'),('fields.3673fc41-a579-4121-81bd-d598f59eca0a.type','\"craft\\\\fields\\\\PlainText\"'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.columnSuffix','null'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.handle','\"seoDescription\"'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.instructions','null'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.name','\"Seo Description\"'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.searchable','false'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.settings.byteLimit','null'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.settings.charLimit','160'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.settings.code','false'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.settings.initialRows','4'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.settings.multiline','true'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.settings.placeholder','null'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.settings.uiMode','\"normal\"'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.translationKeyFormat','null'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.translationMethod','\"site\"'),('fields.3e7c6349-ae7b-4066-bcb6-380ea09b4f86.type','\"craft\\\\fields\\\\PlainText\"'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.columnSuffix','null'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.handle','\"titoloRiga2\"'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.instructions','null'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.name','\"Titolo Seconda Riga\"'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.searchable','false'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.settings.byteLimit','null'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.settings.charLimit','null'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.settings.code','false'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.settings.initialRows','4'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.settings.multiline','false'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.settings.placeholder','null'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.settings.uiMode','\"normal\"'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.translationKeyFormat','null'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.translationMethod','\"site\"'),('fields.4033fbd4-5d65-4515-96fd-2b54697b307d.type','\"craft\\\\fields\\\\PlainText\"'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.columnSuffix','null'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.handle','\"sottotitolo\"'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.instructions','null'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.name','\"Sottotitolo\"'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.searchable','false'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.settings.byteLimit','null'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.settings.charLimit','null'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.settings.code','false'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.settings.initialRows','4'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.settings.multiline','false'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.settings.placeholder','null'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.settings.uiMode','\"normal\"'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.translationKeyFormat','null'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.translationMethod','\"site\"'),('fields.46188251-46ab-4519-916a-28b77f5aabbe.type','\"craft\\\\fields\\\\PlainText\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.columnSuffix','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.handle','\"seoImage\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.instructions','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.name','\"Seo Image\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.searchable','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.allowedKinds','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.allowSelfRelations','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.allowSubfolders','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.allowUploads','true'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.branchLimit','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.defaultPlacement','\"end\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.defaultUploadLocationSource','\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.defaultUploadLocationSubpath','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.maintainHierarchy','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.maxRelations','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.minRelations','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.previewMode','\"full\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.restrictedDefaultUploadSubpath','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.restrictedLocationSource','\"volume:f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.restrictedLocationSubpath','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.restrictFiles','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.restrictLocation','true'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.selectionLabel','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.showCardsInGrid','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.showSearchInput','true'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.showSiteMenu','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.showUnpermittedFiles','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.showUnpermittedVolumes','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.sources','\"*\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.targetSiteId','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.validateRelatedElements','false'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.settings.viewMode','\"list\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.translationKeyFormat','null'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.translationMethod','\"none\"'),('fields.68308c87-e785-41d2-b15b-58aefafa2c8f.type','\"craft\\\\fields\\\\Assets\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.columnSuffix','null'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.handle','\"linkCta\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.instructions','null'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.name','\"Link CTA\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.searchable','false'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.advancedFields.0','\"target\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.advancedFields.1','\"title\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.advancedFields.2','\"ariaLabel\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.advancedFields.3','\"download\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.fullGraphqlData','true'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.maxLength','255'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.showLabelField','false'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.types.0','\"url\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.types.1','\"entry\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.types.2','\"asset\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.types.3','\"category\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.types.4','\"email\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.types.5','\"tel\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.types.6','\"sms\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.0','\"asset\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.1.__assoc__.0.0','\"sources\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.1.__assoc__.0.1','\"*\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.1.__assoc__.1.0','\"allowedKinds\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.1.__assoc__.1.1','\"*\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.1.__assoc__.2.0','\"showUnpermittedVolumes\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.1.__assoc__.2.1','\"\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.1.__assoc__.3.0','\"showUnpermittedFiles\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.0.1.__assoc__.3.1','\"\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.1.0','\"entry\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.1.1.__assoc__.0.0','\"sources\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.1.1.__assoc__.0.1','\"*\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.1.1.__assoc__.1.0','\"showUnpermittedSections\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.1.1.__assoc__.1.1','\"\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.1.1.__assoc__.2.0','\"showUnpermittedEntries\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.1.1.__assoc__.2.1','\"\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.2.0','\"url\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.2.1.__assoc__.0.0','\"allowRootRelativeUrls\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.2.1.__assoc__.0.1','\"\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.2.1.__assoc__.1.0','\"allowAnchors\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.2.1.__assoc__.1.1','\"\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.2.1.__assoc__.2.0','\"allowCustomSchemes\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.settings.typeSettings.__assoc__.2.1.__assoc__.2.1','\"\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.translationKeyFormat','null'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.translationMethod','\"site\"'),('fields.7a220bd6-7d45-4cd3-9d88-7f3e583ed063.type','\"craft\\\\fields\\\\Link\"'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.columnSuffix','null'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.handle','\"seoTitle\"'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.instructions','null'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.name','\"Seo Title\"'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.searchable','false'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.settings.byteLimit','null'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.settings.charLimit','60'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.settings.code','false'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.settings.initialRows','4'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.settings.multiline','false'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.settings.placeholder','null'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.settings.uiMode','\"normal\"'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.translationKeyFormat','null'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.translationMethod','\"site\"'),('fields.85867d07-76c5-49c6-b699-3f42a9ad4cc8.type','\"craft\\\\fields\\\\PlainText\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.columnSuffix','null'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.handle','\"blocchi\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.instructions','null'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.name','\"Blocchi\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.searchable','false'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.createButtonLabel','null'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.defaultIndexViewMode','\"cards\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.enableVersioning','false'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.0.__assoc__.0.1','\"5a26f1f1-6170-408e-8b45-bcbf7104e0cb\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.0.__assoc__.1.0','\"group\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.0.__assoc__.1.1','\"General\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.1.__assoc__.0.0','\"uid\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.1.__assoc__.0.1','\"595345f1-a17e-4be3-ba5a-8f68332aebb5\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.1.__assoc__.1.0','\"group\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.entryTypes.1.__assoc__.1.1','\"General\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.includeTableView','false'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.maxEntries','null'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.minEntries','null'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.pageSize','50'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.propagationKeyFormat','null'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.propagationMethod','\"all\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.showCardsInGrid','false'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.settings.viewMode','\"cards\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.translationKeyFormat','null'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.translationMethod','\"site\"'),('fields.97c36746-feb8-4bc1-8b32-3e3c3259b31b.type','\"craft\\\\fields\\\\Matrix\"'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.columnSuffix','null'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.handle','\"titolo\"'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.instructions','null'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.name','\"Titolo Prima Riga\"'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.searchable','false'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.settings.byteLimit','null'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.settings.charLimit','null'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.settings.code','false'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.settings.initialRows','4'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.settings.multiline','false'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.settings.placeholder','null'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.settings.uiMode','\"normal\"'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.translationKeyFormat','null'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.translationMethod','\"site\"'),('fields.aeb11d3b-b8f3-4a5a-b89e-309cead42890.type','\"craft\\\\fields\\\\PlainText\"'),('fields.de834319-7a42-478c-9f63-192de7436f20.columnSuffix','null'),('fields.de834319-7a42-478c-9f63-192de7436f20.handle','\"testoAvvisoManutenzione\"'),('fields.de834319-7a42-478c-9f63-192de7436f20.instructions','null'),('fields.de834319-7a42-478c-9f63-192de7436f20.name','\"Testo Avviso Manutenzione\"'),('fields.de834319-7a42-478c-9f63-192de7436f20.searchable','false'),('fields.de834319-7a42-478c-9f63-192de7436f20.settings.byteLimit','null'),('fields.de834319-7a42-478c-9f63-192de7436f20.settings.charLimit','null'),('fields.de834319-7a42-478c-9f63-192de7436f20.settings.code','false'),('fields.de834319-7a42-478c-9f63-192de7436f20.settings.initialRows','4'),('fields.de834319-7a42-478c-9f63-192de7436f20.settings.multiline','false'),('fields.de834319-7a42-478c-9f63-192de7436f20.settings.placeholder','null'),('fields.de834319-7a42-478c-9f63-192de7436f20.settings.uiMode','\"normal\"'),('fields.de834319-7a42-478c-9f63-192de7436f20.translationKeyFormat','null'),('fields.de834319-7a42-478c-9f63-192de7436f20.translationMethod','\"site\"'),('fields.de834319-7a42-478c-9f63-192de7436f20.type','\"craft\\\\fields\\\\PlainText\"'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.columnSuffix','null'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.handle','\"sottotitoloRiga2\"'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.instructions','null'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.name','\"Sottotitolo Seconda Riga\"'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.searchable','false'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.settings.byteLimit','null'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.settings.charLimit','null'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.settings.code','false'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.settings.initialRows','4'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.settings.multiline','false'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.settings.placeholder','null'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.settings.uiMode','\"normal\"'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.translationKeyFormat','null'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.translationMethod','\"site\"'),('fields.e10b9023-318a-4ed3-98ca-c905871af2b4.type','\"craft\\\\fields\\\\PlainText\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.columnSuffix','null'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.handle','\"iconaAvvisoManutenzione\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.instructions','null'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.name','\"Icona Avviso Manutenzione\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.searchable','false'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.customOptions','false'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.0.0','\"label\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.0.1','\"speciale\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.1.0','\"value\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.1.1','\"speciale\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.2.0','\"icon\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.2.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.3.0','\"color\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.3.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.4.0','\"default\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.0.__assoc__.4.1','\"1\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.0.0','\"label\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.0.1','\"orologio\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.1.0','\"value\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.1.1','\"orologio\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.2.0','\"icon\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.2.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.3.0','\"color\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.3.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.4.0','\"default\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.1.__assoc__.4.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.0.0','\"label\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.0.1','\"ticket\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.1.0','\"value\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.1.1','\"ticket\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.2.0','\"icon\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.2.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.3.0','\"color\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.3.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.4.0','\"default\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.2.__assoc__.4.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.0.0','\"label\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.0.1','\"attenzione\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.1.0','\"value\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.1.1','\"attenzione\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.2.0','\"icon\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.2.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.3.0','\"color\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.3.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.4.0','\"default\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.3.__assoc__.4.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.0.0','\"label\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.0.1','\"divieto\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.1.0','\"value\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.1.1','\"divieto\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.2.0','\"icon\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.2.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.3.0','\"color\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.3.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.4.0','\"default\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.settings.options.4.__assoc__.4.1','\"\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.translationKeyFormat','null'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.translationMethod','\"none\"'),('fields.ff59314d-d88c-469c-bb11-d18989180be0.type','\"craft\\\\fields\\\\Dropdown\"'),('fs.uploads.hasUrls','true'),('fs.uploads.name','\"Uploads\"'),('fs.uploads.settings.path','\"@webroot/uploads\"'),('fs.uploads.type','\"craft\\\\fs\\\\Local\"'),('fs.uploads.url','\"@web/uploads\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.cardThumbAlignment','\"end\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elementCondition','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.dateAdded','\"2026-01-22T10:31:17+00:00\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.editCondition','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.elementCondition','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.fieldUid','\"0e998ccf-b819-41f0-88c2-01bfa99e19e2\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.handle','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.includeInCards','false'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.instructions','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.label','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.providesThumbs','false'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.required','false'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.tip','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.uid','\"a211aabe-547c-446e-9ab1-7775fd3fa616\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.userCondition','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.warning','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.0.width','100'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.dateAdded','\"2026-01-22T10:31:17+00:00\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.editCondition','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.elementCondition','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.fieldUid','\"3673fc41-a579-4121-81bd-d598f59eca0a\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.handle','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.includeInCards','false'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.instructions','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.label','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.providesThumbs','false'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.required','false'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.tip','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.uid','\"42119478-8531-4043-b8e4-cb408a6b35eb\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.userCondition','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.warning','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.elements.1.width','100'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.name','\"Content\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.uid','\"643c166d-8a1d-4a15-95f0-612955c5f587\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.fieldLayouts.1059e71f-e91e-4765-895c-3ce6871615f0.tabs.0.userCondition','null'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.handle','\"orariSettimanali\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.name','\"Orari Settimanali\"'),('globalSets.85074937-dff7-4c16-9d2c-0c76875fea4a.sortOrder','1'),('graphql.publicToken.enabled','true'),('graphql.publicToken.expiryDate','null'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.isPublic','true'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.name','\"Public Schema\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.0','\"sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.1','\"sites.b2c3d4e5-f678-90ab-cdef-123456789012:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.2','\"elements.drafts:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.3','\"elements.revisions:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.4','\"elements.inactive:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.5','\"sections.45952d02-8da9-45dc-81df-be4fea47ce47:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.6','\"nestedentryfields.97c36746-feb8-4bc1-8b32-3e3c3259b31b:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.7','\"volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.8','\"volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4:read\"'),('graphql.schemas.fd6020f8-2e21-4f1d-af40-1c74e81c3000.scope.9','\"globalsets.85074937-dff7-4c16-9d2c-0c76875fea4a:read\"'),('meta.__names__.0e998ccf-b819-41f0-88c2-01bfa99e19e2','\"Orari\"'),('meta.__names__.2fbf1bea-4c0f-4faf-b4df-d7c7faf27656','\"Video Background\"'),('meta.__names__.3673fc41-a579-4121-81bd-d598f59eca0a','\"Orario Ultimo Ingresso\"'),('meta.__names__.3e7c6349-ae7b-4066-bcb6-380ea09b4f86','\"Seo Description\"'),('meta.__names__.4033fbd4-5d65-4515-96fd-2b54697b307d','\"Titolo Seconda Riga\"'),('meta.__names__.45952d02-8da9-45dc-81df-be4fea47ce47','\"Homepage\"'),('meta.__names__.46188251-46ab-4519-916a-28b77f5aabbe','\"Sottotitolo\"'),('meta.__names__.595345f1-a17e-4be3-ba5a-8f68332aebb5','\"Visita\"'),('meta.__names__.5a26f1f1-6170-408e-8b45-bcbf7104e0cb','\"Hero\"'),('meta.__names__.5cdd6615-0e0c-4415-bc3f-302dc52b1104','\"Homepage\"'),('meta.__names__.68308c87-e785-41d2-b15b-58aefafa2c8f','\"Seo Image\"'),('meta.__names__.7a220bd6-7d45-4cd3-9d88-7f3e583ed063','\"Link CTA\"'),('meta.__names__.85074937-dff7-4c16-9d2c-0c76875fea4a','\"Orari Settimanali\"'),('meta.__names__.85867d07-76c5-49c6-b699-3f42a9ad4cc8','\"Seo Title\"'),('meta.__names__.8f7f8686-4145-4205-ace1-e67e6e7f91f5','\"Fontana Trevi - IT\"'),('meta.__names__.97c36746-feb8-4bc1-8b32-3e3c3259b31b','\"Blocchi\"'),('meta.__names__.9c5d5f1c-302b-432d-8889-3965d508b194','\"fonta-trevi\"'),('meta.__names__.aeb11d3b-b8f3-4a5a-b89e-309cead42890','\"Titolo Prima Riga\"'),('meta.__names__.c0c8eabb-1d94-449c-b621-1252e3e75ea4','\"Video\"'),('meta.__names__.de834319-7a42-478c-9f63-192de7436f20','\"Testo Avviso Manutenzione\"'),('meta.__names__.e10b9023-318a-4ed3-98ca-c905871af2b4','\"Sottotitolo Seconda Riga\"'),('meta.__names__.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4','\"Immagini\"'),('meta.__names__.fd6020f8-2e21-4f1d-af40-1c74e81c3000','\"Public Schema\"'),('meta.__names__.ff59314d-d88c-469c-bb11-d18989180be0','\"Icona Avviso Manutenzione\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.defaultPlacement','\"end\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.enableVersioning','true'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.entryTypes.0.uid','\"5cdd6615-0e0c-4415-bc3f-302dc52b1104\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.handle','\"homepage\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.maxAuthors','1'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.name','\"Homepage\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.previewTargets.0.label','\"Primary entry page\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.previewTargets.0.refresh','\"1\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.previewTargets.0.urlFormat','\"{url}\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.propagationMethod','\"all\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.siteSettings.8f7f8686-4145-4205-ace1-e67e6e7f91f5.enabledByDefault','true'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.siteSettings.8f7f8686-4145-4205-ace1-e67e6e7f91f5.hasUrls','true'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.siteSettings.8f7f8686-4145-4205-ace1-e67e6e7f91f5.template','null'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.siteSettings.8f7f8686-4145-4205-ace1-e67e6e7f91f5.uriFormat','\"__home__\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.siteSettings.b2c3d4e5-f678-90ab-cdef-123456789012.enabledByDefault','true'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.siteSettings.b2c3d4e5-f678-90ab-cdef-123456789012.hasUrls','true'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.siteSettings.b2c3d4e5-f678-90ab-cdef-123456789012.template','null'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.siteSettings.b2c3d4e5-f678-90ab-cdef-123456789012.uriFormat','\"__home__\"'),('sections.45952d02-8da9-45dc-81df-be4fea47ce47.type','\"single\"'),('siteGroups.9c5d5f1c-302b-432d-8889-3965d508b194.name','\"fonta-trevi\"'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.enabled','true'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.handle','\"default\"'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.hasUrls','true'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.language','\"it-IT\"'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.name','\"Fontana Trevi - IT\"'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.primary','true'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.siteGroup','\"9c5d5f1c-302b-432d-8889-3965d508b194\"'),('sites.8f7f8686-4145-4205-ace1-e67e6e7f91f5.sortOrder','1'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.baseUrl','\"$PRIMARY_SITE_URL/en\"'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.enabled','\"true\"'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.handle','\"en\"'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.hasUrls','true'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.language','\"en-GB\"'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.name','\"Fontana Trevi - EN\"'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.primary','false'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.siteGroup','\"9c5d5f1c-302b-432d-8889-3965d508b194\"'),('sites.b2c3d4e5-f678-90ab-cdef-123456789012.sortOrder','2'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"fonta-trevi\"'),('system.retryDuration','null'),('system.schemaVersion','\"5.8.0.3\"'),('system.timeZone','\"Europe/Rome\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.altTranslationKeyFormat','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.altTranslationMethod','\"site\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.cardThumbAlignment','\"end\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elementCondition','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.autocapitalize','true'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.autocomplete','false'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.autocorrect','true'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.class','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.dateAdded','\"2026-01-21T11:27:25+00:00\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.disabled','false'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.elementCondition','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.id','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.includeInCards','false'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.inputType','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.instructions','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.label','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.max','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.min','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.name','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.orientation','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.placeholder','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.providesThumbs','false'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.readonly','false'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.requirable','false'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.size','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.step','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.tip','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.title','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.uid','\"20300ee1-01c8-40be-ad1e-8bff5b107720\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.userCondition','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.warning','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.elements.0.width','100'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.name','\"Content\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.uid','\"b32fee4a-b785-4593-b641-8ec9e2ebd449\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fieldLayouts.bc79064d-7f81-491a-9d9c-5f526a6ab7e0.tabs.0.userCondition','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.fs','\"uploads\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.handle','\"video\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.name','\"Video\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.sortOrder','2'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.subpath','\"video\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.titleTranslationKeyFormat','null'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.titleTranslationMethod','\"site\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.transformFs','\"\"'),('volumes.c0c8eabb-1d94-449c-b621-1252e3e75ea4.transformSubpath','\"\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.altTranslationKeyFormat','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.altTranslationMethod','\"site\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.cardThumbAlignment','\"end\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elementCondition','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.autocapitalize','true'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.autocomplete','false'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.autocorrect','true'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.class','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.dateAdded','\"2026-01-21T11:23:56+00:00\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.disabled','false'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.elementCondition','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.id','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.includeInCards','false'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.inputType','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.instructions','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.label','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.max','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.min','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.name','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.orientation','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.placeholder','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.providesThumbs','false'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.readonly','false'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.requirable','false'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.size','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.step','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.tip','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.title','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.uid','\"a8236654-4d7f-42c4-ac9b-ec8a89a2c986\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.userCondition','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.warning','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.elements.0.width','100'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.name','\"Content\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.uid','\"6f6486c1-8a0e-44a5-a6dc-d97d7ad723bb\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fieldLayouts.6eea3406-ad24-4139-a27f-1a436f338122.tabs.0.userCondition','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.fs','\"uploads\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.handle','\"immagini\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.name','\"Immagini\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.sortOrder','1'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.subpath','\"immagini\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.titleTranslationKeyFormat','null'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.titleTranslationMethod','\"site\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.transformFs','\"\"'),('volumes.f91a0c15-40da-4ab6-a7d1-1f0dd212eaf4.transformSubpath','\"\"');
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
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_yjojgtmarvuewmhhmouvpkfoluyzyohcxyhs` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_zagsrfxwbaatmwuecokeiohbcoxfwmbiajcz` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `recoveryCodes` text COLLATE utf8mb4_unicode_ci,
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
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vapvtgnduxduyvwuopmhbihopsatvcgwqahz` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_uvbwbalbgctcdsepybjrjowjsfnbssmocjoj` (`sourceId`),
  KEY `idx_cylkmfebgvrukupfqwqwvnxrodxeczthrpsj` (`targetId`),
  KEY `idx_zitzydwjaabuwzdhbszctshwgzmvlxhlavpc` (`sourceSiteId`),
  CONSTRAINT `fk_gyavxxszmajlrjwayxebdzdaywwjjzfnktik` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qzuqchmeurmouvraczuhwimngetvvtbeacyy` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vaaamdmftqvpqkeattqxsxyaghqhubnhhzcs` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (3,10,11,NULL,10,1,'2026-01-21 15:58:33','2026-01-21 15:58:33','597d5e4d-57d6-4feb-bacb-8d973f54ae68'),(4,10,13,NULL,10,1,'2026-01-21 15:58:33','2026-01-21 15:58:33','e9914851-11a5-49d4-a31d-187e5e49278e'),(6,10,17,NULL,10,1,'2026-01-22 10:00:07','2026-01-22 10:00:07','bbf69bdd-7957-4b1d-8adc-390ef21de9da');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('13daa288','@bower/jquery/dist'),('18f07c50','@craft/web/assets/picturefill/dist'),('193d329e','@craft/web/assets/jqueryui/dist'),('19a801e7','@craft/web/assets/fileupload/dist'),('209ea078','@craft/web/assets/craftsupport/dist'),('2c166dae','@craft/web/assets/cp/dist'),('2dc52714','@craft/web/assets/vue/dist'),('39e5ff4f','@craft/web/assets/velocity/dist'),('3a5c1881','@craft/web/assets/admintable/dist'),('3cba5d84','@craft/web/assets/userpermissions/dist'),('3cbc2d3','@craft/web/assets/datepickeri18n/dist'),('3da9cc12','@craft/web/assets/admintable/dist'),('3de348ad','@craft/web/assets/jquerytouchevents/dist'),('412161c0','@craft/web/assets/velocity/dist'),('41d82b6a','@craft/web/assets/timepicker/dist'),('4527d622','@craft/web/assets/jquerytouchevents/dist'),('45740940','@craft/web/assets/jquerypayment/dist'),('480772f2','@craft/web/assets/fileupload/dist'),('510861cc','@craft/web/assets/feed/dist'),('53450e6','@craft/web/assets/editsection/dist'),('5501b99b','@craft/web/assets/vue/dist'),('5933fb3','@craft/web/assets/graphiql/dist'),('5f270a10','@craft/web/assets/prismjs/dist'),('6034e2df','@craft/web/assets/picturefill/dist'),('6079ec61','@craft/web/assets/d3/dist'),('61f9ac11','@craft/web/assets/jqueryui/dist'),('6c92fd7a','@craft/web/assets/axios/dist'),('6e2e13e2','@craft/web/assets/iframeresizer/dist'),('735504a9','@craft/web/assets/xregexp/dist'),('7b8ac0a2','@craft/web/assets/datepickeri18n/dist'),('7d964123','@craft/web/assets/d3/dist'),('81c8fe3f','@craft/web/assets/dashboard/dist'),('8457bea1','@craft/web/assets/cp/dist'),('8cb856e1','@craft/web/assets/sites/dist'),('8feac87a','@craft/web/assets/selectize/dist'),('90288a84','@craft/web/assets/htmx/dist'),('91c44236','@craft/web/assets/craftsupport/dist'),('97b36bf3','@craft/web/assets/pluginstore/dist'),('9917dde4','@craft/web/assets/fabric/dist'),('9c27537d','@craft/web/assets/dashboard/dist'),('a3d2219b','@craft/web/assets/tailwindreset/dist'),('a87a3dd7','@craft/web/assets/animationblocker/dist'),('a8bedbb2','@craft/web/assets/garnish/dist'),('ae8bd50','@craft/web/assets/timepicker/dist'),('af8fe944','@craft/web/assets/animationblocker/dist'),('b1673f77','@craft/web/assets/tablesettings/dist'),('b89a3917','@bower/jquery/dist'),('b919a26','@craft/web/assets/xregexp/dist'),('ba7943bd','@craft/web/assets/theme/dist'),('be7dc08c','@craft/web/assets/recententries/dist'),('c4da5e40','@craft/web/assets/selectize/dist'),('c4f289d8','@craft/web/assets/fieldsettings/dist'),('c8b8aef1','@craft/web/assets/fabric/dist'),('cb27ca25','@craft/web/assets/garnish/dist'),('d7a3432a','@craft/web/assets/updater/dist'),('e8e2b7a1','@craft/web/assets/tailwindreset/dist'),('ee3492df','@craft/web/assets/jquerypayment/dist'),('ee96f96a','@craft/web/assets/conditionbuilder/dist'),('f149d587','@craft/web/assets/theme/dist'),('f54d56b6','@craft/web/assets/recententries/dist'),('f5e40467','@craft/web/assets/axios/dist'),('f758eaff','@craft/web/assets/iframeresizer/dist');
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
  `notes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_raicwpbzcqdxazegvdtapoftwaeqjniukmqh` (`canonicalId`,`num`),
  KEY `fk_wamjrdvketiwgfczdwahkgpjhjwyoanzoxuu` (`creatorId`),
  CONSTRAINT `fk_rjrivhzgqofkmvuwahegsevrucslfnwnwtyo` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wamjrdvketiwgfczdwahkgpjhjwyoanzoxuu` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,'Applied “Draft 1”'),(3,2,1,3,'Applied “Draft 1”'),(4,11,1,1,NULL),(5,2,1,4,'Applied “Draft 1”'),(6,11,1,2,NULL);
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
  `attribute` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_mmgxzurplujxsuhkdynuqwevpfcpumgsnpfj` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' admin example com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' homepage '),(2,'slug',0,2,' homepage '),(2,'title',0,1,' homepage '),(2,'title',0,2,' homepage '),(9,'alt',0,1,''),(9,'alt',0,2,''),(9,'extension',0,1,' jpg '),(9,'extension',0,2,' jpg '),(9,'filename',0,1,' circles copia jpg '),(9,'filename',0,2,' circles copia jpg '),(9,'kind',0,1,' image '),(9,'kind',0,2,' image '),(9,'slug',0,1,''),(9,'slug',0,2,''),(9,'title',0,1,' circles copia '),(9,'title',0,2,' circles copia '),(10,'alt',0,1,''),(10,'alt',0,2,''),(10,'extension',0,1,' mp4 '),(10,'extension',0,2,' mp4 '),(10,'filename',0,1,' hero fontana mp4 '),(10,'filename',0,2,' hero fontana mp4 '),(10,'kind',0,1,' video '),(10,'kind',0,2,' video '),(10,'slug',0,1,''),(10,'slug',0,2,''),(10,'title',0,1,' hero fontana '),(10,'title',0,2,' hero fontana '),(11,'slug',0,1,''),(11,'slug',0,2,' temp jjiaqdirfzcmeorzwkixekzornuvgnbfouxd '),(11,'title',0,1,''),(11,'title',0,2,''),(18,'slug',0,1,''),(18,'slug',0,2,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `fieldHandle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
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
  `uriFormat` text COLLATE utf8mb4_unicode_ci,
  `template` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `token` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qwnmmepgdtudngkgahcchkdphjlegfucmxjn` (`uid`),
  KEY `idx_ktdionprffwfupnozbfkdpgqfpkzyxlebfkm` (`token`),
  KEY `idx_ndlulgkijibgvjvlqyyckjcnlgmpfdcrimjt` (`dateUpdated`),
  KEY `idx_pczzjluinrqmlkdmiszmqshuapxsrbezxlba` (`userId`),
  CONSTRAINT `fk_yigsjpclcvzntddijsuibqsxgjucoxpspndc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (8,1,'KJA9x7Y4MCr5iVg8X3YSAm_i6pE4fNrR8_X8eDkmjILaQ2zvhckDP87h50xumKTDTUHxDm1XSKsewCSN67d8MLQxIhpSJQyjxocs','2026-01-22 14:29:23','2026-01-22 14:40:06','5fc4ba77-c29b-459a-a23a-88c82a05339e');
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
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `enabled` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
INSERT INTO `sites` VALUES (1,1,1,'1','Fontana Trevi - IT','default','it-IT',1,'$PRIMARY_SITE_URL',1,'2026-01-21 10:24:43','2026-01-21 11:06:03',NULL,'8f7f8686-4145-4205-ace1-e67e6e7f91f5'),(2,1,0,'true','Fontana Trevi - EN','en','en-GB',1,'$PRIMARY_SITE_URL/en',2,'2026-01-21 11:04:12','2026-01-21 11:04:12',NULL,'b2c3d4e5-f678-90ab-cdef-123456789012');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identityId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `token` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` text COLLATE utf8mb4_unicode_ci,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `users` VALUES (1,NULL,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'admin@example.com','$2y$13$4Tb.KYt2pfuVKR4YbDIKNOIqGzYDgcOaaDRpEikr/Yu7mPMQEUoXe','2026-01-22 14:29:23',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2026-01-22 14:28:21','2026-01-21 10:24:45','2026-01-22 14:29:23');
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Immagini','','2026-01-21 11:27:35','2026-01-21 11:27:35','ee1984ef-5822-44f2-9469-02f33c8cad86'),(2,NULL,2,'Video','','2026-01-21 11:28:57','2026-01-21 11:28:57','93442e25-a95a-412f-b700-79bc3e5f1c35'),(3,NULL,NULL,'Temporary Uploads',NULL,'2026-01-21 14:31:51','2026-01-21 14:31:51','09b4cfaa-5e0c-4249-901b-00d860e8fa15'),(4,3,NULL,'user_1','user_1/','2026-01-21 14:31:51','2026-01-21 14:31:51','53cce686-2a65-4072-8b48-f353d0bd6099');
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fs` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subpath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transformFs` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transformSubpath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8mb4_unicode_ci,
  `altTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text COLLATE utf8mb4_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `credentialId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credential` text COLLATE utf8mb4_unicode_ci,
  `credentialName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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

-- Dump completed on 2026-01-22 14:40:59
