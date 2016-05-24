//
//  WeatherDetailTableViewCell.h
//  TestAFNetworking
//
//  Created by Charlie on 16/2/29.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *weatherType;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *curTemprature;
@property (weak, nonatomic) IBOutlet UILabel *airQuality;
@property (weak, nonatomic) IBOutlet UILabel *tempRange;
@property (weak, nonatomic) IBOutlet UILabel *windPower;
@property (weak, nonatomic) IBOutlet UILabel *suggestion;

- (void)enlargeTempRangeSize;

@end
