//
//  ContactsSearchTableViewController.h
//  SimWeChat
//
//  Created by Charlie on 15/11/4.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactsSearchTableViewController : UITableViewController <UISearchResultsUpdating>
@property (nonatomic) NSMutableArray *friendList;

@end
