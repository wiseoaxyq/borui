/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : borui

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 07/06/2023 01:52:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for borui_hot_product
-- ----------------------------
DROP TABLE IF EXISTS `borui_hot_product`;
CREATE TABLE `borui_hot_product`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `invCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '产品编码',
  `hotPic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '热销图片',
  PRIMARY KEY (`id`, `invCode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borui_hot_product
-- ----------------------------
INSERT INTO `borui_hot_product` VALUES (1, '1040000001', './src/assets/img/hot_product.png');
INSERT INTO `borui_hot_product` VALUES (2, '1040000002', './src/assets/img/hot_product.png');
INSERT INTO `borui_hot_product` VALUES (3, '1040000003', './src/assets/img/hot_product.png');

-- ----------------------------
-- Table structure for borui_message_board
-- ----------------------------
DROP TABLE IF EXISTS `borui_message_board`;
CREATE TABLE `borui_message_board`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borui_message_board
-- ----------------------------
INSERT INTO `borui_message_board` VALUES (1, 'joy', '110', 'joy@mail.com', '111', 'test message');
INSERT INTO `borui_message_board` VALUES (2, '1', '1', '1', '11', '11');
INSERT INTO `borui_message_board` VALUES (3, 'Sakura', '120', 'sakura@mail.com', 'China', 'No2. test message');
INSERT INTO `borui_message_board` VALUES (4, '', '', 'dfdf', '', '');
INSERT INTO `borui_message_board` VALUES (5, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for borui_news
-- ----------------------------
DROP TABLE IF EXISTS `borui_news`;
CREATE TABLE `borui_news`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `newTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `newInfo` json NULL COMMENT '内容',
  `newPic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `newTags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类别',
  `newDate` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  `person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上传人',
  `isDel` int(0) NOT NULL COMMENT '是否生效（0无效，1有效）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borui_news
-- ----------------------------
INSERT INTO `borui_news` VALUES (1, '视觉点胶机应用服装辅料如何快速高效率操作？', '{\"info\": \"​视觉点胶机应用服装辅料如何快速高效率操作？大家知道在工业上，很多人工无法精确做的事情，自动点胶机就可以做到。而全自动视觉点胶机因为其精准的点胶效果，更是经常运用于细小精确的点胶产品，如电子产品、服装饰品、家电用品等点胶。\", \"info2\": \"今天我们专门来说说全自动视觉点胶机在服装拉链上的点胶，拉链点胶其实主要的不是精度，而是点胶覆盖的效果，因为拉链上有层薄漆，需要有防刮效果的针头，避免刮破拉链，并且要求覆盖均匀。\", \"info3\": \"如果只是使用普通的点胶机，很难去完成拉链点胶。考虑到了这些问题，特地选用BR-915高速喷射阀，这个专门用于长拉链的点胶阀门，能够高速精确的对拉链进行喷射覆盖。能够满足市面上普遍的拉链产品，如果您有需要，可以拨打我们的电话进行咨询。\"}', './src/assets/img/home_do.jpg', '新闻资讯', '2023-05-29 11:21:42', 'test', 1);
INSERT INTO `borui_news` VALUES (2, '视觉点胶机应用服装辅料如何快速高效率操作？', '{\"info\": \"​视觉点胶机应用服装辅料如何快速高效率操作？大家知道在工业上，很多人工无法精确做的事情，自动点胶机就可以做到。而全自动视觉点胶机因为其精准的点胶效果，更是经常运用于细小精确的点胶产品，如电子产品、服装饰品、家电用品等点胶。\", \"info2\": \"今天我们专门来说说全自动视觉点胶机在服装拉链上的点胶，拉链点胶其实主要的不是精度，而是点胶覆盖的效果，因为拉链上有层薄漆，需要有防刮效果的针头，避免刮破拉链，并且要求覆盖均匀。\", \"info3\": \"如果只是使用普通的点胶机，很难去完成拉链点胶。考虑到了这些问题，特地选用BR-915高速喷射阀，这个专门用于长拉链的点胶阀门，能够高速精确的对拉链进行喷射覆盖。能够满足市面上普遍的拉链产品，如果您有需要，可以拨打我们的电话进行咨询。\"}', './src/assets/img/home_do.jpg', '新闻资讯', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES (3, '视觉点胶机应用服装辅料如何快速高效率操作？', '{\"info\": \"​视觉点胶机应用服装辅料如何快速高效率操作？大家知道在工业上，很多人工无法精确做的事情，自动点胶机就可以做到。而全自动视觉点胶机因为其精准的点胶效果，更是经常运用于细小精确的点胶产品，如电子产品、服装饰品、家电用品等点胶。\", \"info2\": \"今天我们专门来说说全自动视觉点胶机在服装拉链上的点胶，拉链点胶其实主要的不是精度，而是点胶覆盖的效果，因为拉链上有层薄漆，需要有防刮效果的针头，避免刮破拉链，并且要求覆盖均匀。\", \"info3\": \"如果只是使用普通的点胶机，很难去完成拉链点胶。考虑到了这些问题，特地选用BR-915高速喷射阀，这个专门用于长拉链的点胶阀门，能够高速精确的对拉链进行喷射覆盖。能够满足市面上普遍的拉链产品，如果您有需要，可以拨打我们的电话进行咨询。\"}', './src/assets/img/home_do.jpg', '新闻资讯', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES (4, '视觉点胶机应用服装', '{\"info\": \"​视觉点胶机应用服装辅料如何快速高效率操作？大家知道在工业上，很多人工无法精确做的事情，自动点胶机就可以做到。而全自动视觉点胶机因为其精准的点胶效果，更是经常运用于细小精确的点胶产品，如电子产品、服装饰品、家电用品等点胶。\", \"info2\": \"今天我们专门来说说全自动视觉点胶机在服装拉链上的点胶，拉链点胶其实主要的不是精度，而是点胶覆盖的效果，因为拉链上有层薄漆，需要有防刮效果的针头，避免刮破拉链，并且要求覆盖均匀。\", \"info3\": \"如果只是使用普通的点胶机，很难去完成拉链点胶。考虑到了这些问题，特地选用BR-915高速喷射阀，这个专门用于长拉链的点胶阀门，能够高速精确的对拉链进行喷射覆盖。能够满足市面上普遍的拉链产品，如果您有需要，可以拨打我们的电话进行咨询。\"}', './src/assets/img/home_do.jpg', '新闻资讯', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES (5, '视觉点胶机应用服装', '{\"info\": \"​视觉点胶机应用服装辅料如何快速高效率操作？大家知道在工业上，很多人工无法精确做的事情，自动点胶机就可以做到。而全自动视觉点胶机因为其精准的点胶效果，更是经常运用于细小精确的点胶产品，如电子产品、服装饰品、家电用品等点胶。\", \"info2\": \"今天我们专门来说说全自动视觉点胶机在服装拉链上的点胶，拉链点胶其实主要的不是精度，而是点胶覆盖的效果，因为拉链上有层薄漆，需要有防刮效果的针头，避免刮破拉链，并且要求覆盖均匀。\", \"info3\": \"如果只是使用普通的点胶机，很难去完成拉链点胶。考虑到了这些问题，特地选用BR-915高速喷射阀，这个专门用于长拉链的点胶阀门，能够高速精确的对拉链进行喷射覆盖。能够满足市面上普遍的拉链产品，如果您有需要，可以拨打我们的电话进行咨询。\"}', './src/assets/img/home_do.jpg', '新闻资讯', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES (6, '视觉点胶机应用服装', '{\"info\": \"​视觉点胶机应用服装辅料如何快速高效率操作？大家知道在工业上，很多人工无法精确做的事情，自动点胶机就可以做到。而全自动视觉点胶机因为其精准的点胶效果，更是经常运用于细小精确的点胶产品，如电子产品、服装饰品、家电用品等点胶。\", \"info2\": \"今天我们专门来说说全自动视觉点胶机在服装拉链上的点胶，拉链点胶其实主要的不是精度，而是点胶覆盖的效果，因为拉链上有层薄漆，需要有防刮效果的针头，避免刮破拉链，并且要求覆盖均匀。\", \"info3\": \"如果只是使用普通的点胶机，很难去完成拉链点胶。考虑到了这些问题，特地选用BR-915高速喷射阀，这个专门用于长拉链的点胶阀门，能够高速精确的对拉链进行喷射覆盖。能够满足市面上普遍的拉链产品，如果您有需要，可以拨打我们的电话进行咨询。\"}', './src/assets/img/home_do.jpg', '新闻资讯', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES (7, '视觉点胶机应用服装', '{\"info\": \"​视觉点胶机应用服装辅料如何快速高效率操作？大家知道在工业上，很多人工无法精确做的事情，自动点胶机就可以做到。而全自动视觉点胶机因为其精准的点胶效果，更是经常运用于细小精确的点胶产品，如电子产品、服装饰品、家电用品等点胶。\", \"info2\": \"今天我们专门来说说全自动视觉点胶机在服装拉链上的点胶，拉链点胶其实主要的不是精度，而是点胶覆盖的效果，因为拉链上有层薄漆，需要有防刮效果的针头，避免刮破拉链，并且要求覆盖均匀。\", \"info3\": \"如果只是使用普通的点胶机，很难去完成拉链点胶。考虑到了这些问题，特地选用BR-915高速喷射阀，这个专门用于长拉链的点胶阀门，能够高速精确的对拉链进行喷射覆盖。能够满足市面上普遍的拉链产品，如果您有需要，可以拨打我们的电话进行咨询。\"}', './src/assets/img/home_do.jpg', '新闻资讯', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES (8, '视觉点胶机应用', '{\"info\": \"​视觉点胶机应用服装辅料如何快速高效率操作？大家知道在工业上，很多人工无法精确做的事情，自动点胶机就可以做到。而全自动视觉点胶机因为其精准的点胶效果，更是经常运用于细小精确的点胶产品，如电子产品、服装饰品、家电用品等点胶。\", \"info2\": \"今天我们专门来说说全自动视觉点胶机在服装拉链上的点胶，拉链点胶其实主要的不是精度，而是点胶覆盖的效果，因为拉链上有层薄漆，需要有防刮效果的针头，避免刮破拉链，并且要求覆盖均匀。\", \"info3\": \"如果只是使用普通的点胶机，很难去完成拉链点胶。考虑到了这些问题，特地选用BR-915高速喷射阀，这个专门用于长拉链的点胶阀门，能够高速精确的对拉链进行喷射覆盖。能够满足市面上普遍的拉链产品，如果您有需要，可以拨打我们的电话进行咨询。\"}', './src/assets/img/home_do.jpg', '新闻资讯', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES (9, '视觉点胶机应用', '{\"info\": \"​视觉点胶机应用服装辅料如何快速高效率操作？大家知道在工业上，很多人工无法精确做的事情，自动点胶机就可以做到。而全自动视觉点胶机因为其精准的点胶效果，更是经常运用于细小精确的点胶产品，如电子产品、服装饰品、家电用品等点胶。\", \"info2\": \"今天我们专门来说说全自动视觉点胶机在服装拉链上的点胶，拉链点胶其实主要的不是精度，而是点胶覆盖的效果，因为拉链上有层薄漆，需要有防刮效果的针头，避免刮破拉链，并且要求覆盖均匀。\", \"info3\": \"如果只是使用普通的点胶机，很难去完成拉链点胶。考虑到了这些问题，特地选用BR-915高速喷射阀，这个专门用于长拉链的点胶阀门，能够高速精确的对拉链进行喷射覆盖。能够满足市面上普遍的拉链产品，如果您有需要，可以拨打我们的电话进行咨询。\"}', './src/assets/img/home_do.jpg', '新闻资讯', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES (10, '视觉点胶机应用', '{\"info\": \"​视觉点胶机应用服装辅料如何快速高效率操作？大家知道在工业上，很多人工无法精确做的事情，自动点胶机就可以做到。而全自动视觉点胶机因为其精准的点胶效果，更是经常运用于细小精确的点胶产品，如电子产品、服装饰品、家电用品等点胶。\", \"info2\": \"今天我们专门来说说全自动视觉点胶机在服装拉链上的点胶，拉链点胶其实主要的不是精度，而是点胶覆盖的效果，因为拉链上有层薄漆，需要有防刮效果的针头，避免刮破拉链，并且要求覆盖均匀。\", \"info3\": \"如果只是使用普通的点胶机，很难去完成拉链点胶。考虑到了这些问题，特地选用BR-915高速喷射阀，这个专门用于长拉链的点胶阀门，能够高速精确的对拉链进行喷射覆盖。能够满足市面上普遍的拉链产品，如果您有需要，可以拨打我们的电话进行咨询。\"}', './src/assets/img/home_do.jpg', '行业动态', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES (11, '视觉点胶机应用', '{\"info\": \"​视觉点胶机应用服装辅料如何快速高效率操作？大家知道在工业上，很多人工无法精确做的事情，自动点胶机就可以做到。而全自动视觉点胶机因为其精准的点胶效果，更是经常运用于细小精确的点胶产品，如电子产品、服装饰品、家电用品等点胶。\", \"info2\": \"今天我们专门来说说全自动视觉点胶机在服装拉链上的点胶，拉链点胶其实主要的不是精度，而是点胶覆盖的效果，因为拉链上有层薄漆，需要有防刮效果的针头，避免刮破拉链，并且要求覆盖均匀。\", \"info3\": \"如果只是使用普通的点胶机，很难去完成拉链点胶。考虑到了这些问题，特地选用BR-915高速喷射阀，这个专门用于长拉链的点胶阀门，能够高速精确的对拉链进行喷射覆盖。能够满足市面上普遍的拉链产品，如果您有需要，可以拨打我们的电话进行咨询。\"}', './src/assets/img/home_do.jpg', '行业动态', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES (12, '视觉点胶机应用', '{\"info\": \"​视觉点胶机应用服装辅料如何快速高效率操作？大家知道在工业上，很多人工无法精确做的事情，自动点胶机就可以做到。而全自动视觉点胶机因为其精准的点胶效果，更是经常运用于细小精确的点胶产品，如电子产品、服装饰品、家电用品等点胶。\", \"info2\": \"今天我们专门来说说全自动视觉点胶机在服装拉链上的点胶，拉链点胶其实主要的不是精度，而是点胶覆盖的效果，因为拉链上有层薄漆，需要有防刮效果的针头，避免刮破拉链，并且要求覆盖均匀。\", \"info3\": \"如果只是使用普通的点胶机，很难去完成拉链点胶。考虑到了这些问题，特地选用BR-915高速喷射阀，这个专门用于长拉链的点胶阀门，能够高速精确的对拉链进行喷射覆盖。能够满足市面上普遍的拉链产品，如果您有需要，可以拨打我们的电话进行咨询。\"}', './src/assets/img/home_do.jpg', '行业动态', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES (13, '视觉点胶机应用', '{\"info\": \"​视觉点胶机应用服装辅料如何快速高效率操作？大家知道在工业上，很多人工无法精确做的事情，自动点胶机就可以做到。而全自动视觉点胶机因为其精准的点胶效果，更是经常运用于细小精确的点胶产品，如电子产品、服装饰品、家电用品等点胶。\", \"info2\": \"今天我们专门来说说全自动视觉点胶机在服装拉链上的点胶，拉链点胶其实主要的不是精度，而是点胶覆盖的效果，因为拉链上有层薄漆，需要有防刮效果的针头，避免刮破拉链，并且要求覆盖均匀。\", \"info3\": \"如果只是使用普通的点胶机，很难去完成拉链点胶。考虑到了这些问题，特地选用BR-915高速喷射阀，这个专门用于长拉链的点胶阀门，能够高速精确的对拉链进行喷射覆盖。能够满足市面上普遍的拉链产品，如果您有需要，可以拨打我们的电话进行咨询。\"}', './src/assets/img/home_do.jpg', '行业动态', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES (14, '视觉点胶机应用', '{\"info\": \"​视觉点胶机应用服装辅料如何快速高效率操作？大家知道在工业上，很多人工无法精确做的事情，自动点胶机就可以做到。而全自动视觉点胶机因为其精准的点胶效果，更是经常运用于细小精确的点胶产品，如电子产品、服装饰品、家电用品等点胶。\", \"info2\": \"今天我们专门来说说全自动视觉点胶机在服装拉链上的点胶，拉链点胶其实主要的不是精度，而是点胶覆盖的效果，因为拉链上有层薄漆，需要有防刮效果的针头，避免刮破拉链，并且要求覆盖均匀。\", \"info3\": \"如果只是使用普通的点胶机，很难去完成拉链点胶。考虑到了这些问题，特地选用BR-915高速喷射阀，这个专门用于长拉链的点胶阀门，能够高速精确的对拉链进行喷射覆盖。能够满足市面上普遍的拉链产品，如果您有需要，可以拨打我们的电话进行咨询。\"}', './src/assets/img/home_do.jpg', '行业动态', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES (15, '视觉点胶机应用', '{\"info\": \"​视觉点胶机应用服装辅料如何快速高效率操作？大家知道在工业上，很多人工无法精确做的事情，自动点胶机就可以做到。而全自动视觉点胶机因为其精准的点胶效果，更是经常运用于细小精确的点胶产品，如电子产品、服装饰品、家电用品等点胶。\", \"info2\": \"今天我们专门来说说全自动视觉点胶机在服装拉链上的点胶，拉链点胶其实主要的不是精度，而是点胶覆盖的效果，因为拉链上有层薄漆，需要有防刮效果的针头，避免刮破拉链，并且要求覆盖均匀。\", \"info3\": \"如果只是使用普通的点胶机，很难去完成拉链点胶。考虑到了这些问题，特地选用BR-915高速喷射阀，这个专门用于长拉链的点胶阀门，能够高速精确的对拉链进行喷射覆盖。能够满足市面上普遍的拉链产品，如果您有需要，可以拨打我们的电话进行咨询。\"}', './src/assets/img/home_do.jpg', '行业动态', '2023-05-29 11:26:55', 'test', 1);

-- ----------------------------
-- Table structure for borui_product_filterlist
-- ----------------------------
DROP TABLE IF EXISTS `borui_product_filterlist`;
CREATE TABLE `borui_product_filterlist`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `filterId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类id',
  `filterName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
  `filterNote` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '1：一级分类，2：二级分类',
  `filterFather` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上级分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borui_product_filterlist
-- ----------------------------
INSERT INTO `borui_product_filterlist` VALUES (1, '101', '全自动点胶点漆机', '1', NULL);
INSERT INTO `borui_product_filterlist` VALUES (2, '102', '双工位视觉点胶点漆机', '2', '101');
INSERT INTO `borui_product_filterlist` VALUES (3, '103', '单工位视觉点胶点漆机', '2', '101');
INSERT INTO `borui_product_filterlist` VALUES (4, '104', '落地式双Y点胶点漆机', '2', '101');
INSERT INTO `borui_product_filterlist` VALUES (5, '105', '桌面式点胶点漆机', '2', '101');
INSERT INTO `borui_product_filterlist` VALUES (6, '106', '在线式全自动视觉点胶点漆机', '2', '101');
INSERT INTO `borui_product_filterlist` VALUES (7, '201', '全自动视觉点钻贴片机', '1', NULL);
INSERT INTO `borui_product_filterlist` VALUES (8, '202', '双工位多头视觉点钻贴片机', '2', '201');
INSERT INTO `borui_product_filterlist` VALUES (9, '203', '在线式视觉点钻贴片机', '2', '201');
INSERT INTO `borui_product_filterlist` VALUES (10, '301', '全自动食品裱花机', '1', NULL);
INSERT INTO `borui_product_filterlist` VALUES (11, '302', '双工位视觉食品裱花机', '2', '301');
INSERT INTO `borui_product_filterlist` VALUES (12, '303', '单工位视觉食品裱花机', '2', '301');
INSERT INTO `borui_product_filterlist` VALUES (13, '304', '全自动3D旋转浇注机', '2', '301');
INSERT INTO `borui_product_filterlist` VALUES (14, '305', '全自动多头食品浇注机', '2', '301');

-- ----------------------------
-- Table structure for borui_productlist
-- ----------------------------
DROP TABLE IF EXISTS `borui_productlist`;
CREATE TABLE `borui_productlist`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `invCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '产品编码',
  `invName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '产品名称',
  `invStd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格型号',
  `invInfo` json NULL COMMENT '产品介绍',
  `invPic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品图片',
  `invTags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '一级分类',
  `invTags2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '二级分类',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `isDel` int(0) NOT NULL COMMENT '是否生效（0无效，1有效）',
  `caseTags` json NULL COMMENT '相关行业',
  PRIMARY KEY (`id`, `invCode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borui_productlist
-- ----------------------------
INSERT INTO `borui_productlist` VALUES (1, '1040000001', '视觉点胶机', '全自动_CCD', '{\"pic\": \"./src/assets/img/product.png\", \"info\": \"柏锐机器，产品介绍...\"}', './src/assets/img/product/1011.png', '101', '102', NULL, 1, '[\"3c\", \"hardware\", \"newEnergy\"]');
INSERT INTO `borui_productlist` VALUES (2, '1040000002', '滴胶机器', '环氧水晶_AB_双液', '{\"pic\": \"./src/assets/img/product.png\", \"info\": \"柏锐机器，产品介绍...\"}', './src/assets/img/product/1012.png', '101', '103', NULL, 1, '[\"3c\", \"solutions\", \"newEnergy\"]');
INSERT INTO `borui_productlist` VALUES (3, '1040000003', '全自动视觉点胶机', NULL, '{\"pic\": \"./src/assets/img/product.png\", \"info\": \"柏锐机器，产品介绍...\"}', './src/assets/img/product/1013.png', '101', '104', NULL, 1, '[\"hardware\", \"solutions\", \"newEnergy\"]');
INSERT INTO `borui_productlist` VALUES (4, '1040000004', '视觉点胶机', NULL, '{\"pic\": \"./src/assets/img/product.png\", \"info\": \"柏锐机器，产品介绍...\"}', './src/assets/img/product/1014.png', '101', '105', NULL, 1, '[\"3c\", \"hardware\", \"solutions\", \"newEnergy\"]');
INSERT INTO `borui_productlist` VALUES (5, '1040000005', '点钻机器人', NULL, '{\"pic\": \"./src/assets/img/product.png\", \"info\": \"柏锐机器，产品介绍...\"}', './src/assets/img/product/2011.png', '201', '202', NULL, 1, '[\"3c\", \"hardware\", \"newEnergy\"]');
INSERT INTO `borui_productlist` VALUES (6, '1040000006', '五金饰品镶嵌机', NULL, '{\"pic\": \"./src/assets/img/product.png\", \"info\": \"柏锐机器，产品介绍...\"}', './src/assets/img/product/2012.png', '201', '203', NULL, 1, '[\"hardware\", \"solutions\"]');
INSERT INTO `borui_productlist` VALUES (8, '1040000008', '不锈钢双工裱花机', NULL, '{\"pic\": \"./src/assets/img/product.png\", \"info\": \"柏锐机器，产品介绍...\"}', './src/assets/img/product/3011.png', '301', '302', NULL, 1, '[\"food\"]');
INSERT INTO `borui_productlist` VALUES (9, '1040000009', '单工位裱花机', NULL, '{\"pic\": \"./src/assets/img/product.png\", \"info\": \"柏锐机器，产品介绍...\"}', './src/assets/img/product/3012.png', '301', '303', NULL, 1, '[\"food\"]');
INSERT INTO `borui_productlist` VALUES (10, '1040000010', '流水线', NULL, '{\"pic\": \"./src/assets/img/product.png\", \"info\": \"柏锐机器，产品介绍...\"}', './src/assets/img/product/3013.png', '301', '304', NULL, 1, '[\"food\"]');
INSERT INTO `borui_productlist` VALUES (11, '1040000011', '碳钢双工位裱花机', NULL, '{\"pic\": \"./src/assets/img/product.png\", \"info\": \"柏锐机器，产品介绍...\"}', './src/assets/img/product/3014.png', '301', '305', NULL, 1, '[\"food\"]');

-- ----------------------------
-- Table structure for borui_user
-- ----------------------------
DROP TABLE IF EXISTS `borui_user`;
CREATE TABLE `borui_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borui_user
-- ----------------------------
INSERT INTO `borui_user` VALUES (1, '管理员', 'admin', 'password', 'sa', NULL);

SET FOREIGN_KEY_CHECKS = 1;
