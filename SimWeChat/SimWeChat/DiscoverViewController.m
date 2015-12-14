//
//  DiscoverViewController.m
//  SimWeChat
//
//  Created by Charlie on 15/10/7.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "DiscoverViewController.h"
#include "SettingTableView.h"

@interface DiscoverViewController () <SettingTableViewDelegate>
@property (weak, nonatomic) IBOutlet SettingTableView *settingsTableView;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.settingsTableView.settingDelegate = self;
    SettingTableRowData *rowData = [self.settingsTableView.data rowDataWithTitle:@"朋友圈"];
    rowData.detailImageName = @"contact_tooltip";
    rowData.detail = @"这是啥";
    rowData.hasUnreadMsg = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - SettingTableViewDelegate
- (void)settingTableView:(SettingTableView *)tableView buttonTappedForTitle:(NSString *)title {
    SettingTableRowData *rowData = [self.settingsTableView.data rowDataWithTitle:@"朋友圈"];
    rowData.hasUnreadMsg = YES;
    [self.settingsTableView reloadData];
}

@end
