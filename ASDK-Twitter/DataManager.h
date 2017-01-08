//
//  DataManager.h
//  Ash Apps Common Code
//
//  Created by Aaron Ash on 2/13/16.
//  Copyright © 2016 Ash Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FLOG.h"
#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>

@interface DataManager : NSObject {

}

@property (nonatomic, strong) NSString *domain;


@property (nonatomic, strong) ACAccount *twitterAccount;

+ (id)sharedManager;

-(void)getTweetsCompletion:(void (^)(NSArray *tweetsArray))completion error:(void (^)(NSDictionary *error))errorBlock;


@end
