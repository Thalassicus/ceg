-- Alter tables

CREATE TABLE IF NOT EXISTS
	BuildingFields (
	ID				integer PRIMARY KEY,
	Type			text NOT NULL UNIQUE,
	Section			integer default 1,
	Priority		integer default 1,
	Dynamic			integer default 0,
	Value			text
);


CREATE TABLE IF NOT EXISTS
	Building_Addons (
	BuildingType		text REFERENCES Buildings(Type),
	ParentBuildingClass	text REFERENCES BuildingClasses(Type)
);
	
CREATE TABLE IF NOT EXISTS
	Building_BuildingClassYieldModifiers (
	BuildingType		text REFERENCES Buildings(Type),
	BuildingClassType	text REFERENCES BuildingClasses(Type),
	YieldType			text,
	Yield				integer NOT NULL 
);
	
CREATE TABLE IF NOT EXISTS
	Building_YieldInstant (
	BuildingType		text REFERENCES Buildings(Type),
	YieldType			text,
	Yield				integer NOT NULL 
);
	
CREATE TABLE IF NOT EXISTS
	Building_NearestPlotYieldChanges (
	BuildingType		text REFERENCES Buildings(Type),
	PlotType			text,
	YieldType			text REFERENCES Yields(Type),
	Yield				integer NOT NULL 
);
	
CREATE TABLE IF NOT EXISTS
	Building_PlotYieldChanges (
	BuildingType		text REFERENCES Buildings(Type),
	PlotType			text,
	YieldType			text REFERENCES Yields(Type),
	Yield				integer NOT NULL 
);
	
CREATE TABLE IF NOT EXISTS
	Building_PrereqBuildingClassesPercentage (
	BuildingType			text REFERENCES Buildings(Type),
	BuildingClassType		text REFERENCES BuildingClasses(Type),
	PercentBuildingNeeded	integer default 0
);


ALTER TABLE Buildings		ADD AlwaysShowHelp						boolean; -- Use this to force the help text to display for a building.
ALTER TABLE Buildings		ADD FreePromotionAllCombatUnits			text;
ALTER TABLE Buildings		ADD CulturePerPop						integer default 0;
ALTER TABLE Buildings		ADD InstantBorderRadius					integer default 0;
ALTER TABLE Buildings		ADD GlobalInstantBorderRadius			integer default 0;
ALTER TABLE Buildings		ADD MinorFriendshipFlatChange			integer default 0;
ALTER TABLE Buildings		ADD MountainImprovement					text;
ALTER TABLE Buildings		ADD NoOccupiedUnhappinessFixed			boolean;
ALTER TABLE Buildings		ADD OnlyAI								boolean;
ALTER TABLE Buildings		ADD IsVisible							boolean default 1;
ALTER TABLE Buildings		ADD ShowInPedia							boolean default 1;
ALTER TABLE Buildings		ADD CheckWithYieldLibrary				boolean default 1;
ALTER TABLE Buildings		ADD CityCaptureCulture					integer default 0;
ALTER TABLE Buildings		ADD CityCaptureCulturePerPop			integer default 0;
ALTER TABLE Buildings		ADD CityCaptureCulturePerEra			integer default 0;
ALTER TABLE Buildings		ADD CityCaptureCulturePerEraExponent	variant default 1;
ALTER TABLE Buildings		ADD GreatGeneralRateChange				integer default 0;
ALTER TABLE Buildings		ADD IsBuildingAddon						integer default 0;
ALTER TABLE Buildings		ADD IsMarketplace						integer default 0;
ALTER TABLE	Buildings		ADD	AddonParent							text;
ALTER TABLE Buildings		ADD ShortDescription					text;
ALTER TABLE Buildings		ADD TradeDealModifier					integer default 0;
ALTER TABLE Buildings		ADD InstantHappiness					integer default 0;
ALTER TABLE Buildings		ADD GoldenAgePoints						integer default 0;
ALTER TABLE Buildings		ADD ExperiencePerTurn					integer default 0;
ALTER TABLE Buildings		ADD OneShot								boolean;
ALTER TABLE Buildings		ADD GlobalExperienceFixed				integer default 0;
ALTER TABLE Buildings		ADD AIAvailability						integer default 0;
ALTER TABLE Buildings		ADD NotFeature							text;



