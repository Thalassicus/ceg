/*

You can change most options in this file at any time, unless indicated otherwise.
Changes take effect the next time you start or load a game with Communitas.

For example, if you wish to remove the human's combat bonus against barbarians on Prince difficulty,
change the lines that read:

	UPDATE HandicapInfos SET BarbarianBonus =  15 WHERE Type = 'HANDICAP_PRINCE';

...change to...

	UPDATE HandicapInfos SET BarbarianBonus =   0 WHERE Type = 'HANDICAP_PRINCE';

Then start a new game.

*/



-------------
-- Options --
-------------


/*
Human-vs-barbarian combat bonus.
*/
UPDATE HandicapInfos SET BarbarianBonus = 150 WHERE Type = 'HANDICAP_SETTLER';
UPDATE HandicapInfos SET BarbarianBonus =  50 WHERE Type = 'HANDICAP_CHIEFTAIN';
UPDATE HandicapInfos SET BarbarianBonus =  20 WHERE Type = 'HANDICAP_WARLORD';
UPDATE HandicapInfos SET BarbarianBonus =  15 WHERE Type = 'HANDICAP_PRINCE';
UPDATE HandicapInfos SET BarbarianBonus =  15 WHERE Type = 'HANDICAP_KING';
UPDATE HandicapInfos SET BarbarianBonus =  15 WHERE Type = 'HANDICAP_EMPEROR';
UPDATE HandicapInfos SET BarbarianBonus =  15 WHERE Type = 'HANDICAP_IMMORTAL';
UPDATE HandicapInfos SET BarbarianBonus =  15 WHERE Type = 'HANDICAP_DEITY';

UPDATE Defines SET Value = 60 WHERE Name = 'BARBARIAN_MAX_XP_VALUE';


/*
Minimum distance (in tiles) between cities.
*/
UPDATE Defines SET Value = 2 WHERE Name = 'MIN_CITY_RANGE';


/*
Higher number if you want more natural wonders, or negative if you want fewer.
*/
UPDATE Worlds SET NumNaturalWonders = NumNaturalWonders + 1;

















--
-- Do not change items below

UPDATE LoadedFile SET Value=1 WHERE Type='Cep_Options.sql';
