//
//  UserCourseManager.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-11-17.
//  Copyright 2010 Chris Cooper. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Models.h"


@interface TimetableManager : NSObject {
	NSMutableArray *sections;
}

@property (nonatomic, retain) NSMutableArray *sections;

-(NSMutableArray*) getSections;
-(void) addSection:(Section*)section;

@end
