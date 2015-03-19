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
                              nameDict, @"name",
                              pictureDict, @"picture",
                              locationDict, @"location",
                              @"F", @"gender",
                              @"lynn@gmail.com", @"email",
                              @"lzhou", @"username",
                              @"th1s1sapassword", @"password",
                              @"2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824", @"salt",
                              @"cf23df2207d99a74fbe169e3eba035e633b65d94", @"md5",
                              @"cf23df2207d99a74fbe169e3eba035e633b65d94", @"sha1",
                              @"cf23df2207d99a74fbe169e3eba035e633b65d94", @"sha256",
                              @"yes", @"registered",
                              @"1.1.2011", @"dob",
                              @"416-111-1234", @"phone",
                              @"416-111-1234", @"cell",
                              @"416111123", @"SSN",
                              @"416111123", @"NINO",
                              @"1.0", @"version",
                              @"Canadian", @"nationality",
                              @"cf23df2207d99a74fbe169e3eba035e633b65d94", @"seed",
                              nil];
    
    user = [[User alloc] initWithDict: userDict];

}

- (void)tearDown {

    user = nil;
    [super tearDown];
}

- (void)testThatUserExists {
    
    NSLog(@"User Exists: %@", user);
    XCTAssertNotNil(user, @"should be able to create a User instance");
}

- (void)testThatUserHasName {
    
    NSLog(@"User has name: %@", user.name);
    XCTAssertNotNil(user.name, @"the user should have a name");
}

- (void)testThatUserHasPicture {
    
    NSLog(@"User has picture: %@", user.picture);
    XCTAssertNotNil(user.picture, @"the user should have picture");
}

- (void)testThatUserHasLocation {
    
    NSLog(@"User has location: %@", user.location);
    XCTAssertNotNil(user.location, @"the user should have location");
}

- (void)testThatUserHasGender {
    
    NSLog(@"User has : %@", user.gender);
    XCTAssertNotNil(user.gender, @"the user should have gender");
}

- (void)testThatUserHasEmail {
    
    NSLog(@"User has : %@", user.email);
    XCTAssertNotNil(user.email, @"the user should have an email");
}

- (void)testThatUserHasUsername {
    
    NSLog(@"User has : %@", user.username);
    XCTAssertNotNil(user.username, @"the user should have a username");
}

- (void)testThatUserHasPassword {
    
    NSLog(@"User has : %@", user.password);
    XCTAssertNotNil(user.password, @"the user should have a password");
}

- (void)testThatUserHasSalt {
    
    NSLog(@"User has : %@", user.salt);
    XCTAssertNotNil(user.salt, @"the user should have a salt");
}

- (void)testThatUserHasMd5 {
    
    NSLog(@"User has : %@", user.md5);
    XCTAssertNotNil(user.md5, @"the user should have an md5 ");
}

- (void)testThatUserHasSha1 {
    
    NSLog(@"User has : %@", user.sha1);
    XCTAssertNotNil(user.sha1, @"the user should have an sha1 ");
}

- (void)testThatUserHasSha256 {
    
    NSLog(@"User has : %@", user.sha256);
    XCTAssertNotNil(user.sha256, @"the user should have a ");
}

- (void)testThatUserHasRegistered {
    
    NSLog(@"User has : %@", user.registered);
    XCTAssertNotNil(user.registered, @"the user should have a ");
}

- (void)testThatUserHasDob {
    
    NSLog(@"User has : %@", user.dob);
    XCTAssertNotNil(user.dob, @"the user should have a ");
}

- (void)testThatUserHasPhone {
    
    NSLog(@"User has : %@", user.phone);
    XCTAssertNotNil(user.phone, @"the user should have a ");
}

- (void)testThatUserHasCell {
    
    NSLog(@"User has : %@", user.cell);
    XCTAssertNotNil(user.cell, @"the user should have a ");
}

- (void)testThatUserHasSSN {
    
    NSLog(@"User has : %@", user.SSN);
    XCTAssertNotNil(user.SSN, @"the user should have a ");
}

- (void)testThatUserHasNINO {
    
    NSLog(@"User has : %@", user.NINO);
    XCTAssertNotNil(user.NINO, @"the user should have a ");
}

- (void)testThatUserHasVersion {
    
    NSLog(@"User has : %@", user.version);
    XCTAssertNotNil(user.version, @"the user should have a ");
}

- (void)testThatUserHasNationality {
    
    NSLog(@"User has : %@", user.nationality);
    XCTAssertNotNil(user.nationality, @"the user should have a ");
}

- (void)testThatUserHasSeed {
    
    NSLog(@"User has : %@", user.seed);
    XCTAssertNotNil(user.seed, @"the user should have a ");
}

