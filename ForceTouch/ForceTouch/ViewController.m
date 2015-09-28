//
//  ViewController.m
//  ForceTouch
//
//  Created by Charlie on 15/9/27.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)buttonPress:(id)sender;
@property (nonatomic, nonatomic) IBOutlet UITableView *addressTableView;
@property (nonatomic, retain) NSDictionary *addressNameDictionary;
@property (nonatomic, retain) NSArray *addressKeyArray;
@property (nonatomic, retain) NSMutableArray *filterNames;

@end

@implementation ViewController
UISearchDisplayController *searchController;
static NSString *identifier = @"myCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.addressNameDictionary = @{@"A":@[@"abc", @"abcd", @"abc", @"abcd", @"abc", @"abcd", @"abc", @"abcd", @"abc", @"abcd", @"abc", @"abcd"], @"Z":@[@"zzz"], @"B":@[@"bcd", @"bcde"]};
    
    self.addressKeyArray = [[self.addressNameDictionary allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    self.filterNames = [NSMutableArray array];
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    CGRect rect = CGRectMake(40, 40, 300, 420);
    self.addressTableView = [[UITableView alloc] initWithFrame:rect];
    self.addressTableView.tag = 1;
    
    
    self.addressTableView.tableHeaderView = searchBar;
    
    searchController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchController.delegate = self;
    searchController.searchResultsDataSource = self;
    
    
    
    [self.addressTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    self.addressTableView.delegate = self;
    self.addressTableView.dataSource = self;

    [self registerForPreviewingWithDelegate:self sourceView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPress:(id)sender {
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    UIViewController *viewCtrl = [[UIViewController alloc] init];
    viewCtrl.preferredContentSize = CGSizeMake(0, 400);
    
    CGRect rect = CGRectMake(10, 10, self.view.frame.size.width - 20, 500);
    previewingContext.sourceRect = rect;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    button.titleLabel.text = @"peek";
    [previewingContext.sourceView addSubview:button];
    
    [self showViewController:viewControllerToCommit sender:self];
}

- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    NSLog(@"x = %f, y = %f", location.x, location.y);
//    CGRect rect = CGRectMake(10, location.y - 10, self.view.frame.size.width - 20, 500);
//    previewingContext.sourceRect = rect;
    
    UIViewController *viewCtrl = [[UIViewController alloc] init];
    viewCtrl.preferredContentSize = CGSizeMake(0, 400);
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
//    [button setTitle:@"点我" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [viewCtrl.view addSubview:button];
    [viewCtrl.view addSubview:self.addressTableView];
    
    
    return viewCtrl;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView.tag == 1) {
        return [self.addressNameDictionary.allKeys count];
    }
    else
    {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 1) {
        NSString *key = [self.addressNameDictionary.allKeys objectAtIndex:section];
        return [[self.addressNameDictionary objectForKey:key] count];
    }
    else
    {
        return [self.filterNames count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (tableView.tag == 1) {
        return [self.addressKeyArray objectAtIndex:section];
    }
    else
    {
        return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (tableView.tag == 1) {
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
    if (tableView.tag == 1) {
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

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self.filterNames removeAllObjects];
    if (searchString.length > 0) {
        NSPredicate *pre = [NSPredicate predicateWithBlock:^BOOL(NSString *name, NSDictionary *bindings) {
            NSRange range = [name rangeOfString:searchString options:NSCaseInsensitiveSearch];
            return range.location != NSNotFound;
        }];
        for (NSString *key in self.addressKeyArray) {
            NSArray *array = [self.addressNameDictionary[key] filteredArrayUsingPredicate:pre];
            [self.filterNames addObjectsFromArray:array];
        }
    }
    NSLog(@"%@", self.filterNames);
    return YES;
}
@end
