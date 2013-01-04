//
//  RotationAppDelegate.h
//  HeavyRotation
//
//  Created by Andrew Long on 1/4/13.
//  Copyright (c) 2013 Andrew Long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeavyViewController.h"

@interface RotationAppDelegate : UIResponder <UIApplicationDelegate>{
    HeavyViewController* hvc;
}

@property (strong, nonatomic) UIWindow *window;

@end
