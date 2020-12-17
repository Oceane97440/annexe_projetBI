-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 17 déc. 2020 à 04:29
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `demo_asb_reporting`
--

-- --------------------------------------------------------

--
-- Structure de la table `asb_campaign_epilot`
--

DROP TABLE IF EXISTS `asb_campaign_epilot`;
CREATE TABLE IF NOT EXISTS `asb_campaign_epilot` (
  `campaign_epilot_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_name` varchar(255) NOT NULL,
  `format_name` varchar(255) NOT NULL,
  `etat` int(11) NOT NULL,
  `campaign_start_date` datetime NOT NULL,
  `campaign_end_date` datetime NOT NULL,
  `volume_prevue` decimal(10,0) NOT NULL,
  PRIMARY KEY (`campaign_epilot_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_country`
--

DROP TABLE IF EXISTS `asb_country`;
CREATE TABLE IF NOT EXISTS `asb_country` (
  `country_id` int(32) NOT NULL,
  `country_iso3166` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `country_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `country_is_archived` tinyint(1) NOT NULL,
  `continent_id` int(32) DEFAULT NULL,
  `country_extended_name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `asb_formats`
--

DROP TABLE IF EXISTS `asb_formats`;
CREATE TABLE IF NOT EXISTS `asb_formats` (
  `format_id` bigint(20) NOT NULL,
  `format_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `format_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `format_width` int(11) NOT NULL,
  `format_height` int(11) NOT NULL,
  `format_type_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `format_is_archived` tinyint(1) NOT NULL,
  `format_resource_url` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `asb_pack`
--

DROP TABLE IF EXISTS `asb_pack`;
CREATE TABLE IF NOT EXISTS `asb_pack` (
  `pack_id` int(32) NOT NULL,
  `pack_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `pack_updatedAt` datetime DEFAULT NULL,
  `pack_isArchived` tinyint(1) DEFAULT NULL,
  `pack_datecreate` datetime DEFAULT NULL,
  `pack_dateupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`pack_id`),
  KEY `pack_name` (`pack_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `asb_pack_sites`
--

DROP TABLE IF EXISTS `asb_pack_sites`;
CREATE TABLE IF NOT EXISTS `asb_pack_sites` (
  `pack_site_id` int(32) NOT NULL AUTO_INCREMENT,
  `pack_id` int(32) NOT NULL,
  `site_id` int(32) NOT NULL,
  PRIMARY KEY (`pack_site_id`),
  KEY `pack_id` (`pack_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `asb_roles`
--

DROP TABLE IF EXISTS `asb_roles`;
CREATE TABLE IF NOT EXISTS `asb_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_roles_utilisateurs`
--

DROP TABLE IF EXISTS `asb_roles_utilisateurs`;
CREATE TABLE IF NOT EXISTS `asb_roles_utilisateurs` (
  `roles_users_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`roles_users_id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_site`
--

DROP TABLE IF EXISTS `asb_site`;
CREATE TABLE IF NOT EXISTS `asb_site` (
  `site_id` int(32) NOT NULL,
  `site_is_child_directed` tinyint(1) NOT NULL,
  `country_id` int(32) DEFAULT NULL,
  `site_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `site_is_archived` tinyint(1) NOT NULL,
  `site_extrenal_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `user_group_id` int(32) DEFAULT NULL,
  `site_url` varchar(255) COLLATE utf8_bin NOT NULL,
  `language_id` int(32) DEFAULT NULL,
  `site_updated_at` datetime NOT NULL,
  `site_business_model_type_id` int(32) DEFAULT NULL,
  `site_businessModelValue` int(32) DEFAULT NULL,
  `site_application_id` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `asb_utilisateurs`
--

DROP TABLE IF EXISTS `asb_utilisateurs`;
CREATE TABLE IF NOT EXISTS `asb_utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `asb_pack_sites`
--
ALTER TABLE `asb_pack_sites`
  ADD CONSTRAINT `pack_id` FOREIGN KEY (`pack_id`) REFERENCES `asb_pack` (`pack_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `site_id` FOREIGN KEY (`site_id`) REFERENCES `asb_site` (`site_id`);

--
-- Contraintes pour la table `asb_roles_utilisateurs`
--
ALTER TABLE `asb_roles_utilisateurs`
  ADD CONSTRAINT `role` FOREIGN KEY (`role_id`) REFERENCES `asb_roles` (`role_id`),
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `asb_utilisateurs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
