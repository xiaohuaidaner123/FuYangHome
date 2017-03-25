//
//  ShopingViewController.m
//  TV
//
//  Created by HOME on 16/9/18.
//  Copyright © 2016年 Appcoda. All rights reserved.
//

#import "ShopingViewController.h"
#import "ShopTableViewCell.h"
@interface ShopingViewController ()

@end

@implementation ShopingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatTableView];
    [self MainView1];
    self.titleLable.text = @"我的购物车";
    [self blueTitle];
    self.rightBtn.hidden = NO;
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"shanchu "] forState:UIControlStateNormal];
    self.buttom.frame = CGRectMake(0, kScreenHeight-45, kScreenWidth, 45);
    self.tableView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-46);
}
#pragma mark  UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
    //    return 192/480*kScreenHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
#pragma mark cellForRowAtIndexPath
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    ShopTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"shopCell"];
    if (!cell) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"ShopTableViewCell" owner:nil options:nil][0];
    }
    //    cell.bgBtn.tag = indexPath.section +1;
    [cell.deleteChooseBtn addTarget:self action:@selector(deleteChooseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    cell.selectionStyle = 0;
    
    return cell;
    
    
}
- (IBAction)jiesuan:(id)sender {
    jeisuanViewController *jie = [[jeisuanViewController alloc]init];
    [self.navigationController pushViewController:jie animated:YES];
}
- (void)deleteChooseBtnClick:(UIButton *)btn
{
    
    
}@end
