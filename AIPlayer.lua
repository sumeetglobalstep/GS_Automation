require "Media/GameData/Interactions/Util"
require "Media/GameData/Interactions/GSAutomation/StateActions"
require "Media/GameData/Interactions/GSAutomation/InteractionAPI"


function CriticalPopUp()
	if FindElementByPath("*.ui.textEntry.doneButton") then
		FindAndClickByPath("*.ui.textEntry.doneButton")
		return true
	end
	if FindElementByPath("*.ui.critical.doneButton") then
		FindAndClickByPath(".ui.critical.doneButton")
		return true
	end
	
	return false
end

function PopUpActive()
	if FindElement("REGISTRATION_CONTINUE", "", "") then
		FindAndClickByPath("*.Registration.*")
		FindAndClick("REGISTRATION_CONTINUE", "", "")
		return true
	elseif FindElementByPath("*.outOfResourcesItem.tapArea") then
		FindAndClickByPath("*.outOfResourcesItem.tapArea")
		return true
	elseif FindElementByPath("*.doneButton") then   --Done/Ok Button
		FindAndClickByPath("*.doneButton")
		return true
	elseif FindElementByPath("*.upgradeButton") then -- Skip/Upgrade Button
		FindAndClickByPath("*.upgradeButton")
		return true
	elseif FindElementByPath("*.breadcrumbs.*.PopupXXL.*") then
		FindAndClick("BTN2_CLICKED", "", "")
		return true
	elseif FindElementByPath("*.Rewards.popupHolder.*.btn1") then
		FindAndClickByPath("*.Rewards.popupHolder.*.btn1")
		return true
	elseif FindElementByPath("*.eventSummaryPopup.closeButton") then
		FindAndClickByPath("*.eventSummaryPopup.closeButton")
		return true
	elseif FindElementByPath("*.SoftPromptRating.*") then
		if FindElementByPath("*.SoftPromptRating.closeBtn.*") then
			FindAndClickByPath("*.SoftPromptRating.closeBtn.*")
		else
			FindAndClick("CLOSE", "", "")
		end
	elseif FindElement("SERVER_RESYNC", "", "") then
		FindAndClick("SERVER_RESYNC", "", "")
		return true
	elseif FindElement("SEND_TO_TITLE", "", "") then
		FindAndClick("SEND_TO_TITLE", "", "")
		return true
	elseif (GetCurrentState() ~= "DYNAMIC_DEPLOYMENT") then
		if FindElementByPath("*.ui.talkingHead.animationContainer.*") then
			WaitForUI()
			GenerateClick(0.5,0.5)
			return true
		end
	end
	
	return false
end

function StateHandled()
	print ("StateHandled called")
	if	ControlGameState()  then
		return true
	end
	
	return false
end

function AIControl()
	if CriticalPopUp() then
		print("Will Dismiss any CriticalPopUp")
		return true
	elseif GuideActive() then
		print("Will Follow Guide")
		FollowGuide()
		return true
	elseif PopUpActive() then
		print("Will Dismiss any PopUp")
		return true
	elseif StateHandled() then
		return true
	else
		print("Script Waiting To Take Action")
	end
	
	return false
end

while not ExitGame() do
	AIControl()
	Wait(2.0)
end