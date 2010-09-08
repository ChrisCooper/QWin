//
//  Course.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-05.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import "Course.h"
#import "Logger.h"
#import "Section.h"


@implementation Course

@synthesize subject;
@synthesize code;
@synthesize courseKey;
@synthesize sections;

-(NSString*)getKey{
	return courseKey;
}

-(void) logDescription{
	NSLog(@"________________________");
	NSLog(@"Course: %@ %@", [Logger getString:[self subject]], [Logger getString:[self code]]);
	NSLog(@"Code: %@", [Logger getString:[self getKey]]);
	
	if ([sections count] != 0) {
		NSLog(@"Sections:");
		for (Section *section in sections){
			[section logDescription];
		}
	}
	
	NSLog(@"------------------------");
}

@end
