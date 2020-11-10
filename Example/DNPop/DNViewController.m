//
//  DNViewController.m
//  DNPop
//
//  Created by 陈金铭 on 06/17/2019.
//  Copyright (c) 2019 陈金铭. All rights reserved.
//

#import "DNViewController.h"
#import "DNPop.h"
#import "DNTestAlertAction.h"
#import "DNTestViewController.h"
#import "DNTestPopViewController.h"

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
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.titleLabel.numberOfLines = 0;
    button3.backgroundColor = [UIColor blueColor];
    [button3 setTitle:@"D" forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont systemFontOfSize:18.];
    button3.frame = (CGRect){260,100,100,100};
    [self.view addSubview:button3];
    [button3 addTarget:self action:@selector(eventButton3Click:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.titleLabel.numberOfLines = 0;
    button4.backgroundColor = [UIColor blueColor];
    [button4 setTitle:@"E" forState:UIControlStateNormal];
    button4.titleLabel.font = [UIFont systemFontOfSize:18.];
    button4.frame = (CGRect){130,215,100,100};
    [self.view addSubview:button4];
    [button4 addTarget:self action:@selector(eventButton4Click:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.titleLabel.numberOfLines = 0;
    button5.backgroundColor = [UIColor blueColor];
    [button5 setTitle:@"F" forState:UIControlStateNormal];
    button5.titleLabel.font = [UIFont systemFontOfSize:18.];
    button5.frame = (CGRect){260,215,100,100};
    [self.view addSubview:button5];
    [button5 addTarget:self action:@selector(eventButton5Click:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)createSystomAlert {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"设置"
                                          message:@"请在iPhone的\"设置-隐私-通讯录\"选项中,允许引力资讯访问你的通讯录"
                                          preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *OK1Action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *OK2Action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:OKAction];
    [alertController addAction:OK1Action];
    [alertController addAction:OK2Action];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)createCustomAlert {
    
    DNPopStyle *alertStyle = [DNPopStyle new];
    alertStyle.dividingLine = NO;
    alertStyle.actionSource = DNPopStyleActionSource_RenrenPlay;
    DNTestPopViewController *customAlertController = [[DNTestPopViewController alloc] initAlertControllerWithTitle:@"这里添加标题" message:@"这里是createCustomAlert的描述文字，默认剧中展示,可改变弹出、消失动画类型，可添加自定义视图，DNPopStyle中包含可配置项及配置项说明；" preferredStyle:DNPopViewControllerStyleAlert];
    customAlertController.alertStyle = alertStyle;
    customAlertController.presentStyle = DNPopPresentStyleSystem;
    customAlertController.dismissStyle = DNPopDismissStyleFadeOut;
    customAlertController.backgroundCancel = NO;
    DNTestAlertAction *alertAction = [DNTestAlertAction actionWithViewHandler:^(UIButton * _Nonnull button) {
        NSLog(@"点击了：%@",button.titleLabel.text);
        customAlertController.handler(customAlertController);
    }];
    alertAction.style = DNPopActionStyleCustom;
    [customAlertController addAction:alertAction];
    
    DNPopAction *alertAction2 = [DNPopAction actionWithTitle:@"好的" style:DNPopActionStyleDefault handler:^{
        customAlertController.handler(customAlertController);
    }];
    [customAlertController addAction:alertAction2];
    
    DNPopAction *alertAction3 = [DNPopAction actionWithTitle:@"取消" style:DNPopActionStyleCancel handler:^{
        customAlertController.handler(customAlertController);
    }];
    [customAlertController addAction:alertAction3];
    //
    [DNPop insertAlertController:customAlertController];
    
}


- (void)createCustomHorizontalAlert {
    
    DNPopStyle *alertStyle = [DNPopStyle new];
    alertStyle.dividingLine = YES;
    alertStyle.alertheight = 160;
    alertStyle.actionSort = DNPopStyleActionSortByHorizontal;
    DNTestPopViewController *customAlertController = [DNTestPopViewController alertControllerWithTitle:@"开启”人人运动“，记录你的运动记录哟!" message:nil preferredStyle:DNPopViewControllerStyleAlert];
    customAlertController.alertStyle = alertStyle;
    
    customAlertController.presentStyle = DNPopPresentStyleSystem;
    customAlertController.dismissStyle = DNPopDismissStyleFadeOut;
    customAlertController.backgroundCancel = NO;
    //    DNTestAlertAction *alertAction = [DNTestAlertAction actionWithViewHandler:^(UIButton * _Nonnull button) {
    //        NSLog(@"点击了：%@",button.titleLabel.text);
    //        customAlertController.handler(customAlertController);
    //    }];
    //    alertAction.style = DNPopActionStyleCustom;
    //    [customAlertController addAction:alertAction];
    
    DNPopAction *alertAction2 = [DNPopAction actionWithTitle:@"好的" style:DNPopActionStyleDefault handler:^{
        customAlertController.handler(customAlertController);
    }];
    [customAlertController addAction:alertAction2];
    
    DNPopAction *alertAction3 = [DNPopAction actionWithTitle:@"取消" style:DNPopActionStyleCancel handler:^{
        customAlertController.handler(customAlertController);
    }];
    [customAlertController addAction:alertAction3];
    //
    [DNPop insertAlertController:customAlertController];
    
}

- (void)createCustomActionSheet {
    DNPopStyle *alertStyle = [DNPopStyle new];
    DNPopViewController *customAlertController = [DNPopViewController alertControllerWithTitle:@"这里添加标题" message:@"这里是createCustomActionSheet的描述文字，默认剧中展示,可改变弹出、消失动画类型，可添加自定义视图，DNPopStyle中包含可配置项及配置项说明；" preferredStyle:DNPopViewControllerStyleActionSheet];
    customAlertController.alertStyle = alertStyle;
    customAlertController.presentStyle = DNPopPresentStyleSlideUpLinear;
    customAlertController.dismissStyle = DNPopDismissStyleSlideDown;
    //    customAlertController.backgroundCancel = NO;
    DNTestAlertAction *alertAction = [DNTestAlertAction actionWithViewHandler:^(UIButton * _Nonnull button) {
        NSLog(@"%@",button.titleLabel.text);
        customAlertController.handler(customAlertController);
    }];
    alertAction.style = DNPopActionStyleCustom;
    [customAlertController addAction:alertAction];
    
    DNPopAction *alertAction3 = [DNPopAction actionWithTitle:@"取消" style:DNPopActionStyleCancel handler:^{
        customAlertController.handler(customAlertController);
    }];
    [customAlertController addAction:alertAction3];
    //
    [DNPop insertAlertController:customAlertController];
}


- (void)createAlert3 {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self createCustomActionSheet];
    });
}


- (void)createAlert4 {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        DNPopStyle *alertStyle = [DNPopStyle new];
        DNPopViewController *customAlertController = [DNPopViewController alertControllerWithTitle:@"这里添加标题" message:@"这里是createCustomActionSheet的描述文字，默认剧中展示,可改变弹出、消失动画类型，可添加自定义视图，DNPopStyle中包含可配置项及配置项说明；" preferredStyle:DNPopViewControllerStyleActionSheet];
        customAlertController.alertStyle = alertStyle;
        customAlertController.presentStyle = DNPopPresentStyleSlideUpLinear;
        customAlertController.dismissStyle = DNPopDismissStyleSlideDown;
        //    customAlertController.backgroundCancel = NO;
        DNTestAlertAction *alertAction = [DNTestAlertAction actionWithViewHandler:^(UIButton * _Nonnull button) {
            NSLog(@"%@",button.titleLabel.text);
            customAlertController.handler(customAlertController);
        }];
        alertAction.style = DNPopActionStyleCustom;
        [customAlertController addAction:alertAction];
        
        DNPopAction *alertAction3 = [DNPopAction actionWithTitle:@"取消" style:DNPopActionStyleCancel handler:^{
            customAlertController.handler(customAlertController);
        }];
        [customAlertController addAction:alertAction3];
        //
        //            [DNPop insertAlertController:customAlertController];
        DNPopOperation *alertOperation = [DNPopOperation new];
        alertOperation.priority = DNPopOperationQueuePriorityHigh;
        alertOperation.fromViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
        alertOperation.toViewController = customAlertController;
        [DNPop insertAlertOperation:alertOperation];
        //        [DNPop insertAlertOperation:<#(nonnull DNPopOperation *)#>]
    });
}

