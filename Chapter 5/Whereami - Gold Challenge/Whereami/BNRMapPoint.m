//
//  BNRMapPoint.m
//  Whereami
//
//  Created by Andrew Long on 12/29/12.
//  Copyright (c) 2012 Andrew Long. All rights reserved.
//

#import "BNRMapPoint.h"

@implementation BNRMapPoint
@synthesize coordinate, title, subtitle;

-(id)init{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07,-89.32) title:@"Hometown"];
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t{
    self = [super init];
    if(self){
        coordinate = c;
        
        // Grab the current date
        NSDate* timestamp = [NSDate date];

        // Set up our formatter
        NSDateFormatter* timestampFormat = [[NSDateFormatter alloc] init];
        [timestampFormat setTimeStyle:NSDateFormatterNoStyle];
        [timestampFormat setDateStyle:NSDateFormatterShortStyle];
        
        // Format our date into a string
        [self setSubtitle:[timestampFormat stringFromDate:timestamp]];
        [self setTitle:t];
    }
    return self;
}

@end
