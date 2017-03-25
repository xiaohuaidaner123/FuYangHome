//
//  ShopingViewController.h
//  TV
//
//  Created by HOME on 16/9/18.
//  Copyright © 2016年 Appcoda. All rights reserved.
//

#import "BaseViewController.h"
#import "jeisuanViewController.h"
@interface ShopingViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIView *buttom;
@property (weak, nonatomic) IBOutlet UIButton *jiesuan;
- (IBAction)jiesuan:(id)sender;

@end
