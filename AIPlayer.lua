require "Media/GameData/Interactions/Util"
--require "Media/GameData/Interactions/GSAutomation/StateActions"
require "Media/GameData/Interactions/GSAutomation/InteractionAPI"

previousGameState = ""

function PopUpActive()
	return false
end

function StateHandled()
	print("Will Check for States in StateActions ")
	return false
end

function AIControl()
	if PopUpActive() then
		print("Will Dismiss any PopUp")
	elseif GuideActive() then
		print("Will Follow Guide")
		FollowGuide()
	elseif previousGameState ~= GetCurrentState() then
		previousGameState = GetCurrentState()
		if StateHandled() then
		return false
		end
	else
		print("Script Waiting To Take Action")
		Wait(1.0)
	end
	
	Wait(5.0)
end

while not ExitGame() do
	AIControl()
end