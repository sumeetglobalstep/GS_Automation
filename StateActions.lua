require "Media/GameData/Interactions/Util"
require "Media/GameData/Interactions/GSAutomation/InteractionAPI"

GameState = {}
forceJoinAlliance = false
genPlinthCounter = 0
targetVP = 1000
targetCastleLevel = 3
minDiamondAmount = 1000
rechargeDiamondAmount = 10000


GameState["RESULTS"] = function()
	FindButtonAndClick("*.ui.rewardsScreen.continueButton",true)
	FindButtonAndClick("*.ui.xpScreen.continueButton",true)	
end

GameState["SHOP"] = function()
	 FindButtonAndClick("*.ui.reward.continueButton",true)
	 FindButtonAndClick("*.header.closeButton",true)
end

GameState["REWARDS"] = function()
	FindButtonAndClick("*.ui.okButton",true)
end

GameState["BATTLEGAME"] = function()
	FindButtonAndClick("*.ui.skip.skipButton",true)
end

GameState["DYNAMIC_DEPLOYMENT"] = function()
	local actionFound = false
	local targetX = 0.5
	local targetY = 0.3

	if FindButtonAndClick("*.autoOrders.Button",true) then
		actionFound = true
	end	
	if FindButtonAndClick("*.ui.multiSelectButton.button",true) then
		WaitForUI()
		GenerateClick(targetX,targetY)
		actionFound = true
	end
	if actionFound == false then -- event AI_CONTROL doesn't work, Passing HardCode values for initial Battle1 and Battle2
		local armyUnitsX = {0.2 , 0.36 , 0.52 , 0.77}
		local armyUnitsY = 0.6
		
		for i,armyCoordinateX in ipairs(armyUnitsX) do
			GenerateClick(armyCoordinateX,armyUnitsY)
			WaitForUI()
			GenerateClick(targetX,targetY)
		end
		actionFound = true
		WaitForUI()
	end	
	if actionFound == true then
		FindButtonAndClick("*ui.okButton.button",true)
	end
end

GameState["CASTLE_VIEW"] = function()	
	
	if GetProfileNode("castleLevel") >= targetCastleLevel or forceJoinAlliance == true then
		if GetProfileNode("attributes_VP") < targetVP then
			GenerateEvent("SWITCH_TO_KINGDOM_VIEW","","");
		end
	else
		
		if FindButtonAndClick("*.outOfResourcesItem.tapArea",true) then	--Collect Gold
		elseif FindButtonAndClick("*.ui.confirmation.doneButton",true) then
		elseif FindButtonAndClick("*.requiredA.button",true) then	--Collect Tick castle Upgrade
			--FindButtonAndClick("*.upgradeButton",true)	-- Skip/Upgrade Button
			if FindButtonAndClick("*.requiredB.button",true) then	--Collect Tick castle Upgrade
			--FindButtonAndClick("*.upgradeButton",true)	
			end
		end
		
		Wait(3.0)
		if FindButtonAndClick("*.upgradeButton",true) then	-- Skip/Upgrade Button
		
		end
		
		SelectBuilding("Castle"..GetProfileNode("castleLevel")) -- Open's Castle Upgrade Panel to upgrade it to level 3
	end
end

GameState["LOADOUT_ATTACK"] = function()
	FindButtonAndClick("*.header.closeButton",true)
end

GameState["CAMPAIGN"] = function()
	FindButtonAndClick("*.raidButton",true)
end

GameState["TROOPS"] = function()
	if FindButtonAndClick("*ui.ok.doneButton",true) then   --Done/Ok Button
		FindButtonAndClick("*header.closeButton",true)
	end
end

GameState["EPIC_KINGDOM"] = function()
	forceJoinAlliance = false
	
	if GetProfileNode("attributes_DIAMONDS") < minDiamondAmount then
		SetDebugVar("Add diamonds|Currency|Cheats", rechargeDiamondAmount)
	end
	if FindButtonAndClick("*.raidButton",false) then
		FindButtonAndClick("*.header.closeButton",true)
	end	
	if GetProfileNode("attributes_VP") < targetVP then  -- To gain targetVP points
		
		WaitForUI()
		Wait(3.0)
		
		GenerateEvent("GO_TO_MY_KINGDOM","","");
		
		WaitForUI()
		Wait(3.0)
		
		GenerateDrag(0.51,0.2,0.48,0.80) -- Drag towards Neutral lands
		Wait(3.0)
		GenerateClick(0.58,0.65) -- Click's on a plinth to gain VP
		
		WaitForUI()
		Wait(2.0)
		
		if  FindButtonAndClick("*.rewardsGrid.*.vp",false) then
			FindButtonAndClick("*.captureButton",true)
		else --if FindButtonAndClick("*.pveRecycleButton",true) then
			GenerateEvent("RECYCLE_PVE_PLINTHS","","")
			genPlinthCounter = genPlinthCounter + 1
			WaitForUI()
			Wait(2.0)
			FindButtonAndClick("*.doneButton",true)    --Done/Ok Button
		end
		
		if genPlinthCounter > 3 then
			forceJoinAlliance = true
			genPlinthCounter = 0
		end
		
	end
	if forceJoinAlliance == true then
		 GenerateEvent("SWITCH_TO_CASTLE","","");
	end	
end

function IsStateHandled()
	if GameState[GetCurrentState()] then
		GameState[GetCurrentState()]()
		return true
	end
	
	return false
end
