//
//  UsersBuilderTests.m
//  AddressBookTest
//
//  Created by lzh on 2015-03-14.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "UsersBuilder.h"
#import "UsersBuilderTests.h"


@implementation UsersBuilderTests

- (void)setUp {
    [super setUp];
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"users" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    usersArray = [UsersBuilder usersFromJson:data];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUsersFromJson {
    
    // This is a method stub - finish it!
    
}

- (void)testRealJSONWithoutUsersIsError {
    
    // This is a method stub - finish it!
    
}


- (void)testRealJSONWithoutUsersReturnsMissingDataError {

    // This is a method stub - finish it!
    
}


- (void)testQuestionCreatedFromJSONHasPropertiesPresentedInJSON {

    // This is a method stub - finish it!
    
}

- (void)testEmptyQuestionsArrayDoesNotCrash {

    // This is a method stub - finish it!
    
}

- (void)testSortUsersByFirstName {

    // This is a method stub - finish it!
    
}

- (void)testSortUsersByFirstNameDoesNotCrashWithNoName {

    // This is a method stub - finish it!
    
}

@end
