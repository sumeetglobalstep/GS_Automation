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

Filename = os.date()
Filename = string.gsub(Filename, ":+", "") 
Filename = string.gsub(Filename, "%s+", "")

Filename = "DOCUMENTS:ResultData_"..Filename..".txt"
file = io.open(Filename,"w+")
io.output(file)
io.write("Game Started... @ Time : ", os.date(), "")

Wait(9)
GenerateClick(0.5,0.5)
Wait(2)
OptionalClickByPath("*.skip.skipButton")


-- Campaign #1 Battle #1 BLOCK STARTS
io.write("\n\nBattle 1 Started @ Time : ", os.date(), "") --- Write Output to File

GS_TalkingHeadCheck("Battle1", 2)
while not (GetCurrentState()=="DYNAMIC_DEPLOYMENT") do  
	GS_FollowGuide("Battle1")
end

Wait(5)
if Campaign1Battle1() then
	Pass = Pass + 1
	io.write("\nBattle 1 PASSED ")     --- Write Output to File
	io.write("\nBattle 1 Finished @ Time : ", os.date(), "\n\n")
else
	Fail = Fail + 1
	io.write("\nBattle 1 FAILED ")     --- Write Output to File
end
-- Campaign #1 Battle #1 BLOCK ENDS

-- Campaign #1 Battle #2 BLOCK STARTS
io.write("Battle 2 Started @ Time : ", os.date(), "\n")
GS_TalkingHeadCheck("Battle2", 1)
while not (GetCurrentState()=="DYNAMIC_DEPLOYMENT") do 
	Wait(1)
	GS_FollowGuide("Battle2")
end

if Campaign1Battle2() then
	Pass = Pass + 1
	io.write("Battle 2 PASSED") --- Write Output to File
	io.write("\nBattle 2 Finished @ Time : ", os.date())
else
	Fail = Fail + 1
	io.write("\nBattle 2 FAILED ") --- Write Output to File
end

Wait(5)
GS_TalkingHeadCheck("Battle2", 2)  --talking heads
-- Campaign #1 Battle #2 BLOCK ENDS

-- Campaign #1 Battle #3 BLOCK STARTS
io.write("\n\nBattle 3 Stared @ Time : ", os.date(), "")     --- Write Output to File
while not(GetCurrentState()=="DYNAMIC_DEPLOYMENT")do 
	Wait(1)
	GS_FollowGuide("Battle3")
end

Wait(5)
OptionalClickByPath("*.ui.multiSelectButton.button")
Wait(2)

if Campaign1Battle3() then
	Pass = Pass + 1
	print("\nBattle3 passed")
	io.write("\nBattle 3 PASSED")     --- Write Output to File
	io.write("\nBattle 3 Finished @ Time : ", os.date(), "\n")
else
	Fail = Fail + 1
	print("Battle3 failed")
	io.write("\nBattle 3 FAILED")     --- Write Output to File
	
end
-- Campaign #1 Battle #3 BLOCK ENDS

Wait(5)

while not (GetCurrentLessonName()=="FIRST_NAME_ENTRY") do 
	Wait(2)
	GS_FollowGuide("First_Name_Entry")
end

-- Enter USERNAME 
-- for now using default value ADMIN, since we don't have a way to invoke the Keyboard and press keys.
Wait(5)
OptionalClickByPath("*.ui.textEntry.doneButton")

Wait(5)
GS_TalkingHeadCheck("CastleUpgrade",2) --Noble name Talkerhead

-- Till Upgrade button	
while not (OptionalClickByPath("*.upgradeButton")) do 
	GS_FollowGuide("CastleUpgrade")
end

Wait(5)
OptionalClickByPath("*.upgradeButton")

Wait(2)
OptionalClickByPath("*.upgradeButton") --Skip button in upgrade

Wait(10)
GS_TalkingHeadCheck("Armory Upgrade",2) 
Wait(2)
while not(OptionalClickByPath("*.ui.okButton.button")) do 
	if IsGuideActive() then
		FollowGuide()
	else
		Wait(5)
		GS_TalkingHeadCheck("Scenario2TestCase1",2)
		break
	end
end
	
Wait(5)
	
