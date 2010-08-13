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
	
	def detail(self):
		print "--------------------------"
		print "academicTerm: ", self.academicTerm
		print "subject: ", self.subject
		print "code: ", self.code
		print "section: ", self.section
		print "instructionType: ", self.instructionType
		print "slot: ", self.slot
		print "duration: ", self.duration
		print "monTime: ", self.monTime
		print "tuesTime: ", self.tuesTime
		print "wedTime: ", self.wedTime
		print "thursTime: ", self.thursTime
		print "friTime: ", self.friTime
		print "building: ", self.building
		print "room: ", self.room
		print "instructor: ", self.instructor
		print "comments: ", self.comments
		print "--------------"
		
#			def __str__(self):
#		string = self.academicTerm+", "+self.subject+" "+self.code+", "+self.section+", "+self.instructionType+", "+self.slot+", "+self.duration+", "+self.monTime+", "+self.tuesTime+", "+self.wedTime+", "+self.thursTime+", "+self.friTime+", "+self.building+", "+self.room+", "+self.instructor+", "+self.comments
#		return string


def getSoup():
	getActualResults = True
	
	if (getActualResults):
		print "Fetching raw course data..."
		dump =  urllib2.urlopen("http://130.15.242.24/TimeTableSearch.asp?viewAllRecords=TRUE")
		print "done!" 
	else:
		file = open("TimeTableSearch.asp.html", "r")
		dump = file.read()
		
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
	
	course.instructionType=getUniformEntry(tds[5])
	course.slot=getUniformEntry(tds[6])
	course.duration=getUniformEntry(tds[7])
	course.monTime=getUniformEntry(tds[8])
	course.tuesTime=getUniformEntry(tds[9])
	course.wedTime=getUniformEntry(tds[10])
	course.thursTime=getUniformEntry(tds[11])
	course.friTime=getUniformEntry(tds[12])
	course.building=getUniformEntry(tds[13])
	course.room=getUniformEntry(tds[14])
	course.instructor=getUniformEntry(tds[15])
	course.comments=getUniformEntry(tds[16])
	
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
	for i in range(len(rows)):
		course = getCourseEntryFromCourseRow(rows[i])
		courses.append(course)
		course.detail()

	print "done!"
	print ""
	print "Total course rows: ", len(courses)
	print "Total unique courses: unkown" 
	
	return courses	