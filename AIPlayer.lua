require "Media/GameData/Interactions/Util"
require "Media/GameData/Interactions/GSAutomation/StateActions"
require "Media/GameData/Interactions/GSAutomation/InteractionAPI"
require "Media/GameData/Interactions/GSAutomation/GlobalVars"

function IsCriticalPopUp()

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

function IsPopUpActive()

	if FindElement("REGISTRATION_CONTINUE", "", "") then
		FindAndClickByPath("*.Registration.*")
		FindAndClick("REGISTRATION_CONTINUE", "", "")
		return true
	elseif FindElementByPath("*.outOfResourcesItem.tapArea") then --Collect Gold
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
	elseif FindElement("SERVER_RESYNC", "", "") then
		FindAndClick("SERVER_RESYNC", "", "")
		return true
	elseif FindElement("SEND_TO_TITLE", "", "") then
		FindAndClick("SEND_TO_TITLE", "", "")
		return true
	elseif (GetCurrentState() ~= "DYNAMIC_DEPLOYMENT") then -- Handles unwanted TalkingHeads
		if FindElementByPath("*.ui.talkingHead.animationContainer.*") then
			WaitForUI()
			GenerateClick(0.5,0.5) -- Generates a click on center of screen
			return true
		end
	end
	
	return false
end

function IsStateHandled()

	if GameState[GetCurrentState()] then
		GameState[GetCurrentState()]()
		return true
	end
	
	return false
end

function AIControl()

	if IsCriticalPopUp() then
		print("Will Dismiss any CriticalPopUp")
	elseif IsGuideActive() then
		print("Will Follow Guide")
		FollowGuide()
	elseif IsPopUpActive() then
		print("Will Dismiss any PopUp")
	elseif IsStateHandled() then
		print("StateHandledByScript:",GetCurrentState())
	else
		print("Script Waiting To Take Action")
	end

end

while not IsHaltScriptRequested() do
	AIControl()
	print("NameVar",nameVar)
	Wait(2.0)
end