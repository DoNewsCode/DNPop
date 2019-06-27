//
//  DNCustomAlertActionSheetView.m
//  A9VG
//
//  Created by Ming on 2018/11/7.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import "DNCustomAlertActionSheetView.h"
//#import "DNColorManager.h"

@implementation DNCustomAlertActionSheetView

#pragma mark - Override Methods
- (instancetype)initWithAlertActions:(NSArray<DNCustomAlertAction *> *)alertActions {
    self = [super initWithAlertActions:alertActions];
    if (self) {
        [self createContent];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
//    [self layoutCustomSubviews];
}

#pragma mark - Intial Methods

#pragma mark - Public Methods

#pragma mark - Private Methods
- (void)createContent {
    if (self.alertItems == nil || self.alertItems.count == 0) {
        return;
    }
    
    self.backgroundColor = [UIColor whiteColor];
    
    [self layoutCustomSubviews];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(20, 20)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
}

- (void)layoutCustomSubviews {
    CGFloat horizontalSpacing = 15.;
    CGFloat verticalVSpacing = 10.;
    CGFloat previousItemMaxY = verticalVSpacing;
    CGFloat previousLineHeight = 1.;
    
    for (NSInteger idx = 0; idx < self.alertItems.count; idx ++) {
        DNCustomAlertBaseItem *obj = self.alertItems[idx];
        CGFloat lineHeight = 1.;
        CGFloat lineX = 15.;
        if (idx == (self.alertItems.count - 2)) {
            lineHeight = 10.;
            lineX = 0.;
        }
        CGFloat itemX = horizontalSpacing;
        CGFloat lineWidth = self.frame.size.width - lineX * 2;
        CGFloat itemY = idx * verticalVSpacing + previousItemMaxY;
        CGFloat itemWidth = self.frame.size.width - horizontalSpacing * 2;
        CGFloat itemHeight = obj.frame.size.height;
        previousItemMaxY += (itemHeight + ((idx + 1) * verticalVSpacing));
        if (idx == (self.alertItems.count - 2)) {
            previousLineHeight = 10.;
        }
       if (idx < (self.alertItems.count - 1)) {
            CALayer *line = [CALayer new];
            line.backgroundColor = [UIColor grayColor].CGColor;
           
            line.frame = (CGRect){lineX,previousItemMaxY,lineWidth,lineHeight};
            [self.layer addSublayer:line];
           previousItemMaxY += lineHeight;
        }
        obj.frame = (CGRect){itemX,itemY,itemWidth,itemHeight};
    }
    
    CGFloat safeHeight = 34.;
    BOOL needSafeHeight = [self analyzeWhetherNeedSafeHeight];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = previousItemMaxY + ( needSafeHeight ? safeHeight : 0);
    self.frame = (CGRect){0.,0.,width,height};
}

- (BOOL)analyzeWhetherNeedSafeHeight {
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if (screenHeight == 812. ||screenHeight == 896.) {
        return YES;
    }
    return NO;
}
#pragma mark - Setter

#pragma mark - Getter

@end
