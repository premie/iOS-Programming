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

-(void)viewDidLoad{
    [worldView setShowsUserLocation:YES];
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    }
    
    return self;
}

-(void)dealloc{
    // Tell the location manager to stop sending us messages
    [locationManager setDelegate:nil];
}

-(void)locationManager:(CLLocationManager*)manager
   didUpdateToLocation:(CLLocation *)newLocation
          fromLocation:(CLLocation *)oldLocation{
    NSLog(@"%@", newLocation);
}

-(void)locationManager:(CLLocationManager*)manager
      didFailWithError:(NSError *)error{
    NSLog(@"Could not find location: %@", error);
}

-(void)mapView:(MKMapView *)mapView
didUpdateUserLocation:(MKUserLocation *)userLocation{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}

@end
