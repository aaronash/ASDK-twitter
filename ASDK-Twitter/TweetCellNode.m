//
//  TweetCellNode.m
//  ASDK-Twitter
//
//  Created by Aaron Ash on 1/9/17.
//  Copyright © 2017 Ash Apps. All rights reserved.
//

#import "TweetCellNode.h"
#import "NSAttributedString+AshApps.h"

@interface TweetCellNode ()

@property(nonatomic, strong) ASTextNode *nameNode;
@property(nonatomic, strong) ASTextNode *tweetTextNode;

@property(nonatomic, strong) ASNetworkImageNode *profilePic;
@property(nonatomic, strong) ASDisplayNode *divider;

@end

@implementation TweetCellNode


- (instancetype)initWithTweetObject:(TweetObject *)aTweet {
    self = [super init];
    
    if (self) {
        
        
        
//        cell.preservesSuperviewLayoutMargins = false
//        cell.separatorInset = UIEdgeInsetsZero
//        cell.layoutMargins = UIEdgeInsetsZero
        
        self.tweet = aTweet;
        
        self.nameNode = [[ASTextNode alloc] init];
        _nameNode.attributedText = [NSAttributedString attributedStringWithString:self.tweet.username font:[UIFont boldSystemFontOfSize:14] color:[UIColor blackColor] firstWordColor:nil];
        
        
        self.tweetTextNode = [[ASTextNode alloc] init];
        
        _tweetTextNode.attributedText = [NSAttributedString attributedStringWithString:self.tweet.text font:[UIFont systemFontOfSize:12] color:[UIColor blackColor] firstWordColor:nil];
        
        self.profilePic = [[ASNetworkImageNode alloc] init];
        self.profilePic.URL = self.tweet.profileImageURL;
        self.profilePic.style.width = ASDimensionMakeWithPoints(22);
        self.profilePic.style.height = ASDimensionMakeWithPoints(22);
        self.profilePic.cornerRadius = 11.0;
        
        _divider = [[ASDisplayNode alloc] init];
        _divider.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
        [self addSubnode:_divider];
        
        self.automaticallyManagesSubnodes = true;
    }
    return self;
}

- (void)layout {
    [super layout];
    
    // Manually layout the divider.
    CGFloat pixelHeight = 1.0f / [[UIScreen mainScreen] scale];
    _divider.frame = CGRectMake(0.0f, 0.0f, self.calculatedSize.width, pixelHeight);
}


- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    ASStackLayoutSpec *stack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStretch children:@[_nameNode, _tweetTextNode]];
    
    stack.style.flexShrink = 1.0;
    
    ASStackLayoutSpec *horizontalStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:10 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[_profilePic, stack]];
    
    ASInsetLayoutSpec *inset = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:horizontalStack];
    
    return inset;
}

@end
