-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 09, 2023 at 08:51 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bluff`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `blufffalse` ()   BEGIN
   UPDATE bluff
   SET bluffcheck = false
   WHERE id = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `blufftrue` ()   BEGIN
   UPDATE bluff
   SET bluffcheck = true
   WHERE id = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `checkbluff` ()   BEGIN
SELECT bluffcheck FROM `bluff` WHERE id=1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_deck` ()   BEGIN
REPLACE INTO deck SELECT * FROM deck_empty;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `declaration_reset` ()   BEGIN
UPDATE declaration SET amount = NULL, number = NULL  WHERE id = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `firstplayer` ()   BEGIN
SELECT player FROM deck WHERE id=1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `restore_bluff` ()   BEGIN
   UPDATE bluff
   SET bluffcheck = NULL
   WHERE id = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `shuffle_deck` ()   BEGIN
  UPDATE deck SET player = 'A' WHERE player IS NULL LIMIT 26;
  UPDATE deck SET player = 'B' WHERE player IS NULL LIMIT 26;
  UPDATE deck SET player = 'A' WHERE player = 'B' AND RAND() < 0.5 LIMIT 13;
  UPDATE deck SET player = 'B' WHERE player = 'A' AND RAND() < 0.5 LIMIT 13;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `table_cards` (IN `id` INT)   BEGIN
UPDATE deck SET player = 'T' WHERE id = id LIMIT 1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bluff`
--

CREATE TABLE `bluff` (
  `id` int(11) NOT NULL,
  `bluffcheck` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bluff`
--

