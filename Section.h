//
//  Section.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-05.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Section : NSObject {
	NSString *idString;
	NSString *letter;
	NSString *building;
	NSString *term;
	NSString *room;
	NSString *comments;
	NSString *instructor;
	SectionType *type;
	NSArray *timePeriods;
	Course *course;
}


@end
