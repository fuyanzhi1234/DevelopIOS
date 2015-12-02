//
//  MJZoomingScrollView.h
//
//  Created by mj on 13-3-4.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MJPhotoBrowser, MJPhoto, MJPhotoView;

@protocol MJPhotoViewDelegate <NSObject>
- (void)photoViewImageFinishLoad:(MJPhotoView *)photoView;
- (void)photoViewSingleTap:(MJPhotoView *)photoView;
@end

@interface MJPhotoView : UIScrollView <UIScrollViewDelegate>
// 图片
@property (nonatomic, strong) MJPhoto *photo;
// 代理
@property (nonatomic, strong) id<MJPhotoViewDelegate> photoViewDelegate;

/**
 *  加载失败后展示的图片
 */
@property (copy, nonatomic) NSString *failedImageName;

/**
 *  加载失败后展示的文字
 */
@property (strong, nonatomic) NSString *failedText;

@end