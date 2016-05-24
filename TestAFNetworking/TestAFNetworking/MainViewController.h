//
//  MainViewController.h
//  TestAFNetworking
//
//  Created by Charlie on 16/2/3.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetWeatherManager.h"

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, WeatherInfoDelegate>

// 刷新天气数据
- (void)refreshData;

@end
