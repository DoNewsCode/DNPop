//
//  DNAlertOperationQueue.m
//  MingTest
//
//  Created by Ming on 2018/11/13.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import "DNAlertOperationQueue.h"

@interface DNAlertOperationQueue ()

@property (atomic, strong) NSMutableArray<__kindof DNAlertOperation *> *alertOperations;
@property(atomic, strong) DNAlertOperation *currentAlertOperation;
@end

@implementation DNAlertOperationQueue
#pragma mark - Override Methods

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Intial Methods

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSMutableArray<DNAlertOperation *> *alertOperations = [NSMutableArray<DNAlertOperation *> array];
        _alertOperations = alertOperations;
    }
    return self;
}

#pragma mark - Event Methods
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if([keyPath isEqualToString:@"finished"]) {
        id newIsFinished = [change valueForKey:NSKeyValueChangeNewKey];
        id oldIsFinished = [change valueForKey:NSKeyValueChangeOldKey];
        if ((BOOL)newIsFinished == YES && (BOOL)oldIsFinished == NO) {
            if (self.currentAlertOperation == object) {
                self.currentAlertOperation = nil;
            }
            [self.alertOperations removeObject:(DNAlertOperation *)object];
            [object removeObserver:self forKeyPath:@"finished" context:nil];
            [self start];
        }
    }
    if ([keyPath isEqualToString:@"executing"]){
        DNAlertOperation *op = (DNAlertOperation *)object;
        if (op.isExecuting == YES) {
            return;
        }
        [object removeObserver:self forKeyPath:@"executing" context:nil];
        [self start];
    }
}
#pragma mark - Public Methods
- (void)addOperation:(DNAlertOperation *)op {
    if (op == nil) {
        return;
    }
    [self.alertOperations addObject:op];
    if (self.alertOperations.count > 1 && self.currentAlertOperation) {//当前无正在展示的Alert
        [self bubbleSort:self.alertOperations];
        if (op.priority > self.currentAlertOperation.priority) {
            [self.currentAlertOperation removeObserver:self forKeyPath:@"finished" context:nil];
            [self.currentAlertOperation addObserver:self forKeyPath:@"executing" options:NSKeyValueObservingOptionNew context:nil];
            [self.currentAlertOperation cancel];
        }
        
        return;
    }
    
    [self start];
}

- (void)addOperations:(NSArray<DNAlertOperation *> *)ops waitUntilFinished:(BOOL)wait {
    
}

- (void)addOperationWithBlock:(void (^)(void))block {
    
}

#pragma mark - Private Methods
- (void)start {
    if (self.alertOperations.count < 1) {
        return;
    }
    
    DNAlertOperation *alertOperation = self.alertOperations.firstObject;
    self.currentAlertOperation = alertOperation;
    [alertOperation start];
    [alertOperation addObserver:self forKeyPath:@"finished" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)bubbleSort:(NSMutableArray<DNAlertOperation *> *)mutableArray {
    if(mutableArray == nil || mutableArray.count == 0) {
        return;
    }
    //由大到小
    for (NSInteger i = 0; i < mutableArray.count; i++) {
        for (NSInteger j = mutableArray.count - i - 1; j > 0; j--) {
            if (mutableArray[j - 1].priority < mutableArray[j].priority) {
                [mutableArray exchangeObjectAtIndex:j withObjectAtIndex:(j - 1)];
            }
        }
    }
}

#pragma mark - Setter

#pragma mark - Getter

@end
