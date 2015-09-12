//
//  PageControlViewController.m
//  PageControlView
//
//  Created by yuMac on 15/9/8.
//  Copyright (c) 2015年 yuMac. All rights reserved.
//

#import "PageControlViewController.h"

@interface PageControlViewController ()

@end

@implementation PageControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
    CGRect rect = [[UIScreen mainScreen] bounds];
    int screenWidth = rect.size.width;
    int screenHeight = rect.size.height;
    rect = CGRectMake(0, 0, screenWidth, screenHeight);
    self.scrollView = [[UIScrollView alloc] initWithFrame:rect];
    self.scrollView.pagingEnabled = YES;
    [self.scrollView setContentSize:CGSizeMake(screenWidth * 2, screenHeight)];
    [self.scrollView setDelegate:self];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    
    int pcHeight = 50;
    CGRect rect1 = CGRectMake(0, screenHeight - pcHeight, screenWidth, pcHeight);
    self.pageControl = [[UIPageControl alloc] initWithFrame:rect1];
    self.pageControl.numberOfPages = 2;
    self.pageControl.currentPage = 0;
    self.pageControl.backgroundColor = [UIColor grayColor];
    self.pageControl.backgroundColor = [UIColor colorWithWhite:0 alpha:0.0];
    [self.pageControl addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged];
    
    self.first = [[FirstViewController alloc] init];
    rect.origin.y = 0;
    [self.first.view setFrame:rect];
    
    self.second = [[SecondViewController alloc] init];
    rect.origin.x = rect.size.width;
    [self.second.view setFrame:rect];
    
    [self.scrollView addSubview:self.first.view];
    [self.scrollView addSubview:self.second.view];
    
//    [self.view insertSubview:self.scrollView atIndex:0];
//    [self.view insertSubview:self.pageControl atIndex:1];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];
}

- (void) pageAction:(id)sender{
    int curPage = [self.pageControl currentPage];
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * curPage;
//    frame.origin.y = 0;
    
    [self.scrollView scrollRectToVisible:frame animated:YES];
    self.isPage = YES;
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.isPage) {
        return;
    }
    
    int pageWidth = self.scrollView.frame.size.width;
    if (self.scrollView.contentOffset.x < pageWidth) {
        self.pageControl.currentPage = 0;
    }
    else{
        self.pageControl.currentPage = 1;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.isPage = NO;
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
