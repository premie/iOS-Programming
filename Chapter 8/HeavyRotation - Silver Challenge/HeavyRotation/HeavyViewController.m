//
//  HeavyViewController.m
//  HeavyRotation
//
//  Created by Andrew Long on 1/4/13.
//  Copyright (c) 2013 Andrew Long. All rights reserved.
//

#import "HeavyViewController.h"

@interface HeavyViewController ()

@end

@implementation HeavyViewController

-(void)viewDidLoad{
    // Programatically set our mask
    [bottomLeftCorner setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin];
    [bottomRightCorner setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin];
    [centerImage setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [topSlider setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin];
}

@end
