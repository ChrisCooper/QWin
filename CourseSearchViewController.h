//
//  CourseSearchViewController.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-08-08.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface CourseSearchViewController : NSViewController {
	
	IBOutlet NSOutlineView *courseBrowser;
	IBOutlet NSSearchField *searchField;

}

@property (nonatomic, retain) NSOutlineView *courseBrowser;
@property (nonatomic, retain) NSSearchField *searchField;

@end
