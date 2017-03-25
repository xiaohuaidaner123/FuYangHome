//
//  jeisuanViewController.m
//  TV
//
//  Created by HOME on 16/9/18.
//  Copyright © 2016年 Appcoda. All rights reserved.
//

#import "jeisuanViewController.h"

@interface jeisuanViewController ()<UIScrollViewDelegate,UITextViewDelegate,UIGestureRecognizerDelegate>
{
    int _currentHeight;
    int _height;
}
#define titleColor  RGB(51, 51, 51)
#define conColor   RGB(102, 102, 102)
#define smallColor   RGB(153, 153, 153)
@property (nonatomic,retain)UIScrollView *scrollView;
@end

@implementation jeisuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self MainView1];
    self.titleLable.text = @"结算";
    [self blueTitle];
    [self loadScroll];
    self.buttomView.frame = CGRectMake(0, _height+80, kScreenWidth, self.buttomView.frame.size.height);
    self.tijiao.frame = CGRectMake(self.tijiao.frame.origin.x, _height+80+self.buttomView.frame.size.height, self.tijiao.frame.size.width, self.tijiao.frame.size.height);
    self.tijiao.layer.masksToBounds = YES;
    self.tijiao.layer.cornerRadius = 6;
}
- (void)loadScroll
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
    _scrollView.pagingEnabled = NO;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(kScreenWidth, 0);
    _scrollView.scrollEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_scrollView];
    
    [self creatAddress:@"天津市河西区富力中心大厦B座21层" shouhuo:@"李先生" phone:@"15122947309"];

     _scrollView.contentSize = CGSizeMake(0, _height);
    _scrollView.frame = CGRectMake(0, 64, kScreenWidth, _height);
}
- (void)creatAddress:(NSString *)address  shouhuo:(NSString *)shouhuo phone:(NSString *)phone
{
    
    CGSize size = K_GET_STRINGSIZE(address, 15);
    float  height = kScreenHeight*100/1280;
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, _height+20, kScreenWidth-30, size.height+height*2+40)];
    imageView.image = [UIImage imageNamed:@"dizhikuang"];
     imageView.userInteractionEnabled = YES;
    [_scrollView addSubview:imageView];
    
    _height+=size.height+height*2+60;
    //    收货地址
    
    UILabel *addressLable1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, height)];
    addressLable1.text = @"收货地址:";
    //    addressLable1.backgroundColor = [UIColor redColor];
    addressLable1.textColor = smallColor;
    [imageView addSubview:addressLable1];
    
    
    UILabel *addressLable = [[UILabel alloc]initWithFrame:CGRectMake(100, 10, kScreenWidth-140, size.height+30)];
    addressLable.numberOfLines = 100;
    addressLable.text = address;
    //    addressLable.backgroundColor = [UIColor blueColor];
    addressLable.textColor = smallColor;
    [imageView addSubview:addressLable];
    
    UILabel *lineLable = [[UILabel alloc]initWithFrame:CGRectMake(0,size.height+40, kScreenWidth-40, 1)];
    lineLable.backgroundColor = RGB(230, 230, 230);
    [imageView addSubview:lineLable];
    
    
    
    //    收货人
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, size.height+40, kScreenWidth, height)];
    lab.text = [NSString stringWithFormat:@"收货人：   %@",shouhuo];
    //    lab.backgroundColor = [UIColor yellowColor];
    lab.textColor = smallColor;
    [imageView addSubview:lab];
    
    UILabel *lineLable1 = [[UILabel alloc]initWithFrame:CGRectMake(0,size.height+40+height, kScreenWidth-40, 1)];
    lineLable1.backgroundColor = RGB(230, 230, 230);
    [imageView addSubview:lineLable1];
    
    
    
    
    //    联系方式
    UILabel *phoneLable = [[UILabel alloc]initWithFrame:CGRectMake(10, size.height+height+40, kScreenWidth, height)];
    phoneLable.text = [NSString stringWithFormat:@"联系方式：%@",phone];
    //     phoneLable.backgroundColor = smallColor;
    phoneLable.textColor = smallColor;
    [imageView addSubview:phoneLable];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(kScreenWidth-110, _height+10+80, 80, 30);
    [self.view addSubview:btn];
    [btn setTitle:@"修改" forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(xiugaiBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.borderWidth = 1;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 4;
    btn.layer.borderColor = RGB(86, 213, 199).CGColor;
    _height += 80;
    
   
}
- (void)xiugaiBtnClick:(UIButton *)btn
{
    AddAddressViewController *add = [[AddAddressViewController alloc]init];
    [self.navigationController pushViewController:add animated:YES];
}
- (void)line:(NSString*)text
{
    
}
- (IBAction)tijiaoBtn:(id)sender {
}
@end
