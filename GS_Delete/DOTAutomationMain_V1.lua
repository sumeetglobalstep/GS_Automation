-- DOTAutomationMain.lua
-- Author @ Tejas Chitale
-- Main Automation File for the DOT

require "Media/GameData/Interactions/Util"
require "Media/GameData/Interactions/GlobalStepUtil"
require "Media/GameData/Interactions/Battle"

-- Reset the Profile
LoadProfilePreset("")

-- Declare Results related Global Vars
Pass = 0
Fail = 0

Filename =os.date()
Filename = string.gsub(Filename, ":+", "") 
Filename = string.gsub(Filename, "%s+", "")

Filename = "DOCUMENTS:ResultData_"..Filename..".txt"
file = io.open(Filename,"w+")
io.output(file)
io.write("Game Started... @ Time : ", os.date(), "\n")

Wait(9)
GenerateClick(0.5,0.5)
Wait(2)
OptionalClickByPath("*.skip.skipButton")


-- Campaign #1 Battle #1 BLOCK STARTS
io.write("Battle 1 Started @ Time : ", os.date(), "\n") --- Write Output to File

GS_TalkingHeadCheck("Scenario2TestCase1", 2)
while not (GetCurrentState()=="DYNAMIC_DEPLOYMENT") do
	if IsGuideActive() then
		print("Current State",GetCurrentState().."Current Lesson :", GetCurrentLessonName())
		FollowGuide()
    else 
		GS_TalkingHeadCheck("Battle1", 2)
	end
end

print("Out Of DYNAMIC_DEPLOYMENT")
Wait(5)
if Campaign1Battle1() then
	Pass = Pass + 1
	print("Battle1 one passed")
	io.write("Battle 1 PASSED \n\n")     --- Write Output to File
	io.write("Battle 1 Finished @ Time : ", os.date(), "\n")

	else
	Fail = Fail + 1
	print("Battle1 one failed")
	io.write("Battle 1 FAILED \n\n")     --- Write Output to File
end
-- Campaign #1 Battle #1 BLOCK ENDS
-- Campaign #1 Battle #2 BLOCK STARTS

io.write("Battle 2 Started @ Time : ", os.date(), "\n")

GS_TalkingHeadCheck("Battle2", 1)
while not (GetCurrentState()=="DYNAMIC_DEPLOYMENT") do

	Wait(1)
	if IsGuideActive() then
		Wait(1)
		FollowGuide()
    else 
		GS_TalkingHeadCheck("Scenario2TestCase1",5)
		Wait(2)
	end
end

if Campaign1Battle2() then
	Pass = Pass + 1
	io.write("Battle 2 PASSED \n\n") --- Write Output to File
	io.write("Battle 2 Finished @ Time : ", os.date(), "\n")
else
	Fail = Fail + 1
	io.write("Battle 2 FAILED \n\n") --- Write Output to File
end

Wait(5)
GS_TalkingHeadCheck("Battle2", 2)  --talking heads

-- Campaign #1 Battle #2 BLOCK ENDS


-- Campaign #1 Battle #3 BLOCK STARTS
io.write("Battle 3 Stared @ Time : ", os.date(), "\n")     --- Write Output to File

while not(GetCurrentState()=="DYNAMIC_DEPLOYMENT")do
	
	Wait(1)
	if IsGuideActive() then
		Wait(1)
		FollowGuide()
    else 
		GS_TalkingHeadCheck("Scenario2TestCase1",2)
		Wait(2)
	end
end
--GS_TalkingHeadCheck("Battle3",2)
Wait(5)
OptionalClickByPath("*.ui.multiSelectButton.button")
Wait(2)

if Campaign1Battle3() then
	  --talking heads
	Pass = Pass + 1
	print("Battle3 passed")
	io.write("Battle 3 PASSED \n\n")     --- Write Output to File
	io.write("Battle 3 Finished @ Time : ", os.date(), "\n")
else
	Fail = Fail + 1
	print("Battle3 failed")
	io.write("Battle 3 FAILED \n\n")     --- Write Output to File
	
end
-- Campaign #1 Battle #3 BLOCK ENDS

