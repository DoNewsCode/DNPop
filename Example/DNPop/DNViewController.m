//
//  DNViewController.m
//  DNPop
//
//  Created by 陈金铭 on 06/17/2019.
//  Copyright (c) 2019 陈金铭. All rights reserved.
//

#import "DNViewController.h"
#import "DNTestAlertViewController.h"
#import "DNAlertManager.h"

@interface DNViewController ()

@end

@implementation DNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createContent];
    
}

#pragma mark - Public Methods

#pragma mark - Private Methods
- (void)createContent {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor blueColor];
    button.titleLabel.numberOfLines = 0;
    [button setTitle:@"A" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18.];
    button.frame = (CGRect){15,100,100,100};
    [self.view addSubview:button];
    [button addTarget:self action:@selector(eventButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.titleLabel.numberOfLines = 0;
    button1.backgroundColor = [UIColor blueColor];
    [button1 setTitle:@"B" forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:18.];
    button1.frame = (CGRect){130,100,100,100};
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(eventButton1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.titleLabel.numberOfLines = 0;
    button2.backgroundColor = [UIColor blueColor];
    [button2 setTitle:@"C" forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont systemFontOfSize:18.];
    button2.frame = (CGRect){15,215,100,100};
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(eventButton2Click:) forControlEvents:UIControlEventTouchUpInside];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        DNTestAlertViewController *testAlert = [DNTestAlertViewController alertControllerWithTitle:@"BBBBBBBB" message:@"bbbbbbbbb" preferredStyle:DNCustomAlertControllerStyleActionSheet];
        testAlert.presentStyle = DNCustomAlertPresentStyleSlideUp;
        testAlert.dismissStyle = DNCustomAlertDismissStyleSlideDown;
        DNCustomAlertAction *selectPhotosAlertAction = [DNCustomAlertAction actionWithTitle:@"BBBBBBBB" style:DNCustomAlertActionStyleDefault handlers:^(DNCustomAlertAction * _Nonnull action, UIView * _Nonnull selectedView) {
        }];
        
        DNCustomAlertAction *selectAlertAction = [DNCustomAlertAction actionWithTitle:@"去选择" style:DNCustomAlertActionStyleDefault handlers:^(DNCustomAlertAction * _Nonnull action, UIView * _Nonnull selectedView) {
        }];
        
        DNCustomAlertAction *cancelAlertAction = [DNCustomAlertAction actionWithTitle:@"取消" style:DNCustomAlertActionStyleDefault handlers:^(DNCustomAlertAction * _Nonnull action, UIView * _Nonnull selectedView) {
        }];
        
        [testAlert addActions:@[selectPhotosAlertAction,selectAlertAction,cancelAlertAction]];
        [DNAlertManager insertFromViewController:self alertController:testAlert];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        DNTestAlertViewController *testAlert = [DNTestAlertViewController alertControllerWithTitle:@"CCCCCC" message:@"cccccccc" preferredStyle:DNCustomAlertControllerStyleActionSheet];
        testAlert.presentStyle = DNCustomAlertPresentStyleSlideUp;
        testAlert.dismissStyle = DNCustomAlertDismissStyleSlideDown;
        DNCustomAlertAction *selectPhotosAlertAction = [DNCustomAlertAction actionWithTitle:@"CCCCCC" style:DNCustomAlertActionStyleDefault handlers:^(DNCustomAlertAction * _Nonnull action, UIView * _Nonnull selectedView) {
        }];
        
        DNCustomAlertAction *selectAlertAction = [DNCustomAlertAction actionWithTitle:@"去选择" style:DNCustomAlertActionStyleDefault handlers:^(DNCustomAlertAction * _Nonnull action, UIView * _Nonnull selectedView) {
        }];
        
        DNCustomAlertAction *cancelAlertAction = [DNCustomAlertAction actionWithTitle:@"取消" style:DNCustomAlertActionStyleDefault handlers:^(DNCustomAlertAction * _Nonnull action, UIView * _Nonnull selectedView) {
        }];
        
        [testAlert addActions:@[selectPhotosAlertAction,selectAlertAction,cancelAlertAction]];
        DNAlertOperation *alertOperation = [[DNAlertOperation alloc] initWithFromViewController:self toViewController:testAlert];
        [DNAlertManager insertAlertOperation:alertOperation];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        DNTestAlertViewController *testAlert = [DNTestAlertViewController alertControllerWithTitle:@"CCCCCC" message:@"cccccccc" preferredStyle:DNCustomAlertControllerStyleActionSheet];
        testAlert.presentStyle = DNCustomAlertPresentStyleSlideUp;
        testAlert.dismissStyle = DNCustomAlertDismissStyleSlideDown;
        DNCustomAlertAction *selectPhotosAlertAction = [DNCustomAlertAction actionWithTitle:@"DNAlertOperationQueuePriorityVeryHigh" style:DNCustomAlertActionStyleDefault handlers:^(DNCustomAlertAction * _Nonnull action, UIView * _Nonnull selectedView) {
        }];
        
        DNCustomAlertAction *selectAlertAction = [DNCustomAlertAction actionWithTitle:@"去选择" style:DNCustomAlertActionStyleDefault handlers:^(DNCustomAlertAction * _Nonnull action, UIView * _Nonnull selectedView) {
        }];
        
        DNCustomAlertAction *cancelAlertAction = [DNCustomAlertAction actionWithTitle:@"取消" style:DNCustomAlertActionStyleDefault handlers:^(DNCustomAlertAction * _Nonnull action, UIView * _Nonnull selectedView) {
        }];
        
        [testAlert addActions:@[selectPhotosAlertAction,selectAlertAction,cancelAlertAction]];
        DNAlertOperation *alertOperation = [[DNAlertOperation alloc] initWithFromViewController:self toViewController:testAlert];
        alertOperation.priority = DNAlertOperationQueuePriorityHigh;
        
        [DNAlertManager insertAlertOperation:alertOperation];
    });
}



