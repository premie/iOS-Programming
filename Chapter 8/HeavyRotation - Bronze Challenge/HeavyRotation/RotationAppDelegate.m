//
//  RotationAppDelegate.m
//  HeavyRotation
//
//  Created by Andrew Long on 1/4/13.
//  Copyright (c) 2013 Andrew Long. All rights reserved.
//

#import "RotationAppDelegate.h"
#import "HeavyViewController.h"

@implementation RotationAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // Get the device object
    UIDevice* device = [UIDevice currentDevice];
    
    // Tell it to start monitoring the accelerometer for orientation
    // and proximity monitoring
    [device beginGeneratingDeviceOrientationNotifications];
    [device setProximityMonitoringEnabled:YES];
    
    // Add yourself as an observer to the notification center
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:device];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityChanged:) name:UIDeviceProximityStateDidChangeNotification object:device];
    
    hvc = [[HeavyViewController alloc] init];
    [[self window] setRootViewController:hvc];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)orientationChanged:(NSNotification*)note{
    // Log the constant that represents the current orientation
    NSLog(@"orientationChanged: %d",[[note object] orientation]);
}

-(void)proximityChanged:(NSNotification*)note{
    // If the proximity is close to the user 'YES', make grey
    if([[note object] proximityState]){
        [[hvc view] setBackgroundColor:[UIColor grayColor]];
    }
    else{
        [[hvc view] setBackgroundColor:[UIColor whiteColor]];
    }
}

@end