//
//  DNCustomAlertBaseView.m
//  A9VG
//
//  Created by Ming on 2018/11/7.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import "DNCustomAlertBaseView.h"
//#import "DNCustomAlertShareItem.h"
//#import "DNCustomAlertForumPageItem.h"
@interface DNCustomAlertBaseView ()

@property (nonatomic, strong) NSArray<DNCustomAlertBaseItem *> *alertItems;

@property (nonatomic, strong) NSArray<DNCustomAlertAction *> *alertActions;
@property (nonatomic, strong) NSMutableArray<DNCustomAlertBaseItem *> *customAlertItems;
@property (nonatomic, strong) NSMutableArray<DNCustomAlertAction *> *customAlertActions;

@end

@implementation DNCustomAlertBaseView

#pragma mark - Override Methods
- (instancetype)initWithAlertActions:(NSArray<DNCustomAlertAction *> *)alertActions {
    CGRect screenRect = [UIApplication sharedApplication].keyWindow.frame;
    self = [super initWithFrame:(CGRect){0.,0.,screenRect.size.width,screenRect.size.height - 300.}];
    if (self) {
        self.alertActions = alertActions;
        [self initialize];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutBaseCustomSubviews];
}

#pragma mark - Public Methods

#pragma mark - Private Methods
- (void)initialize {
    self.backgroundColor = [UIColor blueColor];

    [self.alertActions enumerateObjectsUsingBlock:^(DNCustomAlertAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DNCustomAlertBaseItem *alertBaseItem = [self createAlertItemWith:obj];
        [self addSubview:alertBaseItem];
        [self.customAlertItems addObject:alertBaseItem];
        
    }];
    
    self.alertItems = self.customAlertItems.copy;
}

- (DNCustomAlertBaseItem *)createAlertItemWith:(DNCustomAlertAction *)alertAction {
    if (alertAction.style == DNCustomAlertActionStyleCustom){
        
    }else {
        DNCustomAlertItem *customAlertItem = [[DNCustomAlertItem alloc] initWithAlertAction:alertAction];
        return customAlertItem;
    }
    DNCustomAlertItem *customAlertItem = [[DNCustomAlertItem alloc] initWithAlertAction:alertAction];
    return customAlertItem;
}

- (void)layoutBaseCustomSubviews {
    
}

#pragma mark - Setter

#pragma mark - Getter
- (NSMutableArray<DNCustomAlertBaseItem *> *)customAlertItems {
    if (!_customAlertItems) {
        NSMutableArray<DNCustomAlertBaseItem *> *customAlertItems = [NSMutableArray new];
        _customAlertItems = customAlertItems;
    }
    return _customAlertItems;
}
@end
