--

UPDATE GameSpeeds SET InflationPercent = 0;

DELETE FROM Building_DomainFreeExperiences;

--
-- Specific Buildings
--

/*
UPDATE Buildings SET FoodKept = 0 WHERE BuildingClass = 'BUILDINGCLASS_AQUEDUCT';
INSERT INTO				Building_SurplusYieldModifier (BuildingType, YieldType, Yield) 
SELECT					Type, 'YIELD_FOOD', 67
FROM					Buildings
WHERE					BuildingClass = 'BUILDINGCLASS_AQUEDUCT';
*/


--
-- Resources
--

DELETE FROM Building_ResourceYieldChanges
WHERE BuildingType IN (
	'BUILDING_GRANARY'		,
	'BUILDING_STABLE'		,
	'BUILDING_DUCAL_STABLE'	,
	'BUILDING_FORGE'		,
	'BUILDING_MINT'
);

INSERT OR REPLACE INTO	Building_ResourceYieldChanges
						(BuildingType, ResourceType, YieldType, Yield) 
SELECT					building.Type, res.Type, 'YIELD_FAITH', 2
FROM					Buildings building, Resources res
WHERE					building.BuildingClass = 'BUILDINGCLASS_TEMPLE'
						AND res.Type IN (
							'RESOURCE_WINE'		,
							'RESOURCE_INCENSE'
						);

INSERT OR REPLACE INTO	Building_ResourceYieldChanges
						(BuildingType, ResourceType, YieldType, Yield) 
SELECT					building.Type, res.Type, 'YIELD_FOOD', 1
FROM					Buildings building, Resources res
WHERE					building.BuildingClass = 'BUILDINGCLASS_GRANARY'
						AND res.Type IN (
							'RESOURCE_WHEAT'	,
							'RESOURCE_SPICES'	,
							'RESOURCE_SUGAR'	
						);

INSERT OR REPLACE INTO	Building_ResourceYieldChanges
						(BuildingType, ResourceType, YieldType, Yield) 
SELECT					building.Type, res.Type, 'YIELD_FOOD', 1
FROM					Buildings building, Resources res
WHERE					building.BuildingClass = 'BUILDINGCLASS_AQUEDUCT'
						AND res.Type IN (
							'RESOURCE_CITRUS'	,
							'RESOURCE_TRUFFLES'	,
							'RESOURCE_BANANA'	,
							'RESOURCE_SALT'		
						);

INSERT OR REPLACE INTO	Building_ResourceYieldChanges
						(BuildingType, ResourceType, YieldType, Yield) 
SELECT					building.Type, res.Type, 'YIELD_CULTURE', 1
FROM					Buildings building, Resources res
WHERE					building.BuildingClass = 'BUILDINGCLASS_AMPHITHEATER'
						AND res.Type IN (
							'RESOURCE_SILK'		,
							'RESOURCE_COTTON'	,
							'RESOURCE_FUR'		,
							'RESOURCE_DYE'
						);

INSERT OR REPLACE INTO	Building_ResourceYieldChanges
						(BuildingType, ResourceType, YieldType, Yield) 
SELECT					building.Type, res.Type, 'YIELD_PRODUCTION', 1
FROM					Buildings building, Resources res
WHERE					building.BuildingClass = 'BUILDINGCLASS_STABLE'
						AND res.Type IN (
							'RESOURCE_HORSE'	,
							'RESOURCE_SHEEP'	,
							'RESOURCE_COW'		,
							'RESOURCE_DEER'		,
							'RESOURCE_IVORY'
						);

INSERT OR REPLACE INTO	Building_ResourceYieldChanges
						(BuildingType, ResourceType, YieldType, Yield) 
SELECT					'BUILDING_DUCAL_STABLE', res.Type, 'YIELD_GOLD', 1
FROM					Resources res
WHERE					res.Type IN (
							'RESOURCE_HORSE'	,
							'RESOURCE_SHEEP'	,
							'RESOURCE_COW'		,
							'RESOURCE_DEER'		,
							'RESOURCE_IVORY'
						);

INSERT OR REPLACE INTO	Building_ResourceYieldChanges
						(BuildingType, ResourceType, YieldType, Yield) 
SELECT					building.Type, res.Type, 'YIELD_GOLD', 1
FROM					Buildings building, Resources res
WHERE					building.BuildingClass = 'BUILDINGCLASS_MINT'
						AND res.Type IN (
							'RESOURCE_COPPER'	,
							'RESOURCE_SILVER'	,
							'RESOURCE_GOLD'		,
							'RESOURCE_GEMS'		
						);

