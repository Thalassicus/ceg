--

--
-- Alter Tables
--

CREATE TABLE IF NOT EXISTS
	Policy_FreePromotionUnitClasses (
	PolicyType		text REFERENCES Policies(Type),
	UnitClass		text REFERENCES UnitClasses(Type),
	PromotionType	text REFERENCES UnitPromotions(Type)
);
	
CREATE TABLE IF NOT EXISTS
	Policy_FreeBuildingFlavor (
	PolicyType		text REFERENCES Policies(Type),
	FlavorType		text,
	NumCities		integer default 0
);
	
CREATE TABLE IF NOT EXISTS
	Policy_FreeBuildingClass (
	PolicyType		text REFERENCES Policies(Type),
	BuildingClass	text REFERENCES BuildingClasses(Type),
	NumCities		integer default 0
);
	
CREATE TABLE IF NOT EXISTS
	Policy_FreeUnitFlavor (
	PolicyType		text REFERENCES Policies(Type),
	FlavorType		text,
	Count			integer default 0
);
	
CREATE TABLE IF NOT EXISTS
	Policy_InstantYield (
	PolicyType		text REFERENCES Policies(Type),
	YieldType		text,
	Yield			integer NOT NULL 
);
	
CREATE TABLE IF NOT EXISTS
	Policy_InstantYieldEra (
	PolicyType		text REFERENCES Policies(Type),
	YieldType		text,
	Yield			integer NOT NULL 
);
	
CREATE TABLE IF NOT EXISTS
	Policy_InstantYieldTurns (
	PolicyType		text REFERENCES Policies(Type),
	YieldType		text,
	Turns			integer NOT NULL 
);
	
CREATE TABLE IF NOT EXISTS
	Policy_PlayerYieldModifiers (
	PolicyType		text REFERENCES Policies(Type),
	YieldType		text,
	YieldMod		integer NOT NULL 
);
	
CREATE TABLE IF NOT EXISTS
	Policy_CityWithSpecialistYieldChanges (
	PolicyType		text REFERENCES Policies(Type),
	SpecialistType	text REFERENCES Specialists(Type),
	SpecialistCount	integer default 1,
	YieldType		text REFERENCES Yields(Type),
	Yield			integer NOT NULL 
);
	
CREATE TABLE IF NOT EXISTS
	Policy_SpecialistYieldChanges (
	PolicyType		text REFERENCES Policies(Type),
	SpecialistType	text REFERENCES Specialists(Type),
	YieldType		text REFERENCES Yields(Type),
	Yield			integer NOT NULL 
);
	
CREATE TABLE IF NOT EXISTS
	Policy_ReligiousCityYieldChanges (
	PolicyType		text REFERENCES Policies(Type),
	YieldType		text REFERENCES Yields(Type),
	Yield			integer NOT NULL 
);
	
CREATE TABLE IF NOT EXISTS
	Policy_UnitClassProductionModifiers (
	PolicyType			text REFERENCES Policies(Type),
	UnitClassType		text REFERENCES UnitClasses(Type),
	ProductionModifier	integer
);

ALTER TABLE Policies		ADD BorderObstacle						boolean;
ALTER TABLE Policies		ADD GoldFromKillsCostBased				variant default 0;
ALTER TABLE Policies		ADD ExtraSpies							integer default 0;
ALTER TABLE Policies		ADD MilitaristicCSExperience			integer default 0;
ALTER TABLE Policies		ADD GarrisonedExperience				variant default 0;
ALTER TABLE Policies		ADD CityCaptureCulture					integer default 0;
ALTER TABLE Policies		ADD CityCaptureCulturePerPop			integer default 0;
ALTER TABLE Policies		ADD CityCaptureCulturePerEra			integer default 0;
ALTER TABLE Policies		ADD CityCaptureCulturePerEraExponent	variant default 1;
ALTER TABLE Policies		ADD MinorInfluence						integer default 0;
ALTER TABLE Policies		ADD MinorGreatPeopleRate				integer default 0;
ALTER TABLE Policies		ADD GlobalExperience					integer default 0;
ALTER TABLE Policies		ADD OpenBordersGoldModifier				integer default 0;
ALTER TABLE Policies		ADD FirstSpecialistYieldChange			integer default 0;
ALTER TABLE Policies		ADD CityResistTimeMod					integer default 0;
ALTER TABLE Policies		ADD CitystateCaptureYieldTurns			integer default 0;


--
-- Culture Scaling
--

UPDATE Traits	SET CultureFromKills = 1.5 * CultureFromKills;
UPDATE Traits	SET CityCultureBonus = 1 * CityCultureBonus;
UPDATE Eras		SET StartingCulture = 1 * StartingCulture;

UPDATE Improvement_Yields
SET Yield = 2
WHERE YieldType = 'YIELD_CULTURE' AND ImprovementType = 'IMPROVEMENT_MOAI';

UPDATE Improvements
SET CultureAdjacentSameType = 1 * CultureAdjacentSameType;

UPDATE Policies
SET CulturePerGarrisonedUnit = 1 * CulturePerGarrisonedUnit;
