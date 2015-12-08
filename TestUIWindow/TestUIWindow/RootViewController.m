//
//  RootViewController.m
//  TestUIWindow
//
//  Created by Charlie on 15/12/8.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"


@interface RootViewController () <ResignDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIButton *btn;
@property (strong, nonatomic) UIButton *hidebtn;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor blueColor]];
    
    [self.btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.hidebtn addTarget:self action:@selector(clickHide) forControlEvents:UIControlEventTouchUpInside];
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

- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        FirstViewController *first = [[FirstViewController alloc] init];
        first.delegate = self;
        _window.rootViewController = first;
    }
    return _window;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeSystem];
        _btn.frame = CGRectMake(0, 0, 100, 100);
        [_btn setTitle:@"show" forState:UIControlStateNormal];
        [self.view addSubview:_btn];
    }
    return _btn;
}

- (UIButton *)hidebtn {
    if (!_hidebtn) {
        _hidebtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _hidebtn.frame = CGRectMake(100, 0, 100, 100);
        [_hidebtn setTitle:@"hide" forState:UIControlStateNormal];
        [self.view addSubview:_hidebtn];
    }
    return _hidebtn;
}


- (void)click {
    [self.window makeKeyAndVisible];
}

- (void)clickHide {
    self.window = nil;
}


- (void)resignFirstView {
    [self.window setHidden:YES];
    self.window = nil;
}

@end
