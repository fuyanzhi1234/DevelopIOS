//
//  WeatherDataReformer.h
//  TestAFNetworking
//
//  Created by Charlie on 16/3/5.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherDataReformer : NSObject

+ (instancetype)sharedInstance;

/**
 *  包装当前温度
 *
 *  @param curTemprature 当前温度
 *
 *  @return 当前温度
 */
- (NSString *)reformCurTemprature:(NSString *)curTemprature;

/**
 *  包装空气质量
 *
 *  @param airQuality 空气质量
 *
 *  @return 空气详情
 */
- (NSString *)reformAirQuality:(int)airQuality;

/**
 *  包装温度范围
 *
 *  @param lowestTemprature  最低温度
 *  @param highestTemprature 最高温度
 *
 *  @return 温度范围
 */
- (NSString *)reformTempratureRange:(NSString *)lowestTemprature highestTemprature:(NSString *)highestTemprature;

/**
 *  包装风力风向
 *
 *  @param windPower     风力
 *  @param windDirection 风向
 *
 *  @return 风力风向
 */
- (NSString *)reformWindPower:(NSString *)windPower windDirection:(NSString *)windDirection;

@end
