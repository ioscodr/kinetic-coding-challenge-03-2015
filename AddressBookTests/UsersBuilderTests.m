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
#import "User.h"

@implementation UsersBuilderTests

static NSString *userJSON = @"{"
    @"\"results\": ["
    @"{"
    @"\"user\": {"
    @"\"gender\": \"male\","
    @"\"name\": {"
    @"\"title\": \"mr\","
    @"\"first\": \"robert\","
    @"\"last\": \"wallace\""
    @"},"
    @"\"location\": {"
    @"\"street\": \"3664 broadway\","
    @"\"city\": \"exeter\","
    @"\"state\": \"somerset\","
    @"\"zip\": \"86106\""
    @"},"
    @"\"email\": \"robert.wallace57@example.com\","
    @"\"username\": \"brownswan508\","
    @"\"password\": \"fruit\","
    @"\"salt\": \"9njiy5Pk\","
    @"\"md5\": \"daf3bca03e644c3e12ac604130061047\","
    @"\"sha1\": \"5c200ff6d6de5a80d714ab46dc6c8020c404b431\","
    @"\"sha256\": \"51a76929c3940a3143beaea9e254a2e515d894fc601d691686b7792d57574f81\","
    @"\"registered\": \"1336838694\","
    @"\"dob\": \"301985622\","
    @"\"phone\": \"0750-888-539\","
    @"\"cell\": \"02059-123-747\","
    @"\"NINO\": \"LA 10 94 35 U\","
    @"\"picture\": {"
    @"\"large\": \"http://api.randomuser.me/portraits/men/72.jpg\","
    @"\"medium\": \"http://api.randomuser.me/portraits/med/men/72.jpg\","
    @"\"thumbnail\": \"http://api.randomuser.me/portraits/thumb/men/72.jpg\""
    @"},"
    @"\"version\": \"0.5\","
    @"\"nationality\": \"GB\""
    @"},"
    @"\"seed\": \"b9ee743979e7a9c4\""
    @"},"
    @"{"
    @"\"user\": {"
    @"\"gender\": \"male\","
    @"\"name\": {"
    @"\"title\": \"mr\","
    @"\"first\": \"bernard\","
    @"\"last\": \"arnold\""
    @"},"
    @"\"location\": {"
    @"\"street\": \"2868 new street\","
    @"\"city\": \"aberdeen\","
    @"\"state\": \"avon\","
    @"\"zip\": \"83687\""
    @"},"
    @"\"email\": \"bernard.arnold39@example.com\","
    @"\"username\": \"silverbear54\","
    @"\"password\": \"paper\","
    @"\"salt\": \"G9BfMnC1\","
    @"\"md5\": \"2b2b753578769d51e2171b206f324797\","
    @"\"sha1\": \"6d24280adfb10948785e51259b999ad508a4c85a\","
    @"\"sha256\": \"fdb96501640fcc27fb120a1102de9ddd3b4e080fe6e52ca6f7727547350311a4\","
    @"\"registered\": \"1397935083\","
    @"\"dob\": \"268801644\","
    @"\"phone\": \"0798-861-185\","
    @"\"cell\": \"01397-791-468\","
    @"\"NINO\": \"PN 00 38 64 X\","
    @"\"picture\": {"
    @"\"large\": \"http://api.randomuser.me/portraits/men/70.jpg\","
    @"\"medium\": \"http://api.randomuser.me/portraits/med/men/70.jpg\","
    @"\"thumbnail\": \"http://api.randomuser.me/portraits/thumb/men/70.jpg\""
    @"},"
    @"\"version\": \"0.5\","
    @"\"nationality\": \"GB\""
    @"},"
    @"\"seed\": \"79d54fef667831ae\""
    @"},"
    @"{"
    @"\"user\": {"
    @"\"gender\": \"female\","
    @"\"name\": {"
    @"\"title\": \"ms\","
    @"\"first\": \"martha\","
    @"\"last\": \"reynolds\""
    @"},"
    @"\"location\": {"
    @"\"street\": \"7337 windsor road\","
    @"\"city\": \"nottingham\","
    @"\"state\": \"west midlands\","
    @"\"zip\": \"90361\""
    @"},"
    @"\"email\": \"martha.reynolds31@example.com\","
    @"\"username\": \"tinyfish392\","
    @"\"password\": \"sprite\","
    @"\"salt\": \"JzfmwqQU\","
    @"\"md5\": \"c3831b60c74716391b3099389dd80946\","
    @"\"sha1\": \"600d7314e498749984d74c82bb950c17497f8f2c\","
    @"\"sha256\": \"35b82f64d499f90484b8fb8b955528588f6015d10dcecc781a1696f1e88adbe6\","
    @"\"registered\": \"1368293208\","
    @"\"dob\": \"369615529\","
    @"\"phone\": \"0778-354-733\","
    @"\"cell\": \"02575-369-773\","
    @"\"NINO\": \"ER 33 69 60 H\","
    @"\"picture\": {"
    @"\"large\": \"http://api.randomuser.me/portraits/women/59.jpg\","
    @"\"medium\": \"http://api.randomuser.me/portraits/med/women/59.jpg\","
    @"\"thumbnail\": \"http://api.randomuser.me/portraits/thumb/women/59.jpg\""
    @"},"
    @"\"version\": \"0.5\","
    @"\"nationality\": \"GB\""
    @"},"
    @"\"seed\": \"58341b91ce64f82c\""
    @"},"
    @"]"
    @"}";
    

