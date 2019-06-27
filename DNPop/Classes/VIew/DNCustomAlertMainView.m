//
//  DNCustomAlertMainView.m
//  MingTest
//
//  Created by Ming on 2018/11/12.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import "DNCustomAlertMainView.h"

@implementation DNCustomAlertMainView

#pragma mark - Override Methods
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
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
    self.backgroundColor = [UIColor blueColor];
    [self addSubview:self.backgroundView];
    self.backgroundView.frame = self.bounds;
}

- (void)layoutCustomSubviews {
    
}
#pragma mark - Setter
- (void)setAlertView:(DNCustomAlertBaseView *)alertView {
    _alertView = alertView;
}
#pragma mark - Getter
- (UIView *)backgroundView {
    if (!_backgroundView) {
        UIView *backgroundView = [UIView new];
        backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
        backgroundView.backgroundColor = [UIColor blackColor];
        _backgroundView = backgroundView;
    }
    return _backgroundView;
}
@end
