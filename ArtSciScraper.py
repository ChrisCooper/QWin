import urllib2
from BeautifulSoup import BeautifulSoup
import re
import CourseModels

def getSoup():
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

