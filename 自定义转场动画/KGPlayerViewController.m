//
//  KGPlayerViewController.m
//  自定义转场动画
//
//  Created by admin on 16/8/9.
//  Copyright © 2016年 LaiCunBa. All rights reserved.
//

#import "KGPlayerViewController.h"

@interface KGPlayerViewController ()

@end

@implementation KGPlayerViewController

- (void)loadView
{
    self.view = [UIView new];
    self.view.layer.anchorPoint = CGPointMake(0.5, 2.0);
    self.view.frame = [UIScreen mainScreen].bounds;
    self.view.backgroundColor = [UIColor orangeColor];
    
    //添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.view addGestureRecognizer:pan];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    navBarView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
    [self.view addSubview:navBarView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(10, 20, 44, 44);
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [navBarView addSubview:btn];

}

- (void)backAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)panAction:(UIPanGestureRecognizer *)sender
{
    //x坐标的偏移量
    CGFloat offsetX = [sender translationInView:self.view].x;
    
    //占整个屏幕的比例
    CGFloat percentage = offsetX / self.view.frame.size.width;
    
    CGFloat angle = M_PI_4;
    CGFloat a = cosf(percentage * angle);
    CGFloat b = sinf(percentage * angle);
    CGFloat c = -sinf(percentage * angle);
    CGFloat d = cosf(percentage * angle);
    CGAffineTransform trans = CGAffineTransformMake(a, b, c, d, 0, 0);
    
    //设置旋转角度
    sender.view.transform = trans;
    
    //当手势取消或结束时
    if (sender.state == UIGestureRecognizerStateEnded || sender.state == UIGestureRecognizerStateCancelled) {
        //因为 a 和 d 基本没变化，而 c 又是负值，所以用 b 判断
        if (ABS(trans.b) < 0.2) {
            [UIView animateWithDuration:0.3 animations:^{
                sender.view.transform = CGAffineTransformIdentity;
            }];
        } else {
            
            [UIView animateWithDuration:0.3 animations:^{
                sender.view.transform = trans.b > 0 ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformMakeRotation(-M_PI_2);
            } completion:^(BOOL finished) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }];
        }
        
    }
    
    
    
    NSLog(@"x = %f, a = %f, b = %f, c = %f, d = %f", offsetX, trans.a, trans.b, trans.c, trans.d);
    
}


@end
