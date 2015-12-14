//
//  SettingTableView.m
//  TestSettingTable
//
//  Created by Chaos on 15/11/13.
//  Copyright © 2015年 Chaos. All rights reserved.
//

#import "SettingTableView.h"
#import "SettingTableData.h"
#import "SettingTableRowData.h"
#import "Masonry.h"
#import "WZLBadgeImport.h"
#import "SettingsTableViewCell.h"

//#pragma mark - SettingTableSwitch

//@interface SettingTableSwitch : UISwitch
//@property (weak, nonatomic) SettingTableRowData *rowData;
//@end
//
//@implementation SettingTableSwitch
//@end

#pragma mark - SettingTableView

@interface SettingTableView () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SettingTableView

- (void)awakeFromNib {
    NSAssert(self.style == UITableViewStyleGrouped, @"SettingTableView must be grouped style!");
    self.delegate = self;
    self.dataSource = self;
    if (self.settingFileName) {
        [self parseSettingFile];
    } else {
        self.data = [[SettingTableData alloc] init];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.sectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data rowCountInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingTableRowData *rowData = [self.data dataForRowAtIndexPath:indexPath];
    SettingsTableViewCell *cell = [self tableView:self newCellForType:rowData.type];
    cell.textLabel.text = NSLocalizedString(rowData.title, nil);
    cell.detailTextLabel.text = NSLocalizedString(rowData.detail, nil);
    cell.imageView.image = rowData.image;
    cell.detailImageView.image = rowData.detailImage;
    // 当detailTextLabel和detailImageView同时存在，detailImageView默认在后面
    if (rowData.detailImage) {
        cell.detailImageView.image = rowData.detailImage;
        if (rowData.detail) {
            [cell.detailTextLabel mas_makeConstraints:^(MASConstraintMaker *maker) {
                maker.right.equalTo(cell.detailImageView.mas_left).offset(- DetailImageViewSpacing);
                maker.centerY.equalTo(cell.contentView.mas_centerY);
            }];
        }
        // 当有未读消息
        if (rowData.hasUnreadMsg) {
            [cell.detailImageView showBadge];
            [cell.detailImageView.badge mas_makeConstraints:^(MASConstraintMaker *maker) {
                CGFloat badgeWidth = CGRectGetWidth(cell.detailImageView.badge.frame);
                maker.top.equalTo(cell.detailImageView.mas_top).with.offset(-badgeWidth / 2);
                maker.right.equalTo(cell.detailImageView.mas_right).with.offset(badgeWidth / 2);
                maker.width.equalTo([NSNumber numberWithFloat:badgeWidth]);
                maker.height.equalTo([NSNumber numberWithFloat:badgeWidth]);
            }];
        }
        else {
            [cell.detailImageView clearBadge];
        }
    }
    else {
        if (cell.detailImageView) {
            [cell.detailImageView clearBadge];
            cell.detailImageView = nil;
        }
    }
    
    if (rowData.image) {
        cell.imageView.frame = CGRectOffset(cell.imageView.frame, 50, 0);
    }
    
    if (SettingCellTypeButtonWithAccessory == rowData.type) {
        UIButton *btn = (UIButton *)cell.accessoryView;
        btn.frame = CGRectMake(0, 0, rowData.accessoryImage.size.width, rowData.accessoryImage.size.height);
        [btn setBackgroundImage:rowData.accessoryImage forState:UIControlStateNormal];
        [btn setBackgroundImage:rowData.highlightedAccessoryImage forState:UIControlStateHighlighted];
    } else if (SettingCellTypeSwitch == rowData.type) {
        UISwitch *cellSwitch = (UISwitch *)cell.accessoryView;
//        cellSwitch.rowData = rowData;
//        cellSwitch.on = rowData.switchOn;
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return NSLocalizedString([self.data footerTitleForSection:section], nil);
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SettingTableRowData *rowData = [self.data dataForRowAtIndexPath:indexPath];
    
    if ((SettingCellTypeButton == rowData.type || SettingCellTypeButtonWithAccessory == rowData.type)
        && self.settingDelegate
        && [self.settingDelegate respondsToSelector:@selector(settingTableView:buttonTappedForTitle:)]) {
        [self.settingDelegate settingTableView:self buttonTappedForTitle:rowData.title];
    }
}

#pragma mark - Private

- (void)parseSettingFile {
    self.data = [SettingTableData dataWithPlist:self.settingFileName];
}

/**
 *  根据类型创建或reuse相应的Cell
 *
 *  @param tableView
 *  @param type SettingCellType
 *
 *  @return SettingsTableViewCell
 */
- (SettingsTableViewCell *)tableView:(UITableView *)tableView newCellForType:(SettingCellType)type {
    NSString *cellId = [NSString stringWithFormat:@"%ld", (long)type];
    SettingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SettingsTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        if (SettingCellTypeTitle == type) {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        } else if (SettingCellTypeButton == type) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } else if (SettingCellTypeSwitch == type) {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UISwitch *switchView = [[UISwitch alloc] init];
            [switchView addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = switchView;
        } else if (SettingCellTypeButtonWithAccessory == type) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn addTarget:self action:@selector(accessoryTapped:) forControlEvents:UIControlEventTouchUpInside];
            cell.accessoryView = btn;
        }
        
        // 颜色与字号
        if (self.cellBackgroundColor) {
            cell.backgroundColor = self.cellBackgroundColor;
        }
        if (self.cellSelectedBackgroundColor) {
            UIView *backgroundView = [[UIView alloc] init];
            backgroundView.backgroundColor = self.cellSelectedBackgroundColor;
            cell.selectedBackgroundView = backgroundView;
        }
        if (self.cellTitleColor) {
            cell.textLabel.textColor = self.cellTitleColor;
        }
        if (self.cellTitleFont) {
            cell.textLabel.font = self.cellTitleFont;
        }
        if (self.cellDetailColor) {
            cell.detailTextLabel.textColor = self.cellDetailColor;
        }
        if (self.cellDetailFont) {
            cell.detailTextLabel.font = self.cellDetailFont;
        }
    }
    return cell;
}

