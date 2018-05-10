require "Media/GameData/Interactions/Util"
require "Media/GameData/Interactions/GlobalStepUtil"
require "Media/GameData/Interactions/Battle"



x = 0.568
y = 0.5


--[[
Wait(5)
GS_GenerateDrag(653, 141, 620,650)   --1st one,2nd one,3rd one
Wait(8)
GenerateClick(0.5,0.5)



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
]]--

function CapturePlinth(x,y)
Wait(3)
GS_GenerateDrag(653, 141, 620,648)
Wait(2)
OptionalClickByPath("*.hud.gotoMyKingdomButton")
Wait(5)
GS_GenerateDrag(653, 141, 620,648)
Wait(4)
GenerateClick(x,y)
end

function ClaimContinue()
	Wait(2)
	OptionalClickByPath("*.rewardsScreen.continueButton") 
	Wait(10)
	OptionalClickByPath("*.header.closeButton")
end

Wait(5)
	
		
	
while IsGuideActive~=true do
	CapturePlinth(x,y)
	Wait(5)

	if OptionalClickByPath("*.panel.captureButton") then
		Wait(5)
		if OptionalClickByPath("*.doneButton") then
			Wait(2)
			OptionalClickByPath("*.hud.gotoMyKingdomButton")
			CapturePlinth()
			Wait(1)
			OptionalClickByPath("*.panel.captureButton")
			print("Clicked Claimed buttom")
			Wait(8)
			ClaimContinue()
		else
			ClaimContinue()
		end
	else
		print("Capture Button not found")
		--OptionalClickByPath("*.hud.gotoMyKingdomButton")
		CapturePlinth(x+0.05,y+0.05)
		
	end
end 	
	
