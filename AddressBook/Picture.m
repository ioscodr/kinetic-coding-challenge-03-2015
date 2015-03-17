//
//  Picture.m
//  AddressBookTest
//
//  Created by lzh on 2015-03-10.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import "Picture.h"

@implementation Picture

- (id)initWithDict:(NSDictionary *)dict {
    
    for (NSString *key in [dict allKeys]) {
        [self setValue:dict[key] forKey:key];
    }
    
    return self;
}

@end
