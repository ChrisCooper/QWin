import datetime

#dir

#For use by scraper
class CourseEntry:
	def __init__(self):
		self.academicTerm=""
		self.subject=""
		self.code=""
		self.section=""
		self.instructionType=""
		self.slot=""
		self.duration=""
		self.monTime=""
		self.tuesTime=""
		self.wedTime=""
		self.thursTime=""
		self.friTime=""
		self.building=""
		self.room=""
		self.instructor=""
		self.comments=""

			
	def getKey(self):
		return self.subject + self.code
	
	def getTimes(self):
		return [self.monTime,self.tuesTime,self.wedTime,self.thursTime,self.friTime]


class Course:
	def __init__(self):
		self.subject = ""
		self.code = ""
		self.credits = ""
		self.name = ""
		self.description = ""
		self.prereqs = ""
		self.coreqs = ""
		self.exclus = ""
		self.equivs = ""
		self.notes = ""
		self.format = ""
		self.sections = []
		
	def getKey(self):
		return self.subject + self.code
	
	def __str__(self):
		string = "--------------------\n" + self.subject+" "+self.code+ ", " +self.credits+"\n"
		string += self.name + "\n"
		string += self.description + "\n"
		for section in self.sections:
			string += "\t" + str(section) + "\n"
		return string

class Section:
	def __init__(self):
		self.id = -1
		self.letter = ""
		self.term = ""
		self.type = ""
		self.instructor = ""
		self.building = ""
		self.room = ""
		self.comments = ""
		self.timePeriods = []
	
	def __str__(self):
		string = self.type + ", Section " + self.letter + " " + self.term + "\n"
		if not self.instructor == "":
			string += "\tTaught by: " + self.instructor
		if not self.building == "":
			string += "\t in: " + self.building +" " + self.room 
		string += "\n"
		if not self.comments == "":
			string += "\t" + self.comments + "\n"
		for period in self.timePeriods:
			string += "\t" + str(period) + "\n"
		return string
		
days = ["Mon", "Tues", "Wed", "Thurs", "Fri",] 

class TimePeriod(datetime.time):
	def getKey(self):
		return str(self.dayOfWeek) + "_" + str(self.hour) + "_" + str(self.minute) + "_" + str(self.duration)
	
	def __str__(self):
		string = days[self.dayOfWeek]
		string += "\t" + str(self.hour) + ":" + str(self.minute) +" + "+str(self.duration)
		return string

def timePeriodFromStr(timeStr, duration, day):
	timeStr = timeStr.strip()
	hour = int((timeStr.strip())[:-2])
	minute = int((timeStr.strip())[-2:])
	timePeriod = TimePeriod(hour,minute)
	timePeriod.dayOfWeek = day
	timePeriod.duration = duration
	return timePeriod

def convertToBuiltinType(obj):
	d = {}
	if not isinstance(obj, TimePeriod):
		d.update(obj.__dict__)
	else:
		d["hour"] = obj.hour
		d["minute"] = obj.minute
		d["dayOfWeek"] = obj.dayOfWeek
		d["duration"] = obj.duration
	
	if isinstance(obj, Course):
		d["sections"] = []
		for section in obj.sections:
			d["sections"].append(convertToBuiltinType(section))
	
	if isinstance(obj, Section):
		d["timePeriods"] = []
		for period in obj.timePeriods:
			d["timePeriods"].append(convertToBuiltinType(period))
	return d

def mergeCourses(course, otherCourse):
	newCourse = Course()
	newCourse.subject = returnObjectWithContent(course.subject, otherCourse.subject)
	newCourse.code = returnObjectWithContent(course.code, otherCourse.code)
	newCourse.credits = returnObjectWithContent(course.credits, otherCourse.credits)
	newCourse.name = returnObjectWithContent(course.name, otherCourse.name)
	newCourse.description = returnObjectWithContent(course.description, otherCourse.description)
	newCourse.prereqs = returnObjectWithContent(course.prereqs, otherCourse.prereqs)
	newCourse.coreqs = returnObjectWithContent(course.coreqs, otherCourse.coreqs)
	newCourse.exclus = returnObjectWithContent(course.exclus, otherCourse.exclus)
	newCourse.equivs = returnObjectWithContent(course.equivs, otherCourse.equivs)
	newCourse.notes = returnObjectWithContent(course.notes, otherCourse.notes)
	newCourse.format = returnObjectWithContent(course.format, otherCourse.format)
	newCourse.sections = returnObjectWithContent(course.sections, otherCourse.sections)
	return newCourse

def returnObjectWithContent(firstContent, secondContent):
	if ((not firstContent == None) and (not len(firstContent) == 0)):
		return firstContent
	return secondContent

