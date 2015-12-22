//
//  TestViewController.m
//  TestSettingTable
//
//  Created by Chaos on 15/11/12.
//  Copyright © 2015年 Chaos. All rights reserved.
//

#import "TestViewController.h"
#import "SettingTableView.h"
#import "CustomTableViewCell.h"

@interface TestViewController () <SettingTableViewDelegate>
@property (weak, nonatomic) IBOutlet SettingTableView *tableView;

@end

static NSString * const CustomCell = @"CustomTableViewCell";

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.settingDelegate = self;
    self.tableView.cellBackgroundColor = [UIColor greenColor];
    //self.tableView.cellTitleFont = [UIFont systemFontOfSize:20];
    
    SettingTableRowData *rowData = [self.tableView.data rowDataWithTitle:@"HomeSettingModifyPassword"];
    rowData.detail = @"已开启了吗";
    rowData.detailImageName = @"image_head";
    rowData.hasUnreadMsg = YES;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:CustomCell];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)settingTableView:(SettingTableView *)tableView switchChanged:(BOOL)on forTitle:(NSString *)title {
    
}

- (void)settingTableView:(SettingTableView *)tableView buttonTappedForTitle:(NSString *)title {
    
}

- (void)settingTableView:(SettingTableView *)tableView accessoryTappedForTitle:(NSString *)title {
    
}

- (UITableViewCell *)settingTableView:(SettingTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (section == 0 && row == 0) {
        CustomTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:CustomCell];
        customCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        customCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return customCell;
    }
    return nil;
}

- (CGFloat)settingTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (section == 0 && row == 0) {
        return 100;
    }
    return -1;
}

@end
