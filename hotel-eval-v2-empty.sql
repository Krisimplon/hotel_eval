-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2018 at 03:53 PM
-- Server version: 5.7.22-0ubuntu0.17.10.1
-- PHP Version: 7.1.17-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_eval`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorie_serv`
--

CREATE TABLE `categorie_serv` (
  `id_cat_serv` int(11) NOT NULL,
  `nom_cat_serv` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chambre`
--

CREATE TABLE `chambre` (
  `id_chbre` int(11) NOT NULL,
  `id_literie` int(11) DEFAULT NULL,
  `nom_chbre` varchar(30) DEFAULT NULL,
  `superficie_chbre` int(3) DEFAULT NULL,
  `etage_chbre` smallint(6) DEFAULT NULL,
  `vue_chbre` varchar(25) DEFAULT NULL,
  `douche_chbre` tinyint(1) DEFAULT NULL,
  `baignoire_chbre` tinyint(1) DEFAULT NULL,
  `suite_chbre` tinyint(1) DEFAULT NULL,
  `handicap_chbre` tinyint(1) DEFAULT NULL,
  `tarif_nuitee_chbre` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chbre_serv`
--

CREATE TABLE `chbre_serv` (
  `id_chbre_serv` int(11) NOT NULL,
  `id_chbre` int(11) DEFAULT NULL,
  `id_service` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom_client` varchar(45) DEFAULT NULL,
  `prenom_client` varchar(45) DEFAULT NULL,
  `mail_client` varchar(45) DEFAULT NULL,
  `tel_client` varchar(20) DEFAULT NULL,
  `adresse_client` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commande_services`
--

CREATE TABLE `commande_services` (
  `id_commande_serv` int(11) NOT NULL,
  `id_service` int(11) DEFAULT NULL,
  `id_resa` int(4) DEFAULT NULL,
  `qte_serv` int(11) DEFAULT NULL,
  `tarif_total_serv` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `connexion_client`
--

CREATE TABLE `connexion_client` (
  `id_connexion_client` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `password_client` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `etat_resa`
--

CREATE TABLE `etat_resa` (
  `id_etat_resa` int(11) NOT NULL,
  `etat_resa` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `literie_chbre`
--

CREATE TABLE `literie_chbre` (
  `id_literie_chbre` int(11) NOT NULL,
  `type_literie` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id_resa` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_chbre` int(11) DEFAULT NULL,
  `id_etat_resa` int(11) DEFAULT NULL,
  `date_arrivee` date DEFAULT NULL,
  `date_depart` date DEFAULT NULL,
  `nbr_nuitees` int(11) DEFAULT NULL,
  `tarif_total_resa` decimal(8,2) DEFAULT NULL,
  `date_resa` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id_service` int(11) NOT NULL,
  `id_cat_serv` int(11) DEFAULT NULL,
  `nom_serv` varchar(45) DEFAULT NULL,
  `description_serv` mediumtext,
  `tarif_serv` decimal(5,2) DEFAULT NULL,
  `suite_serv` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorie_serv`
--
ALTER TABLE `categorie_serv`
  ADD PRIMARY KEY (`id_cat_serv`);

--
-- Indexes for table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`id_chbre`),
  ADD KEY `fk_chambre_1_idx` (`id_literie`);

--
-- Indexes for table `chbre_serv`
--
ALTER TABLE `chbre_serv`
  ADD PRIMARY KEY (`id_chbre_serv`),
  ADD KEY `fk_chbre_serv_2_idx` (`id_chbre`),
  ADD KEY `fk_chbre_serv_1_idx` (`id_service`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `commande_services`
--
ALTER TABLE `commande_services`
  ADD PRIMARY KEY (`id_commande_serv`),
  ADD KEY `fk_commande_services_1_idx` (`id_service`),
  ADD KEY `fk_commande_services_2` (`id_resa`);

--
-- Indexes for table `connexion_client`
--
ALTER TABLE `connexion_client`
  ADD PRIMARY KEY (`id_connexion_client`),
  ADD KEY `fk_connexion_client_1_idx` (`id_client`);

--
-- Indexes for table `etat_resa`
--
ALTER TABLE `etat_resa`
  ADD PRIMARY KEY (`id_etat_resa`);

--
-- Indexes for table `literie_chbre`
--
ALTER TABLE `literie_chbre`
  ADD PRIMARY KEY (`id_literie_chbre`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_resa`),
  ADD KEY `fk_reservation_1_idx` (`id_client`),
  ADD KEY `fk_reservation_2_idx` (`id_chbre`),
  ADD KEY `fk_reservation_4_idx` (`id_etat_resa`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`),
  ADD KEY `fk_service_1_idx` (`id_cat_serv`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorie_serv`
--
ALTER TABLE `categorie_serv`
  MODIFY `id_cat_serv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `id_chbre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `chbre_serv`
--
ALTER TABLE `chbre_serv`
  MODIFY `id_chbre_serv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `commande_services`
--
ALTER TABLE `commande_services`
  MODIFY `id_commande_serv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `connexion_client`
--
ALTER TABLE `connexion_client`
  MODIFY `id_connexion_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `etat_resa`
--
ALTER TABLE `etat_resa`
  MODIFY `id_etat_resa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `literie_chbre`
--
ALTER TABLE `literie_chbre`
  MODIFY `id_literie_chbre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_resa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `chambre`
--
ALTER TABLE `chambre`
  ADD CONSTRAINT `fk_chambre_1` FOREIGN KEY (`id_literie`) REFERENCES `literie_chbre` (`id_literie_chbre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `chbre_serv`
--
ALTER TABLE `chbre_serv`
  ADD CONSTRAINT `fk_chbre_serv_1` FOREIGN KEY (`id_service`) REFERENCES `service` (`id_service`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chbre_serv_2` FOREIGN KEY (`id_chbre`) REFERENCES `chambre` (`id_chbre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `commande_services`
--
ALTER TABLE `commande_services`
  ADD CONSTRAINT `fk_commande_services_1` FOREIGN KEY (`id_service`) REFERENCES `service` (`id_service`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_services_2` FOREIGN KEY (`id_resa`) REFERENCES `reservation` (`id_resa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `connexion_client`
--
ALTER TABLE `connexion_client`
  ADD CONSTRAINT `fk_connexion_client_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_reservation_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reservation_2` FOREIGN KEY (`id_chbre`) REFERENCES `chambre` (`id_chbre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reservation_4` FOREIGN KEY (`id_etat_resa`) REFERENCES `etat_resa` (`id_etat_resa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `fk_service_1` FOREIGN KEY (`id_cat_serv`) REFERENCES `categorie_serv` (`id_cat_serv`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
