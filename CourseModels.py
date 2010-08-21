#For use by scraper
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


class Course:
	id = -1
	subject = ""
	code = ""
	credits = -1
	title = ""
	sections = []

class Section:
	id = -1
	letter = '$'
	type = "Typeless"
	coursePeriods = []

class CoursePeriod:
	id = -1
	timePeriod = None

class TimePeriod:
	startTime = None
	endTime = None
	