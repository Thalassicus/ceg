--

UPDATE GameSpeeds SET InflationPercent = 0;

--
-- Resources
--

DELETE FROM Building_ResourceYieldChanges
WHERE BuildingType IN (
	'BUILDING_GRANARY',
	'BUILDING_STABLE',
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
WHERE					building.BuildingClass = 'BUILDINGCLASS_CARAVANSARY'
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
WHERE					building.BuildingClass = 'BUILDINGCLASS_MARKET'
AND						res.Happiness > 0;


UPDATE LoadedFile SET Value=1 WHERE Type='GEC_End.sql';