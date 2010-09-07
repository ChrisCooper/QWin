//
//  QWin_MacAppDelegate.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-08-07.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import "QWin_MacAppDelegate.h"
#import "ModelBuilder.h"

@implementation QWin_MacAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	
	//Create models from JSON file
	ModelBuilder *builder = [[ModelBuilder alloc] init];
	[builder loadModelsFromJson];
	
	
	
}

@end
