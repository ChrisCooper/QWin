//
//  ModelBuilder.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-05.
//  Copyright 2010 Qcumber Ldt. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Models.h"

#define JSON_FILE_NAME @"courses.json"


@interface ModelBuilder : NSObject {
	FILE *file;
	NSString *fileName;
}

-(NSString*) getJsonString;
-(void) loadModelsFromJson;
-(Course*) createCourseFromDictionary:(NSDictionary*)courseDict;

-(NSArray*) createSectionsFromSectionDicts:(NSArray*) sectionDicts;
-(Section*) createSectionFromSectionDict:(NSDictionary*)sectionDict;

-(NSArray*)createTimePeriodsFromTimePeriodDicts:(NSArray*)timePeriodDicts forSection:(Section*)section;

@end
