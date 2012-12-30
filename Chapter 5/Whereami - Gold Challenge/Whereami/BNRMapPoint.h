//
//  BNRMapPoint.h
//  Whereami
//
//  Created by Andrew Long on 12/29/12.
//  Copyright (c) 2012 Andrew Long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BNRMapPoint : NSObject <MKAnnotation> {
    
}

// A new designated initializer for instances of BNRMapPoint
-(id)initWithCoordinate:(CLLocationCoordinate2D)c
                  title:(NSString*)t;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;  // Required by MKAnnotation
@property (nonatomic, copy) NSString* title;                        // Optional
@property (nonatomic, copy) NSString* subtitle;                     // Optional

@end
