/*
Navicat MySQL Data Transfer

Source Server         : shixun
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : fitness

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2020-07-04 17:56:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fit_cost
-- ----------------------------
DROP TABLE IF EXISTS `fit_cost`;
CREATE TABLE `fit_cost` (
  `cost_id` varchar(40) COLLATE utf8_bin NOT NULL,
  `cost_cust_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cost_time` datetime NOT NULL,
  `cost_money` float NOT NULL,
  `cost_info` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cost_id`),
  KEY `cost_cust_id` (`cost_cust_id`),
  CONSTRAINT `cost_cust_id` FOREIGN KEY (`cost_cust_id`) REFERENCES `fit_customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of fit_cost
-- ----------------------------
INSERT INTO `fit_cost` VALUES ('0c4d3727-c732-4766-970b-be76ed65c6d0', '6e57e9ad-0be3-4224-b92c-d7748e9333051069', '2020-07-03 16:34:34', '100', '会员续费');
INSERT INTO `fit_cost` VALUES ('13364194-c316-4e26-bba6-db8d1e5d5ae0', '7d1b21f4-0634-40e0-8e8d-ef31856153281349', '2020-07-03 16:40:46', '100', '举铁');
INSERT INTO `fit_cost` VALUES ('180e1506-b06a-4fa3-8237-8b6c3ede9dd9', '5ed3cdd5-b49b-4cbc-be9a-8714d05805781467', '2020-06-03 16:35:55', '2000', '健身房组织爬山');
INSERT INTO `fit_cost` VALUES ('1919a91a-1622-4a1a-be58-8699180b889e', 'a3b4919f-7f71-4cfb-9b2e-00388f10839f1044', '2020-04-03 11:14:02', '67', '哑铃');
INSERT INTO `fit_cost` VALUES ('1f423d30-dc08-4f2f-8fff-34df49b8b4e0', '5b819078-635c-4ad5-a986-7b1b1b6a045e1902', '2020-07-03 15:04:05', '10', '瑜伽');
INSERT INTO `fit_cost` VALUES ('27a73e63-f1d1-4f35-b5fb-8df2efcd6c9a', 'a3b4919f-7f71-4cfb-9b2e-00388f10839f1044', '2020-04-03 16:34:58', '1234', '会员续费');
INSERT INTO `fit_cost` VALUES ('31885cf3-f339-449e-b81c-0c857d7301a0', 'b6927e53-f671-433e-80ea-a3fd8f5a25431038', '2020-07-03 16:35:02', '900', '会员续费');
INSERT INTO `fit_cost` VALUES ('355b7088-f2b6-4cfb-a943-203172c7e99a', '7d1b21f4-0634-40e0-8e8d-ef31856153281349', '2020-04-03 16:41:54', '500', '组织远足');
INSERT INTO `fit_cost` VALUES ('4283cebc-8c04-49ee-bf8b-9365f17789ba', '96a9f025-dc01-4db4-9b04-777f7dc1b4721776', '2020-07-03 15:04:23', '10', '举重');
INSERT INTO `fit_cost` VALUES ('45857c2f-b36b-42a0-a29c-1acbbed8bdbd', '6e57e9ad-0be3-4224-b92c-d7748e9333051069', '2020-03-03 16:34:43', '1000', '会员续费');
INSERT INTO `fit_cost` VALUES ('4a1a72ea-e751-450a-86f9-11451bf2c4e9', '5b819078-635c-4ad5-a986-7b1b1b6a045e1902', '2020-07-03 16:34:21', '500', '会员续费');
INSERT INTO `fit_cost` VALUES ('4a8fb1a6-4f6d-4b91-9b34-e10a45744cd9', 'fa7dce8a-2deb-47a2-8d86-93cb06a4ecd61675', '2020-02-03 16:36:24', '3000', '健身房组织爬山');
INSERT INTO `fit_cost` VALUES ('4e1c4f03-09f6-4993-a907-7710d3c287c0', '7d1b21f4-0634-40e0-8e8d-ef31856153281349', '2020-01-03 16:41:01', '200', '瑜伽');
INSERT INTO `fit_cost` VALUES ('4f6917bb-9335-465a-8866-8553b7305e32', 'fa7dce8a-2deb-47a2-8d86-93cb06a4ecd61675', '2020-07-03 16:35:05', '999', '会员续费');
INSERT INTO `fit_cost` VALUES ('5bbc7ec6-3ba9-4168-ae9e-81a75809cb9b', '6e57e9ad-0be3-4224-b92c-d7748e9333051069', '2020-03-03 11:13:54', '50', '韵律操');
INSERT INTO `fit_cost` VALUES ('65da238b-1eb0-48c6-8dba-e4c403ecd384', '96a9f025-dc01-4db4-9b04-777f7dc1b4721776', '2020-07-03 16:34:52', '900', '会员续费');
INSERT INTO `fit_cost` VALUES ('68784972-4752-45f2-bb2f-d3d4a7355329', '64fac553-1f7a-4ef8-bf15-9c5bf25eca0c1803', '2020-06-03 11:13:50', '178', '大众健身操');
INSERT INTO `fit_cost` VALUES ('68c7b6bc-581b-4a6d-8d1f-a240a999d09e', 'b6927e53-f671-433e-80ea-a3fd8f5a25431038', '2020-01-03 16:36:19', '3500', '健身房组织爬山');
INSERT INTO `fit_cost` VALUES ('6b4388b5-c17c-418a-a899-8e61ea0bc487', '6e57e9ad-0be3-4224-b92c-d7748e9333051069', '2020-04-03 16:35:59', '2000', '健身房组织爬山');
INSERT INTO `fit_cost` VALUES ('716ec1cc-2291-4d7f-bed1-921844cf2453', '64fac553-1f7a-4ef8-bf15-9c5bf25eca0c1803', '2020-01-02 16:40:48', '12', '有氧舞蹈');
INSERT INTO `fit_cost` VALUES ('7d659b4a-8b9e-4afc-bfc1-227bb051a530', '5b819078-635c-4ad5-a986-7b1b1b6a045e1902', '2020-07-03 16:35:50', '2000', '健身房组织爬山');
INSERT INTO `fit_cost` VALUES ('82d1d5fe-4985-4152-86be-7fa0e3f9ef2d', '7d1b21f4-0634-40e0-8e8d-ef31856153281349', '2020-02-03 16:34:47', '1000', '会员续费');
INSERT INTO `fit_cost` VALUES ('90428a17-2242-45ca-8417-8c743e8550fa', '18efb7ac-a6e6-4da2-9726-6774ef5b3e201575', '2020-07-03 16:28:17', '12', '');
INSERT INTO `fit_cost` VALUES ('9205a154-392d-4b89-9587-3ac11b2f66cb', '6e57e9ad-0be3-4224-b92c-d7748e9333051069', '2020-05-02 16:40:51', '132', '拉丁健美操');
INSERT INTO `fit_cost` VALUES ('962a0d01-f1cb-4e0e-9b1e-e8adda5e4016', 'a3b4919f-7f71-4cfb-9b2e-00388f10839f1044', '2020-07-03 16:33:47', '50', '健身');
INSERT INTO `fit_cost` VALUES ('9b54586b-4800-4ed2-b1da-1e31cb65f1d8', '7d1b21f4-0634-40e0-8e8d-ef31856153281349', '2020-03-03 16:42:02', '400', '续费');
INSERT INTO `fit_cost` VALUES ('9fd43598-a16d-44fc-9a6f-7702ebc8e883', '18efb7ac-a6e6-4da2-9726-6774ef5b3e201575', '2020-04-03 16:34:10', '1000', '续费');
INSERT INTO `fit_cost` VALUES ('abcfbab7-a00c-4ac4-b25f-123ca8e793d4', 'a3b4919f-7f71-4cfb-9b2e-00388f10839f1044', '2020-07-02 16:40:54', '200', '搏击健美操');
INSERT INTO `fit_cost` VALUES ('d7842d1e-d7f1-4bbe-8395-ac74f1b917b6', '64fac553-1f7a-4ef8-bf15-9c5bf25eca0c1803', '2020-05-03 16:34:39', '1000', '会员续费');
INSERT INTO `fit_cost` VALUES ('d8a984dd-edc4-48be-a3e0-81b4195b3085', '5ed3cdd5-b49b-4cbc-be9a-8714d05805781467', '2020-02-02 16:40:44', '32', '时速单骑');
INSERT INTO `fit_cost` VALUES ('d922919c-c557-4a1d-b54a-f25b3d905e97', '18efb7ac-a6e6-4da2-9726-6774ef5b3e201575', '2020-07-03 16:30:51', '12', '');
INSERT INTO `fit_cost` VALUES ('e0fb22a1-3460-4a68-88eb-3682add22cda', '96a9f025-dc01-4db4-9b04-777f7dc1b4721776', '2020-03-03 16:36:07', '3000', '健身房组织爬山');
INSERT INTO `fit_cost` VALUES ('e46657af-961d-4d3c-9f56-a26f0cec2f79', 'a3b4919f-7f71-4cfb-9b2e-00388f10839f1044', '2020-05-03 16:36:13', '1500', '健身房组织爬山');
INSERT INTO `fit_cost` VALUES ('f1dbb2fb-e2bf-4979-872f-384c72325e98', 'b6927e53-f671-433e-80ea-a3fd8f5a25431038', '2020-01-03 11:14:06', '12', '');
INSERT INTO `fit_cost` VALUES ('f601df92-cc96-4f0c-990d-00dc1c0f3be8', '5ed3cdd5-b49b-4cbc-be9a-8714d05805781467', '2020-02-03 11:09:19', '10', '跑步');
INSERT INTO `fit_cost` VALUES ('f77b25aa-2d0a-4a03-a9b2-ff4de82a2948', '7d1b21f4-0634-40e0-8e8d-ef31856153281349', '2020-06-03 16:36:04', '2000', '健身房组织爬山');
INSERT INTO `fit_cost` VALUES ('fa0eae6e-21c3-45bb-b7fe-e77cc103ff13', '18efb7ac-a6e6-4da2-9726-6774ef5b3e201575', '2020-05-03 16:35:45', '2000', '健身房组织爬山');

-- ----------------------------
-- Table structure for fit_customer
-- ----------------------------
DROP TABLE IF EXISTS `fit_customer`;
CREATE TABLE `fit_customer` (
  `cust_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cust_loginname` varchar(17) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cust_loginpass` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cust_realname` varchar(17) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cust_sex` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cust_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cust_tel` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of fit_customer
-- ----------------------------
INSERT INTO `fit_customer` VALUES ('18efb7ac-a6e6-4da2-9726-6774ef5b3e201575', 'heyumei', '131cab8d6dae7d1c046eb09b82064c49', '何玉梅', '女', '辛集路j座 308', '13698711741');
INSERT INTO `fit_customer` VALUES ('5b819078-635c-4ad5-a986-7b1b1b6a045e1902', 'zhouxiumei', 'b49577b94a5a236bf2c2cb0581c5be04', '周秀梅', '女', '普陀淮安路U座 803', '15071610194');
INSERT INTO `fit_customer` VALUES ('5ed3cdd5-b49b-4cbc-be9a-8714d05805781467', 'maxiaotiao', 'c0fb986838993aef6a964b29c919b519', '马小跳', '男', '鑫县吉区张路o座 308', '13739085774');
INSERT INTO `fit_customer` VALUES ('64fac553-1f7a-4ef8-bf15-9c5bf25eca0c1803', 'leibusi', '4dd8fa023defcd63054fb1055862e84c', '雷布斯', '男', '惠州县华龙许路V座 807', '13020759648');
INSERT INTO `fit_customer` VALUES ('6e57e9ad-0be3-4224-b92c-d7748e9333051069', 'mask', '65a7be56a70ffe07a929b7f6e37e0405', '马斯克', '男', '朝阳北镇路d座 906', '14551151964');
INSERT INTO `fit_customer` VALUES ('7d1b21f4-0634-40e0-8e8d-ef31856153281349', 'machangxin', '84e93cbcc03d5b9150a340a0ecc31920', '马长鑫', '男', '和平北镇路a座 902', '14534394432');
INSERT INTO `fit_customer` VALUES ('96a9f025-dc01-4db4-9b04-777f7dc1b4721776', 'jinlu', '20d44f1f2503c25fbf8bf420ba593473', '靳璐', '女', '萍县大东宋街f座 808', '18685627305');
INSERT INTO `fit_customer` VALUES ('a3b4919f-7f71-4cfb-9b2e-00388f10839f1044', 'mahuayun', 'dd01896e65747edfed53729b49d7e4a2', '马化云', '男', '沈河俞街i座 307', '18655105017');
INSERT INTO `fit_customer` VALUES ('b6927e53-f671-433e-80ea-a3fd8f5a25431038', 'mateng', '3005bbd1fa6054bb60e8ead3ec60b0c6', '马腾', '男', '新城卢街K座 804', '13331419155');
INSERT INTO `fit_customer` VALUES ('fa7dce8a-2deb-47a2-8d86-93cb06a4ecd61675', 'huangting', 'b686ad21753190577e329746a379a275', '黄婷', '女', '清城何街E座 701', '13071998260');

-- ----------------------------
-- Table structure for fit_user
-- ----------------------------
DROP TABLE IF EXISTS `fit_user`;
CREATE TABLE `fit_user` (
  `user_id` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_loginname` varchar(17) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_tel` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `user_loginpass` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_realname` varchar(17) COLLATE utf8_bin NOT NULL,
  `user_sex` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `user_state` varchar(2) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of fit_user
-- ----------------------------
INSERT INTO `fit_user` VALUES ('04334edf-a1a0-454c-bc2f-ab744fbe3a871738', 'yangkai', '13260760753', '06b855e670ae163907ac97ce950cd855', '杨凯', '男', '0');
INSERT INTO `fit_user` VALUES ('56a6ec78-94d1-4d9b-a3c3-1dbb85fbc5121179', 'admin', '18599856495', '24a7fb58bc7e1ece1c33d3bfac30d08b', '曹志强', '男', '1');
