import urllib2
from BeautifulSoup import BeautifulSoup
import re

class CourseEntry:
	academicTerm="no term"
	subject="no subject"
	code=""
	section="no section"
	instructionType="no instruction type"
	slot="no slot"
	duration="no duration"
	monTime=""
	tuesTime=""
	wedTime=""
	thursTime=""
	friTime=""
	building="no building"
	room="no room"
	instructor="no instructor"
	comments=""
	
	def detail(self,file):
		file.write("-----")
		file.write("\n")
		file.write("a: " + self.academicTerm)
		file.write("\n")
		file.write("su: " + self.subject)
		file.write("\n")
		file.write("code: "+ self.code)
		file.write("\n")
		file.write("se: "+ self.section)
		file.write("\n")
		file.write("i: "+ self.instructionType)
		file.write("\n")
		file.write("slot: "+ self.slot)
		file.write("\n")
		file.write("dur: "+ self.duration)
		file.write("\n")
		file.write("mon: "+ self.monTime)
		file.write("\n")
		file.write("tues: "+ self.tuesTime)
		file.write("\n")
		file.write("w: "+ self.wedTime)
		file.write("\n")
		file.write("thurs: "+ self.thursTime)
		file.write("\n")
		file.write("f: "+self.friTime)
		file.write("\n")
		file.write("b: "+ self.building)
		file.write("\n")
		file.write("r: "+ self.room)
		file.write("\n")
		file.write("prof: "+ self.instructor)
		file.write("\n")
		file.write("comm: "+ self.comments)
		file.write("\n")
		file.write("-----")
		file.write("\n")
		
#			def __str__(self):
#		string = self.academicTerm+", "+self.subject+" "+self.code+", "+self.section+", "+self.instructionType+", "+self.slot+", "+self.duration+", "+self.monTime+", "+self.tuesTime+", "+self.wedTime+", "+self.thursTime+", "+self.friTime+", "+self.building+", "+self.room+", "+self.instructor+", "+self.comments
#		return string


def getSoup():
	getActualResults = False
	
	if (getActualResults):
		print "Fetching raw course data..."
		dump =  urllib2.urlopen("http://130.15.242.24/TimeTableSearch.asp?viewAllRecords=TRUE")
		print "done!" 
	else:
		file = open("Documents/TimeTableSearch.asp.html", "r")
		dump = file.read()
		file.close()
		
	print "Cleaning up data..."
	soup = BeautifulSoup(dump)
	print "done!"
	return soup
	
def getCourseRows():
	soup = getSoup()
	print "Identifying courses..."
	rows = soup.findAll('tr', attrs={'id' : "searchResultsRow"})
	print "done!"
	return rows

def getCourseEntryFromCourseRow(row):

	course = CourseEntry()
	
	tds=row.findAll('td')
	
	course.academicTerm=tds[1].contents[0].strip()
	
	cell = tds[2]
	link = cell.find('a')
	course.subject=link.contents[0].strip()
	
	course.code=tds[3].contents[0].strip()
	
	rawSection = tds[4]
	if (len(rawSection.contents) != 0):
		course.section=rawSection.contents[0].strip()
	else:
		course.section = ""
	
	course.instructionType	= getUniformEntry(tds[5])
	course.slot				= getUniformEntry(tds[6])
	course.duration			= getUniformEntry(tds[7])
	course.monTime			= getUniformEntry(tds[8])
	course.tuesTime			= getUniformEntry(tds[9])
	course.wedTime			= getUniformEntry(tds[10])
	course.thursTime		= getUniformEntry(tds[11])
	course.friTime			= getUniformEntry(tds[12])
	course.building			= getUniformEntry(tds[13])
	course.room				= getUniformEntry(tds[14])
	course.instructor		= getUniformEntry(tds[15])
	course.comments			= getUniformEntry(tds[16])
	
	return course
	
def getUniformEntry(node):
	span = node.find('span')
	data = span.nextSibling
	if (data == None):
		return ""
	return data.strip()

def getCourseEntries():
	rows = getCourseRows()
	
	print "Extracting individual courses..."
	
	courses = []
	
	#uniqueCourses = {}
	
	for row in rows:
		course = getCourseEntryFromCourseRow(row)
		
		#if not uniqueCourses.has_key(course.subject + course.code):
		#	uniqueCourses[course.subject + course.code] = course
		
		courses.append(course)


	print "done!"
	print ""
	print "Total course rows: ", len(courses)
	#print "Total unique courses: ", len(uniqueCourses.keys())
	
	return courses	

def outputCourseEntries():
	courses = getCourseEntries()
	
	file = open("course_entries.data", "w")
	for course in courses:
		course.detail(file)
	
	file.close()
	
	
outputCourseEntries()