#pragma mark - Event Methods
- (void)eventButtonClick:(UIButton *)button {
    DNTestAlertViewController *testAlert = [DNTestAlertViewController alertControllerWithTitle:@"CCCCCC" message:@"cccccccc" preferredStyle:DNCustomAlertControllerStyleActionSheet];
    testAlert.presentStyle = DNCustomAlertPresentStyleSlideUp;
    testAlert.dismissStyle = DNCustomAlertDismissStyleSlideDown;
    DNCustomAlertAction *selectPhotosAlertAction = [DNCustomAlertAction actionWithTitle:@"AAAAAAAAAAAA" style:DNCustomAlertActionStyleDefault handlers:^(DNCustomAlertAction * _Nonnull action, UIView * _Nonnull selectedView) {
    }];
    
    DNCustomAlertAction *selectAlertAction = [DNCustomAlertAction actionWithTitle:@"去选择" style:DNCustomAlertActionStyleDefault handlers:^(DNCustomAlertAction * _Nonnull action, UIView * _Nonnull selectedView) {
    }];
    
    DNCustomAlertAction *cancelAlertAction = [DNCustomAlertAction actionWithTitle:@"取消" style:DNCustomAlertActionStyleDefault handlers:^(DNCustomAlertAction * _Nonnull action, UIView * _Nonnull selectedView) {
    }];
    
    [testAlert addActions:@[selectPhotosAlertAction,selectAlertAction,cancelAlertAction]];
    DNAlertOperation *alertOperation = [[DNAlertOperation alloc] initWithFromViewController:self toViewController:testAlert];
    alertOperation.priority = DNAlertOperationQueuePriorityVeryHigh;
    
    [DNAlertManager insertAlertOperation:alertOperation];
    
}

- (void)eventButton1Click:(UIButton *)button {
    
   
}

- (void)eventButton2Click:(UIButton *)button {
   
}
@end
