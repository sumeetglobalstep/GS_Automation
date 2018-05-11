-- Battle.lua
-- Author @ Tejas Chitale
-- All Battle related scripts are written here.

require "Media/GameData/Interactions/GlobalStepUtil"

-- Campaign #1 Battle #1 Function
function OldCampaign1Battle1()
	print("Inside BAttle 1")
	Wait(2)
	--GS_TalkingHeadCheck("Scenario3",2)
	print("Directing troops into battle.....")
	GS_GenerateClick(35,489)
	Wait(1)
	GS_GenerateClick(35,489)
	Wait(1)
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
	--Wait(48)
	--Wait(20)
	--WaitForState("RESULTS")
	--WaitForState("RESULTS")
	GS_WaitForState(20,"RESULTS")
print("Guide ",IsGuideActive())

	Wait(8)
	GS_GenerateClick(35,489) --Talking head


	Wait(1)
	
print("Guide Before 1st Continue button ",IsGuideActive())
	if OptionalClickByPath("*.ui.rewardsScreen.continueButton") then
		print("Scenario3 :Battle Completed Rewards Continue1 : Passed ")
	else
	print("Scenario3 :Battle Completed Rewards Continue1 : Failed")
	end

print("Guide After 1st Continue button ",IsGuideActive())
Wait(4)

	print("Guide BEfore 2st Continue button ",IsGuideActive())
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
function OldCampaign1Battle2()
	print("Inside Battle 2")
	Wait(5)
	

GS_GenerateClick(217, 505) 
Wait(2)
GS_GenerateClick(617, 238) 
Wait(3)


GS_GenerateClick(881, 461) 
Wait(3)	
GS_GenerateClick(848, 241) 
Wait(3)



GS_GenerateClick(1144,520)  --CENTRE TROOPS 	
Wait(3)
GS_GenerateClick(1118, 247) 
Wait(3)

GS_GenerateClick(1277, 496)
Wait(3)
GS_GenerateClick(1118, 247) 
Wait(3)

	-- Step 9 : - Battle....Battle completes, player should be eventually victorious.
	if OptionalClickByPath("*.ui.okButton.button") then
		print("Battle Completed : Passed")
	else
		print("Battle Not Completed : Failed")
	end
		
	-- Step 10 : - Victory Screen....Upon battle ending, player should be then directed back to the campaign screen and another Belec talking head
	--Wait(55)
	GS_WaitForState(30,"RESULTS")
	Wait(8)
	GS_GenerateClick(50,94) --talking head
	Wait(3)
	
	if OptionalClickByPath("*.ui.rewardsScreen.continueButton") then
		print("Battle 2 :Battle Completed Rewards Continue1 : Passed ")
	else
		print("Battle 2:Battle Completed Rewards Continue1 : Failed")
	end
	
	
	Wait(10)

	if OptionalClickByPath("*.ui.xpScreen.continueButton") 	then
		print("Scenario3 :Battle Completed Rewards Continue2 : Passed ")
		Wait(5)
		return true	
	else
		print("Scenario3 :Battle Completed Rewards Continue2 : Failed")
		return false
	end
end	
-- Campaign #1 Battle #2 Ends

-- Campaign #1 Battle #3 Function
function OldCampaign1Battle3()

	print("Current State",GetCurrentState().."Current Lesson :",GetCurrentLessonName())
	Wait(7)
--ui.multiSelectButton.button
	
--	GS_GenerateClick(77, 682)--multi select button 
	
	--Wait(2)
	--GS_GenerateClick(77, 682)
	--Wait(2)
	--OptionalClickByPath("*.multiSelectButton.button")
	
	--OptionalClickByPath("*.multiSelectButton.button")
	--titan
--	Wait(2)
	--GenerateClick(0.7,0.4)
	--[[
	Wait(4)
	
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
]]--
--	if OptionalClickByPath("*.ui.okButton.button") then
	--	print("Battle Completed :Passed")
	--else
	--	print("Battle Not Completed :Failed")
	--end
	
	-- Step 7 : - Victory Screen....Upon battle ending, player should be then directed back to the campaign screen and another Belec talking head
	--Wait(85)

--ui.multiSelectButton.button
FindAndClickByPath("*.ui.multiSelectButton.button")
Wait(2)
FindAndClickByPath("*.ui.multiSelectButton.button")
Wait(1)
GenerateClick(612, 339)
Wait(1)
FindAndClickByPath("*.ui.okButton.button")


	GS_WaitForState(75,"RESULTS")
	Wait(4)
	GS_GenerateClick(50,94) --talking head
	Wait(2)
	
	--Wait(7)
	FindAndClickByPath("*.ui.rewardsScreen.continueButton")
	print("Battle 3 before Continue button")	
	--if OptionalClickByPath("*.ui.rewardsScreen.continueButton") then
		--print("Scenario3 :Battle Completed Rewards Continue1 : Passed ")
	--else
		--print("Scenario3 :Battle Completed Rewards Continue1 : Failed")
	--end
	
	--Wait(8)

	--if OptionalClickByPath("*.ui.xpScreen.continueButton") then
		--print("Scenario3 :Battle Completed Rewards Continue2 : Passed ")
	--else
		--print("Scenario3 :Battle Completed Rewards Continue2 : Failed")
	--end
	
	--WaitForState("REWARDS")
	Wait(2)
	FindAndClickByPath("*.ui.xpScreen.continueButton")
	Wait(8)
	
	if OptionalClickByPath("*.ui.okButton") then
		print("Scenario3 :Battle Completed Rewards Continue3 : Passed ")
		Wait(5)
		return true		
	else
		print("Scenario3 :Battle Completed Rewards Continue3 : Failed")
		return false
	end
