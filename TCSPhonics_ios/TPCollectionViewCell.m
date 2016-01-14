//
//  TPCollectionViewCell.m
//  TCSPhonics_ios
//
//  Created by alice on 2015/5/13.
//  Copyright (c) 2015年 alice. All rights reserved.
//

/*
 1. set the initWithFrame
 2. set the item in the cell in X.h
 */

#import "TPCollectionViewCell.h"



@implementation TPCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kBlueColor;
        _phonicLabel = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        _phonicLabel.textColor = [UIColor blackColor];
        _phonicLabel.textAlignment = NSTextAlignmentCenter;
        _phonicLabel.numberOfLines = 1;
        [self.contentView addSubview:_phonicLabel];
        [self.contentView setTransform:CGAffineTransformMakeScale(-1, 1)];
    }
    return self;
}
- (void)setPhonicLabelWithString:(NSString *)phonic {
    _phonicLabel.text = phonic;
}
@end
