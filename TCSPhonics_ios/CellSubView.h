//
//  CellSubView.h
//  TCSPhonics_ios
//
//  Created by alice on 2016/1/14.
//  Copyright © 2016年 alice. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CellSubViewDelegate;

@interface CellSubView : UIView

@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UIButton    *playButton;
@property (nonatomic, weak) id<CellSubViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame delegate: (id<CellSubViewDelegate>)delegate;

@end

@protocol CellSubViewDelegate <NSObject>
- (void)playVoiceAgain;
@end