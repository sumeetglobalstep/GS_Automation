hasCheckPoint = false
checkPointAcheived = {}
logFileExist = false
insertAtIndex = 0

function CreateLogFile()
	Filename = os.date()
	Filename = string.gsub(Filename, ":+", "")
	Filename = string.gsub(Filename, "%s+", "")
	Filename = "DOCUMENTS:ResultData_"..Filename..".txt"
	file = io.open(Filename, "w+")
	io.output(file)
	io.write("GAME INFO: "..GetGameInfo().."\n Game Start Time: "..os.date())
	logFileExist = true
end

function WriteLogsToFile(message)
	io.write("\n"..message)
end

function HasValue(logMessage)
    for index, value in ipairs(checkPointAcheived) do
		if value == logMessage then
			return true
        end
    end
	
    return false
end

function LogToFile(gameState, logMessage, result)
	if logFileExist == false then
		CreateLogFile()
	end
	if logMessage ~= '' then
		if HasValue(logMessage) == false then
			insertAtIndex = insertAtIndex + 1
			table.insert(checkPointAcheived, logMessage)
			WriteLogsToFile("\tGame State: "..gameState.."\tLog: "..logMessage.."\t Result: "..result )
		end	
	end
end