//
//  NetWeatherManager.m
//  TestAFNetworking
//
//  Created by Charlie on 16/2/29.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import "NetWeatherManager.h"
#import "AFNetworking.h"


@implementation NetWeatherManager

static NSString *kWeatherUrl = @"http://wthrcdn.etouch.cn/weather_mini?citykey=101190101";

+ (instancetype)sharedInstance {
    static NetWeatherManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NetWeatherManager alloc] init];
    });
    return sharedInstance;
}

- (void)getWeatherInfo {
    NSURL *url = [NSURL URLWithString:@"https://alpha-api.app.net/stream/0/posts/stream/global"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // 设置请求格式
    //    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript" , @"text/plain" , nil];
    
    [manager GET:kWeatherUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        [self parseWeatherJson:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error:%@", error.description);
        NSLog(@"AFJSONRequestSerializer Post Error");
    }];
}

#pragma private

- (void)parseWeatherJson:(NSDictionary *)dic {
    WeatherInfo *weatherInfo = [[WeatherInfo alloc] init];
    
    // 当前信息
    NSDictionary *dataWeather = (NSDictionary *)dic[@"data"];
    weatherInfo.curTemprature = dataWeather[@"wendu"];
    weatherInfo.suggestion = dataWeather[@"ganmao"];
    weatherInfo.city = dataWeather[@"city"];
    weatherInfo.airQuality = dataWeather[@"aqi"];
    
    // 昨天的天气
    NSDictionary *forecastYesterdayDetail = (NSDictionary *)dataWeather[@"yesterday"];
    [self addForecastDetail:forecastYesterdayDetail to:weatherInfo isYesterday:YES];

    // 预测的信息
    NSArray *forecastDetailArray = dataWeather[@"forecast"];
    for (NSDictionary *forecastDetail in forecastDetailArray) {
        [self addForecastDetail:forecastDetail to:weatherInfo isYesterday:NO];
    }

    [_weatherInfoDelegate finishGetWeatherInfo:weatherInfo];
}

- (void)addForecastDetail:(NSDictionary *)forecastDetail to:(WeatherInfo *)weatherInfo isYesterday:(BOOL)isYesterday{
    WeatherForecastDetail *forecastdetail = [[WeatherForecastDetail alloc] init];
    if (isYesterday) {
        forecastdetail.windDirection = forecastDetail[@"fx"];
        forecastdetail.windPower = forecastDetail[@"fl"];
    }
    else {
        forecastdetail.windDirection = forecastDetail[@"fengxiang"];
        forecastdetail.windPower = forecastDetail[@"fengli"];
    }
    forecastdetail.highestTemprature = forecastDetail[@"high"];
    forecastdetail.lowestTemprature = forecastDetail[@"low"];
    forecastdetail.weatherType = forecastDetail[@"type"];
    forecastdetail.date = forecastDetail[@"date"];
    [weatherInfo addForecastDetail:forecastdetail];
}

@end
