//
//  PictureTests.m
//  AddressBookTest
//
//  Created by lzh on 2015-03-14.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Picture.h"
#import "PictureTests.h"


@implementation PictureTests

- (void)setUp {
    [super setUp];
    
    NSDictionary *pictureDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                                 @"http://largeimage", @"large",
                                 @"http://mediumimage", @"medium",
                                 @"http://thumbimage", @"thumbnail",
                                 nil];
    
    picture = [[Picture alloc] initWithDict: pictureDict];

}

- (void)tearDown {

    picture = nil;
    [super tearDown];
}

- (void)testThatPictureExists {
    
    XCTAssertNotNil(picture, @"should be able to create a Picutre instance");
}

- (void)testPictureHasLargeUrl {

    NSLog(@"Picture has has : %@", picture.large);
    XCTAssertNotNil(picture.large, @"the picture should have a large url");
}

- (void)testPictureHasMediumUrl {

    NSLog(@"Picture has has : %@", picture.medium);
    XCTAssertNotNil(picture.medium, @"the picture should have a medium url");
}

- (void)testPictureHasThumbnailUrl {

    NSLog(@"Picture has has : %@", picture.thumbnail);
    XCTAssertNotNil(picture.thumbnail, @"the picture should have a thumbnail url");
}

- (void)testThatPictureHasRightLargeUrl {
    
    XCTAssertEqualObjects(picture.large, @"http://largeimage", "the picture should have the right large url");
}

- (void)testThatPictureHasRightMediumUrl {
    
    XCTAssertEqualObjects(picture.medium, @"http://mediumimage", "the picture should have the right medium url");
}

- (void)testThatPictureHasRightThumbnailUrl {
    
    XCTAssertEqualObjects(picture.thumbnail, @"http://thumbimage", "the picture should have the right thumbnail url");
}



@end