INSERT INTO `bluff` (`id`, `bluffcheck`) VALUES
(1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deck`
--

CREATE TABLE `deck` (
  `id` int(2) NOT NULL,
  `number` enum('2','3','4','5','6','7','8','9','10','J','Q','K','A') NOT NULL,
  `symbol` enum('Club','Diamond','Heart','Spade') NOT NULL,
  `player` enum('A','B','T','P') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deck`
--

INSERT INTO `deck` (`id`, `number`, `symbol`, `player`) VALUES
(1, '2', 'Club', 'B'),
(2, '3', 'Club', 'B'),
(3, '4', 'Club', 'A'),
(4, '5', 'Club', 'B'),
(5, '6', 'Club', 'B'),
(6, '7', 'Club', 'A'),
(7, '8', 'Club', 'B'),
(8, '9', 'Club', 'B'),
(9, '10', 'Club', 'A'),
(10, 'J', 'Club', 'B'),
(11, 'Q', 'Club', 'B'),
(12, 'K', 'Club', 'B'),
(13, 'A', 'Club', 'B'),
(14, '2', 'Diamond', 'A'),
(15, '3', 'Diamond', 'B'),
(16, '4', 'Diamond', 'B'),
(17, '5', 'Diamond', 'B'),
(18, '6', 'Diamond', 'A'),
(19, '7', 'Diamond', 'B'),
(20, '8', 'Diamond', 'B'),
(21, '9', 'Diamond', 'B'),
(22, '10', 'Diamond', 'B'),
(23, 'J', 'Diamond', 'A'),
(24, 'Q', 'Diamond', 'B'),
(25, 'K', 'Diamond', 'A'),
(26, 'A', 'Diamond', 'B'),
(27, '2', 'Heart', 'B'),
(28, '3', 'Heart', 'B'),
(29, '4', 'Heart', 'B'),
(30, '5', 'Heart', 'A'),
(31, '6', 'Heart', 'B'),
(32, '7', 'Heart', 'B'),
(33, '8', 'Heart', 'B'),
(34, '9', 'Heart', 'B'),
(35, '10', 'Heart', 'B'),
(36, 'J', 'Heart', 'B'),
(37, 'Q', 'Heart', 'A'),
(38, 'K', 'Heart', 'A'),
(39, 'A', 'Heart', 'A'),
(40, '2', 'Spade', 'B'),
(41, '3', 'Spade', 'A'),
(42, '4', 'Spade', 'A'),
(43, '5', 'Spade', 'B'),
(44, '6', 'Spade', 'A'),
(45, '7', 'Spade', 'A'),
(46, '8', 'Spade', 'A'),
(47, '9', 'Spade', 'A'),
(48, '10', 'Spade', 'A'),
(49, 'J', 'Spade', 'A'),
(50, 'Q', 'Spade', 'A'),
(51, 'K', 'Spade', 'A'),
(52, 'A', 'Spade', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `deck_empty`
--

CREATE TABLE `deck_empty` (
  `id` int(2) NOT NULL,
  `number` enum('2','3','4','5','6','7','8','9','10','J','Q','K','A') NOT NULL,
  `symbol` enum('Club','Diamond','Heart','Spade') NOT NULL,
  `player` enum('A','B','T','P') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deck_empty`
--

INSERT INTO `deck_empty` (`id`, `number`, `symbol`, `player`) VALUES
(1, '2', 'Club', NULL),
(2, '3', 'Club', NULL),
(3, '4', 'Club', NULL),
(4, '5', 'Club', NULL),
(5, '6', 'Club', NULL),
(6, '7', 'Club', NULL),
(7, '8', 'Club', NULL),
(8, '9', 'Club', NULL),
(9, '10', 'Club', NULL),
(10, 'J', 'Club', NULL),
(11, 'Q', 'Club', NULL),
(12, 'K', 'Club', NULL),
(13, 'A', 'Club', NULL),
(14, '2', 'Diamond', NULL),
(15, '3', 'Diamond', NULL),
(16, '4', 'Diamond', NULL),
(17, '5', 'Diamond', NULL),
(18, '6', 'Diamond', NULL),
(19, '7', 'Diamond', NULL),
(20, '8', 'Diamond', NULL),
(21, '9', 'Diamond', NULL),
(22, '10', 'Diamond', NULL),
(23, 'J', 'Diamond', NULL),
(24, 'Q', 'Diamond', NULL),
(25, 'K', 'Diamond', NULL),
(26, 'A', 'Diamond', NULL),
(27, '2', 'Heart', NULL),
(28, '3', 'Heart', NULL),
(29, '4', 'Heart', NULL),
(30, '5', 'Heart', NULL),
(31, '6', 'Heart', NULL),
(32, '7', 'Heart', NULL),
(33, '8', 'Heart', NULL),
(34, '9', 'Heart', NULL),
(35, '10', 'Heart', NULL),
(36, 'J', 'Heart', NULL),
(37, 'Q', 'Heart', NULL),
(38, 'K', 'Heart', NULL),
(39, 'A', 'Heart', NULL),
(40, '2', 'Spade', NULL),
(41, '3', 'Spade', NULL),
(42, '4', 'Spade', NULL),
(43, '5', 'Spade', NULL),
(44, '6', 'Spade', NULL),
(45, '7', 'Spade', NULL),
(46, '8', 'Spade', NULL),
(47, '9', 'Spade', NULL),
(48, '10', 'Spade', NULL),
(49, 'J', 'Spade', NULL),
(50, 'Q', 'Spade', NULL),
(51, 'K', 'Spade', NULL),
(52, 'A', 'Spade', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `declaration`
--

CREATE TABLE `declaration` (
  `id` int(1) NOT NULL,
  `amount` enum('1','2','3','4','Pass') DEFAULT NULL,
  `number` enum('2','3','4','5','6','7','8','9','10','J','Q','K','A') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `declaration`
--

INSERT INTO `declaration` (`id`, `amount`, `number`) VALUES
(1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `game_status`
--

CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `player_turn` enum('A','B') DEFAULT NULL,
  `result` enum('A','B') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game_status`
--

INSERT INTO `game_status` (`status`, `player_turn`, `result`, `last_change`) VALUES
('not active', NULL, 'B', '2023-01-09 19:41:29');

--
-- Triggers `game_status`
--
DELIMITER $$
CREATE TRIGGER `game_status_update` BEFORE UPDATE ON `game_status` FOR EACH ROW BEGIN
SET NEW.last_change = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `player` enum('A','B') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`username`, `player`, `token`, `last_action`) VALUES
(NULL, 'A', NULL, '2023-01-09 19:10:37'),
(NULL, 'B', NULL, '2023-01-09 19:10:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bluff`
--
ALTER TABLE `bluff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deck`
--
ALTER TABLE `deck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deck_empty`
--
ALTER TABLE `deck_empty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deck`
--
ALTER TABLE `deck`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `deck_empty`
--
ALTER TABLE `deck_empty`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
