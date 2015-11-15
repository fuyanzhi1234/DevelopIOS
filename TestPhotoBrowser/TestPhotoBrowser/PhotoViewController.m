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
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, 0.0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    browser.currentPhotoIndex = 0;
    int photoCount = 5;
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:photoCount];
    for (int i = 0; i < photoCount; i++) {
//        NSString *currentFileId = @"";
//        NSURL *url = [NSURL URLWithString:currentFileId];
        MJPhoto *photo = [[MJPhoto alloc] init];
        photo.image = [UIImage imageNamed:@"pic.jpg"]; // 图片路径
        [photos addObject:photo];
    }
    browser.photos = photos;
    [browser show];
}
@end
