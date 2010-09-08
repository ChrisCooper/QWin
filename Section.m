//
//  Section.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-05.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import "Section.h"
#import "Logger.h"
#import "TimePeriod.h"


@implementation Section

@synthesize letter;
@synthesize building;
@synthesize term;
@synthesize room;
@synthesize comments;
@synthesize instructor;
@synthesize type;
@synthesize timePeriods;
@synthesize course;

-(void) logDescription{
	NSLog(@"\tSection:---->");
	NSLog(@"\t\t%@ %@", [Logger getString:[self type]], [Logger getString:[self letter]]);
	
	if (building != nil) {
		NSLog(@"\t\tIn %@%@",
			  [Logger getString:[self building]],
			  building != nil ?([@", in room " stringByAppendingString:[Logger getString:[self room]]]):@"");
	} else if (building != nil){
		NSLog(@"\t\tIn room: %@", [self room]);
	}
	
	if (instructor != nil) {
		NSLog(@"\t\tTaught by %@", [Logger getString:[self instructor]]);
	}
	
	if (term != nil) {
		NSLog(@"\t\tTaught in %@", [Logger getString:[self term]]);
	}

	NSLog(@"\t\t%@", [Logger getString:[self comments]]);
	
	if ([timePeriods count] != 0) {
		NSLog(@"\t\tTime periods:");
		for (TimePeriod *timePeriod in timePeriods){
			[timePeriod logDescription];
		}
	}
}

@end
