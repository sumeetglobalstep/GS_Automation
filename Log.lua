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