Wait(5)

while not (GetCurrentLessonName()=="FIRST_NAME_ENTRY") do 
	Wait(3)
	if IsGuideActive() then
		Wait(3)
		FollowGuide()

	else 
		print("Current State", GetCurrentState().."Current Lesson :", GetCurrentLessonName())
		--GS_TalkingHeadCheck("Scenario2TestCase1",2)
		Wait(2)
	end
end

-- Enter USERNAME 
-- for now using default value ADMIN, since we don't have a way to invoke the Keyboard and press keys.

Wait(5)

if OptionalClickByPath("*.ui.textEntry.doneButton") then  -- Name Entered 
		OptionalClickByPath("*.ui.textEntry.doneButton")
else
		print("Couldnot not find Username TextBox")
end
--[[if OptionalClickByPath(GS_GetPropertyValue("DoneTxtEntryButton")) then  -- Name Entered 
		OptionalClickByPath(GS_GetPropertyValue("DoneTxtEntryButton")) --Some time it does not recognises it so written twice
else
		print("Couldnot not find Username TextBox")
end
]]--

Wait(5)
GS_TalkingHeadCheck("Scenario2TestCase1",2) --Noble name Talkerhead
print(" Out of Username Enterd")


-- Till Upgrade button	
while not (OptionalClickByPath("*.upgradeButton")) do
	if IsGuideActive() then
		print("Current State",GetCurrentState().."Current Lesson :",GetCurrentLessonName())
		print("--till Upgrade button")
		Wait(2)
		FollowGuide()
		print("Inside Follow guide after username entry")
	else
		Wait(2)
		GS_TalkingHeadCheck("Scenario2TestCase1",2) --Noble name Talkerhead
		print("Current State",GetCurrentState().."Current Lesson :",GetCurrentLessonName())
		print("--till Upgrade button")
	end
end


Wait(5)
OptionalClickByPath("*.upgradeButton")
--OptionalClickByPath(GS_GetPropertyValue("UpgradeButton"))
Wait(2)
OptionalClickByPath("*.upgradeButton") --Skip button in upgrade

--OptionalClickByPath(GS_GetPropertyValue("UpgradeButton"))--Skip button in upgrade

print("Clicked Skip button  after Username name")
Wait(10)
GS_TalkingHeadCheck("Scenario2TestCase1",2) 
build_armor=GS_UpgradeArmory()

if build_armor then
	print("build_armor",build_armor)
else
	print("build_armor",build_armor)
	
end
	
Wait(5)
	
--- Castle Level 2 Upgrade starts
OptionalClickByPath("*.zoomButton") -- Zoom button 
Wait(3)

OptionalClickByPath("*.doneButton")-- Enter button


Wait(15)
OptionalClickByPath("*.requiredA.button")

Wait(5)
OptionalClickByPath("*.buildingInspector.panel.upgradeButton")


Wait(5)
OptionalClickByPath("*.ui.confirmation.upgradeButton") -- Skip button


Wait(5)
OptionalClickByPath("*.ui.confirmation.doneButton")  -- Skip button
--OptionalClickByPath(GS_GetPropertyValue("DoneButton"))  -- Skip button
-- Castle Level 2 Upgrade Completed 
GS_TalkingHeadCheck("Scenario2TestCase1",2)
Wait(10)

while not OptionalClickByPath("*.unitUpgrade.upgradeButton") do
	if IsGuideActive() then
		FollowGuide()
	else
		GS_TalkingHeadCheck("Scenario2TestCase1", 2)
		print("Out of follow guide")
	end
end


GS_TalkingHeadCheck("Armory upgrade ENDS", 2)
GS_GenerateClick(114, 521)
Wait(3)

OptionalClickByPath("*.unitUpgrade.upgradeButton")


Wait(3)

OptionalClickByPath("*.closeButton")-- Enter button
-- Armory upgrade ENDS
	
Wait(3)

OptionalClickByPath("*.zoomButton") -- Zoom button


Wait(3)
OptionalClickByPath("*.doneButton") -- Enter button

Wait(3)
GS_GenerateClick(1241,561)


