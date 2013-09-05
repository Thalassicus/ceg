/*

You can change most options in this file at any time, unless indicated otherwise.
Changes take effect the next time you start or load a game with Communitas.

For example, if you are using the "Citystate Diplomacy" mod change the lines that read:

	INSERT INTO Cep (Type, Value)
	VALUES ('USING_CSD', 0);

...change to...

	INSERT INTO Cep (Type, Value)
	VALUES ('USING_CSD', 1);

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
UPDATE Defines
SET Value = 2
WHERE Name = 'MIN_CITY_RANGE';


/*
Higher number if you want more natural wonders, or negative if you want fewer.
*/
UPDATE Worlds SET NumNaturalWonders = NumNaturalWonders + 1;


/*
Unit Movement Animation Duration
The animation time required for a unit to visually move between tiles.
The default Cep values are 50% of vanilla (half duration = twice as fast).
*/
UPDATE MovementRates SET
TotalTime			= 0.5 * TotalTime,
EaseIn				= 0.5 * EaseIn,
EaseOut				= 0.5 * EaseOut,
IndividualOffset	= 0.5 * IndividualOffset,
RowOffset			= 0.5 * RowOffset;


/*
Aircraft Move Speed
The speed of aircraft movement.
The default Cep values are 400% of vanilla (four times as fast).
*/

UPDATE ArtDefine_UnitMemberCombats
SET MoveRate = 4 * MoveRate;

UPDATE ArtDefine_UnitMemberCombats
SET TurnRateMin = 4 * TurnRateMin
WHERE MoveRate > 0;

UPDATE ArtDefine_UnitMemberCombats
SET TurnRateMax = 4 * TurnRateMax
WHERE MoveRate > 0;


/*
Debug Mode
1 = display lua logger messages
0 = do not display messages
*/
INSERT INTO Defines (Name, Value)
VALUES ('CEP_DEBUG_MODE', 1);

















--
-- Do not change items below

UPDATE Defines SET Value=1 WHERE Name='QUEST_DISABLED_INVEST' AND EXISTS 
(SELECT Value FROM Cep WHERE Type='DISABLE_GOLD_GIFTS' AND Value=1);

UPDATE Civilizations SET DawnOfManAudio = "" WHERE EXISTS 
(SELECT Value FROM Cep WHERE Type='PLAY_SPEECH_START' AND Value=0);

UPDATE Buildings SET WonderSplashAudio = "" WHERE EXISTS 
(SELECT Value FROM Cep WHERE Type='PLAY_SPEECH_WONDERS' AND Value=0);

UPDATE Technologies SET AudioIntroHeader = "" WHERE EXISTS 
(SELECT Value FROM Cep WHERE Type='PLAY_SPEECH_TECHS' AND Value=0);

UPDATE Technologies SET AudioIntro = "" WHERE EXISTS 
(SELECT Value FROM Cep WHERE Type='PLAY_SPEECH_TECHS' AND Value=0);

UPDATE LoadedFile SET Value=1 WHERE Type='Cep_Options.sql';
