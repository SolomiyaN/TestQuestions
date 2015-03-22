//
//  MainCardView.m
//  TestQuestions
//
//  Created by Andriy Kupich on 3/22/15.
//  Copyright (c) 2015 ArtfulBits. All rights reserved.
//

#import "MainCardView.h"

const float kFrontHorizontalPersent = 90.f;
const float kFrontVerticalPersent = 75.f;

const float kBackHorizontalPersent = 80.f;
const float kBackVerticalPersent = 65.f;

const float kKoeficientScale = 5.f;
@implementation MainCardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)defaultCard {
    return [[MainCardView alloc] init];
}

+ (instancetype)frontCard {
    MainCardView *card = [self defaultCard];
    card.currentPosition = front;
    return card;
}

+ (instancetype)backCard {
    MainCardView *card = [self defaultCard];
    card.currentPosition = back;
    return card;
}

+ (instancetype)inQueueCard {
    MainCardView *card = [self defaultCard];
    card.currentPosition = back; // frame should be the same as back card has in order to look good on cards switch
    return card;
}

+ (instancetype)invisibleCard {
    MainCardView *card = [self defaultCard];
    card.currentPosition = invisible;
    return card;
}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"MainCardView" owner:self options:nil];
        self = (MainCardView *)[subviewArray objectAtIndex:0];
        //[self adjustFrame:[UIScreen mainScreen].bounds];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        
    }
    
    return self;
}

- (void)awakeFromNib
{
    self.layer.cornerRadius = 10;
    self.clipsToBounds = YES;
}


- (void) setCurrentPosition:(enum statesPosition)currentPosition
{
    _currentPosition = currentPosition;
    
    switch (currentPosition) {
        case front:
            [self adjustFrontFrame];
            break;
        case back:
        case inQueue:
        case invisible:
            [self adjustBackFrame];
            break;
            
        default:
            break;
    }
}

- (void)adjustFrontFrame
{
    NSLog(@"%@", self);
    self.alpha = 1.;
    CGRect frame = [UIScreen mainScreen].bounds;
    CGSize frontSize = CGSizeMake(frame.size.width * kFrontHorizontalPersent / 100,
                                  frame.size.height * kFrontVerticalPersent / 100);
//    _viewPosition.size = frontSize;
    self.frame = CGRectMake(0, 0, frontSize.width, frontSize.height);
    float sideSpace = (frame.size.width - frontSize.width) / 2;
    self.center = CGPointMake(frame.size.width/2, frame.size.height/2 + sideSpace);
}

- (void)adjustBackFrame
{
    self.alpha = 0.6;
    CGRect frame = [UIScreen mainScreen].bounds;
    CGSize backSize = CGSizeMake(frame.size.width * kBackHorizontalPersent / 100,
                                  frame.size.height * kBackVerticalPersent / 100);
//    _viewPosition.size = backSize;
    self.frame = CGRectMake(0, 0, backSize.width, backSize.height);
    float sideSpace = (frame.size.width - backSize.width) / 2.8;
    self.center = CGPointMake(frame.size.width/2, frame.size.height/2 - sideSpace);
}

- (void) increaseSizeDuringTouch
{
   CGSize size = CGSizeMake(self.frame.size.width + self.frame.size.width * kKoeficientScale / 100,
                            self.frame.size.height +  self.frame.size.height * kKoeficientScale / 100);
    
    [UIView animateWithDuration:0.25 animations:^{
        self.center = CGPointMake(self.center.x - self.center.x * kKoeficientScale / 100,
                                  self.center.y - self.center.y * kKoeficientScale / 100);
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
    }];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch ");
    [self increaseSizeDuringTouch];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGRect newFrame = CGRectMake(self.frame.origin.x,
                                 [UIScreen mainScreen].bounds.size.height,
                                 self.frame.size.width,
                                 self.frame.size.height);
        [UIView animateWithDuration:0.1 animations:^{
            self.frame = newFrame;
        } completion:^(BOOL finished) {
            [self.delegate changeCards];
            self.currentPosition = invisible;
        }];
}
@end
