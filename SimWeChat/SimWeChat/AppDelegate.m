//
//  AppDelegate.m
//  SimWeChat
//
//  Created by Charlie on 15/10/7.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import <JSPatch/JSPatch.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [JSPatch testScriptInBundle];
    [JSPatch updateConfigWithAppKey:@"6672e54cb22ec35e"];
//    [JSPatch setupConfigInterval:10];
    [JSPatch setupUpdatedConfigCallback:^(NSDictionary *configs, NSError *error) {
        NSLog(@"%@, %@", configs, error);
        NSDictionary *config = [JSPatch getConfigParams];
        NSLog(@"%@", config);
    }];
    
    
    [JSPatch startWithAppKey:@"6672e54cb22ec35e"];
    [JSPatch sync];
    [JSPatch setupCallback:^(JPCallbackType type, NSDictionary *data, NSError *error) {
        switch (type) {
                // 有更新
            case JPCallbackTypeUpdate: {
                NSLog(@"updated %@ %@", data, error);
                break;
            }
                // 更新完成
            case JPCallbackTypeUpdateDone: {
                NSLog(@"update done %@ %@", data, error);
                break;
            }
                // 运行脚本
            case JPCallbackTypeRunScript: {
                NSLog(@"run script %@ %@", data, error);
                break;
            }
            case JPCallbackTypeUnknow: {
                NSLog(@"unknow %@ %@", data, error);
                break;
            }
            default:
                break;
        }
    }];
    
    // Override point for customization after application launch.
    RootViewController *rootVC = [[RootViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:rootVC];
//    [self.window addSubview:rootVC.view];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
