
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


UPDATE LoadedFile SET Value=1 WHERE Type='GET_Start.sql';