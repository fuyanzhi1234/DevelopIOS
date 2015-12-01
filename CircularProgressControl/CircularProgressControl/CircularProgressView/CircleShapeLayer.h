//
//  CircleShapeLayer.h
//  CircularProgressControl
//
//  Created by Carlos Eduardo Arantes Ferreira on 22/11/14.
//  Copyright (c) 2014 Mobistart. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CircleShapeLayer : CAShapeLayer

@property (assign, nonatomic) double circleBeginPercent;
@property (assign, nonatomic) double circleEndPercent;
@property (strong, nonatomic) UIColor *circleProgressColor;
@property (strong, nonatomic) UIColor *circleBackgroundColor;
@property (assign, nonatomic) CGFloat circleProgressLineWidth;
@property (assign, nonatomic) CGFloat circleBackgroundLineWidth;

- (void)animate;

@end