INSERT OR REPLACE INTO	Building_ResourceYieldChanges
						(BuildingType, ResourceType, YieldType, Yield) 
SELECT					building.Type, res.Type, 'YIELD_PRODUCTION', 1
FROM					Buildings building, Resources res
WHERE					building.BuildingClass = 'BUILDINGCLASS_BARRACKS'
						AND res.TechReveal <> 'TECH_ARCHAEOLOGY'
						AND res.ResourceClassType IN (
							'RESOURCECLASS_RUSH',
							'RESOURCECLASS_MODERN'
						);

						/*
INSERT OR REPLACE INTO	Building_ResourceYieldChanges
						(BuildingType, ResourceType, YieldType, Yield) 
SELECT					building.Type, res.Type, 'YIELD_PRODUCTION', 2
FROM					Buildings building, Resources res
WHERE					building.BuildingClass = 'BUILDINGCLASS_FACTORY'
						AND res.Type IN (
							'RESOURCE_COAL'		,
							'RESOURCE_ALUMINUM'	,
							'RESOURCE_OIL'		,
							'RESOURCE_URANIUM'
						);
						*/

INSERT OR REPLACE INTO	Building_ResourceYieldChanges(BuildingType, ResourceType, YieldType, Yield) 
SELECT					building.Type, res.Type, 'YIELD_GOLD', 1
FROM					Buildings building, Resources res
WHERE					building.BuildingClass = 'BUILDINGCLASS_CARAVANSARY'
AND						res.Happiness > 0;



--
-- Yields
--

INSERT OR REPLACE INTO	Building_YieldChanges(BuildingType, YieldType, Yield) 
SELECT					building.Type, 'YIELD_FOOD', 1
FROM					Buildings building
WHERE					building.BuildingClass IN (
						'BUILDINGCLASS_LIGHTHOUSE'
						);

INSERT OR REPLACE INTO	Building_YieldChanges(BuildingType, YieldType, Yield) 
SELECT					building.Type, 'YIELD_PRODUCTION', 1
FROM					Buildings building
WHERE					building.BuildingClass IN (
						'BUILDINGCLASS_STABLE'		,
						--'BUILDINGCLASS_BARRACKS'	,
						'BUILDINGCLASS_FORGE'
						);

						/*
INSERT OR REPLACE INTO	Building_YieldChanges(BuildingType, YieldType, Yield) 
SELECT					building.Type, 'YIELD_PRODUCTION', 2
FROM					Buildings building
WHERE					building.BuildingClass IN (
						--'BUILDINGCLASS_ARMORY'			,
						--'BUILDINGCLASS_MILITARY_ACADEMY'	,
						'BUILDINGCLASS_SEAPORT'				
						);
						*/

UPDATE					Building_YieldChanges
SET						Yield = 2
WHERE					(YieldType = 'YIELD_CULTURE'
AND						BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass IN (
						'BUILDINGCLASS_MONUMENT'		,
						'BUILDINGCLASS_AMPHITHEATER'	,
						--'BUILDINGCLASS_OPERA_HOUSE'		,
						--'BUILDINGCLASS_MUSEUM'			,
						'BUILDINGCLASS_BROADCAST_TOWER'	
						)));



DELETE FROM Building_UnitCombatProductionModifiers
WHERE BuildingType IN (
	'BUILDING_STABLE'		,
	'BUILDING_DUCAL_STABLE'	
);

INSERT OR REPLACE INTO	Building_UnitCombatProductionModifiers(BuildingType, UnitCombatType, Modifier) 
SELECT					building.Type, combat.Type, 15
FROM					Buildings building, UnitCombatInfos combat
WHERE					building.BuildingClass IN (
						'BUILDINGCLASS_STABLE'		,
						--'BUILDINGCLASS_BARRACKS'	,
						'BUILDINGCLASS_FORGE'
						)
AND						combat.Type IN (
						'UNITCOMBAT_MOUNTED'		,
						'UNITCOMBAT_GUN'			
						);


--
-- Features
--

DELETE FROM				Building_FeatureYieldChanges WHERE FeatureType = 'FEATURE_JUNGLE';

INSERT OR REPLACE INTO	Building_FeatureYieldChanges(BuildingType, FeatureType, YieldType, Yield) 
SELECT					building.Type, 'FEATURE_JUNGLE', 'YIELD_SCIENCE', 1
FROM					Buildings building
WHERE					building.BuildingClass IN (
						'BUILDINGCLASS_UNIVERSITY'		,
						'BUILDINGCLASS_LABORATORY'	
						);





--
-- Remove Buildings
--

