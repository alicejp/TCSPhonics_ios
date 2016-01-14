//
//  ViewController.h
//  TCSPhonics_ios
//
//  Created by alice on 2015/5/13.
//  Copyright (c) 2015年 alice. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>
@class CellSubView;
@interface ZhuyinViewController : UIViewController

- (id)initWithPhonicStyle:(PhonicButtonStyle)style;

@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic, strong)CellSubView * cellSubView;
@property (nonatomic, strong)AVAudioPlayer *audioPlayer;
@end

