//
//  CircleShapeLayer.m
//  CircularProgressControl
//
//  Created by Carlos Eduardo Arantes Ferreira on 22/11/14.
//  Copyright (c) 2014 Mobistart. All rights reserved.
//

#import "CircleShapeLayer.h"

@interface CircleShapeLayer ()

@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, assign) CGRect frame;

@end

@implementation CircleShapeLayer

//@synthesize percent = _percent;
#pragma mark - Private Methods

- (instancetype)init {
    if ((self = [super init]))
    {
        _circleBeginPercent = 0.0;
        _circleEndPercent = 0.0;
        _circleProgressColor = [UIColor colorWithRed:0.86f green:0.86f blue:0.86f alpha:0.4f];
        _circleBackgroundColor = [UIColor whiteColor];
        _circleProgressLineWidth = 2.0;
        _circleBackgroundLineWidth = 4.0;
        
        [self setupLayer];
    }
    
    return self;
}

- (void)layoutSublayers {

    self.path = [self drawPathWithArcCenter];
    self.progressLayer.path = [self drawPathWithArcCenter];
    [super layoutSublayers];
}

- (void)setupLayer {
    
    self.path = [self drawPathWithArcCenter];
    self.fillColor = [UIColor clearColor].CGColor;
    self.strokeColor = _circleProgressColor.CGColor;
    self.lineWidth = _circleProgressLineWidth;
    
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.path = [self drawPathWithArcCenter];
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeColor = _circleBackgroundColor.CGColor;
    self.progressLayer.lineWidth = _circleBackgroundLineWidth;
    self.progressLayer.strokeEnd = _circleEndPercent;
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.lineJoin = kCALineJoinRound;
    [self addSublayer:self.progressLayer];
    
}

- (CGPathRef)drawPathWithArcCenter {
    
    CGFloat position_y = self.frame.size.height/2;
    CGFloat position_x = self.frame.size.width/2; // Assuming that width == height
    return [UIBezierPath bezierPathWithArcCenter:CGPointMake(position_x, position_y)
                                          radius:position_y
                                      startAngle:(-M_PI/2)
                                        endAngle:(3*M_PI/2)
                                       clockwise:YES].CGPath;
}

#pragma mark - Public Methods

- (void)animate {
    [self startAnimation];
}

#pragma mark - Setter

- (void)setCircleEndPercent:(double)circleEndPercent {
    _circleEndPercent = circleEndPercent;
    self.progressLayer.strokeEnd = self.circleEndPercent;
}

- (void)setCircleProgressColor:(UIColor *)circleProgressColor {
    _circleProgressColor = circleProgressColor;
    self.progressLayer.strokeColor = circleProgressColor.CGColor;
}

- (void)setCircleBackgroundColor:(UIColor *)circleBackgroundColor {
    _circleBackgroundColor = circleBackgroundColor;
    self.strokeColor = circleBackgroundColor.CGColor;
}

- (void)setCircleProgressLineWidth:(CGFloat)circleProgressLineWidth {
    _circleProgressLineWidth = circleProgressLineWidth;
    self.progressLayer.lineWidth = circleProgressLineWidth;
}

- (void)setCircleBackgroundLineWidth:(CGFloat)circleBackgroundLineWidth {
    _circleBackgroundLineWidth = circleBackgroundLineWidth;
    self.lineWidth = circleBackgroundLineWidth;
}

- (void)startAnimation {
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.fromValue = @(self.circleBeginPercent);
    pathAnimation.toValue = @(self.circleEndPercent);
    pathAnimation.removedOnCompletion = YES;
    
    [self.progressLayer addAnimation:pathAnimation forKey:nil];
    
}

@end
