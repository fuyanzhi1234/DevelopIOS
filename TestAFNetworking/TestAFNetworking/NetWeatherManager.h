//
//  NetWeatherManager.h
//  TestAFNetworking
//
//  Created by Charlie on 16/2/29.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherInfo.h"

@protocol WeatherInfoDelegate <NSObject>

@required
// 天气信息获取完成
- (void)finishGetWeatherInfo:(WeatherInfo *)weatherInfo;

// 网络异常
- (void)loadError:(NSError *)error;

@end

@interface NetWeatherManager : NSObject
@property (weak, nonatomic) id<WeatherInfoDelegate> weatherInfoDelegate;

+ (instancetype)sharedInstance;
// 获取天气信息
- (void)getWeatherInfo;

@end
