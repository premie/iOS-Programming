//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Andrew Long on 12/28/12.
//  Copyright (c) 2012 Andrew Long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "BNRMapPoint.h"

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>{
    CLLocationManager* locationManager;
    
    IBOutlet MKMapView* worldView;
    IBOutlet UIActivityIndicatorView* activityIndicator;
    IBOutlet UITextField* locationTitleField;
}

-(void)findLocation;
-(void)foundLocation:(CLLocation*)loc;

@end
