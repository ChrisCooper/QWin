//
//  UserCourseManager.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-11-17.
//  Copyright 2010 Chris Cooper. All rights reserved.
//

#import "TimetableManager.h"

static TimetableManager *sharedInstance = nil;

@implementation TimetableManager

@synthesize sections;

+ (TimetableManager*)sharedInstance
{
    @synchronized(self)
    {
        if (sharedInstance == nil)
			sharedInstance = [[TimetableManager alloc] init];
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
		sections = [[NSMutableArray alloc] init];
	}
	return self;
}

-(void) addSection:(Section*)section{
	if (![sections doesContain:section]){

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