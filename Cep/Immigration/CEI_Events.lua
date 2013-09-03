--------------------------------------------------------------
-- Immigration Mod
-- Author: killmeplease
-- DateCreated: 10/4/2010 6:23:59 PM
--------------------------------------------------------------

include("MT_Events.lua")

local log = Events.LuaLogger:New()
log:SetLevel("WARN")

--[[

Credits:
killmeplease	- original Emigration mod
Afforess		- save/load procedure
Thalassicus		- expansion and polishing

--]]

--
-- Globals
--

DebugMode = GameInfo.Immigration["Debug"].Value == 1
QUEUE_CAPACITY = GameInfo.Immigration["HappinessAverageTurns"].Value * GameInfo.GameSpeeds[PreGame.GetGameSpeed()].GrowthPercent / 100
iProbCityImmigration = {}
AverageHappiness = {}
HappinessTable = nil
americaID = -1

--
-- Main
--

function DoImmigration()
	if not HappinessTable then
		DoGameInitialization()
	end
	
	local america = Players[americaID]

	UpdateHappinessInfo()
	
	if not america or not america:IsAliveCiv() or america:GetExcessHappiness() <= 0 then
		return
	end
	
	for playerID, player in pairs(Players) do
		if player:IsAliveCiv() and not player:IsMinorCiv() then
			local averageHappiness = HappinessTable[playerID]:average()
			log:Debug("%30s averageHappiness = %s", player:GetName(), averageHappiness)
			
			local bShouldEmigrate = (player:GetExcessHappiness() < 0 and averageHappiness < 0)
			if player:GetNumCities() == 1 then
				for pCity in player:Cities() do
					if (pCity:IsCapital()) and (pCity:GetPopulation() == 1) then
						bShouldEmigrate = false
					end
				end
			end
			
			local iNumEmigrants = math.floor(-averageHappiness / GameInfo.Immigration["NumEmigrantsDenominator"].Value) + 1

			if bShouldEmigrate then	
				DoEmigratePlayer(player, iNumEmigrants)
			end
		end
	end
	SaveGameData()
end

Events.ActivePlayerTurnStart.Add( DoImmigration )

--
-- Utility Functions
--

function DoGameInitialization()
	HappinessTable = {}
	for playerID, player in pairs(Players) do
		if (player:IsAliveCiv()) then
			if player:GetTraitInfo().ImmigrationFrequency then
				americaID = playerID
			end
			local SaveData = player:GetScriptData()
			--log:Debug("Attempting to Load Save Data")
			if SaveData == "" then
				HappinessTable[playerID] = Queue:new()
			else
				--log:Debug("Loading Save Data")
				--log:Debug(SaveData)
				SaveData = stringToTable(SaveData, QUEUE_CAPACITY, 1, {","}, 1)
				HappinessTable[playerID] = Queue:new(SaveData)
			end
		end
	end
end
------------------------------------------------------------------------------
function SaveGameData()
	for playerID,player in pairs(Players) do
		if player:IsAliveCiv() then
			--log:Debug("Attempting to Save Data")
			local tbl = tableToString(HappinessTable[playerID], QUEUE_CAPACITY, 1, {","}, 1)
			--log:Debug("Save Data Created")
			--log:Debug(tbl)
			player:SetScriptData(tbl)
		end
	end
end
------------------------------------------------------------------------------

------------------------------------------------------------------------------
function PrintContentsOfTable(incoming_table) -- For debugging purposes. LOT of table data being handled here.
	if DebugMode then
		print("--------------------------------------------------")
		print("Table printout for table ID:", incoming_table)
		for index, data in pairs(incoming_table) do
			print("Table index:", index, " Table entry:", data)
		end
		print("- - - - - - - - - - - - - - - - - - - - - - - - - -")
	end
end
------------------------------------------------------------------------------
function UpdateHappinessInfo()
	log:Debug("UpdateHappinessInfo")
	for playerID,player in pairs(Players) do
		if player:IsAliveCiv() then
			HappinessTable[playerID]:push(player:GetExcessHappiness())
		end
	end
end
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
function GetCityByIndex(player, N)
	local n = 0
	for city in player:Cities() do
		if (n == N) then
			return city
		end
		n = n + 1
	end
end
------------------------------------------------------------------------------
function HasPolicyType(player, policyName)
	local policy = GameInfo.Policies[policyName]
	return policy and player:HasPolicy(policy.ID)
end
------------------------------------------------------------------------------
function DoEmigratePlayer(fromPlayer, iNumEmigrants)
	log:Debug("iNumEmigrants = " .. iNumEmigrants)
	local passNum = 0
	UpdateImmigrations(fromPlayer)

	-- for each emigrant
	while iNumEmigrants > 0 and passNum <= GameInfo.Immigration["MaxPasses"].Value do
		passNum = passNum + 1

		-- for each city owned by fromPlayer
		for fromCity in fromPlayer:Cities() do 
			if iNumEmigrants == 0 then break end
			log:Debug(" " .. Locale.ConvertTextKey(fromCity:GetNameKey()))
			if ShouldCityEmigrate(passNum, fromCity) then
				local toPlayer = GetBestDestination(fromPlayer)

				-- move emigrant
				if toPlayer:IsAliveCiv() then
					log:Debug("Immigrate from %s to %s", fromPlayer:GetName(), toPlayer:GetName())
					MovePopulation(fromPlayer, fromCity, toPlayer)
					iNumEmigrants = iNumEmigrants - 1
				end
			end
		end
	end
