//
//  ViewController.m
//  Persistence
//
//  Created by Charlie on 15/9/21.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "ViewController.h"
#import "BIDFourLines.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *lineFileds;

@end

@implementation ViewController

bool isArchive = YES;
static NSString *rootKey = @"rootKey";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *dataPath = [self dataFilePath];
    if (isArchive) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:dataPath];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        BIDFourLines *fourLines = [unarchiver decodeObjectForKey:rootKey];
        [unarchiver finishDecoding];
        
        for (int index = 0; index < 4; index ++) {
            UITextField *textLine = self.lineFileds[index];
            [textLine setText:fourLines.lines[index]];
        }
    }
    else{
        if ([[NSFileManager defaultManager] fileExistsAtPath:dataPath]) {
            NSMutableArray *dataArray = [[NSMutableArray alloc] initWithContentsOfFile:dataPath];
            NSLog(@"%@", dataPath);
            NSLog(@"%@", dataArray);
            for (UITextField *textField in self.lineFileds) {
                [textField setText:[dataArray objectAtIndex:0]];
                [dataArray removeObjectAtIndex:0];
            }
        }
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
}

- (void)applicationWillResignActive:(NSNotification *)notification{
    NSString *dataPath = [self dataFilePath];
    if (isArchive) {
        BIDFourLines *fourLines = [[BIDFourLines alloc] init];
        fourLines.lines = [self.lineFileds valueForKey:@"text"];
        NSMutableData *data = [[NSMutableData alloc] init];
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        [archiver encodeObject:fourLines forKey:rootKey];
        [archiver finishEncoding];
        [data writeToFile:dataPath atomically:YES];
    }
    else{
        NSArray *dataArray = [self.lineFileds valueForKey:@"text"];
        [dataArray writeToFile:dataPath atomically:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)dataFilePath {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [pathArray objectAtIndex:0];
    if (isArchive) {
        return [directory stringByAppendingString:@"data.archive"];
    }
    else{
        return [directory stringByAppendingString:@"data.plist"];
    }
}

@end
