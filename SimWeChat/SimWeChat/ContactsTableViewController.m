//
//  ContactsTableViewController.m
//  SimWeChat
//
//  Created by Charlie on 15/10/27.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "ContactsTableViewController.h"
#include "ContactsTableViewCell.h"
#include "ContactsSearchTableViewController.h"
#include "ContactsModel.h"

@interface ContactsTableViewController () <UISearchBarDelegate>

@property (nonatomic) NSMutableArray *section;
@property (nonatomic) UISearchController *searchController;
@property (nonatomic) ContactsSearchTableViewController *searchResultView;

@end

@implementation ContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"通讯录";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ContactsTableViewCell" bundle:nil] forCellReuseIdentifier:@"ContactsCell"];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"headerFooterView"];
    
    [self initData];
    [self initSubView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData {
    ContactsModel *contactsModel = [ContactsModel sharedContactsModel];
    [contactsModel addContact:@"啊，我的神" section:@"A" headImage:[UIImage imageNamed:@"tabbar_contacts_sel"]];
    [contactsModel addContact:@"亲爱的" section:@"Q" headImage:[UIImage imageNamed:@"tabbar_contacts_sel"]];
    [contactsModel addContact:@"我要" section:@"W" headImage:[UIImage imageNamed:@"tabbar_contacts_sel"]];
    [contactsModel addContact:@"我想" section:@"W" headImage:[UIImage imageNamed:@"tabbar_contacts_sel"]];
    [contactsModel addContact:@"我爱" section:@"W" headImage:[UIImage imageNamed:@"tabbar_contacts_sel"]];
    [contactsModel addContact:@"张娇" section:@"Z" headImage:[UIImage imageNamed:@"tabbar_contacts_sel"]];
    
    _section = [[NSMutableArray alloc] init];
    [_section addObject:UITableViewIndexSearch];
    [_section addObjectsFromArray:[[ContactsModel sharedContactsModel] getSections]];
}

- (void)initSubView {
    // addfriend
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tabbar_wechat"] style:UIBarButtonItemStylePlain target:self action:@selector(showAddFriend)];
    [self.navigationItem setRightBarButtonItem:rightItem];
    
    // searchbar
    _searchResultView = [[ContactsSearchTableViewController alloc] init];
    _searchController = [[UISearchController alloc] initWithSearchResultsController:_searchResultView];
    [_searchController.searchBar sizeToFit];
    [_searchController.searchBar setDelegate:self];
    [_searchController setSearchResultsUpdater:_searchResultView];
    [self.tableView setTableHeaderView:_searchController.searchBar];
    
    // footview
    CGSize sizeScreen = [[UIScreen mainScreen] bounds].size;
    UILabel *footLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, sizeScreen.width, 49)];
    NSString *footText = [NSString stringWithFormat:@"%lu位联系人", (unsigned long)(_section.count - 1) * 3];
    [footLabel setTextColor:[UIColor grayColor]];
    [footLabel setTextAlignment:NSTextAlignmentCenter];
    [footLabel setText:footText];
    [self.tableView setTableFooterView:footLabel];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _section.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    }
    else {
        NSString *sectionName = _section[section];
        return [[ContactsModel sharedContactsModel] getContactsCountBySection:sectionName];
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
        ContactData *data = [[ContactsModel sharedContactsModel] getContactDataBySection:_section[indexPath.section] andIndex:(indexPath.row)];
        [cell setData:data.name userImage:data.imageHead];
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

- (NSInteger) tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    if (index == 0) {
        [self.tableView scrollRectToVisible:_searchController.searchBar.frame animated:YES];
//        [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{[self.tableView scrollRectToVisible:_searchController.searchBar.frame animated:NO];} completion:NULL];
        return -1;
    }
    else {
        return index;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canE		ditRowAtIndexPath:(NSIndexPath *)indexPath {
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

#pragma mark searchbar delegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
//    _searchResultView.friendList = nil;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [self.tabBarController.tabBar setHidden:YES];
    NSLog(@"searchBarTextDidBeginEditing");
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"searchBarCancelButtonClicked");
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [self.tabBarController.tabBar setHidden:NO];
    NSLog(@"searchBarTextDidEndEditing");
}

#pragma mark -selector
// addFriend
- (void)showAddFriend {
    UIViewController *viewController = [[UIViewController alloc] init];
    [viewController.view setBackgroundColor:[UIColor whiteColor]];
    // 在被push的页面中使用，可以自动隐藏和显示tabBar
    [viewController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
