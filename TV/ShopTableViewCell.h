//
//  ShopTableViewCell.h
//  TV
//
//  Created by HOME on 16/9/18.
//  Copyright © 2016年 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopTableViewCell : UITableViewCell
- (IBAction)add:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *numLable;
- (IBAction)jianhao:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *deleteChooseBtn;
@property (nonatomic,assign)int num;
@property (weak, nonatomic) IBOutlet UIImageView *imageHead;
@end
