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


    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatNameExists {
    
    XCTAssertNotNil(name, @"should be able to create a Name instance");
}

- (void)testThatNameHasFirstName {

    // This is a method stub - finish it!

}

- (void)testThatNameHasLastName {
    
    // This is a method stub - finish it!
    
}

- (void)testThatNameHasTitle {
    
    // This is a method stub - finish it!
    
}

@end
