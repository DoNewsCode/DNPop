//
//  DNAlertManager.h
//  A9VG
//
//  Created by Ming on 2018/11/7.
//  Copyright © 2018 DoNews. All rights reserved.
//  弹窗管理器

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "DNCustomAlertController.h"
#import "DNAlertOperation.h"

NS_ASSUME_NONNULL_BEGIN

@interface DNAlertManager : NSObject

+ (void)insert

/**
 插入一个Alert视图控制器（默认从根控制器弹出）

 @param alertViewController Alert视图控制器
 */
+ (void)insertAlertController:(nonnull DNCustomAlertController *)alertViewController;


/**
 插入一个Alert视图（指定弹出控制器）

 @param fromViewController 药弹出Alert的控制器
 @param alertViewController Alert控制器
 */
+ (void)insertFromViewController:(nullable UIViewController *)fromViewController alertController:(nonnull DNCustomAlertController *)alertViewController;

/**
 添加一个Alert动作
 可通过此方法自定义加入的alertOperation
 @param alertOperation Alert动作
 */
+ (void)insertAlertOperation:(DNAlertOperation *)alertOperation;

@end

NS_ASSUME_NONNULL_END
