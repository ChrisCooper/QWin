//
//  ModelManager.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-05.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import "CourseModelManager.h"

static CourseModelManager *sharedInstance = nil;

@implementation CourseModelManager

@synthesize courses;

+ (CourseModelManager*)sharedInstance
{
    @synchronized(self)
    {
        if (sharedInstance == nil)
			sharedInstance = [[CourseModelManager alloc] init];
    }
    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;  // assignment and return on first allocation
        }
    }
    return nil; // on subsequent allocation attempts return nil
}

-(id)init{
	if (self = [super init]){
		courses = [[NSMutableDictionary alloc] init];
	}
	return self;
}

-(NSMutableDictionary*) getCourses{
	return courses;
}

-(void) addCourses:(NSArray*)newCourses{
	for (Course* course in newCourses){
		[self addCourse:course];
	}
}

-(void) addCourse:(Course*)course{
	NSString *key = [course getKey];
	if ([courses objectForKey:key] == nil){
		[courses setObject:course forKey:key];
	}
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain {
    return self;
}

- (NSUInteger)retainCount {
    return UINT_MAX;  // denotes an object that cannot be released
}

- (void)release {
    //do nothing
}

- (id)autorelease {
    return self;
}

@end
