//
//  CardsEnumarator.m
//  TestQuestions
//
//  Created by Solomiya Nazarkevych on 3/22/15.
//  Copyright (c) 2015 ArtfulBits. All rights reserved.
//

#import "CardsEnumarator.h"

@implementation CardsEnumarator

+ (instancetype)cardEnumaratorWithMaxNumber:(NSInteger)maxNumber; {
    CardsEnumarator *enumarator = [[CardsEnumarator alloc] init];
    enumarator.maxNumber = maxNumber;
    return enumarator;
}

- (NSInteger)nextTo:(NSInteger)current {
    if (current == self.maxNumber) {
        return 0;
    }
    
    return ++current;
}

- (NSInteger)previousTo:(NSInteger)current {
    if (current == 0) {
        return self.maxNumber;
    }
    
    return --current;
}

@end
