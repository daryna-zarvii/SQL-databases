-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2024 at 01:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `danabaza`
--

-- --------------------------------------------------------

--
-- Table structure for table `egzaminator`
--

CREATE TABLE `egzaminator` (
  `Id_egzaminatr` int(4) NOT NULL,
  `Nazwisko` varchar(25) NOT NULL,
  `Imie` varchar(15) NOT NULL,
  `Kod_pocztowy` varchar(5) NOT NULL,
  `Miasto` varchar(15) NOT NULL,
  `Ulica` varchar(30) NOT NULL,
  `Numer` varchar(8) NOT NULL,
  `Telefon` varchar(12) NOT NULL,
  `Fax` varchar(12) NOT NULL,
  `E-mail` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `egzaminny`
--

CREATE TABLE `egzaminny` (
  `Nr_egz` int(7) NOT NULL,
  `Id_student` int(7) NOT NULL,
  `Id_przedmiot` int(3) NOT NULL,
  `Id_egzaminator` int(4) NOT NULL,
  `Data_egz` int(11) NOT NULL,
  `Id_osrodek` int(5) NOT NULL,
  `Zdal` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `osrodek`
--

CREATE TABLE `osrodek` (
  `Id_osrodek` int(5) NOT NULL,
  `Nazwa` varchar(30) NOT NULL,
  `Kod_pocztowy` varchar(5) NOT NULL,
  `Miasto` varchar(15) NOT NULL,
  `Ulica` varchar(30) NOT NULL,
  `Numer` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `przedmiot`
--

CREATE TABLE `przedmiot` (
  `Id_przed` int(3) NOT NULL,
  `Nazwa_przedmiotu` varchar(40) NOT NULL,
  `Opis` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Id_stud` int(7) NOT NULL,
  `Nazwisko` varchar(25) NOT NULL,
  `Imie` varchar(15) NOT NULL,
  `Data_ur` date NOT NULL,
  `Miejsce` varchar(15) NOT NULL,
  `PESEL` varchar(11) NOT NULL,
  `Kod_pocztowy` varchar(5) NOT NULL,
  `Miasto` varchar(15) NOT NULL,
  `Ulica` varchar(30) NOT NULL,
  `Numer` varchar(8) NOT NULL,
  `Telefon` varchar(12) NOT NULL,
  `Fax` varchar(12) NOT NULL,
  `E-mail` varchar(30) NOT NULL,
  `Nr_ECDL` varchar(9) NOT NULL,
  `Data_ECDL` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `egzaminator`
--
ALTER TABLE `egzaminator`
  ADD PRIMARY KEY (`Id_egzaminatr`);

--
-- Indexes for table `egzaminny`
--
ALTER TABLE `egzaminny`
  ADD PRIMARY KEY (`Nr_egz`),
  ADD KEY `Id_student` (`Id_student`),
  ADD KEY `Id_przedmiot` (`Id_przedmiot`),
  ADD KEY `Id_egzaminator` (`Id_egzaminator`),
  ADD KEY `Id_osrodek` (`Id_osrodek`);

--
-- Indexes for table `osrodek`
--
ALTER TABLE `osrodek`
  ADD PRIMARY KEY (`Id_osrodek`);

--
-- Indexes for table `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD PRIMARY KEY (`Id_przed`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Id_stud`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `egzaminator`
--
ALTER TABLE `egzaminator`
  MODIFY `Id_egzaminatr` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `egzaminny`
--
ALTER TABLE `egzaminny`
  MODIFY `Nr_egz` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `osrodek`
--
ALTER TABLE `osrodek`
  MODIFY `Id_osrodek` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `przedmiot`
--
ALTER TABLE `przedmiot`
  MODIFY `Id_przed` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `Id_stud` int(7) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `egzaminny`
--
ALTER TABLE `egzaminny`
  ADD CONSTRAINT `egzaminny_ibfk_1` FOREIGN KEY (`Id_egzaminator`) REFERENCES `egzaminator` (`Id_egzaminatr`),
  ADD CONSTRAINT `egzaminny_ibfk_2` FOREIGN KEY (`Id_przedmiot`) REFERENCES `przedmiot` (`Id_przed`),
  ADD CONSTRAINT `egzaminny_ibfk_3` FOREIGN KEY (`Id_student`) REFERENCES `student` (`Id_stud`),
  ADD CONSTRAINT `egzaminny_ibfk_4` FOREIGN KEY (`Id_osrodek`) REFERENCES `osrodek` (`Id_osrodek`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
