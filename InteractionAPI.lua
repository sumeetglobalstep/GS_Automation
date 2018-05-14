-- Interacts with CPP functions
require "Media/GameData/Interactions/GSAutomation/GlobalVars"

function IsHaltScriptRequested()

	if IsExitRequested() then
		return true
	elseif exitGame then
		return true
	else
		return false
	end
end
