//
//  ReturnGoodsViewController.m
//  家居定制
//
//  Created by iking on 2017/3/25.
//  Copyright © 2017年 Appcoda. All rights reserved.
//

#import "ReturnGoodsViewController.h"
#import "LiuXSegmentView.h"

@interface ReturnGoodsViewController ()

@end

@implementation ReturnGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"退换货";
    [self addRightItemWithImage:@"shanchu " action:nil];
    [self addSegment];
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
