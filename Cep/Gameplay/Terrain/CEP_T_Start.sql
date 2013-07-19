--

--
-- Alter tables
--

CREATE TABLE IF NOT EXISTS
	Resource_TerrainWeights (
	ResourceType	text REFERENCES Resources(Type),
	TerrainType		text REFERENCES Terrains(Type),
	FeatureType		text default NULL,
	PlotType		text default NULL,
	Freshwater		boolean default false,
	NotLake			boolean default false,
	Weight			variant default 1
);

ALTER TABLE Builds			ADD AIAvailability						integer default 0;

ALTER TABLE Resources		ADD NumPerTerritory						variant default 0;
ALTER TABLE Resources		ADD MutuallyExclusiveGroup				integer default -1;

ALTER TABLE Worlds			ADD AICapitalRevealRadius				integer default 0;
ALTER TABLE Worlds			ADD ResourceMod							integer default 100;

ALTER TABLE Natural_Wonder_Placement ADD Type text;
UPDATE Natural_Wonder_Placement SET Type = ID;



--
-- General data
--

UPDATE Features SET Impassable=0, Movement=2, Defense=10 WHERE Type IN (
	'FEATURE_CRATER'			,
	'FEATURE_GEYSER'			,
	'FEATURE_FOUNTAIN_YOUTH'	,
	'FEATURE_EL_DORADO'			,
	'FEATURE_MESA'				,
	'FEATURE_REEF'				,
	'FEATURE_ULURU'				
);

UPDATE Natural_Wonder_Placement SET ChangeCoreTileToMountain=0 WHERE NaturalWonderType IN (
	'FEATURE_CRATER'			,
	'FEATURE_GEYSER'			,
	'FEATURE_FOUNTAIN_YOUTH'	,
	'FEATURE_EL_DORADO'			,
	'FEATURE_MESA'				,
	'FEATURE_REEF'				,
	'FEATURE_ULURU'				
);



UPDATE Features SET OccurrenceFrequency = 10 WHERE OccurrenceFrequency <> 0;


INSERT OR REPLACE INTO Improvement_ResourceTypes(ImprovementType, ResourceType) 
SELECT improve.Type, res.Type
FROM Improvements improve, Resources res
WHERE (
	(improve.CreatedByGreatPerson = 1 OR improve.SpecificCivRequired = 1)
	AND NOT res.TechCityTrade = 'TECH_SAILING'
	AND NOT improve.Type = 'IMPROVEMENT_POLDER'
);

INSERT OR REPLACE INTO Improvement_ResourceType_Yields(ImprovementType, ResourceType, YieldType, Yield) 
SELECT improve.Type, resTypes.ResourceType, resYields.YieldType, resYields.Yield 
FROM Improvements improve, Improvement_ResourceTypes resTypes, Improvement_ResourceType_Yields resYields, Improvements impBasic
WHERE (improve.CreatedByGreatPerson = 1 OR improve.SpecificCivRequired = 1)
AND resTypes.ImprovementType = improve.Type
AND resTypes.ResourceType = resYields.ResourceType
AND resYields.ImprovementType = impBasic.Type
AND NOT (impBasic.CreatedByGreatPerson = 1 OR impBasic.SpecificCivRequired = 1);



-- This CEP_T_Start.sql data created by:
-- TechUnlocks tab of CEP_Details.xls spreadsheet in mod folder.
/*
UPDATE BuildFeatures SET PrereqTech = 'TECH_ANIMAL_HUSBANDRY' WHERE FeatureType = 'FEATURE_FOREST';
UPDATE BuildFeatures SET PrereqTech = 'TECH_THE_WHEEL' WHERE FeatureType = 'FEATURE_JUNGLE';
UPDATE BuildFeatures SET PrereqTech = 'TECH_THE_WHEEL' WHERE FeatureType = 'FEATURE_MARSH';
UPDATE Resources SET TechCityTrade = 'TECH_ARCHERY' WHERE TechCityTrade = 'TECH_TRAPPING';
*/

-- Buff jungles and forests
UPDATE BuildFeatures SET Remove = 0 WHERE FeatureType = 'FEATURE_JUNGLE' AND BuildType IN ('BUILD_FARM', 'BUILD_PLANTATION');
UPDATE BuildFeatures SET Time = 400 WHERE (FeatureType = 'FEATURE_JUNGLE' AND Time <> 0 AND Remove = 0);
--UPDATE BuildFeatures SET Production = 20 WHERE FeatureType = 'FEATURE_JUNGLE' AND Remove = 1;
--UPDATE BuildFeatures SET Production = 40 WHERE FeatureType = 'FEATURE_FOREST' AND Remove = 1;


UPDATE LoadedFile SET Value=1 WHERE Type='GET_Start.sql';