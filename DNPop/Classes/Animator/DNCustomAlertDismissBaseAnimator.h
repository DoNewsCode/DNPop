//
//  DNCustomAlertDismissBaseAnimator.h
//  MingTest
//
//  Created by Ming on 2018/11/7.
//  Copyright © 2018 DoNews. All rights reserved.
//  alert动画基类

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/** dismiss style */
typedef NS_ENUM(NSInteger, DNCustomAlertDismissStyle) {
    DNCustomAlertDismissStyleFadeOut,             // 渐出
    DNCustomAlertDismissStyleContractHorizontal,  // 水平收起
    DNCustomAlertDismissStyleContractVertical,    // 垂直收起
    DNCustomAlertDismissStyleSlideDown,           // 向下划出
    DNCustomAlertDismissStyleSlideUp,             // 向上划出
    DNCustomAlertDismissStyleSlideLeft,           // 向左划出
    DNCustomAlertDismissStyleSlideRight,          // 向右划出
};


@interface DNCustomAlertDismissBaseAnimator : NSObject<UIViewControllerAnimatedTransitioning>
/** 背景透明度 */
@property (nonatomic, assign) CGFloat transitionBackgroundAlpha;

@property (assign, nonatomic) DNCustomAlertDismissStyle style;
@end

NS_ASSUME_NONNULL_END
