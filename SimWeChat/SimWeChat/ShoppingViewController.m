//
//  ShoppingViewController.m
//  SimWeChat
//
//  Created by Charlie on 15/12/24.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "ShoppingViewController.h"
#import "UIAlertView+BlocksKit.h"

@interface ShoppingViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.jd.com"]]];
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

#pragma mark - UIWebViewDelegate
- (void)webView:(UIWebView * _Nonnull)webView didFailLoadWithError:(NSError * _Nullable)error {
    [UIAlertView bk_showAlertViewWithTitle:@"Alert" message:[error localizedDescription] cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"Confirm"] handler:^(UIAlertView *alertView, NSInteger index){
        NSLog(@"%ld", (long)index);
    }];
}

@end
