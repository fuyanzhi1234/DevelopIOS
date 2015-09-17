//
//  ViewController.m
//  Settings
//
//  Created by yuMac on 15/9/17.
//  Copyright (c) 2015年 yuMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *wrapFactor;
- (IBAction)refresh:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"zhangjiao" forKey:@"username"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    // 加入通知机制，让程序从后台进入激活状态时，调用applicationWillEnterForeground方法
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:app];
}

- (void)viewDidDisappear:(BOOL)animated{
    // 视图消失时，要移除监视，这样可以提升性能
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (IBAction)refresh:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.userName.text = [defaults stringForKey:@"username"];
    self.wrapFactor.text = [[defaults objectForKey:@"wrapFactor"] stringValue];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    // 保存settings中的数据，保证从内存读取时，是最新的数据（感觉没什么作用，因为这个函数会自己调用）
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    
    [self refresh:nil];
}
@end
