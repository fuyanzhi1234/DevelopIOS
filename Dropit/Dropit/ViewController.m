//
//  ViewController.m
//  Dropit
//
//  Created by Charlie on 16/1/6.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (strong, nonatomic) UIDynamicAnimator *dynamicAnimator;
@property (strong, nonatomic) UIGravityBehavior *gravity;

@end

static const CGSize rectSize = {40, 40};

@implementation ViewController

- (UIDynamicAnimator *)dynamicAnimator {
    if (!_dynamicAnimator) {
        _dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.gameView];
    }
    return _dynamicAnimator;
}

- (UIGravityBehavior *)gravity {
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 0.9;
        [self.dynamicAnimator addBehavior:_gravity];
    }
    return _gravity;
}

- (IBAction)singleTap:(UITapGestureRecognizer *)sender {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rectSize.width, rectSize.height)];
    [view setBackgroundColor:[UIColor redColor]];
    [self.gameView addSubview:view];
    [self.gravity addItem:view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
