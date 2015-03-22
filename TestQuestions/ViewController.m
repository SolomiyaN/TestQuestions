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

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a
    
    MainCardView *mainCard = [[MainCardView alloc] init];
    mainCard.currentPosition = back;
    [self.view addSubview:mainCard];
    
    MainCardView *mainCard1 = [[MainCardView alloc] init];
    mainCard1.currentPosition = front;
    [self.view addSubview:mainCard1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
