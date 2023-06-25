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

 Date: 25/06/2023 16:46:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for borui_banner
-- ----------------------------
DROP TABLE IF EXISTS `borui_banner`;
CREATE TABLE `borui_banner`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'banner图片',
  `filter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borui_banner
-- ----------------------------
INSERT INTO `borui_banner` VALUES ('1', 'http://www.borui1698.com/uploadfile/image/20220524/20220524141027_670735165.jpg', 'index', '全自动视觉点胶机');
INSERT INTO `borui_banner` VALUES ('2', 'http://www.borui1698.com/uploadfile/image/20220524/20220524141038_2087688612.jpg', 'index', '全自动视觉点钻机');
INSERT INTO `borui_banner` VALUES ('3', 'http://www.borui1698.com/uploadfile/image/20220524/20220524141058_502257188.jpg', 'index', '食品级裱花机');
INSERT INTO `borui_banner` VALUES ('4', 'http://www.borui1698.com/uploadfile/image/20220524/20220524141027_670735165.jpg', 'product', '全自动视觉点胶机');
INSERT INTO `borui_banner` VALUES ('5', 'http://www.borui1698.com/uploadfile/image/20220524/20220524141038_2087688612.jpg', 'product', '全自动视觉点钻机');
INSERT INTO `borui_banner` VALUES ('6', 'http://www.borui1698.com/uploadfile/image/20220524/20220524141058_502257188.jpg', 'product', '食品级裱花机');

-- ----------------------------
-- Table structure for borui_casebanner
-- ----------------------------
DROP TABLE IF EXISTS `borui_casebanner`;
CREATE TABLE `borui_casebanner`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'banner图片',
  `titleZh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `titleEn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `filter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borui_casebanner
-- ----------------------------
INSERT INTO `borui_casebanner` VALUES ('1', 'http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg', '食品行业解决方案', 'Food Industry Solutions', 'food', '测试');
INSERT INTO `borui_casebanner` VALUES ('2', 'http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg', '3C电子行业解决方案', '3C Electronics Industry Solutions', '3c', NULL);
INSERT INTO `borui_casebanner` VALUES ('3', 'http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg', '五金行业解决方案', 'Hardware Industry Solutions', 'hardware', NULL);
INSERT INTO `borui_casebanner` VALUES ('4', 'http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg', '包装印刷行业解决方案', 'Solutions for the Packaging and Printing Industry', 'solutions', NULL);
INSERT INTO `borui_casebanner` VALUES ('5', 'http://www.borui1698.com/uploadfile/image/20210930/20210930101938_839942849.jpg', '新能源行业解决方案', 'New Energy Industry Solutions', 'newEnergy', NULL);

-- ----------------------------
-- Table structure for borui_download
-- ----------------------------
DROP TABLE IF EXISTS `borui_download`;
CREATE TABLE `borui_download`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '唯一标识',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路径',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '上传日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borui_download
-- ----------------------------
INSERT INTO `borui_download` VALUES ('1', '测试文件', './tmp/my-files/柏锐官网.pdf', '测试用', '2023-06-19 15:31:12');
INSERT INTO `borui_download` VALUES ('5Nc25zL4vpdgHbGDwvfSQ', '33', './tmp/my-files/6a2688974406f615959009334078be0a.pdf', '33', '2023-06-19 17:14:10');
INSERT INTO `borui_download` VALUES ('hY9qWVULGxFFP6tP5Q485', '11', './tmp/my-files/9689778b4a9060661c7fb35ba9c545bb.pdf', '11', '2023-06-19 17:13:38');
INSERT INTO `borui_download` VALUES ('piTa1E1HsI4LjU_Gqg5kB', '55', './tmp/my-files/50480fe3dd53b817d6b6e6b9eb99bf69.pdf', '555', '2023-06-25 16:40:34');
INSERT INTO `borui_download` VALUES ('TGuZlHf4i7eQ2_8kJiGUI', '22', './tmp/my-files/3a664d55bde44ae8bf0c2d6d1234781b.pdf', '22', '2023-06-19 17:13:59');
INSERT INTO `borui_download` VALUES ('y80MBa7DyMtyw5V2iK54T', '44', './tmp/my-files/d137580a0d3e4f64f47189954ace4f9c.pdf', '44', '2023-06-19 17:14:58');

