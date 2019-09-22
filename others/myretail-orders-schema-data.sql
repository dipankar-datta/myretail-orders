-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.16 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for myretail_orders
DROP DATABASE IF EXISTS `myretail_orders`;
CREATE DATABASE IF NOT EXISTS `myretail_orders` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `myretail_orders`;

-- Dumping structure for table myretail_orders.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(120) DEFAULT NULL,
  `delivery_address` int(11) DEFAULT NULL,
  `preferred_delivery_date` date DEFAULT NULL,
  `preferred_time_from` time DEFAULT NULL,
  `preferred_time_to` time DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `customer_public_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `FK_orders_contact_details` (`delivery_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table myretail_orders.orders: ~0 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table myretail_orders.order_product
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE IF NOT EXISTS `order_product` (
  `order` int(20) DEFAULT NULL,
  `product` varchar(200) DEFAULT NULL,
  `quantity` int(20) DEFAULT NULL,
  `sale_price` double DEFAULT NULL,
  KEY `FK_order_product_orders` (`order`),
  KEY `FK_order_product_proucts` (`product`),
  CONSTRAINT `FK_order_product_orders` FOREIGN KEY (`order`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table myretail_orders.order_product: ~0 rows (approximately)
DELETE FROM `order_product`;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;

-- Dumping structure for table myretail_orders.order_status_codes
DROP TABLE IF EXISTS `order_status_codes`;
CREATE TABLE IF NOT EXISTS `order_status_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`),
  UNIQUE KEY `unique_code` (`code`),
  KEY `id` (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table myretail_orders.order_status_codes: ~0 rows (approximately)
DELETE FROM `order_status_codes`;
/*!40000 ALTER TABLE `order_status_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status_codes` ENABLE KEYS */;

-- Dumping structure for table myretail_orders.order_track
DROP TABLE IF EXISTS `order_track`;
CREATE TABLE IF NOT EXISTS `order_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `details` varchar(200) DEFAULT NULL,
  `status_time` datetime DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `FK_order_track_orders` (`order`),
  KEY `FK_order_track_order_status_codes` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table myretail_orders.order_track: ~0 rows (approximately)
DELETE FROM `order_track`;
/*!40000 ALTER TABLE `order_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_track` ENABLE KEYS */;

-- Dumping structure for table myretail_orders.shipment_modes
DROP TABLE IF EXISTS `shipment_modes`;
CREATE TABLE IF NOT EXISTS `shipment_modes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table myretail_orders.shipment_modes: ~4 rows (approximately)
DELETE FROM `shipment_modes`;
/*!40000 ALTER TABLE `shipment_modes` DISABLE KEYS */;
INSERT INTO `shipment_modes` (`id`, `name`) VALUES
	(11, 'First Class'),
	(10, 'Same Day'),
	(12, 'Second Class'),
	(9, 'Standard Class');
/*!40000 ALTER TABLE `shipment_modes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
