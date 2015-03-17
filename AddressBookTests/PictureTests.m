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
                                 @"http://medimage", @"medium",
                                 @"http://thumbimage", @"thumbnail",
                                 nil];

    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    picture = [[Picture alloc] initWithDict: pictureDict];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatPictureExists {
    
    XCTAssertNotNil(picture, @"should be able to create a Picutre instance");
}

- (void)testPictureHasLargeUrl {

    // This is a method stub - finish it!

}

- (void)testPictureHasMediumUrl {

    // This is a method stub - finish it!

}

- (void)testPictureHasThumbnailUrl {

    // This is a method stub - finish it!

}

- (void)testEmptyPicturesDictDoesNotCrash {

    // This is a method stub - finish it!

}


@end
