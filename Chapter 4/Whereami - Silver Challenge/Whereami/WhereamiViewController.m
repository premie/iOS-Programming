//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Andrew Long on 12/28/12.
//  Copyright (c) 2012 Andrew Long. All rights reserved.
//

#import "WhereamiViewController.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        // Create a location manager object
        locationManager = [[CLLocationManager alloc] init];
        
        [locationManager setDelegate:self];
        
        // And we want it to be as accurate as possible
        // regardless of how much time/power it takes
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
        // Set location manager to notify us every 50 meters
        [locationManager setDistanceFilter:50];
        
        // Tell our manager to start looking for its location imediately
        [locationManager startUpdatingLocation];
        
        // Tell our manager to start looking for its heading
        [locationManager startUpdatingHeading];
    }
    
    return self;
}

-(void)dealloc{
    // Tell the location manager to stop sending us messages
    [locationManager setDelegate:nil];
}

-(void)locationManager:(CLLocationManager *)manager
      didUpdateHeading:(CLHeading *)newHeading{
    NSLog(@"New Heading: %@",newHeading);
}

-(void)locationManager:(CLLocationManager*)manager
   didUpdateToLocation:(CLLocation *)newLocation
          fromLocation:(CLLocation *)oldLocation{
    NSLog(@"New Location: %@", newLocation);
}

-(void)locationManager:(CLLocationManager*)manager
      didFailWithError:(NSError *)error{
    NSLog(@"Could not find location: %@", error);
}

@end
