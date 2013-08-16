-- This TW_BuildingStats.sql data created by:
-- BuildingStats tab of CEP_ArmiesCities.xls spreadsheet (in mod folder).

-- Header --

INSERT INTO BuildingFields(ID, Section, Priority, Dynamic, Type, Value) VALUES (0, 0,  1, 1, 'Name'                        , 'Game.GetDefaultBuildingFieldText');


-- Special Abilities --

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 84, 0, 'Capital'                            , 'Cep_BuildingInfo.Capital');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 83, 0, 'GoldenAge'                          , 'Cep_BuildingInfo.GoldenAge');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 82, 0, 'FreeGreatPeople'                    , 'Cep_BuildingInfo.FreeGreatPeople');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 81, 0, 'FreeUnits'                          , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_FreeUnits)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 80, 0, 'FreeBuildingThisCity'               , 'Cep_BuildingInfo.FreeBuildingThisCity');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 79, 0, 'FreeBuilding'                       , 'Cep_BuildingInfo.FreeBuilding');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 78, 0, 'FreeResources'                      , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_ResourceQuantity)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 77, 0, 'TrainedFreePromotion'               , 'Cep_BuildingInfo.TrainedFreePromotion and Locale.ConvertTextKey(GameInfo.UnitPromotions[Cep_BuildingInfo.TrainedFreePromotion].Help) or false');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 76, 0, 'MapCentering'                       , 'Cep_BuildingInfo.MapCentering');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 75, 0, 'AllowsWaterRoutes'                  , 'Cep_BuildingInfo.AllowsWaterRoutes');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 74, 0, 'ExtraLuxuries'                      , 'Cep_BuildingInfo.ExtraLuxuries');

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 73, 0, 'DiplomaticVoting'                   , 'Cep_BuildingInfo.DiplomaticVoting');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 72, 0, 'GreatGeneralRateModifier'           , 'Cep_BuildingInfo.GreatGeneralRateModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 71, 0, 'GoldenAgeModifier'                  , 'Cep_BuildingInfo.GoldenAgeModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 70, 0, 'UnitUpgradeCostMod'                 , 'Cep_BuildingInfo.UnitUpgradeCostMod');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 69, 0, 'CityCountUnhappinessMod'            , 'Cep_BuildingInfo.CityCountUnhappinessMod');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 68, 0, 'WorkerSpeedModifier'                , 'Cep_BuildingInfo.WorkerSpeedModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 67, 0, 'CapturePlunderModifier'             , 'Cep_BuildingInfo.CapturePlunderModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 66, 0, 'PolicyCostModifier'                 , 'Cep_BuildingInfo.PolicyCostModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 65, 0, 'GlobalInstantBorderRadius'          , 'Cep_BuildingInfo.GlobalInstantBorderRadius');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 64, 0, 'PlotCultureCostModifier'            , 'Cep_BuildingInfo.PlotCultureCostModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 63, 0, 'PlotBuyCostModifier'                , 'Cep_BuildingInfo.PlotBuyCostModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 62, 0, 'GlobalPlotCultureCostModifier'      , 'Cep_BuildingInfo.GlobalPlotCultureCostModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 61, 0, 'GlobalPlotBuyCostModifier'          , 'Cep_BuildingInfo.GlobalPlotBuyCostModifier');

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 60, 0, 'FoundsReligion'                     , 'Cep_BuildingInfo.FoundsReligion');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 59, 0, 'IsReligious'                        , 'Cep_BuildingInfo.IsReligious');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 58, 0, 'Airlift'                            , 'Cep_BuildingInfo.Airlift');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 57, 0, 'NukeExplosionRand'                  , 'Cep_BuildingInfo.NukeExplosionRand');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 56, 0, 'ExtraMissionarySpreads'             , 'Cep_BuildingInfo.ExtraMissionarySpreads');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 55, 0, 'EspionageModifier'                  , 'Cep_BuildingInfo.EspionageModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 54, 0, 'GlobalEspionageModifier'            , 'Cep_BuildingInfo.GlobalEspionageModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 53, 0, 'ExtraSpies'                         , 'Cep_BuildingInfo.ExtraSpies');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 52, 0, 'SpyRankChange'                      , 'Cep_BuildingInfo.SpyRankChange');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 51, 0, 'InstantSpyRankChange'               , 'Cep_BuildingInfo.InstantSpyRankChange');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 50, 0, 'ProhibitedCityTerrain'              , 'Cep_BuildingInfo.ProhibitedCityTerrain');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 49, 0, 'ReplacementBuildingClass'           , 'Cep_BuildingInfo.ReplacementBuildingClass');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 48, 0, 'SpecialistExtraCulture'             , 'Cep_BuildingInfo.SpecialistExtraCulture		');

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 47, 0, 'GlobalPopulationChange'             , 'Cep_BuildingInfo.GlobalPopulationChange');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 46, 0, 'TechShare'                          , 'Cep_BuildingInfo.TechShare');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 45, 0, 'FreeTechs'                          , 'Cep_BuildingInfo.FreeTechs');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 44, 0, 'FreePolicies'                       , 'Cep_BuildingInfo.FreePolicies');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 43, 0, 'MinorFriendshipChange'              , 'Cep_BuildingInfo.MinorFriendshipChange');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 42, 0, 'MinorFriendshipFlatChange'          , 'Cep_BuildingInfo.MinorFriendshipFlatChange');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 41, 0, 'VictoryPoints'                      , 'Cep_BuildingInfo.VictoryPoints');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 40, 0, 'BorderObstacle'                     , 'Cep_BuildingInfo.BorderObstacle');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 39, 0, 'PlayerBorderObstacle'               , 'Cep_BuildingInfo.PlayerBorderObstacle');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 38, 0, 'HealRateChange'                     , 'Cep_BuildingInfo.HealRateChange');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 37, 0, 'MountainImprovement'                , 'Cep_BuildingInfo.MountainImprovement and Locale.ConvertTextKey(GameInfo.Improvements[Cep_BuildingInfo.MountainImprovement].Description) or false');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 36, 0, 'FreePromotion'                      , 'Cep_BuildingInfo.FreePromotion and Locale.ConvertTextKey(GameInfo.UnitPromotions[Cep_BuildingInfo.FreePromotion].Help) or false');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 35, 0, 'FreePromotionAllCombatUnits'        , 'Cep_BuildingInfo.FreePromotionAllCombatUnits and Locale.ConvertTextKey(GameInfo.UnitPromotions[Cep_BuildingInfo.FreePromotionAllCombatUnits].Help) or false');

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 34, 0, 'TradeDealModifier'                  , 'Cep_BuildingInfo.TradeDealModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 33, 0, 'GlobalGreatPeopleRateModifier'      , 'Cep_BuildingInfo.GlobalGreatPeopleRateModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 32, 1, 'UnmoddedHappiness'                  , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 31, 1, 'Happiness'                          , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 30, 0, 'HappinessPerCity'                   , 'Cep_BuildingInfo.HappinessPerCity');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 29, 0, 'HappinessPerXPolicies'              , 'Cep_BuildingInfo.HappinessPerXPolicies');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 28, 0, 'UnhappinessModifier'                , 'Cep_BuildingInfo.UnhappinessModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 27, 0, 'NoOccupiedUnhappiness'              , 'Cep_BuildingInfo.NoOccupiedUnhappiness');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 26, 0, 'InstantHappiness'                   , 'Cep_BuildingInfo.InstantHappiness');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 25, 0, 'GoldenAgePoints'                    , 'Cep_BuildingInfo.GoldenAgePoints');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 24, 0, 'Experience'                         , 'Cep_BuildingInfo.Experience');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 23, 0, 'ExperienceDomain'                   , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_DomainFreeExperiences)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 22, 0, 'ExperienceCombat'                   , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_UnitCombatFreeExperiences)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 21, 0, 'ExperiencePerTurn'                  , 'Cep_BuildingInfo.ExperiencePerTurn		');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 20, 0, 'GlobalExperience'                   , 'Cep_BuildingInfo.GlobalExperience');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 19, 0, 'Defense'                            , 'Cep_BuildingInfo.Defense / 100');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 18, 0, 'GlobalDefenseMod'                   , 'Cep_BuildingInfo.GlobalDefenseMod');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 17, 0, 'ExtraCityHitPoints'                 , 'Cep_BuildingInfo.ExtraCityHitPoints');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 16, 0, 'AirModifier'                        , 'Cep_BuildingInfo.AirModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 15, 0, 'NukeModifier'                       , 'Cep_BuildingInfo.NukeModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 14, 0, 'YieldModInAllCities'                , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_GlobalYieldModifiers)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 13, 0, 'YieldFromUsingGreatPeople'          , 'Cep_BuildingInfo.GreatPersonExpendGold');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 12, 0, 'YieldModHurry'                      , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_HurryModifiers)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 11, 0, 'CityConnectionTradeRouteModifier'   , 'Cep_BuildingInfo.CityConnectionTradeRouteModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1, 10, 0, 'MedianTechPercentChange'            , 'Cep_BuildingInfo.MedianTechPercentChange * 2');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  9, 0, 'InstantBorderRadius'                , 'Cep_BuildingInfo.InstantBorderRadius');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  8, 0, 'InstantBorderPlots'                 , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_PlotsYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  7, 0, 'ReligiousPressureModifier'          , 'Cep_BuildingInfo.ReligiousPressureModifier');

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  6, 0, 'NullifyInfluenceModifier'           , 'Cep_BuildingInfo.NullifyInfluenceModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  5, 0, 'LeagueCost'                         , 'Cep_BuildingInfo.LeagueCost');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  4, 0, 'UnlockedByLeague'                   , 'Cep_BuildingInfo.UnlockedByLeague');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  3, 0, 'InstantMilitaryIncrease'            , 'Cep_BuildingInfo.InstantMilitaryIncrease');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  2, 0, 'XBuiltTriggersIdeologyChoice'       , 'Cep_BuildingInfo.XBuiltTriggersIdeologyChoice');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (1,  1, 0, 'GreatScientistBeakerModifier'       , 'Cep_BuildingInfo.GreatScientistBeakerModifier');

