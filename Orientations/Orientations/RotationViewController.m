//
//  RotationViewController.m
//  
//
//  Created by yuMac on 15/9/2.
//
//

#import "RotationViewController.h"

@interface RotationViewController ()
@property (strong, nonatomic) IBOutlet UIView *potrait;
@property (strong, nonatomic) IBOutlet UIView *landscape;
@property (weak, nonatomic) IBOutlet UIButton *xxx;

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"%@", documentsDirectory);
    NSString *appDirectory = NSHomeDirectory();
    NSLog(@"%@", appDirectory);
    NSString *temporaryDirectory = NSTemporaryDirectory();
    NSLog(@"%@", temporaryDirectory);
    NSLog(@"%@", [[NSBundle mainBundle] resourcePath]);
    
    UIImage *image = [UIImage imageNamed:@"pic.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(20, 0, 300, 180);
    imageView.layer.borderWidth = 20;
    imageView.layer.masksToBounds = YES;
    imageView.layer.borderColor = [[UIColor greenColor] CGColor];
    imageView.layer.cornerRadius = 100;
    imageView.layer.shadowOffset = CGSizeMake(10, 10);
//    imageView.layer.shadowColor = [[UIColor blueColor] CGColor];
    imageView.layer.shadowRadius = 10;
    imageView.layer.shadowOpacity = 1;
    
    UIColor *colorBack = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"pic.jpg"]];
    [self.view setBackgroundColor:colorBack];
    
    [self.view addSubview:imageView];
    
    [imageView setTransform:CGAffineTransformRotate(imageView.transform, 3.14/4)];
    
    [imageView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [gesture setNumberOfTapsRequired:1];
    [gesture setNumberOfTouchesRequired:2];
    [imageView addGestureRecognizer:gesture];
}

- (void)tap{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"xx" message:@"xxx" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    NSLog(@"potrait：%@", self.potrait);
    NSLog(@"landscape：%@", self.landscape);
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        self.view = self.potrait;
    }
    else{
        self.view = self.landscape;
    }
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
