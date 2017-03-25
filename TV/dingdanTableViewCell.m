//
//  dingdanTableViewCell.m
//  TV
//
//  Created by HOME on 16/9/18.
//  Copyright © 2016年 Appcoda. All rights reserved.
//

#import "dingdanTableViewCell.h"

@implementation dingdanTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.deletBtn.layer.borderColor =  RGB(230, 230, 230).CGColor;
    self.deletBtn.layer.borderWidth = 1;
    self.deletBtn.layer.masksToBounds= YES;
    self.deletBtn.layer.cornerRadius = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
