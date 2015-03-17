//
//  Utility.m
//  AddressBookTest
//
//  Created by lzh on 2015-03-10.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import "Utility.h"

@implementation Utility

// Capitalize the first letter of input string

+ (NSString *) firstLetterCaps:(NSString*)text {
    
    NSString *capitalized = [[[text substringToIndex:1] uppercaseString] stringByAppendingString:[text substringFromIndex:1]];
    
    NSLog(@"%@ uppercased is %@", text, capitalized);
    return capitalized;
}

@end
