//
//  MessagesCommunicator.m
//  TSweet
//
//  Created by Hussam Al-Zughaibi on 4/2/14.
//  Copyright (c) 2014 Hussam Al-Zughaibi. All rights reserved.
//

#import "MessagesCommunicator.h"

@implementation MessagesCommunicator

+(id)shared
{
    static MessagesCommunicator * shared = nil;
    @synchronized(self) {
        if (shared == nil)
            shared = [[self alloc] init];
    }
    return shared;
}

-(TSweetResponse *)sendText:(NSString *)content circles:(NSString *)circles
{
    NSString * route = [NSString stringWithFormat:@"/messages/texts"];
    NSDictionary * parameters = @{
                                  @"content": content,
                                  @"circles": circles
                                  };
    
    return [[TSweetRest shared] post:route parameters: parameters];
}

-(TSweetResponse *)sendMedia:(NSString *)category data:(NSString *)data extension:(NSString *)extension circles:(NSString *)circles
{
    NSString * route = [NSString stringWithFormat:@"/messages/medias"];
    NSDictionary * parameters = @{
                                  @"category": category,
                                  @"data": data,
                                  @"extension": extension,
                                  @"circles": circles
                                  };
    
    return [[TSweetRest shared] post:route parameters: parameters];
}

@end
