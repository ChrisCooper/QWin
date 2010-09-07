//
//  Section.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-05.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Course.h"


@interface Section : NSObject {
	NSString *letter;
	NSString *building;
	NSString *term;
	NSString *room;
	NSString *comments;
	NSString *instructor;
	NSString *type;
	NSArray *timePeriods;
	Course *course;
}

-(void) logDescription;

@property (nonatomic, retain) NSString *letter;
@property (nonatomic, retain) NSString *building;
@property (nonatomic, retain) NSString *term;
@property (nonatomic, retain) NSString *room;
@property (nonatomic, retain) NSString *comments;
@property (nonatomic, retain) NSString *instructor;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSArray *timePeriods;
@property (nonatomic, retain) Course *course;

@end
