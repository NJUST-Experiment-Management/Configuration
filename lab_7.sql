/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : lab

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 04/12/2021 21:07:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP DATABASE IF EXISTS `lab`;
CREATE DATABASE `lab`;
USE `lab`;

-- ----------------------------
-- Table structure for arr_room
-- ----------------------------
DROP TABLE IF EXISTS `arr_room`;
CREATE TABLE `arr_room`  (
  `arr_room_id` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机房安排编号',
  `room_id` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机房编号',
  `arrange_date` date NOT NULL COMMENT '安排时间',
  `arrange_time` enum('1','2','3','4','5') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '安排大节',
  `course_id` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程编号',
  `is_shareable` tinyint(1) NOT NULL COMMENT '是否可共享',
  PRIMARY KEY (`arr_room_id`) USING BTREE,
  UNIQUE INDEX `ARR_ROOM_UNIQUE`(`room_id`, `arrange_date`, `arrange_time`, `course_id`) USING BTREE,
  INDEX `ARR_ROOM_COURSE`(`course_id`) USING BTREE,
  CONSTRAINT `ARR_ROOM` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ARR_ROOM_COURSE` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of arr_room
-- ----------------------------
INSERT INTO `arr_room` VALUES ('7b930598-54e8-11ec-9369-005056c00001', '1011', '2021-12-14', '1', '50001', 1);
INSERT INTO `arr_room` VALUES ('aec77860-54e8-11ec-9369-005056c00001', '1011', '2021-12-14', '1', '50002', 1);
INSERT INTO `arr_room` VALUES ('c26c0eff-54e8-11ec-9369-005056c00001', '1011', '2021-12-16', '2', '50001', 0);
INSERT INTO `arr_room` VALUES ('d4fa6a81-54e8-11ec-9369-005056c00001', '1012', '2021-12-17', '1', '50002', 0);

-- ----------------------------
-- Table structure for arr_user
-- ----------------------------
DROP TABLE IF EXISTS `arr_user`;
CREATE TABLE `arr_user`  (
  `arr_user_id` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学生安排编号',
  `user_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学生编号',
  `arrange_date` date NOT NULL COMMENT '安排日期',
  `arrange_time` enum('1','2','3','4','5') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '安排时间',
  `course_id` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程编号',
  `device_id` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机位编号',
  PRIMARY KEY (`arr_user_id`) USING BTREE,
  UNIQUE INDEX `ARR_USER_UNIQUE`(`user_id`, `arrange_date`, `arrange_time`) USING BTREE,
  INDEX `ARR_COURSE`(`course_id`) USING BTREE,
  INDEX `ARR_USER_DEVICE`(`device_id`) USING BTREE,
  CONSTRAINT `ARR_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ARR_USER_COURSE` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ARR_USER_DEVICE` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of arr_user
-- ----------------------------
INSERT INTO `arr_user` VALUES ('a5d2b7ce-4ea3-11ec-9369-005056c00001', '30001', '2021-12-14', '1', '50001', '97e1b15d-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d2ce5a-4ea3-11ec-9369-005056c00001', '30002', '2021-12-14', '1', '50001', '97e1b6e9-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d2d555-4ea3-11ec-9369-005056c00001', '30003', '2021-12-14', '1', '50001', '97e1b820-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d2def5-4ea3-11ec-9369-005056c00001', '30004', '2021-12-14', '1', '50001', '97e1b906-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d2e54a-4ea3-11ec-9369-005056c00001', '30005', '2021-12-14', '1', '50001', '97e1b9d6-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d2eb28-4ea3-11ec-9369-005056c00001', '30001', '2021-12-16', '2', '50001', '97e1baa3-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d2f40f-4ea3-11ec-9369-005056c00001', '30002', '2021-12-16', '2', '50001', '97e1bbcd-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d2fb23-4ea3-11ec-9369-005056c00001', '30003', '2021-12-16', '2', '50001', '97e1bcaf-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d301b8-4ea3-11ec-9369-005056c00001', '30004', '2021-12-16', '2', '50001', '97e1bd72-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d30818-4ea3-11ec-9369-005056c00001', '30005', '2021-12-16', '2', '50001', '97e1be35-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d31139-4ea3-11ec-9369-005056c00001', '30006', '2021-12-14', '1', '50002', '97e1baa3-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d318ae-4ea3-11ec-9369-005056c00001', '30007', '2021-12-14', '1', '50002', '97e1bbcd-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d31ebf-4ea3-11ec-9369-005056c00001', '30008', '2021-12-14', '1', '50002', '97e1bcaf-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d3246e-4ea3-11ec-9369-005056c00001', '30009', '2021-12-14', '1', '50002', '97e1bd72-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d32a12-4ea3-11ec-9369-005056c00001', '30010', '2021-12-14', '1', '50002', '97e1be35-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d32fa1-4ea3-11ec-9369-005056c00001', '30006', '2021-12-17', '1', '50002', '97e1eff6-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d33534-4ea3-11ec-9369-005056c00001', '30007', '2021-12-17', '1', '50002', '97e1f0c8-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d33c85-4ea3-11ec-9369-005056c00001', '30008', '2021-12-17', '1', '50002', '97e1f19b-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d345f4-4ea3-11ec-9369-005056c00001', '30009', '2021-12-17', '1', '50002', '97e1f39d-4ea2-11ec-9369-005056c00001');
INSERT INTO `arr_user` VALUES ('a5d34e9d-4ea3-11ec-9369-005056c00001', '30010', '2021-12-17', '1', '50002', '97e1f46f-4ea2-11ec-9369-005056c00001');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `course_id` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `course_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名称',
  `course_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程内容',
  `teacher_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教师ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `is_opening` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开放性实验',
  PRIMARY KEY (`course_id`) USING BTREE,
  INDEX `COURSE_TEA`(`teacher_id`) USING BTREE,
  CONSTRAINT `COURSE_TEACHER` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('50001', '计算机组成原理', '运算器的实现', '20001', '2021-11-17 20:36:25', 0);
INSERT INTO `course` VALUES ('50002', '计算机组成原理', '加法器的实现', '20002', '2021-11-17 20:36:58', 1);
INSERT INTO `course` VALUES ('50003', '基于多元神经网络的社交媒体深度挖掘技术', '使用多元神经网络技术，在贴吧挖掘与“半导体”有关的信息', '20002', '2021-11-17 20:38:10', 1);

-- ----------------------------
-- Table structure for course_student
-- ----------------------------
DROP TABLE IF EXISTS `course_student`;
CREATE TABLE `course_student`  (
  `course_id` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程编号',
  `student_id` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学生编号',
  PRIMARY KEY (`course_id`, `student_id`) USING BTREE,
  INDEX `DO_STUDENT`(`student_id`) USING BTREE,
  CONSTRAINT `DO_COURSE` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DO_STUDENT` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_student
-- ----------------------------

INSERT INTO `course_student`(`course_id`, `student_id`) VALUES ('50001', '30001');
INSERT INTO `course_student`(`course_id`, `student_id`) VALUES ('50001', '30002');
INSERT INTO `course_student`(`course_id`, `student_id`) VALUES ('50001', '30003');
INSERT INTO `course_student`(`course_id`, `student_id`) VALUES ('50001', '30004');
INSERT INTO `course_student`(`course_id`, `student_id`) VALUES ('50001', '30005');
INSERT INTO `course_student`(`course_id`, `student_id`) VALUES ('50002', '30006');
INSERT INTO `course_student`(`course_id`, `student_id`) VALUES ('50002', '30007');
INSERT INTO `course_student`(`course_id`, `student_id`) VALUES ('50002', '30008');
INSERT INTO `course_student`(`course_id`, `student_id`) VALUES ('50002', '30009');
INSERT INTO `course_student`(`course_id`, `student_id`) VALUES ('50002', '30010');

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device`  (
  `device_id` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '器械编号',
  `room_id` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所在机房ID',
  `device_row` int(0) NOT NULL COMMENT '所在行',
  `device_col` int(0) NOT NULL COMMENT '所在列',
  `device_status` enum('AVAILABLE','DISABLED','VACANT') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'AVAILABLE' COMMENT '器械状态',
  PRIMARY KEY (`device_id`) USING BTREE,
  INDEX `DEVICE_UNIQUE`(`room_id`, `device_row`, `device_col`) USING BTREE,
  CONSTRAINT `DEVICE_ROOM` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('97e1b15d-4ea2-11ec-9369-005056c00001', '1011', 1, 1, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1b6e9-4ea2-11ec-9369-005056c00001', '1011', 1, 2, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1b820-4ea2-11ec-9369-005056c00001', '1011', 1, 3, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1b906-4ea2-11ec-9369-005056c00001', '1011', 1, 4, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1b9d6-4ea2-11ec-9369-005056c00001', '1011', 1, 5, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1baa3-4ea2-11ec-9369-005056c00001', '1011', 1, 6, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1bbcd-4ea2-11ec-9369-005056c00001', '1011', 1, 7, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1bcaf-4ea2-11ec-9369-005056c00001', '1011', 1, 8, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1bd72-4ea2-11ec-9369-005056c00001', '1011', 1, 9, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1be35-4ea2-11ec-9369-005056c00001', '1011', 1, 10, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1bf19-4ea2-11ec-9369-005056c00001', '1011', 2, 1, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1c0c7-4ea2-11ec-9369-005056c00001', '1011', 2, 2, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1c1be-4ea2-11ec-9369-005056c00001', '1011', 2, 3, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1c303-4ea2-11ec-9369-005056c00001', '1011', 2, 4, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1c47f-4ea2-11ec-9369-005056c00001', '1011', 2, 5, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1c553-4ea2-11ec-9369-005056c00001', '1011', 2, 6, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1c621-4ea2-11ec-9369-005056c00001', '1011', 2, 7, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1c6ed-4ea2-11ec-9369-005056c00001', '1011', 2, 8, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1c83f-4ea2-11ec-9369-005056c00001', '1011', 2, 9, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1c8f7-4ea2-11ec-9369-005056c00001', '1011', 2, 10, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1c9d9-4ea2-11ec-9369-005056c00001', '1011', 3, 1, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1caa1-4ea2-11ec-9369-005056c00001', '1011', 3, 2, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1cb5b-4ea2-11ec-9369-005056c00001', '1011', 3, 3, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1cc13-4ea2-11ec-9369-005056c00001', '1011', 3, 4, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1cccc-4ea2-11ec-9369-005056c00001', '1011', 3, 5, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1cd80-4ea2-11ec-9369-005056c00001', '1011', 3, 6, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1d10d-4ea2-11ec-9369-005056c00001', '1011', 3, 7, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1d385-4ea2-11ec-9369-005056c00001', '1011', 3, 8, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1d552-4ea2-11ec-9369-005056c00001', '1011', 3, 9, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1d67b-4ea2-11ec-9369-005056c00001', '1011', 3, 10, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1d80a-4ea2-11ec-9369-005056c00001', '1011', 4, 1, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1d8e9-4ea2-11ec-9369-005056c00001', '1011', 4, 2, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1d9c6-4ea2-11ec-9369-005056c00001', '1011', 4, 3, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1da99-4ea2-11ec-9369-005056c00001', '1011', 4, 4, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1dc9f-4ea2-11ec-9369-005056c00001', '1011', 4, 5, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1dd6d-4ea2-11ec-9369-005056c00001', '1011', 4, 6, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1de44-4ea2-11ec-9369-005056c00001', '1011', 4, 7, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1df96-4ea2-11ec-9369-005056c00001', '1011', 4, 8, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1e050-4ea2-11ec-9369-005056c00001', '1011', 4, 9, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1e1cc-4ea2-11ec-9369-005056c00001', '1011', 4, 10, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1e2b5-4ea2-11ec-9369-005056c00001', '1011', 5, 1, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1e4b9-4ea2-11ec-9369-005056c00001', '1011', 5, 2, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1e5b2-4ea2-11ec-9369-005056c00001', '1011', 5, 3, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1e687-4ea2-11ec-9369-005056c00001', '1011', 5, 4, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1e890-4ea2-11ec-9369-005056c00001', '1011', 5, 5, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1e961-4ea2-11ec-9369-005056c00001', '1011', 5, 6, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1eacf-4ea2-11ec-9369-005056c00001', '1011', 5, 7, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1ec51-4ea2-11ec-9369-005056c00001', '1011', 5, 8, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1ed26-4ea2-11ec-9369-005056c00001', '1011', 5, 9, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1ee77-4ea2-11ec-9369-005056c00001', '1011', 5, 10, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1eff6-4ea2-11ec-9369-005056c00001', '1012', 1, 1, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1f0c8-4ea2-11ec-9369-005056c00001', '1012', 1, 2, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1f19b-4ea2-11ec-9369-005056c00001', '1012', 1, 3, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1f39d-4ea2-11ec-9369-005056c00001', '1012', 1, 4, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1f46f-4ea2-11ec-9369-005056c00001', '1012', 1, 5, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1f5f9-4ea2-11ec-9369-005056c00001', '1012', 1, 6, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1f785-4ea2-11ec-9369-005056c00001', '1012', 1, 7, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1f858-4ea2-11ec-9369-005056c00001', '1012', 1, 8, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1f9a6-4ea2-11ec-9369-005056c00001', '1012', 1, 9, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1fb40-4ea2-11ec-9369-005056c00001', '1012', 1, 10, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1fc30-4ea2-11ec-9369-005056c00001', '1012', 2, 1, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1fd77-4ea2-11ec-9369-005056c00001', '1012', 2, 2, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1fe34-4ea2-11ec-9369-005056c00001', '1012', 2, 3, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1feed-4ea2-11ec-9369-005056c00001', '1012', 2, 4, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e1ffa8-4ea2-11ec-9369-005056c00001', '1012', 2, 5, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e20062-4ea2-11ec-9369-005056c00001', '1012', 2, 6, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e2011c-4ea2-11ec-9369-005056c00001', '1012', 2, 7, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e201d2-4ea2-11ec-9369-005056c00001', '1012', 2, 8, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e2037d-4ea2-11ec-9369-005056c00001', '1012', 2, 9, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e20454-4ea2-11ec-9369-005056c00001', '1012', 2, 10, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e206eb-4ea2-11ec-9369-005056c00001', '1012', 3, 1, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e207cd-4ea2-11ec-9369-005056c00001', '1012', 3, 2, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e20924-4ea2-11ec-9369-005056c00001', '1012', 3, 3, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e209dc-4ea2-11ec-9369-005056c00001', '1012', 3, 4, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e20a99-4ea2-11ec-9369-005056c00001', '1012', 3, 5, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e20b51-4ea2-11ec-9369-005056c00001', '1012', 3, 6, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e20d91-4ea2-11ec-9369-005056c00001', '1012', 3, 7, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e20f81-4ea2-11ec-9369-005056c00001', '1012', 3, 8, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e2104e-4ea2-11ec-9369-005056c00001', '1012', 3, 9, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e211c0-4ea2-11ec-9369-005056c00001', '1012', 3, 10, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e213f1-4ea2-11ec-9369-005056c00001', '1012', 4, 1, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e214ad-4ea2-11ec-9369-005056c00001', '1012', 4, 2, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e2156a-4ea2-11ec-9369-005056c00001', '1012', 4, 3, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e21621-4ea2-11ec-9369-005056c00001', '1012', 4, 4, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e216dc-4ea2-11ec-9369-005056c00001', '1012', 4, 5, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e21794-4ea2-11ec-9369-005056c00001', '1012', 4, 6, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e2184e-4ea2-11ec-9369-005056c00001', '1012', 4, 7, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e21905-4ea2-11ec-9369-005056c00001', '1012', 4, 8, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e219bd-4ea2-11ec-9369-005056c00001', '1012', 4, 9, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e21a77-4ea2-11ec-9369-005056c00001', '1012', 4, 10, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e21b30-4ea2-11ec-9369-005056c00001', '1012', 5, 1, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e21be9-4ea2-11ec-9369-005056c00001', '1012', 5, 2, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e21d91-4ea2-11ec-9369-005056c00001', '1012', 5, 3, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e21e76-4ea2-11ec-9369-005056c00001', '1012', 5, 4, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e21fca-4ea2-11ec-9369-005056c00001', '1012', 5, 5, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e22084-4ea2-11ec-9369-005056c00001', '1012', 5, 6, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e22141-4ea2-11ec-9369-005056c00001', '1012', 5, 7, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e221f8-4ea2-11ec-9369-005056c00001', '1012', 5, 8, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e222b0-4ea2-11ec-9369-005056c00001', '1012', 5, 9, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e22366-4ea2-11ec-9369-005056c00001', '1012', 5, 10, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e2b56d-4ea2-11ec-9369-005056c00001', '1012', 6, 1, 'AVAILABLE');
INSERT INTO `device` VALUES ('97e2bae4-4ea2-11ec-9369-005056c00001', '1012', 6, 2, 'AVAILABLE');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `message_id` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息编号',
  `receiver_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接收人编号',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息内容',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `is_read` tinyint(1) NULL DEFAULT 0 COMMENT '是否已读',
  PRIMARY KEY (`message_id`) USING BTREE,
  INDEX `RECIVER_USER`(`receiver_id`) USING BTREE,
  CONSTRAINT `RECIVER_USER` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('d2469411-4ea0-11ec-9369-005056c00001', '30001', '你有未接消息', '2021-12-04 18:08:28', 0);
INSERT INTO `message` VALUES ('e46498be-4ea0-11ec-9369-005056c00001', '20001', '你有未接消息', '2021-11-26 18:08:51', 0);
INSERT INTO `message` VALUES ('efb9fa08-4ea0-11ec-9369-005056c00001', '20001', '你有已读消息', '2021-11-11 18:09:18', 1);

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `room_id` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机房ID值',
  `room_name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机房名称',
  `room_kind` enum('HARDWARE','SOFTWARE','UNDEFINED') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'UNDEFINED' COMMENT '机房类型',
  `room_row` int(0) NOT NULL COMMENT '机位行数',
  `room_col` int(0) NOT NULL COMMENT '机位列数',
  `room_status` enum('AVAILABLE','DISABLED') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'AVAILABLE' COMMENT '机房状态',
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1011', '计算机学院1011', 'HARDWARE', 5, 10, 'AVAILABLE');
INSERT INTO `room` VALUES ('1012', '第四教学楼3H', 'SOFTWARE', 6, 10, 'AVAILABLE');

-- ----------------------------
-- Table structure for term
-- ----------------------------
DROP TABLE IF EXISTS `term`;
CREATE TABLE `term`  (
  `term_name` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学期名称',
  `begin_time` date NULL DEFAULT NULL COMMENT '开始时间',
  PRIMARY KEY (`term_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of term
-- ----------------------------
INSERT INTO `term` VALUES ('2021-2022-1', '2021-08-23');
INSERT INTO `term` VALUES ('2021-2022-2', '2022-02-21');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号/工号',
  `password` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '123456' COMMENT '密码',
  `user_name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `user_phone` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  `user_type` enum('TEACHER','STUDENT','ADMIN') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '身份',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10001', '123456', 'Linda', '1855855855', 'ADMIN');
INSERT INTO `user` VALUES ('20001', '123456', 'Kim', '1585855855', 'TEACHER');
INSERT INTO `user` VALUES ('20002', '123456', 'Tommy', '1202022222', 'TEACHER');
INSERT INTO `user` VALUES ('30001', '123456', 'Alice', '1998298299', 'STUDENT');
INSERT INTO `user` VALUES ('30002', '123456', 'Bob', '1399929283', 'STUDENT');
INSERT INTO `user` VALUES ('30003', '123456', 'Lisa', '13109991298', 'STUDENT');
INSERT INTO `user` VALUES ('30004', '123456', 'Queue', '13109991299', 'STUDENT');
INSERT INTO `user` VALUES ('30005', '123456', 'Kangkang', '13109991300', 'STUDENT');
INSERT INTO `user` VALUES ('30006', '123456', 'Michael', '13109991301', 'STUDENT');
INSERT INTO `user` VALUES ('30007', '123456', 'Jane', '13109991302', 'STUDENT');
INSERT INTO `user` VALUES ('30008', '123456', 'Maria', '13109991303', 'STUDENT');
INSERT INTO `user` VALUES ('30009', '123456', 'Smith', '13109991304', 'STUDENT');
INSERT INTO `user` VALUES ('30010', '123456', 'Jimmy', '13109991305', 'STUDENT');

-- ----------------------------
-- View structure for arr_course
-- ----------------------------
DROP VIEW IF EXISTS `arr_course`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `arr_course` AS select distinct `course`.`course_id` AS `COURSE_ID`,`course`.`course_name` AS `COURSE_NAME`,`arr_user`.`arrange_date` AS `ARRANGE_DATE`,`arr_user`.`arrange_time` AS `ARRANGE_TIME`,`room`.`room_id` AS `ROOM_ID`,`room`.`room_name` AS `ROOM_NAME` from (((`course` join `arr_user` on((`course`.`course_id` = `arr_user`.`course_id`))) join `device` on((`arr_user`.`device_id` = `device`.`device_id`))) join `room` on((`device`.`room_id` = `room`.`room_id`)));

-- ----------------------------
-- View structure for course_table
-- ----------------------------
DROP VIEW IF EXISTS `course_table`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `course_table` AS select distinct `user`.`user_id` AS `USER_ID`,`arr_user`.`arrange_date` AS `ARRANGE_DATE`,`arr_user`.`arrange_time` AS `ARRANGE_TIME`,`course`.`course_name` AS `COURSE_NAME`,`room`.`room_name` AS `ROOM_NAME`,`device`.`device_row` AS `DEVICE_ROW`,`device`.`device_col` AS `DEVICE_COL`,`teacher`.`user_name` AS `TEACHER_NAME` from (((((`user` join `arr_user` on((`user`.`user_id` = `arr_user`.`user_id`))) join `course` on((`arr_user`.`course_id` = `course`.`course_id`))) join `device` on((`arr_user`.`device_id` = `device`.`device_id`))) join `room` on((`device`.`room_id` = `room`.`room_id`))) join `user` `teacher` on((`course`.`teacher_id` = `teacher`.`user_id`)));

-- ----------------------------
-- View structure for room_people_num
-- ----------------------------
DROP VIEW IF EXISTS `room_people_num`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `room_people_num` AS select `arr_user`.`arrange_date` AS `ARRANGE_DATE`,`arr_user`.`arrange_time` AS `ARRANGE_TIME`,`room`.`room_name` AS `ROOM_NAME`,count(0) AS `PROPLE_NUM` from ((`arr_user` join `device` on((`arr_user`.`device_id` = `device`.`device_id`))) join `room` on((`device`.`room_id` = `room`.`room_id`))) group by `arr_user`.`arrange_date`,`arr_user`.`arrange_time`,`device`.`room_id`;

SET FOREIGN_KEY_CHECKS = 1;
