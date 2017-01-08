//
//  TweetObject.h
//  ASDK-Twitter
//
//  Created by Aaron Ash on 1/9/17.
//  Copyright © 2017 Ash Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TweetObject : NSObject

@property(nonatomic, strong) NSDictionary *originalDictionary;



-(id)initWithDictionary:(NSDictionary*)dict;

-(NSString*)text;
-(NSString*)username;
-(NSURL*)profileImageURL;

@end
