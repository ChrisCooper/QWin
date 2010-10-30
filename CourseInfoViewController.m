//
//  CourseInfoViewController.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-09.
//  Copyright 2010 Chris Cooper. All rights reserved.
//

#import "CourseInfoViewController.h"


@implementation CourseInfoViewController

@synthesize codeField;
@synthesize creditsField;
@synthesize titleField;
@synthesize formatField;
@synthesize descriptionField;
@synthesize requisitesField;
@synthesize sectionTableController;

-(void) displayCourse:(Course*)course{
	[codeField setStringValue:[course getFullCode]];
	[titleField setStringValue:[course name]];
	[descriptionField setString:[course description]];
	[creditsField setStringValue:[course credits]];
	[formatField setStringValue:[course format]];
	
	[sectionTableController setCourse:course];
	[sectionTableController refresh];
}

@end
