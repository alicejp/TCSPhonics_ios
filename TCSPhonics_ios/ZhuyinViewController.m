//
//  ViewController.m
//  TCSPhonics_ios
//
//  Created by alice on 2015/5/13.
//  Copyright (c) 2015年 alice. All rights reserved.
//

#import "ZhuyinViewController.h"
#import "TPCollectionViewCell.h"
#import "CellSubView.h"

@interface ZhuyinViewController ()
<
UICollectionViewDelegate, UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
CellSubViewDelegate,
AVAudioPlayerDelegate
>
{
    NSURL * soundUrl;
    PhonicButtonStyle phonicStyle;
}

@end


@implementation ZhuyinViewController
- (id)initWithPhonicStyle:(PhonicButtonStyle)style {
    self = [super init];
    if (self) {
        phonicStyle = style;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = kGreenColor;
    [_collectionView registerClass:[TPCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    [_collectionView setTransform:CGAffineTransformMakeScale(-1, 1)];

    [self.view addSubview:_collectionView];
    
//    soundUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"b" ofType:@"m4a"]];
//    NSError * error;
//    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:&error];
//    if (error) {
//        NSLog(@"error in audioPlayer: %@", [error localizedDescription]);
//    }else {
//        _audioPlayer.delegate = self;
//        _audioPlayer.currentTime = 0;
//    }
    
                   
    self.cellSubView = [[CellSubView alloc] initWithFrame:CGRectMake(0, 0, (kcommonDeviceHeight- 100)*1.34 , kcommonDeviceHeight - 100) delegate:self];
    self.cellSubView.centerX = kcommonDeviceWidth/2;
    self.cellSubView.centerY = kcommonDeviceHeight/2;
    [self.view addSubview:self.cellSubView];
    self.cellSubView.hidden = YES;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return E_PHONICS_ARRAY.count;
}
//
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TPCollectionViewCell * cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
//    switch (phonicStyle) {
//        case PhonicButtonStyleZhuyin:
//            [cell setPhonicLabelWithString:C_PHONICS_ARRAY[indexPath.row]];
//            break;
//        case PhonicButtonStyleZhuyin2Pinyin:
//            [cell setPhonicLabelWithString:Z2P_PHONICS_ARRAY[indexPath.row]];
//            break;
//        default:
//            break;
//    }
    [cell setPhonicLabelWithString:C_PHONICS_ARRAY[indexPath.row]];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= 0) {
        NNLog(@"%ld",(long)indexPath.row);
        self.cellSubView.imageView.image = [UIImage imageNamed:E_PHONICS_ARRAY[indexPath.row]];
        soundUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:E_PHONICS_ARRAY[indexPath.row] ofType:@"m4a"]];
    }
    
    self.cellSubView.hidden = NO;
    [self videoInit];
    [_audioPlayer play];
}
//
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.cellSubView.hidden = YES;
    [_audioPlayer stop];
    
}
//

#pragma mark
#pragma CellVoiceDelegate
- (void)playVoiceAgain {    [_audioPlayer play]; }

- (void)videoInit{
//    soundUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"b" ofType:@"m4a"]];
    NSError * error;
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:&error];
    if (error) {
        NSLog(@"error in audioPlayer: %@", [error localizedDescription]);
    }else {
        _audioPlayer.delegate = self;
        _audioPlayer.currentTime = 0;
    }
}
@end
