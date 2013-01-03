//
//  TimeViewController.m
//  HypnoTime
//
//  Created by Andrew Long on 1/2/13.
//  Copyright (c) 2013 Andrew Long. All rights reserved.
//

#import "TimeViewController.h"

@implementation TimeViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    // Call the superclass's designated initializer
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        // Get that tab bar item and give it a title
        UITabBarItem* tbi = [self tabBarItem];
        [tbi setTitle:@"Time"];
        
        // Create a UIImage from a file and set it to our tab bar item
        UIImage* img = [UIImage imageNamed:@"Time.png"];
        [tbi setImage:img];
    }
    return self;
}

-(IBAction)showCurrentTime:(id)sender{
    NSDate* now = [NSDate date];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    
    [timeLabel setText:[formatter stringFromDate:now]];
}

-(void)viewDidLoad{
    // Always call te super implementation of viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"TimeViewController loaded its view.");
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"CurrentTimeViewController will appear.");
    [super viewWillAppear:animated];
    [self showCurrentTime:nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"CurrentTimeViewController will disappear.");
    [super viewWillDisappear:animated];
}

@end
