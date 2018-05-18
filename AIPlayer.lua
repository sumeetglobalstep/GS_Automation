require "Media/GameData/Interactions/GSAutomation/StateActions"
require "Media/GameData/Interactions/GSAutomation/InteractionAPI"

prevLessonStep = ""
lessonCounter = 0

function AIControl()
	if IsCriticalPopUp() then
		print("Will Dismiss any CriticalPopUp")
	elseif IsGuideActive() then
		-- ``````````````````  Check if FollowGuide Breaks ```````````````````````````
		if  prevLessonStep == GetCurrentLessonStep() then
			lessonCounter = lessonCounter + 1
			if lessonCounter > 10 then
				exitGame = true
				errorMessage = "Follow Guide Break"
			end
		else
			lessonCounter = 0
			prevLessonStep = GetCurrentLessonStep()
		end
		FollowGuide()
	elseif IsPopUpActive() then
		print("Will Dismiss any PopUp")
	elseif IsStateHandled() then
		print("StateHandledByScript:", GetCurrentState())
	else
		print("Script Waiting To Take Action")
		Wait(5.0)
	end
end

while not IsHaltScriptRequested() do
	IsCheckPointAchieved(GetCurrentState(),GetCurrentLessonName(),"PASS") --TODO: remove this call
	AIControl()
	Wait(1.0)
end