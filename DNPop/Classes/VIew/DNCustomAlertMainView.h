//
//  DNCustomAlertMainView.h
//  MingTest
//
//  Created by Ming on 2018/11/12.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DNCustomAlertBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DNCustomAlertMainView : UIView
/** alertView */
@property (nonatomic, strong) DNCustomAlertBaseView *alertView;
/** alertView */
@property (nonatomic, strong) UIView *backgroundView;
@end

NS_ASSUME_NONNULL_END
