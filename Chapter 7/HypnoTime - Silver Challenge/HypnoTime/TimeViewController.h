//
//  TimeViewController.h
//  HypnoTime
//
//  Created by Andrew Long on 1/2/13.
//  Copyright (c) 2013 Andrew Long. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeViewController : UIViewController{
    IBOutlet UILabel* timeLabel;
}
-(IBAction)showCurrentTime:(id)sender;

@end
