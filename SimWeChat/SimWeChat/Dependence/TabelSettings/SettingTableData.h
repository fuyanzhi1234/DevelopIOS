//
//  SettingTableData.h
//  设置页面通常使用 UITableView，这里定义了两个类用于封装对应的模型
//  通常使用时，只需要配置 Plist 文件，调用 [SettingTableData dataWithPlist] 方法即可
//  Plist 文件示例如下：
//    <plist version="1.0">
//    <array>
//        <array>
//            <dict>
//                <key>Type</key><string>Button</string>
//                <key>Title</key><string>home.menu.profile</string>
//                <key>Image</key><string>menu_icon_profile</string>
//            </dict>
//            <dict>
//                <key>Type</key><string>Title</string>
//                <key>Title</key><string>home.title.username</string>
//                <key>Detail</key><string>home.title.username</string>
//            </dict>
//            <dict>
//                <key>Type</key><string>Switch</string>
//                <key>Title</key><string>home.title.isOn</string>
//                <key>SwitchOn</key><true/>
//            </dict>
//            <dict>
//                <key>Type</key><string>ButtonWithAccessory</string>
//                <key>Title</key><string>SomeKey</string>
//                <key>AccessoryImage</key><string>menu_bt_open_list</string>
//            </dict>
//        </array>
//    </array>
//    </plist>
//
//  Created by Chaos on 15/11/13.
//  Copyright © 2015年 Chaos. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "SettingTableRowData.h"

@interface SettingTableData : NSObject

/**
 *  从一个 plist 配置文件创建
 *
 *  @param fileName plist文件名
 *
 *  @return
 */
+ (SettingTableData *)dataWithPlist:(NSString *)fileName;

/**
 *  从 Array 创建实例
 *
 *  @param array 数组，每个元素为 Dictionary，需要包含相应的key
 *
 *  @return 
 */
+ (SettingTableData *)dataWithArray:(NSArray *)array;

/**
 *  根据 indexPath 返回相应的 SettingTableRowData
 *
 *  @param indexPath
 *
 *  @return
 */
- (SettingTableRowData *)dataForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  某个 Section 中的 row 数量，，与 UITableViewDelegate 配合使用
 *
 *  @param section
 *
 *  @return
 */
- (NSInteger)rowCountInSection:(NSInteger)section;

/**
 *  Footer 的文字
 *
 *  @param section <#section description#>
 *
 *  @return <#return value description#>
 */
- (NSString *)footerTitleForSection:(NSInteger)section;

- (SettingTableRowData *)rowDataWithTitle:(NSString *)title;
/**
 *  所有的 Section
 */
@property (copy, nonatomic) NSArray *sections;

/**
 *  Section 数量
 */
@property (assign, readonly, nonatomic) NSInteger sectionCount;

@end
