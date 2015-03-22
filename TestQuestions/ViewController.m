//
//  ViewController.m
//  TestQuestions
//
//  Created by Andriy Kupich on 3/22/15.
//  Copyright (c) 2015 ArtfulBits. All rights reserved.
//

#import "ViewController.h"
#import "MainCardView.h"

const int cardsType = 4;

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *cardViews;
@property NSInteger cardsAmount;
@property NSInteger currentCard;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cardsAmount = 4;
    
    self.cardViews = [[NSMutableArray alloc] init];
    
    [self.cardViews addObject:[MainCardView frontCard]];
    [self.cardViews addObject:[MainCardView backCard]];
    [self.cardViews addObject:[MainCardView inQueueCard]];
    for (int i = 0; i < self.cardsAmount-3; i++) {
        [self.cardViews addObject:[MainCardView invisibleCard]];
    }
    
    for (int i = (int)[self.cardViews count]-1; i--; i >= 0) {
        [self.view addSubview:self.cardViews[i]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
