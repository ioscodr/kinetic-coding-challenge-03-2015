//
//  UsersBuilder.m
//  AddressBookTest
//
//  Created by lzh on 2015-03-10.
//  Copyright (c) 2015 lzh. All rights reserved.
//

#import "UsersBuilder.h"
#import "User.h"

@implementation UsersBuilder


+ (NSMutableArray *) usersFromJson: (NSData *) results {


    NSMutableArray *users;
    
    NSError *localError = nil;
    
    //NOTE: sometimes responseData is nil and this crashes
    //Handle this!
    NSDictionary *parsedJsonDict = [NSJSONSerialization
                                    JSONObjectWithData:results
                                    options:0
                                    error:&localError];
    
    if (!parsedJsonDict) {
        
        NSLog(@"Error parsing JSON: %@", localError);
        
    } else {
        
        //Array for holding User objects
        users = [[NSMutableArray alloc] init];
        
        //get results of json feed
        NSArray *results = [parsedJsonDict valueForKey:@"results"];
        
        for (NSDictionary *resultDict in results) {
            
            //Get user data from results dictionary
            NSDictionary *userDict = [resultDict objectForKey:@"user"];
            
            //Instantiate user object
            User *user = [[User alloc] initWithDict:userDict];
            [users addObject:user];
        }
        
    }
    
    users = [UsersBuilder sortUsersByFirstName:users];
    
    //NSLog(@"json: %@", parsedJson);
    return users;

    
}


+ (NSMutableArray*)sortUsersByFirstName:(NSMutableArray *)usersArray {
    
    //create a sort descriptor
    NSSortDescriptor *firstNameSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name.first"
                                                                              ascending:YES
                                                                               selector:@selector(localizedCaseInsensitiveCompare:)];
    
    //sort array of names
    return [NSMutableArray arrayWithArray:[usersArray sortedArrayUsingDescriptors:@[firstNameSortDescriptor]]];
}


@end
