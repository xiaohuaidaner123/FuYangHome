//
//  ShoppingCarModel.h
//  家居定制
//
//  Created by iking on 2017/3/25.
//  Copyright © 2017年 Appcoda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingCarModel : NSObject

@property (nonatomic, strong) NSString *picPath; // 商品图片地址
@property (nonatomic, strong) NSString *totalFee; // 商品总金额
@property (nonatomic, strong) NSString *price; // 商品单价
@property (nonatomic, strong) NSString *title; // 商品标题
@property (nonatomic, strong) NSString *orderId; // 订单id
//@property (nonatomic, strong) NSString *userId; // 商品id
@property (nonatomic, assign) NSInteger num; // 商品购买数量
@property (nonatomic, strong) NSString *colour; // 颜色
@property (nonatomic, strong) NSString *string; // 类型

@end
