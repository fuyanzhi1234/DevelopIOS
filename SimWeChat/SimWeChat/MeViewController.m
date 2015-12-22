//
//  MeViewController.m
//  SimWeChat
//
//  Created by Charlie on 15/10/7.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "MeViewController.h"
#import "SettingTableView.h"
#import "CustomTableViewCell.h"

@interface MeViewController () <SettingTableViewDelegate>
@property (weak, nonatomic) IBOutlet SettingTableView *tableView;

@end

static NSString * const CustomCell = @"CustomTableViewCell";

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.settingDelegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:CustomCell];

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

- (UITableViewCell *)settingTableView:(SettingTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (section == 0 && row == 0) {
        CustomTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:CustomCell];
        customCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        customCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return customCell;
    }
    return nil;
}

- (CGFloat)settingTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (section == 0 && row == 0) {
        return 90;
    }
    return -1;
}

@end
