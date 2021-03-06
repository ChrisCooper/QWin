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
	NSString *name;
	NSString *description;
	NSString *code;
	NSString *credits;
	NSString *courseKey;
	NSString *format;
	NSArray *sections;
}

-(void) logDescription;
-(NSString*)getKey;
-(NSString*)getFullCode;

@property (nonatomic, retain) NSString *subject;
@property (nonatomic, retain) NSString *code;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *credits;
@property (nonatomic, retain) NSString *format;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *courseKey;
@property (nonatomic, retain) NSArray *sections;

@end
