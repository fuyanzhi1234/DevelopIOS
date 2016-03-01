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
- (void)finishGetWeatherInfo:(WeatherInfo *)weatherInfo;

@end

@interface NetWeatherManager : NSObject
@property (weak, nonatomic) id<WeatherInfoDelegate> weatherInfoDelegate;

+ (instancetype)sharedInstance;
// 获取天气信息
- (void)getWeatherInfo;

@end
