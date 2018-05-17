require "Media/GameData/Interactions/Util"
require "Media/GameData/Interactions/GSAutomation/StateActions"
require "Media/GameData/Interactions/GSAutomation/InteractionAPI"
require "Media/GameData/Interactions/GSAutomation/GlobalVars"



function AIControl()
	if IsCriticalPopUp() then
		print("Will Dismiss any CriticalPopUp")
	elseif IsGuideActive() then
		print("Will Follow Guide")
		FollowGuide()
	elseif IsStateHandled() then
		print("StateHandledByScript:",GetCurrentState())
	else
		print("Script Waiting To Take Action")
	end
end

while not IsHaltScriptRequested() do
	AIControl()
	Wait(2.0)
end