-- MySQL dump 10.15  Distrib 10.0.31-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cmsinstall1
-- ------------------------------------------------------
-- Server version	10.0.31-MariaDB-0ubuntu0.16.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `tx_impexp_presets`
--

LOCK TABLES `tx_impexp_presets` WRITE;
/*!40000 ALTER TABLE `tx_impexp_presets` DISABLE KEYS */;
INSERT INTO `tx_impexp_presets` VALUES (1,1,'Introduction Package',1,0,'a:18:{s:8:\"pagetree\";a:4:{s:2:\"id\";s:1:\"0\";s:6:\"levels\";s:3:\"999\";s:6:\"tables\";a:14:{i:0;s:9:\"be_groups\";i:1;s:12:\"sys_category\";i:2;s:14:\"sys_collection\";i:3;s:12:\"sys_language\";i:4;s:8:\"sys_news\";i:5;s:14:\"backend_layout\";i:6;s:9:\"fe_groups\";i:7;s:8:\"fe_users\";i:8;s:12:\"sys_template\";i:9;s:10:\"tt_content\";i:10;s:8:\"sys_note\";i:11;s:34:\"tx_bootstrappackage_accordion_item\";i:12;s:33:\"tx_bootstrappackage_carousel_item\";i:13;s:28:\"tx_bootstrappackage_tab_item\";}s:9:\"maxNumber\";i:10000;}s:12:\"external_ref\";a:1:{s:6:\"tables\";a:23:{i:0;s:9:\"be_groups\";i:1;s:5:\"pages\";i:2;s:12:\"sys_category\";i:3;s:14:\"sys_collection\";i:4;s:8:\"sys_file\";i:5;s:19:\"sys_file_collection\";i:6;s:17:\"sys_file_metadata\";i:7;s:18:\"sys_file_reference\";i:8;s:16:\"sys_file_storage\";i:9;s:14:\"sys_filemounts\";i:10;s:11:\"sys_history\";i:11;s:12:\"sys_language\";i:12;s:8:\"sys_news\";i:13;s:14:\"backend_layout\";i:14;s:9:\"fe_groups\";i:15;s:8:\"fe_users\";i:16;s:10:\"sys_domain\";i:17;s:12:\"sys_template\";i:18;s:10:\"tt_content\";i:19;s:8:\"sys_note\";i:20;s:34:\"tx_bootstrappackage_accordion_item\";i:21;s:33:\"tx_bootstrappackage_carousel_item\";i:22;s:28:\"tx_bootstrappackage_tab_item\";}}s:15:\"external_static\";a:1:{s:6:\"tables\";s:0:\"\";}s:19:\"showStaticRelations\";s:0:\"\";s:15:\"excludeDisabled\";s:1:\"1\";s:20:\"download_export_name\";s:14:\"tree_PID0_L999\";s:6:\"preset\";a:2:{s:5:\"title\";s:20:\"Introduction Package\";s:6:\"public\";i:1;}s:4:\"meta\";a:3:{s:5:\"title\";s:0:\"\";s:11:\"description\";s:0:\"\";s:5:\"notes\";s:0:\"\";}s:8:\"filetype\";s:3:\"xml\";s:11:\"maxFileSize\";i:10000;s:8:\"filename\";s:8:\"data.xml\";s:24:\"excludeHTMLfileResources\";s:0:\"\";s:26:\"saveFilesOutsideExportFile\";s:1:\"1\";s:13:\"extension_dep\";a:1:{i:0;s:14:\"indexed_search\";}s:6:\"action\";s:6:\"export\";s:10:\"softrefCfg\";a:38:{s:32:\"eef0378ee7175c3e248dd5dc53e4b99f\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"ccd88600cb2f93dd3a7817b9415d5e5e\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"97507c37d5ca9d4d6f894658cbf2afd7\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"0abfc502cd9ab30c5239f3b918c24f1d\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"123910b2256976f45388cb95529a744c\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"2adf7112f31cb740824140fa5a7c99b0\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"9ce33716614a06848f20ff631cdbcbe3\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"3f3ed1cf0642a0a0a2f96201ea9e0b27\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"aeda7d2714f06f2fd0793a5d83e8cba6\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"43cd2e0eea951fd2cb5ed16f70ea4305\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"a26553b0dc5f40cef3ce1987227e7935\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"13d5ea5c19feb4b09e3f0fe57d1e0a34\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"ce43b28b0374ad48a9778b8ccada9ab6\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"9d1d27f872216ef2c26d04682132119a\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"9333b8a0f4f61a4af5e6549cd0b016c6\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"2439f007131caa7735b9f6003c69422a\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"1759074b8b7a7b22ec7cc8c62ee9ced7\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"0f65c761f9929d0e19da2d19abd31fa3\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"efa395b5a8dac46505dabe973f44ea3f\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"58cb31ff7881ff18f4e911d63bb0dfb4\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"df63486e300c5cdda7e74771f3387aa3\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"e47137b93826c1482f140f9cdb1ffe43\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"003555b28904a10fe97dbff150d64761\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"00e7ab0b497366df785803212686c873\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"2b2a2ae56b91e72acbc7aeb4f45ab3a6\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"72c6e94a27b50bedc6aaf9e4b0a55ec5\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"acd7df507659b949fc76a5e575b3978c\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"3fd670bc2be21d92bd6cf10cec7e4444\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"4f41ab257d850be225b3378547c42494\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"05e4c44b332058deae458722ce060af6\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"a382fbd336ebe581392b1f5f9a489bd6\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"7a3fba5cac8ce9d2bcb469d6de740b36\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"47451f5e587cfcaf5d6d8576f141491b\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"a26510443e5a36fca6d356e6df81752d\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"c755b55c34228eeba1a0bb6f192fb645\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"63192e0c9a37193a9c24dc8fc7991583\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"1d715280b14d8a235bd108e57c666193\";a:1:{s:4:\"mode\";s:0:\"\";}s:32:\"ffd3f50c283d33dee4c016ec161ad6f4\";a:1:{s:4:\"mode\";s:0:\"\";}}s:7:\"listCfg\";a:1:{s:9:\"maxNumber\";i:100;}s:7:\"exclude\";a:0:{}}');
/*!40000 ALTER TABLE `tx_impexp_presets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-16  5:13:04
