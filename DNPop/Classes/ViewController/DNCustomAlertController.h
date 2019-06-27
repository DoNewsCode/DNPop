//
//  DNCustomCustomAlertController.h
//  A9VG
//
//  Created by Ming on 2018/11/7.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "DNCustomAlertMainView.h"

#import "DNCustomAlertAction.h"

#import "DNCustomAlertPresentAnimator.h"
#import "DNCustomAlertDismissAnimator.h"

#import "DNCustomAlertActionSheetView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, DNCustomAlertControllerStyle) {
    DNCustomAlertControllerStyleActionSheet = 0,//暂仅支持此样式
    DNCustomAlertControllerStyleAlert
} NS_ENUM_AVAILABLE_IOS(8_0);


@interface DNCustomAlertController : UIViewController

@property (nonatomic, readonly) NSArray<DNCustomAlertAction *> *actions;

@property (nonatomic, strong, nullable) DNCustomAlertAction *preferredAction NS_AVAILABLE_IOS(9_0);

@property (nullable, nonatomic, readonly) NSArray<UITextField *> *textFields;

//@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *message;
/** present 转场风格 */
@property (nonatomic, assign)DNCustomAlertPresentStyle presentStyle;
/** dismiss 转场风格 */
@property (nonatomic, assign)DNCustomAlertDismissStyle dismissStyle;
/** alert 视图 */
@property (nonnull, nonatomic, strong)UIView *alertView;
/** 半透明背景 */
@property (nonnull, nonatomic, strong)UIView *backgroundView;

@property (nonatomic, readonly) DNCustomAlertControllerStyle preferredStyle;

@property (nonatomic, copy) void (^handler)(DNCustomAlertController * _Nonnull alertController);


+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message preferredStyle:(DNCustomAlertControllerStyle )preferredStyle;

- (void)addTextFieldWithConfigurationHandler:(void (^ __nullable)(UITextField *textField))configurationHandler;

- (void)addAction:(DNCustomAlertAction *)action;

- (void)addActions:(NSArray<DNCustomAlertAction *> *)actions;

- (void)returnHandler:(void (^ __nullable)(DNCustomAlertController *alertController))handler;

@end

NS_ASSUME_NONNULL_END
