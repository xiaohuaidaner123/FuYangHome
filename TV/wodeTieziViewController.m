//
//  wodeTieziViewController.m
//  TV
//
//  Created by HOME on 16/9/18.
//  Copyright © 2016年 Appcoda. All rights reserved.
//

#import "wodeTieziViewController.h"
#define titleColor  RGB(51, 51, 51)
@interface wodeTieziViewController ()

@end

@implementation wodeTieziViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatTableView];
    self.title = @"我的帖子";
    [self addRightItemWithImage:@"shanchu " action:nil];
}
#pragma mark  UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
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
    
    
    tieziTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"tieziCell"];
    if (!cell) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"tieziTableViewCell" owner:nil options:nil][0];
    }
    //    cell.bgBtn.tag = indexPath.section +1;
    [cell.nextvc addTarget:self action:@selector(nextvcBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    cell.selectionStyle = 0;
    
    return cell;
    
    
}
- (void)nextvcBtnClick:(UIButton *)btn
{
    ThereDetailViewController *detail = [[ThereDetailViewController alloc]init];
    detail.isMyself = 1;
    [self.navigationController pushViewController:detail animated:YES];
}
@end
