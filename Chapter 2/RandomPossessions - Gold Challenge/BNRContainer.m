//
//  BNRContainer.m
//  RandomPossessions
//
//  Created by Andrew Long on 12/28/12.
//  Copyright (c) 2012 Andrew Long. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

-(id)initWithItemName:(NSString *)name
       valueInDollars:(int)value
         serialNumber:(NSString *)sNumber{
    self = [super initWithItemName:name valueInDollars:value serialNumber:sNumber];
    totalValueInDollars = value;
    subitems = [[NSMutableArray alloc] init];
    
    return self;
}

-(void)addItem:(BNRItem*)newItem{
    // Add the item to our subitem array and capture it's value
    [subitems addObject:newItem];
    totalValueInDollars += [newItem valueInDollars];
}

-(int)valueInDollars{
    return totalValueInDollars;
}

-(NSString*)description{
    NSString* descriptionString = [[NSString alloc] initWithFormat:@"Name: %@\nValue: %d\nItems:\n",itemName,totalValueInDollars];
    
    for(BNRItem* item in subitems){
        descriptionString = [descriptionString stringByAppendingFormat:@"-%@\n",[item itemName]];
    }
    
    return descriptionString;
}

@end
