//
//  MainCardView.h
//  TestQuestions
//
//  Created by Andriy Kupich on 3/22/15.
//  Copyright (c) 2015 ArtfulBits. All rights reserved.
//

#import <UIKit/UIKit.h>

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

@interface MainCardView : UIView
{
 
    struct PositionView _viewPosition;
    
    enum statesPosition _currentPosition;
    
}

@property  (nonatomic) enum statesPosition currentPosition;

- (void)setCurrentPosition:(enum statesPosition)currentPosition;

@end
