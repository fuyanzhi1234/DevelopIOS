//
//  WeChatTableViewCell.m
//  SimWeChat
//
//  Created by Charlie on 15/10/12.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "WeChatTableViewCell.h"

@interface WeChatTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *message;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end

@implementation WeChatTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(WeChatData *)data{
    [self.name setText:data.username];
    [self.message setText:data.lastWord];
    [self.time setText:data.lastTime];
}

@end
