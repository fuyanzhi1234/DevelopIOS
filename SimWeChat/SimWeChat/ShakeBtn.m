//
//  ShakeBtn.m
//  SimWeChat
//
//  Created by Charlie on 15/12/26.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "ShakeBtn.h"
#import "Masonry.h"

@implementation ShakeBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Cycle Life
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addSubview:self.upImageView];
        [self addSubview:self.downLabel];
        [self.upImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top);
            make.centerX.mas_equalTo(self.mas_centerX);
            make.width.mas_equalTo(@34);
            make.height.mas_equalTo(@28);
            
        }];
        [self.downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            //            make.width.mas_equalTo(self.mas_width);
            make.bottom.mas_equalTo(self.mas_bottom);
        }];
    }
 
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.upImageView];
        [self addSubview:self.downLabel];
        [self.upImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top);
            make.centerX.mas_equalTo(self.mas_centerX);
            make.width.mas_equalTo(@60);
            make.height.mas_equalTo(@60);
            
        }];
        [self.downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
//            make.width.mas_equalTo(self.mas_width);
            make.bottom.mas_equalTo(self.mas_bottom);
        }];
    }
    
    return self;
}

#pragma mark - Public

- (void)setChecked:(BOOL)checked {
    if (checked) {
        [self.upImageView setImage:_upImageHighlight];
        [self.downLabel setTextColor:[UIColor greenColor]];
    }
    else {
        [self.upImageView setImage:_upImageNormal];
        [self.downLabel setTextColor:[UIColor blackColor]];
    }
}

#pragma mark - Getter

- (UIImageView *)upImageView {
    if (_upImageView == nil) {
        _upImageView = [[UIImageView alloc] init];
    }
    return _upImageView;
}

- (UILabel *)downLabel {
    if (_downLabel == nil) {
        _downLabel = [[UILabel alloc] init];
        [_downLabel setTextColor:[UIColor blackColor]];
    }
    return _downLabel;
}

#pragma mark - Setter

- (void)setUpImageNormal:(UIImage *)upImageNormal {
    _upImageNormal = upImageNormal;
    [self.upImageView setImage:upImageNormal];
}

- (void)setUpImageHighlight:(UIImage *)upImageHighlight {
    _upImageHighlight = upImageHighlight;
//    [self.upImageView setImage:upImageHighlight];
}

- (void)setDownLabelText:(NSString *)downLabelText {
    _downLabelText = downLabelText;
    [self.downLabel setText:downLabelText];
}

@end
