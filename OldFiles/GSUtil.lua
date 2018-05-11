-- GlobalStepUtil.lua
-- Author @ Tejas Chitale
-- All additional Utilities required are written here.

-- Setting up the default screen resolution.
GS_ScreenWidth = 1280
GS_ScreenHeight = 800

Filename = os.date()
Filename = string.gsub(Filename, ":+", "") 
Filename = string.gsub(Filename, "%s+", "")

--Filename = "DOCUMENTS:ResultData_"..Filename..".txt"
Filename = "DOCUMENTS:ResultData_"..Filename..".txt"
file = io.open(Filename,"w+")
io.output(file)
io.write("Game Started... @ Time : ", os.date(), "")

function CapturePlinth(x,y)
print("Inside Capture Plinth")
Wait(3)
GS_GenerateDrag(653, 141, 620,648)
Wait(2)
OptionalClickByPath("*.hud.gotoMyKingdomButton")
--Wait(5)
Wait(3)
GS_GenerateDrag(653, 141, 620,648)
--Wait(4)
Wait(2)
print("Value of X",x,"Value of Y",y)
GenerateClick(x,y)
end

function CapturePlinthAgain(x,y)
Wait(1)
print("Inside CApture Plinth Again")
print("Value of X",x,"Value of Y",y)
GenerateClick(x,y)
end

function IsCaptureButtonVisible()
	print("Inside IsCaptureButtonVisible")
	if OptionalClickByPath("*.panel.captureButton") then
		print("Capture Button Found")
		return true
	else
		print("Capture Button not visible")
		return false
	end
end

function ClaimContinue()
	print("Inside Claim Continue")
	--Wait(8) tejas
	FindAndClickByPath("*.rewardsScreen.continueButton")
	print("Ha ha ha ah ")
	--OptionalClickByPath("*.rewardsScreen.continueButton") tejas
	--Wait(10) tejas
		--OptionalClickByPath("*.header.closeButton")
	Wait(12) --tejas
	print("Ha ha ah ClaimContinue")
	if FindElementByPath("*.ui.critical.body")	then
		FindAndClickByPath("*.doneButton")
	else
		print("No PopUp Appeared")
	end
	Wait(2)
		
	if FindElementByPath("*.header.closeButton") then
		FindAndClickByPath("*.header.closeButton")
		print("Close button found")
	else
		print("Close button not found")
	end
	
	
end

function ClaimEnabled()
	print("Inside ClaimEnabled")
	print("Claim button was enabled")
	ClaimContinue()
end

function ClaimBlocked(x,y)
	print("Inside ClaimBlocked")
	print("Claim Button was blocked")
	OptionalClickByPath("*.hud.gotoMyKingdomButton")
	CapturePlinth(x,y)
	Wait(1)
	OptionalClickByPath("*.panel.captureButton")
	print("Clicked Claimed buttom")
	--Wait(8) tejas
	ClaimContinue()
end


function GS_WaitForState(Time,State)
Wait(Time)
WaitForState(State)
end


-- Used to skip talking head
function GS_TalkingHeadCheck(TestCaseName,NumberOfTalkingHead)
	print("Inside GS_TalkingHeadCheck :: GlobalStepUtil ", TestCaseName)
	for i=0,NumberOfTalkingHead,1 do
		Wait(2)
		if FindElementByPath("*.talkingHead.animationContainer.textContent.body","","") then
			GenerateClick(0.5,0.5)
			print("Tejas")
			print("Talking Head Number",i)
		else
			print("Talkinh Head Number",i,"  not present")
			print("Tejas Else")
		end
	end
end

-- Generate Click using the Pos X, Pos Y
function GS_GenerateClick(x,y)
	NewX = x / GS_ScreenWidth
	NewY = y / GS_ScreenHeight
	--Wait(2)
	GenerateClick(NewX, NewY)
end

-- Generate Click & Drag between the Pos x1, y1 & x2, y2
function GS_GenerateDrag(x1,y1,x2,y2)
	NewX1 = x1 / GS_ScreenWidth
	NewY1 = y1 / GS_ScreenHeight
	NewX2 = x2 / GS_ScreenWidth
	NewY2 = y2 / GS_ScreenHeight
	--Wait(2)
	GenerateDrag(NewX1, NewY1, NewX2, NewY2)
