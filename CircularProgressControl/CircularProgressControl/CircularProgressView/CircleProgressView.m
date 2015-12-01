//
//  CircleProgressView.m
//  CircularProgressControl
//
//  Created by Carlos Eduardo Arantes Ferreira on 22/11/14.
//  Copyright (c) 2014 Mobistart. All rights reserved.
//

#import "CircleProgressView.h"
#import "CircleShapeLayer.h"

@interface CircleProgressView()

@property (nonatomic, strong) CircleShapeLayer *progressLayer;
@property (strong, nonatomic) UILabel *progressLabel;

@end

@implementation CircleProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)awakeFromNib {
    [self setupViews];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.progressLayer.frame = self.bounds;
    
    [self.progressLabel sizeToFit];
    self.progressLabel.center = CGPointMake(self.center.x - self.frame.origin.x, self.center.y- self.frame.origin.y);
}

- (void)updateConstraints {
    [super updateConstraints];
}

- (UILabel *)progressLabel
{
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _progressLabel.numberOfLines = 2;
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.backgroundColor = [UIColor clearColor];
        _progressLabel.textColor = [UIColor whiteColor];
        
        [self addSubview:_progressLabel];
    }
    
    return _progressLabel;
}

- (double)percent {
    return self.progressLayer.circleEndPercent;
}

#pragma mark - Private Methods

- (void)setupViews {
    
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = false;
    
    //add Progress layer
    self.progressLayer = [[CircleShapeLayer alloc] init];
    self.progressLayer.frame = self.bounds;
    NSLog(@"%lu", (unsigned long)self.bounds.size.width);
    self.progressLayer.backgroundColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:self.progressLayer];
    
}

#pragma mark - setter

- (void)setCircleBeginPercent:(double)circleBeginPercent {
    _circleBeginPercent = circleBeginPercent;
    self.progressLayer.circleBeginPercent = circleBeginPercent;
}

- (void)setCircleEndPercent:(double)circleEndPercent {
    _circleEndPercent = circleEndPercent;
    self.progressLayer.circleEndPercent = circleEndPercent;
}

- (void)setCircleProgressColor:(UIColor *)circleProgressColor {
    _circleProgressColor = circleProgressColor;
    self.progressLayer.circleProgressColor = circleProgressColor;
}

- (void)setCircleBackgroundColor:(UIColor *)circleBackgroundColor {
    _circleBackgroundColor = circleBackgroundColor;
    self.progressLayer.circleBackgroundColor = circleBackgroundColor;
}

- (void)setCircleProgressLineWidth:(CGFloat)circleProgressLineWidth {
    _circleProgressLineWidth = circleProgressLineWidth;
    self.progressLayer.circleProgressLineWidth = circleProgressLineWidth;
}

- (void)setCircleBackgroundLineWidth:(CGFloat)circleBackgroundLineWidth {
    _circleBackgroundLineWidth = circleBackgroundLineWidth;
    self.progressLayer.circleBackgroundLineWidth = circleBackgroundLineWidth;
}

- (void)setPercentTitleColor:(UIColor *)percentTitleColor {
    self.progressLabel.textColor = percentTitleColor;
}

- (void)setTitle:(NSString *)title percent:(NSString *)percent {
    NSMutableAttributedString *attributedString;
    
    if (title.length > 0) {
        
        attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@", percent, title]];
        
        [attributedString addAttributes:@{
                                        NSFontAttributeName: [UIFont systemFontOfSize:36]}
                                range:NSMakeRange(0, percent.length)];
        
        [attributedString addAttributes:@{
                                        NSFontAttributeName: [UIFont systemFontOfSize:12]}
                                range:NSMakeRange(percent.length+1, title.length)];
        
    }
    else
    {
        attributedString = [[NSMutableAttributedString alloc] initWithString:@""];
        
        [attributedString addAttributes:@{
                                        NSFontAttributeName: [UIFont systemFontOfSize:36]}
                                range:NSMakeRange(0, percent.length)];
    }
    
    self.progressLabel.attributedText = attributedString;
//    _progressLabel.text = @"xxx";
}

#pragma mark - Public Methods

- (void)animate {
    [self.progressLayer animate];
}

@end
