//
//  BNRContainer.h
//  RandomPossessions
//
//  Created by Andrew Long on 12/28/12.
//  Copyright (c) 2012 Andrew Long. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem{
    NSMutableArray* subitems;
    int totalValueInDollars;
}

-(void)addItem:(BNRItem*)newItem;


@end
