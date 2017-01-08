//
//  TweetObject.m
//  ASDK-Twitter
//
//  Created by Aaron Ash on 1/9/17.
//  Copyright © 2017 Ash Apps. All rights reserved.
//

#import "TweetObject.h"

@implementation TweetObject


-(id)initWithDictionary:(NSDictionary*)dict {
    if (self = [super init]) {
        self.originalDictionary = dict; //[dict dictionaryByReplacingNullsWithNils];
    }
    return self;
}

-(NSString*)text {
    return self.originalDictionary[@"text"];
}

-(NSString*)username {
    return self.originalDictionary[@"user"][@"name"];
}

-(NSURL*)profileImageURL {
    return [NSURL URLWithString:self.originalDictionary[@"user"][@"profile_image_url_https"]];
}


@end
