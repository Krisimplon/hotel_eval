-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2018 at 03:54 PM
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

--
-- Dumping data for table `categorie_serv`
--

INSERT INTO `categorie_serv` (`id_cat_serv`, `nom_cat_serv`) VALUES
(1, 'Matériel'),
(2, 'Bien-être'),
(3, 'Repas'),
(4, 'Special');

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

--
-- Dumping data for table `chambre`
--

INSERT INTO `chambre` (`id_chbre`, `id_literie`, `nom_chbre`, `superficie_chbre`, `etage_chbre`, `vue_chbre`, `douche_chbre`, `baignoire_chbre`, `suite_chbre`, `handicap_chbre`, `tarif_nuitee_chbre`) VALUES
(2, 4, 'Saharienne', 12, 2, 'Mer', 0, 1, 0, 0, '76.00'),
(3, 3, 'Scandinave', 10, 3, 'Montagne', 1, 0, 0, 0, '65.00'),
(4, 2, 'Japonaise', 15, 1, 'Montagne', 1, 1, 0, 1, '68.00'),
(5, 6, 'Brésilienne', 25, 1, 'Mer', 1, 1, 0, 0, '99.00'),
(6, 1, 'Canadienne', 9, 3, 'Montagne', 1, 0, 0, 0, '49.00'),
(7, 5, 'Tropicale', 45, 1, 'Mer', 1, 1, 1, 1, '498.00'),
(8, 4, 'Égyptienne', 20, 2, 'Mer', 0, 1, 0, 1, '79.00');

-- --------------------------------------------------------

--
-- Table structure for table `chbre_serv`
--

CREATE TABLE `chbre_serv` (
  `id_chbre_serv` int(11) NOT NULL,
  `id_chbre` int(11) DEFAULT NULL,
  `id_service` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chbre_serv`
--

INSERT INTO `chbre_serv` (`id_chbre_serv`, `id_chbre`, `id_service`) VALUES
(1, 2, 1),
(2, 2, 3),
(3, 2, 4),
(4, 2, 5),
(5, 3, 3),
(6, 3, 4),
(7, 3, 5),
(8, 4, 1),
(9, 4, 3),
(10, 4, 4),
(11, 4, 5),
(12, 5, 4),
(13, 5, 5),
(14, 6, 1),
(15, 6, 4),
(16, 6, 5),
(17, 7, 1),
(18, 7, 2),
(19, 7, 3),
(20, 7, 4),
(21, 7, 5),
(22, 7, 6),
(23, 8, 1),
(24, 8, 3),
(25, 8, 4),
(26, 8, 5);

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

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id_client`, `nom_client`, `prenom_client`, `mail_client`, `tel_client`, `adresse_client`) VALUES
(1, 'LAGARDE', 'Émilie', 'emilielagarde@free.fr', '06-78-54-34-23', 'Lotissement belle-croix 82000 MONTAUBAN'),
(2, 'PEDURAN', 'Benoît', 'ben_peduran@gmail.com', '07-89-90-34-21', 'Les Grabas 46000 CAHORS'),
(3, 'DIDIER', 'Soraya', 'soso_didier@orange.fr', '09-78-32-12-34', 'Mirepoix 32670 MIRANDE'),
(4, 'DROUI', 'Xavier', 'zazoudr@hotmail.fr', '06-67-56-43-99', '38 Rue Jeanne-d\'Arc 45100 ORLEANS'),
(5, 'BACHA', 'Florianne', 'bachaflo@orange.fr', '07-78-54-12-12', '6 rue des Minimes 31200 TOULOUSE'),
(6, 'WEAVER', 'Caroline', 'caroline_weaver@free.fr', '06-89-90-43-56', '28 Place de Verdun 65000 TARBES');

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

--
-- Dumping data for table `commande_services`
--

INSERT INTO `commande_services` (`id_commande_serv`, `id_service`, `id_resa`, `qte_serv`, `tarif_total_serv`) VALUES
(1, 4, 4, 2, '72.00'),
(2, 1, 1, 2, '30.00'),
(3, 3, 4, 1, '50.00'),
(4, 5, 3, 4, '180.00'),
(5, 1, 2, 2, '72.00'),
(6, 2, 2, 1, '98.00'),
(7, 3, 2, 2, '100.00'),
(8, 4, 2, 4, '144.00'),
(9, 6, 2, 1, '59.00'),
(10, 4, 4, 4, '144.00');

