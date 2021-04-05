-- --------------------------------------------------------
-- מארח:                         127.0.0.1
-- Server version:               10.4.10-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL גירסא:               11.0.0.6093
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for general_db
CREATE DATABASE IF NOT EXISTS `general_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `general_db`;

-- Dumping structure for table general_db.places
CREATE TABLE IF NOT EXISTS `places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `latitude` float NOT NULL DEFAULT 0,
  `longitude` float NOT NULL DEFAULT 0,
  `zip_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`zip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table general_db.places: ~83 rows (approximately)
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` (`id`, `name`, `latitude`, `longitude`, `zip_id`) VALUES
	(3, 'Southeastern Avalon Peninsula (Ferryland)', 47.0073, -52.9589, 1),
	(4, 'Dresden', 14612, 51.05, 10),
	(5, 'Dresden Friedrichstadt', 14612, 51.0587, 10),
	(6, 'Dresden Innere Altstadt', 14612, 51.0507, 10),
	(7, 'Sunnyside', 57.2501, -2.1649, 3),
	(8, 'Marywell', 57.1258, -2.3253, 3),
	(9, 'Downies', 57.0469, -2.1276, 3),
	(10, 'Westside', 57.1258, -2.3253, 3),
	(11, 'Hillside', 56.7333, -2.4833, 3),
	(12, 'Old Portlethen', 57.1258, -2.3253, 3),
	(13, 'Banchory-Devenick', 57.1, -2.15, 3),
	(14, 'Heathcot', 57.1258, -2.3253, 3),
	(15, 'Portlethen', 57.0547, -2.1307, 3),
	(16, 'Muirskie', 57.1258, -2.3253, 3),
	(17, 'Findon', 57.0667, -2.1, 3),
	(18, 'Auchlunies', 57.1258, -2.3253, 3),
	(19, 'Kirkton of Maryculter', 57.1258, -2.3253, 3),
	(20, 'Hazelhead', 57.1258, -2.3253, 3),
	(21, 'Cove Bay', 57.1258, -2.3253, 3),
	(22, 'Torry', 57.137, -2.0867, 3),
	(23, 'Benthoul', 57.1258, -2.3253, 3),
	(24, 'Cults', 57.1167, -2.1667, 3),
	(25, 'Contlaw', 57.1258, -2.3253, 3),
	(26, 'Bieldside', 57.1117, -2.2028, 3),
	(27, 'Fairley', 57.1258, -2.3253, 3),
	(28, 'Nigg', 57.7167, -4, 3),
	(29, 'Kingswells', 57.1258, -2.3253, 3),
	(30, 'Blacktop', 57.1258, -2.3253, 3),
	(31, 'Kingsford', 57.1258, -2.3253, 3),
	(32, 'Charlestown', 57.0986, -2.11, 3),
	(33, 'Altens', 57.1258, -2.3253, 3),
	(34, 'Kincorth', 57.1258, -2.3253, 3),
	(35, 'Milltimber', 57.1042, -2.241, 3),
	(36, 'Mannofield', 57.1258, -2.3253, 3),
	(37, 'Craigton', 57.1258, -2.3253, 3),
	(38, 'Peterculter', 57.0993, -2.2659, 3),
	(39, 'Ruthrieston', 57.1258, -2.3253, 3),
	(40, 'Janpath', 28.6333, 77.2167, 8),
	(41, 'Rail Bhawan', 28.6333, 77.2167, 8),
	(42, 'Connaught Place', 28.6333, 77.2167, 8),
	(43, 'Sansadiya Soudha', 28.6333, 77.2167, 8),
	(44, 'Sectt North', 28.6333, 77.2167, 8),
	(45, 'Constitution House', 28.6333, 77.2167, 8),
	(46, 'Eastern Court', 28.6333, 77.2167, 8),
	(47, 'Supreme Court', 28.6333, 77.2167, 8),
	(48, 'Parliament House', 28.6333, 77.2167, 8),
	(49, 'Parliament Street H O', 28.6333, 77.2167, 8),
	(50, 'Laxminarain Mandir', 28.6333, 77.2167, 8),
	(51, 'New Delhi G P O', 28.6333, 77.2167, 8),
	(52, 'Krishi Bhawan', 28.6333, 77.2167, 8),
	(53, 'Lady Harding Medical College', 28.6333, 77.2167, 8),
	(54, 'Election Commission', 28.6333, 77.2167, 8),
	(55, 'North Avenue', 28.6333, 77.2167, 8),
	(56, 'Pragati Maidan', 28.6333, 77.2167, 8),
	(57, 'Patiala House', 28.6333, 77.2167, 8),
	(58, 'Shastri Bhawan', 28.6333, 77.2167, 8),
	(59, 'Casape', 41.9083, 12.8859, 4),
	(60, 'San Gregorio Da Sassola', 41.9181, 12.8717, 4),
	(61, 'San Polo Dei Cavalieri', 42.0108, 12.8411, 4),
	(62, 'Poli', 41.8899, 12.893, 4),
	(63, 'Setteville Di Guidonia', 41.9449, 12.6513, 4),
	(64, 'Pontelucano', 41.9595, 12.777, 4),
	(65, 'Setteville', 41.9449, 12.6513, 4),
	(66, 'Gallicano Nel Lazio', 41.8724, 12.8181, 4),
	(67, 'Sant\'Angelo Romano', 42.0337, 12.7134, 4),
	(68, 'Marcellina', 42.0263, 12.8067, 4),
	(69, 'Borgo Santa Maria', 42.1531, 12.6809, 4),
	(70, 'Montelibretti', 42.1354, 12.7381, 4),
	(71, 'Villa Adriana', 41.9549, 12.773, 4),
	(72, 'Moricone', 42.1122, 12.775, 4),
	(73, 'Montorio Romano', 42.1392, 12.8067, 4),
	(74, 'Monteflavio', 42.1092, 12.8297, 4),
	(75, 'San Angel', 19.3733, -99.225, 5),
	(76, 'Villa Obregon', 19.3733, -99.225, 5),
	(77, 'Москва', 55.7522, 37.6156, 7),
	(78, 'Vitoria-Gasteiz', 42.85, -2.6667, 9),
	(79, 'Lausanne 26', 46.5534, 6.6971, 2),
	(80, 'Lausanne 25', 46.5737, 6.6987, 2),
	(81, 'Lausanne', 46.5291, 6.6524, 2),
	(82, 'Lausanne 27', 46.5417, 6.6815, 2),
	(83, 'Samphanthawong', 13.7333, 100.5, 6),
	(84, 'Pom Prap Sattru Phai', 13.7333, 100.5, 6),
	(230, 'Pully', 46.5124, 6.6567, 41);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;

-- Dumping structure for table general_db.zip_code
CREATE TABLE IF NOT EXISTS `zip_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) NOT NULL DEFAULT '0',
  `country_code` varchar(255) NOT NULL DEFAULT '0',
  `zip` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_code` (`country_code`,`zip`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table general_db.zip_code: ~11 rows (approximately)
/*!40000 ALTER TABLE `zip_code` DISABLE KEYS */;
INSERT INTO `zip_code` (`id`, `country`, `country_code`, `zip`) VALUES
	(1, 'Canada', 'CA', 'A0A'),
	(2, 'Switzerland', 'CH', '1000'),
	(3, 'Great Britain', 'GB', 'AB1'),
	(4, 'Italy', 'IT', '00010'),
	(5, 'Mexico', 'MX', '01000'),
	(6, 'Thailand', 'TH', '10100'),
	(7, 'Russia', 'RU', '101000'),
	(8, 'India', 'IN', '110001'),
	(9, 'Spain', 'ES', '01001'),
	(10, 'Germany', 'DE', '01067'),
	(41, 'Switzerland', 'CH', '1009');
/*!40000 ALTER TABLE `zip_code` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
