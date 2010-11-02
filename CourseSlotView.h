//
//  CourseSlotView.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-10-31.
//  Copyright 2010 Chris Cooper. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Section.h"


@interface CourseSlotView : NSView {
	Section *section;
}

@property (nonatomic, retain) Section *section;

-(void)drawSection:(Section*)theSection inRect:(NSRect)rect;
-(void)drawTime:(NSDateComponents*)time withDuration:(NSDateComponents*)duration inRect:(NSRect)rect;

@end
