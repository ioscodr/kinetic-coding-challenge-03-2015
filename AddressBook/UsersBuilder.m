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


+ (NSMutableArray *) usersFromJson: (NSData *) resultsData {

    if (!resultsData)
        return nil;

    NSMutableArray *users;
    NSError *localError = nil;
    NSDictionary *parsedJsonDict = [NSJSONSerialization
                                    JSONObjectWithData:resultsData
                                    options:0
                                    error:&localError];
    
    if (!parsedJsonDict) {
        
        NSLog(@"Error parsing JSON: %@", localError);
        return nil;
        
    } else {
        
        //Array for holding User objects
        users = [[NSMutableArray alloc] init];
        
        //get results of json feed
        NSArray *resultsArray = [parsedJsonDict valueForKey:@"results"];
        
        if (!resultsArray)
            return nil;
        
        for (NSDictionary *resultDict in resultsArray) {
            
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
