require "Media/GameData/Interactions/Util"
require "Media/GameData/Interactions/GlobalStepUtil"
require "Media/GameData/Interactions/Battle"


Wait(3)
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


--[[

[505.49] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] =================================================================================
[505.49] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] Top-most UI Entity in movie Media/UI/global-container.gfx at position (1103, 729): 
[505.49] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] Entity: search com.nm.dot.components::TabButton
[505.49] UiManager.cpp(156): [UI][Terse] - [AS3][INFO]   Path: null.root1.tab-container.swf.instance756.tabContainer.tabBar.instance777.search
[505.93] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] =================================================================================
[505.93] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] Top-most UI Entity in movie Media/UI/global-container.gfx at position (1103, 729): 
[505.93] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] Entity: search com.nm.dot.components::TabButton
[505.93] UiManager.cpp(156): [UI][Terse] - [AS3][INFO]   Path: null.root1.tab-container.swf.instance756.tabContainer.tabBar.instance777.search
[506.49] NmgSvcsAnalytics.cpp(1468): [Metrics][Verbose] - Flush success: Result: [true,true,true,true,true,true,true,true,true,true,true,true,true,true]


three liness
[534.19] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] =================================================================================
[534.19] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] Top-most UI Entity in movie Media/UI/global-container.gfx at position (1197, 290): 
[534.19] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] Entity: infoButton ButtonNav_48
[534.19] UiManager.cpp(156): [UI][Terse] - [AS3][INFO]   Path: null.root1.tab-container.swf.instance756.tabContainer.pageContainer.instance837.instance838.ui.table.instance842.instance843.allianceCell.infoButton


join button
[563.13] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] =================================================================================
[563.13] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] Top-most UI Entity in movie Media/UI/global-container.gfx at position (945, 173): 
[563.13] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] Entity: button0 SubButton_56
[563.13] UiManager.cpp(156): [UI][Terse] - [AS3][INFO]   Path: null.root1.tab-container.swf.instance849.instance850.button0


position 3rd battle
[DEBUG] GameEvent received BATTLE_HUD_ELEMENT_CHANGED
[456.89] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] =================================================================================
[456.89] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] Top-most UI Entity in movie Media/UI/global-container.gfx at position (612, 339): 
[456.89] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] Entity not found!
[457.33] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] =================================================================================
[457.33] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] Top-most UI Entity in movie Media/UI/global-container.gfx at position (612, 339): 
[457.33] UiManager.cpp(156): [UI][Terse] - [AS3][INFO] Entity not found!


]]--




