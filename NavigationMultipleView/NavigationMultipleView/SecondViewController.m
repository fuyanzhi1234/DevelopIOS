//
//  SecondViewController.m
//  NavigationMultipleView
//
//  Created by yuMac on 15/9/10.
//  Copyright (c) 2015年 yuMac. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
- (IBAction)hideNavigationBar:(id)sender;
- (IBAction)hideToolBar:(id)sender;

@end

@implementation SecondViewController

static int indexController = 1;

- (void)viewDidLoad {
    [super viewDidLoad];
    indexController ++;
    // Do any additional setup after loading the view from its nib.
    NSString *title = [NSString stringWithFormat:@"%d", indexController];
    self.title = title;
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

- (IBAction)hideNavigationBar:(id)sender {
    SecondViewController *controller = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
//    [self.navigationController setNavigationBarHidden:YES];
}

- (IBAction)hideToolBar:(id)sender {
//    [self.navigationController popViewControllerAnimated:YES];
//    SecondViewController *second = [[self.navigationController viewControllers] objectAtIndex:2];
//    [self.navigationController popToViewController:second animated:YES];
    [self.navigationController popToRootViewControllerAnimated:NO];
}
@end
