//
//  ViewController.m
//  TestCocoPods
//
//  Created by Charlie on 15/10/7.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "ViewController.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"

@interface ViewController ()
- (IBAction)showPhoto:(id)sender;

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

- (IBAction)showPhoto:(id)sender {
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:1];
    MJPhoto *firstPhoto = [[MJPhoto alloc] init];
    firstPhoto.url = [NSURL URLWithString:@"https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQN0c6uERV9Wvd4RHB0MaQWEQdpjPrnQzIxJ2ilhmh6mTZuq2VC"];
//    firstPhoto.image = [UIImage imageWithContentsOfFile:@"/Users/yumac/Pictures/pic.jpg"];
    firstPhoto.index = 0;
    [array addObject:firstPhoto];
    MJPhoto *secondPhoto = [[MJPhoto alloc] init];
    secondPhoto.image = [UIImage imageNamed:@"el_capitan.jpg"];
    secondPhoto.index = 1;
    [array addObject:secondPhoto];
    browser.photos = array;
    browser.currentPhotoIndex = 0;
    [browser show];
}
@end
