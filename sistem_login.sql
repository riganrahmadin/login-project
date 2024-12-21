-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2024 at 06:25 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_login`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(4, 'Kamar012', '$2b$10$KQgPR3ZxEKBpXsCnmyuKw.yUS4lc8QUK0906zVwAkkPkcnqaIJPje'),
(5, 'coba', '$2b$10$OBZUQW6ejYnh0sMCHreCYe7AzUAgCvbgaEJWVlkYnDJZpeoUACBdC'),
(7, 'testing', '$2b$10$y22VMRYWUn7cOzSILYdmkehl0RKyX34qToy7JRcnJLDRVHRmv0xYa'),
(8, 'coba1', '$2b$10$XE28SBM.AvPjKsVvHhk3zeJP7EONvp/fbQ25eDMeiHcREyXxQLdX.'),
(9, 'admincoba', '$2b$10$6ZdA3TwBN0lxWZAGLlpDw.SZzOGLKiZzt0IprxbWD0Wu65LcTe1RS'),
(10, '0895604102422', '$2b$10$E54P9tA1v9N1nR2uxudp1enNIyydxpdz0Dyw/CeR2rT54a0MegBm.'),
(11, 'coba2', '$2b$10$1MJCtIJ3sGp4afuhwuzfDuiOf/u8m37GfJLlmjHiMMxrPlWETp5c6'),
(12, '20.12.1630', '$2b$10$t/WXBnme.SimyEC2ZU.lVO6RigCPIRTiG6xf/77XQvnk1x8DAMv5W');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
