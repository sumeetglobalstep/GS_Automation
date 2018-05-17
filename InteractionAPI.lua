-- Interacts with CPP functions

exitGame = false
errorMessage = ""

function FindButtonAndClick(path, IsClickable)
	if FindElementByPath(path) then
		if IsClickable then
			FindAndClickByPath(path)
		end
		return true
	else
		return false
	end
end

function FindBuilding(bName)
  local buildings = GetProfileNode("buildings")
  for i, building in ipairs(buildings) do
    if building.type:find(bName) then
      return building
    end
  end
end

function IsHaltScriptRequested() --Stop Script on request of game or an error
	if HasNetworkError() then
		exitGame = true
		errorMessage = "Network Issue"
	end
	if IsExitRequested() then
		return true
	elseif exitGame then
		--TODO: add log message
		print ("Script HALTED due to "..errorMessage.." Current STATE: "..GetCurrentState())
		return true
	else
		return false
	end
end

function IsCriticalPopUp() -- Handles Critical PopUps , Interupt Priority is higher than FTUE
	WriteLogsToFile("","","")
	if	FindButtonAndClick("*.ui.textEntry.doneButton", true) then
		return true
	elseif FindButtonAndClick("*.ui.critical.doneButton", true) then
		return true
	elseif FindButtonAndClick("*.ui.confirmation.doneButton", true) then
		return true
	else
		return false
	end
end

function IsPopUpActive() -- Handles PopUps , when FTUE not available
	WriteLogsToFile("","","")
	if FindElementByPath("*ui.ok.doneButton") then   --Done/Ok Button
		FindAndClickByPath("*ui.ok.doneButton")
		if FindElementByPath("*header.closeButton") then
			FindAndClickByPath("*header.closeButton")
		end
		return true
	end
	
	return false
end




function InitialiseOutputFile()
	print("Inside InitialiseOutputFile")
	Filename = os.date()
	Filename = string.gsub(Filename, ":+", "") 
	Filename = string.gsub(Filename, "%s+", "")
	Filename = "DOCUMENTS:ResultData_"..Filename..".txt"
	file = io.open(Filename,"w+")
	io.output(file)
	
end

function WriteLogsToFile(message,path,result)
	io.write(" Current State :\t", GetCurrentState()," Lesson Name : ", GetCurrentLessonName() ," Lesson Step Name : ", GetCurrentLessonStep(), " " , message , " ", path, " RESULT : ",result,"\n")
end