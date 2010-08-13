//
//  InstructionPeriod.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-08-09.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface InstructionPeriod : NSObject {
	NSDateComponents *_duration;
	NSDateComponents *_time;
	Semester _semester; //Fall, winter
	InstructionType
}

@end
