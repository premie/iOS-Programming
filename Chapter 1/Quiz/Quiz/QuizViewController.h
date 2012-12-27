//
//  QuizViewController.h
//  Quiz
//
//  Created by Andrew Long on 12/27/12.
//  Copyright (c) 2012 Andrew Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController{
    int currentQuestionIndex;
    
    // The model objects
    NSMutableArray *questions;
    NSMutableArray *answers;
    
    // The view objects
    IBOutlet UILabel* questionField;
    IBOutlet UILabel* answerField;
}

- (IBAction)showQuestion:(id)sender;
- (IBAction)showAnswer:(id)sender;

@end
