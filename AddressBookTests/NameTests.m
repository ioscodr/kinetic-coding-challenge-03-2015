//
//  NameTests.m
//  AddressBookTest
//
//  Created by lzh on 2015-03-14.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Name.h"
#import "NameTests.h"



@implementation NameTests

- (void)setUp {
    [super setUp];
    
    NSDictionary *nameDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"Lynn", @"first",
                              @"Zhou", @"last",
                              @"Ms", @"title",
                              nil];
    
    name = [[Name alloc] initWithDict: nameDict];

}

- (void)tearDown {

    name = nil;
    [super tearDown];
}

- (void)testThatNameExists {
    
    XCTAssertNotNil(name, @"should be able to create a Name instance");
}

- (void)testThatNameHasFirstName {

    NSLog(@"Name has first name: %@", name.first);
    XCTAssertNotNil(name.first, @"the name should have a first name");
}

- (void)testThatNameHasLastName {
    
    NSLog(@"Name has last name: %@", name.last);
    XCTAssertNotNil(name.last, @"the name should have a last name");
}

- (void)testThatNameHasTitle {
    
    NSLog(@"Name has title: %@", name.title);
    XCTAssertNotNil(name.title, @"the name should have a title");
}

- (void)testThatNameHasRightFirstName {
    
    XCTAssertEqualObjects(name.first, @"Lynn", "the user should have the right first name");
}

- (void)testThatNameHasRightLastName {
    
    XCTAssertEqualObjects(name.last, @"Zhou", "the user should have the right last name");
}

- (void)testThatNameHasRightTitle {

    XCTAssertEqualObjects(name.title, @"Ms", "the user should have the right title");
}


@end
