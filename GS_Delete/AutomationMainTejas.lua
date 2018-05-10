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
BattleCount = 1
Filename = os.date()
Filename = string.gsub(Filename, ":+", "") 
Filename = string.gsub(Filename, "%s+", "")
Filename = "DOCUMENTS:ResultData_"..Filename..".txt"

file=io.open(Filename,".txt","w")
file:write("GAME STARTED... @ Time : ", os.date(), "")
--GS_WriteResultToFile("Game Started ..",file)
Wait(9)
GenerateClick(0.5,0.5)
Wait(2)
--FindAndClickByPath("*.skip.skipButton")
OptionalClickByPath("*.skip.skipButton")
FIRST_NAME_ENTRY =false
Wait(5)
while  GetCurrentState() ~= "EPIC_KINGDOM" do  
print("BattleCount",BattleCount)
	--if IsGuideActive() and not (OptionalClickByPath("*.ui.textEntry.doneButton")  or GetCurrentLessonName()=="FIRST_NAME_ENTRY") then
	if IsGuideActive() then
		if GetCurrentLessonName()=="FIRST_NAME_ENTRY" and FIRST_NAME_ENTRY == false then
			print("Inside CommandShowNamePopup")
			--Wait(5)
			Wait(2)
			FindAndClickByPath("*.talkingHead.animationContainer.textContent.body")
			--GenerateClick(0.1,0.2)
			Wait(2)
			FindAndClickByPath("*.ui.textEntry.doneButton")
			--OptionalClickByPath("*.ui.textEntry.doneButton")
			--Wait(1)
			GS_FollowGuide()
			FIRST_NAME_ENTRY=true
		else
			GS_FollowGuide()
		end	
	elseif BattleCount == 1 and IsGuideActive() ~= true then
		if Campaign1Battle1() then
			Pass = Pass + 1
			Wait(3)
			GS_WriteResultToFile("Battle1 Passed",file)
	--		io.write("\nBattle 1 PASSED ")     --- Write Output to File
	--		io.write("\nBattle 1 Finished @ Time : ", os.date(), "\n\n")
			BattleCount = BattleCount + 1
		else
			Fail = Fail + 1
			GS_WriteResultToFile("Battle1 Failed",file)
			BattleCount = BattleCount + 1
		end
	elseif BattleCount == 2 and IsGuideActive()~= true  then
		if Campaign1Battle2() then
			Pass = Pass + 1
			--io.write("Battle 2 PASSED") --- Write Output to File
			--io.write("\nBattle 2 Finished @ Time : ", os.date())
			GS_WriteResultToFile("Battle2 Passed",file)
			BattleCount = BattleCount + 1
			Wait(3)
		else
			BattleCount = BattleCount + 1
			Fail = Fail + 1
			--io.write("\nBattle 2 FAILED ") --- Write Output to File
			GS_WriteResultToFile("Battle2 Failed",file)
			BattleCount = BattleCount + 1
		end
		Wait(5)
	elseif BattleCount == 3 and IsGuideActive() ~= true then
		if Campaign1Battle3() then
			Pass = Pass + 1
			print("\nBattle3 passed")
			--io.write("\nBattle 3 PASSED")     --- Write Output to File
			--io.write("\nBattle 3 Finished @ Time : ", os.date(),"\n")
			GS_WriteResultToFile("Battle3 Passed",file)
			BattleCount = BattleCount + 1
		else
			Fail = Fail + 1
			print("Battle3 failed")
			--io.write("\nBattle 3 FAILED")     --- Write Output to File
			GS_WriteResultToFile("Battle3 Failed",file)
			BattleCount = BattleCount + 1
		end