Wait(3)
OptionalClickByPath("*.buildingInspector.panel.upgradeButton")
--OptionalClickByPath(GS_GetPropertyValue("BuildgUpgradeButton"))

Wait(3)
OptionalClickByPath("*.buildingInspector.panel.upgradeButton") -- Skip button


Wait(3)

OptionalClickByPath("*.buildingInspector.panel.enterButton") -- Enter button

Wait(3)
GS_GenerateClick(114, 521)
Wait(2)
GS_GenerateClick(114, 521)
Wait(2)
GS_GenerateClick(114, 521)
Wait(2)

OptionalClickByPath("*.closeButton") -- Enter button

-- Castle Level 3 Upgrade
OptionalClickByPath("*.zoomButton") -- Zoom button


Wait(3)
OptionalClickByPath("*.doneButton")-- Enter button


Wait(3)
OptionalClickByPath("*.buildingInspector.panel.upgradeButton")


-- Buy Gold
Wait(3)
OptionalClickByPath("*.outOfResourcesItem.tapArea")


-- Skip
Wait(3)
OptionalClickByPath("*.buildingInspector.panel.upgradeButton")
Wait(3)

OptionalClickByPath("*.ui.okButton")

Wait(10)


if GS_CastleLevel3Upgrade() then
	Pass=Pass+1
	io.write("Castle Level 3 Upgrade PASSED \n\n")     --- Write Output to File
else
	Fail=Fail+1
	io.write("Castle Level 3 Upgrade FAILED \n\n")     --- Write Output to File
end
-- Castle Level3 Upgrade ENDS

Wait(10)

GS_TalkingHeadCheck("Scenario2TestCase1",4)
	
Wait(8)

if IsGuideActive() then
	FollowGuide()
end	

Wait(10)

-- KINGDOM View STARTS	
-- Land Claim #1 STARTS.  Rewards 225 VP
while (GetCurrentState() == "EPIC_ALLIANCE") do
	Wait(5)
end

while (GetCurrentState() == "EPIC_KINGDOM") do
	if IsGuideActive() then
		FollowGuide()
	else
		break
	end
end

print("Current State : ", GetCurrentState())

Wait(12)

if OptionalClickByPath("*.ui.rewardsScreen.continueButton") then
	print ("Clicked Continue Button")
else
	print ("Continue Button Not found!")
end

Wait(10)
-- Land Claim Completed.  Rewarded 225 VP

-- Defend Process Starts
while (GetCurrentState()=="EPIC_KINGDOM" or GetCurrentState() == "LOADOUT_DEFENCE" or GetCurrentState() == "TROOPS")  do
	if IsGuideActive() then
		FollowGuide()
	else
		print ("Exits all states")
		break
	end
end
-- Defend Ends

Wait (10)

-- Disperse Talking Heads
GS_GenerateClick(640, 400)
Wait (2)
GS_GenerateClick(640, 400)

-- Land Claim #2 STARTS
while (GetCurrentState() == "EPIC_KINGDOM") do
	if IsGuideActive() then
		FollowGuide()
	else
		GS_GenerateDrag(653, 141, 620, 650) -- Move the Camera
		Wait (12)
		GS_GenerateClick(507, 405) --(782, 516)

		Wait(8)
		
		-- click Claim Button
		--if OptionalClickByPath("*.panel.captureButton") then
		if OptionalClickByPath("*.panel.captureButton") then
			print ("Clicked Claim Button")
		else
			print ("Claim Button Not found!")
		end
		break
	end
end

Wait (10)

-- Click the continue Button in RESULTS State
while (GetCurrentState() == "RESULTS") do
	if OptionalClickByPath("*.rewardsScreen.continueButton") then
		print ("Clicked Continue Button")
		break
	else
		print ("Continue Button Not found!")
		break
	end
	
end

Wait (12)

-- Click the Close Button
--if OptionalClickByPath("*.header.closeButton") then
if OptionalClickByPath("*.header.closeButton") then
	print ("Clicked Close Button")
	
else
	print ("close Button Not found!")
end
-- Land Claim #2 ENDS


