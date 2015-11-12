//
//  ViewController.m
//  test1
//
//  Created by yuMac on 15/9/28.
//  Copyright © 2015年 yuMac. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"

@interface ViewController ()

@end

@implementation ViewController

NSData *recieveData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NSLog(@"%ld", reach.currentReachabilityStatus);
    
    if (reach.currentReachabilityStatus == ReachableViaWiFi) {
        NSURL *url = [NSURL URLWithString:@"https://www.apple2.com"];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
//        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//        NSString *strData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"%@", strData);
        
        [NSThread sleepForTimeInterval:10];
        
        return;
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    recieveData = data;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    recieveData = [NSMutableData data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@", [error localizedDescription]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *strData = [[NSString alloc] initWithData:recieveData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", strData);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
