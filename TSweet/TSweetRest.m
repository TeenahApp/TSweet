//
//  TSweetRest.m
//  TSweet
//
//  Created by Hussam Al-Zughaibi on 3/30/14.
//  Copyright (c) 2014 Hussam Al-Zughaibi. All rights reserved.
//

#import "TSweetRest.h"

@implementation TSweetRest

+(id) sharedSweetRest {
    static TSweetRest * sharedSweetRest = nil;
    @synchronized(self) {
        if (sharedSweetRest == nil)
            sharedSweetRest = [[self alloc] init];
    }
    return sharedSweetRest;
}

-(id)init {

    if (self = [super init])
    {
        self.apiUrl = @"http://api.teenah-app.com/v1";
        self.appKey = @"MNwPLdo7hVdj5Mj0Jz7diq804sd5Sf";
        self.appSecret = @"$2y$10$9XuWj51VVDY8tuhYghGcIuN2oEL35RnA17GeesMxIm2cKYvDpGBEW";
    }
                
    return self;
}

-(TSweetResponse *) request:(enum method) method
                      route:(NSString *)route
                 parameters:(NSDictionary *)parameters
                 userToken:(NSString *)userToken {

    NSString * url = [[NSString alloc] initWithFormat:@"%@%@", self.apiUrl, route];
    
    // Request.
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] init];
    
    // Set some variables.
    [request setURL:[[NSURL alloc] initWithString: url]];
    
    // Add API key and secret.
    [request setValue:self.appKey forHTTPHeaderField:@"X-App-Key"];
    [request setValue:self.appSecret forHTTPHeaderField:@"X-App-Secret"];
    
    switch (method) {
            
        case get:
            [request setHTTPMethod:@"GET"];
            break;
            
        case post:
            [request setHTTPMethod:@"POST"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            break;
            
        case put:
            [request setHTTPMethod:@"PUT"];
            break;
            
        case delete:
            [request setHTTPMethod:@"DELETE"];
            break;
    }
    
    // Response.
    NSHTTPURLResponse * response;
    
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    // TODO: Check if nil.
    
    NSInteger responseCode = [response statusCode];
    NSString * responseBody = [[NSString alloc] initWithBytes:[responseData bytes]
                                                       length:[responseData length]
                                                     encoding: NSUTF8StringEncoding];
    
    return [[TSweetResponse alloc] initWithParameters:responseCode body:responseBody];
}

// http://stackoverflow.com/questions/7673127/xcode-ios-how-do-i-send-a-json-to-a-url-post-and-get-request-resolved

-(TSweetResponse *) get:(NSString *)route userToken:(NSString *)userToken {

    return [self request:get route:route parameters:nil userToken:userToken];
}

@end
