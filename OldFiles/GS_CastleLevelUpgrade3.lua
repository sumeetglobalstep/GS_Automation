function CastleLevelUpgrade3()

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
	Wait(8)

	if IsGuideActive() then
		FollowGuide()
	end	
Wait(10)

end
