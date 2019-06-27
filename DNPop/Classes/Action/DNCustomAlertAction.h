//
//  DNCustomAlertAction.h
//  MingTest
//
//  Created by Ming on 2018/11/12.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//#import "DNCustomAlertBaseItemButton.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, DNCustomAlertActionStyle) {
    DNCustomAlertActionStyleDefault = 0,
    DNCustomAlertActionStyleCancel,
    DNCustomAlertActionStyleCustom
} NS_ENUM_AVAILABLE_IOS(8_0);


@interface DNCustomAlertAction : NSObject

@property (nonatomic, readonly) void (^handler)(DNCustomAlertAction * _Nonnull action);
@property (nonatomic, readonly) void (^handlers)(DNCustomAlertAction * _Nonnull action,UIView *selectedView);
//@property (nonatomic, readonly) void (^shaerHandlers)(DNCustomAlertAction * _Nonnull action,DNCustomAlertBaseItemButton *selectedButton);

@property (nonatomic, readonly) void (^pageHandler)(DNCustomAlertAction * _Nonnull action,NSInteger selectedPage);

@property (nullable, nonatomic, strong) id data;
@property (nullable, nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) DNCustomAlertActionStyle style;
@property (nonatomic, getter=isEnabled) BOOL enabled;


+ (instancetype)actionWithTitle:(nullable NSString *)title style:(DNCustomAlertActionStyle)style handler:(void (^ __nullable)(DNCustomAlertAction *action ))handler;

+ (instancetype)actionWithTitle:(nullable NSString *)title style:(DNCustomAlertActionStyle)style handlers:(void (^ __nullable)(DNCustomAlertAction *action ,UIView *selectedView))handlers;

//+ (instancetype)actionWithShareStyleHandlers:(void (^ __nullable)(DNCustomAlertAction *action ,DNCustomAlertBaseItemButton *selectedButton))handlers;

+ (instancetype)actionWithForumPageHandlers:(void (^ __nullable)(DNCustomAlertAction * _Nonnull action,NSInteger selectedPage))handlers currentPage:(NSInteger)currentPage totalPage:(NSInteger)totalPage;

- (void)customHandlersBlock:(void (^ __nullable)(DNCustomAlertAction *action ))handlersBlock;

@end


NS_ASSUME_NONNULL_END