-- ----------------------------
-- Table structure for borui_hot_product
-- ----------------------------
DROP TABLE IF EXISTS `borui_hot_product`;
CREATE TABLE `borui_hot_product`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `invCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '产品编码',
  `hotPic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '热销图片',
  PRIMARY KEY (`id`, `invCode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '留言时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borui_message_board
-- ----------------------------
INSERT INTO `borui_message_board` VALUES (1, 'joy', '110', 'joy@mail.com', '111', 'test message', '2023-06-15 18:50:23');
INSERT INTO `borui_message_board` VALUES (2, '1', '1', '1', '11', '11', '2023-06-15 18:50:25');
INSERT INTO `borui_message_board` VALUES (3, 'Sakura', '120', 'sakura@mail.com', 'China', 'No2. test message', '2023-06-14 18:50:29');
INSERT INTO `borui_message_board` VALUES (6, '测试用户', '13711111111', '110@qq.com', '', '测试测试', '2023-06-25 16:38:14');
INSERT INTO `borui_message_board` VALUES (7, '测试2', '13711111110', 'qawsed@163.com', '', '123', '2023-06-25 16:38:16');
INSERT INTO `borui_message_board` VALUES (8, '123', '18911111111', '110@gh.com', '', '测试', '2023-06-25 16:38:19');
INSERT INTO `borui_message_board` VALUES (9, 'Amy', '13547679076', 'qasfefe@163.com', '', '测试内容\n测试', '2023-06-25 16:38:21');
INSERT INTO `borui_message_board` VALUES (10, 'test342234', '13432123456', '117678568@qq.com', NULL, '测试测试\n测试ce\n测试', '2023-06-25 16:38:24');
INSERT INTO `borui_message_board` VALUES (11, '特色及', '13456797897', '1198793459@qq.com', '', '测试\n测试\n测试cehjfesjcio \n分解哦书法家\n', '2023-06-25 16:38:00');

-- ----------------------------
-- Table structure for borui_news
-- ----------------------------
DROP TABLE IF EXISTS `borui_news`;
CREATE TABLE `borui_news`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '唯一标识',
  `newTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `newPic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `newInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `newTags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类别',
  `newDate` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  `person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上传人',
  `isDel` int(0) NOT NULL COMMENT '是否生效（0无效，1有效）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borui_news
-- ----------------------------
INSERT INTO `borui_news` VALUES ('1', '视觉点胶机应用服装辅料如何快速高效率操作？', './src/assets/img/home_do.jpg', '导致堵塞的原因当然是很多的，比如有的时候可能是管线或者是接口处出现了堵塞现象，一般都是上一次下班的时候没有清理掉参与胶量，从而使得其凝固发生堵塞，解决的方式就是将胶桶清空，然后清洁干净重新上胶，堵塞解除便可继续操作了。\r\n\r\n滴胶机不出胶第二个重要的原因就可能是里面的电机出现了卡死的现象，这个机器里面会使用到电机作为驱动，随着电机使用的时间越来越长，那么电机有可能会因为高符合的原因而出现卡死的情况，这个时候要检查一下机器上面有没有报警提示？\r\n\r\n如果报警提示已经明确指出是电机方面的原因引起的，那么就应该把机器关闭掉，然后将电机进行检查维修，电机恢复正常之后不出胶的现象自然就得到了解决。\r\n\r\n运行的过程当中不出胶还有可能是针头出了问题，比如在本身压力就不是很大的情况下，选择了很小的针头就会导致出胶的速度非常的慢，甚至有可能就不出胶。怎么这个时候就要重新更换一个口径更大一点的针头，从而让里面的胶能顺利的打出来。\r\n\r\n另外还有一个原因就是胶本身出了问题，比如说有些胶必须要在一定的低温环境之下保存，如果说停电导致胶没有在低温环境下保存，那么这个胶很快就会凝固，那么在里面肯定就是打不出来的，在这种情况之下就需要联系胶的供应商重新调换胶了，购买回来的胶放置于冰柜中低温存储，避免凝固导致无法使用。', '新闻资讯', '2023-05-29 11:21:42', 'test', 1);
INSERT INTO `borui_news` VALUES ('10', '视觉点胶机应用', './src/assets/img/home_do.jpg', '导致堵塞的原因当然是很多的，比如有的时候可能是管线或者是接口处出现了堵塞现象，一般都是上一次下班的时候没有清理掉参与胶量，从而使得其凝固发生堵塞，解决的方式就是将胶桶清空，然后清洁干净重新上胶，堵塞解除便可继续操作了。\r\n\r\n滴胶机不出胶第二个重要的原因就可能是里面的电机出现了卡死的现象，这个机器里面会使用到电机作为驱动，随着电机使用的时间越来越长，那么电机有可能会因为高符合的原因而出现卡死的情况，这个时候要检查一下机器上面有没有报警提示？\r\n\r\n如果报警提示已经明确指出是电机方面的原因引起的，那么就应该把机器关闭掉，然后将电机进行检查维修，电机恢复正常之后不出胶的现象自然就得到了解决。\r\n\r\n运行的过程当中不出胶还有可能是针头出了问题，比如在本身压力就不是很大的情况下，选择了很小的针头就会导致出胶的速度非常的慢，甚至有可能就不出胶。怎么这个时候就要重新更换一个口径更大一点的针头，从而让里面的胶能顺利的打出来。\r\n\r\n另外还有一个原因就是胶本身出了问题，比如说有些胶必须要在一定的低温环境之下保存，如果说停电导致胶没有在低温环境下保存，那么这个胶很快就会凝固，那么在里面肯定就是打不出来的，在这种情况之下就需要联系胶的供应商重新调换胶了，购买回来的胶放置于冰柜中低温存储，避免凝固导致无法使用。', '行业动态', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES ('11', '视觉点胶机应用', './src/assets/img/home_do.jpg', '导致堵塞的原因当然是很多的，比如有的时候可能是管线或者是接口处出现了堵塞现象，一般都是上一次下班的时候没有清理掉参与胶量，从而使得其凝固发生堵塞，解决的方式就是将胶桶清空，然后清洁干净重新上胶，堵塞解除便可继续操作了。\r\n\r\n滴胶机不出胶第二个重要的原因就可能是里面的电机出现了卡死的现象，这个机器里面会使用到电机作为驱动，随着电机使用的时间越来越长，那么电机有可能会因为高符合的原因而出现卡死的情况，这个时候要检查一下机器上面有没有报警提示？\r\n\r\n如果报警提示已经明确指出是电机方面的原因引起的，那么就应该把机器关闭掉，然后将电机进行检查维修，电机恢复正常之后不出胶的现象自然就得到了解决。\r\n\r\n运行的过程当中不出胶还有可能是针头出了问题，比如在本身压力就不是很大的情况下，选择了很小的针头就会导致出胶的速度非常的慢，甚至有可能就不出胶。怎么这个时候就要重新更换一个口径更大一点的针头，从而让里面的胶能顺利的打出来。\r\n\r\n另外还有一个原因就是胶本身出了问题，比如说有些胶必须要在一定的低温环境之下保存，如果说停电导致胶没有在低温环境下保存，那么这个胶很快就会凝固，那么在里面肯定就是打不出来的，在这种情况之下就需要联系胶的供应商重新调换胶了，购买回来的胶放置于冰柜中低温存储，避免凝固导致无法使用。', '行业动态', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES ('12', '视觉点胶机应用', './src/assets/img/home_do.jpg', '导致堵塞的原因当然是很多的，比如有的时候可能是管线或者是接口处出现了堵塞现象，一般都是上一次下班的时候没有清理掉参与胶量，从而使得其凝固发生堵塞，解决的方式就是将胶桶清空，然后清洁干净重新上胶，堵塞解除便可继续操作了。\r\n\r\n滴胶机不出胶第二个重要的原因就可能是里面的电机出现了卡死的现象，这个机器里面会使用到电机作为驱动，随着电机使用的时间越来越长，那么电机有可能会因为高符合的原因而出现卡死的情况，这个时候要检查一下机器上面有没有报警提示？\r\n\r\n如果报警提示已经明确指出是电机方面的原因引起的，那么就应该把机器关闭掉，然后将电机进行检查维修，电机恢复正常之后不出胶的现象自然就得到了解决。\r\n\r\n运行的过程当中不出胶还有可能是针头出了问题，比如在本身压力就不是很大的情况下，选择了很小的针头就会导致出胶的速度非常的慢，甚至有可能就不出胶。怎么这个时候就要重新更换一个口径更大一点的针头，从而让里面的胶能顺利的打出来。\r\n\r\n另外还有一个原因就是胶本身出了问题，比如说有些胶必须要在一定的低温环境之下保存，如果说停电导致胶没有在低温环境下保存，那么这个胶很快就会凝固，那么在里面肯定就是打不出来的，在这种情况之下就需要联系胶的供应商重新调换胶了，购买回来的胶放置于冰柜中低温存储，避免凝固导致无法使用。', '行业动态', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES ('13', '视觉点胶机应用', './src/assets/img/home_do.jpg', '导致堵塞的原因当然是很多的，比如有的时候可能是管线或者是接口处出现了堵塞现象，一般都是上一次下班的时候没有清理掉参与胶量，从而使得其凝固发生堵塞，解决的方式就是将胶桶清空，然后清洁干净重新上胶，堵塞解除便可继续操作了。\r\n\r\n滴胶机不出胶第二个重要的原因就可能是里面的电机出现了卡死的现象，这个机器里面会使用到电机作为驱动，随着电机使用的时间越来越长，那么电机有可能会因为高符合的原因而出现卡死的情况，这个时候要检查一下机器上面有没有报警提示？\r\n\r\n如果报警提示已经明确指出是电机方面的原因引起的，那么就应该把机器关闭掉，然后将电机进行检查维修，电机恢复正常之后不出胶的现象自然就得到了解决。\r\n\r\n运行的过程当中不出胶还有可能是针头出了问题，比如在本身压力就不是很大的情况下，选择了很小的针头就会导致出胶的速度非常的慢，甚至有可能就不出胶。怎么这个时候就要重新更换一个口径更大一点的针头，从而让里面的胶能顺利的打出来。\r\n\r\n另外还有一个原因就是胶本身出了问题，比如说有些胶必须要在一定的低温环境之下保存，如果说停电导致胶没有在低温环境下保存，那么这个胶很快就会凝固，那么在里面肯定就是打不出来的，在这种情况之下就需要联系胶的供应商重新调换胶了，购买回来的胶放置于冰柜中低温存储，避免凝固导致无法使用。', '行业动态', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES ('14', '视觉点胶机应用', './src/assets/img/home_do.jpg', '导致堵塞的原因当然是很多的，比如有的时候可能是管线或者是接口处出现了堵塞现象，一般都是上一次下班的时候没有清理掉参与胶量，从而使得其凝固发生堵塞，解决的方式就是将胶桶清空，然后清洁干净重新上胶，堵塞解除便可继续操作了。\r\n\r\n滴胶机不出胶第二个重要的原因就可能是里面的电机出现了卡死的现象，这个机器里面会使用到电机作为驱动，随着电机使用的时间越来越长，那么电机有可能会因为高符合的原因而出现卡死的情况，这个时候要检查一下机器上面有没有报警提示？\r\n\r\n如果报警提示已经明确指出是电机方面的原因引起的，那么就应该把机器关闭掉，然后将电机进行检查维修，电机恢复正常之后不出胶的现象自然就得到了解决。\r\n\r\n运行的过程当中不出胶还有可能是针头出了问题，比如在本身压力就不是很大的情况下，选择了很小的针头就会导致出胶的速度非常的慢，甚至有可能就不出胶。怎么这个时候就要重新更换一个口径更大一点的针头，从而让里面的胶能顺利的打出来。\r\n\r\n另外还有一个原因就是胶本身出了问题，比如说有些胶必须要在一定的低温环境之下保存，如果说停电导致胶没有在低温环境下保存，那么这个胶很快就会凝固，那么在里面肯定就是打不出来的，在这种情况之下就需要联系胶的供应商重新调换胶了，购买回来的胶放置于冰柜中低温存储，避免凝固导致无法使用。', '行业动态', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES ('15', '视觉点胶机应用', './src/assets/img/home_do.jpg', '导致堵塞的原因当然是很多的，比如有的时候可能是管线或者是接口处出现了堵塞现象，一般都是上一次下班的时候没有清理掉参与胶量，从而使得其凝固发生堵塞，解决的方式就是将胶桶清空，然后清洁干净重新上胶，堵塞解除便可继续操作了。\r\n\r\n滴胶机不出胶第二个重要的原因就可能是里面的电机出现了卡死的现象，这个机器里面会使用到电机作为驱动，随着电机使用的时间越来越长，那么电机有可能会因为高符合的原因而出现卡死的情况，这个时候要检查一下机器上面有没有报警提示？\r\n\r\n如果报警提示已经明确指出是电机方面的原因引起的，那么就应该把机器关闭掉，然后将电机进行检查维修，电机恢复正常之后不出胶的现象自然就得到了解决。\r\n\r\n运行的过程当中不出胶还有可能是针头出了问题，比如在本身压力就不是很大的情况下，选择了很小的针头就会导致出胶的速度非常的慢，甚至有可能就不出胶。怎么这个时候就要重新更换一个口径更大一点的针头，从而让里面的胶能顺利的打出来。\r\n\r\n另外还有一个原因就是胶本身出了问题，比如说有些胶必须要在一定的低温环境之下保存，如果说停电导致胶没有在低温环境下保存，那么这个胶很快就会凝固，那么在里面肯定就是打不出来的，在这种情况之下就需要联系胶的供应商重新调换胶了，购买回来的胶放置于冰柜中低温存储，避免凝固导致无法使用。', '行业动态', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES ('2', '视觉点胶机应用服装辅料如何快速高效率操作？', './src/assets/img/home_do.jpg', '导致堵塞的原因当然是很多的，比如有的时候可能是管线或者是接口处出现了堵塞现象，一般都是上一次下班的时候没有清理掉参与胶量，从而使得其凝固发生堵塞，解决的方式就是将胶桶清空，然后清洁干净重新上胶，堵塞解除便可继续操作了。\r\n\r\n滴胶机不出胶第二个重要的原因就可能是里面的电机出现了卡死的现象，这个机器里面会使用到电机作为驱动，随着电机使用的时间越来越长，那么电机有可能会因为高符合的原因而出现卡死的情况，这个时候要检查一下机器上面有没有报警提示？\r\n\r\n如果报警提示已经明确指出是电机方面的原因引起的，那么就应该把机器关闭掉，然后将电机进行检查维修，电机恢复正常之后不出胶的现象自然就得到了解决。\r\n\r\n运行的过程当中不出胶还有可能是针头出了问题，比如在本身压力就不是很大的情况下，选择了很小的针头就会导致出胶的速度非常的慢，甚至有可能就不出胶。怎么这个时候就要重新更换一个口径更大一点的针头，从而让里面的胶能顺利的打出来。\r\n\r\n另外还有一个原因就是胶本身出了问题，比如说有些胶必须要在一定的低温环境之下保存，如果说停电导致胶没有在低温环境下保存，那么这个胶很快就会凝固，那么在里面肯定就是打不出来的，在这种情况之下就需要联系胶的供应商重新调换胶了，购买回来的胶放置于冰柜中低温存储，避免凝固导致无法使用。', '新闻资讯', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES ('3', '视觉点胶机应用服装辅料如何快速高效率操作？', './src/assets/img/home_do.jpg', '导致堵塞的原因当然是很多的，比如有的时候可能是管线或者是接口处出现了堵塞现象，一般都是上一次下班的时候没有清理掉参与胶量，从而使得其凝固发生堵塞，解决的方式就是将胶桶清空，然后清洁干净重新上胶，堵塞解除便可继续操作了。\r\n\r\n滴胶机不出胶第二个重要的原因就可能是里面的电机出现了卡死的现象，这个机器里面会使用到电机作为驱动，随着电机使用的时间越来越长，那么电机有可能会因为高符合的原因而出现卡死的情况，这个时候要检查一下机器上面有没有报警提示？\r\n\r\n如果报警提示已经明确指出是电机方面的原因引起的，那么就应该把机器关闭掉，然后将电机进行检查维修，电机恢复正常之后不出胶的现象自然就得到了解决。\r\n\r\n运行的过程当中不出胶还有可能是针头出了问题，比如在本身压力就不是很大的情况下，选择了很小的针头就会导致出胶的速度非常的慢，甚至有可能就不出胶。怎么这个时候就要重新更换一个口径更大一点的针头，从而让里面的胶能顺利的打出来。\r\n\r\n另外还有一个原因就是胶本身出了问题，比如说有些胶必须要在一定的低温环境之下保存，如果说停电导致胶没有在低温环境下保存，那么这个胶很快就会凝固，那么在里面肯定就是打不出来的，在这种情况之下就需要联系胶的供应商重新调换胶了，购买回来的胶放置于冰柜中低温存储，避免凝固导致无法使用。', '新闻资讯', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES ('4', '视觉点胶机应用服装', './src/assets/img/home_do.jpg', '导致堵塞的原因当然是很多的，比如有的时候可能是管线或者是接口处出现了堵塞现象，一般都是上一次下班的时候没有清理掉参与胶量，从而使得其凝固发生堵塞，解决的方式就是将胶桶清空，然后清洁干净重新上胶，堵塞解除便可继续操作了。\r\n\r\n滴胶机不出胶第二个重要的原因就可能是里面的电机出现了卡死的现象，这个机器里面会使用到电机作为驱动，随着电机使用的时间越来越长，那么电机有可能会因为高符合的原因而出现卡死的情况，这个时候要检查一下机器上面有没有报警提示？\r\n\r\n如果报警提示已经明确指出是电机方面的原因引起的，那么就应该把机器关闭掉，然后将电机进行检查维修，电机恢复正常之后不出胶的现象自然就得到了解决。\r\n\r\n运行的过程当中不出胶还有可能是针头出了问题，比如在本身压力就不是很大的情况下，选择了很小的针头就会导致出胶的速度非常的慢，甚至有可能就不出胶。怎么这个时候就要重新更换一个口径更大一点的针头，从而让里面的胶能顺利的打出来。\r\n\r\n另外还有一个原因就是胶本身出了问题，比如说有些胶必须要在一定的低温环境之下保存，如果说停电导致胶没有在低温环境下保存，那么这个胶很快就会凝固，那么在里面肯定就是打不出来的，在这种情况之下就需要联系胶的供应商重新调换胶了，购买回来的胶放置于冰柜中低温存储，避免凝固导致无法使用。', '新闻资讯', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES ('5', '视觉点胶机应用服装', './src/assets/img/home_do.jpg', '导致堵塞的原因当然是很多的，比如有的时候可能是管线或者是接口处出现了堵塞现象，一般都是上一次下班的时候没有清理掉参与胶量，从而使得其凝固发生堵塞，解决的方式就是将胶桶清空，然后清洁干净重新上胶，堵塞解除便可继续操作了。\r\n\r\n滴胶机不出胶第二个重要的原因就可能是里面的电机出现了卡死的现象，这个机器里面会使用到电机作为驱动，随着电机使用的时间越来越长，那么电机有可能会因为高符合的原因而出现卡死的情况，这个时候要检查一下机器上面有没有报警提示？\r\n\r\n如果报警提示已经明确指出是电机方面的原因引起的，那么就应该把机器关闭掉，然后将电机进行检查维修，电机恢复正常之后不出胶的现象自然就得到了解决。\r\n\r\n运行的过程当中不出胶还有可能是针头出了问题，比如在本身压力就不是很大的情况下，选择了很小的针头就会导致出胶的速度非常的慢，甚至有可能就不出胶。怎么这个时候就要重新更换一个口径更大一点的针头，从而让里面的胶能顺利的打出来。\r\n\r\n另外还有一个原因就是胶本身出了问题，比如说有些胶必须要在一定的低温环境之下保存，如果说停电导致胶没有在低温环境下保存，那么这个胶很快就会凝固，那么在里面肯定就是打不出来的，在这种情况之下就需要联系胶的供应商重新调换胶了，购买回来的胶放置于冰柜中低温存储，避免凝固导致无法使用。', '新闻资讯', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES ('6', '视觉点胶机应用服装', './src/assets/img/home_do.jpg', '导致堵塞的原因当然是很多的，比如有的时候可能是管线或者是接口处出现了堵塞现象，一般都是上一次下班的时候没有清理掉参与胶量，从而使得其凝固发生堵塞，解决的方式就是将胶桶清空，然后清洁干净重新上胶，堵塞解除便可继续操作了。\r\n\r\n滴胶机不出胶第二个重要的原因就可能是里面的电机出现了卡死的现象，这个机器里面会使用到电机作为驱动，随着电机使用的时间越来越长，那么电机有可能会因为高符合的原因而出现卡死的情况，这个时候要检查一下机器上面有没有报警提示？\r\n\r\n如果报警提示已经明确指出是电机方面的原因引起的，那么就应该把机器关闭掉，然后将电机进行检查维修，电机恢复正常之后不出胶的现象自然就得到了解决。\r\n\r\n运行的过程当中不出胶还有可能是针头出了问题，比如在本身压力就不是很大的情况下，选择了很小的针头就会导致出胶的速度非常的慢，甚至有可能就不出胶。怎么这个时候就要重新更换一个口径更大一点的针头，从而让里面的胶能顺利的打出来。\r\n\r\n另外还有一个原因就是胶本身出了问题，比如说有些胶必须要在一定的低温环境之下保存，如果说停电导致胶没有在低温环境下保存，那么这个胶很快就会凝固，那么在里面肯定就是打不出来的，在这种情况之下就需要联系胶的供应商重新调换胶了，购买回来的胶放置于冰柜中低温存储，避免凝固导致无法使用。', '新闻资讯', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES ('7', '视觉点胶机应用服装', './src/assets/img/home_do.jpg', '导致堵塞的原因当然是很多的，比如有的时候可能是管线或者是接口处出现了堵塞现象，一般都是上一次下班的时候没有清理掉参与胶量，从而使得其凝固发生堵塞，解决的方式就是将胶桶清空，然后清洁干净重新上胶，堵塞解除便可继续操作了。\r\n\r\n滴胶机不出胶第二个重要的原因就可能是里面的电机出现了卡死的现象，这个机器里面会使用到电机作为驱动，随着电机使用的时间越来越长，那么电机有可能会因为高符合的原因而出现卡死的情况，这个时候要检查一下机器上面有没有报警提示？\r\n\r\n如果报警提示已经明确指出是电机方面的原因引起的，那么就应该把机器关闭掉，然后将电机进行检查维修，电机恢复正常之后不出胶的现象自然就得到了解决。\r\n\r\n运行的过程当中不出胶还有可能是针头出了问题，比如在本身压力就不是很大的情况下，选择了很小的针头就会导致出胶的速度非常的慢，甚至有可能就不出胶。怎么这个时候就要重新更换一个口径更大一点的针头，从而让里面的胶能顺利的打出来。\r\n\r\n另外还有一个原因就是胶本身出了问题，比如说有些胶必须要在一定的低温环境之下保存，如果说停电导致胶没有在低温环境下保存，那么这个胶很快就会凝固，那么在里面肯定就是打不出来的，在这种情况之下就需要联系胶的供应商重新调换胶了，购买回来的胶放置于冰柜中低温存储，避免凝固导致无法使用。', '新闻资讯', '2023-06-19 14:40:21', '管理员', 1);
INSERT INTO `borui_news` VALUES ('8', '视觉点胶机应用', './src/assets/img/home_do.jpg', '导致堵塞的原因当然是很多的，比如有的时候可能是管线或者是接口处出现了堵塞现象，一般都是上一次下班的时候没有清理掉参与胶量，从而使得其凝固发生堵塞，解决的方式就是将胶桶清空，然后清洁干净重新上胶，堵塞解除便可继续操作了。\r\n\r\n滴胶机不出胶第二个重要的原因就可能是里面的电机出现了卡死的现象，这个机器里面会使用到电机作为驱动，随着电机使用的时间越来越长，那么电机有可能会因为高符合的原因而出现卡死的情况，这个时候要检查一下机器上面有没有报警提示？\r\n\r\n如果报警提示已经明确指出是电机方面的原因引起的，那么就应该把机器关闭掉，然后将电机进行检查维修，电机恢复正常之后不出胶的现象自然就得到了解决。\r\n\r\n运行的过程当中不出胶还有可能是针头出了问题，比如在本身压力就不是很大的情况下，选择了很小的针头就会导致出胶的速度非常的慢，甚至有可能就不出胶。怎么这个时候就要重新更换一个口径更大一点的针头，从而让里面的胶能顺利的打出来。\r\n\r\n另外还有一个原因就是胶本身出了问题，比如说有些胶必须要在一定的低温环境之下保存，如果说停电导致胶没有在低温环境下保存，那么这个胶很快就会凝固，那么在里面肯定就是打不出来的，在这种情况之下就需要联系胶的供应商重新调换胶了，购买回来的胶放置于冰柜中低温存储，避免凝固导致无法使用。', '新闻资讯', '2023-05-29 11:26:55', 'test', 1);
INSERT INTO `borui_news` VALUES ('9', '视觉点胶机应用', './src/assets/img/home_do.jpg', '导致堵塞的原因当然是很多的，比如有的时候可能是管线或者是接口处出现了堵塞现象，一般都是上一次下班的时候没有清理掉参与胶量，从而使得其凝固发生堵塞，解决的方式就是将胶桶清空，然后清洁干净重新上胶，堵塞解除便可继续操作了。\r\n\r\n滴胶机不出胶第二个重要的原因就可能是里面的电机出现了卡死的现象，这个机器里面会使用到电机作为驱动，随着电机使用的时间越来越长，那么电机有可能会因为高符合的原因而出现卡死的情况，这个时候要检查一下机器上面有没有报警提示？\r\n\r\n如果报警提示已经明确指出是电机方面的原因引起的，那么就应该把机器关闭掉，然后将电机进行检查维修，电机恢复正常之后不出胶的现象自然就得到了解决。\r\n\r\n运行的过程当中不出胶还有可能是针头出了问题，比如在本身压力就不是很大的情况下，选择了很小的针头就会导致出胶的速度非常的慢，甚至有可能就不出胶。怎么这个时候就要重新更换一个口径更大一点的针头，从而让里面的胶能顺利的打出来。\r\n\r\n另外还有一个原因就是胶本身出了问题，比如说有些胶必须要在一定的低温环境之下保存，如果说停电导致胶没有在低温环境下保存，那么这个胶很快就会凝固，那么在里面肯定就是打不出来的，在这种情况之下就需要联系胶的供应商重新调换胶了，购买回来的胶放置于冰柜中低温存储，避免凝固导致无法使用。', '新闻资讯', '2023-05-29 11:26:55', 'test', 1);

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
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '唯一标识',
  `invCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '产品编码',
  `invName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '产品名称',
  `invStd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格型号',
  `invPic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品图片',
  `invTags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '一级分类',
  `invTags2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '二级分类',
  `invInfoText` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '产品介绍文字',
  `invInfoPic` json NULL COMMENT '产品详情图片',
  `caseTags` json NULL COMMENT '相关行业',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `isDel` int(0) NOT NULL COMMENT '是否生效（0无效，1有效）',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`, `invCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borui_productlist
-- ----------------------------
INSERT INTO `borui_productlist` VALUES ('1', '1040000001', '视觉点胶机', '全自动_CCD', './src/assets/img/product/1011.png', '101', '102', '<h3>产品特点：</h3>1、公司自行研发全自动CCD视觉相机定位系统，配上自动精确跟踪定位相机，在运行过程中自动修正点胶坐标。\n2、直接将产品放入料盘上滴胶，产品可任意摆放，360度全视觉定位。\n3、可以对产品进行打点、走直线、画圆弧、不规则曲线功能。连续打点300个点/秒，不漏滴、不错滴、不重复滴胶。\n4、点胶精度高速度快：因为喷头离模具2- 6mm，不会碰伤到产品和模具，也不需要人工补胶，生产出的产品表面非常干净。\n5、对产品加工速度和提前开胶和提前关胶可进行任意编程，具有图像教导设定和DXF文件导入功能。\n<h3>产品简介：</h3>东莞市柏锐智能科技有限公司制造的ccd视觉点胶机，我们不仅仅致力于全自动程序点胶机上面的研发，同时我们还提供了双倍效率的技术公关，采用了双工位和多工位的点胶人工智能手臂，让一台点胶机器人变成了集体人工智能机器人手臂，点胶和喷胶效率成倍上升，极大的解决了人工贴胶打胶的效率。而且只要人工不停的提供物料，ccd点胶机就能24小时不停工作。以下视频就是点胶机和贴胶机对产品进行快速喷胶工作。', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\", \"./src/assets/img/product.png\"]', '[\"3c\", \"hardware\", \"newEnergy\"]', NULL, 1, '2023-06-19 14:11:17', '管理员');
INSERT INTO `borui_productlist` VALUES ('10', '1040000010', '流水线', NULL, './src/assets/img/product/3013.png', '301', '304', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"food\"]', NULL, 1, '2023-06-15 18:32:02', '管理员');
INSERT INTO `borui_productlist` VALUES ('11', '1040000011', '碳钢双工位裱花机', '都可以', './src/assets/img/product/3014.png', '301', '305', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"food\"]', NULL, 1, '2023-06-19 10:26:12', '管理员');
INSERT INTO `borui_productlist` VALUES ('2', '1040000002', '滴胶机器', '环氧水晶_AB_双液', './src/assets/img/product/1012.png', '101', '103', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"3c\", \"solutions\", \"newEnergy\"]', NULL, 1, '2023-06-08 14:46:39', 'admin');
INSERT INTO `borui_productlist` VALUES ('3', '1040000003', '全自动视觉点胶机', NULL, './src/assets/img/product/1013.png', '101', '104', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"hardware\", \"solutions\", \"newEnergy\"]', NULL, 1, '2023-06-08 14:46:42', 'admin');
INSERT INTO `borui_productlist` VALUES ('4', '1040000004', '视觉点胶机', NULL, './src/assets/img/product/1014.png', '101', '105', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"3c\", \"hardware\", \"solutions\", \"newEnergy\"]', NULL, 1, '2023-06-08 14:46:44', 'admin');
INSERT INTO `borui_productlist` VALUES ('5', '1040000005', '点钻机器人', NULL, './src/assets/img/product/2011.png', '201', '202', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"3c\", \"hardware\", \"newEnergy\"]', NULL, 1, '2023-06-08 14:46:47', 'admin');
INSERT INTO `borui_productlist` VALUES ('6', '1040000006', '五金饰品镶嵌机', NULL, './src/assets/img/product/2012.png', '201', '203', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"hardware\", \"solutions\"]', NULL, 1, '2023-06-08 14:46:50', 'admin');
INSERT INTO `borui_productlist` VALUES ('8', '1040000008', '不锈钢双工裱花机', NULL, './src/assets/img/product/3011.png', '301', '302', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"food\"]', NULL, 1, '2023-06-08 14:46:52', 'admin');
INSERT INTO `borui_productlist` VALUES ('9', '1040000009', '单工位裱花机', NULL, './src/assets/img/product/3012.png', '301', '303', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"food\"]', NULL, 1, '2023-06-08 14:46:54', 'admin');

-- ----------------------------
-- Table structure for borui_user
-- ----------------------------
DROP TABLE IF EXISTS `borui_user`;
CREATE TABLE `borui_user`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uname`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borui_user
-- ----------------------------
INSERT INTO `borui_user` VALUES ('1', '管理员', 'admin', 'password', 'sa', NULL, '2023-06-01 18:50:48');
INSERT INTO `borui_user` VALUES ('aghD-x6ij8R476rkBAwWu', '测试', 'test', '321', '员工', '测试账号', '2023-06-06 18:56:35');

SET FOREIGN_KEY_CHECKS = 1;
