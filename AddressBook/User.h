//
//  PersonModel.h
//  AddressBookTest
//
//  Created by lzh on 2015-03-06.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Name.h"
#import "Location.h"
#import "Picture.h"


@interface User : NSObject

@property (strong, nonatomic) Name *name;
@property (strong, nonatomic) Location *location;
@property (strong, nonatomic) Picture *picture;

@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *salt;
@property (strong, nonatomic) NSString *md5;
@property (strong, nonatomic) NSString *sha1;
@property (strong, nonatomic) NSString *sha256;
@property (strong, nonatomic) NSString *registered;
@property (strong, nonatomic) NSString *dob;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *cell;
@property (strong, nonatomic) NSString *SSN;
@property (strong, nonatomic) NSString *NINO;
@property (strong, nonatomic) NSString *version;
@property (strong, nonatomic) NSString *nationality;

@property (strong, nonatomic) NSString *seed;


- (id)initWithDict:(NSDictionary *)dict;


@end
