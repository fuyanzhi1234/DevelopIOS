//
//  WeatherInfo.h
//  TestAFNetworking
//
//  Created by Charlie on 16/3/1.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherInfo : NSObject

@property (copy, nonatomic) NSString *city;
@property (copy, nonatomic) NSString *curTemprature;
@property (copy, nonatomic) NSString *weatherType;
@property (copy, nonatomic) NSString *windDirection;
@property (copy, nonatomic) NSString *windPower;
@property (copy, nonatomic) NSString *highestTemprature;
@property (copy, nonatomic) NSString *lowestTemprature;
@property (copy, nonatomic) NSString *suggestion;

@end
