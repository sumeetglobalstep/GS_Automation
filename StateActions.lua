require "Media/GameData/Interactions/GSAutomation/GlobalVars"

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
	if FindElementByPath(cinematicSkipButton) then
		print("Skip Button Found")
		FindAndClickByPath(cinematicSkipButton)
		return true
	end
	
	return false
end

GameState["DYNAMIC_DEPLOYMENT"] = function()
	print("DYNAMIC_DEPLOYMENT state called")
	local actionFound = false
	
	if FindElementByPath("*.autoOrders.Button") then
		print("AutoOrder Found");
		FindAndClickByPath("*.autoOrders.Button")
		actionFound = true
	end	
	if FindElementByPath("*.ui.multiSelectButton.button") then
		FindAndClickByPath("*.ui.multiSelectButton.button")
		WaitForUI()
		GenerateClick(0.5,0.3)
		actionFound = true
	end
	if actionFound == false then -- For Initial Battle1 and Battle2

		-- event AI_CONTROL doesn't work, Passing HardCode values
		
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



function ControlGameState()

	print("ControlGameState called")
	if GameState[GetCurrentState()] then
		GameState[GetCurrentState()]()
		print ("CurrentGameState",GetCurrentState())
		return true
	end
	
	return false
end