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
UICollectionViewDelegateFlowLayout
>

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
    _array = @[@"ㄅ", @"ㄆ", @"ㄇ", @"ㄈ", @"", @"ㄉ", @"ㄊ", @"ㄋ", @"ㄌ", @"", @"ㄍ", @"ㄎ", @"ㄏ"];
    [self.view addSubview:_collectionView];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.view.frame.size.width / 2 , self.view.frame.size.width / 2)];
    _imageView.backgroundColor = [UIColor yellowColor];
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

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    _imageView.hidden = NO;
}
@end