else 
		print("Out of While Loop")
		Wait(2)
		FindAndClickByPath("*.zoomButton")
		--OptionalClickByPath("*.zoomButton") -- Zoom button	
		--Wait(3)
		--OptionalClickByPath("*.doneButton") -- Enter button
		Wait(1)
		FindAndClickByPath("*.doneButton")
		--Wait(2)
		--OptionalClickByPath("*.upgradeButton") --Skip button in upgrade
		Wait(1)
		FindAndClickByPath("*.upgradeButton")
		Wait(2)
		GenerateClick(0.3,0.1)
		Wait(1)
		while IsGuideActive() do
			GS_FollowGuide()
		end
			GS_CastleUpgrade1()
		Wait(5)
		while IsGuideActive() do
			GS_FollowGuide()
		end
			--OptionalClickByPath("*.upgradeButton")
		FindAndClickByPath("*.upgradeButton")	
			--OptionalClickByPath("*.closeButton")
			FindAndClickByPath("*.closeButton")
			Wait(1)		
			GS_CastleUpgrade2()
			Wait(1)
			GS_CastleLevel3Upgrade()
			break
			end
end
Wait(8)
--[[
while  GetCurrentState() ~= "LEAGUES" do
	if IsGuideActive() then
			GS_FollowGuide()
	else
		if GetCurrentState() =="RESULTS" then
			--Wait(5)
			--Wait(3)
			--OptionalClickByPath("*.rewardsScreen.continueButton")
			
			FindAndClickByPath("*.ui.rewardsScreen.continueButton")
			print("Reward button visible")
			--Wait(5)
			--OptionalClickByPath("*.closeButton")
			FindAndClickByPath("*.closeButton")
	
		else
			print("Inside Plinth View when Follow Guide is not active")
			x = 0.4
			y = 0.5
			print("Inside While Loop")
			CapturePlinth(x,y)
			Wait(5)
			if IsCaptureButtonVisible() then
				print("Inside IsCaptureButtonVisible if/else loop")
				Wait(5)
				if OptionalClickByPath("*.ui.confirmation.doneButton") then
					print("Inside if of *.doneButton")
					ClaimBlocked()
				else
					print("Inside else of *.doneButton")
					ClaimEnabled()
				end
			else
				for i=0.05,1,0.05 do
					print("Inside For Loop")
					CapturePlinthAgain(x+i,y+i)
					Wait(2)
				if IsCaptureButtonVisible()then
					print("PLINTH Found")
					Wait(5)
					if OptionalClickByPath("*.ui.confirmation.doneButton") then
						ClaimBlocked(x+i,y+i)
					else
						ClaimEnabled()
					end
					break
				else
					print("Plinth not Clicked")
				end
			end
		end
		end
	end
end
]]--
--drag3
while  GetCurrentState() ~= "LEAGUES" do
	if IsGuideActive() then
			GS_FollowGuide()
	else
		if GetCurrentState() =="RESULTS" then
			Wait(5)
			--OptionalClickByPath("*.rewardsScreen.continueButton")
			print("Inside if GetCurrentState() ==RESULTS ")
			FindAndClickByPath("*.rewardsScreen.continueButton")
			Wait(15)
			print("Reward button visible")
			if FindElementByPath("*.closeButton") then
				print("Inside if GetCurrentState() ==RESULTS  FindElementByPath(*.closeButton)")
				FindAndClickByPath("*.closeButton")
			else
				print("Close button not found")
			end
		else
			print("Result state not found else")
			x = 0.4
			y = 0.5
			print("Inside While Loop")
			CapturePlinth(x,y)
			--Wait(3)
			Wait(1)
			if IsCaptureButtonVisible() then
				print("Inside IsCaptureButtonVisible if/else loop")
				--Wait(2)
				if OptionalClickByPath("*.ui.confirmation.doneButton") then
					print("Inside if of *.doneButton")
					ClaimBlocked()
				else
					print("Inside else of *.doneButton")
					ClaimEnabled()
				end
			else
				for i=0.05,1,0.05 do
					print("Inside For Loop")
					CapturePlinthAgain(x+i,y+i)
					Wait(2)
				if IsCaptureButtonVisible()then
					print("PLINTH Found")
					Wait(2)
					if OptionalClickByPath("*.ui.confirmation.doneButton") then
						ClaimBlocked(x+i,y+i)
					else
						ClaimEnabled()
					end
					break
				else
					print("Plinth not Clicked")
				end
			end
		end
		end
	end
end

	
	