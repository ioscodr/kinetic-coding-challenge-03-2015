//
//  AddressBookCommunicator.m
//  AddressBookTest
//
//  Created by lzh on 2015-03-10.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import "AddressBookCommunicator.h"

#define kBackgroundQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
#define kRandomUsersUrl [NSURL URLWithString: @"http://api.randomuser.me/?results=100"] //2


@implementation AddressBookCommunicator

- (void)downloadUsers {

    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:kRandomUsersUrl] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.delegate fetchingUsersFailedWithError:error];
        } else {
            [self.delegate receivedUsersJSON:data];
            //NSLog(@"Data: %@", data);
        }
    }];
}


@end
