//
//  ViewController.m
//  Orientations
//
//  Created by yuMac on 15/8/31.
//  Copyright (c) 2015年 yuMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *potrait;
@property (strong, nonatomic) IBOutlet UIView *landscape;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    NSLog(@"potrait：%@", self.potrait);
    NSLog(@"landscape：%@", self.landscape);
    self.view = self.landscape;
}

@end
