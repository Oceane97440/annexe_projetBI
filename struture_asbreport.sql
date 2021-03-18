-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 18 mars 2021 à 11:04
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
-- Base de données :  `struture_asbreport`
--

-- --------------------------------------------------------

--
-- Structure de la table `asb_advertisers`
--

DROP TABLE IF EXISTS `asb_advertisers`;
CREATE TABLE IF NOT EXISTS `asb_advertisers` (
  `advertiser_id` int(11) NOT NULL AUTO_INCREMENT,
  `advertiser_name` varchar(45) DEFAULT NULL,
  `advertiser_description` varchar(45) DEFAULT NULL,
  `advertiser_is_direct_advertiser` tinyint(1) DEFAULT NULL,
  `advertiser_is_house_ads` int(11) DEFAULT NULL,
  `advertiser_address` varchar(45) DEFAULT NULL,
  `advertiser_contact_name` varchar(45) DEFAULT NULL,
  `advertiser_contact_email` varchar(45) DEFAULT NULL,
  `advertiser_contact_phone_number` varchar(45) DEFAULT NULL,
  `advertiser_is_archived` tinyint(1) DEFAULT NULL,
  `advertiser_user_group_id` int(11) DEFAULT NULL,
  `advertiser_date_created` datetime DEFAULT NULL,
  `advertiser_date_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`advertiser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_agencies`
--

DROP TABLE IF EXISTS `asb_agencies`;
CREATE TABLE IF NOT EXISTS `asb_agencies` (
  `agency_id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(45) DEFAULT NULL,
  `isArchived` int(11) DEFAULT NULL,
  PRIMARY KEY (`agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_campaigns`
--

DROP TABLE IF EXISTS `asb_campaigns`;
CREATE TABLE IF NOT EXISTS `asb_campaigns` (
  `campaign_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_name` varchar(45) DEFAULT NULL,
  `advertiser_id` int(11) DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL,
  `campaignStatusIds` int(11) DEFAULT NULL,
  `externalCampaignId` varchar(45) DEFAULT NULL,
  `isArchived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`campaign_id`),
  UNIQUE KEY `advertiserIds_UNIQUE` (`advertiser_id`),
  UNIQUE KEY `agencyIds_UNIQUE` (`agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table ` asb_campaigns_epilot`
--

DROP TABLE IF EXISTS ` asb_campaigns_epilot`;
CREATE TABLE IF NOT EXISTS ` asb_campaigns_epilot` (
  `campaign_epilot_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_name_epilot` varchar(45) NOT NULL,
  `format_name` varchar(45) NOT NULL,
  `campaignStatusIds` int(11) NOT NULL,
  `campaign_start_date_epilot` datetime NOT NULL,
  `campaign_end_date_epilot` datetime NOT NULL,
  `target_volumes` float NOT NULL,
  `advertiser_id` int(11) DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`campaign_epilot_id`),
  UNIQUE KEY `agency_id_UNIQUE` (`agency_id`),
  UNIQUE KEY `advertiser_id_UNIQUE` (`advertiser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_campaign_epilot`
--

DROP TABLE IF EXISTS `asb_campaign_epilot`;
CREATE TABLE IF NOT EXISTS `asb_campaign_epilot` (
  `campaign_epilot_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_name` varchar(45) NOT NULL,
  `format_name` varchar(45) NOT NULL,
  `etat` bigint(20) NOT NULL,
  `campaign_start_date` datetime NOT NULL,
  `campaign_end_date` datetime NOT NULL,
  `volume_prevue` float NOT NULL,
  PRIMARY KEY (`campaign_epilot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_countries`
--

DROP TABLE IF EXISTS `asb_countries`;
CREATE TABLE IF NOT EXISTS `asb_countries` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_iso3166` varchar(45) DEFAULT NULL,
  `country_name` varchar(45) DEFAULT NULL,
  `country_is_archived` tinyint(1) DEFAULT NULL,
  `continent_id` int(11) DEFAULT NULL,
  `country_extended_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_country`
--

DROP TABLE IF EXISTS `asb_country`;
CREATE TABLE IF NOT EXISTS `asb_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_iso3166` varchar(45) NOT NULL,
  `country_name` varchar(45) NOT NULL,
  `country_is_archived` bigint(20) NOT NULL,
  `continent_id` int(11) NOT NULL,
  `country_extended_name` varchar(200) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_creatives`
--

DROP TABLE IF EXISTS `asb_creatives`;
CREATE TABLE IF NOT EXISTS `asb_creatives` (
  `creative_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `insertion_id` int(11) NOT NULL,
  `resource_url` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `clickUrl` varchar(255) DEFAULT NULL,
  `width` varchar(45) DEFAULT NULL,
  `height` varchar(45) DEFAULT NULL,
  `platform_id` int(11) DEFAULT NULL,
  `mime_type` varchar(45) DEFAULT NULL,
  `percentage_delivery` varchar(45) DEFAULT NULL,
  `creatives_is_archived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`creative_id`),
  UNIQUE KEY `platform_id_UNIQUE` (`platform_id`),
  KEY `id_insertions_idx` (`insertion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_deliverytypes`
--

DROP TABLE IF EXISTS `asb_deliverytypes`;
CREATE TABLE IF NOT EXISTS `asb_deliverytypes` (
  `deliverytype_id` int(11) NOT NULL,
  `deliverytype_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`deliverytype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table ` asb_formats`
--

DROP TABLE IF EXISTS ` asb_formats`;
CREATE TABLE IF NOT EXISTS ` asb_formats` (
  `format_id` int(11) NOT NULL AUTO_INCREMENT,
  `format_name` varchar(45) DEFAULT NULL,
  `group_format_id` int(11) DEFAULT NULL COMMENT 'champ pour bi',
  `format_width` varchar(45) DEFAULT NULL,
  `format_height` varchar(45) DEFAULT NULL,
  ` format_type_id` varchar(45) DEFAULT NULL,
  `format_is_archived` tinyint(1) DEFAULT NULL,
  `format_resource_url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`format_id`),
  UNIQUE KEY `format_group_UNIQUE` (`group_format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_formats`
--

DROP TABLE IF EXISTS `asb_formats`;
CREATE TABLE IF NOT EXISTS `asb_formats` (
  `format_id` int(11) NOT NULL AUTO_INCREMENT,
  `format_name` varchar(45) NOT NULL,
  `format_group` varchar(45) NOT NULL,
  `format_width` int(11) NOT NULL,
  `format_height` int(11) NOT NULL,
  `format_type_id` int(11) NOT NULL,
  `format_is_archived` bigint(20) NOT NULL,
  `format_resource_url` varchar(255) NOT NULL,
  PRIMARY KEY (`format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_groups_cappings`
--

DROP TABLE IF EXISTS `asb_groups_cappings`;
CREATE TABLE IF NOT EXISTS `asb_groups_cappings` (
  `group_capping_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_capping_name` varchar(45) DEFAULT NULL,
  `capping` int(11) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `insertion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_capping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_groups_cappings_insertions`
--

DROP TABLE IF EXISTS `asb_groups_cappings_insertions`;
CREATE TABLE IF NOT EXISTS `asb_groups_cappings_insertions` (
  `group_capping_insertion_id` int(11) NOT NULL AUTO_INCREMENT,
  `insertion_id` int(11) DEFAULT NULL,
  `group_capping_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_capping_insertion_id`),
  UNIQUE KEY `group_capping_id_UNIQUE` (`group_capping_id`),
  UNIQUE KEY `insertion_id_UNIQUE` (`insertion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_groups_formats`
--

DROP TABLE IF EXISTS `asb_groups_formats`;
CREATE TABLE IF NOT EXISTS `asb_groups_formats` (
  `group_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_format_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_insertions`
--

DROP TABLE IF EXISTS `asb_insertions`;
CREATE TABLE IF NOT EXISTS `asb_insertions` (
  `insertion_id` int(11) NOT NULL AUTO_INCREMENT,
  `isDeliveryRegulated` tinyint(4) DEFAULT NULL,
  `isUsedByGuaranteedDeal` tinyint(4) DEFAULT NULL,
  `isUsedByNonGuaranteedDeal` tinyint(4) DEFAULT NULL,
  `voiceShare` float DEFAULT NULL,
  `eventId` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `isPersonalizedAd` tinyint(4) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `packIds` int(11) DEFAULT NULL,
  `insertionStatusId` tinyint(1) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `campaignId` int(11) DEFAULT NULL,
  `insertionTypeId` int(11) DEFAULT NULL,
  `deliveryTypeId` int(11) DEFAULT NULL,
  `timezoneId` int(11) DEFAULT NULL,
  `priorityId` int(11) DEFAULT NULL,
  `periodicCappingId` int(11) DEFAULT NULL,
  `groupCappingId` int(11) DEFAULT NULL,
  `maxImpressions` float DEFAULT NULL,
  `weight` decimal(10,0) DEFAULT NULL,
  `maxClicks` decimal(10,0) DEFAULT NULL,
  `maxImpressionsPerDay` decimal(10,0) DEFAULT NULL,
  `maxClicksPerDay` decimal(10,0) DEFAULT NULL,
  `insertionGroupedVolumeId` int(11) DEFAULT NULL,
  `eventImpressions` decimal(10,0) DEFAULT NULL,
  `isHolisticYieldEnabled` tinyint(4) DEFAULT NULL,
  `deliverLeftVolumeAfterEndDate` tinyint(4) DEFAULT NULL,
  `globalCapping` int(11) DEFAULT NULL,
  `cappingPerVisit` decimal(10,0) DEFAULT NULL,
  `cappingPerClick` decimal(10,0) DEFAULT NULL,
  `autoCapping` int(11) DEFAULT NULL,
  `periodicCappingImpressions` int(11) DEFAULT NULL,
  `periodicCappingPeriod` int(11) DEFAULT NULL,
  `isObaIconEnabled` tinyint(4) DEFAULT NULL,
  `formatId` int(11) DEFAULT NULL,
  `externalId` int(11) DEFAULT NULL,
  `externalDescription` varchar(45) DEFAULT NULL,
  `updatedAt` varchar(45) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `isArchived` tinyint(4) DEFAULT NULL,
  `rateTypeId` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `rateNet` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `currencyId` int(11) DEFAULT NULL,
  `insertionLinkId` int(11) DEFAULT NULL,
  `customizedScript` varchar(45) DEFAULT NULL,
  `salesChannelId` int(11) DEFAULT NULL,
  PRIMARY KEY (`insertion_id`),
  UNIQUE KEY `campaignId_UNIQUE` (`campaignId`),
  UNIQUE KEY `formatId_UNIQUE` (`formatId`),
  UNIQUE KEY `deliveryTypeId_UNIQUE` (`deliveryTypeId`),
  UNIQUE KEY `priorityId_UNIQUE` (`priorityId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_insertions_priorities`
--

DROP TABLE IF EXISTS `asb_insertions_priorities`;
CREATE TABLE IF NOT EXISTS `asb_insertions_priorities` (
  `insertion_prioritie_id` int(11) NOT NULL AUTO_INCREMENT,
  `insertion_priorite_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`insertion_prioritie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_insertions_templates`
--

DROP TABLE IF EXISTS `asb_insertions_templates`;
CREATE TABLE IF NOT EXISTS `asb_insertions_templates` (
  `insertion_template_id` int(11) NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  `insertion_id` int(11) DEFAULT NULL,
  `parameter_value` text DEFAULT NULL,
  PRIMARY KEY (`insertion_template_id`),
  UNIQUE KEY `template_id_UNIQUE` (`template_id`),
  UNIQUE KEY `insertion_id_UNIQUE` (`insertion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_pack`
--

DROP TABLE IF EXISTS `asb_pack`;
CREATE TABLE IF NOT EXISTS `asb_pack` (
  `pack_id` int(11) NOT NULL AUTO_INCREMENT,
  `pack_name` varchar(45) NOT NULL,
  `pack_is_archived` int(11) NOT NULL,
  `site_updated_at` datetime NOT NULL,
  `pack_datecreate` datetime NOT NULL,
  `pack_dateupdate` datetime NOT NULL,
  PRIMARY KEY (`pack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_packs`
--

DROP TABLE IF EXISTS `asb_packs`;
CREATE TABLE IF NOT EXISTS `asb_packs` (
  `pack_id` int(11) NOT NULL AUTO_INCREMENT,
  `pack_name` varchar(45) DEFAULT NULL,
  `pack_updatedAt` datetime DEFAULT NULL,
  `pack_isArchived` tinyint(1) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`pack_id`),
  UNIQUE KEY `page_id_UNIQUE` (`page_id`),
  UNIQUE KEY `site_id_UNIQUE` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_packs_group`
--

DROP TABLE IF EXISTS `asb_packs_group`;
CREATE TABLE IF NOT EXISTS `asb_packs_group` (
  `pack_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `pack_group_name` varchar(45) DEFAULT NULL,
  `pack_group_updatedAt` datetime DEFAULT NULL,
  `pack_group_isArchived` tinyint(1) DEFAULT NULL,
  `pack_group_datecreate` datetime DEFAULT NULL,
  `pack_group_dateupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`pack_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_packs_sites`
--

DROP TABLE IF EXISTS `asb_packs_sites`;
CREATE TABLE IF NOT EXISTS `asb_packs_sites` (
  `pack_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `pack_group_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`pack_site_id`),
  UNIQUE KEY `site_id_UNIQUE` (`site_id`),
  UNIQUE KEY `pack_id_UNIQUE` (`pack_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_pack_sites`
--

DROP TABLE IF EXISTS `asb_pack_sites`;
CREATE TABLE IF NOT EXISTS `asb_pack_sites` (
  `pack_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `pack_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`pack_site_id`),
  KEY `pack_id` (`pack_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_pages`
--

DROP TABLE IF EXISTS `asb_pages`;
CREATE TABLE IF NOT EXISTS `asb_pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_external_id` varchar(45) DEFAULT NULL,
  `page_name` datetime DEFAULT NULL,
  `page_fullname` tinyint(1) DEFAULT NULL,
  `page_url` int(11) DEFAULT NULL,
  `PageGroupId` int(11) DEFAULT NULL,
  `ParentPageId` varchar(45) DEFAULT NULL,
  `IsArchived` varchar(45) DEFAULT NULL,
  `UpdatedAt` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `page_id_UNIQUE` (`PageGroupId`),
  UNIQUE KEY `site_id_UNIQUE` (`page_url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_pages_group`
--

DROP TABLE IF EXISTS `asb_pages_group`;
CREATE TABLE IF NOT EXISTS `asb_pages_group` (
  `page_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_group_name` datetime DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `format_id` int(11) DEFAULT NULL,
  `IsArchived` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`page_group_id`),
  UNIQUE KEY `site_id_UNIQUE` (`site_id`),
  UNIQUE KEY `IsArchived_UNIQUE` (`IsArchived`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_pages_groups_formats`
--

DROP TABLE IF EXISTS `asb_pages_groups_formats`;
CREATE TABLE IF NOT EXISTS `asb_pages_groups_formats` (
  `page_group_format_id` int(11) NOT NULL,
  `page_group_id` int(11) DEFAULT NULL,
  `format_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`page_group_format_id`),
  UNIQUE KEY `page_group_id_UNIQUE` (`page_group_id`),
  UNIQUE KEY `format_id_UNIQUE` (`format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_platforms`
--

DROP TABLE IF EXISTS `asb_platforms`;
CREATE TABLE IF NOT EXISTS `asb_platforms` (
  `platform_id` int(11) NOT NULL,
  `platform_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_roles`
--

DROP TABLE IF EXISTS `asb_roles`;
CREATE TABLE IF NOT EXISTS `asb_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_roles_users`
--

DROP TABLE IF EXISTS `asb_roles_users`;
CREATE TABLE IF NOT EXISTS `asb_roles_users` (
  `role_users_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`role_users_id`),
  UNIQUE KEY `role_id_UNIQUE` (`role_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_roles_utilisateurs`
--

DROP TABLE IF EXISTS `asb_roles_utilisateurs`;
CREATE TABLE IF NOT EXISTS `asb_roles_utilisateurs` (
  `roles_users_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`roles_users_id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_site`
--

DROP TABLE IF EXISTS `asb_site`;
CREATE TABLE IF NOT EXISTS `asb_site` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_is_child_directed` bigint(20) NOT NULL,
  `country_id` int(11) NOT NULL,
  `site_name` varchar(45) NOT NULL,
  `format_height` int(11) NOT NULL,
  `site_is_archived` int(11) NOT NULL,
  `site_extrenal_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `site_url` varchar(255) NOT NULL,
  `language_id` int(11) NOT NULL,
  `site_updated_at` datetime NOT NULL,
  `site_business_model_type_id` int(11) NOT NULL,
  `site_business_model_value` int(11) NOT NULL,
  `site_application_id` datetime NOT NULL,
  `country_country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`site_id`),
  KEY `country_country_id` (`country_country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_sites`
--

DROP TABLE IF EXISTS `asb_sites`;
CREATE TABLE IF NOT EXISTS `asb_sites` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_is_child_directed` tinyint(1) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `site_name` varchar(45) DEFAULT NULL,
  `site_is_archived` tinyint(1) DEFAULT NULL,
  `site_extrenal_id` int(11) DEFAULT NULL,
  `user_group_id` int(11) DEFAULT NULL,
  `site_url` varchar(45) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `site_updated_at` datetime DEFAULT NULL,
  `site_business_model_type_id` int(11) DEFAULT NULL,
  `site_businessModelValue` int(11) DEFAULT NULL,
  `site_application_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_templates`
--

DROP TABLE IF EXISTS `asb_templates`;
CREATE TABLE IF NOT EXISTS `asb_templates` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) DEFAULT NULL,
  `internalName` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `isOfficial` tinyint(4) DEFAULT NULL,
  `isArchived` tinyint(4) DEFAULT NULL,
  `parameterDefaultValues` text DEFAULT NULL,
  `originalId` int(11) DEFAULT NULL,
  `documentationURL` varchar(45) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `draftScriptId` int(11) DEFAULT NULL,
  `replacedBy` int(11) DEFAULT NULL,
  `isEditable` tinyint(4) DEFAULT NULL,
  `isPublished` tinyint(4) DEFAULT NULL,
  `isDeprecated` tinyint(4) DEFAULT NULL,
  `isHidden` tinyint(4) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `version` varchar(45) DEFAULT NULL,
  `majorVersion` int(11) DEFAULT NULL,
  `minorVersion` int(11) DEFAULT NULL,
  `releaseNote` varchar(255) DEFAULT NULL,
  `recommendation` varchar(255) DEFAULT NULL,
  `salesChannelId` int(11) DEFAULT NULL,
  `previewImageUrls` varchar(255) DEFAULT NULL,
  `galleryUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_users`
--

DROP TABLE IF EXISTS `asb_users`;
CREATE TABLE IF NOT EXISTS `asb_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `asb_utilisateurs`
--

DROP TABLE IF EXISTS `asb_utilisateurs`;
CREATE TABLE IF NOT EXISTS `asb_utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `asb_campaigns`
--
ALTER TABLE `asb_campaigns`
  ADD CONSTRAINT `advertiserIds` FOREIGN KEY (`advertiser_id`) REFERENCES `asb_advertisers` (`advertiser_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `agencyIds` FOREIGN KEY (`agency_id`) REFERENCES `asb_agencies` (`agency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table ` asb_campaigns_epilot`
--
ALTER TABLE ` asb_campaigns_epilot`
  ADD CONSTRAINT `advertiser_id` FOREIGN KEY (`advertiser_id`) REFERENCES `asb_advertisers` (`advertiser_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `agency_id` FOREIGN KEY (`agency_id`) REFERENCES `asb_agencies` (`agency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `asb_creatives`
--
ALTER TABLE `asb_creatives`
  ADD CONSTRAINT `id_creative_type` FOREIGN KEY (`platform_id`) REFERENCES `asb_platforms` (`platform_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_insertions` FOREIGN KEY (`insertion_id`) REFERENCES `asb_insertions` (`insertion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table ` asb_formats`
--
ALTER TABLE ` asb_formats`
  ADD CONSTRAINT `groupFormatId` FOREIGN KEY (`group_format_id`) REFERENCES `asb_groups_formats` (`group_format_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `asb_groups_cappings_insertions`
--
ALTER TABLE `asb_groups_cappings_insertions`
  ADD CONSTRAINT `capping_group` FOREIGN KEY (`group_capping_id`) REFERENCES `asb_groups_cappings` (`group_capping_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `insertion_id` FOREIGN KEY (`insertion_id`) REFERENCES `asb_insertions` (`insertion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `asb_insertions`
--
ALTER TABLE `asb_insertions`
  ADD CONSTRAINT `campaignId` FOREIGN KEY (`campaignId`) REFERENCES `asb_campaigns` (`campaign_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `deliverytype_id` FOREIGN KEY (`deliveryTypeId`) REFERENCES `asb_deliverytypes` (`deliverytype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `formatId` FOREIGN KEY (`formatId`) REFERENCES ` asb_formats` (`format_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `insertion_priority` FOREIGN KEY (`priorityId`) REFERENCES `asb_insertions_priorities` (`insertion_prioritie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `asb_insertions_templates`
--
ALTER TABLE `asb_insertions_templates`
  ADD CONSTRAINT `insertionId` FOREIGN KEY (`insertion_id`) REFERENCES `asb_insertions` (`insertion_id`),
  ADD CONSTRAINT `templateId` FOREIGN KEY (`template_id`) REFERENCES `asb_templates` (`template_id`);

--
-- Contraintes pour la table `asb_packs`
--
ALTER TABLE `asb_packs`
  ADD CONSTRAINT `pageId` FOREIGN KEY (`page_id`) REFERENCES `asb_pages` (`page_id`),
  ADD CONSTRAINT `siteId` FOREIGN KEY (`site_id`) REFERENCES `asb_sites` (`site_id`);

--
-- Contraintes pour la table `asb_packs_sites`
--
ALTER TABLE `asb_packs_sites`
  ADD CONSTRAINT `pack_id` FOREIGN KEY (`pack_group_id`) REFERENCES `asb_packs_group` (`pack_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `site_id` FOREIGN KEY (`site_id`) REFERENCES `asb_sites` (`site_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `asb_pack_sites`
--
ALTER TABLE `asb_pack_sites`
  ADD CONSTRAINT `asb_pack_sites_ibfk_1` FOREIGN KEY (`pack_id`) REFERENCES `asb_pack` (`pack_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asb_pack_sites_ibfk_2` FOREIGN KEY (`site_id`) REFERENCES `asb_site` (`site_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `asb_pages_groups_formats`
--
ALTER TABLE `asb_pages_groups_formats`
  ADD CONSTRAINT `asb_format_id` FOREIGN KEY (`format_id`) REFERENCES ` asb_formats` (`format_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `page_group_id` FOREIGN KEY (`page_group_id`) REFERENCES `asb_pages_group` (`page_group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `asb_roles_users`
--
ALTER TABLE `asb_roles_users`
  ADD CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `asb_roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `asb_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `asb_roles_utilisateurs`
--
ALTER TABLE `asb_roles_utilisateurs`
  ADD CONSTRAINT `asb_roles_utilisateurs_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `asb_roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asb_roles_utilisateurs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `asb_utilisateurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `asb_site`
--
ALTER TABLE `asb_site`
  ADD CONSTRAINT `asb_site_ibfk_1` FOREIGN KEY (`country_country_id`) REFERENCES `asb_country` (`country_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
