require "Media/GameData/Interactions/Util"
require "Media/GameData/Interactions/GlobalStepUtil"
require "Media/GameData/Interactions/Battle"

function CapturePlinth(x,y)
print("Inside Capture Plinth")
Wait(3)
GS_GenerateDrag(653, 141, 620,648)
Wait(2)
OptionalClickByPath("*.hud.gotoMyKingdomButton")
Wait(5)
GS_GenerateDrag(653, 141, 620,648)
Wait(4)
print("Value of X",x,"Value of Y",y)
GenerateClick(x,y)
end
function CapturePlinthAgain(x,y)
Wait(1)
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
	Wait(8)
	OptionalClickByPath("*.rewardsScreen.continueButton") 
	Wait(10)
	OptionalClickByPath("*.header.closeButton")
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
	Wait(8)
	ClaimContinue()
end
Wait(3)

while IsGuideActive~=true do
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