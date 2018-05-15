-- Interacts with CPP functions

exitGame = false

function IsHaltScriptRequested() --Stops Testing Script on request of game or when some stop testing condition is reached

	if IsExitRequested() then
		return true
	elseif exitGame then
		return true
	else
		return false
	end
end

function IsCriticalPopUp() -- Handles Critical PopUps , Interupt Priority is higher than FTUE

	if FindElementByPath("*.ui.textEntry.doneButton") then
		FindAndClickByPath("*.ui.textEntry.doneButton")
		return true
	end
	if FindElementByPath("*.ui.critical.doneButton") then
		FindAndClickByPath("*.ui.critical.doneButton")
		return true
	end
	
	return false
end

function IsPopUpActive() -- Handles PopUps , when FTUE not available


	if FindElementByPath("*.outOfResourcesItem.tapArea") then --Collect Gold
		FindAndClickByPath("*.outOfResourcesItem.tapArea")
		return true
	elseif FindElementByPath("*.doneButton") then   --Done/Ok Button
		FindAndClickByPath("*.doneButton")
		if FindElementByPath("*header.closeButton") then
			FindAndClickByPath("*header.closeButton")
		end
		return true
	elseif FindElementByPath("*.requiredA.button") then --Collect Tick castle Upgrade
		FindAndClickByPath("*.requiredA.button")
		if FindElementByPath("*.upgradeButton") then -- Skip/Upgrade Button
			FindAndClickByPath("*.upgradeButton")
		end
		return true
	elseif FindElementByPath("*.upgradeButton") then -- Skip/Upgrade Button
		FindAndClickByPath("*.upgradeButton")
		return true
	elseif (GetCurrentState() ~= "DYNAMIC_DEPLOYMENT") and (GetCurrentState() ~= "BATTLEGAME") then -- Handles unwanted TalkingHeads
		if FindElementByPath("*.ui.talkingHead.animationContainer.*") then
			WaitForUI()
			GenerateClick(0.5,0.5)
			return true
		end
	end
	
	return false
end