- (void)createAlert5 {
    DNPopStyle *alertStyle = [DNPopStyle new];
    alertStyle.dividingLine = YES;
    alertStyle.alertheight = 160;
    alertStyle.defaultTextColor = [UIColor blueColor];
    alertStyle.cancelTextColor = [UIColor blueColor];
    alertStyle.alertheight = 160;
    alertStyle.actionSort = DNPopStyleActionSortByHorizontal;
    DNTestPopViewController *customAlertController = [DNTestPopViewController alertControllerWithTitle:@"开启”人人运动“" message:nil preferredStyle:DNPopViewControllerStyleAlert];
    customAlertController.alertStyle = alertStyle;
    
    customAlertController.presentStyle = DNPopPresentStyleSystem;
    customAlertController.dismissStyle = DNPopDismissStyleFadeOut;
    customAlertController.backgroundCancel = NO;
    //    DNTestAlertAction *alertAction = [DNTestAlertAction actionWithViewHandler:^(UIButton * _Nonnull button) {
    //        NSLog(@"点击了：%@",button.titleLabel.text);
    //        customAlertController.handler(customAlertController);
    //    }];
    //    alertAction.style = DNPopActionStyleCustom;
    //    [customAlertController addAction:alertAction];
    
    DNPopAction *alertAction2 = [DNPopAction actionWithTitle:@"好的" style:DNPopActionStyleDefault handler:^{
        customAlertController.handler(customAlertController);
    }];
    [customAlertController addAction:alertAction2];
    
    DNPopAction *alertAction3 = [DNPopAction actionWithTitle:@"取消" style:DNPopActionStyleCancel handler:^{
        customAlertController.handler(customAlertController);
    }];
    [customAlertController addAction:alertAction3];
    //
    [DNPop insertAlertController:customAlertController];
}


#pragma mark - Event Methods
- (void)eventButtonClick:(UIButton *)button {
    [self createSystomAlert];
    
}

- (void)eventButton1Click:(UIButton *)button {
    [self createCustomAlert];
    
}

- (void)eventButton2Click:(UIButton *)button {
    DNTestViewController *testViewController = [DNTestViewController new];
    [self presentViewController:testViewController animated:YES completion:nil];
    //    [self createCustomActionSheet];
}

- (void)eventButton3Click:(UIButton *)button {
    NSLog(@"eventButton3Click");
    [self createAlert3];
}

- (void)eventButton4Click:(UIButton *)button {
    NSLog(@"eventButton3Click");
    //    [self createCustomHorizontalAlert];
    [self createAlert4];
}

- (void)eventButton5Click:(UIButton *)button {
    NSLog(@"eventButton3Click");
    //    [self createCustomHorizontalAlert];
    [self createAlert5];
}

@end
