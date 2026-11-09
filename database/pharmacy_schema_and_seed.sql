mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: pharmacy
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_product_id_foreign` (`product_id`),
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Diabetes','diabetes','category_icons/PtuyAbFnTS3ydbFI01sFkmDvYzXJsK0xYks1mcS1.png','2025-06-08 12:03:37','2025-06-16 08:41:58'),(2,'Fitness','fitness','category_icons/eKKWrSpB83yZ1K6arC32z1ADFoZTJ19R3u3p8n2A.png','2025-06-13 13:13:42','2025-06-13 13:13:42'),(3,'Vitamins','vitamins','category_icons/KgGFwb5H4Soh0oeTPvJq4JtmgZRxYzwM7zVMecjG.png','2025-06-13 13:15:03','2025-06-13 13:15:03'),(5,'Surgicals','surgicals','category_icons/gDAT7iJWWiOGgoCg1keeuXDYPgCpYupKt6k1I58t.png','2025-06-16 07:50:41','2025-06-16 07:50:41');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_06_06_184746_create_permission_tables',1),(5,'2025_06_07_090214_create_categories_table',1),(6,'2025_06_07_090304_create_products_table',1),(7,'2025_06_07_090341_create_carts_table',1),(8,'2025_06_07_090432_create_product_transactions_table',1),(9,'2025_06_07_090507_create_transaction_details_table',1),(10,'2025_06_16_162949_drop_icon_column_from_products_table',2),(11,'2025_06_16_164030_drop_icon_column_from_products_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',3),(2,'App\\Models\\User',4),(2,'App\\Models\\User',10),(2,'App\\Models\\User',11);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_transactions`
--