-- --------------------------------------------------------

--
-- Table structure for table `connexion_client`
--

CREATE TABLE `connexion_client` (
  `id_connexion_client` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `password_client` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `connexion_client`
--

INSERT INTO `connexion_client` (`id_connexion_client`, `id_client`, `password_client`) VALUES
(1, 1, 'lysachou'),
(2, 2, 'ducatilove'),
(3, 3, 'family4'),
(4, 4, 'archenoe'),
(5, 5, 'totocoeur'),
(6, 6, 'britishwoman');

-- --------------------------------------------------------

--
-- Table structure for table `etat_resa`
--

CREATE TABLE `etat_resa` (
  `id_etat_resa` int(11) NOT NULL,
  `etat_resa` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `etat_resa`
--

INSERT INTO `etat_resa` (`id_etat_resa`, `etat_resa`) VALUES
(1, 'En cours'),
(2, 'Paiement effectué'),
(3, 'Réservation annulée');

-- --------------------------------------------------------

--
-- Table structure for table `literie_chbre`
--

CREATE TABLE `literie_chbre` (
  `id_literie_chbre` int(11) NOT NULL,
  `type_literie` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `literie_chbre`
--

INSERT INTO `literie_chbre` (`id_literie_chbre`, `type_literie`) VALUES
(1, 'Simple'),
(2, 'Double'),
(3, 'Deux lits simples'),
(4, 'Double - Queen size'),
(5, 'Double - King size'),
(6, 'Familiale');

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

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id_resa`, `id_client`, `id_chbre`, `id_etat_resa`, `date_arrivee`, `date_depart`, `nbr_nuitees`, `tarif_total_resa`, `date_resa`) VALUES
(1, 1, 4, 1, '2018-06-22', '2018-06-23', 1, '98.00', '2018-06-03'),
(2, 2, 7, 2, '2018-06-08', '2018-06-10', 2, '1068.00', '2018-06-05'),
(3, 3, 5, 1, '2018-06-23', '2018-06-26', 3, '477.00', '2018-06-01'),
(4, 5, 2, 3, '2018-06-14', '2018-06-20', 7, '604.00', '2018-06-03');

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
-- Dumping data for table `service`
--

INSERT INTO `service` (`id_service`, `id_cat_serv`, `nom_serv`, `description_serv`, `tarif_serv`, `suite_serv`) VALUES
(1, 3, 'Petit-déjeuner en chambre', 'Le petit-déjeuner vous sera servi en chambre, à l\'heure souhaitée. La composition du menu sera déterminée la veille.', '15.00', 0),
(2, 4, 'Mini-bar', 'Votre suite dispose d\'un mini-bar avec une partie réfrigérée. Celui-ci sera rempli avec les boissons de votre convenance et renouvelé tout au long de votre séjour.', '98.00', 1),
(3, 4, 'Bouteille de champagne', 'Une bouteille de champagne vous sera servie en chambre à votre arrivée dans notre établissement.', '50.00', 0),
(4, 2, 'Spa', 'Ce service vous autorise l\'accès au spa de 10H à 19H30. Celui-ci dispose d\'un hammam, sauna, jacuzzi et piscine chauffée. Sur place, vous aurez la possibilité de réserver un soin auprès de nos esthéticiennes. Les soins et massages sont des prestations payantes non comprises dans l\'accès au spa.', '36.00', 0),
(5, 1, 'Locations de cycles', 'La location de vélo est une prestation journalière avec possibilité de la souscrire pour une durée de plusieurs jours. Vous disposez du matériel de 9H à 18H. Une caution vous sera demandée.', '45.00', 0),
(6, 4, 'Service de la couverture', 'Votre couchage sera prêt à vous recevoir, la luminosité de la chambre adaptée à l\'endormissement ainsi qu\'une coupe de chocolats et une tasse de tisane vous attendront.', '59.00', 1);

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
