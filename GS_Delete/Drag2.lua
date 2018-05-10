require "Media/GameData/Interactions/Util"
require "Media/GameData/Interactions/GlobalStepUtil"
require "Media/GameData/Interactions/Battle"


Wait(3)
while  GetCurrentState() ~= "EPIC_ALLIANCE" do
	if IsGuideActive() then
			GS_FollowGuide()
	else
		if GetCurrentState() =="RESULTS" then
			Wait(5)
			OptionalClickByPath("*.rewardsScreen.continueButton")
			print("Reward button visible")
			Wait(8)
			OptionalClickByPath("*.closeButton")
		else
			print("Inside Plinth View when Follow Guide is not active")
			x = 0.4
			y = 0.5
			print("Inside While Loop")
			CapturePlinth(x,y)
			Wait(3)
			if IsCaptureButtonVisible() then
				print("Inside IsCaptureButtonVisible if/else loop")
				Wait(2)
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
Wait(3)
if OptionalClickByPath("*.allianceCell.infoButton") then
	print ("Clicking Alliance Info button")
	Wait(5)
	if OptionalClickByPath("*.button0") then
		
	else
		GS_GenerateClick(986, 181) -- Clicking the position since the Button name is not reliable and hence it might miss.
		
	end
else
		print("Closed")
	
end