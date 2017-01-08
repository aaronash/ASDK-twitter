//
//  TweetCellNode.h
//  ASDK-Twitter
//
//  Created by Aaron Ash on 1/9/17.
//  Copyright © 2017 Ash Apps. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "TweetObject.h"

@interface TweetCellNode : ASCellNode

@property(nonatomic, strong) TweetObject *tweet;


- (instancetype)initWithTweetObject:(TweetObject *)aTweet;

@end
