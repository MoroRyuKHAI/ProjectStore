/*
 Navicat Premium Data Transfer

 Source Server         : MyLocalServ
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : chain_of_stores

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 04/02/2021 23:50:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id_customer` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customer_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customer_surname` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customer_country` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customer_region` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customer_city` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customer_street` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `customer_hnumber` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_customer`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id_order` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_orit` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `id_customer` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_worker` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date_of_sale` datetime(0) NOT NULL,
  `order_price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_order`) USING BTREE,
  INDEX `fk_order_customer_1`(`id_customer`) USING BTREE,
  INDEX `fk_order_store_workers_1`(`id_worker`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `id_orit` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_order` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_product` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_quant` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `price_per_product` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_orit`) USING BTREE,
  INDEX `fk_order_item_order_1`(`id_order`) USING BTREE,
  INDEX `fk_order_item_product_1`(`id_product`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_item
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id_product` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_store` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name_product` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `about` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL,
  `product_quantity` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `category_product` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_provider` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id_product`) USING BTREE,
  INDEX `fk_product_store_1`(`id_store`) USING BTREE,
  INDEX `fk_product_provider_1`(`id_provider`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('UA1BTCL', 'UA1', 'Ceylon large leaf te', 'Ceylon large leaf tea grown on the island of Ceylon with a delicate aroma and pleasant tart taste', 2.00, '100 g', 'Black tea', '0');
INSERT INTO `product` VALUES ('', '', '', NULL, NULL, '100g', 'Green tea', '0');
INSERT INTO `product` VALUES ('UA2BTCL', 'UA2', '', NULL, NULL, '', '', NULL);
INSERT INTO `product` VALUES ('UA2GTSG', 'UA2', '', NULL, NULL, '', '', NULL);
INSERT INTO `product` VALUES ('UA3BTCL', 'UA3', 'Ceylon large leaf te', 'Ceylon large leaf tea grown on the island of Ceylon with a delicate aroma and pleasant tart taste.', NULL, '', '', NULL);
INSERT INTO `product` VALUES ('UA3GTSG', 'UA3', 'Spicy green tea', 'Rolled green tea with cinnamon, anise, fennel, ginger, clove and pepper. When brewing, a drink with ', 2.30, '50 g', 'Green tea', '0');
INSERT INTO `product` VALUES ('USA1RTK', 'USA1', 'Keemun', 'Popular red tea. It has a characteristic taste, in which you can distinguish between dried fruits, w', 2.30, '50 g', 'Red tea', '0');
INSERT INTO `product` VALUES ('USA2RTX', 'USA2', 'Xiao Zhong', 'One of the most famous red teas. The aroma of the tea is reminiscent of dried fruit and flower honey', 2.00, '50 g', 'Red tea', '0');
INSERT INTO `product` VALUES ('JP1MTA', 'JP1', 'Aoarashi', 'An excellent everyday tea with the aroma of fresh herbs, light tart and balanced taste.', 5.00, '40 g', 'Matcha tea', '0');
INSERT INTO `product` VALUES ('JP2MTI', 'JP2', 'Isuzu', 'One of the entry-level ceremonial teas.', 7.00, '40 g', 'Matcha tea', '0');
INSERT INTO `product` VALUES ('JP3WTSN', 'JP3', 'Silver needles', 'For the production of this white tea, delicate, covered with silvery-white villi, young buds are use', 6.00, '50 g', 'White tea', '0');

-- ----------------------------
-- Table structure for provider
-- ----------------------------
DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider`  (
  `id_provider` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name_provider` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `provider_country` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `provider_region` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `provider_city` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_product` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_price` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id_provider`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of provider
-- ----------------------------

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `id_store` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name_store` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `country` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `region` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `city` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `street` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `number` int NOT NULL,
  PRIMARY KEY (`id_store`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('UA1', 'RyuStores_Kharkiv', 'Ukraine', 'Kharkiv', 'Kharkiv', 'Sumska', 135);
INSERT INTO `store` VALUES ('UA2', 'RyuStores_Kiyv', 'Ukraine', 'Kiyv', 'Kiyv', 'Khreshchatyk', 26);
INSERT INTO `store` VALUES ('UA3', 'RyuStores_Lviv', 'Ukraine', 'Lviv', 'Lviv', 'Freedom Avenue', 82);
INSERT INTO `store` VALUES ('USA1', 'RyuStores_LosAngeles', 'United States of America', 'California', 'LosAngeles', 'Ocean Avenue', 57);
INSERT INTO `store` VALUES ('JP1', 'RyuStores_Tokyo', 'Japan', 'Tokyo', 'Tokyo', 'Ginza', 73);
INSERT INTO `store` VALUES ('JP2', 'RyuStores_Kyoto', 'Japan', 'Kyoto', 'Kyoto', 'ShiokoujiDori', 31);
INSERT INTO `store` VALUES ('JP3', 'RyuStores_Osaka', 'Japan', 'Osaka', 'Osaka', 'Dotonbori', 21);

-- ----------------------------
-- Table structure for store_workers
-- ----------------------------
DROP TABLE IF EXISTS `store_workers`;
CREATE TABLE `store_workers`  (
  `id_worker` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_store` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `position` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `surname` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `patronymic` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `monthly_salary` decimal(10, 2) NOT NULL,
  `date_of_birth` date NOT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`id_worker`) USING BTREE,
  INDEX `fk_store_workers_store_1`(`id_store`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store_workers
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
