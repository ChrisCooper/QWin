//
//  QWin_MacAppDelegate.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-08-07.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import "QWin_MacAppDelegate.h"

@implementation QWin_MacAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	NSURL *url = [NSURL URLWithString:@"http://localhost/mac/quwin_mac/server/courses.php"];
	NSString *contentsString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
	NSLog(@"Result: %@", contentsString);
}

@end
