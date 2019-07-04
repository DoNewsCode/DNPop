//
//  DNTestView.h
//  DNPop_Example
//
//  Created by 陈金铭 on 2019/7/2.
//  Copyright © 2019 陈金铭. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DNTestView : UIView

@property (nonatomic, copy) void (^handler)(UIButton *button);

- (void)returnHandler:(void (^ __nullable)(UIButton *button))handler;

@end

NS_ASSUME_NONNULL_END
