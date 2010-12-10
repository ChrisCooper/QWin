//
//  SectionTableController.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-10-24.
//  Copyright 2010 Chris Cooper. All rights reserved.
//

#import "SectionTableController.h"
#import "TimetableManager.h"


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
@synthesize slotcontroller;;

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
	NSInteger selectedIndex = [table selectedRow];
	NSInteger sectionCount = [[course sections] count];
	
	if (selectedIndex >= sectionCount){
		[self capTableSelection];
		[slotcontroller setSection:nil];
		return;
	} else if (selectedIndex == -1){
		if ([[course sections] count] != 0){
			NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
			[table selectRowIndexes:indexSet byExtendingSelection:NO];
			[slotcontroller setSection:[[course sections] objectAtIndex:0]];
		} else{
			[slotcontroller setSection:nil];
		}
		return;
	}
	
		
	Section *section = [[course sections] objectAtIndex: selectedIndex];
	
	[slotcontroller setSection:section];
}

- (void)tableView:(NSTableView *)tableView didClickTableColumn:(NSTableColumn *)tableColumn
{
	// Either reverse the sort or change the sorting column
	
}

-(IBAction)addCurrentSection:(id)sender{
	if ([table selectedRow] != -1){
		Section *section = [[course sections] objectAtIndex:[table selectedRow]];
		[[TimetableManager sharedInstance] addSection:section];
		[slotcontroller addSection:section];
	}
}

-(void)capTableSelection{
	if ([[course sections] count] == 0){
		[table selectRowIndexes:nil byExtendingSelection:NO];
	} else {
		NSInteger sectionIndex = [[course sections] count] - 1;
		NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:sectionIndex];
		[table selectRowIndexes:indexSet byExtendingSelection:NO];
		[slotcontroller setSection:[[course sections] objectAtIndex:sectionIndex]];
	}
}

-(void) refreshTable{
	[table reloadData];
	[self tableViewSelectionDidChange:nil];
}


@end
