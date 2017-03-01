//
//  ViewController.m
//  自定义转场动画
//
//  Created by admin on 16/8/9.
//  Copyright © 2016年 LaiCunBa. All rights reserved.
//

#import "ViewController.h"
#import "KGPlayerViewController.h"
#import "KGPlayerPresent.h"
#import "KGPlayerDismiss.h"


@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(10, 600, 100, 30);
    [btn setTitle:@"显示" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

- (void)showController
{
    KGPlayerViewController *kgVC = [[KGPlayerViewController alloc] init];
    //自定义模式，要设置代理 UIViewControllerTransitioningDelegate
    kgVC.modalPresentationStyle = UIModalPresentationCustom;
    kgVC.transitioningDelegate = self;
    [self presentViewController:kgVC animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate的代理方法
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    //返回一个遵循 UIViewControllerAnimatedTransitioning 代理的id类型的
    KGPlayerPresent *kgPresent = [[KGPlayerPresent alloc] init];
    return kgPresent;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    //返回一个遵循 UIViewControllerAnimatedTransitioning 代理的id类型的
    KGPlayerDismiss *kgDismiss = [[KGPlayerDismiss alloc] init];
    return kgDismiss;
}


@end
