//
//  DNAlertOperation.m
//  MingTest
//
//  Created by Ming on 2018/11/13.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import "DNAlertOperation.h"

@interface DNAlertOperation ()

@property (assign) BOOL executing;
@property (assign) BOOL finished;
@property (assign) BOOL concurrent; // To be deprecated; use and override 'asynchronous' below
@property (assign) BOOL asynchronous;
@property (assign) BOOL ready;

@end

@implementation DNAlertOperation

- (instancetype)initWithFromViewController:(UIViewController *)fromViewController toViewController:(DNCustomAlertController *)toViewController
{
    self = [super init];
    if (self) {
        self.fromViewController = fromViewController;
        self.toViewController = toViewController;
        self.priority = DNAlertOperationQueuePriorityNormal;
        self.finished = YES;
    }
    return self;
}

- (void)start {
    [self main];
}

- (void)main {
    if (self.fromViewController && self.toViewController) {
        self.ready = YES;
    }
    
    self.executing = YES;
    self.finished = NO;
    [self.fromViewController presentViewController:self.toViewController animated:YES completion:^{
        
        self.executing = NO;
    }];
    
    [self.toViewController returnHandler:^(DNCustomAlertController * _Nonnull alertController) {
        self.finished = YES;
        if (self.isExecuting) {
        }
    }];
}

- (void)cancel {
    self.executing = YES;
    [self.toViewController dismissViewControllerAnimated:YES completion:^{
        self.executing = NO;
    }];
    
}

@end