/**
 *  UISwitch改变
 *
 *  @param sender
 */
- (void)switchChanged:(UISwitch *)sender {
    // 通过accesory的supview解决
    SettingsTableViewCell * curCell = (SettingsTableViewCell *)[sender superview];
    NSIndexPath *curIndexPath = [self indexPathForCell:curCell];
    SettingTableRowData *rowData = [self.data dataForRowAtIndexPath:curIndexPath];
    rowData.switchOn = sender.isOn;
    if (self.settingDelegate && [self.settingDelegate respondsToSelector:@selector(settingTableView:switchChanged:forTitle:)]) {
        NSString *title = rowData.title;
        [self.settingDelegate settingTableView:self switchChanged:sender.isOn forTitle:title];
    }
    
//    sender.rowData.switchOn = sender.isOn;
//    if (self.settingDelegate && [self.settingDelegate respondsToSelector:@selector(settingTableView:switchChanged:forTitle:)]) {
//        NSString *title = sender.rowData.title;
//        [self.settingDelegate settingTableView:self switchChanged:sender.isOn forTitle:title];
//    }
}

/**
 *  Accessory被点击，自定义的 UIButton 作为 AccessoryView 时，无法进入 delegate 方法，所以需要自己实现
 *
 *  @param sender
 */
- (void)accessoryTapped:(UIButton *)sender {
    if (self.settingDelegate && [self.settingDelegate respondsToSelector:@selector(settingTableView:accessoryTappedForTitle:)]) {
        // 由于 UIButton 不适宜子类化，这里用 point 来解决
//        CGPoint point = [sender convertPoint:CGPointZero toView:self];
//        NSIndexPath *indexPath = [self indexPathForRowAtPoint:point];
//        NSString *title = [self.data dataForRowAtIndexPath:indexPath].title;
//        [self.settingDelegate settingTableView:self accessoryTappedForTitle:title];

        // 通过accesory的supview解决
        SettingsTableViewCell * curCell = (SettingsTableViewCell *)[sender superview];
        NSIndexPath *curIndexPath = [self indexPathForCell:curCell];
        NSString *title = [self.data dataForRowAtIndexPath:curIndexPath].title;
        [self.settingDelegate settingTableView:self accessoryTappedForTitle:title];
    }
}

@end