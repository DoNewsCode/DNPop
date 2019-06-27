//
//  DNCustomAlertBaseView.h
//  A9VG
//
//  Created by Ming on 2018/11/7.
//  Copyright © 2018 DoNews. All rights reserved.
//  Alert基类

#import <UIKit/UIKit.h>
#import "DNCustomAlertItem.h"
#import "DNCustomAlertAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface DNCustomAlertBaseView : UIView

@property (nonatomic, readonly) NSArray<DNCustomAlertBaseItem *> *alertItems;
@property (nonatomic, readonly) NSArray<DNCustomAlertAction *> *alertActions;

- (instancetype)initWithAlertActions:(NSArray<DNCustomAlertAction *> *)alertActions;

@end

NS_ASSUME_NONNULL_END