DROP TABLE IF EXISTS `product_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proof` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `total_amount` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_transactions_user_id_foreign` (`user_id`),
  CONSTRAINT `product_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_transactions`
--

LOCK TABLES `product_transactions` WRITE;
/*!40000 ALTER TABLE `product_transactions` DISABLE KEYS */;
INSERT INTO `product_transactions` VALUES (1,'Jl. Asem Gede','888999','087765879098','Surakarta','proof.png',1,200000,3,'Dekat Burjo',NULL,'2025-06-22 07:09:33'),(2,'Perum Candi Indah','123098','088198097367','Yogyakarta','proof/buktipal.png',1,500000,2,'Deket warmindo cimindi',NULL,'2025-06-22 07:04:20'),(6,'Tedjamudita 3','22081882','602192301923','Bolavia','payment_proofs/t5stktwrIMsoSqjOO0ZDhse6V0Mr4YqpYWjmJZMD.png',1,404940,3,'nearby with local shops that close with the big river next to aftermarket place.','2025-07-21 22:52:30','2025-07-22 11:45:55'),(7,'Tedjamudita 3','22081882','602192301923','Bolavia','payment_proofs/AtDgtMZWluY07vpDGnfePNw4T38QTRpHroBAYfLx.jpg',1,67500,3,'nearby with local shops that close with the big river next to aftermarket place.','2025-07-22 00:13:11','2025-07-22 11:45:48'),(8,'Tedjamudita 3','22081882','602192301923','Bolavia','payment_proofs/DxuV4wreaPRKCLzL5PqkxqVEm38oC5O9tGhPqgxu.png',1,150750,3,'nearby with local shops that close with the big river next to aftermarket place.','2025-07-22 09:32:04','2025-07-22 09:32:50'),(9,'Tedjamudita 3','22081882','602192301923','Bolavia','payment_proofs/Ji42tZ4KbcQW5tHN5KenCpE5NVcyD5FgDhMexxxM.png',0,210690,3,'nearby with local shops that close with the big river next to aftermarket place.','2025-07-22 11:52:52','2025-07-22 11:52:52'),(10,'Jogja Amazon Green','22081882','602192301923','yogyakarta','payment_proofs/mX6IRgmfSdqXS7plIvnNa0oJ82UZe2ZpbGpa0uRh.png',0,2232000,3,'nearby with local shops that close with the big river next to aftermarket place.','2025-07-22 11:54:06','2025-07-22 11:54:06'),(11,'Ester','22081882','602192301923','Solo','payment_proofs/3nPDlyDc15Xgm0pBm1RezfjsITy1nfUg3fVFEwqI.png',1,210690,3,'nearby with local shops that close with the big river next to aftermarket place.','2025-07-22 12:03:45','2025-07-22 12:05:00'),(12,'Tedjamudita 3','452523','436357257562','yogyakarta','payment_proofs/Y4bPClMZwKnQQtstsXa90Ww17GG4z3UcVthxD4L4.png',1,2287500,3,'GABRGQGVAVESwbqy5nhwgwveg','2025-07-24 08:00:37','2025-07-31 01:53:05'),(13,'wdq','2161','634675315','eeffwv4','payment_proofs/wwwynVi9ChGHcNA3H9fAh6IRhXFKzEiREXrjgote.png',1,2232000,3,'erejehwsaerb4h6wh','2025-07-24 08:01:26','2025-07-24 08:02:05'),(14,'Ester','8755864','40869566578779485','Bolavia','payment_proofs/T6Y2kMw2qS29FYnIQ89R4FTRqqMrRsu4mummC4SD.png',1,2232000,3,'.jhlfcrl;tciylvugkchgdytx53z4','2025-07-24 10:37:05','2025-07-24 10:37:45'),(15,'Jogja Amazon Green','23465129','-231470935629','Solo','payment_proofs/m5Teqj6Nr2JpXdctUboOEDLPn84ScOrFCjhrAyWe.png',1,2287500,3,'FA./VEHW;BIQ \'UPWN\'VHWTB4;YT3qvru\'nce','2025-07-27 21:11:07','2025-07-30 02:40:13'),(16,'Jogja Amazon Green','121345','4516134652','Solo','payment_proofs/4BUyh6tf77u4UBOgZ5Gnjr3iZtd5wzvSakvxtwuO.png',1,2232000,11,'3hbanyTBTbNTSMYDTU,YFOTMIDYRNSUEYBARWTEVQRWCEVGRHTJYDKTMIYRUNSTEYBRTWE','2025-07-27 21:36:48','2025-07-27 21:37:16'),(17,'Ester','9458238','340932842357','Bolavia','payment_proofs/Gc2XYTtEph44Cr0AmANS0KIxt70aiL7J1j5HtUpo.png',1,349440,3,'sebelah warmindo','2025-07-30 02:48:15','2025-07-30 02:49:51');
/*!40000 ALTER TABLE `product_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'Nature Made Gummies','nature-made-gummies','product_photos/kGEqcIv4VTahsxZuMJ9vEG8Cs9AfEAvVjS3NjsxI.jpg','Vitamin C adalah antioksidan penting yang membantu menjaga daya tahan tubuh, mempercepat penyembuhan luka, serta mendukung kesehatan kulit, gusi, dan pembuluh darah. Selain itu, vitamin C juga membantu penyerapan zat besi dari makanan dan melawan radikal bebas penyebab penyakit.',179000,3,'2025-06-18 00:37:24','2025-06-22 05:52:12'),(8,'Lantus – Insulin Glargine','lantus-insulin-glargine','product_photos/jAJjzLKRMmjiNqspjHVpQLR9AV993FUDqC6yJwd6.jpg','Lantus adalah insulin kerja panjang (long-acting insulin) yang digunakan untuk mengontrol kadar gula darah pada penderita diabetes tipe 1 dan tipe 2. Obat ini mengandung insulin glargine, yang bekerja stabil hingga 24 jam untuk membantu tubuh menjaga kadar gula darah tetap normal sepanjang hari. Lantus biasanya digunakan satu kali sehari, pada waktu yang sama setiap hari. Cocok untuk pasien dewasa maupun anak-anak yang memerlukan pengaturan insulin jangka panjang.',125000,1,'2025-06-22 06:23:43','2025-06-22 06:23:43'),(9,'Hypafix – Plester Penutup Luka','hypafix-plester-penutup-luka','product_photos/Vfj3c3c61HuSRcKJ9pOvO0yhf5fPkJEisMHZ4ksF.jpg','Hypafix adalah plester gulung berbahan non-woven yang digunakan untuk menempelkan dressing luka, kateter, atau perban tanpa membuat kulit iritasi. Plester ini memiliki daya rekat kuat namun tetap lembut dan fleksibel, sehingga nyaman digunakan di area tubuh yang sering bergerak. Hypafix dapat dipotong sesuai kebutuhan dan tidak meninggalkan bekas lengket saat dilepas. Cocok untuk pasien dengan kulit sensitif atau untuk luka pasca operasi.',50000,5,'2025-06-22 06:52:43','2025-06-22 06:53:30'),(10,'Knee Support','knee-support','product_photos/HHPrtj7prMylCd7vMYnitSro7pCSfOnWFZBjrDBZ.png','sendi lutut, baik saat beraktivitas sehari-hari maupun saat berolahraga. Produk ini membantu mengurangi tekanan pada lutut, mengurangi risiko cedera, serta mempercepat pemulihan dari cedera ringan, keseleo, atau nyeri sendi. Terbuat dari bahan elastis dan breathable, knee support memberikan kenyamanan tanpa membatasi gerak.',2000000,2,'2025-06-22 06:55:42','2025-06-29 18:02:20'),(11,'Obat','obat','product_photos/DjeBeYUkFgsjkEoycog09TPalcBEJm588BkMmcRP.png','lorem ipsum',20000,3,'2025-07-24 10:41:02','2025-07-24 10:41:02');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'owner','web','2025-06-07 03:33:06','2025-06-07 03:33:06'),(2,'buyer','web','2025-06-07 03:33:06','2025-06-07 03:33:06');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('3sKqSBgqR3rROO1wOcTr5Jwuz9aAmFy9WAkwX666',3,'127.0.0.1','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYmIzNkdSNjlENU5zOFptbkNKbWtuckpSRFl5dVZjOEhqN1Nqd05SYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO30=',1755022238),('xH9gpiCiYyhd8EYOffsz6SYGJsZit9IPvqTw2fQW',NULL,'127.0.0.1','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNW1NcmFWWm5OVmV4WUtuS0lPcHJ5dUg3b1p2c0NaanNCNWNWYmVlNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kZXRhaWxzL2tuZWUtc3VwcG9ydCI7fX0=',1755022005);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_details`
--

DROP TABLE IF EXISTS `transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `price` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_transaction_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_details_product_id_foreign` (`product_id`),
  KEY `transaction_details_product_transaction_id_foreign` (`product_transaction_id`),
  CONSTRAINT `transaction_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `transaction_details_product_transaction_id_foreign` FOREIGN KEY (`product_transaction_id`) REFERENCES `product_transactions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_details`
