//
//  Logger.m
//  QWin Mac
//
//  Created by Chris Cooper on 10-09-06.
//  Copyright 2010 Doliaris Software Consulting Ltd. All rights reserved.
//

#import "Logger.h"


@implementation Logger

//Always returns a string, never nil
//For easy logging
+(NSString*) getString:(NSString*)string{
	return string != nil ? string : @"";
}

@end
