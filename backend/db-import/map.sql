-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2021 at 10:09 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `map`
--

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `creator` int(11) NOT NULL,
  `tournament` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `capacity`, `description`, `creator`, `tournament`) VALUES
(2, 'team1 updated', 0, 'team 1 here', 0, 4),
(3, 'team2', 0, 'desc', 0, 6),
(5, 'team3', 2, 'team not by user 0', 1, 4),
(6, 'teamOmar3', 0, 'team created by user omar3', 0, NULL),
(7, 'team1', 3, 'random team', 33, NULL),
(8, 'team3', 0, 'test test', 33, NULL),
(9, 'team 4', 0, 'description here', 33, NULL),
(10, 'team1', 3, 'random team', 33, NULL),
(11, 'team1', 3, 'random team', 33, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tournaments`
--

CREATE TABLE `tournaments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `skillLevel` varchar(255) NOT NULL,
  `prizePool` double NOT NULL,
  `description` varchar(255) NOT NULL,
  `creator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tournaments`
--

INSERT INTO `tournaments` (`id`, `name`, `skillLevel`, `prizePool`, `description`, `creator`) VALUES
(4, 'update', 'Intermediate', 222, 'update', 0),
(5, 'tournament2', 'Beginner', 444, 'Tournament not by user 0', 1),
(6, 'new tournament', 'Beginner', 244, 'A tournament hosted by the UTM Esports club.', 0),
(7, 'tournament3', 'Intermediate', 222, 'tournament3', 0),
(8, 'tournament5', 'Intermediate', 24242, 'teasfsa', 0),
(9, 'lol tournament', 'Advanced', 1234, 'bronze level tournament', 0),
(10, 'lol tournament', 'Advanced', 1234, 'bronze level tournament', 0),
(11, 'lol tournament', 'Advanced', 1234, 'bronze level tournament', 0),
(12, 'lol tournament', 'Advanced', 1234, 'bronze level tournament', 0),
(13, 'lol tournament', 'Advanced', 1234, 'bronze level tournament', 0),
(14, 'lol tournament', 'Advanced', 1234, 'bronze level tournament', 0),
(15, 'lol tournament', 'Advanced', 1234, 'bronze level tournament', 0),
(16, 'lol tournament', 'Advanced', 1234, 'bronze level tournament', 38),
(17, 'tournament2', 'Intermediate', 234254, 'fsafasf', 38),
(18, 'lol tournament', 'Advanced', 1234, 'bronze level tournament', 38);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `team` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `type`, `team`) VALUES
(29, 'nsfsafa', '123', 'fsa@gmail.com', 0, 9),
(33, 'omar', '123', 'omar@gmail.com', 0, 2),
(34, 'alex', '123', 'alex@gmail.com', 1, 7),
(35, 'user3', '123', 'user3@gmail.com', 0, 2),
(36, 'user4', '123', 'user3@gmail.com', 0, 2),
(37, 'user5', '123', 'user3@gmail.com', 0, 8),
(38, 'omar2', '123', 'omar@gmail.com', 1, NULL),
(39, 'omar3', '123', 'omar@gmail.com', 0, NULL),
(40, 'new30', '123', 'new30@gmail.com', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tournaments`
--
ALTER TABLE `tournaments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tournaments`
--
ALTER TABLE `tournaments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
