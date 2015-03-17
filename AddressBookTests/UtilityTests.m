//
//  UtilityTests.m
//  AddressBookTest
//
//  Created by lzh on 2015-03-10.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Utility.h"
#import "UtilityTests.h"


@implementation UtilityTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFirstLetterCaps {
    NSString *name = [Utility firstLetterCaps:@"lynn"];
    
    XCTAssertEqualObjects(@"Lynn", name, @"correct");
}

- (void)testFirstLetterCapsWithEmptyStringDoesNotFail {
    //Put code here

    //an index out of bounds exception is currently returned
    NSString *name = [Utility firstLetterCaps:@""];
    
    XCTAssertEqualObjects(@"", name, @"correct");
}

@end
