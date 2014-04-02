//
//  AutoCompletesCommunicator.m
//  TSweet
//
//  Created by Hussam Al-Zughaibi on 4/2/14.
//  Copyright (c) 2014 Hussam Al-Zughaibi. All rights reserved.
//

#import "AutoCompletesCommunicator.h"

@implementation AutoCompletesCommunicator

+(id)shared
{
    static AutoCompletesCommunicator * shared = nil;
    @synchronized(self) {
        if (shared == nil)
            shared = [[self alloc] init];
    }
    return shared;
}

@end
