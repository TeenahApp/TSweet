//
//  main.m
//  TSweet
//
//  Created by Hussam Al-Zughaibi on 3/30/14.
//  Copyright (c) 2014 Hussam Al-Zughaibi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSweetRest.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        TSweetRest * restAPI = [TSweetRest sharedSweetRest];
        TSweetResponse * tsr = [restAPI get:@"/users/token/966553085572" isLoggedIn:YES];
        
        NSLog(@"code: %ld, body: %@", tsr.code, tsr.body);
        
    }
    return 0;
}

