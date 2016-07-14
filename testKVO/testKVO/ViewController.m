//
//  ViewController.m
//  testKVO
//
//  Created by Charlie on 16/7/14.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textEdit;
- (IBAction)chageText:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.textEdit addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionOld context:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (object == self.textEdit) {
        if ([keyPath isEqualToString:@"text"]) {
            NSLog(@"Change new = %@, old = %@", [change valueForKey:NSKeyValueChangeNewKey], [change valueForKey:NSKeyValueChangeOldKey]);
        }
    }
}

- (IBAction)chageText:(id)sender {
    [self.textEdit setText:@"xx"];
}
@end
