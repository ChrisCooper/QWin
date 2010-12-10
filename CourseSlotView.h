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
	NSColor *color;
}

@property (nonatomic, retain) Section *section;
@property (nonatomic, retain) NSColor *color;

- (id)initWithFrame:(NSRect)frame section:(Section*)_section color:(NSColor*)_color;

-(void)drawTime:(NSDateComponents*)time withDuration:(NSDateComponents*)duration andColor:(NSColor*)color inRect:(NSRect)rect;

@end
