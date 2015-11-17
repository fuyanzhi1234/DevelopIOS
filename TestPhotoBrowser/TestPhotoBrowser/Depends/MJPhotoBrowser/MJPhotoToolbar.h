//
//  MJPhotoToolbar.h
//  FingerNews
//
//  Created by mj on 13-9-24.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MJPhotoBrowserSaveBtnPosition) {
    MJPhotoBrowserSaveBtnPositionLeft, // 显示在左边
    MJPhotoBrowserSaveBtnPositionRight  // 显示在右边
};

@interface MJPhotoToolbar : UIView
// 所有的图片对象
@property (nonatomic, strong) NSArray *photos;
// 当前展示的图片索引
@property (nonatomic, assign) NSUInteger currentPhotoIndex;
// 是否显示保存按钮
@property (nonatomic, assign) NSUInteger showSaveBtn;
// 索引字体颜色
@property (strong, nonatomic) UIColor *labelColor;
// 索引字体大小
@property (strong, nonatomic) UIFont *labelFont;
// 保存按钮图片（normal）
@property (copy, nonatomic) NSString *saveNormalImage;
// 保存按钮图片（highlighted）
@property (copy, nonatomic) NSString *saveHighlightedImage;
// 保存按钮位置
@property (assign, nonatomic) MJPhotoBrowserSaveBtnPosition saveBtnPosition;

@end