end
------------------------------------------------------------------------------
function UpdateImmigrations(player)
	local cityWeight = {}
	local cityProb = {}
	local totalCulture = 0
	local totalWeight = 0
	local cityID = 0
	
	-- figure out weight
	for city in player:Cities() do
		cityID = city:GetID()
		cityWeight[cityID] = 1
		
		-- retrieve function And weight from jump table stored with XML
		for weight in GameInfo.Immigration_Weights() do
			if weight.IsCityStatus and city[weight.Type](city) then
				local bUseWeight = true

				for j in GameInfo.Immigration_Weight_Policy_Requirements() do
					if weight.Type == j.WeightType then
						if (j.ExcludesWeight and HasPolicyType(player, j.PolicyType)) then
							bUseWeight = false
						elseif (not j.ExcludesWeight and not HasPolicyType(player, j.PolicyType)) then
							bUseWeight = false
						end
					end
				end

				if bUseWeight then
					cityWeight[cityID] = cityWeight[cityID] * weight.Value
				end
			end
		end
		
		-- factor in culture
		cityWeight[cityID] = cityWeight[cityID] / (GameInfo.Immigration_Weights["Culture"].Value * math.log(city:GetJONSCultureThreshold() + 2))
		totalWeight = totalWeight + cityWeight[cityID]
	end
	
	-- probability = contribution to total weight
	for city in player:Cities() do
		iProbCityImmigration[city:GetID()] = 100 * cityWeight[city:GetID()] / totalWeight
	end	
end
------------------------------------------------------------------------------
function ShouldCityEmigrate(passNum, city)--
	local p = Map.Rand(100, "City immigration probability - Lua")
	log:Debug("  " .. iProbCityImmigration[city:GetID()] * 2 ^ (passNum - 1) .. " >= " .. p .. "?")

	if ((iProbCityImmigration[city:GetID()] * 2 ^ (passNum - 1)) >= p) and (city:GetPopulation() > 1) then
		-- less likely to emigrate from a city multiple times
		iProbCityImmigration[city:GetID()] = iProbCityImmigration[city:GetID()] * GameInfo.Immigration_Weights["EmigratedOnceAlready"].Value
		return true
	end
	return false
end
------------------------------------------------------------------------------
function GetBestDestination(fromPlayer)--
	local player = Players[americaID]	
	if player:IsAliveCiv() then
		return bestPlayer
	end
	
	--[[
	-- TODO: immigration for all players, with bonus for America
	
	local fromPlayerTeam = Teams[fromPlayer:GetTeam()]
	local bestPlayer
	local iBestCountryValue = 0
	
	for playerID,player in pairs(Players) do
		if player:IsAliveCiv() then
			log:Debug("   is " .. player:GetName() .. " best?")
			if ( player ~= fromPlayer and fromPlayerTeam:IsHasMet(player:GetTeam()) and not fromPlayerTeam:IsAtWar(player:GetTeam())) then
				local averageHappiness = HappinessTable[playerID]:average()
				log:Debug("    averageHappiness = " .. averageHappiness)
				if (averageHappiness > 0) then
					local iPlayerValue = Map.Rand(averageHappiness, "Random country to emigrate to - Lua")	--calculate an immigration value TODO: add culture, open borders etc.
					log:Debug("    iPlayerValue = " .. iPlayerValue)
					if (iPlayerValue > iBestCountryValue) then
						iBestCountryValue = iPlayerValue
						bestPlayer = player
						log:Debug("   bestPlayer = " .. player:GetName())
					end
				end
			end
		end
	end
	return bestPlayer
	--]]
end
------------------------------------------------------------------------------
function MovePopulation(fromPlayer, fromCity, toPlayer)
	local lowestPop = 99
	local toCity = nil
	for city in toPlayer:Cities() do
		if city:GetPopulation() < lowestPop and not (city:IsRazing() or city:IsBlockaded()) then
			lowestPop = city:GetPopulation()
			toCity = city
		end
	end
	local toCity = GetCityByIndex(toPlayer, Map.Rand(toPlayer:GetNumCities(), "Random city to emigrate to - Lua"))
	if not toCity then return end
	
	fromCity:ChangePopulation(-1, true)
	toCity:ChangePopulation(1, true)

	if (fromPlayer:IsHuman()) then
		LuaEvents.CustomNotification(fromCity:GetX(), fromCity:GetY(), 
			"Unhappy citizen immmigrated to the " .. toPlayer:GetCivName() .. " seeking a better life", "Immigration")
	elseif (toPlayer:IsHuman()) then
		LuaEvents.CustomNotification(toCity:GetX(), toCity:GetY(), 
			"Immigrant from the " .. fromPlayer:GetCivName() .. " arrived in our country seeking a better life", "Immigration")
	end
end
------------------------------------------------------------------------------
function LuaEvents.CustomNotification(cityA, cityB, text, title)
	-- should ideally do this as a right-side notification,
	-- but cannot add custom notifications in the unmodded game
	log:Info("CustomNotification cityA='%s' cityB='%s' text='%s' title='%s'", cityA, cityB, text, title)
	Events.GameplayAlertMessage(text)
end