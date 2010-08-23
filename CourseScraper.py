import urllib2
from BeautifulSoup import BeautifulSoup
import re
import CourseModels

def getSoup():
	getActualResults = False
	
	if (getActualResults):
		print "Fetching raw course data..."
		dump =  urllib2.urlopen("http://130.15.242.24/TimeTableSearch.asp?viewAllRecords=TRUE")
		print "done!" 
	else:
		with open("Documents/ReducedTimeTableSearch.asp.html", "r") as file:
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

	course = CourseModels.CourseEntry()
	
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
