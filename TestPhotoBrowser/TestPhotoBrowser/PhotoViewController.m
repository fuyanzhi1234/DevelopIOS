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
- (IBAction)showPhoto:(id)sender;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)showPhoto:(id)sender {
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    browser.currentPhotoIndex = 0;
    int photoCount = 5;
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:photoCount];
    for (int i = 0; i < photoCount; i++) {
        NSString *currentFileId = @"";
        NSURL *url = [NSURL URLWithString:currentFileId];
        MJPhoto *photo = [[MJPhoto alloc] init];
        photo.url = url;
//        photo.image = [UIImage imageNamed:@"pic.jpg"]; // 图片路径
        [photos addObject:photo];
    }
    browser.photos = photos;
    browser.failedText = @"图片加载失败，显示小红点啦";
    browser.failedImageName = @"Image";
//    browser.saveBtnPosition = MJPhotoBrowserSaveBtnPositionLeft;
//    browser.labelColor = [UIColor redColor];
//    browser.labelFont = [UIFont boldSystemFontOfSize:14];
//    browser.saveNormalImage = @"pic.jpg";
    [browser show];
}
@end
