//
//  ShopTableViewCell.m
//  TV
//
//  Created by HOME on 16/9/18.
//  Copyright © 2016年 Appcoda. All rights reserved.
//

#import "ShopTableViewCell.h"

@implementation ShopTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.deleteChooseBtn.layer.cornerRadius = self.deleteChooseBtn.frame.size.width/2;
    self.deleteChooseBtn.layer.masksToBounds = YES;
    self.deleteChooseBtn.layer.borderWidth = 1;
    self.deleteChooseBtn.layer.borderColor = [UIColor redColor].CGColor;
    self.deleteChooseBtn.hidden = YES;
    
    self.imageHead.layer.cornerRadius = 3;
    self.imageHead.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)add:(id)sender {
    _num++;
    self.numLable.text = [NSString stringWithFormat:@"%d",_num];
}

- (IBAction)jianhao:(id)sender {
    if (_num == 0) {
        return;
    }
    _num--;
    self.numLable.text = [NSString stringWithFormat:@"%d",_num];
}
@end
