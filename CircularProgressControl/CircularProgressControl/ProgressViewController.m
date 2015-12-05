//
//  ProgressViewController.m
//  CircularProgressControl
//
//  Created by Carlos Eduardo Arantes Ferreira on 22/11/14.
//  Copyright (c) 2014 Mobistart. All rights reserved.
//

#import "ProgressViewController.h"
#import "CircleProgressView.h"

@interface ProgressViewController ()

@property (weak, nonatomic) IBOutlet CircleProgressView *xxx;

@end

@implementation ProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.xxx.circleEndPercent = 0.5;
    [self.xxx setTitle:@"进度" percent:@"50%"];
    [self.xxx animate];
}

- (void)viewDidDisappear:(BOOL)animated {
}

#pragma mark - User Interaction

- (IBAction)actionButtonClick:(id)sender {
    self.xxx.circleBeginPercent = 0.5;
    self.xxx.circleEndPercent = 1.0;
    [self.xxx setTitle:@"进度" percent:@"100%"];
    [self.xxx animate];
}


@end
