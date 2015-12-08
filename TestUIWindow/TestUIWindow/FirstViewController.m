//
//  FirstViewController.m
//  TestUIWindow
//
//  Created by Charlie on 15/12/8.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
- (IBAction)hideFirstView:(id)sender;


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)hideFirstView:(id)sender {
    [self.delegate resignFirstView];
}

@end
