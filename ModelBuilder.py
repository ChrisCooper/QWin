#ModelBuilder
from CourseScraper import *
from CourseModels import *

def createCourseModels():
	courseEntries = getCourseEntries()
	
	courses = {}
	
	currentID = 1
	
	for entry in courseEntries:
		key = entry.subject + entry.code
		
		if key not in courses:
			newCourse = Course()
			newCourse.id = currentID
			newCourse.subject = entry.subject
			newCourse.code = entry.code
			
			
			courses[key] = newCourse
			currentID += 1
			
			print key
			
		
		
createCourseModels()