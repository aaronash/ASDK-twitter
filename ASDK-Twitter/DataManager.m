//
//  DataManager.m
//  Ash Apps Common Code
//
//  Created by Aaron Ash on 2/13/16.
//  Copyright © 2016 Ash Apps. All rights reserved.
//

#import "DataManager.h"
#import <Foundation/Foundation.h>
#import "FLOG.h"
#import "TweetObject.h"


@implementation DataManager


#pragma mark Singleton Methods

+ (id)sharedManager {
    static DataManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(void)getTweetsCompletion:(void (^)(NSArray *tweetsArray))completion error:(void (^)(NSDictionary *error))errorBlock {
    FLOG(@"getTweets");
    
    if (!self.twitterAccount) {
        FLOG(@"no access to local twitter account yet. Allow and rerun.");
        return;
    }
    
//    TWRequest *request = [[TWRequest alloc] initWithURL:[NSURL URLWithString:@"https://dev.twitter.com/docs/api/1.1/get/statuses/user_timeline"] parameters:nil requestMethod:TWRequestMethodGET];
    
    
    
    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/home_timeline.json"] parameters:nil];
    request.account = self.twitterAccount;
    
    [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
        
        if (error) {
            FLOG(@"error: %@", error);
        }
        
        NSError *parseError;
        NSArray *array = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&parseError];
        
        if (parseError) {
            FLOG(@"parseError: %@", parseError);
            errorBlock(nil);
            return;
        }
        
//        FLOG(@"array: %@", array);
//        FLOG(@"array: %@", [array class]);

        NSMutableArray *parsedTweets = [[NSMutableArray alloc] init];
        
        FLOG(@"firstObject: %@", array.firstObject);
        
        for (NSDictionary *dict in array) {
            TweetObject *tweet = [[TweetObject alloc] initWithDictionary:dict];
            [parsedTweets addObject:tweet];
        }
        
        FLOG(@"parsedTweets: %@", parsedTweets);
        
        completion(parsedTweets);
        
//        FLOG(@"responseData: %@", responseData);
//        FLOG(@"urlResponse: %@", urlResponse);
//        FLOG(@"error: %@", error);
    }];
    
}

- (id)init {
    if (self = [super init]) {
//        [self askForAccounts];
        [self loadAccounts];
    }
    return self;
}

-(void)loadAccounts {
    FLOG(@"loadAccounts");
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    
    NSArray *accountsArray = [accountStore accountsWithAccountType:accountType];
    FLOG(@"accountsArray: %@", accountsArray);
    
    if (!accountsArray) {
        [self askForAccounts];
        return;
    }
    
    self.twitterAccount = [accountsArray firstObject];
    
    
    FLOG(@"self.twitterAccount: %@", self.twitterAccount);
    
}

-(void)askForAccounts {
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    
    [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
        FLOG(@"granted: %i", granted);
        FLOG(@"error: %@", error);

        [self loadAccounts];
    }];
}

@end
