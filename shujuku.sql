-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.26 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 huawei 的数据库结构
CREATE DATABASE IF NOT EXISTS `huawei` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `huawei`;

-- 导出  表 huawei.hangqing 结构
CREATE TABLE IF NOT EXISTS `hangqing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `stock_name` varchar(50) NOT NULL COMMENT '股票名称',
  `stock_code` varchar(20) NOT NULL COMMENT '股票代码（6位A股格式）',
  `current_price` decimal(10,2) NOT NULL COMMENT '股票现价',
  `price_change_rate` decimal(10,2) NOT NULL COMMENT '涨跌幅（小数，精度到百分位）',
  `turnover_rate` decimal(10,2) NOT NULL COMMENT '换手率（小数，精度到百分位）',
  `price_change` decimal(10,2) NOT NULL COMMENT '涨跌数值',
  `five_day_change_rate` decimal(10,2) NOT NULL COMMENT '5日涨跌幅（小数，精度到百分位）',
  `year_to_date_change` decimal(10,2) NOT NULL COMMENT '年初至今涨跌幅（小数，精度到百分位）',
  `buy_one_price` decimal(10,2) NOT NULL COMMENT '买一价格',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_stock_name` (`stock_name`),
  UNIQUE KEY `uk_stock_code` (`stock_code`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COMMENT='股票行情表（hangqiang）';

-- 数据导出被取消选择。

-- 导出  表 huawei.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户序号（主键）',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` char(64) NOT NULL COMMENT '用户密码（存储加密后的字符串）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- 数据导出被取消选择。

-- 导出  表 huawei.yingkui 结构
CREATE TABLE IF NOT EXISTS `yingkui` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `stock_name` varchar(50) NOT NULL COMMENT '股票名称（来自hangqing表）',
  `stock_code` varchar(20) NOT NULL COMMENT '股票代码（来自hangqing表）',
  `today_profit_loss` decimal(18,2) NOT NULL COMMENT '今日盈亏：(现价-成本价)*持仓数（百分位）',
  `total_market_value` decimal(18,2) NOT NULL COMMENT '总市值：现价*持仓数（百分位）',
  `cost_price` decimal(10,2) NOT NULL COMMENT '成本价：现价/(1+今日涨跌)（百分位）',
  `current_price` decimal(10,2) NOT NULL COMMENT '现价（来自hangqing表）',
  `today_price_change` decimal(10,4) NOT NULL COMMENT '今日涨跌（百分数转小数）',
  `hold_quantity` int(11) NOT NULL DEFAULT '1' COMMENT '持仓数固定为1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_stock_name_code` (`stock_name`,`stock_code`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COMMENT='股票盈亏表';

-- 数据导出被取消选择。

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