end
-- Campaign #1 Battle #3 Ends

function Campaign1Battle1()
Wait(7)
if FindElementByPath("*.talkingHead.animationContainer.textContent.body") then
FindAndClickByPath("*.talkingHead.animationContainer.textContent.body")
end
Wait(1)	
GS_GenerateClick(635, 439)
Wait(1)
GS_GenerateClick(635, 439)

Wait(2)

GS_GenerateClick(987, 436)
Wait(1)
GS_GenerateClick(987, 250)

Wait(1)

GS_GenerateClick(672, 433)
Wait(0.8)
GS_GenerateClick(672, 350)

Wait(1)
GS_GenerateClick(328, 440)
Wait(0.8)
GS_GenerateClick(328, 325)

Wait(1)

GS_GenerateClick(987, 436)
Wait(0.8)
GS_GenerateClick(987, 300)


if FindElementByPath("*.talkingHead.animationContainer.textContent.body") then
FindAndClickByPath("*.talkingHead.animationContainer.textContent.body")
end

FindAndClickByPath("*.ui.okButton.button")

GS_WaitForState(20,"RESULTS")

Wait(8)
GS_GenerateClick(35,489) --Talking head

Wait(1)

if OptionalClickByPath("*.ui.rewardsScreen.continueButton") then
	print("Scenario3 :Battle Completed Rewards Continue1 : Passed ")
else
	print("Scenario3 :Battle Completed Rewards Continue1 : Failed")
end

Wait(4)

if OptionalClickByPath("*.ui.xpScreen.continueButton") then
	print("Scenario3 :Battle Completed Rewards Continue2 : Passed ")
	return true	
else
	print("Scenario3 :Battle Completed Rewards Continue2 : Failed")
	return false
end


end

function Campaign1Battle2()

Wait(8)

for i=0,4,1 do
	if FindElementByPath("*.talkingHead.animationContainer.textContent.body") then
		Wait(1)
		FindAndClickByPath("*.talkingHead.animationContainer.textContent.body")
	end
end

GS_GenerateClick(636, 462)
Wait(0.5)
GS_GenerateDrag(636, 462,636, 350)

Wait(1.5)

if FindElementByPath("*.talkingHead.animationContainer.textContent.body") then
	Wait(0.5)
	FindAndClickByPath("*.talkingHead.animationContainer.textContent.body")
end

GS_GenerateClick(400, 481)
Wait(1)
GS_GenerateClick(400, 300)


if FindElementByPath("*.talkingHead.animationContainer.textContent.body") then
	Wait(0.5)
	FindAndClickByPath("*.talkingHead.animationContainer.textContent.body")
end

Wait(1)

GS_GenerateClick(198, 515)
Wait(1)
GS_GenerateClick(198, 400)

if FindElementByPath("*.talkingHead.animationContainer.textContent.body") then
	Wait(0.5)
	FindAndClickByPath("*.talkingHead.animationContainer.textContent.body")
end
Wait(1)
GS_GenerateClick(1034, 494)
Wait(0.8)
GS_GenerateClick(1034, 400)
Wait(1)

FindAndClickByPath("*.ui.okButton.button")
GS_WaitForState(30,"RESULTS")

Wait(8)
GS_GenerateClick(50,94) --talking head
Wait(1.5)
	
if OptionalClickByPath("*.ui.rewardsScreen.continueButton") then
		print("Battle 2 :Battle Completed Rewards Continue1 : Passed ")
	else
		print("Battle 2:Battle Completed Rewards Continue1 : Failed")
	end
	
	
	Wait(10)

if OptionalClickByPath("*.ui.xpScreen.continueButton") 	then
	print("Scenario3 :Battle Completed Rewards Continue2 : Passed ")
	--Wait(5)
	return true	
else
	print("Scenario3 :Battle Completed Rewards Continue2 : Failed")
	return false
end
end

function Campaign1Battle3()
Wait(7)
	FindAndClickByPath("*.ui.multiSelectButton.button")
	Wait(0.5)
	FindAndClickByPath("*.ui.multiSelectButton.button")
	GS_GenerateClick(627, 341)
	Wait(1)
	GS_GenerateClick(627, 341)
	FindAndClickByPath("*.ui.okButton.button")
	
	GS_WaitForState(75,"RESULTS")
	Wait(4)
	GS_GenerateClick(50,94) --talking head
	while IsGuideActive() do
		GS_FollowGuide()
	end
	
--[[	Wait(2)
	FindAndClickByPath("*.instance3357.ui.okButton")
	Wait(8)
]]--
Wait(8)	
	if OptionalClickByPath("*.ui.okButton") then
		print("Scenario3 :Battle Completed Rewards Continue3 : Passed ")
		Wait(5)
		return true		
	else
		print("Scenario3 :Battle Completed Rewards Continue3 : Failed")
		return false
	end
end

