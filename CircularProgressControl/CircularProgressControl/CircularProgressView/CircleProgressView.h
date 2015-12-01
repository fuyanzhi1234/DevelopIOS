//
//  CircleProgressView.h
//  CircularProgressControl
//
//  Created by Carlos Eduardo Arantes Ferreira on 22/11/14.
//  Copyright (c) 2014 Mobistart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleProgressView : UIControl

@property (nonatomic, retain) NSString *status;

@property (assign, nonatomic) double circleBeginPercent;
@property (assign, nonatomic) double circleEndPercent;
@property (assign, nonatomic) bool circleAnimate;
@property (strong, nonatomic) UIColor *circleProgressColor;
@property (strong, nonatomic) UIColor *circleBackgroundColor;
@property (assign, nonatomic) CGFloat circleProgressLineWidth;
@property (assign, nonatomic) CGFloat circleBackgroundLineWidth;
@property (copy, nonatomic) NSString *title;

- (void)animate;

@end
