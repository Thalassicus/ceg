--------------------------------------------------------------
-- Immigration Mod
-- Author: killmeplease
-- DateCreated: 10/4/2010 6:23:59 PM
--------------------------------------------------------------

include("MT_Events.lua")

--[[

Credits:
killmeplease	- original Emigration mod
Afforess		- save/load procedure
Thalassicus		- expansion and polishing

--]]

--
-- Globals
--

DebugMode = GameInfo.Immigration["Debug"].Value == 1;
QUEUE_CAPACITY = GameInfo.Immigration["HappinessAverageTurns"].Value * GameInfo.GameSpeeds[PreGame.GetGameSpeed()].GrowthPercent / 100;
iProbCityImmigration = {};
AverageHappiness = {};
HappinessTable = nil;

--
-- Main
--

function doImmigration()
	if not HappinessTable then
		doGameInitialization();
	end

	updateHappinessInfo();

	-- for each major civ
	for iPlayerID,pPlayer in pairs(Players) do
		if isValidPlayer(pPlayer) and not pPlayer:IsMinorCiv() then
			printDebug("=== " .. getPlayerName(pPlayer) .. " ===");
			local iAverageHappiness = HappinessTable[iPlayerID]:average();
			printDebug("iAverageHappiness = " .. iAverageHappiness);
			
			-- if unhappy
			local bShouldEmigrate = (pPlayer:GetExcessHappiness() < 0 and iAverageHappiness < 0);
			if pPlayer:GetNumCities() == 1 then
				for pCity in pPlayer:Cities() do
					if (pCity:IsCapital()) and (pCity:GetPopulation() == 1) then
						bShouldEmigrate = false;
					end
				end
			end
			
			local iNumEmigrants = math.floor(-iAverageHappiness / GameInfo.Immigration["NumEmigrantsDenominator"].Value) + 1;

			-- do immigration
			if bShouldEmigrate then	
				doEmigratePlayer(pPlayer, iNumEmigrants);
			end
		end
	end
	saveGameData();
end

Events.ActivePlayerTurnStart.Add( doImmigration );

--
-- Utility Functions
--

function doGameInitialization()
	HappinessTable = {};
	for iPlayerID,pPlayer in pairs(Players) do
		if (isValidPlayer(pPlayer)) then
			local SaveData = pPlayer:GetScriptData();
			--printDebug("Attempting to Load Save Data");
			if SaveData == "" then
				HappinessTable[iPlayerID] = Queue:new();
			else
				--printDebug("Loading Save Data");
				--printDebug(SaveData);
				SaveData = stringToTable(SaveData, QUEUE_CAPACITY, 1, {","}, 1);
				HappinessTable[iPlayerID] = Queue:new(SaveData);
			end
		end
	end
end
------------------------------------------------------------------------------
function saveGameData()
	for iPlayerID,pPlayer in pairs(Players) do
		if isValidPlayer(pPlayer) then
			--printDebug("Attempting to Save Data");
			local tbl = tableToString(HappinessTable[iPlayerID], QUEUE_CAPACITY, 1, {","}, 1);
			--printDebug("Save Data Created");
			--printDebug(tbl);
			pPlayer:SetScriptData(tbl);
		end
	end
end
------------------------------------------------------------------------------

------------------------------------------------------------------------------
function printDebug(text)
	if DebugMode then
		print(text);
	end
end
------------------------------------------------------------------------------
function printContentsOfTable(incoming_table) -- For debugging purposes. LOT of table data being handled here.
	if DebugMode then
		print("--------------------------------------------------");
		print("Table printout for table ID:", incoming_table);
		for index, data in pairs(incoming_table) do
			print("Table index:", index, " Table entry:", data);
		end
		print("- - - - - - - - - - - - - - - - - - - - - - - - - -");
	end
end
------------------------------------------------------------------------------
function updateHappinessInfo()
	printDebug("updateHappinessInfo");
	for iPlayerID,pPlayer in pairs(Players) do
		if isValidPlayer(pPlayer) then
			HappinessTable[iPlayerID]:push(pPlayer:GetExcessHappiness());
		end
	end
end
------------------------------------------------------------------------------
function isValidPlayer(pPlayer)
	return pPlayer ~= nil and pPlayer:IsAlive() and pPlayer:GetNumCities() > 0;
end
------------------------------------------------------------------------------
function getPlayerName(player)
	if player:IsMinorCiv() then
		return Locale.ConvertTextKey(GameInfo.MinorCivilizations[player:GetMinorCivType()].Description);
	end
	local civInfo = GameInfo.Civilizations[player:GetCivilizationType()];			
	return (Locale.ConvertTextKey(civInfo.Description));	
end
------------------------------------------------------------------------------
function getCityByIndex(player, N)
	local n = 0;
	for city in player:Cities() do
		if (n == N) then
			return city;
		end
		n = n + 1;
	end
end
------------------------------------------------------------------------------
function hasPolicyName(player, policyName)
	for policy in GameInfo.Policies() do
		if policy.Type == policyName then
			return player:HasPolicy(policy.ID);
		end
	end
	return false;
end
------------------------------------------------------------------------------
function doEmigratePlayer(fromPlayer, iNumEmigrants)
	printDebug("iNumEmigrants = " .. iNumEmigrants);
	local passNum = 0;
	updateImmigrations(fromPlayer);

	-- for each emigrant
	while iNumEmigrants > 0 and passNum <= GameInfo.Immigration["MaxPasses"].Value do
		passNum = passNum + 1;

		-- for each city owned by fromPlayer
		for fromCity in fromPlayer:Cities() do 
			if iNumEmigrants == 0 then break end;
			printDebug(" " .. Locale.ConvertTextKey(fromCity:GetNameKey()));
			if shouldCityEmigrate(passNum, fromCity) then
				local toPlayer = getBestDestination(fromPlayer);

				-- move emigrant
				if isValidPlayer(toPlayer) then
					printDebug(" * Emigrate to " .. getPlayerName(toPlayer));
					movePopulation(fromPlayer, fromCity, toPlayer);
					iNumEmigrants = iNumEmigrants - 1;
				end
			end
		end
	end
