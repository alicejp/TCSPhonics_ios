//
//  TPDataSource.m
//  TCSPhonics_ios
//
//  Created by alice on 2015/5/13.
//  Copyright (c) 2015年 alice. All rights reserved.
//

#import "TPDataSource.h"

@implementation TPDataSource

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSArray *)array {
    NSArray * ar = [NSArray init];
    ar = @[@"ㄅ", @"ㄆ", @"ㄇ", @"ㄈ", @"", @"ㄉ", @"ㄊ", @"ㄋ", @"ㄌ", @"", @"ㄍ", @"ㄎ", @"ㄏ"];
    return ar;
}

@end
