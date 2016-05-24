//
//  ViewController.m
//  TestAFNetworking
//
//  Created by Charlie on 16/1/30.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *curTemprature;
@property (weak, nonatomic) IBOutlet UILabel *weatherType;
@property (weak, nonatomic) IBOutlet UILabel *windDirection;
@property (weak, nonatomic) IBOutlet UILabel *windPower;
@property (weak, nonatomic) IBOutlet UILabel *highestTemprature;
@property (weak, nonatomic) IBOutlet UILabel *lowestTemprature;
@property (weak, nonatomic) IBOutlet UILabel *suggestion;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 检测网络状态
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"AFNetworkReachabilityStatus, status = %ld", status);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma action

- (IBAction)sendHttp:(id)sender {
    
//    NSURL *url = [NSURL URLWithString:@"https://alpha-api.app.net/stream/0/posts/stream/global"];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
//    // 设置请求格式
////    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    // 设置返回格式
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript" , @"text/plain" , nil];
//
//    [manager GET:@"http://wthrcdn.etouch.cn/weather_mini?citykey=101190101" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
//        [self parseWeatherJson:responseObject];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error:%@", error.description);
//        NSLog(@"AFJSONRequestSerializer Post Error");
//    }];
}

#pragma private

- (void)parseWeatherJson:(NSDictionary *)dic {
    NSDictionary *dataWeather = (NSDictionary *)dic[@"data"];
    NSDictionary *forecastDetail = (NSDictionary *)dataWeather[@"forecast"][0];
    NSString *str = dataWeather[@"wendu"];
    self.curTemprature.text = dataWeather[@"wendu"];
    self.suggestion.text = dataWeather[@"ganmao"];
    self.suggestion.numberOfLines = 0;
    self.city.text = dataWeather[@"city"];
    
    self.windDirection.text = forecastDetail[@"fengxiang"];
    self.windPower.text = forecastDetail[@"fengli"];
    self.highestTemprature.text = forecastDetail[@"high"];
    self.lowestTemprature.text = forecastDetail[@"low"];
    self.weatherType.text = forecastDetail[@"type"];
    self.windDirection.text = forecastDetail[@"fengxiang"];

}

@end
