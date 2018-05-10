-- Battle.lua
-- Author @ Tejas Chitale
-- All Battle related scripts are written here.

require "Media/GameData/Interactions/GlobalStepUtil"

-- Campaign #1 Battle #1 Function
function Campaign1Battle1()
	Wait(2)
	GS_TalkingHeadCheck("Scenario3",2)
	print("Directing troops into battle.....")
				
	--talking head
	GS_GenerateClick(35,489)
	Wait(2)
	GS_GenerateClick(35,489)
	Wait(2)
	
	--titan
	GS_GenerateClick(488,382) 	
	Wait(1)
	GS_GenerateClick(674,236) --Enemy Coordinates
	Wait(3)
	
	--for left side soldiers
	GS_GenerateClick(296,432) 
	Wait(1)	
	GS_GenerateClick(438,231) --Enemy Coordinates  
	
	--for centre  troops
	GS_GenerateClick(690,466)  
	Wait(1)
	GS_GenerateClick(438,231) --Enemy Coordinates
	Wait(3)
				
	 -- Right Side Troops
	GS_GenerateClick(991,446)
	Wait(1)
	GS_GenerateClick(899,326) --Enemy Coordinates
	Wait(4)
	
	-- Step 6 : - Battle....Battle completes, player should be eventually victorious.
	if OptionalClickByPath("*.ui.okButton.button") then
		print("Battle Completed :Passed")
	else
		print("Battle Not Completed :Failed")
	end
	
	-- Step 7 : - Victory Screen....Upon battle ending, player should be then directed back to the campaign screen and another Belec talking head
	Wait(48)
	
	GS_GenerateClick(50,94) --Talking head
	
	Wait(2)
	
	if OptionalClickByPath("*.ui.rewardsScreen.continueButton") then
		print("Scenario3 :Battle Completed Rewards Continue1 : Passed ")
	else
		print("Scenario3 :Battle Completed Rewards Continue1 : Failed")
	end
	
	Wait(5)

	if OptionalClickByPath("*.ui.xpScreen.continueButton") then
		print("Scenario3 :Battle Completed Rewards Continue2 : Passed ")
		return true	
	else
		print("Scenario3 :Battle Completed Rewards Continue2 : Failed")
		return false
	end
end
-- Campaign #1 Battle #1 Ends


-- Campaign #1 Battle #2 Function
function Campaign1Battle2()
	
	Wait(5)
	GS_GenerateClick(570,525)  --CENTRE TROOPS 	
	Wait(3)
	GS_GenerateClick(570,525)  --CENTRE TROOPS 	
	Wait(2)
	GS_GenerateClick(605,237)
	Wait(2)
	GS_GenerateClick(605,237) 
	Wait(3)
	
	--for TITANS
	GS_GenerateClick(410,476) 
	Wait(3)	
	GS_GenerateClick(429,225) 
	Wait(1)
	GS_GenerateClick(429,225) 
	
	--for LEFT  troops
	GS_GenerateClick(300,530) 
	Wait(1)
	GS_GenerateClick(665,245) 
	Wait(3)

	-- Right Side Troops
	GS_GenerateClick(942,548)
	Wait(3)
	GS_GenerateClick(836,243)
	Wait(4)
			
	-- Step 9 : - Battle....Battle completes, player should be eventually victorious.
	if OptionalClickByPath("*.ui.okButton.button") then
		print("Battle Completed : Passed")
	else
		print("Battle Not Completed : Failed")
	end
		
	-- Step 10 : - Victory Screen....Upon battle ending, player should be then directed back to the campaign screen and another Belec talking head
	Wait(55)
	GS_GenerateClick(50,94) --talking head
	
	Wait(5)
	if OptionalClickByPath("*.ui.rewardsScreen.continueButton") then
		print("Battle 2 :Battle Completed Rewards Continue1 : Passed ")
	else
		print("Battle 2:Battle Completed Rewards Continue1 : Failed")
	end
	
	Wait(15)

	if OptionalClickByPath("*.ui.xpScreen.continueButton") 	then
		print("Scenario3 :Battle Completed Rewards Continue2 : Passed ")
		return true	
	else
		print("Scenario3 :Battle Completed Rewards Continue2 : Failed")
		return false
	end
end	
-- Campaign #1 Battle #2 Ends

-- Campaign #1 Battle #3 Function
function Campaign1Battle3()

	print("Current State",GetCurrentState().."Current Lesson :",GetCurrentLessonName())
	Wait(3)

	--titan
	GS_GenerateClick(203,407) 	
	Wait(3)
	GS_GenerateClick(430, 277) --Enemy Coordinates
	Wait(3)
	
	--BACK troops
	GS_GenerateClick(654,565) 	
	Wait(3)
	GS_GenerateClick(744, 283) --Enemy Coordinates
	Wait(3)

	-- LEFT troops
	GS_GenerateClick(456,439) 	
	Wait(3)
	GS_GenerateClick(805, 281) --Enemy Coordinates
	Wait(3)

	--RIGHT TROOPS

	GS_GenerateClick(891,413) 	
	Wait(3)
	GS_GenerateClick(805, 281) --Enemy Coordinates
	Wait(3)

	if OptionalClickByPath("*.ui.okButton.button") then
		print("Battle Completed :Passed")
	else
		print("Battle Not Completed :Failed")
	end
	
	-- Step 7 : - Victory Screen....Upon battle ending, player should be then directed back to the campaign screen and another Belec talking head
	Wait(85)
	
	GS_GenerateClick(50,94) --talking head
	Wait(5)

	print("Battle 3 before Continue button")	
	if OptionalClickByPath("*.ui.rewardsScreen.continueButton") then
		print("Scenario3 :Battle Completed Rewards Continue1 : Passed ")
	else
		print("Scenario3 :Battle Completed Rewards Continue1 : Failed")
	end
	
	Wait(8)

	if OptionalClickByPath("*.ui.xpScreen.continueButton") then
		print("Scenario3 :Battle Completed Rewards Continue2 : Passed ")
	else
		print("Scenario3 :Battle Completed Rewards Continue2 : Failed")
	end
	
	Wait(15)
	
	if OptionalClickByPath("*.ui.okButton") then
		print("Scenario3 :Battle Completed Rewards Continue3 : Passed ")
		return true		
	else
		print("Scenario3 :Battle Completed Rewards Continue3 : Failed")
		return false
	end
end
-- Campaign #1 Battle #3 Ends