//
//  SettingsTableViewCell.h
//  TestSettingTable
//
//  Created by Charlie on 15/12/13.
//  Copyright © 2015年 Chaos. All rights reserved.
//

#import <UIKit/UIKit.h>

// 右侧图片与其它控件的最小间距
static const int DetailImageViewSpacing = 5;


@interface SettingsTableViewCell : UITableViewCell

/**
 *  右侧图片（用以预览内容详情）
 */
@property (strong, nonatomic) UIImageView *detailImageView;

@end
