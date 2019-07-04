//
//  DNTestAlertAction.m
//  DNPop_Example
//
//  Created by 陈金铭 on 2019/7/2.
//  Copyright © 2019 陈金铭. All rights reserved.
//

#import "DNTestAlertAction.h"
#import "DNTestView.h"


@implementation DNTestAlertAction
+ (instancetype)actionWithViewHandler:(void (^ __nullable)(UIButton *button ))handler {
    DNTestAlertAction *customAlertAction = [[DNTestAlertAction alloc] init];
    customAlertAction.customHandler = handler;
    DNTestView *testView = [DNTestView new];
    [testView returnHandler:^(UIButton * _Nonnull button) {
        handler(button);
    }];
    customAlertAction.style = DNPopActionStyleCustom;
    customAlertAction.item = testView;
    
    return customAlertAction;
}

@end
