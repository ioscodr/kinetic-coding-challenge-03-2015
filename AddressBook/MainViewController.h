//
//  MasterViewController.h
//  AddressBookTest
//
//  Created by lzh on 2015-03-06.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressBookCommunicator.h"

@class UserDetailViewController;

@interface MainViewController : UITableViewController <AddressBookCommunicatorDelegate>

@property (nonatomic, strong) AddressBookCommunicator *communicator;
@property (strong, nonatomic) UserDetailViewController *userDetailViewController;
@property (strong, nonatomic) NSMutableArray *usersArray;
@property (strong, nonatomic) NSMutableDictionary *usersDict;
@property (strong, nonatomic) UIActivityIndicatorView *ai;

//AddressBookCommunicatorDelegate methods
- (void)fetchingUsersFailedWithError: (NSError *)error;
- (void)receivedUsersJSON: (NSData *)responseData;

//@property (nonatomic, strong) NSArray *usersIndexTitles;
@property (nonatomic, strong) NSArray *sectionTitles;


@end

