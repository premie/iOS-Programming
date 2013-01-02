//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Andrew Long on 12/31/12.
//  Copyright (c) 2012 Andrew Long. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView
@synthesize circleColor;

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        // All HypnosisViews start with a clear background color
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0;
    center.y = bounds.origin.y + bounds.size.height/2.0;
    
    // The radius of the circle should be nearly as big as the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height)/2.0;
    
    // The thickness of the line should be 10 points wide
    CGContextSetLineWidth(ctx, 10);
    
    // The color of the line should be gray
    [[self circleColor] setStroke];
    
    for(float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20){
        // Add a shape to the context
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI*2.0, YES);
        
        // Change the alpha of our circle.
        CGFloat alpha = currentRadius/maxRadius;
        [[[self circleColor] colorWithAlphaComponent:alpha] setStroke];
        
        // Perform a drawing instruction
        CGContextStrokePath(ctx);
    }
    
    NSString* text = @"You are getting sleepy.";
    UIFont* font = [UIFont boldSystemFontOfSize:28];
    CGRect textRect;
    
    // How big is this string when drawn in this font?
    textRect.size = [text sizeWithFont:font];
    
    // Put the string in the center of the view
    textRect.origin.x = center.x - textRect.size.width/2.0;
    textRect.origin.y = center.y - textRect.size.height/2.0;
    
    // Set fill color of the current context to black
    [[UIColor blackColor] setFill];
    
    // Shadow will move 4 points to right, 3 points down
    CGSize offset = CGSizeMake(4, 3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSaveGState(ctx);
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    
    // Draw string
    [text drawInRect:textRect withFont:font];
    
    // Move to the bottom of our vertical line of the crosshair
    CGContextMoveToPoint(ctx, center.x, center.y-10);
    CGContextAddLineToPoint(ctx, center.x, center.y+10);
    
    // Move to the left of our horizontal line of the croasshair
    CGContextMoveToPoint(ctx, center.x-10, center.y);
    CGContextAddLineToPoint(ctx, center.x+10, center.y);
    
    // Change color to green and perform drawing instruction
    CGContextRestoreGState(ctx);
    [[UIColor greenColor] setStroke];
    CGContextStrokePath(ctx);
}

-(void)setCircleColor:(UIColor *)newCircleColor{
    circleColor = newCircleColor;
    [self setNeedsDisplay];
}

//////////////////////////
// Motion Event Methods //
//////////////////////////

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if(motion == UIEventSubtypeMotionShake){
        NSLog(@"Device started shaking.");
        [self setCircleColor:[UIColor redColor]];
    }
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}

@end
