//
//  QWin_MacAppDelegate.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-08-07.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface QWin_MacAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
