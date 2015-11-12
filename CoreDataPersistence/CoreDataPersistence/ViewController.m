//
//  ViewController.m
//  CoreDataPersistence
//
//  Created by yuMac on 15/9/24.
//  Copyright © 2015年 yuMac. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *lineFields;
@end

@implementation ViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
static NSString * const kLineEntityName = @"Line";
static NSString * const kLineNumberKey = @"lineNumber";
static NSString * const kLineTextKey = @"lineText";
NSManagedObjectContext *context;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    context = [app managedObjectContext];
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


- (void)applicationWillResignActive:(NSNotification *) notification {
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
    
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app saveContext];
}

@end
