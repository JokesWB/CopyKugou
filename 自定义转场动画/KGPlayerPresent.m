//
//  KGPlayerPresent.m
//  自定义转场动画
//
//  Created by admin on 16/8/9.
//  Copyright © 2016年 LaiCunBa. All rights reserved.
//

#import "KGPlayerPresent.h"

@implementation KGPlayerPresent

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //拿到容器view
    UIView *contentView = [transitionContext containerView];
    
    //拿到当前view
    UIView *currentView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    //把当前view加到容器view
    [contentView addSubview:currentView];
    
    currentView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        currentView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
        
    }];
}


@end
