//
//  MainViewController.m
//  TestAFNetworking
//
//  Created by Charlie on 16/2/3.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITableView *yesterdayTableView;
@property (weak, nonatomic) IBOutlet UITableView *todayTableView;

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
    
//    [cell.textLabel setText:@"xxx"];
    // Configure the cell...
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UIScreen mainScreen].bounds.size.height;
}


// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
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
    NSLog(@"The city is %@", weatherInfo.city);
}

@end
