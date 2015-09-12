//
//  PageControlViewController.h
//  PageControlView
//
//  Created by yuMac on 15/9/8.
//  Copyright (c) 2015年 yuMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface PageControlViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic) FirstViewController *first;
@property (nonatomic) SecondViewController *second;
@property (nonatomic) UIPageControl *pageControl;
@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) BOOL isPage;

@end
