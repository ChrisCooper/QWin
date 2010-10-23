import urllib2
from BeautifulSoup import BeautifulSoup
import re
import CourseModels		

def getSoup():
	"""
	Returns the beautiful soup structure from the subject listing website.
	"""
	getActualResults = False
	
	if (getActualResults):
		print "Fetching raw course data..."
		dump =  urllib2.urlopen("http://www.queensu.ca/calendars/artsci/Courses_of_Instruction__by_Subject_.html")
		print "done!" 
	else:
		with open("Documents/ArtSci Courses of Instruction by Subject.html", "r") as file:
			dump = file.read()
		
	print "Cleaning up data..."
	soup = BeautifulSoup(dump)
	print "done!"
	return soup
	
def getSubjectLinks():
	"""
	Returns a list of URLs fir the individual subject websites.
	"""
	soup = getSoup()
	print "Identifying subjects..."
	
	table = soup.find("table", id="_ctl0__ctl0_pageContent")
	linksHTML = table.find("p")
	
	listOfA = linksHTML.findAll("a")
	
	links = []

	prefix = "http://www.queensu.ca/calendars/artsci/"
	
	for a in listOfA:
		links.append(prefix+a.get("href"))
	
	print "done!"
	
	return links

def getArtSciCourses():
	"""
	Returns a dictionary of Course models by scraping all subject pages.
	"""
	getActualResults = True
	links = []
	
	if (getActualResults):
		links = getSubjectLinks()
	else:
		with open("Documents/Pathology Courses.html") as file:
			dump = file.read()
	
	print "Getting courses' info for each subject..."
	
	courses = {}
	newCourse = None
	
	print len(links), "subjects to scrape:"
	linkNumber = 1
	
	#Visit all links
	for link in links:
		pageCourses = getCoursesFromLink(link)
		
		#check for duplicates
		for course in pageCourses:
			if course.getKey() in courses:
				newCourse = CourseModels.mergeCourses(course, courses[course.getKey()])
			else:
				newCourse = course
			
			courses[newCourse.getKey()] = newCourse
			print "Adding newCourse key:", newCourse.getKey()
			#print "newCourse:", newCourse
			
			
		
		print "Finished subject", linkNumber
		linkNumber += 1
	
	print "Done!"
	
	return courses
	
def getCoursesFromLink(link):
	"""
	Returns a list of Course models from an individual subject website, given its URL.
	"""
	#print "Getting courses from: " + link

	dump =  urllib2.urlopen(link)
	soup = BeautifulSoup(dump)
	courses = []
		
	courseDivs = soup.findAll("div", attrs={"class":"item-container"})
		
	for div in courseDivs:
		code = div.find("span", attrs={"class":"course-code"})
		if code == None:
			continue
		if len(code.contents) == 0:
			continue
			
		#print "Code: " + str(code)
		
		code = code.contents[0]
		code = str(code).strip()

		codePattern = re.compile(r'''
			([A-Z]{1,4})  # First one to four capitals are subject code (e.g. 'CISC')
			.*          # Anything can be a seperator
			(\d{3})     # Course number is 3 digits (e.g. '121')
			[^0-9]*     # Optional separator
			(\d.\d)?    # Number of credits (e.g. '1.0')
			''', re.VERBOSE)
		
		results = codePattern.search(code).groups()                   
		
		subject = results[0]
		number = results[1]
		if not results[2] == None:
			credits = results[2]
		
		name = div.find("span", attrs={"class":"course-title"})
		if len(name.contents) > 0:
			name = name.contents[0]
			name = str(name).strip()
		else:
			name = ''
		
		description = div.find("span", attrs={"class":"course-desc"})
		if len(description.contents) > 0:
			if description.contents[0].find("div"):
				description = description.contents[0].find("div")
			else:
				description = description.contents[0]
				description = str(description).strip()
		else:
			description = ''
			
		if not isinstance(description, basestring):
			description = ''
		
			
		course = CourseModels.Course()
		course.code = number
		course.subject = subject
		course.credits = credits
		course.name = name
		course.description = description
		
		course.title = div.find("span", attrs={"class":"course-title"}).contents[0]
		desc = div.find("span", attrs={"class":"course-desc"})
		if not desc.contents == None and not len(desc.contents) == 0:
			course.description = desc.contents[0]

		courses.append(course)
		
		#print course
			
	return courses
		