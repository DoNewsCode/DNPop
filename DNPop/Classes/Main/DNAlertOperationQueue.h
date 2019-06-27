//
//  DNAlertOperationQueue.h
//  MingTest
//
//  Created by Ming on 2018/11/13.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DNAlertOperation.h"
NS_ASSUME_NONNULL_BEGIN

@interface DNAlertOperationQueue : NSObject

@property (readonly, copy) NSArray<__kindof DNAlertOperation *> *operations;

- (void)addOperation:(DNAlertOperation *)op;
- (void)addOperations:(NSArray<DNAlertOperation *> *)ops waitUntilFinished:(BOOL)wait;

- (void)addOperationWithBlock:(void (^)(void))block;

@end

NS_ASSUME_NONNULL_END
