SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `composer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complete_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth` date NOT NULL,
  `death` date DEFAULT NULL,
  `epoch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recommended` tinyint(1) UNSIGNED DEFAULT '0',
  `popular` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `omnisearch` (
  `summary` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `composer_id` int(10) UNSIGNED NOT NULL,
  `work_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `performer` (
  `id` int(10) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `work` (
  `id` int(10) UNSIGNED NOT NULL,
  `composer_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `searchterms` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `genre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` date DEFAULT NULL,
  `recommended` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `popular` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


ALTER TABLE `composer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `complete_name` (`complete_name`),
  ADD KEY `birth` (`birth`),
  ADD KEY `death` (`death`),
  ADD KEY `epoch` (`epoch`),
  ADD KEY `recommended` (`recommended`),
  ADD KEY `country` (`country`),
  ADD KEY `popular` (`popular`);
ALTER TABLE `composer` ADD FULLTEXT KEY `name_2` (`name`,`complete_name`);

ALTER TABLE `omnisearch` ADD FULLTEXT KEY `summary` (`summary`);

ALTER TABLE `performer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `role` (`role`);

ALTER TABLE `work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `composer_id` (`composer_id`),
  ADD KEY `title` (`title`),
  ADD KEY `genre` (`genre`),
  ADD KEY `year` (`year`),
  ADD KEY `recommended` (`recommended`),
  ADD KEY `popular` (`popular`);
ALTER TABLE `work` ADD FULLTEXT KEY `titlesearch` (`title`,`subtitle`);


ALTER TABLE `composer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;
ALTER TABLE `performer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36631;
ALTER TABLE `work`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28084;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
