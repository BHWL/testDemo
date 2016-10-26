//
//  ViewController.m
//  GitDemo
//
//  Created by 安信 on 16/10/24.
//  Copyright © 2016年 com.xy. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UIGestureRecognizerDelegate>{
    UIImageView *showImgView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    showImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
    [showImgView setMultipleTouchEnabled:YES];
    [showImgView setUserInteractionEnabled:YES];
    [showImgView setImage:[UIImage imageNamed:@"test2.jpg"]];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    oldFrame = showImgView.frame;
    largeFrame = CGRectMake(0 - screenSize.width, 0 - screenSize.height, 3 * oldFrame.size.width, 3 * oldFrame.size.height);
    
    [self addGestureRecognizerToView:showImgView];
    [self.view addSubview:showImgView];
    
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];
//    imageView.image = [UIImage imageNamed:@""];
//    [self.view addSubview:imageView];
//    
//    
////    [self addGestureRecognizerToView:view];  
// 
//    //如果处理的是图片，别忘了
//    [imageView setUserInteractionEnabled:YES];
//    [imageView setMultipleTouchEnabled:YES];
}

// 添加所有的手势
- (void) addGestureRecognizerToView:(UIView *)view{
    // 旋转手势
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateView:)];
    [view addGestureRecognizer:rotationGestureRecognizer];
    
    // 缩放手势
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    [view addGestureRecognizer:pinchGestureRecognizer];
    
    // 移动手势
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    [view addGestureRecognizer:panGestureRecognizer];
}

// 处理旋转手势
- (void) rotateView:(UIRotationGestureRecognizer *)rotationGestureRecognizer{
    UIView *view = rotationGestureRecognizer.view;
    if (rotationGestureRecognizer.state == UIGestureRecognizerStateBegan || rotationGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformRotate(view.transform, rotationGestureRecognizer.rotation);
        [rotationGestureRecognizer setRotation:0];
    }
}

//// 处理缩放手势
//- (void) pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer{
//    UIView *view = pinchGestureRecognizer.view;
//    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
//        view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
//        pinchGestureRecognizer.scale = 1;
//    }
//}

// 处理拖拉手势
- (void) panView:(UIPanGestureRecognizer *)panGestureRecognizer{
    UIView *view = panGestureRecognizer.view;
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [panGestureRecognizer translationInView:view.superview];
        [view setCenter:(CGPoint){view.center.x + translation.x, view.center.y + translation.y}];
        [panGestureRecognizer setTranslation:CGPointZero inView:view.superview];
    }
}

// 处理缩放手势
- (void) pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer{
    UIView *view = pinchGestureRecognizer.view;
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
        if (showImgView.frame.size.width < oldFrame.size.width) {
            showImgView.frame = oldFrame;
            //让图片无法缩得比原图小
        }
        if (showImgView.frame.size.width > 3 * oldFrame.size.width) {
            showImgView.frame = largeFrame;
        }
        pinchGestureRecognizer.scale = 1;
    }
}
@end
