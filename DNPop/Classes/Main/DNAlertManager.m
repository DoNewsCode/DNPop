//
//  DNAlertManager.m
//  A9VG
//
//  Created by Ming on 2018/11/7.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import "DNAlertManager.h"

#import "DNAlertOperation.h"
#import "DNAlertOperationQueue.h"
@interface DNAlertManager ()

/** queue */
@property (nonatomic, strong) NSMutableArray<DNAlertOperation *> *alertQueue;
/** queue */
@property (nonatomic, strong) DNAlertOperationQueue *alertOperationQueue;


/** 当前执行中的操作 */
@property (nonatomic, strong) DNAlertOperation *executingOperation;
@end

@implementation DNAlertManager
#pragma mark - Override Methods

#pragma mark - Intial Methods
//单例对象
static DNAlertManager *_instance = nil;
//单例
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

#pragma mark - Public Methods
+ (void)insertAlertController:(nonnull DNCustomAlertController *)alertViewController {
    DNAlertManager *manager = [DNAlertManager sharedInstance];
    [manager insertFromViewController:[UIApplication sharedApplication].keyWindow.rootViewController alertController:alertViewController];
}

+ (void)insertFromViewController:(nullable UIViewController *)fromViewController alertController:(nonnull DNCustomAlertController *)alertViewController {
    if (fromViewController == nil) {
        fromViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    }
    DNAlertManager *manager = [DNAlertManager sharedInstance];
    [manager insertFromViewController:fromViewController alertController:alertViewController];
}

+ (void)insertAlertOperation:(DNAlertOperation *)alertOperation {
    if (alertOperation != nil) {
        DNAlertManager *manager = [DNAlertManager sharedInstance];
        [manager.alertOperationQueue addOperation:alertOperation];
    }
}

#pragma mark - Private Methods
- (void)insertFromViewController:(UIViewController *)fromViewController alertController:(nonnull DNCustomAlertController *)alertViewController {

    DNAlertOperation *alertOperation = [DNAlertOperation new];
    alertOperation.priority = DNAlertOperationQueuePriorityNormal;
    alertOperation.fromViewController = fromViewController;
    alertOperation.toViewController = alertViewController;
    
    [self.alertOperationQueue addOperation:alertOperation];
}

#pragma mark - Event Methods

#pragma mark - Setter

#pragma mark - Getter
- (DNAlertOperationQueue *)alertOperationQueue {
    if (!_alertOperationQueue) {
        DNAlertOperationQueue *alertOperationQueue = [DNAlertOperationQueue new];
        _alertOperationQueue = alertOperationQueue;
    }
    return _alertOperationQueue;
}
#pragma mark - NSCopying

#pragma mark - NSObject  Methods

@end
