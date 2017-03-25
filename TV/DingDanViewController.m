//
//  DingDanViewController.m
//  TV
//
//  Created by HOME on 16/9/18.
//  Copyright © 2016年 Appcoda. All rights reserved.
//

#import "DingDanViewController.h"
#define blackColor  RGB(51, 51, 51)
#define redColor  RGB(255, 56, 65)
@interface DingDanViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL _isSuccessfull;
}
@end

@implementation DingDanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
}
- (void)loadUI
{
    _isSuccessfull = YES;
    [self creatTableView];
    
    [self.view bringSubviewToFront:self.frontView];
    [self MainView1];
    self.titleLable.text = @"我的订单";
    [self blueTitle];
    self.rightBtn.hidden = NO;
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"shanchu "] forState:UIControlStateNormal];
    
    [self.wanchengBtn setTitleColor:redColor forState:UIControlStateNormal];
    [self.shouhuo setTitleColor:blackColor forState:UIControlStateNormal];
    self.lineLabel.center = CGPointMake(self.wanchengBtn.center.x, self.lineLabel.center.y);
    self.frontView.frame = CGRectMake(0, 64, kScreenWidth, 44);
    self.tableView.backgroundColor = RGB(230, 230, 230);
    self.tableView.frame = CGRectMake(0, 44+54, kScreenWidth, kScreenHeight-88);
}
- (IBAction)shouhuoBtn:(id)sender {
    UIButton *btn = sender;
    [self.wanchengBtn setTitleColor:blackColor forState:UIControlStateNormal];
    [self.shouhuo setTitleColor:redColor  forState:UIControlStateNormal];
    
    self.lineLabel.center = CGPointMake(btn.center.x, self.lineLabel.center.y);
    
    _isSuccessfull = NO;
    [self.tableView reloadData];
}

- (IBAction)wancheng:(id)sender {
     UIButton *btn = sender;
    [self.wanchengBtn setTitleColor:redColor forState:UIControlStateNormal];
    [self.shouhuo setTitleColor:blackColor forState:UIControlStateNormal];
    self.lineLabel.center = CGPointMake(btn.center.x, self.lineLabel.center.y);
    
    _isSuccessfull = YES;
    [self.tableView reloadData];
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
    return 250;
    //    return 192/480*kScreenHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.01;
    }
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 890)];
    view.backgroundColor = RGB(230, 230, 230);
    return view;
}
#pragma mark cellForRowAtIndexPath
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    dingdanTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"dingdanCell"];
    if (!cell) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"dingdanTableViewCell" owner:nil options:nil][0];
    }
    //    cell.bgBtn.tag = indexPath.section +1;
    [cell.deletBtn addTarget:self action:@selector(deleteChooseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    if (_isSuccessfull == YES) {
        cell.statesLable.hidden = NO;
        [cell.deletBtn setTitle:@"删除" forState:UIControlStateNormal];
    }else
    {
        cell.statesLable.hidden = YES;
        [cell.deletBtn setTitle:@"查看" forState:UIControlStateNormal];
        
    }
    
    cell.selectionStyle = 0;
    
    return cell;
    
    
}
- (void)deleteChooseBtnClick:(UIButton *)btn
{
    if (_isSuccessfull == NO) {
        chakanViewController *cha = [[chakanViewController alloc]init];
        [self.navigationController pushViewController:cha animated:YES];
    }
    
}
@end
