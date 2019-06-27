//
//  DNCustomAlertView.m
//  MingTest
//
//  Created by Ming on 2018/11/9.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import "DNCustomAlertView.h"

@implementation DNCustomAlertView

#pragma mark - Override Methods
- (instancetype)initWithAlertActions:(NSArray<DNCustomAlertAction *> *)alertActions {
    self = [super initWithAlertActions:alertActions];
    if (self) {
        [self initialize];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutCustomSubviews];
}

#pragma mark - Intial Methods

#pragma mark - Public Methods

#pragma mark - Private Methods
- (void)initialize {
    self.backgroundColor = [UIColor yellowColor];
}

- (void)layoutCustomSubviews {
    
}
#pragma mark - Setter

#pragma mark - Getter

@end
