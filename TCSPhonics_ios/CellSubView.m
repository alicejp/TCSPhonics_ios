//
//  CellSubView.m
//  TCSPhonics_ios
//
//  Created by alice on 2016/1/14.
//  Copyright © 2016年 alice. All rights reserved.
//

#import "CellSubView.h"



@implementation CellSubView

- (instancetype)initWithFrame:(CGRect)frame delegate: (id<CellSubViewDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        _delegate = delegate;
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = frame;
        _imageView.backgroundColor = [UIColor whiteColor];
        _imageView.layer.masksToBounds = YES;
        _imageView.layer.cornerRadius =  10.f;
        _imageView.userInteractionEnabled = YES;
        [self addSubview:_imageView];
        
        _playButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40 , 40)];
        _playButton.centerX = self.centerX / 4;
        _playButton.centerY = self.bottom * 4/5;
        _playButton.backgroundColor = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0.5];
        [_playButton setBackgroundImage:[UIImage imageNamed:@"playVoice.png"]
                            forState:UIControlStateNormal];
        [_playButton addTarget:self action:@selector(playVoice) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_playButton];
    }
    return self;
}

- (void)playVoice{
    if([self.delegate respondsToSelector:@selector(playVoiceAgain)]){
        [self.delegate playVoiceAgain];
    }
}

@end
