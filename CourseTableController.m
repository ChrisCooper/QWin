//
//  CourseTableController.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-06.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import "CourseTableController.h"
#import "CourseModelManager.h"
#import "Course.h"


@implementation CourseTableController

@synthesize table;
@synthesize keyColumn;
@synthesize titleColumn;

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
	NSInteger tableRows = [[[CourseModelManager sharedInstance] getCourses] count];
	return tableRows;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
	
	Course *course = [[[[CourseModelManager sharedInstance] getCourses] allValues] objectAtIndex:row];
	
	if (tableColumn == keyColumn){
		return [course getKey];
	} else if (tableColumn == titleColumn){
		return @"Title goes right here";
	}
	return @"";
}

-(IBAction)refresh:(id)sender{
	[table reloadData];
}

@end
