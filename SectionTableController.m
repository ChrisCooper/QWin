//
//  SectionTableController.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-10-24.
//  Copyright 2010 Chris Cooper. All rights reserved.
//

#import "SectionTableController.h"


@implementation SectionTableController

@synthesize table;
@synthesize termColumn;
@synthesize typeColumn;
@synthesize letterColumn;
@synthesize buildingColumn;
@synthesize roomColumn;
@synthesize instructorColumn;
@synthesize timeColumn;
@synthesize infoController;
@synthesize course;

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
	NSInteger tableRows = [[course sections] count];
	return tableRows;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
	
	Section *section = [[course sections] objectAtIndex:row];
	
	if (tableColumn == termColumn){
		return  [section term];
	} else if (tableColumn == typeColumn){
		return [section type];
	} else if (tableColumn == letterColumn){
		return [section letter];
	} else if (tableColumn == buildingColumn){
		return [section building];
	} else if (tableColumn == roomColumn){
		return [section room];
	} else if (tableColumn == instructorColumn){
		return [section instructor];
	} else if (tableColumn == timeColumn){
		return [section getTimeDescription];
	}
	return @"";
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification{
	//NSInteger selectedIndex = [table selectedRow];
}

-(void) refresh{
	[table reloadData];
}


@end
