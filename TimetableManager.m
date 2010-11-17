//
//  UserCourseManager.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-11-17.
//  Copyright 2010 Chris Cooper. All rights reserved.
//

#import "TimetableManager.h"


@implementation TimetableManager

@synthesize sections;

-(id)init{
	if (self = [super init]){
		sections = [[NSMutableArray alloc] init];
	}
	return self;
}

-(NSMutableArray*) getSections{
	return sections;
}

-(void) addSection:(Section*)section{

//	NSString *key = [section getKey];
	//if ([sections objectForKey:key] == nil){
	//	[sections setObject:section forKey:key];
	//}
}

@end
