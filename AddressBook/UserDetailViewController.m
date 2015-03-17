//
//  UserDetailViewController.m
//  AddressBookTest
//
//  Created by lzh on 2015-03-07.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import "UserDetailViewController.h"
#import "MainViewController.h"
#import "Utility.h"

@interface UserDetailViewController ()

@end

@implementation UserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"DetailCell"];
    
    self.sectionTitles = [NSArray arrayWithObjects:@"Name", @"Email", @"Phone",@"Address",@"Other",nil];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, PROFILE_PIC_WIDTH)];
    self.profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.tableView.frame.size.width/2-75.0f, 10.0f, 150.0f, 150.0f)];
    
    NSString *imageUrl = self.user.picture.large;

    NSURL *url = [NSURL URLWithString:imageUrl];

    // set default user image while image is being downloaded
    self.profileImageView.image = [UIImage imageNamed:@"default-profile-pic.jpg"];

    self.ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.ai.center = CGPointMake(self.profileImageView.bounds.size.width/2,
                                      self.profileImageView.bounds.size.height/2);
    [self.profileImageView addSubview:self.ai];
    [self.ai startAnimating];

    // download the image asynchronously
    [self downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {

        //hide spinner
        [self.ai stopAnimating];

        if (succeeded) {

            // update the image
            self.profileImageView.image = image;
            
        }
        else {
            NSLog(@"image download error");
            
        }
    }];
    
    //rounded corners
    self.profileImageView.layer.borderWidth = 3.0f;
    self.profileImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.profileImageView.layer.cornerRadius = 30.0f;
    self.profileImageView.clipsToBounds = YES;

    [headerView addSubview:self.profileImageView];
    self.tableView.tableHeaderView = headerView;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return self.sectionTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    switch (section ) {

        //name
        case kName:
            return ROWS_NAME;
            break;
        //email
        case kEmail:
            return ROWS_EMAIL;
            break;
        //phone
        case kPhone:
            return ROWS_PHONE;
            break;
        //address
        case kAddress:
            return ROWS_ADDRESS;
            break;
        default:
            return 1;
            break;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell" forIndexPath:indexPath];
    
    // Configure the cell...
    switch (indexPath.section ) {
            
        case kName:
            
            //Refactor call another method - this makes it easier to test
            
            if (indexPath.row == 0)
                cell.textLabel.text = [Utility firstLetterCaps:self.user.name.first];
            else if (indexPath.row == 1)
                cell.textLabel.text = [Utility firstLetterCaps:self.user.name.last];
            break;
        case kEmail:
            cell.textLabel.text = self.user.email;
            break;
        case kPhone:
            if (indexPath.row == 0)
                cell.textLabel.text = self.user.phone;
            else if (indexPath.row == 1)
                cell.textLabel.text = self.user.cell;
            break;
        case kAddress:
            if (indexPath.row == 0)
                cell.textLabel.text = self.user.location.city;
            else if (indexPath.row == 1)
                cell.textLabel.text = self.user.location.state;
            else if (indexPath.row == 2)
                cell.textLabel.text = self.user.location.street;
            else if (indexPath.row == 3)
                cell.textLabel.text = self.user.location.zip;
            else if (indexPath.row == 4)
                cell.textLabel.text = self.user.nationality;
            break;
        default:
            break;
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    return [self.sectionTitles objectAtIndex:section];
}


- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                   UIImage *image = [[UIImage alloc] initWithData:data];
                                   completionBlock(YES,image);
                               } else{
                                   completionBlock(NO,nil);
                               }
                           }];
}


@end
