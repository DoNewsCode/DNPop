//
//  DNTestViewController.m
//  DNPop_Example
//
//  Created by 陈金铭 on 2019/9/26.
//  Copyright © 2019 陈金铭. All rights reserved.
//

#import "DNTestViewController.h"

#import "DNPop.h"
#import "DNTestAlertAction.h"
#import "DNTestViewController.h"
@interface DNTestViewController ()

@end

@implementation DNTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.titleLabel.numberOfLines = 0;
    button2.backgroundColor = [UIColor blueColor];
    [button2 setTitle:@"C" forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont systemFontOfSize:18.];
    button2.frame = (CGRect){15,215,100,100};
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(eventButton2Click:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)eventButton2Click:(UIButton *)button {
    [self createCustomActionSheet];
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
    [DNPop insertFromViewController:self alertController:customAlertController];
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
