//
//  PhotoViewController.m
//  TestPhotoBrowser
//
//  Created by Charlie on 15/11/11.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "PhotoViewController.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"

@interface PhotoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    browser.currentPhotoIndex = 0;
    
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i < 1; i++) {
        NSString *currentFileId = @"";
        NSURL *url = [NSURL URLWithString:currentFileId];
        MJPhoto *photo = [[MJPhoto alloc] init];
        photo.url = url; // 图片路径
        [photos addObject:photo];
    }
    browser.photos = photos;
    [browser show];
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

@end
