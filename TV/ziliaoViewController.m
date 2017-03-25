//
//  ziliaoViewController.m
//  TV
//
//  Created by HOME on 16/9/14.
//  Copyright © 2016年 Appcoda. All rights reserved.
//

#import "ziliaoViewController.h"

@interface ziliaoViewController ()

@end

@implementation ziliaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self MainView1];
//    self.titleLable.text = @"我的资料";
    self.title = @"我的资料";
    [self addBackForUser];
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

- (IBAction)nichengBtnClick:(id)sender {
    changeNikeNameViewController *nicheng = [[changeNikeNameViewController alloc]init];
    [self.navigationController pushViewController:nicheng animated:YES];
}
- (IBAction)phoneBtnClick:(id)sender {
    phoneChangeViewController *nicheng = [[phoneChangeViewController alloc]init];
    [self.navigationController pushViewController:nicheng animated:YES];
}

- (IBAction)changePwdClick:(id)sender {
    changePwdViewController *nicheng = [[changePwdViewController alloc]init];
    [self.navigationController pushViewController:nicheng animated:YES];
}

- (IBAction)addressBtnClick:(id)sender {
    changeAddressViewController *nicheng = [[changeAddressViewController alloc]init];
    [self.navigationController pushViewController:nicheng animated:YES];
}
@end
