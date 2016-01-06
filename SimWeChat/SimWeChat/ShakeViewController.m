//
//  ShakeViewController.m
//  SimWeChat
//
//  Created by Charlie on 15/12/26.
//  Copyright © 2015年 Charlie. All rights reserved.
//

#import "ShakeViewController.h"
#import "ShakeBtn.h"

@interface ShakeViewController ()
- (IBAction)peopleClick:(ShakeBtn *)sender;
@property (strong, nonatomic) IBOutletCollection(ShakeBtn) NSArray *switchShakeContent;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *upDownDistanceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *upYConstraint;

@end

@implementation ShakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.switchShakeContent[0] setChecked:YES];
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
#pragma mark - IBAction

- (IBAction)peopleClick:(ShakeBtn *)sender {
    for (ShakeBtn *btn in self.switchShakeContent) {
        [btn setChecked:NO];
    }
    [sender setChecked:YES];
}

#pragma mark - Motion Detect

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    [UIView animateWithDuration:1 animations:^{
        self.upYConstraint.constant = -70;
        self.upDownDistanceConstraint.constant = 50;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            self.upYConstraint.constant = -50;
            self.upDownDistanceConstraint.constant = 0;
            [self.view layoutIfNeeded];
        }];
    }];
    NSLog(@"motionBegan");
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"motionEnd");
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"motionCanceled");
}
@end
