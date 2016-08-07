//
//  ViewController.m
//  TestMagicalRecord
//
//  Created by Charlie on 16/8/6.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import "ViewController.h"
#import "MagicalRecord/MagicalRecord.h"
#import "User.h"
#import "Letter.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTitle;
@property (weak, nonatomic) IBOutlet UITextField *sender;
@property (weak, nonatomic) IBOutlet UITextField *date;
@property (weak, nonatomic) IBOutlet UITextField *content;
- (IBAction)addEmail:(id)sender;
- (IBAction)getEmail:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addEmail:(id)sender {
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext * localContext) {
        Letter *letter = [Letter MR_createEntityInContext:localContext];
        letter.title = self.emailTitle.text;
        letter.time = [self.date.text doubleValue];
        letter.sender = self.sender.text;
        
        User *defaultUser = [User MR_findFirstByAttribute:@"showname" withValue:@"fuyanzhi" inContext:localContext];
        if (defaultUser == nil) {
            defaultUser = [User MR_createEntityInContext:localContext];
            defaultUser.showname = @"fuyanzhi";
            defaultUser.uid = @"1001";
            defaultUser.letter = [[NSSet alloc] init];
        }
        letter.user = defaultUser;
    } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
        NSLog(@"contextDidSave : %d", contextDidSave);
    }];
}

- (IBAction)getEmail:(id)sender {
    User *defaultUser = [User MR_findFirstByAttribute:@"showname" withValue:@"fuyanzhi"];
    NSLog(@"User showname : %@, uid : %@", defaultUser.showname, defaultUser.uid);
    NSLog(@"Letter count : %lu", [defaultUser.letter count]);
    if (defaultUser != nil) {
        for (Letter *letter in defaultUser.letter) {
            NSLog(@"letter : %@", letter.title);
        }
    }
}
@end
