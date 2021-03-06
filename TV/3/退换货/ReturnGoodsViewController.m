//
//  ReturnGoodsViewController.m
//  家居定制
//
//  Created by iking on 2017/3/25.
//  Copyright © 2017年 Appcoda. All rights reserved.
//

#import "ReturnGoodsViewController.h"
#import "LiuXSegmentView.h"
#import "ReturnGoodsTableViewCell.h"
#import "ReturnGoodsDetaildsViewController.h"

@interface ReturnGoodsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, assign) NSInteger segmentIndex;

@end

@implementation ReturnGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"退换货";
    self.segmentIndex = 1;
    [self addSegment];
    [self.view addSubview:self.myTableView];
    
}
#pragma mark - 分段选择
- (void)addSegment
{
    LiuXSegmentView *view=[[LiuXSegmentView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44) titles:@[@"售后申请",@"进度查询"] bgColor:UIColorFromRGB(0xf2f2f2) clickBlick:^void(NSInteger index) {
                self.segmentIndex = index;
                [_myTableView reloadData];
    }];
    //以下属性可以根据需求修改
    view.titleFont = [UIFont boldSystemFontOfSize:16];
    view.defaultIndex = 1;
    view.titleNomalColor = UIColorFromRGB(0x4d4d4d);
    view.titleSelectColor = UIColorFromRGB(0xff0000);
    [self.view addSubview:view];
}
#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.segmentIndex == 1) {
        return 2;
    } else {
        return 1;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.segmentIndex == 1) {
        return 3;
    } else {
        return 2;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identififer = @"returnGoodsCell";
    ReturnGoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identififer];
    if (cell == nil) {
        cell = [[ReturnGoodsTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identififer];
    }
    if (self.segmentIndex == 2) {
        cell.shouHouBtn.hidden = YES;
    } else {
        cell.shouHouBtn.hidden = NO;
    }
    cell.selectionStyle = NO;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return rateHeight(95);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return rateHeight(40);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, rateHeight(40))];
    headerView.backgroundColor = [UIColor whiteColor];
    UILabel *orderNumLB = [UILabel labelWithText:@"订单编号：111111111" textColor:UIColorFromRGB(0x666666) fontSize:14];
    [orderNumLB sizeToFit];
    [headerView addSubview:orderNumLB];
    [orderNumLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView).offset(rateWidth(20));
        make.centerY.equalTo(headerView);
    }];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.segmentIndex == 1) {
        return rateHeight(60);
    } else {
        return rateHeight(80);
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (self.segmentIndex == 1) {
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, rateHeight(60))];
        footerView.backgroundColor = [UIColor whiteColor];
        UILabel *priceLB = [UILabel labelWithText:@"共计：68元（含10元运费）" textColor:UIColorFromRGB(0x666666) fontSize:15];
        [priceLB sizeToFit];
        [footerView addSubview:priceLB];
        [priceLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(footerView).offset(rateHeight(15));
            make.centerX.equalTo(footerView);
        }];
        UIView *line = [UIView new];
        line.backgroundColor = UIColorFromRGB(0xf7f7f7);
        [footerView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(footerView);
            make.left.equalTo(footerView);
            make.size.mas_offset(CGSizeMake(kScreenWidth, rateHeight(5)));
        }];
        return footerView;
    } else {
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, rateHeight(80))];
        footerView.backgroundColor = [UIColor whiteColor];
        UILabel *priceLB = [UILabel labelWithText:@"共计：68元（含10元运费）" textColor:UIColorFromRGB(0x666666) fontSize:15];
        [priceLB sizeToFit];
        [footerView addSubview:priceLB];
        [priceLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(footerView).offset(rateHeight(15));
            make.centerX.equalTo(footerView);
        }];
        
        UIImageView *segmentImg = [UIImageView new];
        if (section == 0) {
            segmentImg.image = [UIImage imageNamed:@"审核中"];
        } else {
            segmentImg.image = [UIImage imageNamed:@"已完成"];
        }
        [segmentImg sizeToFit];
        [footerView addSubview:segmentImg];
        [segmentImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(footerView).offset(-rateWidth(20));
            make.bottom.equalTo(footerView).offset(-rateHeight(10));
        }];
        
        UIView *line = [UIView new];
        line.backgroundColor = UIColorFromRGB(0xf7f7f7);
        [footerView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(footerView);
            make.left.equalTo(footerView);
            make.size.mas_offset(CGSizeMake(kScreenWidth, rateHeight(5)));
        }];
        return footerView;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.segmentIndex == 1) {
        ReturnGoodsDetaildsViewController *detailsVC = [[ReturnGoodsDetaildsViewController alloc] init];
        [self.navigationController pushViewController:detailsVC animated:YES];
    }
}
- (UITableView *)myTableView
{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, kScreenHeight-110) style:(UITableViewStyleGrouped)];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.separatorStyle = NO;
    }
    return _myTableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
