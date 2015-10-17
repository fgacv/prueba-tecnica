-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Oct 17, 2015 at 10:01 PM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prueba_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `felipe_gac`
--

CREATE TABLE `felipe_gac` (
  `intId` int(11) NOT NULL,
  `strNombre` varchar(30) NOT NULL,
  `strEmail` varchar(30) NOT NULL,
  `strMensaje` text NOT NULL,
  `intEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `mensajes`
--
CREATE TABLE `mensajes` (
`ID` int(11)
,`Nombre` varchar(30)
,`Email` varchar(30)
,`Estado` varchar(10)
,`Mensaje` text
);

-- --------------------------------------------------------

--
-- Structure for view `mensajes`
--
DROP TABLE IF EXISTS `mensajes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mensajes` AS select `felipe_gac`.`intId` AS `ID`,`felipe_gac`.`strNombre` AS `Nombre`,`felipe_gac`.`strEmail` AS `Email`,if((`felipe_gac`.`intEstado` = 1),'Enviado','No enviado') AS `Estado`,`felipe_gac`.`strMensaje` AS `Mensaje` from `felipe_gac`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `felipe_gac`
--
ALTER TABLE `felipe_gac`
  ADD PRIMARY KEY (`intId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `felipe_gac`
--
ALTER TABLE `felipe_gac`
  MODIFY `intId` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
