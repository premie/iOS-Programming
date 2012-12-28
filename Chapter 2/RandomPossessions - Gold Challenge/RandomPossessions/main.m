//
//  main.m
//  RandomPossessions
//
//  Created by Andrew Long on 12/27/12.
//  Copyright (c) 2012 Andrew Long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        NSMutableArray* items = [[NSMutableArray alloc] init];
        
        for(int i = 0; i < 10; ++i){
            BNRItem* p = [BNRItem randomItem];
            [items addObject:p];
        }
        
        for(BNRItem* item in items){
            NSLog(@"%@",item);
        }
        
        BNRContainer* aContainer = [[BNRContainer alloc] initWithItemName:@"First Container"
                                                           valueInDollars:50
                                                             serialNumber:@"731236"];
        BNRContainer* bContainer = [[BNRContainer alloc] initWithItemName:@"Second Container"
                                                           valueInDollars:60
                                                             serialNumber:@"768236"];
        
        for(BNRItem* item in items){
            [aContainer addItem:item];
        }
        
        [aContainer addItem:bContainer];
        
        NSLog(@"\n%@\n",[aContainer description]);
        
        items = nil;
    }
    return 0;
}

