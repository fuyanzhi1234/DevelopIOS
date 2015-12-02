//
//  MJPhotoToolbar.m
//  FingerNews
//
//  Created by mj on 13-9-24.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MJPhotoToolbar.h"
#import "MJPhoto.h"
#import "MBProgressHUD+Add.h"
#import "ALAssetsLibrary+CustomPhotoAlbum.h"

static const CGFloat SaveBtnOffset = 10.0f;

@interface MJPhotoToolbar()
@property(strong, nonatomic) UILabel *indexLabel;
@property(strong, nonatomic) UIButton *saveImageBtn;
@end

@implementation MJPhotoToolbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    
    if (_photos.count > 1) {
        [self addSubview:self.indexLabel];
    }
    
    [self addSubview:self.saveImageBtn];
}

- (UILabel *)indexLabel {
    if (!_indexLabel) {
        _indexLabel = [[UILabel alloc] init];
        _indexLabel.font = self.labelFont;
        _indexLabel.frame = self.bounds;
        _indexLabel.backgroundColor = [UIColor clearColor];
        _indexLabel.textColor = self.labelColor;
        _indexLabel.textAlignment = NSTextAlignmentCenter;
        _indexLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [_indexLabel.layer setShadowColor:[UIColor blackColor].CGColor];
        [_indexLabel.layer setShadowOffset:CGSizeMake(0, 0.5)];
        [_indexLabel.layer setShadowRadius:0.5];
        [_indexLabel.layer setShadowOpacity:1.0];
    }
    return _indexLabel;
}

- (UIButton *)saveImageBtn {
    if (!_saveImageBtn) {
        // 保存图片按钮
        CGFloat btnWidth = self.bounds.size.height;
        CGFloat btnX = 0.0;
        _saveImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (self.saveBtnPosition == MJPhotoBrowserSaveBtnPositionLeft) {
            btnX = SaveBtnOffset;
        }
        else if (self.saveBtnPosition == MJPhotoBrowserSaveBtnPositionRight) {
            btnX = CGRectGetWidth(self.bounds) - SaveBtnOffset - btnWidth;
        }
        _saveImageBtn.frame = CGRectMake(btnX, 0, btnWidth, btnWidth);
        _saveImageBtn.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [_saveImageBtn setImage:[UIImage imageNamed:self.saveNormalImage] forState:UIControlStateNormal];
        [_saveImageBtn setImage:[UIImage imageNamed:self.saveHighlightedImage] forState:UIControlStateHighlighted];
        [_saveImageBtn addTarget:self action:@selector(saveImage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _saveImageBtn;
}

- (void)saveImage
{
    __weak MJPhotoToolbar *this = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        MJPhoto *photo = _photos[_currentPhotoIndex];
        
        void (^completion)(NSURL *, NSError *) = ^(NSURL *assetURL, NSError *error) {
//            if (error) DDLogDebug(@"!!!ERROR,  write the image data to the assets library (camera roll): %@",
//                                  [error description]);
            [this image:nil didFinishSavingWithError:nil contextInfo:nil];
            
        };
        
        void (^failure)(NSError *) = ^(NSError *error) {
            if (error == nil) return;
//            DDLogDebug(@"!!!ERROR, failed to add the asset to the custom photo album: %@", [error description]);
            [this image:nil didFinishSavingWithError:error contextInfo:nil];
        };
        
        ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
        [assetsLibrary saveImage:photo.image
                         toAlbum:@"FT-Teacher"
                      completion:completion
                         failure:failure];
        
        
    });
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (error) {
            [MBProgressHUD showSuccess:NSLocalizedString(@"mjPhotoBrowser.title.savePhotoFailed", nil) toView:nil];
        } else {
            MJPhoto *photo = _photos[_currentPhotoIndex];
            photo.save = YES;
            _saveImageBtn.enabled = NO;
            [MBProgressHUD showSuccess:NSLocalizedString(@"mjPhotoBrowser.title.savePhotoSuccess", nil) toView:nil];
        }
        
    });
}

- (void)setCurrentPhotoIndex:(NSUInteger)currentPhotoIndex
{
    _currentPhotoIndex = currentPhotoIndex;
    
    // 更新页码
    _indexLabel.text = [NSString stringWithFormat:@"%d / %d", (int)_currentPhotoIndex + 1, (int)_photos.count];
    
    MJPhoto *photo = _photos[_currentPhotoIndex];
    // 按钮
    _saveImageBtn.enabled = photo.image != nil && !photo.save;
    _saveImageBtn.hidden =!_showSaveBtn;
}

@end
