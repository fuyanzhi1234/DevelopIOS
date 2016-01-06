//
//  ShakeBtn.h
//  SimWeChat
//
//  Created by Charlie on 15/12/26.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE

@interface ShakeBtn : UIButton

@property (strong, nonatomic) IBInspectable UIImage *upImageNormal;
@property (strong, nonatomic) IBInspectable UIImage *upImageHighlight;
@property (copy, nonatomic) IBInspectable NSString *downLabelText;

@property (strong, nonatomic) UIImageView *upImageView;
@property (strong, nonatomic) UILabel *downLabel;


- (void)setChecked:(BOOL)checked;

@end
