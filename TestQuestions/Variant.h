//
//  Variant.h
//  TestQuestions
//
//  Created by Andriy Kupich on 3/22/15.
//  Copyright (c) 2015 ArtfulBits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Variant : NSObject

@property (nonatomic) NSInteger variantId;

@property (strong, nonatomic) NSString *created_at;
@property (strong, nonatomic) NSString *updated_at;
@property (strong, nonatomic) NSString *text;

@property (nonatomic) NSInteger card_id;

@end
