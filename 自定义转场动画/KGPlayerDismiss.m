//
//  KGPlayerDismiss.m
//  自定义转场动画
//
//  Created by admin on 16/8/9.
//  Copyright © 2016年 LaiCunBa. All rights reserved.
//

#import "KGPlayerDismiss.h"

@implementation KGPlayerDismiss

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //拿到当前view
    UIView *currentView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        currentView.transform = currentView.transform.b > 0 ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformMakeRotation(-M_PI_2);
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
        
    }];
    
    
    
}

@end
