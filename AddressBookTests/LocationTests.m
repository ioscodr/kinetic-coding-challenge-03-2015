//
//  LocationTests.m
//  AddressBookTest
//
//  Created by lzh on 2015-03-14.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Location.h"
#import "LocationTests.h"



@implementation LocationTests

- (void)setUp {
    [super setUp];
    
    NSDictionary *locationDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  @"100 King St W", @"street",
                                  @"New York", @"city",
                                  @"New York", @"state",
                                  @"100000", @"zip",
                                  nil];

    location = [[Location alloc] initWithDict: locationDict];

    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatLocationExists {
   
    // This is a method stub - finish it!
    XCTAssertNotNil(location, @"should be able to create a Location instance");

}



@end
