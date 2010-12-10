//
//  SlotViewController.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-11-21.
//  Copyright 2010 Chris Cooper. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Models.h"
#import "CourseSlotView.h"

@interface SlotViewController : NSObject {
	NSMutableArray *sectionSubviews;
	IBOutlet CourseSlotView *slotCanvas;
}

@property (nonatomic, retain) NSMutableArray *sectionSubviews;
@property (nonatomic, retain) CourseSlotView *slotCanvas;

-(void)setSection:(Section*)section;
-(void)addSection:(Section*)section;
-(void)removeSection:(Section*)section;

@end
