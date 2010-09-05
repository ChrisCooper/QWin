//
//  TimePeriod.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-05.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface TimePeriod : NSObject {
	NSDateComponents *dayAndTime;
	NSDateComponents *duration;
	NSArray *sections;
}

@end
