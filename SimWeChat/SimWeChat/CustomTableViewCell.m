//
//  CustomTableViewCell.m
//  SimWeChat
//
//  Created by Charlie on 15/12/20.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *userHead;

@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.userHead.layer.cornerRadius = 5.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
