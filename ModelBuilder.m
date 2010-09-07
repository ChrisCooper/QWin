//
//  ModelBuilder.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-05.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import "ModelBuilder.h"
#import "JSON/JSON.h"

#define JSON_FILENAME @"courses.json"

//JSON Course key strings
#define JSON_CODE_KEY @"code"
#define JSON_ID_KEY @"id"
#define JSON_SUBJECT_KEY @"subject"
#define JSON_CREDITS_KEY @"credits"
#define JSON_NAME_KEY @"name"
#define JSON_DESCRIPTION_KEY @"description"
#define JSON_REQUISITES_KEY @"requisites"
#define JSON_NOTES_KEY @"notes"
#define JSON_FORMAT_KEY @"format"
#define JSON_SECTIONS_KEY @"sections"

//JSON Course key strings
#define JSON_BUILDING_KEY @"building"
#define JSON_TERM_KEY @"term"
#define JSON_ROOM_KEY @"room"
#define JSON_TIME_PERIODS_KEY @"timePeriods"
#define JSON_COMMENTS_KEY @"comments"
#define JSON_LETTER_KEY @"letter"
#define JSON_INSTRUCTOR_KEY @"instructor"
#define JSON_TYPE_KEY @"type"

@implementation ModelBuilder

-(NSString*) getJsonString{
	NSError *error = nil;
	NSStringEncoding encoding = 0;
	NSString *result = [NSString stringWithContentsOfFile:JSON_FILENAME usedEncoding:&encoding error:&error];
	if (error != nil){
		NSLog(@"Error parsing JSON file: \"%@\"", error);
	}
	return result;
}

-(void) loadModelsFromJson{
	//Load the JSON string
	NSLog(@"Loading JSON file");
	NSString *jsonString = [self getJsonString];
	NSLog(@"Length of JSON string: %d", [jsonString length]);

	// Create SBJSON object to parse JSON
	SBJsonParser *parser = [[SBJsonParser alloc] init];
    
	// Parse the JSON string into an NSArray of courses in NSDictionarys
	NSArray *courses = [parser objectWithString:jsonString error:nil];
	
	//Create a new array of Course models
	NSMutableArray *courseModels = [[NSMutableArray alloc] initWithCapacity:[courses count]];
	
	Course *newCourse = nil;
	
	for (NSDictionary *courseDict in courses){
		
		newCourse = [self createCourseFromDictionary:courseDict];
		
		//Add the new course to the array of Course models
		[courseModels addObject:newCourse];
		[newCourse logDescription];
	
	}
}

-(Course*) createCourseFromDictionary:(NSDictionary*)courseDict{
	
	//Get properties for the Course
	NSString *subject = [courseDict objectForKey:JSON_SUBJECT_KEY];
	NSString *code = [courseDict objectForKey:JSON_CODE_KEY];
	
	NSArray *sectionDicts = [courseDict objectForKey:JSON_SECTIONS_KEY];
	NSArray *sections = [self createSectionsFromSectionDicts:sectionDicts];
	
	
	//Add properties to the Course model
	Course* newCourse = [[Course alloc] init];
	[newCourse setCode:code];
	[newCourse setSubject:subject];
	
	[newCourse setSections:sections];
	
	return newCourse;
}

-(NSArray*) createSectionsFromSectionDicts:(NSArray*) sectionDicts{
	NSMutableArray *sections = [[NSMutableArray alloc] initWithCapacity:[sectionDicts count]];
	
	//Create and add individual sections
	for (NSDictionary *sectionDict in sectionDicts) {
		[sections addObject:[self createSectionFromSectionDict:sectionDict]];
	}
	
	return sections;
}

-(Section*) createSectionFromSectionDict:(NSDictionary*)sectionDict{
	Section *section = [[Section alloc] init];
	
	NSString *building = [sectionDict objectForKey:JSON_BUILDING_KEY];
	NSString *term = [sectionDict objectForKey:JSON_TERM_KEY];
	NSString *room = [sectionDict objectForKey:JSON_ROOM_KEY];
	NSString *comments = [sectionDict objectForKey:JSON_COMMENTS_KEY];
	NSString *letter = [sectionDict objectForKey:JSON_LETTER_KEY];
	NSString *instructor = [sectionDict objectForKey:JSON_INSTRUCTOR_KEY];
	NSString *type = [sectionDict objectForKey:JSON_TYPE_KEY];
	
	NSArray *timePeriodDicts = [sectionDict objectForKey:JSON_TIME_PERIODS_KEY];
	NSArray *timePeriods = [self createTimePeriodsFromTimePeriodDicts:timePeriodDicts];
	
	[section setBuilding:building];
	[section setTerm:term];
	[section setRoom:room];
	[section setComments:comments];
	[section setLetter:letter];
	[section setInstructor:instructor];
	[section setType:type];
	[section setTimePeriods:timePeriods];

	return section;
}

-(NSArray*)createTimePeriodsFromTimePeriodDicts:(NSArray*)timePeriodDicts{
	NSMutableArray* timePeriods = [[NSMutableArray alloc] init];
	return timePeriods;
}

-(TimePeriod*)createTimePeriodFromTimePeriodDict:(NSDictionary*)timePeriodDict{
	TimePeriod * newTimePeriod = [[TimePeriod alloc] init];
	return newTimePeriod;
}


@end
