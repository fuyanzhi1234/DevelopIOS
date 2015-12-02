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

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.failedImageName = @"MJPhotoBrowser.bundle/save_icon.png";
        self.failedText = NSLocalizedString(@"mjPhotoBrowser.title.failedText", nil);
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:[UIScreen mainScreen].bounds];
}

- (void)showFailure
{
    [_progressView removeFromSuperview];
    
    if (!_contentView) {
        int screenWidth = [UIScreen mainScreen].bounds.size.width;
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 200)];
        _contentView.backgroundColor = [UIColor blackColor];
        [self addSubview:_contentView];
        
        UIImage *image = [UIImage imageNamed:self.failedImageName];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((screenWidth - image.size.width)/2.0, 0, image.size.width, image.size.height)];
        imageView.image = image;
        [_contentView addSubview:imageView];
        
        NSString *str = self.failedText;
        CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(screenWidth, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+15, screenWidth, size.height)];
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