ALTER TABLE Building_TechEnhancedYieldChanges ADD EnhancedYieldTech text;
UPDATE Building_TechEnhancedYieldChanges SET EnhancedYieldTech = (
	SELECT EnhancedYieldTech FROM Buildings b WHERE b.Type = Building_TechEnhancedYieldChanges.BuildingType
);




-- This TW_BuildingStats.sql data created by:
-- BuildingStats tab of CEP_OtherData.xls spreadsheet (in mod folder).

-- Header --

INSERT INTO BuildingFields(ID, Section, Priority, Dynamic, Type, Value) VALUES (0, 0,  1, 1, 'Name'                        , 'Game.GetDefaultBuildingFieldText');


-- Special Abilities --

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 78, 0, 'Capital'                            , 'CEP_BuildingInfo.Capital');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 77, 0, 'GoldenAge'                          , 'CEP_BuildingInfo.GoldenAge');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 76, 0, 'FreeGreatPeople'                    , 'CEP_BuildingInfo.FreeGreatPeople');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 75, 0, 'FreeUnits'                          , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_FreeUnits)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 74, 0, 'FreeBuildingThisCity'               , 'CEP_BuildingInfo.FreeBuildingThisCity');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 73, 0, 'FreeBuilding'                       , 'CEP_BuildingInfo.FreeBuilding');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 72, 0, 'FreeResources'                      , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_ResourceQuantity)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 71, 0, 'TrainedFreePromotion'               , 'CEP_BuildingInfo.TrainedFreePromotion and Locale.ConvertTextKey(GameInfo.UnitPromotions[CEP_BuildingInfo.TrainedFreePromotion].Help) or false');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 70, 0, 'MapCentering'                       , 'CEP_BuildingInfo.MapCentering');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 69, 0, 'AllowsWaterRoutes'                  , 'CEP_BuildingInfo.AllowsWaterRoutes');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 68, 0, 'ExtraLuxuries'                      , 'CEP_BuildingInfo.ExtraLuxuries');

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 67, 0, 'DiplomaticVoting'                   , 'CEP_BuildingInfo.DiplomaticVoting');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 66, 0, 'GreatGeneralRateModifier'           , 'CEP_BuildingInfo.GreatGeneralRateModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 65, 0, 'GoldenAgeModifier'                  , 'CEP_BuildingInfo.GoldenAgeModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 64, 0, 'UnitUpgradeCostMod'                 , 'CEP_BuildingInfo.UnitUpgradeCostMod');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 63, 0, 'CityCountUnhappinessMod'            , 'CEP_BuildingInfo.CityCountUnhappinessMod');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 62, 0, 'WorkerSpeedModifier'                , 'CEP_BuildingInfo.WorkerSpeedModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 61, 0, 'CapturePlunderModifier'             , 'CEP_BuildingInfo.CapturePlunderModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 60, 0, 'PolicyCostModifier'                 , 'CEP_BuildingInfo.PolicyCostModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 59, 0, 'GlobalInstantBorderRadius'          , 'CEP_BuildingInfo.GlobalInstantBorderRadius');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 58, 0, 'PlotCultureCostModifier'            , 'CEP_BuildingInfo.PlotCultureCostModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 57, 0, 'PlotBuyCostModifier'                , 'CEP_BuildingInfo.PlotBuyCostModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 56, 0, 'GlobalPlotCultureCostModifier'      , 'CEP_BuildingInfo.GlobalPlotCultureCostModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 55, 0, 'GlobalPlotBuyCostModifier'          , 'CEP_BuildingInfo.GlobalPlotBuyCostModifier');

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 54, 0, 'FoundsReligion'                     , 'CEP_BuildingInfo.FoundsReligion');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 53, 0, 'IsReligious'                        , 'CEP_BuildingInfo.IsReligious');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 52, 0, 'Airlift'                            , 'CEP_BuildingInfo.Airlift');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 51, 0, 'NukeExplosionRand'                  , 'CEP_BuildingInfo.NukeExplosionRand');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 50, 0, 'ExtraMissionarySpreads'             , 'CEP_BuildingInfo.ExtraMissionarySpreads');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 49, 0, 'EspionageModifier'                  , 'CEP_BuildingInfo.EspionageModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 48, 0, 'GlobalEspionageModifier'            , 'CEP_BuildingInfo.GlobalEspionageModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 47, 0, 'ExtraSpies'                         , 'CEP_BuildingInfo.ExtraSpies');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 46, 0, 'SpyRankChange'                      , 'CEP_BuildingInfo.SpyRankChange');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 45, 0, 'InstantSpyRankChange'               , 'CEP_BuildingInfo.InstantSpyRankChange');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 44, 0, 'ProhibitedCityTerrain'              , 'CEP_BuildingInfo.ProhibitedCityTerrain');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 43, 0, 'ReplacementBuildingClass'           , 'CEP_BuildingInfo.ReplacementBuildingClass');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 42, 0, 'SpecialistExtraCulture'             , 'CEP_BuildingInfo.SpecialistExtraCulture		');

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 41, 0, 'GlobalPopulationChange'             , 'CEP_BuildingInfo.GlobalPopulationChange');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 40, 0, 'TechShare'                          , 'CEP_BuildingInfo.TechShare');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 39, 0, 'FreeTechs'                          , 'CEP_BuildingInfo.FreeTechs');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 38, 0, 'FreePolicies'                       , 'CEP_BuildingInfo.FreePolicies');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 37, 0, 'MinorFriendshipChange'              , 'CEP_BuildingInfo.MinorFriendshipChange');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 36, 0, 'MinorFriendshipFlatChange'          , 'CEP_BuildingInfo.MinorFriendshipFlatChange');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 35, 0, 'VictoryPoints'                      , 'CEP_BuildingInfo.VictoryPoints');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 34, 0, 'BorderObstacle'                     , 'CEP_BuildingInfo.BorderObstacle');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 33, 0, 'PlayerBorderObstacle'               , 'CEP_BuildingInfo.PlayerBorderObstacle');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 32, 0, 'HealRateChange'                     , 'CEP_BuildingInfo.HealRateChange');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 31, 0, 'MountainImprovement'                , 'CEP_BuildingInfo.MountainImprovement and Locale.ConvertTextKey(GameInfo.Improvements[CEP_BuildingInfo.MountainImprovement].Description) or false');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 30, 0, 'FreePromotion'                      , 'CEP_BuildingInfo.FreePromotion and Locale.ConvertTextKey(GameInfo.UnitPromotions[CEP_BuildingInfo.FreePromotion].Help) or false');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 29, 0, 'FreePromotionAllCombatUnits'        , 'CEP_BuildingInfo.FreePromotionAllCombatUnits and Locale.ConvertTextKey(GameInfo.UnitPromotions[CEP_BuildingInfo.FreePromotionAllCombatUnits].Help) or false');

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 28, 0, 'TradeDealModifier'                  , 'CEP_BuildingInfo.TradeDealModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 27, 0, 'GlobalGreatPeopleRateModifier'      , 'CEP_BuildingInfo.GlobalGreatPeopleRateModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 26, 1, 'UnmoddedHappiness'                  , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 25, 1, 'Happiness'                          , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 24, 0, 'HappinessPerCity'                   , 'CEP_BuildingInfo.HappinessPerCity');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 23, 0, 'HappinessPerXPolicies'              , 'CEP_BuildingInfo.HappinessPerXPolicies');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 22, 0, 'UnhappinessModifier'                , 'CEP_BuildingInfo.UnhappinessModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 21, 0, 'NoOccupiedUnhappiness'              , 'CEP_BuildingInfo.NoOccupiedUnhappiness');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 20, 0, 'InstantHappiness'                   , 'CEP_BuildingInfo.InstantHappiness');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 19, 0, 'GoldenAgePoints'                    , 'CEP_BuildingInfo.GoldenAgePoints');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 18, 0, 'Experience'                         , 'CEP_BuildingInfo.Experience');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 17, 0, 'ExperienceDomain'                   , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_DomainFreeExperiences)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 16, 0, 'ExperienceCombat'                   , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_UnitCombatFreeExperiences)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 15, 0, 'ExperiencePerTurn'                  , 'CEP_BuildingInfo.ExperiencePerTurn		');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 14, 0, 'GlobalExperience'                   , 'CEP_BuildingInfo.GlobalExperience');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 13, 0, 'Defense'                            , 'CEP_BuildingInfo.Defense / 100');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 12, 0, 'GlobalDefenseMod'                   , 'CEP_BuildingInfo.GlobalDefenseMod');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 11, 0, 'ExtraCityHitPoints'                 , 'CEP_BuildingInfo.ExtraCityHitPoints');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 10, 0, 'AirModifier'                        , 'CEP_BuildingInfo.AirModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  9, 0, 'NukeModifier'                       , 'CEP_BuildingInfo.NukeModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  8, 0, 'YieldModInAllCities'                , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_GlobalYieldModifiers)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  7, 0, 'YieldFromUsingGreatPeople'          , 'CEP_BuildingInfo.GreatPersonExpendGold');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  6, 0, 'YieldModHurry'                      , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_HurryModifiers)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  5, 0, 'CityConnectionTradeRouteModifier'   , 'CEP_BuildingInfo.CityConnectionTradeRouteModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  4, 0, 'MedianTechPercentChange'            , 'CEP_BuildingInfo.MedianTechPercentChange * 2');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  3, 0, 'InstantBorderRadius'                , 'CEP_BuildingInfo.InstantBorderRadius');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  2, 0, 'InstantBorderPlots'                 , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_PlotsYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  1, 0, 'ReligiousPressureModifier'          , 'CEP_BuildingInfo.ReligiousPressureModifier');