-- Position Camera
Wait(5)
-- Move the Camera to random space, so that we can click the GotoKingdom button and bring it to Focus
GS_GenerateDrag(653, 141, 620,650) 
Wait(8) -- Wait for the Camera to settle down

-- Go to My Kingdom     

if OptionalClickByPath("*.hud.gotoMyKingdomButton") then
	print ("Clicked gotoMyKingdomButton  Button")
else
	print ("gotoMyKingdomButton Not found!")
end

Wait(5)
GS_GenerateDrag(653, 141, 620,650) -- Move the Camera
Wait(10)


-- Land Claim # 3 STARTS
GS_GenerateClick(883, 555) -- Click Right Bottom Plinth

Wait(10)

-- Click Claim Button

if OptionalClickByPath("*.panel.captureButton") then
	print ("Clicked Claim Button")
else
	print ("Claim Button Not found!")
end
	
Wait(5)

if OptionalClickByPath("*.rewardsScreen.continueButton") then
	print ("Clicked Continue Button")
else
	print ("Continue Button Not found!")
end

-- Land claim #3 ENDS

Wait(10)

if OptionalClickByPath("*.header.closeButton") then
	print ("Clicked Close Button")
else
	print ("close Button Not found!")
end


Wait(5)
-- Move the Camera to random space, so that we can click the GotoKingdom button and bring it to Focus
GS_GenerateDrag(653, 141, 620,650) 

Wait(10) -- Wait for the Camera to settle down

-- Go to My Kingdom 

if OptionalClickByPath("*.hud.gotoMyKingdomButton") then
	print ("Clicked gotoMyKingdomButton  Button")
else
	print ("gotoMyKingdomButton Not found!")
end



Wait(10)

GS_GenerateDrag(653, 141, 620,650) -- Move the Camera
Wait(15)

GS_GenerateClick(800,600) -- Click Right Mid Plinth
Wait(5)

if OptionalClickByPath("*.captureButton") then
	print ("Clicked Claim Button")
else
	print ("Claim Button Not found!")
end


-- Click on disabled Claim button. Cannot use OptionalClick() since it returns false, since the button is disabled.
Wait(5)
GS_GenerateClick(1126, 738)
Wait(1)
GS_GenerateClick(1126, 738)
Wait(5)

-- Gems Collection
if OptionalClickByPath("*.doneButton") then
	print ("Clicked Claim Button")
else
	print ("Claim Button Not found!")
end




Wait(5)

GS_GenerateClick(330,332) -- Click on the LAST PLINTH again to CLAIM

Wait(5)

if OptionalClickByPath("*.captureButton") then
	print ("Clicked Claim Button")
else
	print ("Claim Button Not found!")
end



Wait(8)

if OptionalClickByPath("*.rewardsScreen.continueButton") then
	Pass = Pass + 1
	io.write("VP Crossed 1000 PASSED \n\n")     --- Write Output to File
else
	Fail=Fail+1
	io.write("VP Crossed 1000 FAILED \n\n")     --- Write Output to File
end



Wait(10)
while not (GetCurrentState() == "LEAGUES") do
	if IsGuideActive() then
		Wait(5)
		FollowGuide()
	else
		print ("Exiting ....")
		break
	end
end

Wait(10)
GS_TalkingHeadCheck("League", 1)
Wait(5)

-- Click Alliance Info button

if OptionalClickByPath("*.allianceCell.infoButton") then
	print ("Clicking Alliance Info button")
	Wait(5)
	if OptionalClickByPath("*.button0") then
		
	else
		GS_GenerateClick(986, 181) -- Clicking the position since the Button name is not reliable and hence it might miss.
		
	end
Pass = Pass + 1
io.write("Alliance  PASSED \n\n")     --- Write Output to File

else
	Fail = Fail + 1
	io.write("Alliance FAILED \n\n")     --- Write Output to File
end


-- Click Alliance Info button


Wait(25)
-- Join Alliance ENDS here
io.write("Count of Pass/Fail Test Cases ".."\tPassed : ",Pass,"\tFailed : ",Fail)     --- Write Output to File

io.write("Game Ended... @ Time : ", os.date(), "\n")

os.exit()