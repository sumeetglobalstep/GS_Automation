-- GlobalStepUtil.lua
-- Author @ Tejas Chitale
-- All additional Utilities required are written here.

-- Setting up the default screen resolution.
GS_ScreenWidth = 1280
GS_ScreenHeight = 800

-- Used to skip talking head
function GS_TalkingHeadCheck(TestCaseName,NumberOfTalkingHead)
	print("Inside GS_TalkingHeadCheck :: GlobalStepUtil ", TestCaseName)
	for i=0,NumberOfTalkingHead,1 do
	  Wait(2)
	  if FindElementByPath("*.talkingHead.animationContainer.textContent.body","","") then
			GenerateClick(0.5,0.5)
			print("Talking Head Number",i)
	  else
			print("Talkinh Head Number",i,"  not present")
	  end
	end
end

-- Generate Click using the Pos X, Pos Y
function GS_GenerateClick(x,y)
	NewX = x / GS_ScreenWidth
	NewY = y / GS_ScreenHeight
	GenerateClick(NewX, NewY)
end

-- Generate Click & Drag between the Pos x1, y1 & x2, y2
function GS_GenerateDrag(x1,y1,x2,y2)

	NewX1 = x1 / GS_ScreenWidth
	NewY1 = y1 / GS_ScreenHeight
	NewX2 = x2 / GS_ScreenWidth
	NewY2 = y2 / GS_ScreenHeight

	GenerateDrag(NewX1, NewY1, NewX2, NewY2)
end

-- Upgrade Castle to Level 3
function GS_CastleLevel3Upgrade()
	Wait(1)
	OptionalClickByPath("*.zoomButton")--Zoom button
	
	Wait(3)
	OptionalClickByPath("*.doneButton")--enter button
	print("Current State",GetCurrentState().."Current Lesson :", GetCurrentLessonName())
	
	Wait(3)
	OptionalClickByPath("*.buildingInspector.panel.upgradeButton")
	
	-----Purchase of gold
	Wait(3)
	OptionalClickByPath("*.outOfResourcesItem.tapArea")
	
	--Skip
	Wait(3)
	OptionalClickByPath("*.buildingInspector.panel.upgradeButton")

	Wait(3)
	if OptionalClickByPath("*.ui.okButton") then 
		return true
	else
		return false
	end
end

function GS_FollowGuide(ScenarioName)
if IsGuideActive() then
		Wait(1)
		FollowGuide()
    else
		Wait(2)
		GS_TalkingHeadCheck(ScenarioName,2)
	end
end

