//
//  WellcomeViewController.m
//  TCSPhonics_ios
//
//  Created by alice on 2016/1/14.
//  Copyright © 2016年 alice. All rights reserved.
//

#import "WellcomeViewController.h"
#import "ZhuyinViewController.h"

@implementation TCSPhonicButton

- (id)initWithButtonStyle:(PhonicButtonStyle)buttonStyle{
    self = [super init];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"taiwan"];
        self.frame = CGRectMake(10, 40, kcommonDeviceWidth - 20, image.size.height);
        _buttonStyle = buttonStyle;
        switch (_buttonStyle) {
            case PhonicButtonStyleZhuyin:
                [self setImage:[UIImage imageNamed:@"taiwan"] forState:UIControlStateNormal];
                [self setTitle:@"ZHUYIN" forState:UIControlStateNormal];
                break;
            case PhonicButtonStyleZhuyin2Pinyin:
                [self setTitle:@"ZHUYIN --> PINYIN" forState:UIControlStateNormal];
                self.y = 40+image.size.height + 10;
                break;
            case PhonicButtonStylePinyin2Zhuyin:
                [self setTitle:@"PINYIN --> ZHUYIN" forState:UIControlStateNormal];
                self.y = 40 + (image.size.height + 10) *2;
//                [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 35, 0, 10)];
                break;
            case PhonicButtonStylePinyin:
                [self setImage:[UIImage imageNamed:@"china"] forState:UIControlStateNormal];
                [self setTitle:@"PINYIN" forState:UIControlStateNormal];
                self.y = 40 + (image.size.height + 10) *3;
                break;
        }

    }
    return self;
}

@end


@implementation WellcomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    TCSPhonicButton *zhuyinButton = [[TCSPhonicButton alloc] initWithButtonStyle:PhonicButtonStyleZhuyin];
    [zhuyinButton addTarget:self action:@selector(openZhuyin:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:zhuyinButton];
    
    TCSPhonicButton *zpinyinButton = [[TCSPhonicButton alloc] initWithButtonStyle:PhonicButtonStyleZhuyin2Pinyin];
    [zpinyinButton addTarget:self action:@selector(openZhuyin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:zpinyinButton];
    
    TCSPhonicButton *pzhuyinButton = [[TCSPhonicButton alloc] initWithButtonStyle:PhonicButtonStylePinyin2Zhuyin];
    [pzhuyinButton addTarget:self action:@selector(openZhuyin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pzhuyinButton];
    
    TCSPhonicButton *pinyinButton = [[TCSPhonicButton alloc] initWithButtonStyle:PhonicButtonStylePinyin];
    [pinyinButton addTarget:self action:@selector(openZhuyin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pinyinButton];
    
}

- (void)openZhuyin:(id)sender{
    PhonicButtonStyle localStyle;
    ZhuyinViewController *zhuyinViewController = [[ZhuyinViewController alloc] initWithPhonicStyle:localStyle];
    [self.navigationController pushViewController:zhuyinViewController animated:YES];
}

@end
