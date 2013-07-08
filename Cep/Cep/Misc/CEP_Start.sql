-- 


CREATE TABLE IF NOT EXISTS Civup(Type text NOT NULL UNIQUE, Value);
CREATE TABLE IF NOT EXISTS LoadedFile(Type text, Value);

INSERT INTO LoadedFile(Type, Value) VALUES ('CAI_LeaderPersonalities.sql'	, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CAI_LeaderFlavors.sql'			, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CAI__Start.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CAI_yEnd.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CAI_zTechs.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CA_End.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CA_Start.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CB_End.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CC_End.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CC_Start.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('C_End.sql'						, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CA_PromotionReplace.sql'		, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CR_End.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CR_Start.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CT_Start.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_Options.sql'				, 0);

INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_AI.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_Armies.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_Barbarians.sql'			, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_Cities.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_CSD.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_Diplomacy.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_Faith.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_GreatWorks.sql'			, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_Leaders.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_Opportunities.sql'			, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_Policies.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_Research.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_Terrain.sql'				, 0);