//
//  MJPhotoLoadingView.h
//
//  Created by mj on 13-3-4.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMinProgress 0.0001

@class MJPhotoBrowser;
@class MJPhoto;

@interface MJPhotoLoadingView : UIView
@property (nonatomic) float progress;
/**
 *  加载失败后展示的图片
 */
@property (copy, nonatomic) NSString *failedImageName;

/**
 *  加载失败后展示的文字
 */
@property (strong, nonatomic) NSString *failedText;

/**
 *  显示加载中页面
 */
- (void)showLoading;

/**
 *  显示加载失败页面
 */
- (void)showFailure;
@end