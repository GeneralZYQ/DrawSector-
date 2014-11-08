//
//  ViewController.m
//  SectorDemo
//
//  Created by ZhangYuanqing on 14-10-24.
//  Copyright (c) 2014年 CBSi. All rights reserved.
//

#import "ViewController.h"
#include <math.h>

@interface ViewController ()

@property (nonatomic, retain) SectorView *setcView;
@property (nonatomic, retain) UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor greenColor];
    
    self.setcView = [[SectorView alloc] initWithPercents:@[@(15), @(15), @(60), @(10)]];
    self.setcView.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 200);
    [self.view addSubview:_setcView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 300, 80, 44)];
    [button setTitle:@"reDraw" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(reDrawButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 260, 300, 40)];
    self.textField.backgroundColor = [UIColor whiteColor];
    self.textField.placeholder = @"请输入新的系列数值，以空格分隔";
    [self.view addSubview:self.textField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reDrawButtonPressed:(id)sender {
    
    
    
    NSArray *numbers = [self.textField.text componentsSeparatedByString:@" "];
    
    for (NSString *number in numbers) {
        if ([number rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location != NSNotFound) {
            NSLog(@"floats only");
            return;
        }
    }
    self.textField.text = @"";
    [self.setcView reConfigurePercents:numbers];
    [self.setcView reDraw];
}

@end
