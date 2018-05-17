-- Interacts with CPP functions

exitGame = false

function FindButtonAndClick(path,IsClickable)
	if FindElementByPath(path) then
		if IsClickable then
			FindAndClickByPath(path)
		end
		return true
	else
		return false
	end
end


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
	if	FindButtonAndClick("*.ui.textEntry.doneButton",true) then
		return true
	elseif FindButtonAndClick("*.ui.critical.doneButton",true) then
		return true
	elseif FindButtonAndClick("*.ui.confirmation.doneButton",true) then
		return true
	else
		return false
	end
end

function IsPopUpActive() -- Handles PopUps , when FTUE not available


	if FindElementByPath("*.outOfResourcesItem.tapArea") then --Collect Gold
		FindAndClickByPath("*.outOfResourcesItem.tapArea")
		return true
	elseif FindElementByPath("*ui.ok.doneButton") then   --Done/Ok Button
		FindAndClickByPath("*ui.ok.doneButton")
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
	-- elseif (GetCurrentState() ~= "DYNAMIC_DEPLOYMENT") and (GetCurrentState() ~= "BATTLEGAME") then -- Handles unwanted TalkingHeads
		-- if FindElementByPath("*.ui.talkingHead.animationContainer.*") then
			-- WaitForUI()
			-- GenerateClick(0.5,0.5)
			-- return true
		-- end
	end
	
	return false
end
