//
//  CourseSlotView.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-10-31.
//  Copyright 2010 Chris Cooper. All rights reserved.
//

#import "CourseSlotView.h"


@implementation CourseSlotView

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
		[self setAlphaValue:0.4];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
	CGFloat rowHeight = dirtyRect.size.height / 27; //27 rows in total
	CGFloat columnWidth = dirtyRect.size.width / 5; //5 columns in total
	
	NSLog(@"Drawing");
    NSRect testRect = NSMakeRect(0, rowHeight*5, columnWidth, rowHeight*6);
	[[NSColor colorWithDeviceRed:0.0f green:0.0f blue:1.0f alpha:1.0] set];
	NSRectFill(testRect);
}

-(void)drawDateComponents:(NSDateComponents*)components{
	
}

@end
