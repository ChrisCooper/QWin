//
//  Course.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-08-09.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Subject.h"


@interface Course : NSObject {
	NSString *_name;
	NSInteger _code;
	NSInteger _numberOfQuarterCredits;
	Subject *_subject;
	NSMutableArray *_prerequesites; //Course
	NSMutableArray *_corequesites;	//Course
	NSMutableArray *_timeslots;		//Timeslot

}

@end
