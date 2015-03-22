//
//  CardObject.h
//  TestQuestions
//
//  Created by Andriy Kupich on 3/22/15.
//  Copyright (c) 2015 ArtfulBits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Variant.h"

@interface CardObject : NSObject

@property (nonatomic) NSInteger cardId;

@property (strong, nonatomic) NSString *created_at;
@property (strong, nonatomic) NSString *updated_at;
@property (strong, nonatomic) NSString *card_type;
@property (strong, nonatomic) NSString *text;
@property (nonatomic) NSInteger points;

@property (nonatomic) BOOL isFavourite;

@property (nonatomic, strong) NSMutableArray *varients;

- (NSMutableArray *)setVariantsFromArray:(NSMutableArray *)variantsArray;

@end
