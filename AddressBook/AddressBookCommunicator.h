//
//  AddressBookCommunicator.h
//  AddressBookTest
//
//  Created by lzh on 2015-03-10.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol AddressBookCommunicatorDelegate <NSObject>

@required

/**
 * A message from the communicator that fetching users has failed.
 */
- (void)fetchingUsersFailedWithError: (NSError *)error;

/**
 * The communicator received a response from the Random User API.
 */
- (void)receivedUsersJSON: (NSData *)responseData;

@end



@interface AddressBookCommunicator : NSObject

@property (weak, nonatomic) id<AddressBookCommunicatorDelegate> delegate;

- (void) downloadUsers;

@end
