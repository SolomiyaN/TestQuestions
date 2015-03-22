//
//  DataDownloader.h
//  TestQuestions
//
//  Created by Andriy Kupich on 3/22/15.
//  Copyright (c) 2015 ArtfulBits. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^downloadComplete)(BOOL, NSMutableArray *);

@interface DataDownloader : NSObject

- (void) downloadDataWithCompletion:(downloadComplete) compblock;

@end
