//
//  ViewController.m
//  TCSPhonics_ios
//
//  Created by alice on 2015/5/13.
//  Copyright (c) 2015年 alice. All rights reserved.
//

#import "ViewController.h"
#import "TPCollectionViewCell.h"


@interface ViewController ()
<
UICollectionViewDelegate, UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
AVAudioPlayerDelegate
>
{
    NSURL * soundUrl;
}

@end


@implementation ViewController
- (id)init {
    self = [super init];
    if (self) {

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
    _collectionView.backgroundColor = [UIColor clearColor];
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
    
                   
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"b.png"]];
    _imageView.frame = CGRectMake(50, 50, (kcommonDeviceHeight- 100)*1.34 , kcommonDeviceHeight - 100 );
    _imageView.centerX = kcommonDeviceWidth/2;
    _imageView.backgroundColor = [UIColor whiteColor];
    _imageView.userInteractionEnabled = YES;
    [self.view addSubview:_imageView];
    _imageView.hidden = YES;

    
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
    [cell setPhonicLabelWithString:C_PHONICS_ARRAY[indexPath.row]];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= 0) {
        NNLog(@"%ld",(long)indexPath.row);
        _imageView.image = [UIImage imageNamed:E_PHONICS_ARRAY[indexPath.row]];
        soundUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:E_PHONICS_ARRAY[indexPath.row] ofType:@"m4a"]];
    }
    
    _imageView.hidden = NO;
    [self videoInit];
    [_audioPlayer play];
}
//
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    _imageView.hidden = YES;
    [_audioPlayer stop];
    
}
//
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
