//
//  CourseSlotView.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-10-31.
//  Copyright 2010 Chris Cooper. All rights reserved.
//

#import "CourseSlotView.h"
#import "TimePeriod.h"
#import "TimetableManager.h"


@implementation CourseSlotView

@synthesize section;
@synthesize color;

-(id)initWithFrame:(NSRect)frameRect{
	NSLog(@"inited with frame");
	self = [super initWithFrame:frameRect];
    if (self) {
        // Initialization code here.
		[self setColor:[NSColor blueColor]];
		[self setSection:nil];
		[self setAlphaValue:0.7];
    }
    return self;
}

- (id)initWithFrame:(NSRect)frame section:(Section*)_section color:(NSColor*)_color{
	NSLog(@"inited with frame, section, color");
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
		[self setColor:_color];
		[self setSection:_section];
		[self setAlphaValue:0.7];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {	
	if (section != nil && color != nil){
		for (TimePeriod *timePeriod in [section timePeriods]){
			[self drawTime:[timePeriod dayAndTime] withDuration:[timePeriod duration] andColor:color inRect:[self bounds]];
		}
	}
}

-(void)drawTime:(NSDateComponents*)time withDuration:(NSDateComponents*)duration andColor:(NSColor*)_color inRect:(NSRect)rect{
	NSInteger day = [time weekday];
	NSInteger hour = [time hour];
	NSInteger minute = [time minute];
	
	NSInteger durationHours = [duration hour];
	NSInteger durationMinutes  = [duration minute];
	
	
	CGFloat rowHeight = [self bounds].size.height / 27; //27 rows in total
	CGFloat columnWidth = [self bounds].size.width / 5; //5 columns in total
	
	NSInteger rowsDown = 2*(hour-8) + (minute/30);
	
	NSInteger left = columnWidth*(day-1);
	NSInteger height = durationHours*rowHeight*2 + durationMinutes/30*rowHeight;
	NSInteger top = [self bounds].size.height - (rowsDown * rowHeight) - height;
	
	NSRect filledRect = NSMakeRect(left, top, columnWidth, height);
	
	[color set];
	NSRectFill(filledRect);
}

@end
