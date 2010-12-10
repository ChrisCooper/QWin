//
//  SectionTableController.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-10-24.
//  Copyright 2010 Chris Cooper. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CourseInfoViewController.h"
#import "SlotViewController.h"



@interface SectionTableController : NSObject <NSTableViewDataSource, NSTableViewDelegate> {
	IBOutlet NSTableView *table;
	IBOutlet NSTableColumn *termColumn;
	IBOutlet NSTableColumn *typeColumn;
	IBOutlet NSTableColumn *letterColumn;
	IBOutlet NSTableColumn *buildingColumn;
	IBOutlet NSTableColumn *roomColumn;
	IBOutlet NSTableColumn *instructorColumn;
	IBOutlet NSTableColumn *timeColumn;
	
	IBOutlet CourseInfoViewController *infoController;
	
	Course *course;
	
	IBOutlet SlotViewController *slotcontroller;
}

@property (nonatomic, retain) NSTableView *table;

@property (nonatomic, retain) NSTableColumn *termColumn;
@property (nonatomic, retain) NSTableColumn *typeColumn;
@property (nonatomic, retain) NSTableColumn *letterColumn;
@property (nonatomic, retain) NSTableColumn *buildingColumn;
@property (nonatomic, retain) NSTableColumn *roomColumn;
@property (nonatomic, retain) NSTableColumn *instructorColumn;
@property (nonatomic, retain) NSTableColumn *timeColumn;
@property (nonatomic, retain) Course *course;

@property (nonatomic, retain) CourseInfoViewController *infoController;
@property (nonatomic, retain) SlotViewController *slotcontroller;

-(void) refreshTable;
-(void) capTableSelection;

-(IBAction)addCurrentSection:(id)sender;

@end
