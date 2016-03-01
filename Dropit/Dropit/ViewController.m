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
@property (strong, nonatomic) UICollisionBehavior *collision;
@property (strong, nonatomic) UIAttachmentBehavior *attachment;
@property (strong, nonatomic) UIView *droppingView;

@end

static const CGSize rectSize = {40, 40};
typedef int(^JustAdd)(int first, int second);

@implementation ViewController

JustAdd add;


- (UIDynamicAnimator *)dynamicAnimator {
    if (!_dynamicAnimator) {
        _dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.gameView];
    }
    return _dynamicAnimator;
}

- (UIGravityBehavior *)gravity {
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
//        [_gravity setAngle:180 / 3.14 magnitude:0.9];
        _gravity.magnitude = 9.8;
        [self.dynamicAnimator addBehavior:_gravity];
    }
    return _gravity;
}

- (UICollisionBehavior *)collision {
    if (!_collision) {
        _collision = [[UICollisionBehavior alloc] init];
        [_collision setTranslatesReferenceBoundsIntoBoundary:YES];
        [self.dynamicAnimator addBehavior:_collision];
    }
    return _collision;
}

#pragma mark - recognise
- (IBAction)singleTap:(UITapGestureRecognizer *)sender {
    int offsetX = (arc4random() % (int)self.gameView.bounds.size.width) / rectSize.width;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(offsetX * rectSize.width, 0, rectSize.width, rectSize.height)];
//    view.layer.cornerRadius = rectSize.width / 2;
    [view setBackgroundColor:[UIColor redColor]];
    [self.gameView addSubview:view];
    [self.gravity addItem:view];
    [self.collision addItem:view];
    self.droppingView = view;
    
    add(1, 2);
    add(2, 2);
    add(3, 2);
//    [self boom:view];
    
    NSArray *viewItems = self.gravity.items;
    if (viewItems.count > 20) {
        for (id obj in viewItems) {
            [self.gravity removeItem:obj];
            [self.collision removeItem:obj];
        }
        [viewItems makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
}

- (IBAction)drag:(UIPanGestureRecognizer *)sender {
    CGPoint pos = [sender locationInView:self.gameView];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.attachment = [[UIAttachmentBehavior alloc] initWithItem:self.droppingView attachedToAnchor:pos];
            self.attachment.damping = 0;
            [self.dynamicAnimator addBehavior:self.attachment];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            self.attachment.anchorPoint = pos;
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            [self.dynamicAnimator removeBehavior:self.attachment];
            self.attachment = nil;
        }
            break;
            
        default:
            break;
    }
}

- (void)boom:(UIView *)boomView {
    for (int i = 0; i < 10; i ++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(boomView.bounds.origin.x + i * 20, boomView.bounds.origin.y, 10, 10)];
        [view setBackgroundColor:[UIColor redColor]];
        [self.gameView addSubview:view];
        [self.gravity addItem:view];
    }

    //    view.layer.cornerRadius = rectSize.width / 2;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test:^(int first, int second) {
        NSLog(@"JustAdd, %d", first);
        return first + second;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)test:(JustAdd)handler {
    add = handler;
}









@end
