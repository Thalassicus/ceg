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

--include("SaveUtils.lua")
MY_MOD_NAME = "Communitas"

MapModData.Cep = MapModData.Cep or {}
saveDB = saveDB or Modding.OpenSaveData()

Cep = Cep or {}
for row in GameInfo.Cep() do
	Cep[row.Type] = row.Value
end

include("MT_LuaEvents.lua")