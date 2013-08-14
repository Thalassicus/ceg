-- CiVUP_Core
-- Author: Thalassicus
-- DateCreated: 12/21/2010 10:00:43 AM
--------------------------------------------------------------

--print("INFO   Loading CiVUP_Core.lua")

if GameInfo.Units[1].PopCostMod == nil then
	print("FATAL  'CiVUP_Start.sql' did not load!")
end

include("YieldLibrary.lua")

--print("INFO   Done    CiVUP_Core.lua")