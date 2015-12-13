//
//  SettingsTableViewCell.m
//  TestSettingTable
//
//  Created by Charlie on 15/12/13.
//  Copyright © 2015年 Chaos. All rights reserved.
//

#import "SettingsTableViewCell.h"
#import "Masonry.h"

@interface SettingsTableViewCell()


@end


@implementation SettingsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Getter & Setter
- (UIImageView *)detailImageView {
    if (!_detailImageView) {
        // 详情图片
        _detailImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_detailImageView];
        [_detailImageView mas_makeConstraints:^(MASConstraintMaker *maker) {
            maker.right.equalTo(self.contentView.mas_right);
            maker.top.equalTo(self.contentView.mas_top).with.offset(DetailImageViewSpacing);
            maker.width.equalTo(self.contentView.mas_height).with.offset(- DetailImageViewSpacing * 2);
            maker.height.equalTo(self.contentView.mas_height).with.offset(- DetailImageViewSpacing * 2);
        }];
    }
    return _detailImageView;
}

@end
