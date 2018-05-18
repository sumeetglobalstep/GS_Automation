hasCheckPoint = false
checkPointAcheived = {}
logFileExist = false
insertAtIndex = 0

function InitialiseOutputFile()
	Filename = os.date()
	Filename = string.gsub(Filename, ":+", "")
	Filename = string.gsub(Filename, "%s+", "")
	Filename = "DOCUMENTS:ResultData_"..Filename..".txt"
	file = io.open(Filename, "w+")
	io.output(file)
	io.write("GAME INFO:"..GetGameInfo())
	logFileExist = true
end

function WriteLogsToFile(message, result)
	io.write("RESULT: "..result.." "..message)
end

function IsCheckPointAchieved(gameState, checkPointName, result)
	if logFileExist == false then
		InitialiseOutputFile()
	end
	if checkPointName ~= '' then
		for index, value in ipairs(checkPointAcheived) do
			if value == checkPointName then
				return false
			else
				insertAtIndex = insertAtIndex + 1
				table.insert(checkPointAcheived, insertAtIndex, checkPointName)
				WriteLogsToFile("Game State: "..gameState.."Log: "..checkPointName.."", result)
				Wait(1.0)
				return true
			end	
		end
	end
	return false
end