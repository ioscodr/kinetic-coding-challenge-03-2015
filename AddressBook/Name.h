//
//  Name.h
//  AddressBookTest
//
//  Created by lzh on 2015-03-10.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Name : NSObject

@property (strong, nonatomic, readwrite) NSString *title;
@property (strong, nonatomic, readwrite) NSString *first;
@property (strong, nonatomic, readwrite) NSString *last;

- (id)initWithDict:(NSDictionary *)dict;

@end
