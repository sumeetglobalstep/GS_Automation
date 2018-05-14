local path = require "Media/GameData/Interactions/GSAutomation/GlobalVars"

GameState = {}
GameState["BATTLEGAME"] = function()
	print("BATTLEGAME state called")
	if FindElementByPath(path.cinematicSkipButton) then
		print("Skip Button Found")
		FindAndClickByPath(path.cinematicSkipButton)
		return true
	else
		return false
	end
end

GameState["DYNAMIC_DEPLOYMENT"] = function()
	print("DYNAMIC_DEPLOYMENT state called")
	local actionFound = false
	
	if FindElementByPath("*.autoOrder") then
		print("AutoOrder Found");
		actionFound = true
	end	
	if FindElementByPath("*.ui.multiSelectButton.button") then
		FindAndClickByPath("*.ui.multiSelectButton.button")
		WaitForUI()
		GenerateClick(0.5,0.2)
		actionFound = true
	end
	if FindElementByPath("*.TutorialUnitCommand1.*") then
		print("TutorialUnitCommand1 Found")
		 x, y = GetElementCentre("*.TutorialUnitCommand1.*")
		GenerateClick(x+0.15,y+0.05)
		 WaitForUI ()
		-- if FindElementByPath("*.TutorialUnitCommand2.*") then
		-- print("TutorialUnitCommand2 Found")
		 -- x, y = GetElementCentre("*.TutorialUnitCommand2.*")
		-- GenerateClick(x+0.15,y+0.05)
		actionFound = true
		--end
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
	else
		return false
	end
end