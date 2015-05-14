//
//  TPCollectionViewCell.h
//  TCSPhonics_ios
//
//  Created by alice on 2015/5/13.
//  Copyright (c) 2015年 alice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TPCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)UILabel * phonicLabel;
- (void)setPhonicLabelWithString:(NSString *)phonic;
@end
