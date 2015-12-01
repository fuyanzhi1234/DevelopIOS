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

- (void)setTintColor:(UIColor *)tintColor {
    self.progressLayer.circleProgressColor = tintColor;
    self.progressLabel.textColor = tintColor;
}

- (void)animate {
    [self.progressLayer animate];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
    NSString *progressString = [NSString stringWithFormat:@"%lu%%", (unsigned long)(_circleEndPercent * 100)];
    
    NSMutableAttributedString *attributedString;
    
    
    if (title.length > 0) {
        
        attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@", progressString, _title]];
        
        [attributedString addAttributes:@{
                                        NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Bold" size:40]}
                                range:NSMakeRange(0, progressString.length)];
        
        [attributedString addAttributes:@{
                                        NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-thin" size:18]}
                                range:NSMakeRange(progressString.length+1, _title.length)];
        
    }
    else
    {
        attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",progressString]];
        
        [attributedString addAttributes:@{
                                        NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Bold" size:18]}
                                range:NSMakeRange(0, progressString.length)];
    }
    
    self.progressLabel.attributedText = attributedString;
//    _progressLabel.text = @"xxx";
}


@end
