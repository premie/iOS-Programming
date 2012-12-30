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

/////////////
// Methods //
/////////////

-(void)findLocation{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

-(void)foundLocation:(CLLocation *)loc{
    CLLocationCoordinate2D coord = [loc coordinate];
    
    // Create an instance of BNRMapPoint with the current data
    BNRMapPoint* mp = [[BNRMapPoint alloc] initWithCoordinate:coord title:[locationTitleField text]];
    
    // Add point and zoom in
    [worldView addAnnotation:mp];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    
    // Reset the UI
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

/////////////////////////////////////////
// CLLocationManagerDelegate Protocols //
/////////////////////////////////////////

-(void)locationManager:(CLLocationManager*)manager
    didUpdateLocations:(NSArray*)newLocations{
    
    // Grab the most recent (last) location from the array
    CLLocation* newLocation = [newLocations objectAtIndex:[newLocations count]-1];
    
    // How many seconds ago was this new location created?
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    
    // CLLocationManager returns stale date (from previous use)
    // Check if data is stale
    if(t < -180){
        // Cached data, ignore
        return;
    }
    
    NSLog(@"%@", newLocation);
    
    
    [self foundLocation:newLocation];
}

-(void)locationManager:(CLLocationManager*)manager
      didFailWithError:(NSError *)error{
    NSLog(@"Could not find location: %@", error);
}

/////////////////////////////////
// MKMapViewDelegate Protocols //
/////////////////////////////////

-(void)mapView:(MKMapView *)mapView
didUpdateUserLocation:(MKUserLocation *)userLocation{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}

///////////////////////////////////
// UITextFieldDelegate Protocols //
///////////////////////////////////

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self findLocation];
    
    [textField resignFirstResponder];
    
    return YES;
}

@end
