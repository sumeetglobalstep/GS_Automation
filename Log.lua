hasCheckPoint = false
checkPointAcheived = {"dummyValue"}
logFileExist = false

function InitialiseOutputFile()
	print("Inside InitialiseOutputFile")
	Filename = os.date()
	Filename = string.gsub(Filename, ":+", "") 
	Filename = string.gsub(Filename, "%s+", "")
	Filename = "DOCUMENTS:ResultData_"..Filename..".txt"
	file = io.open(Filename,"w+")
	io.output(file)
	logFileExist = true
end

function WriteLogsToFile(message,path,result)
		--io.write(" Current State :\t", GetCurrentState()," Lesson Name : ", GetCurrentLessonName() ," Lesson Step Name : ", GetCurrentLessonStep(), " " , message , " ", path, " RESULT : ",result,"\n")
			io.write("\nPASS MESSAGE: ",message)
end

function IsCheckPointAchieved()

	local lessonName = GetCurrentLessonName()
	
	if logFileExist == false then
		InitialiseOutputFile()
	end
	print("Lesson Name", lessonName)
	found = false
	if lessonName ~= '' then
		for i,checkPoint in ipairs(checkPointAcheived) do
			--io.write("\nCheckPoint ",checkPoint)
			if checkPoint:find(lessonName) then
				found = true
				return false
			end	
		end		
		if found == false then
			table.insert(checkPointAcheived,lessonName)
			WriteLogsToFile(""..lessonName.." completed","","PASS")
			Wait(1.0)
			return true
		end
	end
	return false
end
