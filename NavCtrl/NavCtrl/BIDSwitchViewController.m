//
//  BIDSwitchViewController.m
//  NavCtrl
//
//  Created by Charlie on 15/9/9.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "BIDSwitchViewController.h"
#import "BIDYellowViewController.h"
#import "BIDBlueViewController.h"

@interface BIDSwitchViewController ()

@property (strong, nonatomic) BIDYellowViewController *yellowCtrl;
@property (strong, nonatomic) BIDBlueViewController *blueCtrl;
- (IBAction)switchViewAction:(id)sender;

@end

@implementation BIDSwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.yellowCtrl = [[BIDYellowViewController alloc] init];
    self.blueCtrl = [[BIDBlueViewController alloc] init];
    [self.view insertSubview:self.yellowCtrl.view atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)switchViewAction:(id)sender {
//    [self.yellowCtrl.view removeFromSuperview];
////    [self.view addSubview:self.blueCtrl.view];
//    [UIView beginAnimations:@"xx" context:nil];
//    [UIView setAnimationDuration:2];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    if (self.yellowCtrl == nil) {
        self.yellowCtrl = [[BIDYellowViewController alloc] init];
    }
    if (self.blueCtrl.view.superview == nil) {
        [UIView transitionWithView:self.view duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{[self.view insertSubview:self.blueCtrl.view atIndex:1];} completion:nil];
//        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
//        [self.view insertSubview:self.blueCtrl.view atIndex:1];
    }
    else{
//        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
        [self.blueCtrl.view removeFromSuperview];
    }
//    [UIView commitAnimations];
}
@end
