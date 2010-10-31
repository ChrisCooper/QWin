//
//  CourseTableController.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-06.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CourseInfoViewController.h"


@interface CourseTableController : NSObject <NSTableViewDataSource, NSTableViewDelegate> {
	IBOutlet NSTableView *table;
	IBOutlet NSTableColumn *keyColumn;
	IBOutlet NSTableColumn *titleColumn;
	
	IBOutlet CourseInfoViewController *infoController;
}

@property (nonatomic, retain) NSTableView *table;
@property (nonatomic, retain) NSTableColumn *keyColumn;
@property (nonatomic, retain) NSTableColumn *titleColumn;

@property (nonatomic, retain) CourseInfoViewController *infoController;

-(void)refresh:(id)sender;
- (void) receivedRefreshNotification:(NSNotification*)notification;


@end
