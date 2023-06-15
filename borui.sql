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

 Date: 15/06/2023 18:55:28
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
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '留言时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borui_message_board
-- ----------------------------
INSERT INTO `borui_message_board` VALUES (1, 'joy', '110', 'joy@mail.com', '111', 'test message', '2023-06-15 18:50:23');
INSERT INTO `borui_message_board` VALUES (2, '1', '1', '1', '11', '11', '2023-06-15 18:50:25');
INSERT INTO `borui_message_board` VALUES (3, 'Sakura', '120', 'sakura@mail.com', 'China', 'No2. test message', '2023-06-14 18:50:29');

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
INSERT INTO `borui_news` VALUES ('7', '视觉点胶机应用服装', './src/assets/img/home_do.jpg', '导致堵塞的原因当然是很多的，比如有的时候可能是管线或者是接口处出现了堵塞现象，一般都是上一次下班的时候没有清理掉参与胶量，从而使得其凝固发生堵塞，解决的方式就是将胶桶清空，然后清洁干净重新上胶，堵塞解除便可继续操作了。\r\n\r\n滴胶机不出胶第二个重要的原因就可能是里面的电机出现了卡死的现象，这个机器里面会使用到电机作为驱动，随着电机使用的时间越来越长，那么电机有可能会因为高符合的原因而出现卡死的情况，这个时候要检查一下机器上面有没有报警提示？\r\n\r\n如果报警提示已经明确指出是电机方面的原因引起的，那么就应该把机器关闭掉，然后将电机进行检查维修，电机恢复正常之后不出胶的现象自然就得到了解决。\r\n\r\n运行的过程当中不出胶还有可能是针头出了问题，比如在本身压力就不是很大的情况下，选择了很小的针头就会导致出胶的速度非常的慢，甚至有可能就不出胶。怎么这个时候就要重新更换一个口径更大一点的针头，从而让里面的胶能顺利的打出来。\r\n\r\n另外还有一个原因就是胶本身出了问题，比如说有些胶必须要在一定的低温环境之下保存，如果说停电导致胶没有在低温环境下保存，那么这个胶很快就会凝固，那么在里面肯定就是打不出来的，在这种情况之下就需要联系胶的供应商重新调换胶了，购买回来的胶放置于冰柜中低温存储，避免凝固导致无法使用。', '新闻资讯', '2023-05-29 11:26:55', 'test', 1);
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
  `invInfoText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品介绍文字',
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
INSERT INTO `borui_productlist` VALUES ('1', '1040000001', '视觉点胶机', '全自动_CCD', './src/assets/img/product/1011.png', '101', '102', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\", \"./src/assets/img/product.png\"]', '[\"3c\", \"hardware\", \"newEnergy\"]', NULL, 1, '2023-06-08 14:46:37', 'admin');
INSERT INTO `borui_productlist` VALUES ('10', '1040000010', '流水线', NULL, './src/assets/img/product/3013.png', '301', '304', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"food\"]', NULL, 1, '2023-06-15 18:32:02', '管理员');
INSERT INTO `borui_productlist` VALUES ('11', '1040000011', '碳钢双工位裱花机', '都可以', './src/assets/img/product/3014.png', '301', '305', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\", \"./tmp/my-uploads/2267a31b48e55ae1b116a04fdb8fda75.png\"]', '[\"food\"]', NULL, 1, '2023-06-15 18:30:54', '管理员');
INSERT INTO `borui_productlist` VALUES ('2', '1040000002', '滴胶机器', '环氧水晶_AB_双液', './src/assets/img/product/1012.png', '101', '103', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"3c\", \"solutions\", \"newEnergy\"]', NULL, 1, '2023-06-08 14:46:39', 'admin');
INSERT INTO `borui_productlist` VALUES ('3', '1040000003', '全自动视觉点胶机', NULL, './src/assets/img/product/1013.png', '101', '104', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"hardware\", \"solutions\", \"newEnergy\"]', NULL, 1, '2023-06-08 14:46:42', 'admin');
INSERT INTO `borui_productlist` VALUES ('4', '1040000004', '视觉点胶机', NULL, './src/assets/img/product/1014.png', '101', '105', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"3c\", \"hardware\", \"solutions\", \"newEnergy\"]', NULL, 1, '2023-06-08 14:46:44', 'admin');
INSERT INTO `borui_productlist` VALUES ('5', '1040000005', '点钻机器人', NULL, './src/assets/img/product/2011.png', '201', '202', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"3c\", \"hardware\", \"newEnergy\"]', NULL, 1, '2023-06-08 14:46:47', 'admin');
INSERT INTO `borui_productlist` VALUES ('6', '1040000006', '五金饰品镶嵌机', NULL, './src/assets/img/product/2012.png', '201', '203', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"hardware\", \"solutions\"]', NULL, 1, '2023-06-08 14:46:50', 'admin');
INSERT INTO `borui_productlist` VALUES ('8', '1040000008', '不锈钢双工裱花机', NULL, './src/assets/img/product/3011.png', '301', '302', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"food\"]', NULL, 1, '2023-06-08 14:46:52', 'admin');
INSERT INTO `borui_productlist` VALUES ('9', '1040000009', '单工位裱花机', NULL, './src/assets/img/product/3012.png', '301', '303', '柏锐机器，产品介绍1...', '[\"http://www.borui1698.com/uploadfile/image/20190103/20190103203049_955643261.jpg\"]', '[\"food\"]', NULL, 1, '2023-06-08 14:46:54', 'admin');
INSERT INTO `borui_productlist` VALUES ('uH47leuEWm0wL-NmGIMU9', '110', '驾驶的飞机', '测试用', './tmp/my-uploads/754238c902151da462be180a6bcbdb7e.jpg', '301', '304', '驾驶的飞机\n驾驶的飞机驾驶的飞机\n驾驶的飞机驾驶的飞机驾驶的飞机驾驶的飞机\nv驾驶的飞机\n驾驶的飞机驾驶的飞机驾驶的飞机\n驾驶的飞机', '[\"./tmp/my-uploads/559f6d33c5c1bdcfe65feb3f744d3e96.png\", \"./tmp/my-uploads/006d00f28889ccd8d6172181108a5df5.png\"]', '[\"food\"]', '测试', 0, '2023-06-15 18:33:28', '管理员');

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
INSERT INTO `borui_user` VALUES ('aghD-x6ij8R476rkBAwWu', '测试', 'test', '123', '员工', '测试账号', '2023-06-06 18:56:35');
INSERT INTO `borui_user` VALUES ('M3aXSeY3faEV7n-DLn-D4', '测试3', 'test3', 'abc', '员工', '测试2', '2023-06-10 00:50:56');
INSERT INTO `borui_user` VALUES ('xydv8BPBx868qxd0migzu', '测试2', 'test2', '123', 'user', '', '2023-06-10 00:50:25');

SET FOREIGN_KEY_CHECKS = 1;
