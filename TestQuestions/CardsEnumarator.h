//
//  CardsEnumarator.h
//  TestQuestions
//
//  Created by Solomiya Nazarkevych on 3/22/15.
//  Copyright (c) 2015 ArtfulBits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardsEnumarator : NSObject

@property NSInteger maxNumber;

+ (instancetype)cardEnumaratorWithMaxNumber:(NSInteger)maxNumber;

- (NSInteger)nextTo:(NSInteger)current;
- (NSInteger)previousTo:(NSInteger)current;

@end
