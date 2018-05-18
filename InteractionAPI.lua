-- Interacts with CPP functions
require "Media/GameData/Interactions/GSAutomation/Log"

exitGame = false
errorMessage = ""

function FindButtonAndClick(path, isClickable)
	if FindElementByPath(path) then
		if isClickable then
			FindAndClickByPath(path)
		end
		return true
	end
	
	return false
end

function FindBuilding(bName)
	local buildings = GetProfileNode("buildings")
	for i, building in ipairs(buildings) do
		if building.type:find(bName) then
			return building
		end
	end
	
	return nil
end

-- Stop Script on request of game or an error
function IsHaltScriptRequested()
	if HasNetworkError() then
		-- exitGame = true
		errorMessage = "Network Issue"
	end
	if IsExitRequested() then
		return true
	elseif exitGame then
		LogToFile(GetCurrentState(), errorMessage, "FAIL")
		return true
	end
	
	return false
end

-- Handles Critical PopUps (PopUps with higher priority than FTUE)
function IsCriticalPopUp()
	if FindButtonAndClick("*.ui.textEntry.doneButton", true) then
		return true
	elseif FindButtonAndClick("*.ui.critical.doneButton", true) then
		return true
	elseif FindButtonAndClick("*.ui.confirmation.doneButton", true) then
		return true
	end
	
	return false
end

-- Handles n PopUps (PopUps with lower priority than FTUE)
function IsPopUpActive()
	if FindButtonAndClick("*ui.ok.doneButton", true) then	-- Done/Ok Button
		FindButtonAndClick("*header.closeButton", true)
		return true
	end
	
	return false
end