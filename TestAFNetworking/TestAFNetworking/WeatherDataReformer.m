//
//  WeatherDataReformer.m
//  TestAFNetworking
//
//  Created by Charlie on 16/3/5.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import "WeatherDataReformer.h"

@implementation WeatherDataReformer

+ (instancetype)sharedInstance {
    static WeatherDataReformer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WeatherDataReformer alloc] init];
    });
    return sharedInstance;
}

- (NSString *)reformCurTemprature:(NSString *)curTemprature {
    return [curTemprature stringByAppendingString:@"℃"];
}

- (NSString *)reformAirQuality:(int)airQuality {
    NSString *airLevel = @"";
    if (airQuality < 0) {
        airLevel = @"Data Error";
    }
    else if (airQuality <= 50) {
        airLevel = @"优";
    }
    else if (airQuality <= 100) {
        airLevel = @"良";
    }
    else if (airQuality <= 150) {
        airLevel = @"轻度污染";
    }
    else if (airQuality <= 200) {
        airLevel = @"中度污染";
    }
    else if (airQuality <= 300) {
        airLevel = @"重度污染";
    }
    else {
        airLevel = @"严重污染";
    }
    return [NSString stringWithFormat:@"%@ %@", @"空气质量 ", airLevel];
}

- (NSString *)reformTempratureRange:(NSString *)lowestTemprature highestTemprature:(NSString *)highestTemprature {
    return [NSString stringWithFormat:@"%@~%@", lowestTemprature, highestTemprature];
}

- (NSString *)reformWindPower:(NSString *)windPower windDirection:(NSString *)windDirection {
    return [NSString stringWithFormat:@"%@ %@", windPower, windDirection];
}

@end
