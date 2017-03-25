//
//  tieziTableViewCell.m
//  TV
//
//  Created by HOME on 16/9/18.
//  Copyright © 2016年 Appcoda. All rights reserved.
//

#import "tieziTableViewCell.h"

@implementation tieziTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _image.layer.cornerRadius = 4;
    _image.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
