
//
//  BIDViewController.m
//  CoreDataPersistence
//
//  Created by yuMac on 15/9/24.
//  Copyright © 2015年 yuMac. All rights reserved.
//

#import "BIDViewController.h"
#import "AppDelegate.h"
#import "CoreDataDao.h"
#import "Line.h"

@interface BIDViewController ()
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *lineFields;

@end

@implementation BIDViewController

Line *line = nil;
static NSString * const kLineEntityName = @"Line";
static NSString * const kLineNumberKey = @"lineNumber";
static NSString * const kLineTextKey = @"lineText";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    line = [[Line alloc] init];
    NSArray *lines = [line getAll];
    for (Line *oneLine in lines) {
        NSInteger lineNum = [oneLine.lineNumber integerValue];
        NSString *lineText = oneLine.lineText;
        
        NSLog(@"lineNum:%ld, lineText:%@", (long)lineNum, lineText);
    }
    
    
    NSManagedObjectContext *context = [line managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:kLineEntityName];
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if (objects == nil) {
        NSLog(@"Error occour : %@", error);
    }
    else {
        for (NSManagedObject *oneObject in objects) {
            NSInteger lineNum = [[oneObject valueForKey:kLineNumberKey] integerValue];
            NSString *lineText = [oneObject valueForKey:kLineTextKey];
            UITextField *textField = [self.lineFields objectAtIndex:lineNum];
            if (textField != nil) {
                [textField setText:lineText];
            }
        }
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:[UIApplication sharedApplication]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)applicationWillResignActive:(NSNotification *) notification {
    NSManagedObjectContext *context = [line managedObjectContext];
    for (int index = 0; index < 4; index ++) {
        UITextField *textField = [self.lineFields objectAtIndex:index];
        if (textField != nil) {
            NSString *lineText = textField.text;
            NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:kLineEntityName];
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(%K = %d)", kLineNumberKey, index];
            [request setPredicate:predicate];
            NSError *error;
            NSArray *objects = [context executeFetchRequest:request error:&error];
            if (objects == nil) {
                NSLog(@"Error occour : %@", error);
                return;
            }
            
            NSManagedObject *oneObject;
            if (objects.count > 0) {
                oneObject = [objects objectAtIndex:0];
            }
            else {
                oneObject = [NSEntityDescription insertNewObjectForEntityForName:kLineEntityName inManagedObjectContext:context];
            }
            [oneObject setValue:[NSNumber numberWithInt:index] forKey:kLineNumberKey];
            [oneObject setValue:lineText forKey:kLineTextKey];
        }
    }
    

    [line saveContext];
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
