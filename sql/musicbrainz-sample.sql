-- Sample MusicBrainz ids for Beethoven's symphonies and four Puccini operas.
-- Uses the ids of the live Open Opus database. Run sql/musicbrainz.sql first.

UPDATE `composer` SET `mbid` = '1f9df192-a621-4f54-8850-2c5373b7eac9' WHERE `id` = 145; -- Ludwig van Beethoven
UPDATE `composer` SET `mbid` = 'a693df4a-8762-4a45-b7fd-6695b558385e' WHERE `id` = 146; -- Giacomo Puccini

INSERT IGNORE INTO `work_mbid` (`work_id`, `mbid`) VALUES
  (16354, '3c9a74de-88aa-361a-bdea-d200eae8073c'), -- Symphony no. 1 in C major, op. 21
  (16410, '3c33b26a-6683-3b37-84e1-42f3f5221322'), -- Symphony no. 2 in D major, op. 36
  (16143, '80737426-8ef3-3a9c-a3a6-9507afb93e93'), -- Symphony no. 3 in E flat major, op. 55, "Eroica"
  (16469, '273fea50-59bf-4711-81c8-035502b40c24'), -- Symphony no. 4 in B flat major, op. 60
  (16406, 'd03bff61-26fc-301b-98ac-4d8e85771cbc'), -- Symphony no. 5 in C minor, op. 67
  (16121, '60e1dcf6-e728-35be-8948-ba74500b6c6e'), -- Symphony no. 6 in F major, op. 68, "Pastoral"
  (16124, 'c7caedf2-954f-394b-9601-5878b76577ac'), -- Symphony no. 7 in A major, op. 92
  (16228, '256f32ec-94c5-44e8-b3fc-a027d92eec09'), -- Symphony no. 8 in F major, op. 93
  (16238, 'c35b4956-d4f8-321a-865b-5b13d9ed192b'), -- Symphony no. 9 in D minor, op. 125, "Choral"
  (16525, '765c54af-eff4-40ce-8f86-d8aa1c8138d4'), -- La bohème
  (16529, 'e83a319a-4568-4077-88a4-f8f4db416926'), -- Madama Butterfly
  (16519, 'b3e15438-61c0-4357-aba9-f05e29bb639d'), -- Tosca
  (16490, 'f617e5ae-572c-46a9-9902-1d53774c01aa'); -- Turandot
