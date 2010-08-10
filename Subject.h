//
//  Subject.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-08-09.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Subject : NSObject {
	NSString *_abbreviation;
	NSString *_fullName;
	NSMutableDictionary *_courses;	//Course
}

@end
