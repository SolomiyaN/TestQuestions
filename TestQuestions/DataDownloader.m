//
//  DataDownloader.m
//  TestQuestions
//
//  Created by Andriy Kupich on 3/22/15.
//  Copyright (c) 2015 ArtfulBits. All rights reserved.
//

#import "DataDownloader.h"
#import "CardObject.h"

@implementation DataDownloader

- (void)downloadDataWithCompletion:(downloadComplete) compblock
{
    NSMutableArray *cardsMuttableArray = [NSMutableArray new];
    
    NSURL *url = [NSURL URLWithString:
                  @"http://192.168.99.169:3000/cards"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSArray *cardsArray = json[@"data"];
        if ([cardsArray isKindOfClass:[NSArray class]])
        {
            for (NSDictionary *dictionary in cardsArray)
            {
                CardObject *card = [[CardObject alloc] init];
                card.cardId = [[dictionary objectForKey:@"id"] integerValue];
                card.created_at = [dictionary objectForKey:@"created_at"];
                card.updated_at = [dictionary objectForKey:@"updated_at"];
                card.card_type = [dictionary objectForKey:@"card_type"];
                card.text = [dictionary objectForKey:@"text"];
                card.points = [[dictionary objectForKey:@"points"] integerValue];
                card.isFavourite = [[dictionary objectForKey:@"favourite"] boolValue];
                
                [cardsMuttableArray addObject:card];
            }
        }
        
        compblock(YES, cardsMuttableArray);
    }];
    
    [dataTask resume];
}

@end