-- Abilities --

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (2,  2, 0, 'SpecialistType'                     , 'Cep_BuildingInfo.SpecialistType');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (2,  1, 0, 'GreatGeneralRateChange'             , 'Cep_BuildingInfo.GreatGeneralRateChange');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (2,  1, 0, 'GreatPeopleRateModifier'            , 'Cep_BuildingInfo.GreatPeopleRateModifier');

-- Yields --
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 28, 0, 'YieldPerPop'                        , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_YieldChangesPerPop)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 27, 1, 'YieldInstant'                       , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 26, 1, 'YieldChange'                        , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 25, 0, 'YieldFromPlots'                     , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_PlotYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 24, 0, 'YieldFromSea'                       , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_SeaPlotYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 23, 0, 'YieldFromLakes'                     , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_LakePlotYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 22, 0, 'YieldFromTerrain'                   , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_TerrainYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 21, 0, 'YieldFromRivers'                    , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_RiverPlotYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 20, 0, 'YieldFromFeatures'                  , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_FeatureYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 19, 0, 'YieldFromResources'                 , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_ResourceYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 18, 0, 'YieldFromSpecialists'               , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_SpecialistYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 17, 0, 'YieldFromTech'                      , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_TechEnhancedYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 16, 0, 'YieldFromReligion'                  , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_YieldChangesPerReligion)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 15, 0, 'YieldFromBuildings'                 , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_BuildingClassYieldChanges)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 14, 0, 'TradeRouteLandGoldBonus'            , 'Cep_BuildingInfo.TradeRouteLandGoldBonus / 100');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 13, 0, 'TradeRouteSeaGoldBonus'             , 'Cep_BuildingInfo.TradeRouteSeaGoldBonus / 100');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 12, 1, 'YieldMod'                           , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 11, 0, 'YieldModFromBuildings'              , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_BuildingClassYieldModifiers)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3, 10, 0, 'YieldModMilitary'                   , 'Cep_BuildingInfo.MilitaryProductionModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  9, 0, 'YieldModDomain'                     , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_DomainProductionModifiers)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  8, 0, 'YieldModCombat'                     , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_UnitCombatProductionModifiers)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  7, 0, 'YieldModBuilding'                   , 'Cep_BuildingInfo.BuildingProductionModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  6, 0, 'YieldModWonder'                     , 'Cep_BuildingInfo.WonderProductionModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  5, 0, 'YieldModSpace'                      , 'Cep_BuildingInfo.SpaceProductionModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  4, 0, 'YieldModSurplus'                    , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_YieldSurplusModifiers)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  3, 0, 'YieldStorage'                       , 'Cep_BuildingInfo.FoodKept');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  2, 0, 'AllowsFoodTradeRoutes'              , 'Cep_BuildingInfo.AllowsFoodTradeRoutes');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (3,  1, 0, 'AllowsProductionTradeRoutes'        , 'Cep_BuildingInfo.AllowsProductionTradeRoutes');

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (4, 13, 0, 'TradeRouteLandDistanceModifier'     , 'Cep_BuildingInfo.TradeRouteLandDistanceModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (4, 12, 0, 'TradeRouteSeaDistanceModifier'      , 'Cep_BuildingInfo.TradeRouteSeaDistanceModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (4, 11, 0, 'TradeRouteRecipientBonus'           , 'Cep_BuildingInfo.TradeRouteRecipientBonus');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (4, 10, 0, 'TradeRouteTargetBonus'              , 'Cep_BuildingInfo.TradeRouteTargetBonus');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (4,  9, 0, 'NumTradeRouteBonus'                 , 'Cep_BuildingInfo.NumTradeRouteBonus');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (4,  8, 0, 'GreatWorkSlotType'                  , 'Cep_BuildingInfo.GreatWorkSlotType');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (4,  7, 0, 'GreatWorksTourismModifier'          , 'Cep_BuildingInfo.GreatWorksTourismModifier');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (4,  6, 0, 'FreeGreatWork'                      , 'Cep_BuildingInfo.FreeGreatWork');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (4,  5, 0, 'ExperiencePerGreatWork'             , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_DomainFreeExperiencePerGreatWork)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (4,  4, 0, 'TechEnhancedTourism'                , 'Cep_BuildingInfo.TechEnhancedTourism');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (4,  3, 0, 'LandmarksTourismPercent'            , 'Cep_BuildingInfo.LandmarksTourismPercent');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (4,  2, 0, 'ThemingBonusHelp'                   , 'Cep_BuildingInfo.ThemingBonusHelp');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (4,  1, 1, 'Replaces'                           , 'Game.GetDefaultBuildingFieldText');


-- Requirements --

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 29, 1, 'Cost'                               , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 28, 1, 'NumCityCostMod'                     , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 27, 1, 'PopCostMod'                         , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 26, 1, 'HurryCostModifier'                  , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 25, 1, 'GoldMaintenance'                    , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 24, 0, 'UnlockedByBelief'                   , 'Cep_BuildingInfo.UnlockedByBelief');

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 26, 0, 'NationalLimit'                      , 'Cep_BuildingClassInfo.MaxPlayerInstances');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 25, 0, 'TeamLimit'                          , 'Cep_BuildingClassInfo.MaxTeamInstances');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 24, 0, 'WorldLimit'                         , 'Cep_BuildingClassInfo.MaxGlobalInstances');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 23, 0, 'NotFeature'                         , 'Cep_BuildingInfo.NotFeature');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 22, 0, 'NearbyTerrainRequired'              , 'Cep_BuildingInfo.NearbyTerrainRequired');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 21, 0, 'Water'                              , 'Cep_BuildingInfo.Water');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 20, 0, 'River'                              , 'Cep_BuildingInfo.River');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 19, 0, 'FreshWater'                         , 'Cep_BuildingInfo.FreshWater and (Cep_BuildingInfo.BuildingClass ~= "BUILDINGCLASS_GARDEN")');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 18, 0, 'Mountain'                           , 'Cep_BuildingInfo.Mountain');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 17, 0, 'NearbyMountainRequired'             , 'Cep_BuildingInfo.NearbyMountainRequired');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 16, 0, 'Hill'                               , 'Cep_BuildingInfo.Hill');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 15, 0, 'Flat'                               , 'Cep_BuildingInfo.Flat');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 14, 0, 'HolyCity'                           , 'Cep_BuildingInfo.HolyCity');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 13, 0, 'RequiresTech'                       , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_TechAndPrereqs)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 12, 0, 'RequiresBuilding'                   , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_ClassesNeededInCity) and not Cep_BuildingInfo.OnlyAI');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 11, 0, 'RequiresBuildingInCities'           , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_PrereqBuildingClasses)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5, 10, 0, 'RequiresBuildingInPercentCities'    , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_PrereqBuildingClassesPercentage)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  9, 0, 'RequiresNearAll'                    , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_LocalResourceAnds)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  8, 0, 'RequiresNearAny'                    , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_LocalResourceOrs)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  7, 0, 'RequiresResourceConsumption'        , 'Game.HasValue({BuildingType=Cep_BuildingInfo.Type}, GameInfo.Building_ResourceQuantityRequirements)');

INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  6, 0, 'ObsoleteTech'                       , 'Cep_BuildingInfo.ObsoleteTech and Locale.ConvertTextKey(GameInfo.Technologies[Cep_BuildingInfo.ObsoleteTech].Description)');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  5, 1, 'AlreadyBuilt'                       , 'Game.GetDefaultBuildingFieldText');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  4, 0, 'MinAreaSize'                        , '(Cep_BuildingInfo.MinAreaSize ~= -1) and Cep_BuildingInfo.MinAreaSize');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  3, 0, 'CitiesPrereq'                       , 'Cep_BuildingInfo.CitiesPrereq');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  2, 0, 'LevelPrereq'                        , 'Cep_BuildingInfo.LevelPrereq');
INSERT INTO BuildingFields(Section, Priority, Dynamic, Type, Value) VALUES (5,  1, 0, 'PolicyBranchType'                   , 'Cep_BuildingInfo.PolicyBranchType and Locale.ConvertTextKey(GameInfo.PolicyBranchTypes[Cep_BuildingInfo.PolicyBranchType].Description)');

UPDATE LoadedFile SET Value=1 WHERE Type='TW_BuildingStats.sql';
