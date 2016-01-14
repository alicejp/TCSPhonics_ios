//
//  WellcomeViewController.h
//  TCSPhonics_ios
//
//  Created by alice on 2016/1/14.
//  Copyright © 2016年 alice. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface TCSPhonicButton : UIButton
- (id)initWithButtonStyle:(PhonicButtonStyle)buttonStyle;
@property (nonatomic, assign)PhonicButtonStyle buttonStyle;
@end

@interface WellcomeViewController : UIViewController

@end