static NSString *stringIsNotJSON = @"Not JSON";
static NSString *noUsersJSONString = @"{ \"nousers\": true }";
static NSString *emptyResultsArrayJSON = @"{ \"results\": [] }";


- (void)setUp {
    [super setUp];
    
    NSData *data = [userJSON dataUsingEncoding:NSUTF8StringEncoding];
    usersArray = [UsersBuilder usersFromJson:data];

}

- (void)tearDown {
    
    usersArray = nil;
    [super tearDown];
}

- (void)testNilReturnedWhenStringIsNotJSON {
    
    NSData *data = [stringIsNotJSON dataUsingEncoding:NSUTF8StringEncoding];
    usersArray = [UsersBuilder usersFromJson:data];

    XCTAssertNil(usersArray, @"This parameter should not be parsable");
    NSLog(@"");
}


- (void)testUsersCreatedFromJSONHasPropertiesPresentedInJSON {

    //This is a stub - implement me!

}

- (void)testRealJSONWithoutUsersIsNil {
    
    NSData *data = [noUsersJSONString dataUsingEncoding:NSUTF8StringEncoding];
    usersArray = [UsersBuilder usersFromJson:data];
    
    XCTAssertNil(usersArray, @"This parameter should not be parsable");
    NSLog(@"");
}



- (void)testQuestionCreatedFromJSONHasPropertiesPresentedInJSON {

    
    User *firstUser = [usersArray objectAtIndex:0];
    User *secondUser = [usersArray objectAtIndex:1];
    User *thirdUser = [usersArray objectAtIndex:2];
    
    XCTAssertEqualObjects(firstUser.name.first, @"bernard", "the first user should be bernard");
    XCTAssertEqualObjects(secondUser.name.first, @"martha", "the second user should be martha");
    XCTAssertEqualObjects(thirdUser.name.first, @"robert", "the third user should be robert");

    XCTAssertEqualObjects(firstUser.dob, @"268801644", "the first user's dob should be 268801644");
    XCTAssertEqualObjects(secondUser.dob, @"369615529", "the second user's dob should be 369615529");
    XCTAssertEqualObjects(thirdUser.dob, @"301985622", "the third user's dob should be 301985622");
    
    //Continue testing all fields...
    
}

- (void)testEmptyResultsArrayDoesNotCrash {

    NSArray *usersEmptyResultsArray;
    NSData *data = [emptyResultsArrayJSON dataUsingEncoding:NSUTF8StringEncoding];
    usersEmptyResultsArray = [UsersBuilder usersFromJson:data];
    
    XCTAssertNoThrow(usersEmptyResultsArray, @"This parameter should not be parsable");
    NSLog(@"");
}

- (void)testSortUsersByFirstName {

    NSMutableArray *shuffledUsersArray = [usersArray mutableCopy];

    //Shuffle the users in the array
    NSUInteger count = [usersArray count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [shuffledUsersArray exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
    
    usersArray = [UsersBuilder sortUsersByFirstName:shuffledUsersArray];
    //bernard, martha, robert
    
    User *firstUser = [usersArray objectAtIndex:0];
    User *secondUser = [usersArray objectAtIndex:1];
    User *thirdUser = [usersArray objectAtIndex:2];
    
    XCTAssertEqualObjects(firstUser.name.first, @"bernard", "the first user should be bernard");
    XCTAssertEqualObjects(secondUser.name.first, @"martha", "the second user should be martha");
    XCTAssertEqualObjects(thirdUser.name.first, @"robert", "the third user should be robert");
}


@end
