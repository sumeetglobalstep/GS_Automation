
require "Media/GameData/Interactions/GlobalStepUtil"
require "Media/GameData/Interactions/Util"
require "Media/GameData/Interactions/GlobalStepUtil"
require "Media/GameData/Interactions/Battle"

function Campaign1Battle1()
Wait(7)
if FindElementByPath("*.talkingHead.animationContainer.textContent.body") then
FindAndClickByPath("*.talkingHead.animationContainer.textContent.body")
end
Wait(1)	
GS_GenerateClick(635, 439)
Wait(1)
GS_GenerateClick(635, 439)

Wait(0.8)

GS_GenerateClick(987, 436)
Wait(1)
GS_GenerateClick(987, 300)

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

end

function Campaign1Battle2()

Wait(7)
for i=0,4,1 do
	if FindElementByPath("*.talkingHead.animationContainer.textContent.body") then
		Wait(1)
		FindAndClickByPath("*.talkingHead.animationContainer.textContent.body")
	end
end

GS_GenerateClick(636, 462)
Wait(0.5)
GS_GenerateDrag(636, 462,636, 350)

--[[
if FindElementByPath("*.talkingHead.animationContainer.textContent.body") then
Wait(0.5)
FindAndClickByPath("*.talkingHead.animationContainer.textContent.body")
end
]]--
Wait(1)

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
end

function Campaign1Battle3()
Wait(5)
	FindAndClickByPath("*.ui.multiSelectButton.button")
	Wait(0.5)
	FindAndClickByPath("*.ui.multiSelectButton.button")
	GS_GenerateClick(627, 341)
	Wait(1)
	GS_GenerateClick(627, 341)
	FindAndClickByPath("*.ui.okButton.button")

end