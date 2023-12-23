/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 17/12/2023 21:24:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for assessment
-- ----------------------------
DROP TABLE IF EXISTS `assessment`;
CREATE TABLE `assessment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `assessment_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '考评内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_assessment_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auto_code_examples
-- ----------------------------
DROP TABLE IF EXISTS `auto_code_examples`;
CREATE TABLE `auto_code_examples`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `auto_code_example_field` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仅作示例条目无实际作用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_auto_code_examples_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ptype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v0` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_casbin_rule`(`ptype`, `v0`, `v1`, `v2`, `v3`, `v4`, `v5`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 504 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------
INSERT INTO `casbin_rule` VALUES (405, 'p', '888', '/api/createApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (406, 'p', '888', '/api/deleteApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (411, 'p', '888', '/api/deleteApisByIds', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (409, 'p', '888', '/api/getAllApis', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (410, 'p', '888', '/api/getApiById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (408, 'p', '888', '/api/getApiList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (407, 'p', '888', '/api/updateApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (412, 'p', '888', '/authority/copyAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (413, 'p', '888', '/authority/createAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (414, 'p', '888', '/authority/deleteAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (416, 'p', '888', '/authority/getAuthorityList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (417, 'p', '888', '/authority/setDataAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (415, 'p', '888', '/authority/updateAuthority', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (481, 'p', '888', '/authorityBtn/canRemoveAuthorityBtn', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (480, 'p', '888', '/authorityBtn/getAuthorityBtn', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (479, 'p', '888', '/authorityBtn/setAuthorityBtn', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (453, 'p', '888', '/autoCode/createPackage', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (450, 'p', '888', '/autoCode/createPlug', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (447, 'p', '888', '/autoCode/createTemp', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (455, 'p', '888', '/autoCode/delPackage', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (459, 'p', '888', '/autoCode/delSysHistory', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (449, 'p', '888', '/autoCode/getColumn', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (445, 'p', '888', '/autoCode/getDB', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (456, 'p', '888', '/autoCode/getMeta', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (454, 'p', '888', '/autoCode/getPackage', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (458, 'p', '888', '/autoCode/getSysHistory', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (446, 'p', '888', '/autoCode/getTables', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (451, 'p', '888', '/autoCode/installPlugin', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (448, 'p', '888', '/autoCode/preview', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (452, 'p', '888', '/autoCode/pubPlug', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (457, 'p', '888', '/autoCode/rollback', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (419, 'p', '888', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (418, 'p', '888', '/casbin/updateCasbin', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (483, 'p', '888', '/chatGpt/createSK', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (485, 'p', '888', '/chatGpt/deleteSK', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (484, 'p', '888', '/chatGpt/getSK', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (482, 'p', '888', '/chatGpt/getTable', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (442, 'p', '888', '/customer/customer', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (443, 'p', '888', '/customer/customer', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (441, 'p', '888', '/customer/customer', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (440, 'p', '888', '/customer/customer', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (444, 'p', '888', '/customer/customerList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (478, 'p', '888', '/email/emailTest', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (430, 'p', '888', '/fileUploadAndDownload/breakpointContinue', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (431, 'p', '888', '/fileUploadAndDownload/breakpointContinueFinish', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (434, 'p', '888', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (435, 'p', '888', '/fileUploadAndDownload/editFileName', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (429, 'p', '888', '/fileUploadAndDownload/findFile', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (436, 'p', '888', '/fileUploadAndDownload/getFileList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (432, 'p', '888', '/fileUploadAndDownload/removeChunk', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (433, 'p', '888', '/fileUploadAndDownload/upload', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (394, 'p', '888', '/jwt/jsonInBlacklist', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (420, 'p', '888', '/menu/addBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (428, 'p', '888', '/menu/addMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (422, 'p', '888', '/menu/deleteBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (424, 'p', '888', '/menu/getBaseMenuById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (426, 'p', '888', '/menu/getBaseMenuTree', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (421, 'p', '888', '/menu/getMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (427, 'p', '888', '/menu/getMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (425, 'p', '888', '/menu/getMenuList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (423, 'p', '888', '/menu/updateBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (476, 'p', '888', '/simpleUploader/checkFileMd5', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (477, 'p', '888', '/simpleUploader/mergeFileMd5', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (475, 'p', '888', '/simpleUploader/upload', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (465, 'p', '888', '/sysDictionary/createSysDictionary', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (466, 'p', '888', '/sysDictionary/deleteSysDictionary', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (468, 'p', '888', '/sysDictionary/findSysDictionary', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (469, 'p', '888', '/sysDictionary/getSysDictionaryList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (467, 'p', '888', '/sysDictionary/updateSysDictionary', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (461, 'p', '888', '/sysDictionaryDetail/createSysDictionaryDetail', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (462, 'p', '888', '/sysDictionaryDetail/deleteSysDictionaryDetail', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (463, 'p', '888', '/sysDictionaryDetail/findSysDictionaryDetail', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (464, 'p', '888', '/sysDictionaryDetail/getSysDictionaryDetailList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (460, 'p', '888', '/sysDictionaryDetail/updateSysDictionaryDetail', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (470, 'p', '888', '/sysOperationRecord/createSysOperationRecord', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (473, 'p', '888', '/sysOperationRecord/deleteSysOperationRecord', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (474, 'p', '888', '/sysOperationRecord/deleteSysOperationRecordByIds', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (471, 'p', '888', '/sysOperationRecord/findSysOperationRecord', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (472, 'p', '888', '/sysOperationRecord/getSysOperationRecordList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (437, 'p', '888', '/system/getServerInfo', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (438, 'p', '888', '/system/getSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (439, 'p', '888', '/system/setSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (486, 'p', '888', '/tblContent/createTblContent', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (487, 'p', '888', '/tblContent/deleteTblContent', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (488, 'p', '888', '/tblContent/deleteTblContentByIds', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (490, 'p', '888', '/tblContent/findTblContent', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (491, 'p', '888', '/tblContent/getTblContentList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (489, 'p', '888', '/tblContent/updateTblContent', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (492, 'p', '888', '/tblContentMeta/createTblContentMeta', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (493, 'p', '888', '/tblContentMeta/deleteTblContentMeta', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (494, 'p', '888', '/tblContentMeta/deleteTblContentMetaByIds', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (496, 'p', '888', '/tblContentMeta/findTblContentMeta', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (497, 'p', '888', '/tblContentMeta/getTblContentMetaList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (495, 'p', '888', '/tblContentMeta/updateTblContentMeta', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (498, 'p', '888', '/tblMeta/createTblMeta', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (499, 'p', '888', '/tblMeta/deleteTblMeta', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (500, 'p', '888', '/tblMeta/deleteTblMetaByIds', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (502, 'p', '888', '/tblMeta/findTblMeta', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (503, 'p', '888', '/tblMeta/getTblMetaList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (504, 'p', '888', '/tblMeta/getTblMetaListAll', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (501, 'p', '888', '/tblMeta/updateTblMeta', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (396, 'p', '888', '/user/admin_register', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (402, 'p', '888', '/user/changePassword', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (395, 'p', '888', '/user/deleteUser', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (400, 'p', '888', '/user/getUserInfo', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (397, 'p', '888', '/user/getUserList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (404, 'p', '888', '/user/resetPassword', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (399, 'p', '888', '/user/setSelfInfo', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (401, 'p', '888', '/user/setUserAuthorities', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (403, 'p', '888', '/user/setUserAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (398, 'p', '888', '/user/setUserInfo', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (95, 'p', '8881', '/api/createApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (98, 'p', '8881', '/api/deleteApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (100, 'p', '8881', '/api/getAllApis', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (97, 'p', '8881', '/api/getApiById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (96, 'p', '8881', '/api/getApiList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (99, 'p', '8881', '/api/updateApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (101, 'p', '8881', '/authority/createAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (102, 'p', '8881', '/authority/deleteAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (103, 'p', '8881', '/authority/getAuthorityList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (104, 'p', '8881', '/authority/setDataAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (122, 'p', '8881', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (121, 'p', '8881', '/casbin/updateCasbin', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (128, 'p', '8881', '/customer/customer', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (129, 'p', '8881', '/customer/customer', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (126, 'p', '8881', '/customer/customer', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (127, 'p', '8881', '/customer/customer', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (130, 'p', '8881', '/customer/customerList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (119, 'p', '8881', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (120, 'p', '8881', '/fileUploadAndDownload/editFileName', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (118, 'p', '8881', '/fileUploadAndDownload/getFileList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (117, 'p', '8881', '/fileUploadAndDownload/upload', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (123, 'p', '8881', '/jwt/jsonInBlacklist', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (107, 'p', '8881', '/menu/addBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (109, 'p', '8881', '/menu/addMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (111, 'p', '8881', '/menu/deleteBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (113, 'p', '8881', '/menu/getBaseMenuById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (108, 'p', '8881', '/menu/getBaseMenuTree', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (105, 'p', '8881', '/menu/getMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (110, 'p', '8881', '/menu/getMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (106, 'p', '8881', '/menu/getMenuList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (112, 'p', '8881', '/menu/updateBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (124, 'p', '8881', '/system/getSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (125, 'p', '8881', '/system/setSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (94, 'p', '8881', '/user/admin_register', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (114, 'p', '8881', '/user/changePassword', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (131, 'p', '8881', '/user/getUserInfo', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (115, 'p', '8881', '/user/getUserList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (116, 'p', '8881', '/user/setUserAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (133, 'p', '9528', '/api/createApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (136, 'p', '9528', '/api/deleteApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (138, 'p', '9528', '/api/getAllApis', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (135, 'p', '9528', '/api/getApiById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (134, 'p', '9528', '/api/getApiList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (137, 'p', '9528', '/api/updateApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (139, 'p', '9528', '/authority/createAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (140, 'p', '9528', '/authority/deleteAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (141, 'p', '9528', '/authority/getAuthorityList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (142, 'p', '9528', '/authority/setDataAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (169, 'p', '9528', '/autoCode/createTemp', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (160, 'p', '9528', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (159, 'p', '9528', '/casbin/updateCasbin', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (167, 'p', '9528', '/customer/customer', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (165, 'p', '9528', '/customer/customer', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (166, 'p', '9528', '/customer/customer', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (164, 'p', '9528', '/customer/customer', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (168, 'p', '9528', '/customer/customerList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (157, 'p', '9528', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (158, 'p', '9528', '/fileUploadAndDownload/editFileName', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (156, 'p', '9528', '/fileUploadAndDownload/getFileList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (155, 'p', '9528', '/fileUploadAndDownload/upload', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (161, 'p', '9528', '/jwt/jsonInBlacklist', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (145, 'p', '9528', '/menu/addBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (147, 'p', '9528', '/menu/addMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (149, 'p', '9528', '/menu/deleteBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (151, 'p', '9528', '/menu/getBaseMenuById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (146, 'p', '9528', '/menu/getBaseMenuTree', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (143, 'p', '9528', '/menu/getMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (148, 'p', '9528', '/menu/getMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (144, 'p', '9528', '/menu/getMenuList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (150, 'p', '9528', '/menu/updateBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (162, 'p', '9528', '/system/getSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (163, 'p', '9528', '/system/setSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (132, 'p', '9528', '/user/admin_register', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (152, 'p', '9528', '/user/changePassword', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (170, 'p', '9528', '/user/getUserInfo', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (153, 'p', '9528', '/user/getUserList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (154, 'p', '9528', '/user/setUserAuthority', 'POST', '', '', '');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `department_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `department_parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父级部门id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_department_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exa_customers
-- ----------------------------
DROP TABLE IF EXISTS `exa_customers`;
CREATE TABLE `exa_customers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `customer_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户名',
  `customer_phone_data` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `sys_user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '管理ID',
  `sys_user_authority_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '管理角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_exa_customers_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exa_file_chunks
-- ----------------------------
DROP TABLE IF EXISTS `exa_file_chunks`;
CREATE TABLE `exa_file_chunks`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `exa_file_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `file_chunk_number` bigint(20) NULL DEFAULT NULL,
  `file_chunk_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_exa_file_chunks_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exa_file_upload_and_downloads
-- ----------------------------
DROP TABLE IF EXISTS `exa_file_upload_and_downloads`;
CREATE TABLE `exa_file_upload_and_downloads`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `tag` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件标签',
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_exa_file_upload_and_downloads_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exa_file_upload_and_downloads
-- ----------------------------
INSERT INTO `exa_file_upload_and_downloads` VALUES (1, '2023-11-14 23:12:57.807', '2023-11-14 23:12:57.807', NULL, '10.png', 'https://qmplusimg.henrongyi.top/gvalogo.png', 'png', '158787308910.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (2, '2023-11-14 23:12:57.807', '2023-11-14 23:12:57.807', NULL, 'logo.png', 'https://qmplusimg.henrongyi.top/1576554439myAvatar.png', 'png', '1587973709logo.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (3, '2023-11-18 10:11:41.700', '2023-11-18 10:11:41.700', NULL, '一码界.jpg', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231118101141.jpg', 'jpg', '59f4066e9f37f63b10291cb8a3f43bcc_20231118101141.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (4, '2023-11-18 10:51:57.085', '2023-11-18 10:51:57.085', NULL, '一码界.png', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231118105157.png', 'png', '59f4066e9f37f63b10291cb8a3f43bcc_20231118105157.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (5, '2023-11-18 10:57:20.047', '2023-11-18 10:57:20.047', NULL, '一码界.png', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231118105720.png', 'png', '59f4066e9f37f63b10291cb8a3f43bcc_20231118105720.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (6, '2023-11-18 10:59:03.217', '2023-11-18 10:59:03.217', NULL, '一码界.jpg', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231118105903.jpg', 'jpg', '59f4066e9f37f63b10291cb8a3f43bcc_20231118105903.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (7, '2023-11-18 11:06:02.929', '2023-11-18 11:06:02.929', NULL, '一码界.jpg', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231118110602.jpg', 'jpg', '59f4066e9f37f63b10291cb8a3f43bcc_20231118110602.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (8, '2023-11-18 11:09:57.234', '2023-11-18 11:09:57.234', NULL, '一码界.jpg', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231118110957.jpg', 'jpg', '59f4066e9f37f63b10291cb8a3f43bcc_20231118110957.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (9, '2023-11-18 11:10:55.855', '2023-11-18 11:10:55.855', NULL, '一码界.png', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231118111055.png', 'png', '59f4066e9f37f63b10291cb8a3f43bcc_20231118111055.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (10, '2023-11-18 11:12:29.305', '2023-11-18 11:12:29.305', NULL, '一码界.jpg', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231118111229.jpg', 'jpg', '59f4066e9f37f63b10291cb8a3f43bcc_20231118111229.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (11, '2023-11-18 11:13:04.130', '2023-11-18 11:13:04.130', NULL, '一码界.png', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231118111304.png', 'png', '59f4066e9f37f63b10291cb8a3f43bcc_20231118111304.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (12, '2023-11-18 11:15:13.554', '2023-11-18 11:15:13.554', NULL, '一码界.png', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231118111513.png', 'png', '59f4066e9f37f63b10291cb8a3f43bcc_20231118111513.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (13, '2023-11-18 11:17:07.614', '2023-11-18 11:17:07.614', NULL, '一码界.png', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231118111707.png', 'png', '59f4066e9f37f63b10291cb8a3f43bcc_20231118111707.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (14, '2023-11-18 11:40:36.491', '2023-11-18 11:40:36.491', NULL, '一码界.jpg', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231118114036.jpg', 'jpg', '59f4066e9f37f63b10291cb8a3f43bcc_20231118114036.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (15, '2023-11-18 17:16:47.436', '2023-11-18 17:16:47.436', NULL, '一码界.png', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231118171647.png', 'png', '59f4066e9f37f63b10291cb8a3f43bcc_20231118171647.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (16, '2023-11-18 17:17:47.500', '2023-11-18 17:17:47.500', NULL, '一码界.png', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231118171747.png', 'png', '59f4066e9f37f63b10291cb8a3f43bcc_20231118171747.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (17, '2023-11-19 16:06:31.956', '2023-11-19 16:06:31.956', NULL, 'image.png', 'uploads/file/78805a221a988e79ef3f42d7c5bfd418_20231119160631.png', 'png', '78805a221a988e79ef3f42d7c5bfd418_20231119160631.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (18, '2023-11-19 16:08:29.448', '2023-11-19 16:08:29.448', NULL, 'image.png', 'uploads/file/78805a221a988e79ef3f42d7c5bfd418_20231119160829.png', 'png', '78805a221a988e79ef3f42d7c5bfd418_20231119160829.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (19, '2023-11-19 16:09:07.847', '2023-11-19 16:09:07.847', NULL, 'image.png', 'uploads/file/78805a221a988e79ef3f42d7c5bfd418_20231119160907.png', 'png', '78805a221a988e79ef3f42d7c5bfd418_20231119160907.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (20, '2023-11-19 16:10:05.676', '2023-11-19 16:10:05.676', NULL, 'image.png', 'uploads/file/78805a221a988e79ef3f42d7c5bfd418_20231119161005.png', 'png', '78805a221a988e79ef3f42d7c5bfd418_20231119161005.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (21, '2023-11-19 16:13:02.545', '2023-11-19 16:13:02.545', NULL, 'image.png', 'uploads/file/78805a221a988e79ef3f42d7c5bfd418_20231119161302.png', 'png', '78805a221a988e79ef3f42d7c5bfd418_20231119161302.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (22, '2023-11-19 16:14:03.022', '2023-11-19 16:14:03.022', NULL, 'image.png', 'uploads/file/78805a221a988e79ef3f42d7c5bfd418_20231119161403.png', 'png', '78805a221a988e79ef3f42d7c5bfd418_20231119161403.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (23, '2023-11-19 16:14:26.518', '2023-11-19 16:14:26.518', NULL, '一码界.png', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231119161426.png', 'png', '59f4066e9f37f63b10291cb8a3f43bcc_20231119161426.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (24, '2023-11-19 16:20:37.047', '2023-11-19 16:20:37.047', NULL, '81582500616_.pic_hd.jpg', 'uploads/file/d78d3116163290ebd49b433095f555ab_20231119162037.jpg', 'jpg', 'd78d3116163290ebd49b433095f555ab_20231119162037.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (25, '2023-11-20 07:38:57.146', '2023-11-20 07:38:57.146', NULL, 'image.png', 'uploads/file/78805a221a988e79ef3f42d7c5bfd418_20231120073857.png', 'png', '78805a221a988e79ef3f42d7c5bfd418_20231120073857.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (26, '2023-11-20 07:46:49.952', '2023-11-20 07:46:49.952', NULL, '2020-03-27 07-09-23.mp4', 'uploads/file/f9ef1f1d02df3f8a2d4114f73c7435e4_20231120074647.mp4', 'mp4', 'f9ef1f1d02df3f8a2d4114f73c7435e4_20231120074647.mp4');
INSERT INTO `exa_file_upload_and_downloads` VALUES (27, '2023-11-20 07:47:38.240', '2023-11-20 07:47:38.240', NULL, 'image.png', 'uploads/file/78805a221a988e79ef3f42d7c5bfd418_20231120074738.png', 'png', '78805a221a988e79ef3f42d7c5bfd418_20231120074738.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (28, '2023-11-20 07:47:45.620', '2023-11-20 07:47:45.620', NULL, 'image.png', 'uploads/file/78805a221a988e79ef3f42d7c5bfd418_20231120074745.png', 'png', '78805a221a988e79ef3f42d7c5bfd418_20231120074745.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (29, '2023-11-20 07:48:06.057', '2023-11-20 07:48:06.057', NULL, '一码界.jpg', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231120074806.jpg', 'jpg', '59f4066e9f37f63b10291cb8a3f43bcc_20231120074806.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (30, '2023-11-28 11:39:52.209', '2023-11-28 11:39:52.209', NULL, '一码界.png', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231128113952.png', 'png', '59f4066e9f37f63b10291cb8a3f43bcc_20231128113952.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (31, '2023-12-05 07:14:35.070', '2023-12-05 07:14:35.070', NULL, '一码界.jpg', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231205071435.jpg', 'jpg', '59f4066e9f37f63b10291cb8a3f43bcc_20231205071435.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (32, '2023-12-05 07:16:14.145', '2023-12-05 07:16:14.145', NULL, '一码界.jpg', 'uploads/file/59f4066e9f37f63b10291cb8a3f43bcc_20231205071614.jpg', 'jpg', '59f4066e9f37f63b10291cb8a3f43bcc_20231205071614.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (33, '2023-12-05 07:17:01.278', '2023-12-05 07:17:01.278', NULL, '2020-03-27 07-09-23.mp4', 'uploads/file/f9ef1f1d02df3f8a2d4114f73c7435e4_20231205071700.mp4', 'mp4', 'f9ef1f1d02df3f8a2d4114f73c7435e4_20231205071700.mp4');
INSERT INTO `exa_file_upload_and_downloads` VALUES (34, '2023-12-05 07:35:19.217', '2023-12-05 07:35:19.217', NULL, '截屏2021-06-27 下午9.42.22.png', 'uploads/file/fb8469a0c94528ce71e415c904d3be9a_20231205073519.png', 'png', 'fb8469a0c94528ce71e415c904d3be9a_20231205073519.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (35, '2023-12-08 20:36:46.798', '2023-12-08 20:36:46.798', NULL, '交换机 (1).png', 'uploads/file/f9e6dcfa43f9d04d915bd80b38941b96_20231208203646.png', 'png', 'f9e6dcfa43f9d04d915bd80b38941b96_20231208203646.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (36, '2023-12-08 20:37:04.727', '2023-12-08 20:37:04.727', NULL, 'Screenshot_2022-11-04_09-01-39.png', 'uploads/file/59ff290b8e008b4e2199feef0d82c00f_20231208203704.png', 'png', '59ff290b8e008b4e2199feef0d82c00f_20231208203704.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (37, '2023-12-08 20:37:53.546', '2023-12-08 20:37:53.546', NULL, '2020-03-27 07-09-23.mp4', 'uploads/file/f9ef1f1d02df3f8a2d4114f73c7435e4_20231208203753.mp4', 'mp4', 'f9ef1f1d02df3f8a2d4114f73c7435e4_20231208203753.mp4');
INSERT INTO `exa_file_upload_and_downloads` VALUES (38, '2023-12-09 06:32:50.706', '2023-12-09 06:32:50.706', NULL, 'pexels-connor-steinert-13135837.jpg', 'uploads/file/d2f90fec1d5b4ac8abc4b9fe619fba0a_20231209063250.jpg', 'jpg', 'd2f90fec1d5b4ac8abc4b9fe619fba0a_20231209063250.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (39, '2023-12-09 06:33:39.769', '2023-12-09 06:33:39.769', NULL, 'pexels-claudia-marogna-19287989.jpg', 'uploads/file/6d797ee2eded5e2119fc6f336e6c6263_20231209063339.jpg', 'jpg', '6d797ee2eded5e2119fc6f336e6c6263_20231209063339.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (40, '2023-12-09 06:33:48.428', '2023-12-09 06:33:48.428', NULL, 'pexels-christyn-reyes-16143559.jpg', 'uploads/file/46bd87611b6bcb5fab43f7cf20ac7647_20231209063348.jpg', 'jpg', '46bd87611b6bcb5fab43f7cf20ac7647_20231209063348.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (41, '2023-12-09 06:34:00.034', '2023-12-09 06:34:00.034', NULL, 'pexels-connor-steinert-13135837.jpg', 'uploads/file/d2f90fec1d5b4ac8abc4b9fe619fba0a_20231209063359.jpg', 'jpg', 'd2f90fec1d5b4ac8abc4b9fe619fba0a_20231209063359.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (42, '2023-12-09 06:34:27.995', '2023-12-09 06:34:27.995', NULL, 'pexels-connor-steinert-13135837.jpg', 'uploads/file/d2f90fec1d5b4ac8abc4b9fe619fba0a_20231209063427.jpg', 'jpg', 'd2f90fec1d5b4ac8abc4b9fe619fba0a_20231209063427.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (43, '2023-12-09 06:34:50.851', '2023-12-09 06:34:50.851', NULL, 'pexels-connor-steinert-13135837.jpg', 'uploads/file/d2f90fec1d5b4ac8abc4b9fe619fba0a_20231209063450.jpg', 'jpg', 'd2f90fec1d5b4ac8abc4b9fe619fba0a_20231209063450.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (44, '2023-12-09 06:35:08.238', '2023-12-09 06:35:08.238', NULL, 'pexels-claudia-marogna-19287989.jpg', 'uploads/file/6d797ee2eded5e2119fc6f336e6c6263_20231209063508.jpg', 'jpg', '6d797ee2eded5e2119fc6f336e6c6263_20231209063508.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (45, '2023-12-09 06:35:25.509', '2023-12-09 06:35:25.509', NULL, 'pexels-claudia-marogna-19287989.jpg', 'uploads/file/6d797ee2eded5e2119fc6f336e6c6263_20231209063525.jpg', 'jpg', '6d797ee2eded5e2119fc6f336e6c6263_20231209063525.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (46, '2023-12-09 06:35:42.474', '2023-12-09 06:35:42.474', NULL, 'pexels-claudia-marogna-19287989.jpg', 'uploads/file/6d797ee2eded5e2119fc6f336e6c6263_20231209063542.jpg', 'jpg', '6d797ee2eded5e2119fc6f336e6c6263_20231209063542.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (47, '2023-12-09 06:35:59.002', '2023-12-09 06:35:59.002', NULL, 'pexels-connor-steinert-13135837.jpg', 'uploads/file/d2f90fec1d5b4ac8abc4b9fe619fba0a_20231209063558.jpg', 'jpg', 'd2f90fec1d5b4ac8abc4b9fe619fba0a_20231209063558.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (48, '2023-12-09 06:36:16.689', '2023-12-09 06:36:16.689', NULL, 'pexels-christyn-reyes-16143559.jpg', 'uploads/file/46bd87611b6bcb5fab43f7cf20ac7647_20231209063616.jpg', 'jpg', '46bd87611b6bcb5fab43f7cf20ac7647_20231209063616.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (49, '2023-12-09 06:36:31.737', '2023-12-09 06:36:31.737', NULL, 'pexels-connor-steinert-13135837.jpg', 'uploads/file/d2f90fec1d5b4ac8abc4b9fe619fba0a_20231209063631.jpg', 'jpg', 'd2f90fec1d5b4ac8abc4b9fe619fba0a_20231209063631.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (50, '2023-12-09 06:36:43.266', '2023-12-09 06:36:43.266', NULL, 'pexels-connor-steinert-13135837.jpg', 'uploads/file/d2f90fec1d5b4ac8abc4b9fe619fba0a_20231209063643.jpg', 'jpg', 'd2f90fec1d5b4ac8abc4b9fe619fba0a_20231209063643.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (51, '2023-12-14 08:34:43.683', '2023-12-14 08:34:43.683', NULL, 'weipay.jpg', 'uploads/file/6f1155baab9a83be460c595e92739c3f_20231214083443.jpg', 'jpg', '6f1155baab9a83be460c595e92739c3f_20231214083443.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (52, '2023-12-14 22:44:33.185', '2023-12-14 22:44:33.185', NULL, 'bilibili.png', 'uploads/file/130e29f351572e58c49fd4c910d7beb0_20231214224433.png', 'png', '130e29f351572e58c49fd4c910d7beb0_20231214224433.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (53, '2023-12-14 22:45:48.905', '2023-12-14 22:45:48.905', NULL, 'youtube.png', 'uploads/file/ba9bf05693b9fa202d922dd43a08f281_20231214224548.png', 'png', 'ba9bf05693b9fa202d922dd43a08f281_20231214224548.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (54, '2023-12-14 22:46:43.156', '2023-12-14 22:46:43.156', NULL, 'alipay.jpg', 'uploads/file/fa42b816950b79e3c969c637657845ad_20231214224643.jpg', 'jpg', 'fa42b816950b79e3c969c637657845ad_20231214224643.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (55, '2023-12-14 22:47:02.863', '2023-12-14 22:47:02.863', NULL, '微信图片_20231214061941.jpg', 'uploads/file/33c6287e4d35965787db421e8cb16689_20231214224702.jpg', 'jpg', '33c6287e4d35965787db421e8cb16689_20231214224702.jpg');
INSERT INTO `exa_file_upload_and_downloads` VALUES (56, '2023-12-15 06:28:46.723', '2023-12-15 06:28:46.723', NULL, 'weipay.jpg', 'uploads/file/6f1155baab9a83be460c595e92739c3f_20231215062846.jpg', 'jpg', '6f1155baab9a83be460c595e92739c3f_20231215062846.jpg');

-- ----------------------------
-- Table structure for exa_files
-- ----------------------------
DROP TABLE IF EXISTS `exa_files`;
CREATE TABLE `exa_files`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_md5` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `chunk_total` bigint(20) NULL DEFAULT NULL,
  `is_finish` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_exa_files_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job_titles
-- ----------------------------
DROP TABLE IF EXISTS `job_titles`;
CREATE TABLE `job_titles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `job_title_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_job_titles_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jwt_blacklists
-- ----------------------------
DROP TABLE IF EXISTS `jwt_blacklists`;
CREATE TABLE `jwt_blacklists`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `jwt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'jwt',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_jwt_blacklists_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jwt_blacklists
-- ----------------------------
INSERT INTO `jwt_blacklists` VALUES (6, '2023-12-16 12:40:29.349', '2023-12-16 12:40:29.349', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZDk2YjhiODYtNzJiOS00MGE5LTgxY2EtOGQwZDYyNWQ4MDcxIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Ik1yLuWlh-a3vCIsIkF1dGhvcml0eUlkIjo4ODgsIkJ1ZmZlclRpbWUiOjg2NDAwLCJpc3MiOiJxbVBsdXMiLCJhdWQiOlsiR1ZBIl0sImV4cCI6MTcwMzI4NjUwOCwibmJmIjoxNzAyMTYwNzU2fQ.pcHeHqbbiKhsVKsemmzXT2Q3FqYrc5vTvOHB-R4MGbo');
INSERT INTO `jwt_blacklists` VALUES (7, '2023-12-17 21:18:34.852', '2023-12-17 21:18:34.852', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZDk2YjhiODYtNzJiOS00MGE5LTgxY2EtOGQwZDYyNWQ4MDcxIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Ik1yLuWlh-a3vCIsIkF1dGhvcml0eUlkIjo4ODgsIkJ1ZmZlclRpbWUiOjg2NDAwLCJpc3MiOiJxbVBsdXMiLCJhdWQiOlsiR1ZBIl0sImV4cCI6MTcwMzM5ODU3MCwibmJmIjoxNzAyNzkzNzcwfQ.GmejFE7Av3HAm9ZPWarR3CQdA-4N8A6GH93GoiqKiBU');
INSERT INTO `jwt_blacklists` VALUES (8, '2023-12-17 21:22:01.466', '2023-12-17 21:22:01.466', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiZDk2YjhiODYtNzJiOS00MGE5LTgxY2EtOGQwZDYyNWQ4MDcxIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6IuS4gOeggeeVjCIsIkF1dGhvcml0eUlkIjo4ODgsIkJ1ZmZlclRpbWUiOjg2NDAwLCJpc3MiOiJxbVBsdXMiLCJhdWQiOlsiR1ZBIl0sImV4cCI6MTcwMzQyMzkyMiwibmJmIjoxNzAyODE5MTIyfQ.WZNlynPfXwMHQ8Xd1S5i4aLjdquF-1C8e8igGAu_Msk');

-- ----------------------------
-- Table structure for leave
-- ----------------------------
DROP TABLE IF EXISTS `leave`;
CREATE TABLE `leave`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `leave_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请假事由',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_leave_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for license
-- ----------------------------
DROP TABLE IF EXISTS `license`;
CREATE TABLE `license`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `license_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '序列号',
  `license_assets` bigint(20) NULL DEFAULT NULL COMMENT '资源数',
  `license_days` bigint(20) NULL DEFAULT NULL COMMENT '天数',
  `license_product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `license_oem_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理商名称',
  `license_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请人',
  `license_file_md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'md5',
  `license_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'licence file path',
  `start_date_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `end_date_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_license_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `position_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职位',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_position_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品关键字',
  `product_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_product_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rewards
-- ----------------------------
DROP TABLE IF EXISTS `rewards`;
CREATE TABLE `rewards`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `reward_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖惩原因',
  `reward_fraction` bigint(20) NULL DEFAULT NULL COMMENT '奖惩分数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_rewards_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for salary_reason
-- ----------------------------
DROP TABLE IF EXISTS `salary_reason`;
CREATE TABLE `salary_reason`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `salary_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调薪原因',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_salary_reason_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_apis
-- ----------------------------
DROP TABLE IF EXISTS `sys_apis`;
CREATE TABLE `sys_apis`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api路径',
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api中文描述',
  `api_group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api组',
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'POST' COMMENT '方法',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_apis_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_apis
-- ----------------------------
INSERT INTO `sys_apis` VALUES (1, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/jwt/jsonInBlacklist', 'jwt加入黑名单(退出，必选)', 'jwt', 'POST');
INSERT INTO `sys_apis` VALUES (2, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/user/deleteUser', '删除用户', '系统用户', 'DELETE');
INSERT INTO `sys_apis` VALUES (3, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/user/admin_register', '用户注册', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (4, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/user/getUserList', '获取用户列表', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (5, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/user/setUserInfo', '设置用户信息', '系统用户', 'PUT');
INSERT INTO `sys_apis` VALUES (6, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/user/setSelfInfo', '设置自身信息(必选)', '系统用户', 'PUT');
INSERT INTO `sys_apis` VALUES (7, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/user/getUserInfo', '获取自身信息(必选)', '系统用户', 'GET');
INSERT INTO `sys_apis` VALUES (8, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/user/setUserAuthorities', '设置权限组', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (9, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/user/changePassword', '修改密码（建议选择)', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (10, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/user/setUserAuthority', '修改用户角色(必选)', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (11, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/user/resetPassword', '重置用户密码', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (12, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/api/createApi', '创建api', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (13, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/api/deleteApi', '删除Api', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (14, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/api/updateApi', '更新Api', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (15, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/api/getApiList', '获取api列表', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (16, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/api/getAllApis', '获取所有api', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (17, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/api/getApiById', '获取api详细信息', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (18, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/api/deleteApisByIds', '批量删除api', 'api', 'DELETE');
INSERT INTO `sys_apis` VALUES (19, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/authority/copyAuthority', '拷贝角色', '角色', 'POST');
INSERT INTO `sys_apis` VALUES (20, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/authority/createAuthority', '创建角色', '角色', 'POST');
INSERT INTO `sys_apis` VALUES (21, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/authority/deleteAuthority', '删除角色', '角色', 'POST');
INSERT INTO `sys_apis` VALUES (22, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/authority/updateAuthority', '更新角色信息', '角色', 'PUT');
INSERT INTO `sys_apis` VALUES (23, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/authority/getAuthorityList', '获取角色列表', '角色', 'POST');
INSERT INTO `sys_apis` VALUES (24, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/authority/setDataAuthority', '设置角色资源权限', '角色', 'POST');
INSERT INTO `sys_apis` VALUES (25, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/casbin/updateCasbin', '更改角色api权限', 'casbin', 'POST');
INSERT INTO `sys_apis` VALUES (26, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/casbin/getPolicyPathByAuthorityId', '获取权限列表', 'casbin', 'POST');
INSERT INTO `sys_apis` VALUES (27, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/menu/addBaseMenu', '新增菜单', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (28, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/menu/getMenu', '获取菜单树(必选)', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (29, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/menu/deleteBaseMenu', '删除菜单', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (30, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/menu/updateBaseMenu', '更新菜单', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (31, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/menu/getBaseMenuById', '根据id获取菜单', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (32, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/menu/getMenuList', '分页获取基础menu列表', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (33, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/menu/getBaseMenuTree', '获取用户动态路由', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (34, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/menu/getMenuAuthority', '获取指定角色menu', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (35, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/menu/addMenuAuthority', '增加menu和角色关联关系', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (36, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/fileUploadAndDownload/findFile', '寻找目标文件（秒传）', '分片上传', 'GET');
INSERT INTO `sys_apis` VALUES (37, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/fileUploadAndDownload/breakpointContinue', '断点续传', '分片上传', 'POST');
INSERT INTO `sys_apis` VALUES (38, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/fileUploadAndDownload/breakpointContinueFinish', '断点续传完成', '分片上传', 'POST');
INSERT INTO `sys_apis` VALUES (39, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/fileUploadAndDownload/removeChunk', '上传完成移除文件', '分片上传', 'POST');
INSERT INTO `sys_apis` VALUES (40, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/fileUploadAndDownload/upload', '文件上传示例', '文件上传与下载', 'POST');
INSERT INTO `sys_apis` VALUES (41, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/fileUploadAndDownload/deleteFile', '删除文件', '文件上传与下载', 'POST');
INSERT INTO `sys_apis` VALUES (42, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/fileUploadAndDownload/editFileName', '文件名或者备注编辑', '文件上传与下载', 'POST');
INSERT INTO `sys_apis` VALUES (43, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/fileUploadAndDownload/getFileList', '获取上传文件列表', '文件上传与下载', 'POST');
INSERT INTO `sys_apis` VALUES (44, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/system/getServerInfo', '获取服务器信息', '系统服务', 'POST');
INSERT INTO `sys_apis` VALUES (45, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/system/getSystemConfig', '获取配置文件内容', '系统服务', 'POST');
INSERT INTO `sys_apis` VALUES (46, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/system/setSystemConfig', '设置配置文件内容', '系统服务', 'POST');
INSERT INTO `sys_apis` VALUES (47, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/customer/customer', '更新客户', '客户', 'PUT');
INSERT INTO `sys_apis` VALUES (48, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/customer/customer', '创建客户', '客户', 'POST');
INSERT INTO `sys_apis` VALUES (49, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/customer/customer', '删除客户', '客户', 'DELETE');
INSERT INTO `sys_apis` VALUES (50, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/customer/customer', '获取单一客户', '客户', 'GET');
INSERT INTO `sys_apis` VALUES (51, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/customer/customerList', '获取客户列表', '客户', 'GET');
INSERT INTO `sys_apis` VALUES (52, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/autoCode/getDB', '获取所有数据库', '代码生成器', 'GET');
INSERT INTO `sys_apis` VALUES (53, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/autoCode/getTables', '获取数据库表', '代码生成器', 'GET');
INSERT INTO `sys_apis` VALUES (54, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/autoCode/createTemp', '自动化代码', '代码生成器', 'POST');
INSERT INTO `sys_apis` VALUES (55, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/autoCode/preview', '预览自动化代码', '代码生成器', 'POST');
INSERT INTO `sys_apis` VALUES (56, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/autoCode/getColumn', '获取所选table的所有字段', '代码生成器', 'GET');
INSERT INTO `sys_apis` VALUES (57, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/autoCode/createPlug', '自动创建插件包', '代码生成器', 'POST');
INSERT INTO `sys_apis` VALUES (58, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/autoCode/installPlugin', '安装插件', '代码生成器', 'POST');
INSERT INTO `sys_apis` VALUES (59, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/autoCode/pubPlug', '打包插件', '代码生成器', 'POST');
INSERT INTO `sys_apis` VALUES (60, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/autoCode/createPackage', '生成包(package)', '包（pkg）生成器', 'POST');
INSERT INTO `sys_apis` VALUES (61, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/autoCode/getPackage', '获取所有包(package)', '包（pkg）生成器', 'POST');
INSERT INTO `sys_apis` VALUES (62, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/autoCode/delPackage', '删除包(package)', '包（pkg）生成器', 'POST');
INSERT INTO `sys_apis` VALUES (63, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/autoCode/getMeta', '获取meta信息', '代码生成器历史', 'POST');
INSERT INTO `sys_apis` VALUES (64, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/autoCode/rollback', '回滚自动生成代码', '代码生成器历史', 'POST');
INSERT INTO `sys_apis` VALUES (65, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/autoCode/getSysHistory', '查询回滚记录', '代码生成器历史', 'POST');
INSERT INTO `sys_apis` VALUES (66, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/autoCode/delSysHistory', '删除回滚记录', '代码生成器历史', 'POST');
INSERT INTO `sys_apis` VALUES (67, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/sysDictionaryDetail/updateSysDictionaryDetail', '更新字典内容', '系统字典详情', 'PUT');
INSERT INTO `sys_apis` VALUES (68, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/sysDictionaryDetail/createSysDictionaryDetail', '新增字典内容', '系统字典详情', 'POST');
INSERT INTO `sys_apis` VALUES (69, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/sysDictionaryDetail/deleteSysDictionaryDetail', '删除字典内容', '系统字典详情', 'DELETE');
INSERT INTO `sys_apis` VALUES (70, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/sysDictionaryDetail/findSysDictionaryDetail', '根据ID获取字典内容', '系统字典详情', 'GET');
INSERT INTO `sys_apis` VALUES (71, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/sysDictionaryDetail/getSysDictionaryDetailList', '获取字典内容列表', '系统字典详情', 'GET');
INSERT INTO `sys_apis` VALUES (72, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/sysDictionary/createSysDictionary', '新增字典', '系统字典', 'POST');
INSERT INTO `sys_apis` VALUES (73, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/sysDictionary/deleteSysDictionary', '删除字典', '系统字典', 'DELETE');
INSERT INTO `sys_apis` VALUES (74, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/sysDictionary/updateSysDictionary', '更新字典', '系统字典', 'PUT');
INSERT INTO `sys_apis` VALUES (75, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/sysDictionary/findSysDictionary', '根据ID获取字典', '系统字典', 'GET');
INSERT INTO `sys_apis` VALUES (76, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/sysDictionary/getSysDictionaryList', '获取字典列表', '系统字典', 'GET');
INSERT INTO `sys_apis` VALUES (77, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/sysOperationRecord/createSysOperationRecord', '新增操作记录', '操作记录', 'POST');
INSERT INTO `sys_apis` VALUES (78, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/sysOperationRecord/findSysOperationRecord', '根据ID获取操作记录', '操作记录', 'GET');
INSERT INTO `sys_apis` VALUES (79, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/sysOperationRecord/getSysOperationRecordList', '获取操作记录列表', '操作记录', 'GET');
INSERT INTO `sys_apis` VALUES (80, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/sysOperationRecord/deleteSysOperationRecord', '删除操作记录', '操作记录', 'DELETE');
INSERT INTO `sys_apis` VALUES (81, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/sysOperationRecord/deleteSysOperationRecordByIds', '批量删除操作历史', '操作记录', 'DELETE');
INSERT INTO `sys_apis` VALUES (82, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/simpleUploader/upload', '插件版分片上传', '断点续传(插件版)', 'POST');
INSERT INTO `sys_apis` VALUES (83, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/simpleUploader/checkFileMd5', '文件完整度验证', '断点续传(插件版)', 'GET');
INSERT INTO `sys_apis` VALUES (84, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/simpleUploader/mergeFileMd5', '上传完成合并文件', '断点续传(插件版)', 'GET');
INSERT INTO `sys_apis` VALUES (85, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/email/emailTest', '发送测试邮件', 'email', 'POST');
INSERT INTO `sys_apis` VALUES (86, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/email/emailSend', '发送邮件示例', 'email', 'POST');
INSERT INTO `sys_apis` VALUES (87, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/authorityBtn/setAuthorityBtn', '设置按钮权限', '按钮权限', 'POST');
INSERT INTO `sys_apis` VALUES (88, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/authorityBtn/getAuthorityBtn', '获取已有按钮权限', '按钮权限', 'POST');
INSERT INTO `sys_apis` VALUES (89, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/authorityBtn/canRemoveAuthorityBtn', '删除按钮', '按钮权限', 'POST');
INSERT INTO `sys_apis` VALUES (90, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/chatGpt/getTable', '通过gpt获取内容', '万用表格', 'POST');
INSERT INTO `sys_apis` VALUES (91, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/chatGpt/createSK', '录入sk', '万用表格', 'POST');
INSERT INTO `sys_apis` VALUES (92, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/chatGpt/getSK', '获取sk', '万用表格', 'GET');
INSERT INTO `sys_apis` VALUES (93, '2023-11-14 23:12:57.598', '2023-11-14 23:12:57.598', NULL, '/chatGpt/deleteSK', '删除sk', '万用表格', 'DELETE');
INSERT INTO `sys_apis` VALUES (94, '2023-11-15 08:23:13.486', '2023-11-15 08:23:13.486', NULL, '/tblContent/createTblContent', '新增tblContent表', 'tblContent表', 'POST');
INSERT INTO `sys_apis` VALUES (95, '2023-11-15 08:23:13.487', '2023-11-15 08:23:13.487', NULL, '/tblContent/deleteTblContent', '删除tblContent表', 'tblContent表', 'DELETE');
INSERT INTO `sys_apis` VALUES (96, '2023-11-15 08:23:13.489', '2023-11-15 08:23:13.489', NULL, '/tblContent/deleteTblContentByIds', '批量删除tblContent表', 'tblContent表', 'DELETE');
INSERT INTO `sys_apis` VALUES (97, '2023-11-15 08:23:13.490', '2023-11-15 08:23:13.490', NULL, '/tblContent/updateTblContent', '更新tblContent表', 'tblContent表', 'PUT');
INSERT INTO `sys_apis` VALUES (98, '2023-11-15 08:23:13.491', '2023-11-15 08:23:13.491', NULL, '/tblContent/findTblContent', '根据ID获取tblContent表', 'tblContent表', 'GET');
INSERT INTO `sys_apis` VALUES (99, '2023-11-15 08:23:13.492', '2023-11-15 08:23:13.492', NULL, '/tblContent/getTblContentList', '获取tblContent表列表', 'tblContent表', 'GET');
INSERT INTO `sys_apis` VALUES (100, '2023-11-15 08:23:43.372', '2023-11-15 08:23:43.372', NULL, '/tblContentMeta/createTblContentMeta', '新增tblContentMeta表', 'tblContentMeta表', 'POST');
INSERT INTO `sys_apis` VALUES (101, '2023-11-15 08:23:43.373', '2023-11-15 08:23:43.373', NULL, '/tblContentMeta/deleteTblContentMeta', '删除tblContentMeta表', 'tblContentMeta表', 'DELETE');
INSERT INTO `sys_apis` VALUES (102, '2023-11-15 08:23:43.374', '2023-11-15 08:23:43.374', NULL, '/tblContentMeta/deleteTblContentMetaByIds', '批量删除tblContentMeta表', 'tblContentMeta表', 'DELETE');
INSERT INTO `sys_apis` VALUES (103, '2023-11-15 08:23:43.376', '2023-11-15 08:23:43.376', NULL, '/tblContentMeta/updateTblContentMeta', '更新tblContentMeta表', 'tblContentMeta表', 'PUT');
INSERT INTO `sys_apis` VALUES (104, '2023-11-15 08:23:43.377', '2023-11-15 08:23:43.377', NULL, '/tblContentMeta/findTblContentMeta', '根据ID获取tblContentMeta表', 'tblContentMeta表', 'GET');
INSERT INTO `sys_apis` VALUES (105, '2023-11-15 08:23:43.379', '2023-11-15 08:23:43.379', NULL, '/tblContentMeta/getTblContentMetaList', '获取tblContentMeta表列表', 'tblContentMeta表', 'GET');
INSERT INTO `sys_apis` VALUES (106, '2023-11-15 08:24:02.848', '2023-11-15 08:24:02.848', NULL, '/tblMeta/createTblMeta', '新增tblMeta表', 'tblMeta表', 'POST');
INSERT INTO `sys_apis` VALUES (107, '2023-11-15 08:24:02.850', '2023-11-15 08:24:02.850', NULL, '/tblMeta/deleteTblMeta', '删除tblMeta表', 'tblMeta表', 'DELETE');
INSERT INTO `sys_apis` VALUES (108, '2023-11-15 08:24:02.851', '2023-11-15 08:24:02.851', NULL, '/tblMeta/deleteTblMetaByIds', '批量删除tblMeta表', 'tblMeta表', 'DELETE');
INSERT INTO `sys_apis` VALUES (109, '2023-11-15 08:24:02.853', '2023-11-15 08:24:02.853', NULL, '/tblMeta/updateTblMeta', '更新tblMeta表', 'tblMeta表', 'PUT');
INSERT INTO `sys_apis` VALUES (110, '2023-11-15 08:24:02.855', '2023-11-15 08:24:02.855', NULL, '/tblMeta/findTblMeta', '根据ID获取tblMeta表', 'tblMeta表', 'GET');
INSERT INTO `sys_apis` VALUES (111, '2023-11-15 08:24:02.857', '2023-11-15 08:24:02.857', NULL, '/tblMeta/getTblMetaList', '获取tblMeta表列表', 'tblMeta表', 'GET');
INSERT INTO `sys_apis` VALUES (112, '2023-11-28 11:18:13.148', '2023-11-28 11:18:13.148', NULL, '/tblMeta/getTblMetaListAll', '获取所有的菜单类型', 'tblMeta表', 'GET');

-- ----------------------------
-- Table structure for sys_authorities
-- ----------------------------
DROP TABLE IF EXISTS `sys_authorities`;
CREATE TABLE `sys_authorities`  (
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `authority_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `authority_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '父角色ID',
  `default_router` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'dashboard' COMMENT '默认菜单',
  PRIMARY KEY (`authority_id`) USING BTREE,
  UNIQUE INDEX `authority_id`(`authority_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9529 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_authorities
-- ----------------------------
INSERT INTO `sys_authorities` VALUES ('2023-11-14 23:12:57.609', '2023-11-16 07:22:04.935', NULL, 888, '普通用户', 0, 'dashboard');
INSERT INTO `sys_authorities` VALUES ('2023-11-14 23:12:57.609', '2023-11-14 23:12:57.804', NULL, 8881, '普通用户子角色', 888, 'dashboard');
INSERT INTO `sys_authorities` VALUES ('2023-11-14 23:12:57.609', '2023-11-14 23:12:57.798', NULL, 9528, '测试角色', 0, 'dashboard');

-- ----------------------------
-- Table structure for sys_authority_btns
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority_btns`;
CREATE TABLE `sys_authority_btns`  (
  `authority_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '角色ID',
  `sys_menu_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '菜单ID',
  `sys_base_menu_btn_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '菜单按钮ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_authority_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority_menus`;
CREATE TABLE `sys_authority_menus`  (
  `sys_base_menu_id` bigint(20) UNSIGNED NOT NULL,
  `sys_authority_authority_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_base_menu_id`, `sys_authority_authority_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_authority_menus
-- ----------------------------
INSERT INTO `sys_authority_menus` VALUES (1, 888);
INSERT INTO `sys_authority_menus` VALUES (1, 8881);
INSERT INTO `sys_authority_menus` VALUES (1, 9528);
INSERT INTO `sys_authority_menus` VALUES (3, 888);
INSERT INTO `sys_authority_menus` VALUES (4, 888);
INSERT INTO `sys_authority_menus` VALUES (4, 8881);
INSERT INTO `sys_authority_menus` VALUES (5, 888);
INSERT INTO `sys_authority_menus` VALUES (5, 8881);
INSERT INTO `sys_authority_menus` VALUES (6, 888);
INSERT INTO `sys_authority_menus` VALUES (6, 8881);
INSERT INTO `sys_authority_menus` VALUES (7, 888);
INSERT INTO `sys_authority_menus` VALUES (7, 8881);
INSERT INTO `sys_authority_menus` VALUES (8, 888);
INSERT INTO `sys_authority_menus` VALUES (8, 8881);
INSERT INTO `sys_authority_menus` VALUES (8, 9528);
INSERT INTO `sys_authority_menus` VALUES (9, 888);
INSERT INTO `sys_authority_menus` VALUES (9, 8881);
INSERT INTO `sys_authority_menus` VALUES (10, 888);
INSERT INTO `sys_authority_menus` VALUES (10, 8881);
INSERT INTO `sys_authority_menus` VALUES (11, 888);
INSERT INTO `sys_authority_menus` VALUES (11, 8881);
INSERT INTO `sys_authority_menus` VALUES (12, 888);
INSERT INTO `sys_authority_menus` VALUES (13, 888);
INSERT INTO `sys_authority_menus` VALUES (13, 8881);
INSERT INTO `sys_authority_menus` VALUES (14, 888);
INSERT INTO `sys_authority_menus` VALUES (14, 8881);
INSERT INTO `sys_authority_menus` VALUES (15, 888);
INSERT INTO `sys_authority_menus` VALUES (15, 8881);
INSERT INTO `sys_authority_menus` VALUES (16, 888);
INSERT INTO `sys_authority_menus` VALUES (16, 8881);
INSERT INTO `sys_authority_menus` VALUES (17, 888);
INSERT INTO `sys_authority_menus` VALUES (17, 8881);
INSERT INTO `sys_authority_menus` VALUES (18, 888);
INSERT INTO `sys_authority_menus` VALUES (19, 888);
INSERT INTO `sys_authority_menus` VALUES (20, 888);
INSERT INTO `sys_authority_menus` VALUES (21, 888);
INSERT INTO `sys_authority_menus` VALUES (23, 888);
INSERT INTO `sys_authority_menus` VALUES (24, 888);
INSERT INTO `sys_authority_menus` VALUES (25, 888);
INSERT INTO `sys_authority_menus` VALUES (26, 888);
INSERT INTO `sys_authority_menus` VALUES (27, 888);
INSERT INTO `sys_authority_menus` VALUES (28, 888);
INSERT INTO `sys_authority_menus` VALUES (29, 888);
INSERT INTO `sys_authority_menus` VALUES (30, 888);
INSERT INTO `sys_authority_menus` VALUES (31, 888);
INSERT INTO `sys_authority_menus` VALUES (32, 888);
INSERT INTO `sys_authority_menus` VALUES (33, 888);

-- ----------------------------
-- Table structure for sys_auto_code_histories
-- ----------------------------
DROP TABLE IF EXISTS `sys_auto_code_histories`;
CREATE TABLE `sys_auto_code_histories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `package` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `business_db` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `table_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `request_meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `auto_code_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `injection_meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `struct_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `struct_cn_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `api_ids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `flag` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_auto_code_histories_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_auto_code_histories
-- ----------------------------
INSERT INTO `sys_auto_code_histories` VALUES (1, '2023-11-15 08:23:13.686', '2023-11-15 08:23:13.686', NULL, 'blog', '', 'tbl_content', '{\"structName\":\"TblContent\",\"tableName\":\"tbl_content\",\"packageName\":\"tblContent\",\"humpPackageName\":\"tbl_content\",\"abbreviation\":\"tblContent\",\"description\":\"tblContent表\",\"autoCreateApiToSql\":true,\"autoCreateResource\":false,\"autoMoveFile\":true,\"businessDB\":\"\",\"fields\":[{\"fieldName\":\"AllowComment\",\"fieldDesc\":\"是否允许评论\",\"fieldType\":\"string\",\"fieldJson\":\"allowComment\",\"dataTypeLong\":\"255\",\"comment\":\"是否允许评论\",\"columnName\":\"allow_comment\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"AuthorId\",\"fieldDesc\":\"作者ID\",\"fieldType\":\"int\",\"fieldJson\":\"authorId\",\"dataTypeLong\":\"19\",\"comment\":\"作者ID\",\"columnName\":\"author_id\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"CommentsNum\",\"fieldDesc\":\"内容所属评论数\",\"fieldType\":\"int\",\"fieldJson\":\"commentsNum\",\"dataTypeLong\":\"10\",\"comment\":\"内容所属评论数\",\"columnName\":\"comments_num\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"Content\",\"fieldDesc\":\"内容文字\",\"fieldType\":\"string\",\"fieldJson\":\"content\",\"dataTypeLong\":\"\",\"comment\":\"内容文字\",\"columnName\":\"content\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"CreateTime\",\"fieldDesc\":\"创建时间\",\"fieldType\":\"time.Time\",\"fieldJson\":\"createTime\",\"dataTypeLong\":\"\",\"comment\":\"创建时间\",\"columnName\":\"create_time\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"DownNum\",\"fieldDesc\":\"踩数量\",\"fieldType\":\"int\",\"fieldJson\":\"downNum\",\"dataTypeLong\":\"10\",\"comment\":\"踩数量\",\"columnName\":\"down_num\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"Img\",\"fieldDesc\":\"内容图片路径\",\"fieldType\":\"string\",\"fieldJson\":\"img\",\"dataTypeLong\":\"255\",\"comment\":\"内容图片路径\",\"columnName\":\"img\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"LikesNum\",\"fieldDesc\":\"点赞数量\",\"fieldType\":\"int\",\"fieldJson\":\"likesNum\",\"dataTypeLong\":\"10\",\"comment\":\"点赞数量\",\"columnName\":\"likes_num\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"Order\",\"fieldDesc\":\"内容顺序\",\"fieldType\":\"int\",\"fieldJson\":\"order\",\"dataTypeLong\":\"10\",\"comment\":\"内容顺序\",\"columnName\":\"order\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"Password\",\"fieldDesc\":\"保护密码\",\"fieldType\":\"string\",\"fieldJson\":\"password\",\"dataTypeLong\":\"255\",\"comment\":\"保护密码\",\"columnName\":\"password\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"ShareNum\",\"fieldDesc\":\"分享数量\",\"fieldType\":\"int\",\"fieldJson\":\"shareNum\",\"dataTypeLong\":\"10\",\"comment\":\"分享数量\",\"columnName\":\"share_num\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"Status\",\"fieldDesc\":\"内容状态\",\"fieldType\":\"string\",\"fieldJson\":\"status\",\"dataTypeLong\":\"255\",\"comment\":\"内容状态\",\"columnName\":\"status\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"Summary\",\"fieldDesc\":\"内容摘要\",\"fieldType\":\"string\",\"fieldJson\":\"summary\",\"dataTypeLong\":\"255\",\"comment\":\"内容摘要\",\"columnName\":\"summary\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"Title\",\"fieldDesc\":\"内容标题\",\"fieldType\":\"string\",\"fieldJson\":\"title\",\"dataTypeLong\":\"255\",\"comment\":\"内容标题\",\"columnName\":\"title\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"Type\",\"fieldDesc\":\"内容类别\",\"fieldType\":\"string\",\"fieldJson\":\"type\",\"dataTypeLong\":\"255\",\"comment\":\"内容类别\",\"columnName\":\"type\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"UpdateTime\",\"fieldDesc\":\"修改时间\",\"fieldType\":\"time.Time\",\"fieldJson\":\"updateTime\",\"dataTypeLong\":\"\",\"comment\":\"修改时间\",\"columnName\":\"update_time\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"ViemNum\",\"fieldDesc\":\"浏览数量\",\"fieldType\":\"int\",\"fieldJson\":\"viemNum\",\"dataTypeLong\":\"10\",\"comment\":\"浏览数量\",\"columnName\":\"viem_num\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false}],\"HasTimer\":true,\"package\":\"blog\"}', '/Volumes/person/code/blog/after/gin-vue-admin/server/api/v1/blog/tbl_content.go;/Volumes/person/code/blog/after/gin-vue-admin/server/model/blog/tbl_content.go;/Volumes/person/code/blog/after/gin-vue-admin/server/model/blog/request/tbl_content.go;/Volumes/person/code/blog/after/gin-vue-admin/server/router/blog/tbl_content.go;/Volumes/person/code/blog/after/gin-vue-admin/server/service/blog/tbl_content.go;/Volumes/person/code/blog/after/gin-vue-admin/web/src/api/tblContent.js;/Volumes/person/code/blog/after/gin-vue-admin/web/src/view/tblContent/tblContentForm.vue;/Volumes/person/code/blog/after/gin-vue-admin/web/src/view/tblContent/tblContent.vue;', '/Volumes/person/code/blog/after/gin-vue-admin/server/api/v1/blog/enter.go@ApiGroup@TblContentApi;/Volumes/person/code/blog/after/gin-vue-admin/server/router/blog/enter.go@RouterGroup@TblContentRouter;/Volumes/person/code/blog/after/gin-vue-admin/server/service/blog/enter.go@ServiceGroup@TblContentService;', 'TblContent', 'tblContent表', '94;95;96;97;98;99;', 0);
INSERT INTO `sys_auto_code_histories` VALUES (2, '2023-11-15 08:23:43.535', '2023-11-15 08:23:43.535', NULL, 'blog', '', 'tbl_content_meta', '{\"structName\":\"TblContentMeta\",\"tableName\":\"tbl_content_meta\",\"packageName\":\"tblContentMeta\",\"humpPackageName\":\"tbl_content_meta\",\"abbreviation\":\"tblContentMeta\",\"description\":\"tblContentMeta表\",\"autoCreateApiToSql\":true,\"autoCreateResource\":false,\"autoMoveFile\":true,\"businessDB\":\"\",\"fields\":[{\"fieldName\":\"ContentId\",\"fieldDesc\":\"内容ID\",\"fieldType\":\"int\",\"fieldJson\":\"contentId\",\"dataTypeLong\":\"19\",\"comment\":\"内容ID\",\"columnName\":\"content_id\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"MateId\",\"fieldDesc\":\"项目ID\",\"fieldType\":\"int\",\"fieldJson\":\"mateId\",\"dataTypeLong\":\"19\",\"comment\":\"项目ID\",\"columnName\":\"mate_id\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false}],\"HasTimer\":false,\"package\":\"blog\"}', '/Volumes/person/code/blog/after/gin-vue-admin/server/api/v1/blog/tbl_content_meta.go;/Volumes/person/code/blog/after/gin-vue-admin/server/model/blog/tbl_content_meta.go;/Volumes/person/code/blog/after/gin-vue-admin/server/model/blog/request/tbl_content_meta.go;/Volumes/person/code/blog/after/gin-vue-admin/server/router/blog/tbl_content_meta.go;/Volumes/person/code/blog/after/gin-vue-admin/server/service/blog/tbl_content_meta.go;/Volumes/person/code/blog/after/gin-vue-admin/web/src/api/tblContentMeta.js;/Volumes/person/code/blog/after/gin-vue-admin/web/src/view/tblContentMeta/tblContentMetaForm.vue;/Volumes/person/code/blog/after/gin-vue-admin/web/src/view/tblContentMeta/tblContentMeta.vue;', '/Volumes/person/code/blog/after/gin-vue-admin/server/api/v1/blog/enter.go@ApiGroup@TblContentMetaApi;/Volumes/person/code/blog/after/gin-vue-admin/server/router/blog/enter.go@RouterGroup@TblContentMetaRouter;/Volumes/person/code/blog/after/gin-vue-admin/server/service/blog/enter.go@ServiceGroup@TblContentMetaService;', 'TblContentMeta', 'tblContentMeta表', '100;101;102;103;104;105;', 0);
INSERT INTO `sys_auto_code_histories` VALUES (3, '2023-11-15 08:24:03.122', '2023-11-15 08:24:03.122', NULL, 'blog', '', 'tbl_meta', '{\"structName\":\"TblMeta\",\"tableName\":\"tbl_meta\",\"packageName\":\"tblMeta\",\"humpPackageName\":\"tbl_meta\",\"abbreviation\":\"tblMeta\",\"description\":\"tblMeta表\",\"autoCreateApiToSql\":true,\"autoCreateResource\":false,\"autoMoveFile\":true,\"businessDB\":\"\",\"fields\":[{\"fieldName\":\"Count\",\"fieldDesc\":\"项目所属内容个数\",\"fieldType\":\"int\",\"fieldJson\":\"count\",\"dataTypeLong\":\"10\",\"comment\":\"项目所属内容个数\",\"columnName\":\"count\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"Description\",\"fieldDesc\":\"项目描述\",\"fieldType\":\"string\",\"fieldJson\":\"description\",\"dataTypeLong\":\"255\",\"comment\":\"项目描述\",\"columnName\":\"description\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"Name\",\"fieldDesc\":\"项目名称\",\"fieldType\":\"string\",\"fieldJson\":\"name\",\"dataTypeLong\":\"255\",\"comment\":\"项目名称\",\"columnName\":\"name\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"Order\",\"fieldDesc\":\"内容排序\",\"fieldType\":\"int\",\"fieldJson\":\"order\",\"dataTypeLong\":\"10\",\"comment\":\"内容排序\",\"columnName\":\"order\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"Type\",\"fieldDesc\":\"项目类型\",\"fieldType\":\"string\",\"fieldJson\":\"type\",\"dataTypeLong\":\"255\",\"comment\":\"项目类型\",\"columnName\":\"type\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false}],\"HasTimer\":false,\"package\":\"blog\"}', '/Volumes/person/code/blog/after/gin-vue-admin/server/api/v1/blog/tbl_meta.go;/Volumes/person/code/blog/after/gin-vue-admin/server/model/blog/tbl_meta.go;/Volumes/person/code/blog/after/gin-vue-admin/server/model/blog/request/tbl_meta.go;/Volumes/person/code/blog/after/gin-vue-admin/server/router/blog/tbl_meta.go;/Volumes/person/code/blog/after/gin-vue-admin/server/service/blog/tbl_meta.go;/Volumes/person/code/blog/after/gin-vue-admin/web/src/api/tblMeta.js;/Volumes/person/code/blog/after/gin-vue-admin/web/src/view/tblMeta/tblMetaForm.vue;/Volumes/person/code/blog/after/gin-vue-admin/web/src/view/tblMeta/tblMeta.vue;', '/Volumes/person/code/blog/after/gin-vue-admin/server/api/v1/blog/enter.go@ApiGroup@TblMetaApi;/Volumes/person/code/blog/after/gin-vue-admin/server/router/blog/enter.go@RouterGroup@TblMetaRouter;/Volumes/person/code/blog/after/gin-vue-admin/server/service/blog/enter.go@ServiceGroup@TblMetaService;', 'TblMeta', 'tblMeta表', '106;107;108;109;110;111;', 0);

-- ----------------------------
-- Table structure for sys_auto_codes
-- ----------------------------
DROP TABLE IF EXISTS `sys_auto_codes`;
CREATE TABLE `sys_auto_codes`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `package_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展示名',
  `desc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_auto_codes_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_auto_codes
-- ----------------------------
INSERT INTO `sys_auto_codes` VALUES (1, '2023-11-15 08:22:31.852', '2023-11-15 08:22:31.852', NULL, 'blog', '博客', '博客包');

-- ----------------------------
-- Table structure for sys_base_menu_btns
-- ----------------------------
DROP TABLE IF EXISTS `sys_base_menu_btns`;
CREATE TABLE `sys_base_menu_btns`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按钮关键key',
  `desc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sys_base_menu_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_base_menu_btns_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_base_menu_parameters
-- ----------------------------
DROP TABLE IF EXISTS `sys_base_menu_parameters`;
CREATE TABLE `sys_base_menu_parameters`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `sys_base_menu_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址栏携带参数为params还是query',
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址栏携带参数的key',
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址栏携带参数的值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_base_menu_parameters_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_base_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_base_menus`;
CREATE TABLE `sys_base_menus`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `menu_level` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `parent_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父菜单ID',
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由path',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由name',
  `hidden` tinyint(1) NULL DEFAULT NULL COMMENT '是否在列表隐藏',
  `component` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应前端文件路径',
  `sort` bigint(20) NULL DEFAULT NULL COMMENT '排序标记',
  `active_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加属性',
  `keep_alive` tinyint(1) NULL DEFAULT NULL COMMENT '附加属性',
  `default_menu` tinyint(1) NULL DEFAULT NULL COMMENT '附加属性',
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加属性',
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附加属性',
  `close_tab` tinyint(1) NULL DEFAULT NULL COMMENT '附加属性',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_base_menus_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_base_menus
-- ----------------------------
INSERT INTO `sys_base_menus` VALUES (1, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '0', 'dashboard', 'dashboard', 0, 'view/dashboard/index.vue', 1, '', 0, 0, '仪表盘', 'odometer', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (2, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', '2023-11-16 07:16:16.522', 0, '0', 'about', 'about', 0, 'view/about/index.vue', 9, '', 0, 0, '关于我们', 'info-filled', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (3, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '0', 'admin', 'superAdmin', 0, 'view/superAdmin/index.vue', 3, '', 0, 0, '超级管理员', 'user', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (4, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '3', 'authority', 'authority', 0, 'view/superAdmin/authority/authority.vue', 1, '', 0, 0, '角色管理', 'avatar', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (5, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '3', 'menu', 'menu', 0, 'view/superAdmin/menu/menu.vue', 2, '', 1, 0, '菜单管理', 'tickets', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (6, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '3', 'api', 'api', 0, 'view/superAdmin/api/api.vue', 3, '', 1, 0, 'api管理', 'platform', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (7, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '3', 'user', 'user', 0, 'view/superAdmin/user/user.vue', 4, '', 0, 0, '用户管理', 'coordinate', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (8, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '3', 'dictionary', 'dictionary', 0, 'view/superAdmin/dictionary/sysDictionary.vue', 5, '', 0, 0, '字典管理', 'notebook', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (9, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '3', 'operation', 'operation', 0, 'view/superAdmin/operation/sysOperationRecord.vue', 6, '', 0, 0, '操作历史', 'pie-chart', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (10, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '0', 'person', 'person', 1, 'view/person/person.vue', 4, '', 0, 0, '个人信息', 'message', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (11, '2023-11-14 23:12:57.636', '2023-12-17 21:20:49.071', NULL, 0, '0', 'example', 'example', 1, 'view/example/index.vue', 7, '', 0, 0, '示例文件', 'management', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (12, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '11', 'upload', 'upload', 0, 'view/example/upload/upload.vue', 5, '', 0, 0, '媒体库（上传下载）', 'upload', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (13, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '11', 'breakpoint', 'breakpoint', 0, 'view/example/breakpoint/breakpoint.vue', 6, '', 0, 0, '断点续传', 'upload-filled', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (14, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '11', 'customer', 'customer', 0, 'view/example/customer/customer.vue', 7, '', 0, 0, '客户列表（资源示例）', 'avatar', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (15, '2023-11-14 23:12:57.636', '2023-12-17 21:21:25.008', NULL, 0, '0', 'systemTools', 'systemTools', 1, 'view/systemTools/index.vue', 5, '', 0, 0, '系统工具', 'tools', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (16, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '15', 'autoCode', 'autoCode', 0, 'view/systemTools/autoCode/index.vue', 1, '', 1, 0, '代码生成器', 'cpu', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (17, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '15', 'formCreate', 'formCreate', 0, 'view/systemTools/formCreate/index.vue', 2, '', 1, 0, '表单生成器', 'magic-stick', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (18, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '15', 'system', 'system', 0, 'view/systemTools/system/system.vue', 3, '', 0, 0, '系统配置', 'operation', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (19, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '15', 'autoCodeAdmin', 'autoCodeAdmin', 0, 'view/systemTools/autoCodeAdmin/index.vue', 1, '', 0, 0, '自动化代码管理', 'magic-stick', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (20, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '15', 'autoCodeEdit/:id', 'autoCodeEdit', 1, 'view/systemTools/autoCode/index.vue', 0, '', 0, 0, '自动化代码-${id}', 'magic-stick', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (21, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '15', 'autoPkg', 'autoPkg', 0, 'view/systemTools/autoPkg/autoPkg.vue', 0, '', 0, 0, '自动化package', 'folder', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (22, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', '2023-11-16 07:16:11.633', 0, '0', 'https://www.gin-vue-admin.com', 'https://www.gin-vue-admin.com', 0, '/', 0, '', 0, 0, '官方网站', 'home-filled', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (23, '2023-11-14 23:12:57.636', '2023-12-17 21:20:58.317', NULL, 0, '0', 'state', 'state', 1, 'view/system/state.vue', 8, '', 0, 0, '服务器状态', 'cloudy', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (24, '2023-11-14 23:12:57.636', '2023-12-17 21:20:38.605', NULL, 0, '0', 'plugin', 'plugin', 1, 'view/routerHolder.vue', 6, '', 0, 0, '插件系统', 'cherry', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (25, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '24', 'https://plugin.gin-vue-admin.com/', 'https://plugin.gin-vue-admin.com/', 0, 'https://plugin.gin-vue-admin.com/', 0, '', 0, 0, '插件市场', 'shop', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (26, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '24', 'installPlugin', 'installPlugin', 0, 'view/systemTools/installPlugin/index.vue', 1, '', 0, 0, '插件安装', 'box', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (27, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '24', 'autoPlug', 'autoPlug', 0, 'view/systemTools/autoPlug/autoPlug.vue', 2, '', 0, 0, '插件模板', 'folder', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (28, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '24', 'pubPlug', 'pubPlug', 0, 'view/systemTools/pubPlug/pubPlug.vue', 3, '', 0, 0, '打包插件', 'files', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (29, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '24', 'plugin-email', 'plugin-email', 0, 'plugin/email/view/index.vue', 4, '', 0, 0, '邮件插件', 'message', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (30, '2023-11-14 23:12:57.636', '2023-11-14 23:12:57.636', NULL, 0, '15', 'chatTable', 'chatTable', 0, 'view/chatgpt/chatTable.vue', 6, '', 0, 0, '万用表格', 'chat-dot-square', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (31, '2023-11-16 07:15:59.266', '2023-11-16 07:15:59.266', NULL, 0, '0', 'blog', 'blog', 0, 'view/blog/index.vue', 4, '', 0, 0, '博客管理', 'coin', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (32, '2023-11-16 07:20:39.452', '2023-11-16 07:20:39.452', NULL, 0, '31', 'tblContent', 'tblContent', 0, 'view/tblContent/tblContent.vue', 32, '', 0, 0, '内容管理', 'box', 0, NULL);
INSERT INTO `sys_base_menus` VALUES (33, '2023-11-16 07:21:22.847', '2023-11-16 07:21:22.847', NULL, 0, '31', 'tblMeta', 'tblMeta', 0, 'view/tblMeta/tblMeta.vue', 33, '', 0, 0, '项目管理', 'basketball', 0, NULL);

-- ----------------------------
-- Table structure for sys_chat_gpt_options
-- ----------------------------
DROP TABLE IF EXISTS `sys_chat_gpt_options`;
CREATE TABLE `sys_chat_gpt_options`  (
  `sk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_data_authority_id
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_authority_id`;
CREATE TABLE `sys_data_authority_id`  (
  `sys_authority_authority_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色ID',
  `data_authority_id_authority_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_authority_authority_id`, `data_authority_id_authority_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_data_authority_id
-- ----------------------------
INSERT INTO `sys_data_authority_id` VALUES (888, 888);
INSERT INTO `sys_data_authority_id` VALUES (888, 8881);
INSERT INTO `sys_data_authority_id` VALUES (888, 9528);
INSERT INTO `sys_data_authority_id` VALUES (9528, 8881);
INSERT INTO `sys_data_authority_id` VALUES (9528, 9528);

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典名（中）',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典名（英）',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  `desc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_dictionaries_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES (1, '2023-11-14 23:12:57.617', '2023-11-14 23:12:57.620', NULL, '性别', 'gender', 1, '性别字典');
INSERT INTO `sys_dictionaries` VALUES (2, '2023-11-14 23:12:57.617', '2023-11-14 23:12:57.622', NULL, '数据库int类型', 'int', 1, 'int类型对应的数据库类型');
INSERT INTO `sys_dictionaries` VALUES (3, '2023-11-14 23:12:57.617', '2023-11-14 23:12:57.624', NULL, '数据库时间日期类型', 'time.Time', 1, '数据库时间日期类型');
INSERT INTO `sys_dictionaries` VALUES (4, '2023-11-14 23:12:57.617', '2023-11-14 23:12:57.627', NULL, '数据库浮点型', 'float64', 1, '数据库浮点型');
INSERT INTO `sys_dictionaries` VALUES (5, '2023-11-14 23:12:57.617', '2023-11-14 23:12:57.630', NULL, '数据库字符串', 'string', 1, '数据库字符串');
INSERT INTO `sys_dictionaries` VALUES (6, '2023-11-14 23:12:57.617', '2023-11-14 23:12:57.632', NULL, '数据库bool类型', 'bool', 1, '数据库bool类型');

-- ----------------------------
-- Table structure for sys_dictionary_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary_details`;
CREATE TABLE `sys_dictionary_details`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展示值',
  `value` bigint(20) NULL DEFAULT NULL COMMENT '字典值',
  `extend` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展值',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '启用状态',
  `sort` bigint(20) NULL DEFAULT NULL COMMENT '排序标记',
  `sys_dictionary_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '关联标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_dictionary_details_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionary_details
-- ----------------------------
INSERT INTO `sys_dictionary_details` VALUES (1, '2023-11-14 23:12:57.620', '2023-11-14 23:12:57.620', NULL, '男', 1, '', 1, 1, 1);
INSERT INTO `sys_dictionary_details` VALUES (2, '2023-11-14 23:12:57.620', '2023-11-14 23:12:57.620', NULL, '女', 2, '', 1, 2, 1);
INSERT INTO `sys_dictionary_details` VALUES (3, '2023-11-14 23:12:57.622', '2023-11-14 23:12:57.622', NULL, 'smallint', 1, '', 1, 1, 2);
INSERT INTO `sys_dictionary_details` VALUES (4, '2023-11-14 23:12:57.622', '2023-11-14 23:12:57.622', NULL, 'mediumint', 2, '', 1, 2, 2);
INSERT INTO `sys_dictionary_details` VALUES (5, '2023-11-14 23:12:57.622', '2023-11-14 23:12:57.622', NULL, 'int', 3, '', 1, 3, 2);
INSERT INTO `sys_dictionary_details` VALUES (6, '2023-11-14 23:12:57.622', '2023-11-14 23:12:57.622', NULL, 'bigint', 4, '', 1, 4, 2);
INSERT INTO `sys_dictionary_details` VALUES (7, '2023-11-14 23:12:57.625', '2023-11-14 23:12:57.625', NULL, 'date', 0, '', 1, 0, 3);
INSERT INTO `sys_dictionary_details` VALUES (8, '2023-11-14 23:12:57.625', '2023-11-14 23:12:57.625', NULL, 'time', 1, '', 1, 1, 3);
INSERT INTO `sys_dictionary_details` VALUES (9, '2023-11-14 23:12:57.625', '2023-11-14 23:12:57.625', NULL, 'year', 2, '', 1, 2, 3);
INSERT INTO `sys_dictionary_details` VALUES (10, '2023-11-14 23:12:57.625', '2023-11-14 23:12:57.625', NULL, 'datetime', 3, '', 1, 3, 3);
INSERT INTO `sys_dictionary_details` VALUES (11, '2023-11-14 23:12:57.625', '2023-11-14 23:12:57.625', NULL, 'timestamp', 5, '', 1, 5, 3);
INSERT INTO `sys_dictionary_details` VALUES (12, '2023-11-14 23:12:57.628', '2023-11-14 23:12:57.628', NULL, 'float', 0, '', 1, 0, 4);
INSERT INTO `sys_dictionary_details` VALUES (13, '2023-11-14 23:12:57.628', '2023-11-14 23:12:57.628', NULL, 'double', 1, '', 1, 1, 4);
INSERT INTO `sys_dictionary_details` VALUES (14, '2023-11-14 23:12:57.628', '2023-11-14 23:12:57.628', NULL, 'decimal', 2, '', 1, 2, 4);
INSERT INTO `sys_dictionary_details` VALUES (15, '2023-11-14 23:12:57.630', '2023-11-14 23:12:57.630', NULL, 'char', 0, '', 1, 0, 5);
INSERT INTO `sys_dictionary_details` VALUES (16, '2023-11-14 23:12:57.630', '2023-11-14 23:12:57.630', NULL, 'varchar', 1, '', 1, 1, 5);
INSERT INTO `sys_dictionary_details` VALUES (17, '2023-11-14 23:12:57.630', '2023-11-14 23:12:57.630', NULL, 'tinyblob', 2, '', 1, 2, 5);
INSERT INTO `sys_dictionary_details` VALUES (18, '2023-11-14 23:12:57.630', '2023-11-14 23:12:57.630', NULL, 'tinytext', 3, '', 1, 3, 5);
INSERT INTO `sys_dictionary_details` VALUES (19, '2023-11-14 23:12:57.630', '2023-11-14 23:12:57.630', NULL, 'text', 4, '', 1, 4, 5);
INSERT INTO `sys_dictionary_details` VALUES (20, '2023-11-14 23:12:57.630', '2023-11-14 23:12:57.630', NULL, 'blob', 5, '', 1, 5, 5);
INSERT INTO `sys_dictionary_details` VALUES (21, '2023-11-14 23:12:57.630', '2023-11-14 23:12:57.630', NULL, 'mediumblob', 6, '', 1, 6, 5);
INSERT INTO `sys_dictionary_details` VALUES (22, '2023-11-14 23:12:57.630', '2023-11-14 23:12:57.630', NULL, 'mediumtext', 7, '', 1, 7, 5);
INSERT INTO `sys_dictionary_details` VALUES (23, '2023-11-14 23:12:57.630', '2023-11-14 23:12:57.630', NULL, 'longblob', 8, '', 1, 8, 5);
INSERT INTO `sys_dictionary_details` VALUES (24, '2023-11-14 23:12:57.630', '2023-11-14 23:12:57.630', NULL, 'longtext', 9, '', 1, 9, 5);
INSERT INTO `sys_dictionary_details` VALUES (25, '2023-11-14 23:12:57.633', '2023-11-14 23:12:57.633', NULL, 'tinyint', 0, '', 1, 0, 6);

-- ----------------------------
-- Table structure for sys_operation_records
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_records`;
CREATE TABLE `sys_operation_records`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求ip',
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `status` bigint(20) NULL DEFAULT NULL COMMENT '请求状态',
  `latency` bigint(20) NULL DEFAULT NULL COMMENT '延迟',
  `agent` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理',
  `error_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求Body',
  `resp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '响应Body',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `ip_geo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求ip地理位置',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_operation_records_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_operation_records
-- ----------------------------
INSERT INTO `sys_operation_records` VALUES (1, '2023-12-17 21:20:38.608', '2023-12-17 21:20:38.608', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu', 200, 3808400, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '', '{\"ID\":24,\"CreatedAt\":\"2023-11-14T23:12:57.636+08:00\",\"UpdatedAt\":\"2023-11-14T23:12:57.636+08:00\",\"parentId\":\"0\",\"path\":\"plugin\",\"name\":\"plugin\",\"hidden\":true,\"component\":\"view/routerHolder.vue\",\"sort\":6,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件系统\",\"icon\":\"cherry\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}', '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1, NULL);
INSERT INTO `sys_operation_records` VALUES (2, '2023-12-17 21:20:49.074', '2023-12-17 21:20:49.074', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu', 200, 4674000, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '', '{\"ID\":11,\"CreatedAt\":\"2023-11-14T23:12:57.636+08:00\",\"UpdatedAt\":\"2023-11-14T23:12:57.636+08:00\",\"parentId\":\"0\",\"path\":\"example\",\"name\":\"example\",\"hidden\":true,\"component\":\"view/example/index.vue\",\"sort\":7,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"示例文件\",\"icon\":\"management\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}', '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1, NULL);
INSERT INTO `sys_operation_records` VALUES (3, '2023-12-17 21:20:58.321', '2023-12-17 21:20:58.321', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu', 200, 4872300, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '', '{\"ID\":23,\"CreatedAt\":\"2023-11-14T23:12:57.636+08:00\",\"UpdatedAt\":\"2023-11-14T23:12:57.636+08:00\",\"parentId\":\"0\",\"path\":\"state\",\"name\":\"state\",\"hidden\":true,\"component\":\"view/system/state.vue\",\"sort\":8,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"服务器状态\",\"icon\":\"cloudy\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}', '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1, NULL);
INSERT INTO `sys_operation_records` VALUES (4, '2023-12-17 21:21:25.012', '2023-12-17 21:21:25.012', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu', 200, 4707200, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '', '{\"ID\":15,\"CreatedAt\":\"2023-11-14T23:12:57.636+08:00\",\"UpdatedAt\":\"2023-11-14T23:12:57.636+08:00\",\"parentId\":\"0\",\"path\":\"systemTools\",\"name\":\"systemTools\",\"hidden\":true,\"component\":\"view/systemTools/index.vue\",\"sort\":5,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统工具\",\"icon\":\"tools\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}', '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1, NULL);

-- ----------------------------
-- Table structure for sys_user_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_authority`;
CREATE TABLE `sys_user_authority`  (
  `sys_user_id` bigint(20) UNSIGNED NOT NULL,
  `sys_authority_authority_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_user_id`, `sys_authority_authority_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_authority
-- ----------------------------
INSERT INTO `sys_user_authority` VALUES (1, 888);
INSERT INTO `sys_user_authority` VALUES (1, 8881);
INSERT INTO `sys_user_authority` VALUES (1, 9528);
INSERT INTO `sys_user_authority` VALUES (2, 888);

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户UUID',
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户登录名',
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户登录密码',
  `nick_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '系统用户' COMMENT '用户昵称',
  `side_mode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'dark' COMMENT '用户侧边主题',
  `header_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'https://qmplusimg.henrongyi.top/gva_header.jpg' COMMENT '用户头像',
  `base_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#fff' COMMENT '基础颜色',
  `active_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#1890ff' COMMENT '活跃颜色',
  `authority_id` bigint(20) UNSIGNED NULL DEFAULT 888 COMMENT '用户角色ID',
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `enable` bigint(20) NULL DEFAULT 1 COMMENT '用户是否被冻结 1正常 2冻结',
  `failed_num` bigint(20) NULL DEFAULT NULL COMMENT '失败登录次数',
  `type` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `oem_name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '代理商名称',
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '正常' COMMENT '用户状态（正常、锁定）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_users_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `idx_sys_users_uuid`(`uuid`) USING BTREE,
  INDEX `idx_sys_users_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES (1, '2023-11-14 23:12:57.785', '2023-12-17 21:18:31.818', NULL, 'd96b8b86-72b9-40a9-81ca-8d0d625d8071', 'admin', '$2a$10$0AiwkOTm4gt4TCksTm4TdOPMJNTL/a2fg7vxOoEob0HJzMbDAT8jm', '一码界', 'dark', 'https://qmplusimg.henrongyi.top/gva_header.jpg', '#fff', '#1890ff', 888, '17611111111', '333333333@qq.com', 1, 2, NULL, NULL, '正常');
INSERT INTO `sys_users` VALUES (2, '2023-11-14 23:12:57.785', '2023-11-14 23:12:57.789', NULL, '88110033-b959-4857-b468-be1e6275c234', 'a303176530', '$2a$10$qYCwG6s/U6cYhGn2k0E8jec2rOTYyenNdM12e4eh7cYPy9niOW9km', '用户1', 'dark', 'https:///qmplusimg.henrongyi.top/1572075907logo.png', '#fff', '#1890ff', 9528, '17611111111', '333333333@qq.com', 1, NULL, NULL, NULL, '正常');

-- ----------------------------
-- Table structure for tbl_content
-- ----------------------------
DROP TABLE IF EXISTS `tbl_content`;
CREATE TABLE `tbl_content`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '内容主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容标题',
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容摘要',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容图片路径',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容文字',
  `sequence` smallint(6) NULL DEFAULT NULL COMMENT '内容顺序',
  `author_id` mediumint(9) NULL DEFAULT NULL COMMENT '作者ID',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容类别',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容状态',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保护密码',
  `comments_num` smallint(6) NULL DEFAULT NULL COMMENT '内容所属评论数',
  `allow_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否允许评论',
  `view_num` smallint(6) NULL DEFAULT NULL COMMENT '浏览数量',
  `likes_num` smallint(6) NULL DEFAULT NULL COMMENT '点赞数量',
  `share_num` smallint(6) NULL DEFAULT NULL COMMENT '分享数量',
  `down_num` smallint(6) NULL DEFAULT NULL COMMENT '踩数量',
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `blog_set` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章集',
  `subset` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章子集',
  `edit_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编辑器类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tbl_content_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容表：添加文章内容' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_content_meta
-- ----------------------------
DROP TABLE IF EXISTS `tbl_content_meta`;
CREATE TABLE `tbl_content_meta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关联关系ID',
  `content_id` mediumint(9) NULL DEFAULT NULL COMMENT '内容ID',
  `mate_id` mediumint(9) NULL DEFAULT NULL COMMENT '项目ID',
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tbl_content_meta_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容与项目关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_meta
-- ----------------------------
DROP TABLE IF EXISTS `tbl_meta`;
CREATE TABLE `tbl_meta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '项目主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目类型',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目描述',
  `count` smallint(6) NULL DEFAULT NULL COMMENT '项目所属内容个数',
  `order` smallint(6) NULL DEFAULT NULL COMMENT '内容排序',
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tbl_meta_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目表：主要包括标签类型、文章类型、链接类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_meta
-- ----------------------------
INSERT INTO `tbl_meta` VALUES (2, '编程记录', '菜单', '前端、后端', 0, 1, '2023-11-16 08:34:30.087', '2023-11-17 08:00:31.513', NULL);
INSERT INTO `tbl_meta` VALUES (3, '运维建站', '菜单', '运维、网站建设', 0, 1, '2023-11-17 07:59:40.275', '2023-12-02 08:03:21.636', NULL);
INSERT INTO `tbl_meta` VALUES (4, '网络安全', '菜单', '安全产品、安全概念、等保概念', 0, 1, '2023-11-17 08:00:50.059', '2023-11-17 08:00:50.059', NULL);
INSERT INTO `tbl_meta` VALUES (5, '工具软件', '菜单', '操作系统、各种软件、镜像、人工智能', 0, 4, '2023-11-17 08:01:31.542', '2023-11-17 08:15:20.314', NULL);
INSERT INTO `tbl_meta` VALUES (6, '随笔杂谈', '菜单', '读书笔记、网赚副业、将自己读过的书整理输出', 0, 1, '2023-11-17 08:01:47.652', '2023-11-17 08:01:47.652', NULL);
INSERT INTO `tbl_meta` VALUES (7, 'java', '标签', '镜像下载、iso下载、操作系统下载、镜像源下载。', 0, 1, '2023-11-17 08:01:55.584', '2023-12-02 08:03:03.380', NULL);
INSERT INTO `tbl_meta` VALUES (8, 'golang', '标签', '', 0, 1, '2023-11-17 08:02:06.202', '2023-11-17 08:02:06.202', NULL);
INSERT INTO `tbl_meta` VALUES (9, 'docker', '标签', '', 0, 1, '2023-12-02 08:02:15.967', '2023-12-02 08:02:15.967', NULL);
INSERT INTO `tbl_meta` VALUES (10, 'devops', '文章集', 'devops 相关文章', 0, 1, '2023-12-09 09:53:42.248', '2023-12-09 09:53:42.248', NULL);
INSERT INTO `tbl_meta` VALUES (11, '概述', '文章子集', '', 0, 1, '2023-12-09 09:54:06.128', '2023-12-09 09:54:06.128', NULL);
INSERT INTO `tbl_meta` VALUES (12, '基础', '文章子集', '', 0, 1, '2023-12-09 10:03:00.413', '2023-12-09 10:03:00.413', NULL);

-- ----------------------------
-- Table structure for train
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `train_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '培训内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_train_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
