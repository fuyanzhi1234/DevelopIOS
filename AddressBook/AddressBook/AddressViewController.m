//
//  AddressViewController.m
//  AddressBook
//
//  Created by Charlie on 15/9/16.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "AddressViewController.h"

@interface AddressViewController ()
@property (weak, nonatomic) IBOutlet UITableView *addressTableView;
@property (nonatomic, retain) NSDictionary *addressNameDictionary;
@property (nonatomic, retain) NSArray *addressKeyArray;
@property (nonatomic, retain) NSMutableArray *filterNames;
@end

@implementation AddressViewController

static NSString *identifier = @"myCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.addressNameDictionary = @{@"A":@[@"abc", @"abcd", @"abc", @"abcd", @"abc", @"abcd", @"abc", @"abcd", @"abc", @"abcd", @"abc", @"abcd"], @"Z":@[@"zzz"], @"B":@[@"bcd", @"bcde"]};
    
    self.addressKeyArray = [[self.addressNameDictionary allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    self.filterNames = [NSMutableArray array];
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    self.addressTableView.tableHeaderView = searchBar;
    
    UISearchDisplayController *searchController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchController.delegate = self;
    searchController.searchResultsDataSource = self;
    
    
    
    [self.addressTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    self.addressTableView.delegate = self;
    self.addressTableView.dataSource = self;
    
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.addressTableView.tag == 1) {
        return [self.addressNameDictionary.allKeys count];
    }
    else
    {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.addressTableView.tag == 1) {
        NSString *key = [self.addressNameDictionary.allKeys objectAtIndex:section];
        return [[self.addressNameDictionary objectForKey:key] count];
    }
    else
    {
        return [self.filterNames count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (self.addressTableView.tag == 1) {
        return [self.addressKeyArray objectAtIndex:section];
    }
    else
    {
        return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (self.addressTableView.tag == 1) {
        NSString *key = [self.addressNameDictionary.allKeys objectAtIndex:indexPath.section];
        NSArray *array = [self.addressNameDictionary objectForKey:key];
        cell.textLabel.text = [array objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [self.filterNames objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    if (self.addressTableView.tag == 1) {
        return self.addressKeyArray;
    }
    else
    {
        return nil;
    }
}

- (void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
}

- (bool) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    if (searchString.length > 0) {
        NSPredicate *pre = [NSPredicate predicateWithBlock:^BOOL(NSString *name, NSDictionary *bindings) {
            NSRange range = [name rangeOfString:searchString];
            return range.location != NSNotFound;
        }];
        for (NSString *key in self.addressKeyArray) {
            NSArray *array = [self.addressNameDictionary[key] filteredArrayUsingPredicate:pre];
            [self.filterNames addObjectsFromArray:array];
        }
    }
    return YES;
}
@end























