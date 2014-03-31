//
//  TSweetRest.h
//  TSweet
//
//  Created by Hussam Al-Zughaibi on 3/30/14.
//  Copyright (c) 2014 Hussam Al-Zughaibi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSweetResponse.h"

// Define some enumerators.
enum method {
    get,
    post,
    put,
    delete
};

@interface TSweetRest : NSObject

@property NSString * const apiUrl;

// Teenah API has to be initialized.
@property NSString * const appKey;
@property NSString * const appSecret;

// Teenah user token if logged in.
@property NSString * userToken;

+(id) sharedSweetRest;

-(TSweetResponse *) request: (enum method) method
                      route: (NSString *) route
                 parameters: (NSDictionary *) parameters
                 userToken: (NSString *) userToken;

// HTTP verbs as methods.
-(TSweetResponse *) get: (NSString *) route
                    userToken: (NSString *) userToken;

-(TSweetResponse *) post: (NSString *) route
                    parameters:(NSDictionary *) parameters
                    userToken: (NSString *) userToken;

-(TSweetResponse *) put: (NSString *) route
                    parameters:(NSDictionary *) parameters
                    userToken: (NSString *) userToken;


-(TSweetResponse *) delete: (NSString *) route
                    userToken: (NSString *) userToken;

@end
