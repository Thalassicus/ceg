-- ModTools.lua
-- Author: Thalassicus
-- DateCreated: 2/6/2011 5:17:42 AM
--------------------------------------------------------------

if Game == nil or IncludedModTools then
	return
end

IncludedModTools = true

--print("INFO   Loading ModTools.lua")
--
-- Function Definitions
--

include("SaveUtils.lua")
MY_MOD_NAME = "CEP_VEM"

MapModData.CEP = MapModData.CEP or {}
saveDB = saveDB or Modding.OpenSaveData()

CEP = CEP or {}
for row in GameInfo.CEP() do
	CEP[row.Type] = row.Value
end

include("MT_LuaEvents.lua")