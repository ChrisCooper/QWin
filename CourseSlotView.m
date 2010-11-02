//
//  CourseSlotView.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-10-31.
//  Copyright 2010 Chris Cooper. All rights reserved.
//

#import "CourseSlotView.h"
#import "TimePeriod.h"


@implementation CourseSlotView

@synthesize section;

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
		[self setAlphaValue:0.4];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {	
	if (section != nil){
		[self drawSection:section inRect:dirtyRect];
	}
}

-(void)drawSection:(Section*)theSection inRect:(NSRect)rect{
	
	for (TimePeriod *timePeriod in [theSection timePeriods]){
		[self drawTime:[timePeriod dayAndTime] withDuration:[timePeriod duration] inRect:rect];
	}
}

-(void)drawTime:(NSDateComponents*)time withDuration:(NSDateComponents*)duration inRect:(NSRect)rect{
	NSInteger day = [time weekday];
	NSInteger hour = [time hour];
	NSInteger minute = [time minute];
	
	NSInteger durationHours = [duration hour];
	NSInteger durationMinutes  = [duration minute];
	
	
	CGFloat rowHeight = rect.size.height / 27; //27 rows in total
	CGFloat columnWidth = rect.size.width / 5; //5 columns in total
	
	NSInteger rowsDown = 2*(hour-8) + (minute/30);
	
	NSInteger left = columnWidth*(day-1);
	NSInteger height = durationHours*rowHeight*2 + durationMinutes/30*rowHeight;
	NSInteger top = rect.size.height - (rowsDown * rowHeight) - height;
	
	NSRect filledRect = NSMakeRect(left, top, columnWidth, height);
	[[NSColor colorWithDeviceRed:0.0f green:0.0f blue:1.0f alpha:1.0] set];
	NSRectFill(filledRect);
	
}

@end
