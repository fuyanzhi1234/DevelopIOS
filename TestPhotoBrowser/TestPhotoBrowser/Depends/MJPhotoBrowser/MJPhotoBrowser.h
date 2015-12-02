//
//  MJPhotoBrowser.h
//
//  Created by mj on 13-3-4.
//  Copyright (c) 2013年 itcast. All rights reserved.

#import "MJPhoto.h"
#import "MJPhotoToolbar.h"

@protocol MJPhotoBrowserDelegate;

@interface MJPhotoBrowser : NSObject <UIScrollViewDelegate>
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
/**
 *  加载失败后展示的图片
 */
@property (copy, nonatomic) NSString *failedImageName;

/**
 *  加载失败后展示的文字
 */
@property (strong, nonatomic) NSString *failedText;
// 显示
- (void)show;

@end