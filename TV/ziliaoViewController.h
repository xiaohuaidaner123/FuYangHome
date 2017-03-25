//
//  ziliaoViewController.h
//  TV
//
//  Created by HOME on 16/9/14.
//  Copyright © 2016年 Appcoda. All rights reserved.
//

#import "BaseViewController.h"
#import "changeNikeNameViewController.h"
#import "phoneChangeViewController.h"
#import "changePwdViewController.h"
#import "changeAddressViewController.h"
@interface ziliaoViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIButton *nichengBtn;
- (IBAction)nichengBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *phoneBtnClick;
@property (weak, nonatomic) IBOutlet UIButton *changePwdClick;
- (IBAction)phoneBtnClick:(id)sender;
- (IBAction)changePwdClick:(id)sender;
- (IBAction)addressBtnClick:(id)sender;

@end
