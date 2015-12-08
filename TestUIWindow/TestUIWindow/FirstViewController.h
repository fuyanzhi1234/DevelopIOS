//
//  FirstViewController.h
//  TestUIWindow
//
//  Created by Charlie on 15/12/8.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ResignDelegate <NSObject>

- (void)resignFirstView;

@end


@interface FirstViewController : UIViewController

@property (weak, nonatomic) id<ResignDelegate> delegate;

@end
