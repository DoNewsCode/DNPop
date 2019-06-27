//
//  DNCustomAlertBaseItem.m
//  MingTest
//
//  Created by Ming on 2018/11/12.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import "DNCustomAlertBaseItem.h"
//#import "DNColorManager.h"
//#import "UIView+DNResponder.h"
@interface DNCustomAlertBaseItem ()

@property (nonatomic, assign) DNCustomAlertItemStyle preferredStyle;
@property (nonatomic, strong) NSArray<UIButton *> *buttons;

@end

@implementation DNCustomAlertBaseItem
#pragma mark - Override Methods
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

#pragma mark - Intial Methods

- (instancetype)initWithAlertAction:(DNCustomAlertAction *)alertAction {
    CGRect windowFrame = [UIApplication sharedApplication].keyWindow.frame;
    CGRect frame = (CGRect){0.,0.,windowFrame.size.width - 30.,42.};
    self = [self initWithFrame:frame alertAction:alertAction];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame alertAction:(DNCustomAlertAction *)alertAction {
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selfDidClick:)];
        [self.titleLabel addGestureRecognizer:tapGesture];
        self.alertAction = alertAction;
        [self createContent];
    }
    return self;
}

#pragma mark - Event Methods
- (void)selfDidClick:(id)sender{
    [self hideAlertView];
}

- (void)hideAlertView{
    
}

#pragma mark - Public Methods
- (void)addButtons:(NSArray<UIButton *> *)buttons {
    self.buttons = buttons;
}

#pragma mark - Private Methods
- (void)createContent {
    switch (self.alertAction.style) {
        case DNCustomAlertActionStyleCustom:
            
            self.preferredStyle = DNCustomAlertItemStyleCustom;
            break;
       
        case DNCustomAlertActionStyleCancel:
            self.titleLabel.textColor = [UIColor redColor];
            break;
        default:
            
            self.preferredStyle = DNCustomAlertItemStyleText;
            [self addSubview:self.titleLabel];
            self.titleLabel.text = self.alertAction.title;
            break;
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.preferredStyle == DNCustomAlertItemStyleText) {
        self.titleLabel.frame = self.bounds;
    } else if (self.preferredStyle == DNCustomAlertItemStyleButton) {
        
    }
}

#pragma mark - Setter

#pragma mark - Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *titleLabel = [UILabel new];
        titleLabel.font = [UIFont systemFontOfSize:16.];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.backgroundColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.userInteractionEnabled = YES;
        titleLabel.numberOfLines = 0;
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

#pragma mark - NSCopying

#pragma mark - NSObject  Methods

@end
