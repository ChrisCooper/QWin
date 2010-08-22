#ModelBuilder
from CourseScraper import *
from CourseModels import *

def createCourseModels():
	
	courseEntries = getCourseEntries()
	
	print "Creating course model..."
	
	courses = {}
	timePeriods = {}
	
	currentID = 1
	
	for entry in courseEntries:
		key = entry.getKey()
		
		if key not in courses:
			newCourse = Course()
			newCourse.id = currentID
			currentID += 1
			newCourse.subject = entry.subject
			newCourse.code = entry.code
			
			courses[key] = newCourse
			
		course = courses[key]

		section = Section()		
		
		course.sections.append(section)
		
		section.letter = entry.section
		section.type = entry.instructionType
		section.term = entry.academicTerm
		section.course = course
		
		times = entry.getTimes()
		
		for i in range(5):
			if not times[i].strip() == "":
				timePeriod = CourseModels.timePeriodFromStr(times[i], entry.duration, i)
				
				key = timePeriod.getKey()
				
				if key not in timePeriods:
					timePeriods[key] = timePeriod
				else:
					timePeriod = timePeriods[key]
				
				section.timePeriods.append(timePeriod)
				
	
	
	print "done!\n"
	
	keys = courses.keys()
	for key in keys:
		print courses[key]
		
createCourseModels()