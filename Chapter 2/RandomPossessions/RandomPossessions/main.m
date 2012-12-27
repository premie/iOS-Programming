//
//  main.m
//  RandomPossessions
//
//  Created by Andrew Long on 12/27/12.
//  Copyright (c) 2012 Andrew Long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

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
        
        items = nil;
    }
    return 0;
}

