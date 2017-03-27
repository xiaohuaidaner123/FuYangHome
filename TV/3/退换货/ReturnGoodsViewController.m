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

@interface ReturnGoodsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation ReturnGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"退换货";
    [self addRightItemWithImage:@"shanchu " action:nil];
    [self addSegment];
    [self.view addSubview:self.myTableView];
    
}
#pragma mark - 分段选择
- (void)addSegment
{
    LiuXSegmentView *view=[[LiuXSegmentView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44) titles:@[@"售后申请",@"进度查询"] bgColor:UIColorFromRGB(0xf2f2f2) clickBlick:^void(NSInteger index) {
        //        self.segment = index;
        //        [self selectData];
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
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identififer = @"returnGoodsCell";
    ReturnGoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identififer];
    if (cell == nil) {
        cell = [[ReturnGoodsTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identififer];
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
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return rateHeight(60);
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
