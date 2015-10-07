//
//  RootViewController.m
//  SimWeChat
//
//  Created by Charlie on 15/10/7.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "RootViewController.h"
#import "Global.h"
#import "WeChatViewController.h"
#import "ContactsViewController.h"
#import "DiscoverViewController.h"
#import "MeViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UITabBar *rootTabBar;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tabBar setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
    [self.tabBar setTintColor:DEFAULT_GREEN_COLOR];
    
    WeChatViewController *weChat = [[WeChatViewController alloc] init];
    weChat.tabBarItem.title = @"消息";
    weChat.tabBarItem.image = [UIImage imageNamed:@"tabbar_wechat"];
    weChat.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_wechat_sel"];
    [self addChildViewController:weChat];
    
    ContactsViewController *contacts = [[ContactsViewController alloc] init];
    contacts.tabBarItem.title = @"联系人";
    contacts.tabBarItem.image = [UIImage imageNamed:@"tabbar_contacts"];
    contacts.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_contacts_sel"];
    [self addChildViewController:contacts];
    
    DiscoverViewController *discover = [[DiscoverViewController alloc] init];
    discover.tabBarItem.title = @"发现";
    discover.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
    discover.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_discover_sel"];
    [self addChildViewController:discover];
    
    MeViewController *me = [[MeViewController alloc] init];
    me.tabBarItem.title = @"我";
    me.tabBarItem.image = [UIImage imageNamed:@"tabbar_me"];
    me.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_me_sel"];
    [self addChildViewController:me];
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

@end
