//
//  DNCustomAlertController.m
//  A9VG
//
//  Created by Ming on 2018/11/7.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import "DNCustomAlertController.h"
#import "DNCustomAlertPresentAnimator.h"
#import "DNCustomAlertDismissAnimator.h"
#import "DNCustomAlertActionSheetPresentAnimator.h"
#import "DNCustomAlertActionSheetDismissAnimator.h"

#import "DNCustomAlertActionSheetView.h"
//#import "DNCustomAlertShareItem.h"

@interface DNCustomAlertController ()<UIViewControllerTransitioningDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, assign) DNCustomAlertControllerStyle preferredStyle;

/** AlertActionArray */
@property (nonatomic, strong) NSMutableArray<DNCustomAlertAction *> *alertActions;
@property (nonatomic, strong) NSArray<DNCustomAlertAction *> *actions;
@property (nonatomic, strong) DNCustomAlertMainView *mainView;

@end

@implementation DNCustomAlertController
#pragma mark - Intial Methods
+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(DNCustomAlertControllerStyle)preferredStyle {
    DNCustomAlertController *customAlertController = [[DNCustomAlertController alloc] init];
    customAlertController.preferredStyle = preferredStyle;
    return customAlertController;
}

#pragma mark - Override Methods
- (instancetype)init {
    if (self = [super init]) {
        self.transitioningDelegate = self;                          // 设置自己为转场代理
        self.modalPresentationStyle = UIModalPresentationCustom;    // 自定义转场模式
        // 灰色半透明背景
        _backgroundView = [[UIView alloc] init];
        _backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
        _backgroundView.backgroundColor = [UIColor blackColor];
        _backgroundView.alpha = 0.3;
    }
    return self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (touch.view != self.backgroundView) {
        return NO;
    }
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:_backgroundView];
    self.backgroundView.frame = self.view.bounds;
    self.backgroundView.userInteractionEnabled = YES;
    self.view.backgroundColor = [UIColor clearColor];
    [self createAlertView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

#pragma mark - Public Methods
- (void)addAction:(DNCustomAlertAction *)action {
    [self.alertActions addObject:action];
    self.actions = self.alertActions.copy;
}

- (void)addActions:(NSArray<DNCustomAlertAction *> *)actions {
    [self.alertActions addObjectsFromArray:actions];
    self.actions = self.alertActions.copy;
}

- (void)returnHandler:(void (^ __nullable)(DNCustomAlertController *alertController))handler {
    self.handler = handler;
}

#pragma mark - Private Methods
- (void)createAlertView {
    //添加背景手势识别
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(eventBackgrondClick:)];
    tapGesture.delegate = self;
    [self.backgroundView addGestureRecognizer:tapGesture];
    if (self.preferredStyle == DNCustomAlertControllerStyleActionSheet) {
        self.alertView = [[DNCustomAlertActionSheetView alloc] initWithAlertActions:self.actions];
    } else {
        
    }
    
    [self.view addSubview:self.alertView];
    [self createAlertItemActions];
}


- (void)createAlertItemActions {
    DNCustomAlertBaseView *alertView = (DNCustomAlertBaseView *)self.alertView;
    [alertView.alertItems enumerateObjectsUsingBlock:^(DNCustomAlertBaseItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        

    }];
}

#pragma mark - Event Methods
- (void)eventBackgrondClick:(UITapGestureRecognizer *)gesture {
    
    [self createDismissViewControllerWithGesture:nil];
}

- (void)eventActionItemClick:(DNCustomAlertBaseItem *)item {
    [self createDismissViewControllerWithGesture:item];
}

- (void)createDismissViewControllerWithGesture:(DNCustomAlertBaseItem *)item {
    [self dismissViewControllerAnimated:YES completion:^{
        if (self.handler) {
            self.handler(self);
        }
        if (item.alertAction.handler) {
            item.alertAction.handler(item.alertAction);
        } else if (item.alertAction.handlers) {
            item.alertAction.handlers(item.alertAction, item.currentSelectedView);
            
        }
    }];
}

#pragma mark - UIViewControllerTransitioningDelegate Methods
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    if (self.preferredStyle == DNCustomAlertControllerStyleActionSheet) {
        DNCustomAlertActionSheetPresentAnimator *customAlertActionSheetPresentAnimator = [DNCustomAlertActionSheetPresentAnimator new];
        customAlertActionSheetPresentAnimator.style = self.presentStyle;
        return customAlertActionSheetPresentAnimator;
    } else if (self.preferredStyle == DNCustomAlertControllerStyleAlert) {
        
    }
    DNCustomAlertPresentAnimator *customAlertPresentAnimator = [DNCustomAlertPresentAnimator new];
    customAlertPresentAnimator.style = self.presentStyle;
    return customAlertPresentAnimator;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    if (self.preferredStyle == DNCustomAlertControllerStyleActionSheet) {
        DNCustomAlertActionSheetDismissAnimator *customAlertActionSheetDismissAnimator = [DNCustomAlertActionSheetDismissAnimator new];
        customAlertActionSheetDismissAnimator.style = self.dismissStyle;
        return customAlertActionSheetDismissAnimator;
    } else if (self.preferredStyle == DNCustomAlertControllerStyleAlert) {
        
    }
    
    DNCustomAlertDismissAnimator *customAlertDismissAnimator = [DNCustomAlertDismissAnimator new];
    customAlertDismissAnimator.style = self.dismissStyle;
    return customAlertDismissAnimator;
    
}

#pragma mark - Setter

#pragma mark - Getter
- (NSMutableArray<DNCustomAlertAction *> *)alertActions {
    if (!_alertActions) {
        NSMutableArray<DNCustomAlertAction *> *alertActions = [NSMutableArray new];
        _alertActions = alertActions;
    }
    return _alertActions;
}

- (DNCustomAlertMainView *)mainView {
    if (!_mainView) {
        DNCustomAlertMainView *mainView = [DNCustomAlertMainView new];
        _mainView = mainView;
    }
    return _mainView;
}

@end
