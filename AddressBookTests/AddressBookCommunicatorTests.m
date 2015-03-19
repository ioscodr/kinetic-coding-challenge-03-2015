//
//  AddressBookCommunicatorTests.m
//  AddressBookTest
//
//  Created by lzh on 2015-03-15.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "AddressBookCommunicatorTests.h"
#import "AddressBookCommunicator.h"


@implementation AddressBookCommunicatorTests

// Tests to be added

- (void)setUp {
    [super setUp];

    communicator = [[AddressBookCommunicator alloc] init];

}

- (void)tearDown {

    [super tearDown];
}

- (void)testReceivingResponseWith404StatusPassesErrorToDelegate {

    //This is a stub - implement this

}


- (void)testSuccessfulUsersFetchPassesDataToDelegate {

    //This is a stub - implement this
    
}

- (void)testConnectionFailingPassesErrorToDelegate {

    //This is a stub - implement this

}

@end
