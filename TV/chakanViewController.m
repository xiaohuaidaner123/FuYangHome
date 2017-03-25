//
//  chakanViewController.m
//  TV
//
//  Created by HOME on 16/9/18.
//  Copyright © 2016年 Appcoda. All rights reserved.
//

#import "chakanViewController.h"

@interface chakanViewController ()

@end

@implementation chakanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
}
- (void)loadUI
{
    [self MainView1];
    self.titleLable.text = @"我的订单";
    [self blueTitle];
    
    self.deletBtn.layer.borderColor =  RGB(103, 218, 216).CGColor;
    self.deletBtn.layer.borderWidth = 1;
    self.deletBtn.layer.masksToBounds= YES;
    self.deletBtn.layer.cornerRadius = 5;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
