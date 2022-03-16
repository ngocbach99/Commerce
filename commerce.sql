-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: commerce
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_date` timestamp NULL DEFAULT NULL,
  `price_total` mediumint DEFAULT NULL,
  `discount_percent` int DEFAULT NULL,
  `buyer_id` int DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `pay` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bill_user_idx` (`buyer_id`),
  CONSTRAINT `fk_bill_user` FOREIGN KEY (`buyer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(5000) COLLATE utf8_bin DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `created_time` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `created_day` int DEFAULT NULL,
  `created_month` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_blog_category_idx` (`category_id`),
  CONSTRAINT `fk_blog_category` FOREIGN KEY (`category_id`) REFERENCES `categories_blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'8 Inspiring Ways to Wear Dresses in the Winter','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet est vel orci luctus sollicitudin. Duis eleifend vestibulum justo, varius semper lacus condimentum dictum. Donec pulvinar a magna ut malesuada. In posuere felis diam, vel sodales metus accumsan in. Duis viverra dui eu pharetra pellentesque. Donec a eros leo. Quisque sed ligula vitae lorem efficitur faucibus. Praesent sit amet imperdiet ante. Nulla id tellus auctor, dictum libero a, malesuada nisi. Nulla in porta nibh, id vestibulum ipsum. Praesent dapibus tempus erat quis aliquet. Donec ac purus id sapien condimentum feugiat.',1,'11:12:07',22,'Jan 2021','wallpaperflare.com_wallpaper (4).jpg'),(3,'The Great Big List of Men’s Gifts for the Holidays','Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget dictum tortor. Donec dictum vitae sapien eu varius',2,'23:33:52',10,'May 2021','blog-05.jpg'),(4,'5 Winter-to-Spring Fashion Trends to Try Now','Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget dictum tortor. Donec dictum vitae sapien eu varius',3,'07:44:18',9,'July 2021','blog-06.jpg'),(49,'Facebook','The God has given humankind above the animal',1,'08:05:26',28,'Sep 2021','24.jpg'),(50,'Toronto-Based Artist Collaborates with Emporio Armani + More Fashion News','To mark the 40th anniversary of Emporio Armani, Toronto-based artist Maxwell N. Burnstein was tapped to interpret the storied fashion brand’s history and future. Burnstein, who is self-taught, has done so in a series of collages that illustrate how the Italian fashion house has stayed true to its heritage while simultaneously adapting to metropolitan living. The masterful collages are set to be displayed on the W1 Screens along Oxford Street in London, England, as a site-specific installation. Yet another instance of Canadian talent being carried across the world.',2,'09:44:12',29,'Sep 2021','wallpaperflare.com_wallpaper (2).jpg'),(51,'Recyclable Sneaker Brand Thousand Fell Comes to Canada','Thousand Fell, a NYC-based brand, says it has created the world’s “first recyclable sneaker.” Made of materials like upcycled clothing, plastic water bottles and even food waste, the brand has filled a gap in the notoriously wasteful footwear industry. The minimalistic vegan shoes have generated a lot of buzz and racked up hefty waitlists — and as of September 22, they’re available in Canada, too.',3,'09:45:16',29,'Sep 2021','19.jpg');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_tag` (
  `blog_id` int NOT NULL,
  `tag_id` int NOT NULL,
  KEY `fk_blog_idx` (`blog_id`),
  KEY `fk_tag_idx` (`tag_id`),
  CONSTRAINT `fk_blog` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`),
  CONSTRAINT `fk_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (3,1),(4,1),(1,44),(49,1),(49,4),(49,7),(49,44),(49,45),(50,6),(50,7),(50,45),(51,4),(51,5),(51,6);
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `bill_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_product` (`product_id`),
  KEY `fk_cart_bill_idx` (`bill_id`),
  CONSTRAINT `fk_cart_bill` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`),
  CONSTRAINT `fk_cart_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (7,20,1,2),(8,21,1,2),(9,42,1,2),(10,20,NULL,2),(11,20,NULL,2),(12,20,NULL,2),(13,20,NULL,2),(14,20,NULL,2);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id_cate` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_cate`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Women'),(2,'Men'),(3,'Bag'),(4,'Shoes'),(5,'Watches');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_blog`
--

DROP TABLE IF EXISTS `categories_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_blog`
--

LOCK TABLES `categories_blog` WRITE;
/*!40000 ALTER TABLE `categories_blog` DISABLE KEYS */;
INSERT INTO `categories_blog` VALUES (1,'Fashion'),(2,'Beauty'),(3,'Street Style'),(4,'Life Style'),(5,'DIY & Crafts');
/*!40000 ALTER TABLE `categories_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_blog`
--

DROP TABLE IF EXISTS `comment_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `blog_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_blog_idx` (`blog_id`),
  CONSTRAINT `fk_comment_blog` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_blog`
--

LOCK TABLES `comment_blog` WRITE;
/*!40000 ALTER TABLE `comment_blog` DISABLE KEYS */;
INSERT INTO `comment_blog` VALUES (1,'Very useful article','Nguyễn Ngọc Bách','iamghost827@gmail.com',51),(3,'This blog is so nice','Thao Phuong Le','ngocbachnguyen99@gmail.com',51);
/*!40000 ALTER TABLE `comment_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `discount` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (1,'NGOCBACH',10),(2,'ILOVEYOU',20);
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `price` bigint NOT NULL,
  `description` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `categories_id` int DEFAULT NULL,
  `img_main` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `img_hover` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `img_sub` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pro_cate_idx` (`categories_id`),
  CONSTRAINT `fk_pro_cate` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id_cate`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Áo T-Shirt Oversize',20,'<div><ul><li>Chất liệu: Cotton 230 GSM</li><li> Sử dụng công nghệ in ép nhiệt chất lượng cao</li><li> Độ bền cao, lộn trái áo khi giặt</li><ul></div>',2,'product1.2.jpg','product1.1.jpg','product1.3.jpg'),(2,'Áo T-Shirt Blood Diamond',40,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'blooddiamond2.jpg','blooddiamond1.jpg','blooddiamond3.jpg'),(3,'Áo T-Shirt Basic Over',120,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',2,'basicover1.jpg','basicover2.jpg','basicover3.jpg'),(4,'Áo T-Shirt Racing',120,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'racing1.jpg','racing2.jpg','racing3.jpg'),(5,'Áo T-Shirt Teddie',120,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'teddie1.jpg','teddie2.jpg','teddie3.jpg'),(6,'Áo T-Shirt King of School ',120,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'KingofSchool1.jpg','kingofschool2.jpg','kingofschool3.jpg'),(7,'Áo T-Shirt Skull ',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'skull1.jpg','skull2.jpg','skull3.jpg'),(8,'Áo T-Shirt Agent',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'agent1.jpg','agent2.jpg','agent3.jpg'),(9,'Áo T-Shirt Waster',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'8.1.jpg','8.2.jpg','8.3.jpg'),(10,'Áo T-Shirt Skull ',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'10-1.jpg','10-2.jpg','10-3.jpg'),(11,'Áo T-Shirt Skull ',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'skull1.jpg','skull2.jpg','skull3.jpg'),(14,'Áo T-Shirt Basic',35,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',1,'product-01.jpg','product-012.jpg','product-013.jpg'),(15,'Áo T-Shirt Slevee',35,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',1,'product-161.jpg','product-162.jpg','product-163.jpg'),(16,'Áo T-Shirt Black',35,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',1,'chi-ghi-trc.jpg','chi-ghi-sau.jpg','chi-trang-sau.jpg'),(17,'Áo T-Shirt Color',70,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',1,'v1-vang.png','0c530625-700d-4923-8268-43af5e699580.jpg','58bb88e1-5dbe-44de-a5a1-77ad1aff1131.jpg'),(18,'Áo COAST Brown',120,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',1,'clowz-5-1-2.jpg','clowz-5-9.jpg','clowz-5-3.jpg'),(19,'Converse Basic',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',4,'product-09.jpg','product092.jpg','product-093.jpg'),(20,'Đồng hồ Basic',300,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',5,'product-06.jpg','product-062.jpg','product-063.jpg'),(21,'Đồng hồ BlackPanther',300,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',5,'product-15.jpg','product-152.jpg','product-153.jpg'),(42,'Túi Utility',35,'Size: 23x16x8 cm\r , Mô tả: Túi 3 ngăn in logo\r,  Dây quai đeo: Họa tiết caro đen trắng in chạy dọc quai đeo',3,'bag1.jpg','bag3.jpg','bag2.jpg'),(43,' Túi Ulitity SATCHEL',40,'Dây quai đeo: Họa tiết caro đen trắng in chạy dọc quai đeo. Dây đeo có thể điều chỉnh hoặc tháo rời, Thiết kế, chất liệu, và hình in chất lượng cao.',3,'clowz-1-1.jpg','clowz1-2.jpg','clowz-3-1.jpg'),(45,'Túi Crytal Clear',35,'Dây đeo: Chữ \"CLOWNZ\" thiết kế theo phong cách graphic in chìm, dây đeo dài có thể điều chỉnh và tháo rời.Chất liệu: Nhựa PU, Thiết kế, chất liệu, và hình in chất lượng cao.',3,'clear-bag-black.jpg','1a7ff27f-75e2-4917-98bb-6d62bd9c3518.jpg','35e41285-3b94-4dca-96de-fff0b8b19273.jpg'),(56,'Đồng hồ Rolex Luxury',1000,'Đồng hồ Rolex Luxury',5,'mua-Đồng-hồ-Rolex-Deepsea-đen.jpeg','Daytona-2-1580886196.jpg','dong-ho-rolex-nam-nu-chinh-hang-gia-bao-nhieu-danh-gia-chi-tiet.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `review` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `star_number` int DEFAULT NULL,
  `review_date` datetime DEFAULT NULL,
  `reviewer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_review_user_idx` (`reviewer_id`),
  KEY `fk_review_product_idx` (`product_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_review_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_review_user` FOREIGN KEY (`reviewer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (12,'Nice',4,'2021-08-31 18:51:41',52,1),(13,'Awsome',4,'2021-08-31 18:53:42',52,1),(14,'Impressive',3,'2021-08-31 21:05:31',52,1),(15,'Nice',4,'2021-08-31 21:08:33',52,1),(16,'There\'s nothing left to criticize',4,'2021-08-31 21:41:14',52,2),(17,'That\'s cool',4,'2021-09-02 16:58:59',52,2),(18,'Nice ',2,'2021-09-02 17:16:00',52,5),(19,'Okay',1,'2021-09-02 17:16:27',52,5),(20,'I\'m really like it',5,'2021-09-02 17:17:14',52,5),(21,'Everything is so nice',5,'2021-09-14 16:16:11',52,3),(22,'Material of this shirt?',5,'2021-09-14 16:18:59',52,4),(24,'It\'s really nice and worth the money, I bought one',5,'2021-09-30 02:19:31',54,56);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Fashion'),(2,'Lifestyle'),(3,'Denim'),(4,'Streetstyle'),(5,'Crafts'),(6,'Couple'),(7,'Trending'),(44,'Car'),(45,'Collections');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `role` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `enabled` tinyint DEFAULT NULL,
  `auth_provider` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `postal_code` int DEFAULT NULL,
  `avatar` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `one_time_password` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `otp_requested_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (52,'iamghost06@gmail.com','$2a$10$i9JKfU8EW7QsJBOJ61hBU.r/6NrFwO4udNCdj1LloSUjii8VJQKdi','Nguyen Ngoc Bach',NULL,NULL,NULL,NULL,0,NULL,'ROLE_USER',1,NULL,NULL,NULL,NULL,NULL),(54,'iamghost827@gmail.com','$2a$10$Mp9waoY.mQlBYHFqueMJQuBArng3fj/RU4HEMYjyxy6A5Ya14a9ni','Nguyễn Ngọc Bách','0969374719','64, Nguyễn Văn Trỗi, Hà Đông, Hà Nội','Ha Noi','Ha Noi',100000,NULL,'ROLE_ADMIN',1,NULL,100000,'ba2b7156370cf989082c7daa8a8c336f.jpg',NULL,NULL),(90,'ngocbachnguyen100@gmail.com','$2a$10$XZOHSDmtkUdck5M7NdelMe6Xnupo1csaviwZ3JLr8yoCUEnUYnRDm','Nguyễn Ngọc Bách',NULL,NULL,NULL,NULL,0,'2021-09-24 09:08:31','ROLE_USER',1,NULL,NULL,'69402738_2326329874274213_15742996465057792_n.jpg',NULL,NULL),(109,'ngocbachnguyen99@gmail.com','$2a$10$cyenQhVq6WJxK6V4crI8juyMoJJ6SMO8gx3d5J013VmGIzC8rq4tW','Nguyễn Ngọc Bách',NULL,NULL,NULL,NULL,0,'2021-09-24 16:13:46','ROLE_USER',1,NULL,NULL,'68710078_2317204161853451_5053846085437489152_n.jpg',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-16  8:46:04
