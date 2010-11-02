//
//  TimePeriod.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-05.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Section.h"


@interface TimePeriod : NSObject {
	NSDateComponents *dayAndTime;
	NSDateComponents *duration;
	NSMutableArray *sections;
}

@property (nonatomic, retain) NSDateComponents *dayAndTime;
@property (nonatomic, retain) NSDateComponents *duration;

-(NSString*)getDescription;
-(void) logDescription;
-(void) setDurationWithHours:(NSInteger)hours andMinutes:(NSInteger)minutes;
-(void) setWeekDay:(NSInteger)weekDay andHour:(NSInteger)hour andMinute:(NSInteger)minute;
-(void) addSection:(Section*)section;
-(NSDateComponents*)dayAndTime;
-(NSDateComponents*)duration;

@end