--- Castle Level 2 Upgrade 1 starts
OptionalClickByPath("*.zoomButton") -- Zoom button 
Wait(3)
OptionalClickByPath("*.doneButton")-- Enter button

Wait(3)
OptionalClickByPath("*.requiredA.button")

Wait(3)
OptionalClickByPath("*.buildingInspector.panel.upgradeButton")

Wait(3)
OptionalClickByPath("*.ui.confirmation.upgradeButton") -- Skip button

Wait(3)
OptionalClickByPath("*.ui.confirmation.doneButton")  -- Skip button

-- Castle Level 2 Upgrade Completed Upgrade 1 completed
GS_TalkingHeadCheck("Castle Level 3",2)
Wait(10)

while not OptionalClickByPath("*.unitUpgrade.upgradeButton") do 
	GS_FollowGuide("Castle Level 3")
end


GS_TalkingHeadCheck("Armory upgrade ENDS", 2)
GS_GenerateClick(114, 521)
Wait(3)

OptionalClickByPath("*.unitUpgrade.upgradeButton")
Wait(3)
OptionalClickByPath("*.closeButton")-- Enter button
-- Armory upgrade ENDS
	
Wait(3)
---Upgrade 2 starts
OptionalClickByPath("*.zoomButton") -- Zoom button
Wait(3)
OptionalClickByPath("*.doneButton") -- Enter button

Wait(3)
GS_GenerateClick(1241,561)
Wait(3)
OptionalClickByPath("*.buildingInspector.panel.upgradeButton")
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
--Upgrade 2 ends

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
Wait(3)
---Upgrade 3 ends 

if GS_CastleLevel3Upgrade() then
	Pass=Pass+1
	io.write("\nCastle Level 3 Upgrade PASSED \n\n")     --- Write Output to File
else
	Fail=Fail+1
	io.write("Castle Level 3 Upgrade FAILED \n\n")     --- Write Output to File
end
-- Castle Level3 Upgrade ENDS

Wait(10)

GS_TalkingHeadCheck("Scenario2TestCase1",4)
	
Wait(5)

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
	OptionalClickByPath("*.rewardsScreen.continueButton")
	break
end

Wait (12)

-- Click the Close Button
OptionalClickByPath("*.header.closeButton") 

-- Land Claim #2 ENDS
-- Position Camera
Wait(5)
-- Move the Camera to random space, so that we can click the GotoKingdom button and bring it to Focus
GS_GenerateDrag(653, 141, 620,650) 
Wait(8) -- Wait for the Camera to settle down

-- Go to My Kingdom     
OptionalClickByPath("*.hud.gotoMyKingdomButton")

Wait(5)
GS_GenerateDrag(653, 141, 620,650) -- Move the Camera
Wait(10)


-- Land Claim # 3 STARTS
GS_GenerateClick(883, 555) -- Click Right Bottom Plinth

Wait(10)

-- Click Claim Button
OptionalClickByPath("*.panel.captureButton")
	
Wait(5)

OptionalClickByPath("*.rewardsScreen.continueButton") 
-- Land claim #3 ENDS

Wait(10)
OptionalClickByPath("*.header.closeButton")


Wait(5)
-- Move the Camera to random space, so that we can click the GotoKingdom button and bring it to Focus
GS_GenerateDrag(653, 141, 620,650) 

Wait(10) -- Wait for the Camera to settle down

-- Go to My Kingdom 
OptionalClickByPath("*.hud.gotoMyKingdomButton")

Wait(10)

GS_GenerateDrag(653, 141, 620,650) -- Move the Camera
Wait(15)

GS_GenerateClick(800,600) -- Click Right Mid Plinth
Wait(5)

OptionalClickByPath("*.captureButton") 	

-- Click on disabled Claim button. Cannot use OptionalClick() since it returns false, since the button is disabled.
Wait(5)
GS_GenerateClick(1126, 738)
Wait(1)
GS_GenerateClick(1126, 738)
Wait(5)

-- Gems Collection
OptionalClickByPath("*.doneButton") 
Wait(5)

GS_GenerateClick(330,332) -- Click on the LAST PLINTH again to CLAIM
Wait(5)

OptionalClickByPath("*.captureButton") 
	
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
io.write("\n\nGame Ended... @ Time : ", os.date(), "\n")

os.exit()