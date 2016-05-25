//
//  MainViewController.m
//  TestAFNetworking
//
//  Created by Charlie on 16/2/3.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import "MainViewController.h"
#import "WeatherDetailTableViewCell.h"
#import "WeatherDataReformer.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITableView *yesterdayTableView;
@property (weak, nonatomic) IBOutlet UITableView *todayTableView;
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UITableView *tommorowTabelView;
@property (weak, nonatomic) IBOutlet UITableView *thirdTableView;
@property (weak, nonatomic) IBOutlet UITableView *forthTableView;
@property (weak, nonatomic) IBOutlet UITableView *fifthTableView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation MainViewController

static NSString *const kTableCellIdentify = @"onlyone";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self.yesterdayTableView registerNib:[UINib nibWithNibName:@"WeatherDetailTableViewCell" bundle:nil] forCellReuseIdentifier:kTableCellIdentify];
    [self.todayTableView registerNib:[UINib nibWithNibName:@"WeatherDetailTableViewCell" bundle:nil] forCellReuseIdentifier:kTableCellIdentify];
    [self.tommorowTabelView registerNib:[UINib nibWithNibName:@"WeatherDetailTableViewCell" bundle:nil] forCellReuseIdentifier:kTableCellIdentify];
    [self.thirdTableView registerNib:[UINib nibWithNibName:@"WeatherDetailTableViewCell" bundle:nil] forCellReuseIdentifier:kTableCellIdentify];
    [self.forthTableView registerNib:[UINib nibWithNibName:@"WeatherDetailTableViewCell" bundle:nil] forCellReuseIdentifier:kTableCellIdentify];
    [self.fifthTableView registerNib:[UINib nibWithNibName:@"WeatherDetailTableViewCell" bundle:nil] forCellReuseIdentifier:kTableCellIdentify];
    
    [NetWeatherManager sharedInstance].weatherInfoDelegate = self;
    [self refreshData];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    [self.todayTableView addSubview:self.refreshControl];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.mainScrollView scrollRectToVisible:self.todayTableView.frame animated:NO];
}

#pragma mark - public
- (void)refreshData {
    [self.mainScrollView scrollRectToVisible:self.todayTableView.frame animated:NO];
    [[NetWeatherManager sharedInstance] getWeatherInfo];
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
    WeatherDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableCellIdentify forIndexPath:indexPath];
    // 除今天的页面，其它页面突出显示温度
    if (tableView != self.todayTableView) {
        [cell enlargeTempRangeSize];
    }
    
    // 设置不可选择
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
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
    [self showForecast:todayCell weatherInfo:weatherInfo day:TODAY];
    todayCell.curTemprature.text = [weatherInfo.curTemprature stringByAppendingString:@"℃"];
    todayCell.airQuality.text = [[WeatherDataReformer sharedInstance] reformAirQuality:[weatherInfo.airQuality intValue]];
    todayCell.suggestion.text = weatherInfo.suggestion;

    // 昨天天气
    WeatherDetailTableViewCell *yesterdayCell = (WeatherDetailTableViewCell *)[self.yesterdayTableView cellForRowAtIndexPath:indexPath];
    [self showForecast:yesterdayCell weatherInfo:weatherInfo day:YESTERDAY];
    
    // 明天天气
    WeatherDetailTableViewCell *tommorowCell = (WeatherDetailTableViewCell *)[self.tommorowTabelView cellForRowAtIndexPath:indexPath];
    [self showForecast:tommorowCell weatherInfo:weatherInfo day:TOMMORROW];
    
    // 第三天天气
    WeatherDetailTableViewCell *thirdCell = (WeatherDetailTableViewCell *)[self.thirdTableView cellForRowAtIndexPath:indexPath];
    [self showForecast:thirdCell weatherInfo:weatherInfo day:THIRDDAY];
    
    // 第四天天气
    WeatherDetailTableViewCell *forthCell = (WeatherDetailTableViewCell *)[self.forthTableView cellForRowAtIndexPath:indexPath];
    [self showForecast:forthCell weatherInfo:weatherInfo day:FORTHDAY];
    
    // 第五天天气
    WeatherDetailTableViewCell *fifthCell = (WeatherDetailTableViewCell *)[self.fifthTableView cellForRowAtIndexPath:indexPath];
    [self showForecast:fifthCell weatherInfo:weatherInfo day:FIFTHDAY];
    
    // 结束刷新动作
    [self.refreshControl endRefreshing];
}

// 网络异常
- (void)loadError:(NSError *)error {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"网络错误" message:error.localizedDescription delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
    // 结束刷新动作
    [self.refreshControl endRefreshing];
}

- (void)showForecast:(WeatherDetailTableViewCell *)curCell weatherInfo:(WeatherInfo *)weatherInfo day:(ForecastDay)day {
    if (weatherInfo) {
        curCell.city.text = weatherInfo.city;
        // 获得每天的天气详情
        WeatherForecastDetail *detail = [weatherInfo getForecastDetailByIndex:day];
        curCell.city.text = weatherInfo.city;
        curCell.curTemprature.text = @"";
        curCell.airQuality.text = @"";
        curCell.suggestion.text = @"";
        
        // 单独设置日期
        NSString *datePre = @"";
        if (day == YESTERDAY) {
            datePre = @"昨天 ";
        }
        else if (day == TODAY) {
            datePre = @"今天 ";
        }
        else if (day == TOMMORROW){
            datePre = @"明天 ";
        }
        else {
            datePre = @"";
        }
        curCell.date.text = [datePre stringByAppendingFormat:@"%@", detail.date];
        curCell.weatherType.text = detail.weatherType;
        curCell.tempRange.text = [[WeatherDataReformer sharedInstance] reformTempratureRange:detail.lowestTemprature highestTemprature:detail.highestTemprature];
        curCell.windPower.text = [[WeatherDataReformer sharedInstance] reformWindPower:detail.windPower windDirection:detail.windDirection];
    }
}

@end
