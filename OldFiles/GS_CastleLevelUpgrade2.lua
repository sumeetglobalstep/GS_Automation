--- Castle Level 2 Upgrade starts


function CastleLevelUpgrade2()

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
	
--- Castle Level 2 Upgrade starts
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
end