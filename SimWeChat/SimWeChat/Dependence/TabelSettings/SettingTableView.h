//
//  SettingTableView.h
//  TestSettingTable
//
//  Created by Chaos on 15/11/13.
//  Copyright © 2015年 Chaos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingTableData.h"

@class SettingTableView;

@protocol SettingTableViewDelegate <NSObject>

@optional
/**
 *  Button 或者 ButtonWithAccessory 类型的 Cell 被点击
 *
 *  @param tableView SettingTableView
 *  @param title     Cell对应模型的 title
 */
- (void)settingTableView:(SettingTableView *)tableView buttonTappedForTitle:(NSString *)title;

/**
 *  Switch 类型的 Cell 开关值切换
 *
 *  @param tableView SettingTableView
 *  @param on        开还是关
 *  @param title     Cell 对应模型的 title
 */
- (void)settingTableView:(SettingTableView *)tableView switchChanged:(BOOL)on forTitle:(NSString *)title;

/**
 *  ButtonWithAccessory 类型的 Cell 的 Accessory 被点击
 *
 *  @param tableView SettingTableView
 *  @param title     Cell 对应模型的 title
 */
- (void)settingTableView:(SettingTableView *)tableView accessoryTappedForTitle:(NSString *)title;

@end

IB_DESIGNABLE

@interface SettingTableView : UITableView

@property (copy, nonatomic) IBInspectable NSString *settingFileName;
@property (weak, nonatomic) id<SettingTableViewDelegate> settingDelegate;
@property (strong, nonatomic) SettingTableData *data;
/**
 *  单元格背景颜色
 */
@property (strong, nonatomic) UIColor *cellBackgroundColor;
/**
 *  单元格被选中时背景色
 */
@property (strong, nonatomic) UIColor *cellSelectedBackgroundColor;
/**
 *  单元格标题的字号
 */
@property (strong, nonatomic) UIFont *cellTitleFont;
/**
 *  单元格标题的颜色
 */
@property (strong, nonatomic) UIColor *cellTitleColor;
/**
 *  单元格副标题的字号
 */
@property (strong, nonatomic) UIFont *cellDetailFont;
/**
 *  单元格副标题的颜色
 */
@property (strong, nonatomic) UIColor *cellDetailColor;

@end
