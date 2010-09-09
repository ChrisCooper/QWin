//
//  CourseInfoViewController.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-09.
//  Copyright 2010 Chris Cooper. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Models.h"


@interface CourseInfoViewController : NSViewController {
	IBOutlet NSTextField *codeField;
	IBOutlet NSTextField *creditsField;
	IBOutlet NSTextField *titleField;
	IBOutlet NSTextField *formatField;
	IBOutlet NSTextField *descriptionField;
	IBOutlet NSTextField *requisitesField;
}

-(void) displayCourse:(Course*)course;

@property (nonatomic, retain) NSTextField *codeField;
@property (nonatomic, retain) NSTextField *creditsField;
@property (nonatomic, retain) NSTextField *titleField;
@property (nonatomic, retain) NSTextField *formatField;
@property (nonatomic, retain) NSTextField *descriptionField;
@property (nonatomic, retain) NSTextField *requisitesField;

@end