end

-- Upgrade Castle to Level 3
function GS_CastleLevel3Upgrade() --Need to check its use
	Wait(1)
	print("Inside GS_CastleUpgrade3")
	FindAndClickByPath("*.zoomButton")
	
	--OptionalClickByPath("*.zoomButton")--Zoom button
	
	--Wait(3)
	--OptionalClickByPath("*.doneButton")--enter button
	FindAndClickByPath("*.doneButton")

	print("Current State",GetCurrentState().."Current Lesson :", GetCurrentLessonName())
	
	Wait(1)
	--OptionalClickByPath("*.buildingInspector.panel.upgradeButton")
	FindAndClickByPath("*.buildingInspector.panel.upgradeButton")
	-- Purchase of Gold
Wait(1)
	--OptionalClickByPath("*.outOfResourcesItem.tapArea")
FindAndClickByPath("*.outOfResourcesItem.tapArea")
	
	--Skip
	Wait(1)
	--OptionalClickByPath("*.buildingInspector.panel.upgradeButton")
FindAndClickByPath("*.buildingInspector.panel.upgradeButton")

	Wait(3)
	if OptionalClickByPath("*.ui.okButton") then 
		return true
	else
		return false
	end
end




function GS_CastleUpgrade1()

	Wait(1)
	print("Inside GS_CastleUpgrade1")
		--OptionalClickByPath("*.zoomButton") -- Zoom button 
	Wait(0.5)

	FindAndClickByPath("*.zoomButton")
	Wait(0.5)
	
	--OptionalClickByPath("*.doneButton")-- Enter button
		FindAndClickByPath("*.doneButton")

	Wait(0.5)
	--OptionalClickByPath("*.requiredA.button")
		FindAndClickByPath("*.requiredA.button")
	
	Wait(0.5)
	--OptionalClickByPath("*.buildingInspector.panel.upgradeButton")
	FindAndClickByPath("*.buildingInspector.panel.upgradeButton")
	
		Wait(0.5)
	if OptionalClickByPath("*.ui.confirmation.doneButton") then -- Skip button
		print("Castle Upgrade 1 Complete")
		return true
	else
		print("Castle Upgrade 1 Complete")
		return false
	end
	
end

function GS_CastleUpgrade2()
	print("Inside GS_CastleUpgrade2")
	Wait(0.5)
	--OptionalClickByPath("*.zoomButton") -- Zoom button	
	FindAndClickByPath("*.zoomButton")
	Wait(0.5)
	--OptionalClickByPath("*.doneButton") -- Enter button
	FindAndClickByPath("*.doneButton")
	
	Wait(0.5)
	GS_GenerateClick(1241,561)	
	Wait(0.5)
	--OptionalClickByPath("*.buildingInspector.panel.upgradeButton")
		FindAndClickByPath("*.buildingInspector.panel.upgradeButton")

		Wait(0.5)
	--OptionalClickByPath("*.buildingInspector.panel.upgradeButton") -- Skip button
	FindAndClickByPath("*.buildingInspector.panel.upgradeButton")
	Wait(1)
	--OptionalClickByPath("*.buildingInspector.panel.enterButton") -- Enter button
	FindAndClickByPath("*.buildingInspector.panel.enterButton")
	Wait(0.5)
	for i=0,3,1 do
		Wait(1)
		GS_GenerateClick(114, 521)
	end
	
	if OptionalClickByPath("*.closeButton") then-- Enter button
		print("Castle Upgrade 2 Complete")
		return true
	else
		print("Castle Upgrade 2 Incomplete")
		return false
	end
end

-- Follow Guide by ScenarioName
function GS_FollowGuide()
	if IsGuideActive() then
		Wait(1)
		FollowGuide()
  	end
end

function GS_WriteResultToFile(Result,FileName)
FileName:write("\n Result :",Result,"\tCurrent State :",GetCurrentState(),"\t@ Time : ", os.date(),"\n\n")
end

