//
//  DNCustomAlertBaseItem.h
//  MingTest
//
//  Created by Ming on 2018/11/12.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DNCustomAlertAction.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, DNCustomAlertItemStyle) {
    DNCustomAlertItemStyleText = 0,//文字,
    DNCustomAlertItemStyleButton, //按钮
    DNCustomAlertItemStyleCustom //自定义
} NS_ENUM_AVAILABLE_IOS(8_0);

@interface DNCustomAlertBaseItem : UIView

@property (nonatomic, readonly) DNCustomAlertItemStyle preferredStyle;
/** Title */
@property (nonatomic, strong) UILabel *titleLabel;
/** actionButton */
//@property (nonatomic, strong) UIButton *actionButton;
/** currentSelectedView */
@property (nonatomic, strong) UIView *currentSelectedView;
///** alertAction */
@property (nonatomic, strong) DNCustomAlertAction *alertAction;

/** 存放buttons */
@property (nonatomic, readonly) NSArray<UIButton *> *buttons;

- (instancetype)initWithAlertAction:(DNCustomAlertAction *)alertAction;

- (instancetype)initWithFrame:(CGRect)frame alertAction:(DNCustomAlertAction *)alertAction;

- (void)addButtons:(NSArray<UIButton *> *)buttons;
- (void)createContent;
- (void)hideAlertView;
@end

NS_ASSUME_NONNULL_END
