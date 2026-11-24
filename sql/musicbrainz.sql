-- Adds MusicBrainz ids to an existing Open Opus database.
-- A composer has one MusicBrainz artist id; a work can have several
-- MusicBrainz work ids, as MusicBrainz sometimes holds duplicate entries.
-- Run cln/db.sh afterwards to clear cached responses so the ids show up.

ALTER TABLE `composer`
  ADD `mbid` char(36) CHARACTER SET ascii DEFAULT NULL,
  ADD KEY `mbid` (`mbid`);

CREATE TABLE `work_mbid` (
  `work_id` int(10) UNSIGNED NOT NULL,
  `mbid` char(36) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`work_id`,`mbid`),
  KEY `mbid` (`mbid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
