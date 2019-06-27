//
//  DNCustomAlertPresentBaseAnimator.h
//  MingTest
//
//  Created by Ming on 2018/11/7.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/** present style */
typedef NS_ENUM(NSInteger, DNCustomAlertPresentStyle) {
    DNCustomAlertPresentStyleSystem,          // 系统样式
    DNCustomAlertPresentStyleFadeIn,          // 渐入
    DNCustomAlertPresentStyleBounce,          // 弹出
    DNCustomAlertPresentStyleExpandHorizontal,// 水平展开
    DNCustomAlertPresentStyleExpandVertical,  // 垂直展开
    DNCustomAlertPresentStyleSlideDown,       // 从上往下划入
    DNCustomAlertPresentStyleSlideUp,         // 从下往上划入
    DNCustomAlertPresentStyleSlideLeft,       // 从右往左划入
    DNCustomAlertPresentStyleSlideRight,      // 从左往右划入
};

@interface DNCustomAlertPresentBaseAnimator : NSObject<UIViewControllerAnimatedTransitioning>
/** 背景透明度 */
@property (nonatomic, assign) CGFloat transitionBackgroundAlpha;

@property (assign, nonatomic) DNCustomAlertPresentStyle style;

@end

NS_ASSUME_NONNULL_END
