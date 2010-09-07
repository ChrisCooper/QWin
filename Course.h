//
//  Course.h
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-05.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Course : NSObject {
	NSString *subject;
	NSString *code;
	NSArray *sections;
}

-(void) logDescription;

@property (nonatomic, retain) NSString *subject;
@property (nonatomic, retain) NSString *code;
@property (nonatomic, retain) NSArray *sections;

@end
