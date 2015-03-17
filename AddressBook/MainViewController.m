//
//  MasterViewController.m
//  AddressBookTest
//
//  Created by lzh on 2015-03-06.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import "MainViewController.h"
#import "UserDetailViewController.h"
#import "AddressBookCommunicator.h"
#import "User.h"
#import "Utility.h"
#import "UsersBuilder.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)awakeFromNib {

    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.communicator = [[AddressBookCommunicator alloc] init];
    self.communicator.delegate = self;

    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                   target:self
                                                                                   action:@selector(refreshList:)];
    
    self.navigationItem.leftBarButtonItem = refreshButton;
    self.ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.ai];
    
    self.userDetailViewController = (UserDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    //For testing only
    //[self loadJsonFile];

    [self.communicator downloadUsers];
    [self.ai startAnimating];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        UserDetailViewController *controller = (UserDetailViewController *)[[segue destinationViewController] topViewController];
        
        NSInteger row = [self.tableView indexPathForSelectedRow].row;
        controller.user = [self.usersArray objectAtIndex:row];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSLog(@"Section titles count: %lu", (unsigned long)[self.sectionTitles count]);
    return [self.sectionTitles count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [self.sectionTitles objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSString *sectionTitle = [self.sectionTitles objectAtIndex:section];
    NSArray *sectionUsers = [self.usersDict objectForKey:sectionTitle];
    
    NSLog(@"Section users count: %lu", (unsigned long)[sectionUsers count]);

    return [sectionUsers count];
    
    //return self.usersArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *sectionTitle = [self.sectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionUsers = [self.usersDict objectForKey:sectionTitle];
    User *user = [sectionUsers objectAtIndex:indexPath.row];

    NSString *fullName = [NSString stringWithFormat:@"%@ %@", [Utility firstLetterCaps:user.name.first], [Utility firstLetterCaps:user.name.last]];
    
    cell.textLabel.text = fullName;
    
    NSLog(@"Section users name: %@", fullName);

    return cell;
}



#pragma mark - Handle JSON Data


//For testing only
- (void)loadJsonFile {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"users" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    [self receivedUsersJSON:data];
    
}

- (void)fetchingUsersFailedWithError: (NSError *)error{

    [self.ai stopAnimating];
    [self showAlertFor:@"Download failed" andMessage:@"aaa"];

    //implement further error handling here

    
}

- (void)receivedUsersJSON: (NSData *)responseData {

    self.usersArray = [UsersBuilder usersFromJson:responseData];
    
    self.usersDict = [NSMutableDictionary dictionary];
    
    for (User *user in self.usersArray) {
        NSString *firstLetter = [[user.name.first substringToIndex:1] uppercaseString];
        NSMutableArray *letterList = [self.usersDict objectForKey:firstLetter];
        if (!letterList) {
            letterList = [NSMutableArray array];
            [self.usersDict setObject:letterList forKey:firstLetter];
        }
        [letterList addObject:user];
    }
    
    self.sectionTitles = [[self.usersDict allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];

    
    [self.ai stopAnimating];
    
    [self.tableView reloadData];
}


//Handle user actions
- (void)refreshList:(id)sender {
    [self.communicator downloadUsers];
}


//Helper methods
- (void) showAlertFor:(NSString *)title andMessage:(NSString*)message
{
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc]
                   initWithTitle:title
                   message:message
                   delegate: self
                   cancelButtonTitle: nil
                   otherButtonTitles: @"OK", nil];
    
    [alertDialog
     performSelector:@selector(show)
     onThread:[NSThread mainThread]
     withObject:nil
     waitUntilDone:NO];
}

@end
