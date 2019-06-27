//
//  DNCustomAlertDismissBaseAnimator.m
//  MingTest
//
//  Created by Ming on 2018/11/7.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import "DNCustomAlertDismissBaseAnimator.h"

@implementation DNCustomAlertDismissBaseAnimator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transitionBackgroundAlpha = 0.1;
    }
    return self;
}

@end
