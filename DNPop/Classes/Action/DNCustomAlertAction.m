//
//  DNCustomAlertAction.m
//  MingTest
//
//  Created by Ming on 2018/11/12.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import "DNCustomAlertAction.h"

#import "DNCustomAlertItem.h"

@interface DNCustomAlertAction ()

@property (nullable, nonatomic, copy) NSString *title;
@property (nonatomic, assign) DNCustomAlertActionStyle style;

@property (nonatomic, copy) void (^handler)(DNCustomAlertAction * _Nonnull action);

@property (nonatomic, copy) void (^handlers)(DNCustomAlertAction * _Nonnull action,UIView *selectedView);

@property (nonatomic, copy) void (^pageHandler)(DNCustomAlertAction * _Nonnull action,NSInteger selectedPage);

@end

@implementation DNCustomAlertAction

+ (instancetype)actionWithTitle:(NSString *)title style:(DNCustomAlertActionStyle)style handler:(void (^)(DNCustomAlertAction * _Nonnull))handler {
    DNCustomAlertAction *customAlertAction = [[DNCustomAlertAction alloc] init];
    customAlertAction.title = title;
    customAlertAction.style = style;
    customAlertAction.handler = handler;
    //    [customAlertAction createAlertItem];
    
    return customAlertAction;
}

+ (instancetype)actionWithTitle:(nullable NSString *)title style:(DNCustomAlertActionStyle)style handlers:(void (^ __nullable)(DNCustomAlertAction *action ,UIView *selectedView))handlers {
    DNCustomAlertAction *customAlertAction = [[DNCustomAlertAction alloc] init];
    customAlertAction.title = title;
    customAlertAction.style = style;
    customAlertAction.handlers = handlers;
    //    [customAlertAction createAlertItem];
    
    return customAlertAction;
}

@end
