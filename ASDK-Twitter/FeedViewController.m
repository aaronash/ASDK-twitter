//
//  FeedViewController.m
//  ASDK-Twitter
//
//  Created by Aaron Ash on 1/8/17.
//  Copyright © 2017 Ash Apps. All rights reserved.
//

#import "FeedViewController.h"
#import "TweetCellNode.h"

@interface FeedViewController () <ASTableDelegate, ASTableDataSource>

@property(nonatomic, strong) NSArray *tweets;

@end

@implementation FeedViewController

- (instancetype)init
{
    _tableNode = [[ASTableNode alloc] init];
    self = [super initWithNode:_tableNode];
    
    if (self) {
        self.navigationItem.title = @"Timeline";
        
        _tableNode.dataSource = self;
        _tableNode.delegate = self;
        
        [[DataManager sharedManager] getTweetsCompletion:^(NSArray *tweetsArray) {
            
            FLOG(@"got tweets.");
            self.tweets = tweetsArray;
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                [self.tableNode reloadData];
            });
            
            
        } error:^(NSDictionary *error) {
            FLOG(@"error: %@", error);
        }];
    }
    
    return self;
}

-(void)loadView {
    [super loadView];
    
    _tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - ASTableDataSource methods

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TweetObject *tweet = [self.tweets objectAtIndex:indexPath.row];
    
    ASCellNode *(^ASCellNodeBlock)() = ^ASCellNode *() {
        TweetCellNode *cell = [[TweetCellNode alloc] initWithTweetObject:tweet];
        return cell;
    };
    
    return ASCellNodeBlock;
}

#pragma mark - ASTableDelegate methods

// Receive a message that the tableView is near the end of its data set and more data should be fetched if necessary.
- (void)tableNode:(ASTableNode *)tableNode willBeginBatchFetchWithContext:(ASBatchContext *)context {
    //todo
}

@end
