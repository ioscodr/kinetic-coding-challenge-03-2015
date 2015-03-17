//
//  UsersBuilder.h
//  AddressBookTest
//
//  Created by lzh on 2015-03-10.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Construct array of User instances from dictionaries describing them.
 */
@interface UsersBuilder : NSObject


/**
 * Given a json string that describes users on Random Me, create
 * an array of Users with the supplied properties.
 */
+ (NSMutableArray *) usersFromJson: (NSData *) results;

+ (NSMutableArray *) sortUsersByFirstName: (NSMutableArray *) usersArray;


@end
