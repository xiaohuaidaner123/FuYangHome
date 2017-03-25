//
//  DingDanViewController.h
//  TV
//
//  Created by HOME on 16/9/18.
//  Copyright © 2016年 Appcoda. All rights reserved.
//

#import "BaseViewController.h"
#import "dingdanTableViewCell.h"
#import "chakanViewController.h"
@interface DingDanViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIButton *wanchengBtn;
@property (weak, nonatomic) IBOutlet UIButton *shouhuo;
@property (weak, nonatomic) IBOutlet UIButton *shouhuoBtn;
- (IBAction)shouhuoBtn:(id)sender;
- (IBAction)wancheng:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
@property (weak, nonatomic) IBOutlet UIView *frontView;

@end
