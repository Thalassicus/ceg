-- MT_Initialize
-- Author: Thalassicus
-- DateCreated: 3/17/2012 1:19:27 PM
--------------------------------------------------------------

include("ModTools.lua")

LoadedFile = LoadedFile or {}
for row in GameInfo.LoadedFile() do
	LoadedFile[row.Type] = row.Value
	if row.Value ~= 1 then
		print("ERROR: Failed to load " .. row.Type)
	end
end

<<<<<<< HEAD
--if not MapModData.Cep.MT_Initialized then
	MapModData.Cep.MT_Initialized = true
	--print("MapModData.Cep.MT_Initialized")

	LuaEvents.MT_Initialize()
	Game.CepLoadGame()
=======
--if not MapModData.CEP.MT_Initialized then
	MapModData.CEP.MT_Initialized = true
	--print("MapModData.CEP.MT_Initialized")

	LuaEvents.MT_Initialize()
	Game.CEPLoadGame()
>>>>>>> 0dc0d6f95426d71b8eec1a4e9f3bb3c43177512b
	
	Events.ActivePlayerTurnStart			.Add(OnTurnStart)
	Events.ActivePlayerTurnEnd				.Add(OnTurnEnd)

	Events.SerialEventUnitCreated			.Add(OnNewUnit)
	Events.SerialEventCityCreated			.Add(OnNewCity)
	GameEvents.TeamTechResearched			.Add(OnNewTech)
	
	Events.SerialEventCityCaptured			.Add(FixGameCoreCaptureBug)
	Events.SerialEventCityCaptured			.Add(OnCityDestroyed)
	Events.SerialEventCityDestroyed			.Add(OnCityDestroyed)
	Events.SerialEventHexCultureChanged		.Add(OnHexCultureChanged)
	LuaEvents.NewCity						.Add(UpdateTurnAcquiredFounding)
	LuaEvents.BuildingConstructed			.Add(OnBuildingConstructed)
	LuaEvents.BuildingDestroyed				.Add(OnBuildingDestroyed)

	LuaEvents.ActivePlayerTurnStart_Plot	.Add(LuaEvents.CheckPlotBuildingsStatus)
	LuaEvents.ActivePlayerTurnEnd_Plot		.Add(LuaEvents.CheckPlotBuildingsStatus)
	LuaEvents.ActivePlayerTurnStart_Turn	.Add(LuaEvents.CheckActiveBuildingStatus)
	LuaEvents.ActivePlayerTurnEnd_Turn		.Add(LuaEvents.CheckActiveBuildingStatus)
	LuaEvents.ActivePlayerTurnEnd_Unit		.Add(RemoveNewUnitFlag)

	Events.EndCombatSim						.Add(CheckCombatLevelup)
	
	Events.SerialEventImprovementCreated	.Add(OnNewImprovement)
	Events.SerialEventImprovementCreated	.Add(OnPlotChanged)
	Events.SerialEventRoadCreated			.Add(OnPlotChanged)

<<<<<<< HEAD
	Events.LoadScreenClose					.Add(function() MapModData.Cep.Initialized = true end)
=======
	Events.LoadScreenClose					.Add(function() MapModData.CEP.Initialized = true end)
>>>>>>> 0dc0d6f95426d71b8eec1a4e9f3bb3c43177512b
--end