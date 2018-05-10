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
	Wait(5)
	OptionalClickByPath("*.zoomButton")--Zoom button
	print("Current State",GetCurrentState().."Current Lesson :", GetCurrentLessonName())
	print("else6 --Inside Castle 1st search button")
	
	
	Wait(3)
	OptionalClickByPath("*.doneButton")--enter button
	print("Current State",GetCurrentState().."Current Lesson :", GetCurrentLessonName())
	print("else6 --Inside Castle 1st search button")
	
	Wait(3)
	OptionalClickByPath("*.buildingInspector.panel.upgradeButton")
	print("Current State",GetCurrentState().."Current Lesson :", GetCurrentLessonName())
	print("else3 --Inside Castle 1st search button")
	
	-----Purchase of gold
	Wait(3)
	OptionalClickByPath("*.outOfResourcesItem.tapArea")
	print("Current State",GetCurrentState().."Current Lesson :", GetCurrentLessonName())
	print("After castle 3 upgrade")
	
	--Skip
	Wait(3)
	OptionalClickByPath("*.buildingInspector.panel.upgradeButton")
	print("Current State",GetCurrentState().."Current Lesson :", GetCurrentLessonName())
	print("After castle 3 upgrade")
	Wait(3)
	
	
	if OptionalClickByPath("*.ui.okButton") then 
		print("Current State",GetCurrentState().."Current Lesson :", GetCurrentLessonName())
		return true
	else
		print("Castle L3 not upgraded")
		return false
	end
end

-- Upgrade the Armory
function GS_UpgradeArmory()
	Wait(2)
	while not(OptionalClickByPath("*.ui.okButton.button")) do
		if IsGuideActive() then
			FollowGuide()
			print("Current State",GetCurrentState().."Current Lesson :", GetCurrentLessonName())
			print("if --Inside Castle 1st search button")
		
		else
			Wait(5)
			print("Guide Not active --Inside Castle 1st Search Button")
			return false
		end
	end
	return true
end

function GS_ReturnResultFileName()
Filename =os.date()
Filename = string.gsub(Filename, ":+", "") 
Filename = string.gsub(Filename, "%s+", "")
Filename = "DOCUMENTS:ResultData_"..Filename..".txt"
return FileName
end

