//
//  ViewController.m
//  TestQuestions
//
//  Created by Andriy Kupich on 3/22/15.
//  Copyright (c) 2015 ArtfulBits. All rights reserved.
//

#import "ViewController.h"
#import "MainCardView.h"
#import "CardsEnumarator.h"
#import "DataDownloader.h"

const int cardsType = 4;

@interface ViewController () <MainCardViewDelegate>

@property (nonatomic, strong) NSMutableArray *cardViews;

@property NSInteger cardsAmount;
@property NSInteger currentCard;

@property (nonatomic, strong) CardsEnumarator *cardsEnumarator;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cardsAmount = 4;
    self.cardsEnumarator = [CardsEnumarator cardEnumaratorWithMaxNumber:self.cardsAmount-1];
    
    self.cardViews = [[NSMutableArray alloc] init];
    
    [self.cardViews addObject:[MainCardView frontCard]];
    [self.cardViews addObject:[MainCardView backCard]];
    [self.cardViews addObject:[MainCardView inQueueCard]];
    for (int i = 0; i < self.cardsAmount-3; i++) {
        [self.cardViews addObject:[MainCardView invisibleCard]];
    }
    
    for (int i = (int)[self.cardViews count]; i >= 0; i--) {
        [self.view addSubview:self.cardViews[i]];
        ((MainCardView *)self.cardViews[i]).delegate = self;
    }
    
    self.currentCard = 0;
    DataDownloader *dataDownloader = [DataDownloader new];
    [dataDownloader downloadDataWithCompletion:^(BOOL finished, NSMutableArray *responseArray) {
        if(finished){
            NSLog(@"RESPONSE: %@", responseArray);
        }
    }];
}

#pragma marks - MainCardViewDelegate Methods

- (void)changeCards {
    
    [self.view sendSubviewToBack:((MainCardView *)self.cardViews[self.currentCard])];
    self.currentCard = [self.cardsEnumarator nextTo:self.currentCard];

    NSInteger frontCardPosition = [self.cardViews indexOfObject:self.cardViews[self.currentCard]];
    ((MainCardView *)self.cardViews[frontCardPosition]).currentPosition = front;
    
    NSInteger backCardPosition = [self.cardsEnumarator nextTo:frontCardPosition];
    ((MainCardView *)self.cardViews[backCardPosition]).currentPosition = back;
    
    NSInteger inqueueCardPosition = [self.cardsEnumarator nextTo:backCardPosition];
    ((MainCardView *)self.cardViews[inqueueCardPosition]).currentPosition = inQueue;
}



@end
