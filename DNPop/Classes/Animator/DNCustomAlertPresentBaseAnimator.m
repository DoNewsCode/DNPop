//
//  DNCustomAlertPresentBaseAnimator.m
//  MingTest
//
//  Created by Ming on 2018/11/7.
//  Copyright © 2018 DoNews. All rights reserved.
//  alert动画Present

#import "DNCustomAlertPresentBaseAnimator.h"

@implementation DNCustomAlertPresentBaseAnimator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transitionBackgroundAlpha = 0.5;
    }
    return self;
}

@end
