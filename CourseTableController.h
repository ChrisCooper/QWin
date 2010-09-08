//
//  CourseTableController.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-06.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface CourseTableController : NSObject <NSTableViewDataSource, NSTableViewDelegate> {
	IBOutlet NSTableView *table;
	IBOutlet NSTableColumn *keyColumn;
	IBOutlet NSTableColumn *titleColumn;
}

-(IBAction)refresh:(id)sender;

@property (nonatomic, retain) NSTableView *table;
@property (nonatomic, retain) NSTableColumn *keyColumn;
@property (nonatomic, retain) NSTableColumn *titleColumn;

@end
