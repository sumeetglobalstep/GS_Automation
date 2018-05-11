-- Interacts with CPP functions

exitGame = false
function ExitGame()
	if IsExitRequested() then
		return true
	elseif exitGame then
		return true
	else
		return false
	end
end

function GuideActive()
	return IsGuideActive()
end