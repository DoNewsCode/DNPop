//
//  DNAlertOperation.h
//  MingTest
//
//  Created by Ming on 2018/11/13.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DNCustomAlertController.h"
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, DNAlertOperationQueuePriority) {
    DNAlertOperationQueuePriorityVeryLow = -8L,
    DNAlertOperationQueuePriorityLow = -4L,
    DNAlertOperationQueuePriorityNormal = 0,
    DNAlertOperationQueuePriorityHigh = 4,
    DNAlertOperationQueuePriorityVeryHigh = 8
};

@interface DNAlertOperation : NSObject

/** fromViewController */
@property (nonatomic, weak) UIViewController *fromViewController;
/** fromViewController */
@property (nonatomic, strong) DNCustomAlertController *toViewController;
//优先级
@property (nonatomic, assign) DNAlertOperationQueuePriority priority;
@property (readonly, getter=isExecuting) BOOL executing;
@property (readonly, getter=isFinished) BOOL finished;
@property (readonly, getter=isAsynchronous) BOOL asynchronous API_AVAILABLE(macos(10.8), ios(7.0), watchos(2.0), tvos(9.0));
@property (readonly, getter=isReady) BOOL ready;

- (instancetype)initWithFromViewController:(UIViewController *)fromViewController toViewController:(DNCustomAlertController *)toViewController;

- (void)start;
- (void)main;
- (void)cancel;

@end

NS_ASSUME_NONNULL_END
