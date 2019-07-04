//
//  DNTestAlertAction.h
//  DNPop_Example
//
//  Created by 陈金铭 on 2019/7/2.
//  Copyright © 2019 陈金铭. All rights reserved.
//

#import "DNPopAction.h"


NS_ASSUME_NONNULL_BEGIN

@interface DNTestAlertAction : DNPopAction

@property (nonatomic, copy) void (^customHandler)(UIButton *button);
+ (instancetype)actionWithViewHandler:(void (^ __nullable)(UIButton *button ))handler;
@end

NS_ASSUME_NONNULL_END
