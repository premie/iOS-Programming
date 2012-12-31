//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Andrew Long on 12/31/12.
//  Copyright (c) 2012 Andrew Long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisView.h"

@interface HypnosisterAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>{
    HypnosisView* view;
}

@property (strong, nonatomic) UIWindow *window;

@end
