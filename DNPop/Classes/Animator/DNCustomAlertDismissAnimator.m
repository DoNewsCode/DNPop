//
//  DNCustomAlertDismissAnimator.m
//  MingTest
//
//  Created by Ming on 2018/11/7.
//  Copyright © 2018 DoNews. All rights reserved.
//

#import "DNCustomAlertDismissAnimator.h"
#import "DNCustomAlertController.h"

@implementation DNCustomAlertDismissAnimator

#pragma mark - UIViewControllerAnimatedTransitioning  Methods
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.style) {
        case DNCustomAlertDismissStyleFadeOut:
            [self fadeOutAnimationWithContext:transitionContext];
            break;
        case DNCustomAlertDismissStyleContractHorizontal:
            [self contractHorizontalAnimationWithContext:transitionContext];
            break;
        case DNCustomAlertDismissStyleContractVertical:
            [self contractVerticalAnimationWithContext:transitionContext];
            break;
        case DNCustomAlertDismissStyleSlideDown:
            [self slideDownAnimationWithContext:transitionContext];
            break;
        case DNCustomAlertDismissStyleSlideUp:
            [self slideUpAnimationWithContext:transitionContext];
            break;
        case DNCustomAlertDismissStyleSlideLeft:
            [self slideLeftAnimationWithContext:transitionContext];
            break;
        case DNCustomAlertDismissStyleSlideRight:
            [self slideRightAnimationWithContext:transitionContext];
            break;
    }
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.style) {
        case DNCustomAlertDismissStyleFadeOut:
            return 0.15;
        case DNCustomAlertDismissStyleContractHorizontal:
            return 0.2;
        case DNCustomAlertDismissStyleContractVertical:
            return 0.2;
        case DNCustomAlertDismissStyleSlideDown:
            return 0.25;
        case DNCustomAlertDismissStyleSlideUp:
            return 0.25;
        case DNCustomAlertDismissStyleSlideLeft:
            return 0.2;
        case DNCustomAlertDismissStyleSlideRight:
            return 0.2;
    }
}

- (void)fadeOutAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.view.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)contractHorizontalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DNCustomAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.alertView.transform = CGAffineTransformMakeScale(0.001, 1);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)contractVerticalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DNCustomAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.alertView.transform = CGAffineTransformMakeScale(1, 0.01);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideDownAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DNCustomAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.alertView.center = CGPointMake(fromVC.view.center.x, fromVC.view.frame.size.height + fromVC.alertView.frame.size.height/2.0);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideUpAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DNCustomAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.alertView.center = CGPointMake(fromVC.view.center.x, -fromVC.alertView.frame.size.height/2.0);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideLeftAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DNCustomAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.alertView.center = CGPointMake(-fromVC.alertView.frame.size.width/2.0, fromVC.view.center.y);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideRightAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    DNCustomAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.alertView.center = CGPointMake(fromVC.view.frame.size.width + fromVC.alertView.frame.size.width/2.0, fromVC.view.center.y);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}
@end
