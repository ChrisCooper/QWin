//
//  SlotViewController.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-11-21.
//  Copyright 2010 Chris Cooper. All rights reserved.
//

#import "SlotViewController.h"
#import "CourseSlotView.h"


@implementation SlotViewController

@synthesize sectionSubviews;
@synthesize slotCanvas;

-(void)setSection:(Section*)section{
	NSLog(@"Setting controller section");
	[slotCanvas setSection:section];
	[slotCanvas setNeedsDisplay:YES];
}

-(void)addSection:(Section*)section{
	NSLog(@"Added section to controller");
	CGFloat red = (rand() % 255)/255.0;
	CGFloat green = (rand() % 255)/255.0;
	CGFloat blue = (rand() % 255)/255.0;
	NSColor *newColor = [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:0.7];
	
	CourseSlotView *newView = [[CourseSlotView alloc] initWithFrame:[slotCanvas bounds] section:section color:newColor];
	
	[slotCanvas addSubview:newView];
	[slotCanvas setNeedsDisplay:YES];
}

-(void)removeSection:(Section*)section{
	
}


@end
