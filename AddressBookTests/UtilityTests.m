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
}

- (void)tearDown {

    [super tearDown];
}

- (void)testFirstLetterCaps {
    NSString *name = [Utility firstLetterCaps:@"lynn"];
    
    XCTAssertEqualObjects(@"Lynn", name, @"correct");
}

- (void)testFirstLetterCapsWithEmptyStringDoesNotFail {

    //Test passes
    
    NSString *name = [Utility firstLetterCaps:@""];
    
    XCTAssertEqualObjects(@"", @"", @"correct");

}

- (void)testFirstLetterCapsWithNilStringDoesNotFail {

    //Test passes
    
    NSString *name = [Utility firstLetterCaps:nil];
    
    XCTAssertEqualObjects(nil, nil, @"correct");
    
}

@end
