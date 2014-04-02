//
//  main.m
//  TSweet
//
//  Created by Hussam Al-Zughaibi on 3/30/14.
//  Copyright (c) 2014 Hussam Al-Zughaibi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TSweetRest.h"
#import "UsersCommunicator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        TSweetRest * restAPI = [TSweetRest shared];
        restAPI.userToken = @"$2y$10$T4p4RXfC.YcXc6PuPhbaXe8yxTd.fg67MDq9dDRb6oWp3nyqXr.KC";
        
        // First hand shake to receive an SMS with a token.
        //TSweetResponse * tsr = [restAPI get:@"/users/token/966553085572" userToken:@""];
        
        // Second hand shake to login actually.
        /*
        NSDictionary * parameters = @{
                                        @"mobile": @"966553085572",
                                        @"sms_token": @"55879"
                                      };
        
        TSweetResponse * tsr = [restAPI post:@"/users/login"
                                  parameters: parameters
                                   userToken:@""];
         */
        
        //$2y$10$T4p4RXfC.YcXc6PuPhbaXe8yxTd.fg67MDq9dDRb6oWp3nyqXr.KC
        
        //NSLog(@"code: %ld, body: %@", tsr.code, tsr.body);
        //[[UsersCommunicator shared] initialize:@"male" name:@"حسام" dob:@"1989-01-14"];
        TSweetResponse * tsr = [[UsersCommunicator shared] dashboard];
        NSLog(@"%@", [tsr description]);
        
        NSLog(tsr.json[@"name"]);
        
    }
    return 0;
}

