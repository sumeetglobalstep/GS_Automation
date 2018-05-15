
GameState = {}

GameState["RESULTS"] = function()
	print("Inside Results state")
	if FindElementByPath("*.ui.rewardsScreen.continueButton") then
		FindAndClickByPath("*.ui.rewardsScreen.continueButton")
	end
	if FindElementByPath("*.ui.xpScreen.continueButton") then
		FindAndClickByPath("*.ui.xpScreen.continueButton")
	end
end

GameState["REWARDS"] = function()
	print("Inside REWARDS state")
	if FindElementByPath("*.ui.okButton") then
		FindAndClickByPath("*.ui.okButton")
	end
	
	return false
end

GameState["BATTLEGAME"] = function()
	print("BATTLEGAME state called")
	if FindElementByPath("*.ui.skip.skipButton") then
		print("Skip Button Found")
		FindAndClickByPath("*.ui.skip.skipButton")
		return true
	end
	
	return false
end

GameState["DYNAMIC_DEPLOYMENT"] = function()
	print("DYNAMIC_DEPLOYMENT state called")
	local actionFound = false
	local targetX = 0.5
	local targetY = 0.3
	
	if FindElementByPath("*.autoOrders.Button") then
		print("AutoOrder Found");
		FindAndClickByPath("*.autoOrders.Button")
		actionFound = true
	end	
	if FindElementByPath("*.ui.multiSelectButton.button") then
		FindAndClickByPath("*.ui.multiSelectButton.button")
		WaitForUI()
		GenerateClick(targetX,targetY)
		actionFound = true
	end
	if actionFound == false then -- event AI_CONTROL doesn't work, Passing HardCode values for initial Battle1 and Battle2
		local armyUnitsX = {0.2 , 0.36 , 0.52 , 0.77}
		local armyUnitsY = 0.6
		
		for i,armyCoordinateX in ipairs(armyUnitsX) do
			print("armyCoordinateX",armyCoordinateX)
			GenerateClick(armyCoordinateX,armyUnitsY)
			WaitForUI()
			GenerateClick(targetX,targetY)
		end
		actionFound = true
		WaitForUI()
	end	
	if actionFound == true then
		if FindElementByPath("*ui.okButton.button") then
			FindAndClickByPath("*ui.okButton.button")
		end
	end
end

GameState["CASTLE_VIEW"] = function()
	SelectBuilding("Castle3")
	-- if FindElementByPath("*.requiredA.button") then
		-- print("Castle Upgrade 1 ");
		-- FindAndClickByPath("*.requiredA.button")
	-- end
end

function IsStateHandled()

	if GameState[GetCurrentState()] then
		GameState[GetCurrentState()]()
		return true
	end
	
	return false
end