-- Abilities --

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (2,  2, 0, 'SpecialistType'                     , 'CEP_BuildingInfo.SpecialistType');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (2,  1, 0, 'GreatGeneralRateChange'             , 'CEP_BuildingInfo.GreatGeneralRateChange');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (2,  1, 0, 'GreatPeopleRateModifier'            , 'CEP_BuildingInfo.GreatPeopleRateModifier');

-- Yields --
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 23, 0, 'YieldPerPop'                        , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_YieldChangesPerPop)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 22, 1, 'YieldInstant'                       , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 21, 1, 'YieldChange'                        , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 20, 0, 'YieldFromPlots'                     , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_PlotYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 19, 0, 'YieldFromSea'                       , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_SeaPlotYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 18, 0, 'YieldFromLakes'                     , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_LakePlotYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 17, 0, 'YieldFromTerrain'                   , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_TerrainYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 16, 0, 'YieldFromRivers'                    , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_RiverPlotYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 15, 0, 'YieldFromFeatures'                  , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_FeatureYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 14, 0, 'YieldFromResources'                 , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_ResourceYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 13, 0, 'YieldFromSpecialists'               , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_SpecialistYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 12, 0, 'YieldFromTech'                      , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_TechEnhancedYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 11, 0, 'YieldFromBuildings'                 , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_BuildingClassYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 10, 1, 'YieldMod'                           , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  9, 0, 'YieldModFromBuildings'              , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_BuildingClassYieldModifiers)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  8, 0, 'YieldModMilitary'                   , 'CEP_BuildingInfo.MilitaryProductionModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  7, 0, 'YieldModDomain'                     , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_DomainProductionModifiers)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  6, 0, 'YieldModCombat'                     , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_UnitCombatProductionModifiers)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  5, 0, 'YieldModBuilding'                   , 'CEP_BuildingInfo.BuildingProductionModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  4, 0, 'YieldModWonder'                     , 'CEP_BuildingInfo.WonderProductionModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  3, 0, 'YieldModSpace'                      , 'CEP_BuildingInfo.SpaceProductionModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  2, 0, 'YieldModSurplus'                    , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_YieldSurplusModifiers)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  1, 0, 'YieldStorage'                       , 'CEP_BuildingInfo.FoodKept');

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (4,  1, 1, 'Replaces'                           , 'Game.GetDefaultBuildingFieldText');


