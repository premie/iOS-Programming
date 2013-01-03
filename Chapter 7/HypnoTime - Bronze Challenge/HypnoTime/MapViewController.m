//
//  MapViewController.m
//  HypnoTime
//
//  Created by Andrew Long on 1/3/13.
//  Copyright (c) 2013 Andrew Long. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    // Call the superclass's designated initializer
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        // Get that tab bar item and give it a title
        UITabBarItem* tbi = [self tabBarItem];
        [tbi setTitle:@"Map"];
        
        // Create a UIImage from a file and set it to our tab bar item
        UIImage* img = [UIImage imageNamed:@"Time.png"];
        [tbi setImage:img];
    }
    return self;
}

@end
