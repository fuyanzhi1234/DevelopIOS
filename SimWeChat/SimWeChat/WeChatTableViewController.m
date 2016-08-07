//
//  WeChatTableViewController.m
//  SimWeChat
//
//  Created by Charlie on 15/10/11.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "WeChatTableViewController.h"
#import "WeChatTableViewCell.h"
#import "ChatDialogTableViewController.h"
#import "YCXMenu.h"
#import "WeChatData.h"

@interface WeChatTableViewController ()
@property (nonatomic) UIBarButtonItem *rightBtn;
@property (nonatomic) NSMutableArray *weChatData;

@end

@implementation WeChatTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtnItem = self.editButtonItem;
    [self.navigationItem setTitle:@"消息"];
    
    self.rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tabbar_wechat"] style:UIBarButtonItemStylePlain target:self action:@selector(showRightMenu)];
    [self.navigationItem setRightBarButtonItem:self.rightBtn];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"WeChatTableViewCell" bundle:nil] forCellReuseIdentifier:@"WeChatCell"];
    
    // data
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showRightMenu {
    //menu title
//    YCXMenuItem *menuTitle = [YCXMenuItem menuTitle:@"项目" WithIcon:nil];
//    menuTitle.foreColor = [UIColor whiteColor];
//    menuTitle.titleFont = [UIFont boldSystemFontOfSize:20.0f];
    
    // menu item
    YCXMenuItem *groupChat = [YCXMenuItem menuItem:@"发起群聊"
                    image:[UIImage imageNamed:@("tabbar_discover_sel")] tag:100 userInfo:@{@"title":@"wechat"}];
    [groupChat setAlignment:NSTextAlignmentLeft];
    
    YCXMenuItem *addFriend = [YCXMenuItem menuItem:@"添加朋友"
                    image:[UIImage imageNamed:@("tabbar_discover_sel")] tag:102 userInfo:@{@"title":@"wechat"}];
    [addFriend setAlignment:NSTextAlignmentLeft];
    
    YCXMenuItem *oneSwipe = [YCXMenuItem menuItem:@"扫一扫"
                    image:[UIImage imageNamed:@("tabbar_discover_sel")] tag:103 userInfo:@{@"title":@"wechat"}];
    [oneSwipe setAlignment:NSTextAlignmentLeft];
    
    YCXMenuItem *getMoney = [YCXMenuItem menuItem:@"收钱"
                    image:[UIImage imageNamed:@("tabbar_discover_sel")] tag:104 userInfo:@{@"title":@"wechat"}];
    [getMoney setAlignment:NSTextAlignmentLeft];
    
    NSArray *items = @[groupChat,
                       addFriend,
                       oneSwipe,
                       getMoney];
    CGRect barRect = [self.navigationController.navigationBar frame];
    [YCXMenu showMenuInView:self.view.superview
                   fromRect:CGRectMake(self.view.frame.size.width - 50, barRect.origin.y + barRect.size.height, 50, 0)
                  menuItems:items
                   selected:^(NSInteger index, YCXMenuItem *item) {
        NSLog(@"%@",item);
    }];
}

#pragma mark - WeChat Data
- (void)initData {
    _weChatData = [[NSMutableArray alloc] init];
    for (int index = 0; index < 13; index ++) {
        WeChatData *data = [[WeChatData alloc] init];
        data.username = @"张娇";
        data.lastWord = @"你在哪儿？";
        
        NSDate *currentDate = [[NSDate alloc] init];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH:mm:ss"];
        NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
        data.lastTime = currentDateString; 
        [_weChatData addObject:data];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%i", _weChatData.count);
    return 100;
    return [_weChatData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeChatCell" forIndexPath:indexPath];
    
    // Configure the cell...
    WeChatData *data = [_weChatData objectAtIndex:indexPath.row];
    [cell setData:data];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 63;
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
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [_weChatData removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
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
    ChatDialogTableViewController *detailViewController = [[ChatDialogTableViewController alloc] init];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