UPDATE Buildings SET Cost = -1, PrereqTech = 'NULL', FaithCost = -1, GreatWorkCount = -1 WHERE BuildingClass IN (
	'BUILDINGCLASS_RECYCLING_CENTER'	,
	'BUILDINGCLASS_BOMB_SHELTER'		,
	'BUILDINGCLASS_FORGE'				
	
);

--
-- Remove Unique or Dummy Buildings
--

UPDATE Buildings SET Cost = -1, PrereqTech = 'NULL', FaithCost = -1, GreatWorkCount = -1 WHERE Type IN (
	'BUILDING_TRIBUTE'					,
	'BUILDING_TRADE_COMPANY'			,
	'BUILDING_MUGHAL_FORT'				,
	'BUILDING_HANSEATIC_LEAGUE'			,
	'BUILDING_CEILIDH_HALL'				,
	'BUILDING_AI_CULTURE'				,
	'BUILDING_AI_GOLD'					,
	'BUILDING_AI_PRODUCTION'			,
	'BUILDING_AI_SCIENCE'				,
	'BUILDING_HAPPINESS_CITY'			,
	'BUILDING_HAPPINESS_NATIONAL'		
);

--
-- Rename Buildings
--

UPDATE Buildings SET IconAtlas='TECH_ATLAS_1',	PortraitIndex=51	WHERE Type = 'BUILDING_STADIUM';
UPDATE Buildings SET							PortraitIndex=20	WHERE Type = 'BUILDING_AMPHITHEATRE';
UPDATE Buildings SET							PortraitIndex=28	WHERE Type = 'BUILDING_WINDMILL';
UPDATE Buildings SET							PortraitIndex=4		WHERE Type = 'BUILDING_FACTORY';
UPDATE Buildings SET IconAtlas='TECH_ATLAS_1',	PortraitIndex=14	WHERE Type = 'BUILDING_FORGE';
UPDATE Buildings SET							PortraitIndex=2		WHERE Type = 'BUILDING_WORKSHOP';
UPDATE Buildings SET IconAtlas='EXPANSION2_BUILDING_ATLAS',	PortraitIndex=10		WHERE Type = 'BUILDING_PALACE';

-- This CEC__End.sql data created by:
-- Renames tab of CEP_ArmiesCities.xls spreadsheet (in mod folder).
--UPDATE Buildings SET Description='TXT_KEY_BUILDING_THEATRE',             Civilopedia='TXT_KEY_BUILDING_THEATRE_PEDIA'              WHERE Type = 'BUILDING_AMPHITHEATER';
UPDATE Buildings SET Description='TXT_KEY_BUILDING_ARENA',               Civilopedia='TXT_KEY_BUILDING_ARENA_PEDIA'                WHERE Type = 'BUILDING_COLOSSEUM';
--UPDATE Buildings SET Description='TXT_KEY_BUILDING_ZOO',                 Civilopedia='TXT_KEY_BUILDING_ZOO_PEDIA'                  WHERE Type = 'BUILDING_THEATRE';
UPDATE Buildings SET Description='TXT_KEY_BUILDING_CINEMA',              Civilopedia='TXT_KEY_BUILDING_CINEMA_PEDIA'               WHERE Type = 'BUILDING_STADIUM';
UPDATE Buildings SET Description='TXT_KEY_BUILDING_VACCINATIONS',        Civilopedia='TXT_KEY_BUILDING_VACCINATIONS_PEDIA'         WHERE Type = 'BUILDING_MEDICAL_LAB';
UPDATE Buildings SET Description='TXT_KEY_BUILDING_SUPERMAX_PRISON',     Civilopedia='TXT_KEY_BUILDING_SUPERMAX_PRISON_PEDIA'      WHERE Type = 'BUILDING_POLICE_STATION';
UPDATE Buildings SET Description='TXT_KEY_BUILDING_CAPITAL_BUILDING',    Civilopedia='TXT_KEY_BUILDING_CAPITAL_BUILDING_PEDIA'     WHERE Type = 'BUILDING_PALACE';
UPDATE Buildings SET Description='TXT_KEY_BUILDING_WORKSHOP',            Civilopedia='TXT_KEY_BUILDING_WORKSHOP_PEDIA'             WHERE Type = 'BUILDING_WINDMILL';
UPDATE Buildings SET Description='TXT_KEY_BUILDING_SMITH',               Civilopedia='TXT_KEY_BUILDING_SMITH_PEDIA'                WHERE Type = 'BUILDING_WORKSHOP';

UPDATE BuildingClasses SET Description = (SELECT Description FROM Buildings b WHERE BuildingClasses.DefaultBuilding = b.Type);


UPDATE LoadedFile SET Value=1 WHERE Type='CEC_End.sql';