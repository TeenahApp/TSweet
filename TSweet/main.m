//
//  main.m
//  TSweet
//
//  Created by Hussam Al-Zughaibi on 3/30/14.
//  Copyright (c) 2014 Hussam Al-Zughaibi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Globals.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        TSweetRest * restAPI = [TSweetRest shared];
        restAPI.userToken = @"$2y$10$T4p4RXfC.YcXc6PuPhbaXe8yxTd.fg67MDq9dDRb6oWp3nyqXr.KC";
        
        TSweetResponse * tsr = [[MembersCommunicator shared] uploadPhoto:@"2" data:@"" extension:@"png"];
        
        //TSweetResponse * tsr = [[UsersCommunicator shared] dashboard];
         
        // Print the description.
        NSLog(@"%@", tsr.description);

    }
    return 0;
}

