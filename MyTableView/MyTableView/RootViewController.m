//
//  RootViewController.m
//  MyTableView
//
//  Created by Charlie on 15/9/13.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@property (nonatomic, retain) NSMutableArray *array;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.array = [NSMutableArray arrayWithObjects:@"x1", @"x2", @"x3", @"x4", @"x5", @"x6", @"x7", @"x8", @"x9", @"x10", nil];
    CGRect rect = CGRectMake(0, 40, 300, 420);
    UITableView *tableView = [[UITableView alloc] initWithFrame:rect];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorColor = [UIColor clearColor];
    [tableView setEditing:YES];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:10 inSection:0];
//    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.array count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *curCell = [tableView cellForRowAtIndexPath:indexPath];
    if (curCell.accessoryType == UITableViewCellAccessoryCheckmark) {
        curCell.accessoryType = UITableViewCellAccessoryDetailButton;
    }
    else{
        curCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cellIdentifier";
    NSString *title = [self.array objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];

        cell.textLabel.text = [NSString stringWithFormat:@"title : %@", title];
        cell.detailTextLabel.text = @"Detail Information here";
        UIImage *image1 = [UIImage imageNamed:@"01.gif"];
        UIImage *image2 = [UIImage imageNamed:@"02.gif"];
        
        cell.imageView.image = image1;
        cell.imageView.highlightedImage = image2;
        
        if (indexPath.row == 1) {
            cell.backgroundColor = [UIColor purpleColor];
        }
        else{
            CGRect rect = CGRectMake(0, 0, 0, 0);
            UIView *view = [[UIView alloc] initWithFrame:rect];
            [view setBackgroundColor:[UIColor brownColor]];
            [cell setBackgroundView:view];
        }
    }
    cell.textLabel.text = [NSString stringWithFormat:@"title : %@", title];
    NSLog(@"%@", indexPath.description);
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
//    [tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
    id srcObject = [self.array objectAtIndex:sourceIndexPath.row];
    [self.array removeObjectAtIndex:sourceIndexPath.row];
    [self.array insertObject:srcObject atIndex:destinationIndexPath.row];
    
    NSString *str;
    for (str in self.array) {
        NSLog(@"%@", str);
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        //  删除一行
//        NSArray *array = [NSArray arrayWithObjects:indexPath, nil];
//        [self.array removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationAutomatic];
        // 新增一行
        [self.array insertObject:@"xxx" atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:YES];
    }
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
