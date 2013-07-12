--· Insert SQL Rules Here 

CREATE TABLE IF NOT EXISTS Civup_Language_EN_US (DateModified integer, Tag text, Text text, Gender text, Plurality text);
CREATE TABLE IF NOT EXISTS Civup_Language_DE_DE (DateModified integer, Tag text, Text text, Gender text, Plurality text);
CREATE TABLE IF NOT EXISTS Civup_Language_ES_ES (DateModified integer, Tag text, Text text, Gender text, Plurality text);
CREATE TABLE IF NOT EXISTS Civup_Language_FR_FR (DateModified integer, Tag text, Text text, Gender text, Plurality text);
CREATE TABLE IF NOT EXISTS Civup_Language_IT_IT (DateModified integer, Tag text, Text text, Gender text, Plurality text);
CREATE TABLE IF NOT EXISTS Civup_Language_JA_JP (DateModified integer, Tag text, Text text, Gender text, Plurality text);
CREATE TABLE IF NOT EXISTS Civup_Language_PL_PL (DateModified integer, Tag text, Text text, Gender text, Plurality text);
CREATE TABLE IF NOT EXISTS Civup_Language_RU_RU (DateModified integer, Tag text, Text text, Gender text, Plurality text);
CREATE TABLE IF NOT EXISTS Civup_Language_ZH_CN (DateModified integer, Tag text, Text text, Gender text, Plurality text);
CREATE TABLE IF NOT EXISTS Language_ZH_CN (ID integer PRIMARY KEY, Tag text, Text text, Gender text, Plurality text);

DELETE FROM Civup_Language_DE_DE;
DELETE FROM Civup_Language_EN_US;
DELETE FROM Civup_Language_ES_ES;
DELETE FROM Civup_Language_FR_FR;
DELETE FROM Civup_Language_IT_IT;
DELETE FROM Civup_Language_JA_JP;
DELETE FROM Civup_Language_PL_PL;
DELETE FROM Civup_Language_RU_RU;
DELETE FROM Civup_Language_ZH_CN;