//
//  PersonModel.m
//  AddressBookTest
//
//  Created by lzh on 2015-03-06.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import "User.h"

@implementation User


- (id)initWithDict:(NSDictionary *)dict {

    for (NSString *key in [dict allKeys]) {
        

        [self setValue:dict[key] forKey:key];
        
        if ([key isEqualToString:@"name"]) {
            
            NSDictionary *nameDict = dict[key];
            self.name = [[Name alloc] initWithDict:nameDict];
            
        }
        else if ([key isEqualToString:@"location"]) {
            
            self.location = [[Location alloc] initWithDict:dict[key]];
            
        }
        else if ([key isEqualToString:@"picture"]) {
            
            self.picture = [[Picture alloc] initWithDict:dict[key]];
            
        }
    }
    
    return self;
}

- (id)valueForUndefinedKey:(NSString *)key;
{
    return nil;
}

@end
