require "Media/GameData/Interactions/Util"

GameState = {}
forceJoinAlliance = false

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
	
	SelectBuilding("Castle2") -- Opens Castle Upgrade Panel to upgrade it to level 3

	if GetProfileNode("castleLevel") >=3 or forceJoinAlliance==true then
		if GetProfileNode("attributes_VP") < 1000 then
			if FindElementByPath("*.zoomButton") then
					FindAndClickByPath("*.zoomButton")
			end
		end
	end
	
end

GameState["LOADOUT_ATTACK"] = function()
	
	if FindElementByPath("*.header.closeButton") then
		FindAndClickByPath("*.header.closeButton")
	end
end

genPlinthCounter = 0

GameState["EPIC_KINGDOM"] = function()
	forceJoinAlliance = false
	
	if GetProfileNode("attributes_DIAMONDS")<2000 then
		SetDebugVar("Add diamonds|Currency|Cheats", 10000)
	end
	if FindElementByPath("*.raidButton") then
		if FindElementByPath("*.header.closeButton") then
			FindAndClickByPath("*.header.closeButton")
		end
	end	
	
	if GetProfileNode("attributes_VP")<1000 then
		
		WaitForUI()
		Wait(3.0)
		
		GenerateDrag(0.5,0.2,0.5,0.9) -- GenerateDrag to Activate Compass Button
		WaitForUI()
		Wait(3.0)
		if FindElementByPath("*.gotoMyKingdomButton") then
			FindAndClickByPath("*.gotoMyKingdomButton")
		end
		
		WaitForUI()
		Wait(3.0)
		
		GenerateDrag(0.51,0.2,0.48,0.80) -- Drag towards Neutral lands
		Wait(3.0)
		GenerateClick(0.58,0.65) -- Click's on a plinth to gain VP
		
		WaitForUI()
		Wait(2.0)
		
		if FindElementByPath("*.rewardsGrid.*") then
			if FindElementByPath("*.captureButton") then
				FindAndClickByPath("*.captureButton")
			end
		elseif FindElementByPath("*.pveRecycleButton") then
			FindAndClickByPath("*.pveRecycleButton")
			genPlinthCounter = genPlinthCounter + 1
			WaitForUI()
			Wait(2.0)
			if FindElementByPath("*.doneButton") then   --Done/Ok Button
				FindAndClickByPath("*.doneButton")
			end
		end
		
		if genPlinthCounter>3 then
			forceJoinAlliance = true
		end
		
	end
	
	if forceJoinAlliance == true then
		if FindElementByPath("*.zoomButton") then
			FindAndClickByPath("*.zoomButton")
		end
	end	
end

function IsStateHandled()

	if GameState[GetCurrentState()] then
		GameState[GetCurrentState()]()
		return true
	end
	
	return false
end
