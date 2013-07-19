-- 


CREATE TABLE IF NOT EXISTS CEP(Type text NOT NULL UNIQUE, Value);
INSERT INTO CEP (Type, Value) VALUES ('SkipFile', 1);

CREATE TABLE IF NOT EXISTS LoadedFile(Type text, Value);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_AI_LeaderPersonalities.sql'	, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_AI_LeaderFlavors.sql'			, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_AI__Start.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_AI__End_Flavors.sql'			, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_AI__End_Techs.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_A__End.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_A__Start.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_B_End.sql'						, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_C__End.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_C__Start.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_P_End.sql'						, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_A_PromotionReplace.sql'		, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_R_End.sql'						, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_R_Start.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_T_Start.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_Options.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('MT_Start.sql'						, 0);

INSERT INTO LoadedFile(Type, Value) VALUES ('AI.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Armies.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Barbarians.sql'			, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Cities.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CSD.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Diplomacy.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Faith.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('GreatWorks.sql'			, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Leaders.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Opportunities.sql'			, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Policies.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Research.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Terrain.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Language_End.sql'			, 0);