-- CAPTURE CITY POPUP
-- This popup occurs when a city is capture and must be annexed or puppeted.

PopupLayouts[ButtonPopupTypes.BUTTONPOPUP_CITY_CAPTURED] = function(popupInfo)

	local cityID				= popupInfo.Data1;
	local iCaptureGold			= popupInfo.Data2;
	local iCaptureCulture		= popupInfo.Data3;
	local iCaptureGreatWorks    = popupInfo.Data4;
	local iLiberatedPlayer		= popupInfo.Data5;
	local bMinorCivBuyout		= popupInfo.Option1;
	
	local activePlayer	= Players[Game.GetActivePlayer()];
	local newCity		= activePlayer:GetCityByID(cityID);
	
	if newCity == nil then
		return false;
	end

	--if (0 ~= GameDefines["PLAYER_ALWAYS_RAZES_CITIES"]) then
	--
		--activePlayer:Raze(newCity);
		--return false;
	--end
	
	-- Initialize popup text.	
	local cityNameKey = newCity:GetNameKey();
	if (iCaptureCulture > 0 or iCaptureGold > 0 or iCaptureGreatWorks > 0) then
	    if (iCaptureCulture >0 or iCaptureGreatWorks > 0) then
			popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_GOLD_AND_CULTURE_CITY_CAPTURE", iCaptureGold, iCaptureCulture, iCaptureGreatWorks, cityNameKey);
	    else
			popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_GOLD_CITY_CAPTURE", iCaptureGold, cityNameKey);
		end
	else
		popupText = Locale.ConvertTextKey("TXT_KEY_POPUP_NO_GOLD_CITY_CAPTURE", cityNameKey);
	end
		
	-- Ask the player what he wants to do with this City
	popupText = popupText .. "  " .. Locale.ConvertTextKey("TXT_KEY_POPUP_CITY_CAPTURE_INFO");
	
	SetPopupText(popupText);
	
	-- Calculate Happiness info
	local iUnhappinessNoCity = activePlayer:GetUnhappiness();
	local iUnhappinessSackedCity = activePlayer:GetUnhappinessForecast(newCity, nil);	-- pAssumeCityAnnexed, pAssumeCityPuppeted
	if (bMinorCivBuyout) then
		-- For minor civ buyout (Austria UA), there are no unhappiness benefits of annexing because the city is not occupied
		iUnhappinessSackedCity = activePlayer:GetUnhappinessForecast(nil, newCity);
	end
	local iUnhappinessPuppetCity = activePlayer:GetUnhappinessForecast(nil, newCity);		-- pAssumeCityAnnexed, pAssumeCityPuppeted
	
	local iUnhappinessForSacking = iUnhappinessSackedCity - iUnhappinessNoCity;
	local iUnhappinessForPuppeting = iUnhappinessPuppetCity - iUnhappinessNoCity;
	
	-- Initialize 'Liberate' button.
	if (iLiberatedPlayer ~= -1) then
		local OnLiberateClicked = function()
			Network.SendLiberateMinor(iLiberatedPlayer, cityID);
		end
		
		local buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_LIBERATE_CITY");
		local strToolTip = Locale.ConvertTextKey("TXT_KEY_POPUP_CITY_CAPTURE_INFO_LIBERATE", Players[iLiberatedPlayer]:GetNameKey());
		AddButton(buttonText, OnLiberateClicked, strToolTip);
	end
	
	-- Initialize 'Sack' button.
	local OnSackClicked = function()
		--Network.SendDoTask(cityID, TaskTypes.TASK_ANNEX_PUPPET, -1, -1, false, false, false, false);
		--newCity:ChooseProduction();
		Network.SendDoTask(cityID, TaskTypes.TASK_CREATE_PUPPET, -1, -1, false, false, false, false);
		Events.CityCaptured(newCity, activePlayer, "SACK")
	end
		
	-- Initialize 'Puppet' button.
	local OnPuppetClicked = function()
		Network.SendDoTask(cityID, TaskTypes.TASK_CREATE_PUPPET, -1, -1, false, false, false, false);
		Events.CityCaptured(newCity, activePlayer, "PUPPET")
	end
	
	buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_PUPPET_CAPTURED_CITY");
	strToolTip = Locale.ConvertTextKey("TXT_KEY_POPUP_CITY_CAPTURE_INFO_PUPPET", iUnhappinessForPuppeting);
	AddButton(buttonText, OnPuppetClicked, strToolTip);
	
	-- Initialize 'Raze' button.
	local bRaze = activePlayer:CanRaze(newCity);
	if (bRaze) then
		local OnRazeClicked = function()
			Network.SendDoTask(cityID, TaskTypes.TASK_RAZE, -1, -1, false, false, false, false);
			Events.CityCaptured(newCity, activePlayer, "RAZE")
		end
		
		buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_RAZE_CAPTURED_CITY");
		strToolTip = Locale.ConvertTextKey("TXT_KEY_POPUP_CITY_CAPTURE_INFO_RAZE", iUnhappinessForSacking);
		AddButton(buttonText, OnRazeClicked, strToolTip);
	else
		local buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_SACK_CITY");
		local strToolTip = Locale.ConvertTextKey("TXT_KEY_POPUP_CITY_CAPTURE_INFO_SACK", iUnhappinessForSacking);
		AddButton(buttonText, OnSackClicked, strToolTip);
	end

	-- CITY SCREEN CLOSED - Don't look, Marc
	local CityScreenClosed = function()
		UIManager:DequeuePopup(Controls.EmptyPopup);
		Events.SerialEventExitCityScreen.Remove(CityScreenClosed);
	end
	
	-- Initialize 'View City' button.
	local OnViewCityClicked = function()
		
		-- Queue up an empty popup at a higher priority so that it prevents other cities from appearing while we're looking at this one!
		UIManager:QueuePopup(Controls.EmptyPopup, PopupPriority.GenericPopup+1);
		
		Events.SerialEventExitCityScreen.Add(CityScreenClosed);
		
		UI.SetCityScreenViewingMode(true);
		UI.DoSelectCityAtPlot( newCity:Plot() );
	end
	
	buttonText = Locale.ConvertTextKey("TXT_KEY_POPUP_VIEW_CITY");
	strToolTip = Locale.ConvertTextKey("TXT_KEY_POPUP_VIEW_CITY_DETAILS");
	AddButton(buttonText, OnViewCityClicked, strToolTip, true);	-- true is bPreventClose
end
