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
	'BUILDING_GRANARY',
	'BUILDING_STABLE',
	'BUILDING_DUCAL_STABLE',
	'BUILDING_FORGE'
);

INSERT OR REPLACE INTO	Building_ResourceYieldChanges
						(BuildingType, ResourceType, YieldType, Yield) 
SELECT					building.Type, res.Type, 'YIELD_FAITH', 1
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
SELECT					building.Type, res.Type, 'YIELD_PRODUCTION', 1
FROM					Buildings building, Resources res
WHERE					building.BuildingClass = 'BUILDINGCLASS_FORGE'
						AND res.Type IN (
							'RESOURCE_IRON'		,
							'RESOURCE_COAL'		,
							'RESOURCE_COPPER'	
						);

INSERT OR REPLACE INTO	Building_ResourceYieldChanges
						(BuildingType, ResourceType, YieldType, Yield) 
SELECT					building.Type, res.Type, 'YIELD_PRODUCTION', 2
FROM					Buildings building, Resources res
WHERE					building.BuildingClass = 'BUILDINGCLASS_FACTORY'
						AND res.Type IN (
							'RESOURCE_ALUMINUM'	,
							'RESOURCE_OIL'		,
							'RESOURCE_URANIUM'
						);

INSERT OR REPLACE INTO	Building_ResourceYieldChanges(BuildingType, ResourceType, YieldType, Yield) 
SELECT					building.Type, res.Type, 'YIELD_GOLD', 1
FROM					Buildings building, Resources res
WHERE					building.BuildingClass = 'BUILDINGCLASS_CARAVANSARY'
AND						res.Happiness > 0;


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
-- Yields
--

INSERT OR REPLACE INTO	Building_YieldChanges(BuildingType, YieldType, Yield) 
SELECT					building.Type, 'YIELD_PRODUCTION', 1
FROM					Buildings building
WHERE					building.BuildingClass IN (
						'BUILDINGCLASS_STABLE'		,
						'BUILDINGCLASS_BARRACKS'	
						);

INSERT OR REPLACE INTO	Building_YieldChanges(BuildingType, YieldType, Yield) 
SELECT					building.Type, 'YIELD_PRODUCTION', 2
FROM					Buildings building
WHERE					building.BuildingClass IN (
						'BUILDINGCLASS_ARMORY'				,
						'BUILDINGCLASS_MILITARY_ACADEMY'	,
						'BUILDINGCLASS_SEAPORT'				
						);
						
UPDATE					Building_YieldChanges
SET						Yield = 2
WHERE					(YieldType = 'YIELD_CULTURE'
AND						BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass IN (
						'BUILDINGCLASS_MONUMENT'		,
						'BUILDINGCLASS_AMPHITHEATER'	,
						'BUILDINGCLASS_OPERA_HOUSE'		,
						'BUILDINGCLASS_MUSEUM'			,
						'BUILDINGCLASS_BROADCAST_TOWER'	
						)));

UPDATE LoadedFile SET Value=1 WHERE Type='CEC_End.sql';