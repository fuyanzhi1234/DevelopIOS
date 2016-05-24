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
    TOMMORROW,
    THIRDDAY,
    FORTHDAY,
    FIFTHDAY
}ForecastDay;

// 当天天气情况
/**
 *  城市
 */
@property (copy, nonatomic) NSString *city;
/**
 *  当前温度
 */
@property (copy, nonatomic) NSString *curTemprature;
/**
 *  穿衣建议
 */
@property (copy, nonatomic) NSString *suggestion;
/**
 *  空气质量
 */
@property (copy, nonatomic) NSString *airQuality;
/**
 *  天气预测详情
 */
@property (strong, nonatomic) NSMutableArray *forecastDetailArray;

/**
 *  添加天气预报
 *
 *  @param detail 天气预测详情
 */
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
