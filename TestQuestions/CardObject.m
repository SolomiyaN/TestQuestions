//
//  CardObject.m
//  TestQuestions
//
//  Created by Andriy Kupich on 3/22/15.
//  Copyright (c) 2015 ArtfulBits. All rights reserved.
//

#import "CardObject.h"

@implementation CardObject

- (Variant *)setVariantFromDictionary:(NSDictionary *)dictionary
{
    Variant *variant = [[Variant alloc] init];
    variant.variantId = [[dictionary objectForKey:@"id"] integerValue];
    variant.created_at = [dictionary objectForKey:@"created_at"];
    variant.updated_at = [dictionary objectForKey:@"updated_at"];
    variant.text = [dictionary objectForKey:@"text"];
    variant.card_id = [[dictionary objectForKey:@"card_id"] integerValue];
    
    return variant;
}

- (NSMutableArray *)setVariantsFromArray:(NSMutableArray *)variantsArray
{
    _varients = [NSMutableArray new];
    for (NSDictionary *dictionary in variantsArray)
    {
        Variant *option = [self setVariantFromDictionary:dictionary];
        [_varients addObject:option];
    }
    
    return _varients;
}

@end
