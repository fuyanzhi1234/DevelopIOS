//
//  ProgressViewController.m
//  CircularProgressControl
//
//  Created by Carlos Eduardo Arantes Ferreira on 22/11/14.
//  Copyright (c) 2014 Mobistart. All rights reserved.
//

#import "ProgressViewController.h"
#import "CircleProgressView.h"
#import "Session.h"
#import "CircleShapeLayer.h"

@interface ProgressViewController ()

@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic) Session *session;
@property (strong, nonatomic) CircleShapeLayer *circleLayer;
@property (weak, nonatomic) IBOutlet CircleProgressView *xxx;

@end

@implementation ProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //View Background
    self.view.backgroundColor = [UIColor colorWithRed:51/255.0 green:73/255.0 blue:93/255.0 alpha:1.0];
//
//    self.circleLayer.frame = CGRectMake(self.view.bounds.size.width / 4, self.view.bounds.size.width / 4, self.view.bounds.size.width / 2, self.view.bounds.size.width / 2);
//    self.circleLayer.circleEndPercent = 0.5;
//    [self.view.layer addSublayer:self.circleLayer];
    self.xxx.frame = CGRectMake(self.view.bounds.size.width / 4, self.view.bounds.size.width / 4, self.view.bounds.size.width / 2, self.view.bounds.size.width / 2);
    self.xxx.circleEndPercent = 0.7;
//    self.circleProgressView.circleBackgroundLineWidth = 10;
//    self.circleProgressView.circleProgressColor = [UIColor redColor];
    self.xxx.title = @"完成率";
    [self.xxx animate];
    return;
    
    self.session = [[Session alloc] init];
    self.session.state = kSessionStateStop;
    
    self.circleProgressView.status = NSLocalizedString(@"circle-progress-view.status-not-started", nil);
    
    [self.actionButton setTintColor:[UIColor redColor]];

}

- (CircleShapeLayer *)circleLayer {
    if (!_circleLayer) {
        _circleLayer = [CircleShapeLayer layer];
    }
    return _circleLayer;
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.timer invalidate];
}




#pragma mark - User Interaction

- (IBAction)actionButtonClick:(id)sender {
    
}


@end
