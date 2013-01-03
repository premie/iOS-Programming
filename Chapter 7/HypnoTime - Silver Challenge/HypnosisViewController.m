//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Andrew Long on 1/2/13.
//  Copyright (c) 2013 Andrew Long. All rights reserved.
//

#import "HypnosisViewController.h"

@implementation HypnosisViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    // Call the superclass's designated initializer
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        // Get the tab bar item and give it a label
        UITabBarItem* tbi = [self tabBarItem];
        [tbi setTitle:@"Hypnosis"];
        
        // Create a UIImage from a file and set it to our tab bar item
        UIImage* img = [UIImage imageNamed:@"Hypno.png"];
        [tbi setImage:img];
    }
    return self;
}

-(void)loadView{
    // Create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    v = [[HypnosisView alloc] initWithFrame:frame];
    UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Red",@"Green",@"Blue",nil]];
    segmentedControl.center = CGPointMake(v.bounds.size.width/2.0,v.bounds.size.height*0.75);
    
    // Set it as *the* view of this view controller
    [self setView:v];
    [v addSubview:segmentedControl];
    [segmentedControl addTarget:self action:@selector(changeRingColor:) forControlEvents:UIControlEventValueChanged];
}

-(void)viewDidLoad{
    // Always call te super implementation of viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"HypnosisViewController loaded its view.");
}

-(IBAction)changeRingColor:(id)sender{
    NSLog(@"Segment %d enabled.",[sender selectedSegmentIndex]);
    if([sender selectedSegmentIndex] == 0){
        [v setCircleColor:[UIColor redColor]];
    }
    else if([sender selectedSegmentIndex] == 1){
        [v setCircleColor:[UIColor greenColor]];
    }
    else{
        [v setCircleColor:[UIColor blueColor]];
    }
}

@end
