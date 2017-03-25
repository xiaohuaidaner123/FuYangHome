//
//  TWSelectCityView.h
//  TWCitySelectView
//
//  Created by TreeWriteMac on 16/6/30.
//  Copyright © 2016年 Raykin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWSelectCityView : UIView

-(instancetype)initWithTWFrame:(CGRect)rect TWselectCityTitle:(NSString*)title;

/**
 *  显示
 tag:1--城市，2--茶；
 */
-(void)showCityView:(void(^)(NSString *proviceStr,NSString *cityStr,NSString *distr))selectStr tag:(int)tag;


@end
