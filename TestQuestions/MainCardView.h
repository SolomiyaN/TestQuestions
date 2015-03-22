//
//  MainCardView.h
//  TestQuestions
//
//  Created by Andriy Kupich on 3/22/15.
//  Copyright (c) 2015 ArtfulBits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChildCardView.h"
enum statesPosition
{
    front,
    back,
    inQueue,
    invisible
};

struct PositionView
{
    CGPoint position;
    CGSize size;
};

@protocol MainCardViewDelegate <NSObject>

- (void)changeCards;

@end

@interface MainCardView : UIView
{
    enum statesPosition _currentPosition;
    ChildCardView * _child;
}

@property  (nonatomic) enum statesPosition currentPosition;
@property (nonatomic, weak) id<MainCardViewDelegate> delegate;

- (void)setCurrentPosition:(enum statesPosition)currentPosition;

+ (instancetype)frontCard;
+ (instancetype)backCard;
+ (instancetype)inQueueCard;
+ (instancetype)invisibleCard;

@end
