//
//  UserTests.m
//  AddressBookTest
//
//  Created by lzh on 2015-03-14.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "User.h"
#import "UserTests.h"

@implementation UserTests

- (void)setUp {
    [super setUp];

    NSDictionary *nameDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"Lynn", @"first",
                              @"Zhou", @"last",
                              @"Ms", @"title",
                              nil];
    

    NSDictionary *locationDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"100 King St W", @"street",
                              @"New York", @"city",
                              @"New York", @"state",
                              @"100000", @"zip",
                              nil];
    

    NSDictionary *pictureDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                                @"http://largeimage", @"large",
                                @"http://medimage", @"medium",
                                @"http://thumbimage", @"thumbnail",
                                nil];
    

    NSDictionary *userDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"francis.davis35@example.com", @"email",
                              nameDict, @"name",
                              locationDict, @"location",
                              pictureDict, @"picture",
                              nil];
    
    user = [[User alloc] initWithDict: userDict];

    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatUserExists {
    NSLog(@"User Exists: %@", user);

    XCTAssertNotNil(user, @"should be able to create a User instance");
}

- (void)testThatUserHasName {
    NSLog(@"User Exists: %@", user);
    
    XCTAssertNotNil(user.name, @"should be able to create a User instance");
}

- (void)testThatUserHasPicture {
    NSLog(@"User Exists: %@", user);
    
    XCTAssertNotNil(user.picture, @"should be able to create a User instance");
}

- (void)testThatUserHasLocation {
    NSLog(@"User Exists: %@", user);
    
    XCTAssertNotNil(user.location, @"should be able to create a User instance");
}

- (void)testThatUserHasSSN {
    NSLog(@"User Exists: %@", user);
    
    XCTAssertNotNil(user, @"should be able to create a User instance");
}



@end
