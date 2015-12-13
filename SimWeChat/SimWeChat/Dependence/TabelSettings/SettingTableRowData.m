//
//  SettingTableRowData.m
//  TestSettingTable
//
//  Created by Chaos on 15/11/13.
//  Copyright © 2015年 Chaos. All rights reserved.
//

#import "SettingTableRowData.h"

static const NSString *kSettingCellTitle = @"Title";
static const NSString *kSettingCellDetail = @"Detail";
static const NSString *kSettingCellType = @"Type";
static const NSString *kSettingCellImage = @"Image";
static const NSString *kSettingCellDetailImage = @"DetailImage";
static const NSString *kSettingCellSwitchOn = @"SwitchOn";
static const NSString *kSettingCellAccessoryImage = @"AccessoryImage";
static const NSString *kSettingCellHighlightedAccessoryImage = @"HighlightedAccessoryImage";
static const NSString *kSettingCellFooter = @"Footer";

@interface SettingTableRowData ()

@end

@implementation SettingTableRowData

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.title = dic[kSettingCellTitle];
        self.detail = dic[kSettingCellDetail];
        self.imageName = dic[kSettingCellImage];
        self.detailImageName = dic[kSettingCellDetailImage];
        self.footer = dic[kSettingCellFooter];
        self.switchOn = [dic[kSettingCellSwitchOn] boolValue];
        self.accessoryImageName = dic[kSettingCellAccessoryImage];
        self.highlightedAccessoryImageName = dic[kSettingCellHighlightedAccessoryImage];
        self.hasUnreadMsg = NO;
        
        // type 字符串转 enum
        NSString *typeStr = dic[kSettingCellType];
        if ([@"Title" isEqualToString:typeStr]) {
            self.type = SettingCellTypeTitle;
        } else if ([@"Switch" isEqualToString:typeStr]) {
            self.type = SettingCellTypeSwitch;
        } else if ([@"Button" isEqualToString:typeStr]){
            self.type = SettingCellTypeButton;
        } else if ([@"ButtonWithAccessory" isEqual:typeStr]) {
            self.type = SettingCellTypeButtonWithAccessory;
        }
    }
    return self;
}

- (UIImage *)image {
    if (self.imageName) {
        return [UIImage imageNamed:self.imageName];
    } else {
        return nil;
    }
}

- (UIImage *)detailImage {
    if (self.detailImageName) {
        return [UIImage imageNamed:self.detailImageName];
    } else {
        return nil;
    }
}

- (UIImage *)accessoryImage {
    if (self.accessoryImageName) {
        return [UIImage imageNamed:self.accessoryImageName];
    } else {
        return nil;
    }
}

- (UIImage *)highlightedAccessoryImage {
    if (self.highlightedAccessoryImageName) {
        return [UIImage imageNamed:self.highlightedAccessoryImageName];
    } else {
        return nil;
    }
}

@end
