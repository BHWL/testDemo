//
//  ViewController.h
//  GitDemo
//
//  Created by 安信 on 16/10/24.
//  Copyright © 2016年 com.xy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>{
    CGFloat lastScale;
    CGRect oldFrame;    //保存图片原来的大小
    CGRect largeFrame;  //确定图片放大最大的程度
}
@end

