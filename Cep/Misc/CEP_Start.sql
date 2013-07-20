-- 


CREATE TABLE IF NOT EXISTS Cep(Type text NOT NULL UNIQUE, Value);

CREATE TABLE IF NOT EXISTS LoadedFile(Type text, Value);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEAI_LeaderPersonalities.sql'	, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEAI_LeaderFlavors.sql'		, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEAI__Start.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEAI_yEnd.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEAI_zTechs.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEA_End.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEA_Start.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEB_End.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEC_End.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEC_Start.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEF_Start.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEF_End.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_Start.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEP_End.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CEA_PromotionReplace.sql'		, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CER_End.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CER_Start.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CET_Start.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('MT_Start.sql'					, 0);

INSERT INTO LoadedFile(Type, Value) VALUES ('AI.sql'						, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Armies.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Barbarians.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Cities.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('CSD.sql'						, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Diplomacy.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Faith.sql'						, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('GreatWorks.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Leaders.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Opportunities.sql'				, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Policies.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Research.sql'					, 0);
INSERT INTO LoadedFile(Type, Value) VALUES ('Terrain.sql'					, 0);

UPDATE LoadedFile SET Value=1 WHERE Type='CEP_Start.sql';