//
//  ModelManager.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-05.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Models.h"


@interface CourseModelManager : NSObject {
	NSMutableDictionary *courses;
}

@property (nonatomic, retain) NSMutableDictionary *courses;

+ (CourseModelManager*)sharedInstance;

-(NSMutableDictionary*) getCourses;
-(void) addCourses:(NSArray*)newCourses;
-(void) addCourse:(Course*)course;

@end