end
------------------------------------------------------------------------------
function updateImmigrations(pPlayer)
	local cityWeight = {};
	local cityProb = {};
	local totalCulture = 0;
	local totalWeight = 0;
	local cityID = 0;
	
	-- figure out weight
	for city in pPlayer:Cities() do
		cityID = city:GetID();
		cityWeight[cityID] = 1;
		
		-- retrieve function and weight from jump table stored with XML
		for weight in GameInfo.Immigration_Weights() do
			if weight.IsCityStatus and city[weight.Type](city) then
				local bUseWeight = true;

				for j in GameInfo.Immigration_Weight_Policy_Requirements() do
					if weight.Type == j.WeightType then
						if (j.ExcludesWeight and hasPolicyName(pPlayer, j.PolicyType)) then
							bUseWeight = false;
						elseif (not j.ExcludesWeight and not hasPolicyName(pPlayer, j.PolicyType)) then
							bUseWeight = false;
						end
					end
				end

				if bUseWeight then
					cityWeight[cityID] = cityWeight[cityID] * weight.Value;
				end
			end
		end
		
		-- factor in culture
		cityWeight[cityID] = cityWeight[cityID] / (GameInfo.Immigration_Weights["Culture"].Value * math.log(city:GetJONSCultureThreshold() + 2));
		totalWeight = totalWeight + cityWeight[cityID];
	end
	
	-- probability = contribution to total weight
	for city in pPlayer:Cities() do
		iProbCityImmigration[city:GetID()] = 100 * cityWeight[city:GetID()] / totalWeight;
	end	
end
------------------------------------------------------------------------------
function shouldCityEmigrate(passNum, city)--
	local p = Map.Rand(100, "City immigration probability - Lua")
	printDebug("  " .. iProbCityImmigration[city:GetID()] * 2 ^ (passNum - 1) .. " >= " .. p .. "?");

	if ((iProbCityImmigration[city:GetID()] * 2 ^ (passNum - 1)) >= p) and (city:GetPopulation() > 1) then
		-- less likely to emigrate from a city multiple times
		iProbCityImmigration[city:GetID()] = iProbCityImmigration[city:GetID()] * GameInfo.Immigration_Weights["EmigratedOnceAlready"].Value;
		return true;
	end;
	return false;
end
------------------------------------------------------------------------------
function getBestDestination(fromPlayer)--
	local fromPlayerTeam = Teams[fromPlayer:GetTeam()];
	local pBestPlayer;
	local iBestCountryValue = 0;	
	for iPlayerID,pPlayer in pairs(Players) do
		if isValidPlayer(pPlayer) then
			printDebug("   is " .. getPlayerName(pPlayer) .. " best?");
			if ( pPlayer ~= fromPlayer and fromPlayerTeam:IsHasMet(pPlayer:GetTeam()) and not fromPlayerTeam:IsAtWar(pPlayer:GetTeam())) then
				local iAverageHappiness = HappinessTable[iPlayerID]:average();
				printDebug("    iAverageHappiness = " .. iAverageHappiness);
				if (iAverageHappiness > 0) then
					local iPlayerValue = Map.Rand(iAverageHappiness, "Random country to emigrate to - Lua");	--calculate an immigration value; TODO: add culture, open borders etc.
					printDebug("    iPlayerValue = " .. iPlayerValue);
					if (iPlayerValue > iBestCountryValue) then
						iBestCountryValue = iPlayerValue;
						pBestPlayer = pPlayer;
						printDebug("   pBestPlayer = " .. getPlayerName(pPlayer));
					end
				end
			end
		end
	end
	return pBestPlayer;
end
------------------------------------------------------------------------------
function movePopulation(fromPlayer, fromCity, toPlayer)
	fromCity:SetPopulation(fromCity:GetPopulation() - 1, true);	--decrease population in a source city
	local toCity;
	
	local toCity = getCityByIndex(toPlayer, Map.Rand(toPlayer:GetNumCities(), "Random city to emigrate to - Lua"));
	if toCity == nil then return end;
	toCity:SetPopulation(toCity:GetPopulation() + 1, true);	--increase population in a destination city	(maybe we can use ChangePopulation(+1) instead?)

	--show notification to the player:
	if (fromPlayer:IsHuman()) then
		LuaEvents.CustomNotification(fromCity:GetX(), fromCity:GetY(), 
			"Unhappy citizen immmigrated to the " .. getPlayerName(toPlayer) .. " seeking a better life", "Immigration");
	elseif (toPlayer:IsHuman()) then
		LuaEvents.CustomNotification(toCity:GetX(), toCity:GetY(), 
			"Immigrant from the " .. getPlayerName(fromPlayer) .. " arrived in our country seeking a better life", "Immigration");
	end
	
end
------------------------------------------------------------------------------
function LuaEvents.CustomNotification(cityA, cityB, text, title)
	-- should ideally do this as a right-side notification,
	-- but cannot add custom notifications in the unmodded game
	log:Info("CustomNotification cityA='%s' cityB='%s' text='%s' title='%s'", cityA, cityB, text, title)
	Events.GameplayAlertMessage(text)
end