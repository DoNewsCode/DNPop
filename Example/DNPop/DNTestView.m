//
//  DNTestView.m
//  DNPop_Example
//
//  Created by 陈金铭 on 2019/7/2.
//  Copyright © 2019 陈金铭. All rights reserved.
//

#import "DNTestView.h"

@implementation DNTestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization {
    
    [self createContent];
}

- (void)createContent {
    UIButton *buttonOne = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonOne.frame = CGRectMake(10, 10, 50, 50);
    buttonOne.backgroundColor = [UIColor redColor];
    [buttonOne setTitle:@"buttonOne" forState:UIControlStateNormal];
    [buttonOne addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buttonOne];
    UIButton *buttonTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonTwo.frame = CGRectMake(80, 10, 50, 50);
    buttonTwo.backgroundColor = [UIColor redColor];
    [buttonTwo setTitle:@"buttonTwo" forState:UIControlStateNormal];
    [buttonTwo addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buttonTwo];
    self.frame = CGRectMake(0, 0, 300, 300);
    self.backgroundColor = [UIColor greenColor];
}


- (void)buttonClick:(UIButton *)button {
    if (self.handler) {
        self.handler(button);
    }
}

-(void)returnHandler:(void (^)(UIButton * _Nonnull))handler {
    self.handler = handler;
}
@end
