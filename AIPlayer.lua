require "Media/GameData/Interactions/Util"
require "Media/GameData/Interactions/GSAutomation/StateActions"
require "Media/GameData/Interactions/GSAutomation/InteractionAPI"

previousGameState = ""

function PopUpActive()
	if FindElement("REGISTRATION_CONTINUE", "", "") then
    pre_click_function()
    FindAndClickByPath("*.Registration.*")
    FindAndClick("REGISTRATION_CONTINUE", "", "")
    return true
  elseif FindElementByPath("*.doneButton") then
    pre_click_function()
    FindAndClickByPath("*.doneButton")
    return true
  elseif FindElementByPath("*.breadcrumbs.*.PopupXXL.*") then
    pre_click_function()
    FindAndClick("BTN2_CLICKED", "", "")
    return true
  elseif FindElementByPath("*.Rewards.popupHolder.*.btn1") then
    pre_click_function()
    FindAndClickByPath("*.Rewards.popupHolder.*.btn1")
    return true
  elseif FindElementByPath("*.eventSummaryPopup.closeButton") then
    pre_click_function()
    FindAndClickByPath("*.eventSummaryPopup.closeButton")
    return true
  elseif FindElementByPath("*.SoftPromptRating.*") then
    pre_click_function()
    if FindElementByPath("*.SoftPromptRating.closeBtn.*") then
      FindAndClickByPath("*.SoftPromptRating.closeBtn.*")
    else
      FindAndClick("CLOSE", "", "")
    end
  elseif FindElement("SERVER_RESYNC", "", "") then
    pre_click_function()
    FindAndClick("SERVER_RESYNC", "", "")
    return true
  elseif FindElement("SEND_TO_TITLE", "", "") then
    pre_click_function()
    FindAndClick("SEND_TO_TITLE", "", "")
    return true
  end

  return false
end

function StateHandled()
	print ("StateHandled called")
	if	ControlGameState()  then
		return true
	else
		return false
	end
end

function AIControl()

	if PopUpActive() then
		print("Will Dismiss any PopUp")
	elseif GuideActive() then
		print("Will Follow Guide")
		FollowGuide()
	elseif StateHandled() then
	--previousGameState ~= GetCurrentState() then
		--previousGameState = GetCurrentState()
	--	if StateHandled() then
		Wait(5.0)
	return true
	
	--else
	--		return false
		--end
	else
		print("Script Waiting To Take Action")
		Wait(5.0)
	end
	
	Wait(2.0)
end

while not ExitGame() do
	AIControl()
end