--

LOCK TABLES `transaction_details` WRITE;
/*!40000 ALTER TABLE `transaction_details` DISABLE KEYS */;
INSERT INTO `transaction_details` VALUES (1,700000,3,1,NULL,NULL),(2,750000,10,2,NULL,NULL),(3,200000,9,2,NULL,NULL),(4,50000,9,6,'2025-07-21 22:52:30','2025-07-21 22:52:30'),(5,179000,3,6,'2025-07-21 22:52:31','2025-07-21 22:52:31'),(6,125000,8,6,'2025-07-21 22:52:31','2025-07-21 22:52:31'),(7,50000,9,7,'2025-07-22 00:13:11','2025-07-22 00:13:11'),(8,125000,8,8,'2025-07-22 09:32:04','2025-07-22 09:32:04'),(9,179000,3,9,'2025-07-22 11:52:52','2025-07-22 11:52:52'),(10,2000000,10,10,'2025-07-22 11:54:06','2025-07-22 11:54:06'),(11,179000,3,11,'2025-07-22 12:03:45','2025-07-22 12:03:45'),(12,2000000,10,12,'2025-07-24 08:00:37','2025-07-24 08:00:37'),(13,50000,9,12,'2025-07-24 08:00:37','2025-07-24 08:00:37'),(14,2000000,10,13,'2025-07-24 08:01:26','2025-07-24 08:01:26'),(15,2000000,10,14,'2025-07-24 10:37:05','2025-07-24 10:37:05'),(16,50000,9,15,'2025-07-27 21:11:07','2025-07-27 21:11:07'),(17,2000000,10,15,'2025-07-27 21:11:07','2025-07-27 21:11:07'),(18,2000000,10,16,'2025-07-27 21:36:48','2025-07-27 21:36:48'),(19,125000,8,17,'2025-07-30 02:48:15','2025-07-30 02:48:15'),(20,179000,3,17,'2025-07-30 02:48:15','2025-07-30 02:48:15');
/*!40000 ALTER TABLE `transaction_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Rakha Pemilik','rakha@owner.com',NULL,'$2y$12$iqw3N34hAbNEx8BbJ.tacu8/3Z37SB7Qr9ohRoiGQFkw5ifE1dBci','PQYnuC542ojfo4FMhrqotMNOnDJVKOTI3tGa2HL0YHs9NcMpQrQFnPghs04h','2025-06-07 03:33:06','2025-06-07 03:33:06'),(2,'Revan','revan@pembeli.com',NULL,'$2y$12$s38lPuMOu7hvPK0Au8jHC.xjCzokVFeTyGy3mw.fn5mkUZ6gF/Ewi',NULL,'2025-06-08 09:47:16','2025-06-08 09:47:16'),(3,'rakha','rakha@pembeli.com',NULL,'$2y$12$r0lV0NcAihT1TTXqS3fg2Oeb9TD76TL7JJdIimQCeOwG5o46Xn.eS',NULL,'2025-06-08 09:56:44','2025-06-08 09:56:44'),(4,'Rakha','rakha@gmail.com',NULL,'$2y$12$QTqAickMNIYENedMcBV5V..N39Hit/ZsUtoB75ZBEEYE.fR794HOm',NULL,'2025-06-20 12:56:02','2025-06-20 12:56:02'),(5,'ppk','ppk@pembeli.com',NULL,'$2y$12$HefSJ3MZJX.LAIC/4.oh0eD1vRx2mBoxqVr5CNOlomluFAui3vwCS',NULL,'2025-07-15 02:04:59','2025-07-15 02:04:59'),(6,'cukii','cukiii@pembeli.com',NULL,'$2y$12$U6LmvZmdp2lIp5Aq8j9RRekdVnpv80XluDlGeyWfHhEfKedDFZfZS',NULL,'2025-07-15 02:13:33','2025-07-15 02:13:33'),(7,'pep','pepe@pembeli.com',NULL,'$2y$12$3Kpk0O/dEvcAwOg522cnuOWS.l6x.UIAGYTaBpyr2kp3QTBJ.lBbu',NULL,'2025-07-15 02:16:28','2025-07-15 02:16:28'),(8,'Putra E','putra@gmail.com',NULL,'$2y$12$U4wG9WywE1YyFKgjDYnAAOOPkZH9FbiVQuHY3u/LYs2mw5OjQrM8u',NULL,'2025-07-15 02:26:57','2025-07-15 02:26:57'),(9,'Ayak','ayak@pembeli.com',NULL,'$2y$12$pT/7HolYxV1jCmfvaNIy5.ZwB6q.SqmDSRM1ominZA.GmPcmc4zwa',NULL,'2025-07-27 21:16:31','2025-07-27 21:16:31'),(10,'Ayak','ayak@buyer.com',NULL,'$2y$12$xcFRBTuWS1yzWiyiAWa1y../z8eGdyfFt6/K7q.epGN6fQHhVbi0a',NULL,'2025-07-27 21:33:58','2025-07-27 21:33:58'),(11,'Ayak','ayak@pembeli.co.id',NULL,'$2y$12$7jRP/uhAfXIFo5zh3WCs6OPaKOTE2LswqZFss8YQBa3LYty4R5oNe',NULL,'2025-07-27 21:36:18','2025-07-27 21:36:18');
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

-- Dump completed on 2026-11-09 17:31:40
