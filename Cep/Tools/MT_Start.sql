--

--
-- Create Tables
--


CREATE TABLE IF NOT EXISTS
	Personalities (
	Type			text
);
	
CREATE TABLE IF NOT EXISTS
	Build_Flavors (
	BuildType		text REFERENCES Builds(Type),
	FlavorType		text REFERENCES Flavors(Type),
	Flavor			integer
);
	
CREATE TABLE IF NOT EXISTS
	Plots (
	ID				integer PRIMARY KEY,
	Type			text NOT NULL UNIQUE,
	Description		text,
	Civilopedia		text
);
	
CREATE TABLE IF NOT EXISTS
	Trait_FreePromotionUnitTypes (
	TraitType		text REFERENCES Traits(Type),
	UnitType		text REFERENCES Units(Type),
	PromotionType	text REFERENCES UnitPromotions(Type)
);
	
CREATE TABLE IF NOT EXISTS
	Trait_FreeExperience_Domains (
	TraitType		text REFERENCES Traits(Type),
	DomainType		text REFERENCES Domains(Type),
	Experience		integer default 0
);
	
CREATE TABLE IF NOT EXISTS
	Trait_FreeUnitAtTech (
	TraitType		text REFERENCES Traits(Type),
	TechType		text REFERENCES Technologies(Type),
	UnitClassType	text REFERENCES UnitClasses(Type)
);
	
CREATE TABLE IF NOT EXISTS
	Trait_GoldenAgeYieldModifier (
	TraitType		text REFERENCES Traits(Type),
	YieldType		text,
	YieldMod		integer default 0
);
	
CREATE TABLE IF NOT EXISTS
	Trait_LuxuryYieldModifier (
	TraitType		text REFERENCES Traits(Type),
	YieldType		text,
	YieldMod		integer default 0
);
	
CREATE TABLE IF NOT EXISTS
	Trait_YieldFromConstructionInCapital (
	TraitType		text REFERENCES Traits(Type),
	BuildingType	text REFERENCES Buildings(Type),
	YieldType		text,
	Yield			integer default 0,
	YieldMod		integer default 0
);
	
CREATE TABLE IF NOT EXISTS
	Trait_YieldFromConstruction (
	TraitType		text REFERENCES Traits(Type),
	BuildingType	text REFERENCES Buildings(Type),
	YieldType		text,
	Yield			integer default 0
);
	
CREATE TABLE IF NOT EXISTS
	Handicap_Yield (
	HandicapType	text REFERENCES HandicapInfos(Type),
	YieldType		text,
	Yield			integer default 0
);
	
	
	
	
	
CREATE TABLE IF NOT EXISTS
	Technology_DomainPromotion (
	TechType		text REFERENCES Technologies(Type),
	DomainType		text REFERENCES Domains(Type),
	PromotionType	text REFERENCES UnitPromotions(Type)
);
	
CREATE TABLE IF NOT EXISTS
	Technology_Flavors_Human (
	TechType		text REFERENCES Technologies(Type),
	FlavorType		text REFERENCES Flavors(Type),
	Flavor			integer
);





--
-- Add Table Columns
--


ALTER TABLE Eras			ADD TriggerRatePercent					integer default 0;

ALTER TABLE Flavors			ADD Description							text;
ALTER TABLE Flavors			ADD IconString							text;
ALTER TABLE Flavors			ADD PurchasePriority					variant default 0;

ALTER TABLE GameOptions		ADD Reverse								boolean;

ALTER TABLE HandicapInfos	ADD AIFreeXPPerEra						integer default 0;
ALTER TABLE HandicapInfos	ADD AIFreePromotion						text;
ALTER TABLE HandicapInfos	ADD AIResearchPercent					variant default 0;
ALTER TABLE HandicapInfos	ADD AIResearchPercentPerEra				variant default 0;
ALTER TABLE HandicapInfos	ADD AIProductionPercentPerEra			variant default 0;
ALTER TABLE HandicapInfos	ADD AIGold								integer default 0;
ALTER TABLE HandicapInfos	ADD AICapitalRevealRadius				integer default 0;
ALTER TABLE HandicapInfos	ADD AICapitalYieldPeaceful				integer default 0;
ALTER TABLE HandicapInfos	ADD AICapitalYieldMilitaristic			integer default 0;

ALTER TABLE HurryInfos		ADD YieldType							text REFERENCES Yields(Type);

ALTER TABLE Leaders			ADD Personality							text default 'PERSONALITY_COALITION';
ALTER TABLE Leaders			ADD AIBonus								boolean;

ALTER TABLE Traits			ADD LandBarbarianCapturePercent			integer default 0;
ALTER TABLE Traits			ADD MinorCivCaptureBonus				integer default 0;
ALTER TABLE Traits			ADD CityGoldPerLuxuryPercent			integer default 0;
ALTER TABLE Traits			ADD HappinessFromKills					integer default 0;
ALTER TABLE Traits			ADD MilitaristicCSFreePromotion			text;
ALTER TABLE Traits			ADD FreeShip							text;
ALTER TABLE Traits			ADD NoWarrior							boolean;
ALTER TABLE Traits			ADD NaturalWonderConstant				integer default 0;
ALTER TABLE Traits			ADD NaturalWonderMultiplier				integer default 0;
ALTER TABLE Traits			ADD NaturalWonderExponent				variant default 1;
ALTER TABLE Traits			ADD SeaBarbarianCapturePercent			integer default 0;
ALTER TABLE Traits			ADD OpenBordersGoldModifier				integer default 0;

ALTER TABLE Yields			ADD IsTileYield							boolean;
ALTER TABLE Yields			ADD TileTexture							text;
ALTER TABLE Yields			ADD GoldenAgeSurplusYieldMod			integer default 0;
ALTER TABLE Yields			ADD PlayerThreshold						integer default 0;
ALTER TABLE Yields			ADD YieldFriend							integer default 0;
ALTER TABLE Yields			ADD YieldAlly							integer default 0;
ALTER TABLE Yields			ADD MinPlayer							integer default 0;
ALTER TABLE Yields			ADD Color								text default 'COLOR_WHITE';

ALTER TABLE Units			ADD PopCostMod integer default 0;
ALTER TABLE Buildings		ADD PopCostMod integer default 0;
ALTER TABLE Projects		ADD PopCostMod integer default 0;

ALTER TABLE Units			ADD ListPriority integer default -1;
ALTER TABLE Domains			ADD ListPriority integer default -1;
ALTER TABLE Buildings		ADD ListPriority integer default -1;
ALTER TABLE Projects		ADD ListPriority integer default -1;
ALTER TABLE Processes		ADD ListPriority integer default -1;
ALTER TABLE Flavors			ADD ListPriority integer default -1;
ALTER TABLE Yields			ADD ListPriority integer default -1;
ALTER TABLE Specialists		ADD ListPriority integer default -1;




--
-- Done
--
UPDATE LoadedFile SET Value=1 WHERE Type='MT_Start.sql';