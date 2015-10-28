//
//  ContactsTableViewController.m
//  SimWeChat
//
//  Created by Charlie on 15/10/27.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "ContactsTableViewController.h"
#include "ContactsTableViewCell.h"

@interface ContactsTableViewController ()

@property (nonatomic) NSMutableArray *section;

@end

@implementation ContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ContactsTableViewCell" bundle:nil] forCellReuseIdentifier:@"ContactsCell"];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"headerFooterView"];
    
    
    self.section = [@[@"", @"b", @"c", @"d", @"e", @"f", @"g"] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return _section.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    if (section == 0) {
        return 4;
    }
    else {
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactsCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.section == 0) {
        NSString *name = @"";
        NSString *imageName = @"";
        if (indexPath.row == 0) {
            name = @"新的朋友";
            imageName = @"contacts_addfriend";
        }
        else if (indexPath.row == 1) {
            name = @"群聊";
            imageName = @"contact_group";
        }
        else if (indexPath.row == 2) {
            name = @"标签";
            imageName = @"contact_tooltip";
        }
        else if (indexPath.row == 3) {
            name = @"公众号";
            imageName = @"contacts_public";
        }
        [cell setData:name userImage:[UIImage imageNamed:imageName]];
    }
    else {
        NSString *name = [NSString stringWithFormat:@"%@%@", _section[indexPath.section], @"张娇"];
        [cell setData:name userImage:[UIImage imageNamed:@"tabbar_contacts_sel"]];
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 54;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section > 0) {
        return 22;
    }
    else {
        return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    }
    else {
        UITableViewHeaderFooterView *headFooterView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerFooterView"];
        NSString *titleSection = _section[section];
        [headFooterView.textLabel setText:titleSection];
        return headFooterView;
    }
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return _section;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
