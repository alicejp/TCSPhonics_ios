//
//  ViewController.h
//  TCSPhonics_ios
//
//  Created by alice on 2015/5/13.
//  Copyright (c) 2015年 alice. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController

@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic, strong)UIImageView * imageView;
@property (nonatomic, strong)NSArray * array;
@property (nonatomic, strong)NSArray * fileArray;
@property (nonatomic, strong)AVAudioPlayer *audioPlayer;
@end

