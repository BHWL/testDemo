//
//  ViewController.m
//  GitDemo
//
//  Created by 安信 on 16/10/24.
//  Copyright © 2016年 com.xy. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "AppDelegate.h"


@interface ViewController ()<UIGestureRecognizerDelegate>{
    UIImageView *showImgView;
    UIView *viewBG;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    showImgView = [[UIImageView alloc] initWithFrame:CGRectMake1(0,0, 320, 480)];
//    [showImgView setMultipleTouchEnabled:YES];
//    [showImgView setUserInteractionEnabled:YES];
//    [showImgView setImage:[UIImage imageNamed:@"test2.jpg"]];
//    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
//
//    oldFrame = showImgView.frame;
    largeFrame = CGRectMake(0 - screenSize.width, 0 - screenSize.height, 3 * oldFrame.size.width, 3 * oldFrame.size.height);
//
//    [self addGestureRecognizerToView:showImgView];
//    [self.view addSubview:showImgView];
    
    NSLog(@"111");
    
    viewBG = [[UIView alloc]init];
    viewBG.backgroundColor = [UIColor grayColor];
    [self.view addSubview:viewBG];
    [viewBG mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    
    oldFrame = viewBG.frame;
    [self addGestureRecognizerToView:viewBG];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"test2.jpg"];
    [viewBG addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewBG).offset(50);
        make.left.equalTo(viewBG);
        make.size.mas_equalTo(CGSizeMake1(50, 50));
    }];
    
    UIImageView *imageView5 = [[UIImageView alloc]init];
    imageView5.image = [UIImage imageNamed:@"test2.jpg"];
    [viewBG addSubview:imageView5];
    [imageView5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom);
        make.left.equalTo(viewBG).offset(50);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    UIImageView *imageView51 = [[UIImageView alloc]init];
    imageView51.image = [UIImage imageNamed:@"test2.jpg"];
    [viewBG addSubview:imageView51];
    [imageView51 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView5.mas_bottom);
        make.left.equalTo(viewBG).offset(50);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.height.mas_equalTo(50);
    }];
//
//    
////    [self addGestureRecognizerToView:view];  
// 
//    //如果处理的是图片，别忘了
//    [imageView setUserInteractionEnabled:YES];
//    [imageView setMultipleTouchEnabled:YES];
}

//创建内联函数 (在程序编译的时候执行,在函数前声明后编译器执行起来更具效率，使宏的定义更节省，不涉及栈的操作)
//CG_INLINE CGRect
//CGRectMake1(CGFloat x,CGFloat y,CGFloat width,CGFloat height){
//    //创建appDelegate 在这不会产生类的对象,(不存在引起循环引用的问题)
//    AppDelegate *app = [UIApplication sharedApplication].delegate;
//    
//    //计算返回
//    return CGRectMake(x * app.autoSizeScaleX, y * app.autoSizeScaleY, width * app.autoSizeScaleX, height * app.autoSizeScaleY);
//}

CG_INLINE CGSize
CGSizeMake1(CGFloat width,CGFloat height){
    //创建appDelegate 在这不会产生类的对象,(不存在引起循环引用的问题)
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    //计算返回
    return CGSizeMake(width * app.autoSizeScaleX, height * app.autoSizeScaleY);
}

//CG_INLINE CGFloat
//offset1(CGFloat size){
//    //创建appDelegate 在这不会产生类的对象,(不存在引起循环引用的问题)
//    AppDelegate *app = [UIApplication sharedApplication].delegate;
//    
//    //计算返回
//    return size * app.autoSizeScaleX;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


// 添加所有的手势
- (void) addGestureRecognizerToView:(UIView *)view{
    // 旋转手势
//    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateView:)];
//    [view addGestureRecognizer:rotationGestureRecognizer];
    
    // 缩放手势
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    [view addGestureRecognizer:pinchGestureRecognizer];
    
    // 移动手势
//    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
//    [view addGestureRecognizer:panGestureRecognizer];
}

//// 处理旋转手势
//- (void) rotateView:(UIRotationGestureRecognizer *)rotationGestureRecognizer{
//    UIView *view = rotationGestureRecognizer.view;
//    if (rotationGestureRecognizer.state == UIGestureRecognizerStateBegan || rotationGestureRecognizer.state == UIGestureRecognizerStateChanged) {
//        view.transform = CGAffineTransformRotate(view.transform, rotationGestureRecognizer.rotation);
//        [rotationGestureRecognizer setRotation:0];
//    }
//}
//
////// 处理缩放手势
////- (void) pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer{
////    UIView *view = pinchGestureRecognizer.view;
////    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
////        view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
////        pinchGestureRecognizer.scale = 1;
////    }
////}
//
//// 处理拖拉手势
//- (void) panView:(UIPanGestureRecognizer *)panGestureRecognizer{
//    UIView *view = panGestureRecognizer.view;
//    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
//        CGPoint translation = [panGestureRecognizer translationInView:view.superview];
//        [view setCenter:(CGPoint){view.center.x + translation.x, view.center.y + translation.y}];
//        [panGestureRecognizer setTranslation:CGPointZero inView:view.superview];
//    }
//}

// 处理缩放手势
- (void) pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer{
    UIView *view = pinchGestureRecognizer.view;
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
        NSLog(@"%f---%f",viewBG.frame.size.width,oldFrame.size.width);
        if (viewBG.frame.size.width < 200) {
            [view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(200, 200));
            }];
            //让图片无法缩得比原图小
        }
//        if (viewBG.frame.size.width > 3 * oldFrame.size.width) {
//            viewBG.frame = largeFrame;
//        }
        pinchGestureRecognizer.scale = 1;
    }
}
@end
