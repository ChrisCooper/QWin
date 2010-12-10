#ModelBuilder
from CourseScraper import *
from CourseModels import *
from ArtSciScraper import *
import json
import os

def createCourseModels():
	"""
	Creates a JSON file of all the courses in the ArtSci calendar and timetable website.
	"""
	#Get course entries and imcomplete course models from sources
	courseEntries = getCourseEntries()
	courseInformationList = getArtSciCourses()
	
	print "Creating course model..."
	
	courses = {}
	timePeriods = {}
	
	#Go through entries, constructing sections from each
	for entry in courseEntries:
		key = entry.getKey()
		
		#Get the correct, unique course from the table
		if key not in courses:
			newCourse = courseFromEntry(entry)
			courses[key] = newCourse
		course = courses[key]

		section = sectionFromEntry(entry)
		
		course.sections.append(section)
		
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

	for key in courses:
		if key in courseInformationList:
			courseInformationList[key] = mergeCourses(courses[key], courseInformationList[key])
			
	courses = courseInformationList
	
	print "Done!\n"
	
	print "Writing JSON file..."
	
	filename = 'build/Debug/'
	dir = os.path.dirname(filename)
	if not os.path.exists(dir):
		os.makedirs(dir)
	
	with open('build/Debug/courses.json', mode='w') as file:
		file.write("[\n")
		courseKeys = courses.keys()
		for i in range(len(courseKeys)):
			if not i == 0:
				file.write(",\n")
			builtIn = CourseModels.convertToBuiltinType(courses[courseKeys[i]])
			
			for key in builtIn:
				if not (isinstance(builtIn[key], basestring) or isinstance(builtIn[key], list)):
					builtIn[key] = builtIn[key].contents[0]
			
			json.dump(builtIn, file, indent=2)

		file.write("\n]")
	
	print "Done!\n"
	
	#keys = courses.keys()
	#for key in keys:
	#	print courses[key]
	
	
def courseFromEntry(entry):
	"""
	Returns a Course model given a CourseEntry.
	"""
	newCourse = Course()
	newCourse.subject = entry.subject
	newCourse.code = entry.code
	return newCourse

def sectionFromEntry(entry):
	"""
	Returns a Section model given a CourseEntry.
	"""
	section = Section()		
	section.letter = entry.section
	section.type = entry.instructionType
	section.term = entry.academicTerm
	section.instructor = entry.instructor
	section.building = entry.building
	section.room = entry.room
	section.comments = entry.comments
	return section
	
createCourseModels()