//
//  WeatherDetailTableViewCell.m
//  TestAFNetworking
//
//  Created by Charlie on 16/2/29.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import "WeatherDetailTableViewCell.h"

@implementation WeatherDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.suggestion.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