-- Requirements --

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 30, 1, 'Cost'                               , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 29, 1, 'NumCityCostMod'                     , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 28, 1, 'PopCostMod'                         , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 27, 1, 'HurryCostModifier'                  , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 26, 1, 'GoldMaintenance'                    , 'Game.GetDefaultBuildingFieldText');

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 25, 0, 'NotFeature'                         , 'CEP_BuildingInfo.NotFeature');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 24, 0, 'NearbyTerrainRequired'              , 'CEP_BuildingInfo.NearbyTerrainRequired');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 23, 0, 'Water'                              , 'CEP_BuildingInfo.Water');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 22, 0, 'River'                              , 'CEP_BuildingInfo.River');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 21, 0, 'FreshWater'                         , 'CEP_BuildingInfo.FreshWater and (CEP_BuildingInfo.BuildingClass ~= "BUILDINGCLASS_GARDEN")');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 20, 0, 'Mountain'                           , 'CEP_BuildingInfo.Mountain');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 19, 0, 'NearbyMountainRequired'             , 'CEP_BuildingInfo.NearbyMountainRequired');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 18, 0, 'Hill'                               , 'CEP_BuildingInfo.Hill');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 17, 0, 'Flat'                               , 'CEP_BuildingInfo.Flat');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 16, 0, 'HolyCity'                           , 'CEP_BuildingInfo.HolyCity');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 15, 0, 'RequiresTech'                       , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_TechAndPrereqs)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 14, 0, 'RequiresBuilding'                   , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_ClassesNeededInCity) and not CEP_BuildingInfo.OnlyAI');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 13, 0, 'RequiresBuildingInCities'           , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_PrereqBuildingClasses)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 12, 0, 'RequiresBuildingInPercentCities'    , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_PrereqBuildingClassesPercentage)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 11, 0, 'RequiresNearAll'                    , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_LocalResourceAnds)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 10, 0, 'RequiresNearAny'                    , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_LocalResourceOrs)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  9, 0, 'RequiresResourceConsumption'        , 'Game.HasValue({BuildingType=CEP_BuildingInfo.Type}, GameInfo.Building_ResourceQuantityRequirements)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  1, 0, 'UnlockedByBelief'                   , 'CEP_BuildingInfo.UnlockedByBelief');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  8, 0, 'ObsoleteTech'                       , 'CEP_BuildingInfo.ObsoleteTech and Locale.ConvertTextKey(GameInfo.Technologies[CEP_BuildingInfo.ObsoleteTech].Description)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  7, 1, 'AlreadyBuilt'                       , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  6, 0, 'MinAreaSize'                        , '(CEP_BuildingInfo.MinAreaSize ~= -1) and CEP_BuildingInfo.MinAreaSize');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  5, 0, 'CitiesPrereq'                       , 'CEP_BuildingInfo.CitiesPrereq');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  4, 0, 'LevelPrereq'                        , 'CEP_BuildingInfo.LevelPrereq');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  3, 0, 'NationalLimit'                      , 'CEP_BuildingClassInfo.MaxPlayerInstances');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  2, 0, 'TeamLimit'                          , 'CEP_BuildingClassInfo.MaxTeamInstances');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  1, 0, 'WorldLimit'                         , 'CEP_BuildingClassInfo.MaxGlobalInstances');
