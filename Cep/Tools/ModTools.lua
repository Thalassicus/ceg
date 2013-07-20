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

<<<<<<< HEAD
--include("SaveUtils.lua")
MY_MOD_NAME = "Communitas"

MapModData.Cep = MapModData.Cep or {}
saveDB = saveDB or Modding.OpenSaveData()

Cep = Cep or {}
for row in GameInfo.Cep() do
	Cep[row.Type] = row.Value
=======
include("SaveUtils.lua")
MY_MOD_NAME = "CEP_VEM"

MapModData.CEP = MapModData.CEP or {}
saveDB = saveDB or Modding.OpenSaveData()

CEP = CEP or {}
for row in GameInfo.CEP() do
	CEP[row.Type] = row.Value
>>>>>>> 0dc0d6f95426d71b8eec1a4e9f3bb3c43177512b
end

include("MT_LuaEvents.lua")