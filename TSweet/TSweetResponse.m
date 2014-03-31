//
//  TSweetResponse.m
//  TSweet
//
//  Created by Hussam Al-Zughaibi on 3/30/14.
//  Copyright (c) 2014 Hussam Al-Zughaibi. All rights reserved.
//

#import "TSweetResponse.h"

@implementation TSweetResponse

-(id)initWithParameters:(NSInteger)code body:(NSString *)body {
    
    if (self = [super init])
    {
        self.code = code;
        self.body = body;
    }
    
    return self;
}

@end
