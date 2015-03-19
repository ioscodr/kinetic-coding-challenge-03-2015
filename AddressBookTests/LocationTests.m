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
                                  @"1007 Mountain Drive", @"street",
                                  @"Gotham", @"city",
                                  @"New York", @"state",
                                  @"100000", @"zip",
                                  nil];

    location = [[Location alloc] initWithDict: locationDict];

}

- (void)tearDown {

    location = nil;
    [super tearDown];
}

- (void)testThatLocationExists {
   
    XCTAssertNotNil(location, @"should be able to create a Location instance");
}

- (void)testThatLocationHasStreet {
    
    NSLog(@"Location has street: %@", location.street);
    XCTAssertNotNil(location.street, @"the location should have a street");
}

- (void)testThatLocationHasCity {
    
    NSLog(@"Location has street: %@", location.city);
    XCTAssertNotNil(location.city, @"the location should have a city");
}

- (void)testThatLocationHasState {
    
    NSLog(@"Location has street: %@", location.state);
    XCTAssertNotNil(location.state, @"the location should have a state");
}

- (void)testThatLocationHasZip {
    
    NSLog(@"Location has street: %@", location.zip);
    XCTAssertNotNil(location.zip, @"the location should have a zip");
}

- (void)testThatLocationHasRightStreet {
    
    XCTAssertEqualObjects(location.street, @"1007 Mountain Drive", "the location should have the right street");
}

- (void)testThatLocationHasRightCity {
    
    XCTAssertEqualObjects(location.city, @"Gotham", "the location should have the right city");
}

- (void)testThatLocationHasRightState {
    
    XCTAssertEqualObjects(location.state, @"New York", "the location should have the right state");
}

- (void)testThatLocationHasRightZip {
    
    XCTAssertEqualObjects(location.zip, @"100000", "the location should have the right zip");
}



@end
