--

CREATE TABLE IF NOT EXISTS
	Personalities (
	Type			text
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
