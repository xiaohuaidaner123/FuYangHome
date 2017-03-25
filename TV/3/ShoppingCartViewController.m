//
//  ShoppingCartViewController.m
//  家居定制
//
//  Created by iking on 2017/3/23.
//  Copyright © 2017年 Appcoda. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "ShoppingCartTableViewCell.h"
#import "BottomJieSuanView.h"
#import "BottomDeleteView.h"
#import "JieSuanOrderViewController.h"

@interface ShoppingCartViewController ()

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) BottomJieSuanView *bottomJieSuanV;
@property (nonatomic, strong) BottomDeleteView *bottomDeleteV;
@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, strong) NSMutableArray *btnStatusArr;
@property (nonatomic, assign) BOOL isBottomSelect;

@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btnStatusArr = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        [self.btnStatusArr addObject:[NSString stringWithFormat:@"0"]];
    }
    [self setNavigationBar];
    [self.view addSubview:self.myTableView];
    [self addJieSuanView];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self setUpData];
}
- (void)setNavigationBar
{
    self.navigationItem.title = @"我的购物车";
    [self addRightItemWithImage:@"shanchu " action:@selector(deleteGoods:)];
}
#pragma mark - SetUpData
- (void)setUpData
{
    NSLog(@"----------%@", self.user.ID);
    [MBProgressHUD showMessage:@"正在加载数据..." toView:self.view];
    [[HttpRequestManager shareManager] addPOSTURL:@"/Order/showCar" person:RequestPersonWeiMing parameters:@{@"userId": @"1490340044609",@"status": @0} success:^(id successResponse) {
        [MBProgressHUD hideHUDForView:self.view];
        NSLog(@"购物车-----%@", successResponse);
        if ([successResponse isSuccess]) {
            
            
        } else {
            [MBProgressHUD showResponseMessage:successResponse];
        }
    } fail:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view];
        [MBProgressHUD showError:@"网络异常"];
    }];
}

// 底部view
- (void)addJieSuanView
{
    self.bottomJieSuanV = [BottomJieSuanView new];
    self.bottomJieSuanV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.bottomJieSuanV];
    [self.bottomJieSuanV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view);
        make.size.mas_offset(CGSizeMake(kScreenWidth, rateHeight(50)));
    }];
    [self.bottomJieSuanV.selectAllBtn addTarget:self action:@selector(actionSelectAll:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.bottomJieSuanV.jieSuanBtn addTarget:self action:@selector(actionJieSuan:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    self.bottomDeleteV = [BottomDeleteView new];
    self.bottomDeleteV.backgroundColor = RGB(127, 127, 127);
    [self.view addSubview:self.bottomDeleteV];
    [self.bottomDeleteV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view);
        make.size.mas_offset(CGSizeMake(kScreenWidth, rateHeight(50)));
    }];
    [self.bottomDeleteV.selectAllBtn addTarget:self action:@selector(actionSelectAll:) forControlEvents:(UIControlEventTouchUpInside)];
    self.bottomDeleteV.hidden = YES;
}
#pragma mark - 全选按钮
- (void)actionSelectAll:(UIButton *)btn
{
    btn.selected = !btn.selected;
    self.isBottomSelect = !_isBottomSelect;
    if (_isBottomSelect == YES) {
        [self.btnStatusArr removeAllObjects];
        for (int i = 0; i < 10; i++) {
            [self.btnStatusArr addObject:[NSString stringWithFormat:@"1"]];
        }
        [self.bottomJieSuanV.selectAllBtn setImage:[UIImage imageNamed:@"灰选中"] forState:(UIControlStateNormal)];
        [self.bottomDeleteV.selectAllBtn setImage:[UIImage imageNamed:@"全选选中"] forState:(UIControlStateNormal)];
        [_myTableView reloadData];
    } else {
        [self.btnStatusArr removeAllObjects];
        for (int i = 0; i < 10; i++) {
            [self.btnStatusArr addObject:[NSString stringWithFormat:@"0"]];
        }
        [self.bottomJieSuanV.selectAllBtn setImage:[UIImage imageNamed:@"椭圆 4"] forState:(UIControlStateNormal)];
        [self.bottomDeleteV.selectAllBtn setImage:[UIImage imageNamed:@"全选"] forState:(UIControlStateNormal)];
        [_myTableView reloadData];
    }
}
#pragma mark - 导航栏删除按钮
- (void)deleteGoods:(UIButton *)btn
{
    self.isBottomSelect = NO;
    [self.bottomJieSuanV.selectAllBtn setImage:[UIImage imageNamed:@"椭圆 4"] forState:(UIControlStateNormal)];
    [self.bottomDeleteV.selectAllBtn setImage:[UIImage imageNamed:@"全选"] forState:(UIControlStateNormal)];
    [self.btnStatusArr removeAllObjects];
    for (int i = 0; i < 10; i++) {
        [self.btnStatusArr addObject:[NSString stringWithFormat:@"0"]];
    }
    [_myTableView reloadData];
    btn.adjustsImageWhenHighlighted = NO;
    btn.selected = !btn.selected;
    if (btn.selected == YES) {
        [btn setImage:nil forState:(UIControlStateNormal)];
        [btn setTitle:@"取消" forState:(UIControlStateNormal)];
        NSLog(@"yes");
        self.bottomJieSuanV.hidden = YES;
        self.bottomDeleteV.hidden = NO;
    } else {
        [btn setImage:[UIImage imageNamed:@"shanchu "] forState:(UIControlStateNormal)];
        NSLog(@"no");
        self.bottomJieSuanV.hidden = NO;
        self.bottomDeleteV.hidden = YES;
    }
}
#pragma mark - 单选按钮
- (void)actionDanXuan:(UIButton *)btn
{
    if ([_btnStatusArr[btn.tag] intValue] == 0) {
        _btnStatusArr[btn.tag] = @"1";
    } else if ([_btnStatusArr[btn.tag] intValue] == 1) {
        _btnStatusArr[btn.tag] = @"0";
    }
    [_myTableView reloadData];

}
#pragma mark - 结算按钮
- (void)actionJieSuan:(UIButton *)btn
{
    JieSuanOrderViewController *jieSuanVC = [[JieSuanOrderViewController alloc] init];
    [self.navigationController pushViewController:jieSuanVC animated:YES];
}
#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"orderCarCell";
    ShoppingCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ShoppingCartTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    [cell.selectBtn addTarget:self action:@selector(actionDanXuan:) forControlEvents:(UIControlEventTouchUpInside)];
    cell.selectionStyle = NO;
    cell.selectBtn.tag = indexPath.section;
    if ([_btnStatusArr[indexPath.section] intValue] == 0) {
        [cell.selectBtn setImage:[UIImage imageNamed:@"没选中"] forState:(UIControlStateNormal)];
    } else if ([_btnStatusArr[indexPath.section] intValue] == 1) {
        [cell.selectBtn setImage:[UIImage imageNamed:@"选中"] forState:(UIControlStateNormal)];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return rateHeight(130);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return rateHeight(18);
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (UITableView *)myTableView
{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-114) style:(UITableViewStyleGrouped)];
        _myTableView.backgroundColor = [UIColor whiteColor];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.separatorStyle = NO;
    }
    return _myTableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
