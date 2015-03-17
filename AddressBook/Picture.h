//
//  Picture.h
//  AddressBookTest
//
//  Created by lzh on 2015-03-10.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Picture : NSObject

@property (strong, nonatomic) NSString *large;
@property (strong, nonatomic) NSString *medium;
@property (strong, nonatomic) NSString *thumbnail;

- (id)initWithDict:(NSDictionary *)dict;

@end
