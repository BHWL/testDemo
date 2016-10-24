//
//  ViewController.m
//  GitDemo
//
//  Created by 安信 on 16/10/24.
//  Copyright © 2016年 com.xy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int a = 5;
    int b = 10;
    
    int sum = a + b;
    
    NSLog(@"The result is: %d", sum);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
