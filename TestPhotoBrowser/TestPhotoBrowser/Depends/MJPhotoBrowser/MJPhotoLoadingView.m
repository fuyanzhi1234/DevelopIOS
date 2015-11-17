//
//  MJPhotoLoadingView.m
//
//  Created by mj on 13-3-4.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MJPhotoLoadingView.h"
#import "MJPhotoBrowser.h"
#import <QuartzCore/QuartzCore.h>
#import "MJPhotoProgressView.h"

@interface MJPhotoLoadingView ()
{
    UILabel *_failureLabel;
    MJPhotoProgressView *_progressView;
    UIView *_contentView;
}

@end

@implementation MJPhotoLoadingView

- (void)setFrame:(CGRect)frame
{
    [super setFrame:[UIScreen mainScreen].bounds];
}

- (void)showFailure
{
    [_progressView removeFromSuperview];
    
    if (!_contentView) {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
        _contentView.backgroundColor = [UIColor blackColor];
        [self addSubview:_contentView];
        
        UIImage *image = [UIImage imageNamed:@""];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((320-image.size.width)/2.0, 0, image.size.width, image.size.height)];
        imageView.image = image;
        [_contentView addSubview:imageView];
        
        NSString *str = @"图片加载失败";
        CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(320, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+15, 320, size.height)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = str;
        label.textColor = [UIColor colorWithWhite:1.0 alpha:0.75];
        label.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:label];
        CGRect contentRect = _contentView.frame;
        contentRect.size.height = CGRectGetMaxY(label.frame);
        _contentView.frame = contentRect;
        
        _contentView.center = self.center;
    }
    [self bringSubviewToFront:_contentView];
}

- (void)showLoading
{
    [_failureLabel removeFromSuperview];
    
    if (_progressView == nil) {
        _progressView = [[MJPhotoProgressView alloc] init];
        _progressView.bounds = CGRectMake( 0, 0, 60, 60);
        _progressView.center = self.center;
    }
    _progressView.progress = kMinProgress;
    [self addSubview:_progressView];
}

#pragma mark - customlize method
- (void)setProgress:(float)progress
{
    _progress = progress;
    _progressView.progress = progress;
    if (progress >= 1.0) {
        [_progressView removeFromSuperview];
    }
}
@end
