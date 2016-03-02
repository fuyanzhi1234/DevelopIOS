//
//  MainViewController.m
//  TestAFNetworking
//
//  Created by Charlie on 16/2/3.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import "MainViewController.h"
#import "WeatherDetailTableViewCell.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITableView *yesterdayTableView;
@property (weak, nonatomic) IBOutlet UITableView *todayTableView;
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;

@end

@implementation MainViewController

static NSString *const kTableCellIdentify = @"onlyone";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self.yesterdayTableView registerNib:[UINib nibWithNibName:@"WeatherDetailTableViewCell" bundle:nil] forCellReuseIdentifier:kTableCellIdentify];
    [self.todayTableView registerNib:[UINib nibWithNibName:@"WeatherDetailTableViewCell" bundle:nil] forCellReuseIdentifier:kTableCellIdentify];
    
    [NetWeatherManager sharedInstance].weatherInfoDelegate = self;
    [[NetWeatherManager sharedInstance] getWeatherInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.mainScrollView scrollRectToVisible:self.todayTableView.frame animated:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableCellIdentify forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    [cell.textLabel setText:@"xxx"];
    // Configure the cell...
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UIScreen mainScreen].bounds.size.height;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
//    ChatDialogTableViewController *detailViewController = [[ChatDialogTableViewController alloc] init];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
//    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - WeatherInfoDelegate

- (void)finishGetWeatherInfo:(WeatherInfo *)weatherInfo {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    // 今天天气
    WeatherDetailTableViewCell *todayCell = (WeatherDetailTableViewCell *)[self.todayTableView cellForRowAtIndexPath:indexPath];
    WeatherForecastDetail *todayDetail = [weatherInfo getForecastDetailByIndex:TODAY];
    todayCell.city.text = weatherInfo.city;
    todayCell.curTemprature.text = weatherInfo.curTemprature;
    todayCell.suggestion.text = weatherInfo.suggestion;
    todayCell.date.text = @"今天";
    [self showForecast:todayCell weatherDorecastDetail:todayDetail];
    
    // 昨天天气
    WeatherDetailTableViewCell *yesterdayCell = (WeatherDetailTableViewCell *)[self.yesterdayTableView cellForRowAtIndexPath:indexPath];
    WeatherForecastDetail *yesterdayDetail = [weatherInfo getForecastDetailByIndex:YESTERDAY];
    yesterdayCell.city.text = weatherInfo.city;
    yesterdayCell.curTemprature.text = @"";
    yesterdayCell.suggestion.text = @"";
    yesterdayCell.date.text = @"昨天";
    [self showForecast:yesterdayCell weatherDorecastDetail:yesterdayDetail];
}

- (void)showForecast:(WeatherDetailTableViewCell *)curCell weatherDorecastDetail:(WeatherForecastDetail *)detail{
    if (detail) {
        curCell.weatherType.text = detail.weatherType;
        NSString *tempRange = @"";
        tempRange = [tempRange stringByAppendingFormat:@"%@~%@", 	detail.lowestTemprature, detail.highestTemprature];
        curCell.tempRange.text = tempRange;
        NSString *windPower = @"";
        windPower = [windPower stringByAppendingFormat:@"%@ %@", detail.windPower, detail.windDirection];
        curCell.windPower.text = windPower;
    }

}

@end
