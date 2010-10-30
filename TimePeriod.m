//
//  TimePeriod.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-05.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import "TimePeriod.h"
#import "Logger.h"


@implementation TimePeriod

- (id) init{
	if (self = [super init]){
		duration = [[NSDateComponents alloc] init];
		dayAndTime = [[NSDateComponents alloc] init];
		sections = [[NSMutableArray array] retain];
	}
	return self;
}

-(NSString*) getDescription {
	NSInteger day = [dayAndTime weekday];
	NSInteger hour = [dayAndTime hour];
	NSInteger minute = [dayAndTime minute];
	NSInteger durationHour = [duration hour];
	NSInteger durationMinute = [duration minute];
	
	NSString *description = [NSString stringWithFormat:@"Day: %d Time: %2d:%02d Duration: %2d:%02d",day,hour,minute,durationHour,durationMinute];
	return description;
}

-(void) logDescription{
	NSLog(@"\t\t\tTime Period:---->");
	NSLog(@"\t\t\t\tNot yet implemented.");
}

-(void) setDurationWithHours:(NSInteger)hours andMinutes:(NSInteger)minutes {
	[duration setHour:hours];
	[duration setMinute:minutes];
}

-(void) setWeekDay:(NSInteger)weekDay andHour:(NSInteger)hour andMinute:(NSInteger)minute {
	[dayAndTime setWeekday:weekDay];
	[dayAndTime setHour:hour];
	[dayAndTime setMinute:minute];
}

-(void) addSection:(Section*)section{
	if (![sections containsObject:section]){
		[sections addObject:section];
	}
}

- (void) dealloc{
	[duration release];
	[dayAndTime release];
	[sections release];
	[super dealloc];
}

@end