- (void)testThatUserHasTheRightName {
    
    NSDictionary *nameDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"Lynn", @"first",
                              @"Zhou", @"last",
                              @"Ms", @"title",
                              nil];
    
    
    XCTAssertEqualObjects(user.name.first, nameDict[@"first"], "the user should have the right first name");
    XCTAssertEqualObjects(user.name.last, nameDict[@"last"], "the user should have the right last name");
    XCTAssertEqualObjects(user.name.title, nameDict[@"title"], "the user should have the right title");
}


- (void)testThatUserHasTheRightPicture {
    
    NSDictionary *pictureDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                                 @"http://largeimage", @"large",
                                 @"http://medimage", @"medium",
                                 @"http://thumbimage", @"thumbnail",
                                 nil];
    

    XCTAssertEqualObjects(user.picture.large, pictureDict[@"large"], "the user should have the right large picture");
    XCTAssertEqualObjects(user.picture.medium, pictureDict[@"medium"], "the user should have the right medium picture");
    XCTAssertEqualObjects(user.picture.thumbnail, pictureDict[@"thumbnail"], "the user should have the right small picture");
}

- (void)testThatUserHasTheRightLocation {

    
    NSDictionary *locationDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  @"100 King St W", @"street",
                                  @"New York", @"city",
                                  @"New York", @"state",
                                  @"100000", @"zip",
                                  nil];
    

    XCTAssertEqualObjects(user.location.street, locationDict[@"street"], "the user's location should have the right street");
    XCTAssertEqualObjects(user.location.city, locationDict[@"city"], "the user's location should have the right city");
    XCTAssertEqualObjects(user.location.state, locationDict[@"state"], "the user's location should have the right state");
    XCTAssertEqualObjects(user.location.zip, locationDict[@"zip"], "the user's location should have the right zip");

}

- (void)testThatUserHasTheRightGender {
    
    XCTAssertEqualObjects(user.gender, @"F", "the user should have the right gender");
}

- (void)testThatUserHasTheRightEmail {
    
    XCTAssertEqualObjects(user.email, @"lynn@gmail.com", "the user should have the right email");
}

- (void)testThatUserHasTheRightUsername {
    
    XCTAssertEqualObjects(user.username, @"lzhou", "the user should have the right username");
}

- (void)testThatUserHasTheRightPassword {
    
    XCTAssertEqualObjects(user.password, @"th1s1sapassword", "the user should have the right password");
}

- (void)testThatUserHasTheRightSalt {
    
    XCTAssertEqualObjects(user.salt, @"2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824", "the user should have the right salt");
}

- (void)testThatUserHasTheRightMd5 {
    
    XCTAssertEqualObjects(user.md5, @"cf23df2207d99a74fbe169e3eba035e633b65d94", "the user should have the right md5 ");
}

- (void)testThatUserHasTheRightSha1 {
    
    XCTAssertEqualObjects(user.sha1, @"cf23df2207d99a74fbe169e3eba035e633b65d94", "the user should have the right sha1 ");
}

- (void)testThatUserHasTheRightSha256 {
    
    XCTAssertEqualObjects(user.sha256, @"cf23df2207d99a74fbe169e3eba035e633b65d94", "the user should have the right sha256 ");
}

- (void)testThatUserHasTheRightRegistered {
    
    XCTAssertEqualObjects(user.registered, @"yes", "the user should have the right registration");
}

- (void)testThatUserHasTheRightDob {
    
    XCTAssertEqualObjects(user.dob, @"1.1.2011", "the user should have the right dob");
}

- (void)testThatUserHasTheRightPhone {
    
    XCTAssertEqualObjects(user.phone, @"416-111-1234", "the user should have the right phone");
}

- (void)testThatUserHasTheRightCell {
    
    XCTAssertEqualObjects(user.cell, @"416-111-1234", "the user should have the right cell");
}

- (void)testThatUserHasTheRightSSN {
    
    XCTAssertEqualObjects(user.SSN, @"416111123", "the user should have the right SSN");
}

- (void)testThatUserHasTheRightNINO {
    
    XCTAssertEqualObjects(user.NINO, @"416111123", "the user should have the right NINO");
}

- (void)testThatUserHasTheRightVersion {
    
    XCTAssertEqualObjects(user.version, @"1.0", "the user should have the right version");
}

- (void)testThatUserHasTheRightNationality {
    
    XCTAssertEqualObjects(user.nationality, @"Canadian", "the user should have the right nationality");
}

- (void)testThatUserHasTheRightSeed {
    
    XCTAssertEqualObjects(user.seed, @"cf23df2207d99a74fbe169e3eba035e633b65d94", "the user should have the right seed");
}



@end
