//
//  UserDetailViewController.h
//  AddressBookTest
//
//  Created by lzh on 2015-03-07.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"


/*These constants are only used in UserDetailViewController*/

typedef enum{
    kName = 0,
    kEmail = 1,
    kPhone = 2,
    kAddress = 3
} eUserInfoType;

static const int ROWS_NAME = 2 ;
static const int ROWS_EMAIL = 1 ;
static const int ROWS_PHONE = 2 ;
static const int ROWS_ADDRESS = 4 ;
static const int PROFILE_PIC_WIDTH = 150 ;


@interface UserDetailViewController : UITableViewController

@property (strong, nonatomic) User *user;
@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) NSArray *sectionTitles;
@property (strong, nonatomic) UIImageView *profileImageView;
@property (strong, nonatomic) UIActivityIndicatorView *ai;

@end
