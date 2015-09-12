//
//  ViewController.m
//  TestBlackApple
//
//  Created by Charlie on 15/8/30.
//  Copyright (c) 2015年 Charlie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)popAlert:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *m_alertButton;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *m_potraitPopAlert;
@property (strong, nonatomic) IBOutlet UIView *m_potrait;
@property (strong, nonatomic) IBOutlet UIView *m_landscape;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *imageNormal = [UIImage imageNamed:@"normal.gif"];
    UIEdgeInsets insetsNormal = UIEdgeInsetsMake(10, 10, 10, 10);
    UIImage *imageNormalStretch = [imageNormal resizableImageWithCapInsets:insetsNormal];
    [self.m_alertButton setBackgroundImage:imageNormalStretch forState:UIControlStateNormal];
    
    UIImage *imageHover = [UIImage imageNamed:@"hover.gif"];
    UIImage *imageHoverStretch = [imageHover resizableImageWithCapInsets:insetsNormal];
    [self.m_alertButton setBackgroundImage:imageHoverStretch forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popAlert:(id)sender {
    if ([self.m_potraitPopAlert containsObject:sender]) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"are you ok"
                                                             delegate:self
                                                    cancelButtonTitle:@"No"
                                               destructiveButtonTitle:@"Yes"
                                                    otherButtonTitles:@"first other", @"second other", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
        [actionSheet showInView:self.view];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 2) {
        UIAlertView *pView = [[UIAlertView alloc]
                              initWithTitle:@"cancel"
                              message:@"Nothing"
                              delegate:self
                              cancelButtonTitle:@"xx"
                              otherButtonTitles:nil];
        [pView show];
    }
}

- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        self.view = self.m_potrait;
    }
    else{
        self.view = self.m_landscape;
    }
}
@end
