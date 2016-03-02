//
//  WeatherInfo.h
//  TestAFNetworking
//
//  Created by Charlie on 16/3/1.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherForecastDetail.h"

@interface WeatherInfo : NSObject

typedef enum ForecastDay {
    YESTERDAY = 0,
    TODAY,
    TOMORROW,
    THIRDDAY,
    FORTHDAY,
    FIFTHDAY
}ForecastDay;

// 当天天气情况
@property (copy, nonatomic) NSString *city;
@property (copy, nonatomic) NSString *curTemprature;
@property (copy, nonatomic) NSString *suggestion;

@property (strong, nonatomic) NSMutableArray *forecastDetailArray;

// 添加天气预报
- (void)addForecastDetail:(WeatherForecastDetail *)detail;

/**
 *  查询天气预报
 *
 *  @param index ForecastDay类型
 *
 *  @return 天气详情
 */
- (WeatherForecastDetail *)getForecastDetailByIndex:(ForecastDay)index;

@end
