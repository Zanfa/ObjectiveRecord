//
//  NSArrayCategories.m
//  SampleProject
//
//  Created by Marin Usalj on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSArrayCategories.h"
#import "NSArray+Accessors.h"
#import "Kiwi.h"

SPEC_BEGIN(ArrayCategories)

NSArray *(^sampleArray)(void) = ^NSArray *(void) {
    return [NSArray arrayWithObjects:@"first", @"second", @"third", nil];
};

describe(@"First and last objects", ^{
   
    it(@"aliases -first to -objectAtIndex:0", ^{
        [[sampleArray().first should] equal:[sampleArray() objectAtIndex:0]];
    });
    
    it(@"aliases -last to -lastObject", ^{
        [[sampleArray().last should] equal:[sampleArray() lastObject]];        
    });
    
});


describe(@"Iterators", ^{
   
    context(@"Iterating using block", ^{
       
        it(@"iterates using -each:^", ^{
            NSMutableArray *duplicate = [sampleArray() mutableCopy];
            
            [sampleArray() each:^(id object) {
                [[duplicate should] contain:object];
                [duplicate removeObject:object];
            }];
            [[duplicate should] beEmpty];
        });
        
        it(@"iterates using -eachWithIndex:^", ^{
            [sampleArray() eachWithIndex:^(id object, int index) {
                [[object should] equal:[sampleArray() objectAtIndex:index]];
            }];
        });
        
    });
    
});

SPEC_END

