//
//  WeatherInfo.m
//  TestAFNetworking
//
//  Created by Charlie on 16/3/1.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import "WeatherInfo.h"

@implementation WeatherInfo

#pragma mark - Getter
- (NSMutableArray *)forecastDetailArray {
    if (_forecastDetailArray == nil) {
        _forecastDetailArray = [[NSMutableArray alloc] init];
    }
    return _forecastDetailArray;
}

#pragma mark - Public

// 添加天气预报
- (void)addForecastDetail:(WeatherForecastDetail *)detail {
    [self.forecastDetailArray addObject:detail];
}

/**
 *  查询天气预报
 *
 *  @param index ForecastDay类型
 *
 *  @return 天气详情
 */
- (WeatherForecastDetail *)getForecastDetailByIndex:(ForecastDay)index {
    if (index < [self.forecastDetailArray count])
    {
        return [self.forecastDetailArray objectAtIndex:index];
    }
    return nil;
}


@end
