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
    _array = [[NSArray alloc] init];
    _array = @[@"ㄅ", @"ㄆ", @"ㄇ", @"ㄈ", @"", @"ㄉ", @"ㄊ", @"ㄋ", @"ㄌ", @"", @"ㄍ", @"ㄎ", @"ㄏ", @"", @"ㄐ", @"ㄑ", @"ㄒ", @"", @"ㄓ", @"ㄔ", @"ㄕ", @"ㄖ", @"", @"ㄗ", @"ㄘ", @"ㄙ", @"", @"ㄚ", @"ㄛ", @"ㄜ", @"ㄝ", @"", @"ㄞ", @"ㄟ", @"ㄠ",@"ㄡ", @"", @"ㄢ", @"ㄣ", @"ㄤ", @"ㄥ", @"", @"ㄦ", @"ㄧ", @"ㄨ", @"ㄩ"];
    
    _fileArray = [[NSArray alloc] init];
    _fileArray = @[@"b", @"p", @"m", @"f",@"", @"d", @"t", @"n", @"l", @"", @"g", @"k", @"h", @"", @"ji", @"c", @"s", @"", @"jhi", @"chi", @"shi", @"ri", @"", @"zi", @"ci", @"si", @"", @"a", @"o", @"ee", @"e", @"", @"ai", @"ei", @"ao",@"ou", @"", @"an", @"en", @"ang", @"eng", @"", @"er", @"yi", @"wu", @"yu"];
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
    _imageView.frame = CGRectMake(50, 50, (self.view.frame.size.height - 100)*1.34 , self.view.frame.size.height - 100 );
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
    return _array.count;
}
//
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TPCollectionViewCell * cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell setPhonicLabelWithString:_array[indexPath.row]];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= 0) {
        NSLog(@"%ld",(long)indexPath.row);
        _imageView.image = [UIImage imageNamed:_fileArray[indexPath.row]];
        soundUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:_fileArray[indexPath.row] ofType:@"m4a"]];
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
