--LoadProfilePreset("")
print("Get Current State",GetCurrentState())
print("Get Current Lesson Name",GetCurrentLessonName())
print("Get Current Lesson Step",GetCurrentLessonStep())


function GS_TalkingHeadCheck(TestCaseName,NumberOfTalkingHead)
	print("Inside GS_TalkingHeadCheck :: GlobalStepUtil ", TestCaseName)
	for i=0,NumberOfTalkingHead,1 do
		Wait(2)
		if FindElementByPath("*.talkingHead.animationContainer.textContent.body","","") then
			GenerateClick(0.5,0.5)
			print("Tejas")
			print("Talking Head Number",i)
		else
			print("Talkinh Head Number",i,"  not present")
			print("Tejas Else")
		end
	end
end
--while(FindElementByPath("*.ui.rewardsScreen.continueButton")==nil) do
--			Wait(1)
--end
Wait(5)
function myerrorhandler( err )
   print( "ERROR:", err )
end

function Elements()

	FindAndClickByPath("*tejas")

end

Elements()
--status = xpcall( Elements, myerrorhandler)
--print( status)

