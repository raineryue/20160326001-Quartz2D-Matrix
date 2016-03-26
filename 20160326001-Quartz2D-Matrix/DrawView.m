//
//  DrawView.m
//  20160326001-Quartz2D-Matrix
//
//  Created by Rainer on 16/3/26.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // 1.获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 1.1.保存当前上下文状态
    CGContextSaveGState(context);
    
    // 2.创建并描述路径:画一个椭圆
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-100, -50, 200, 100)];
    
    // 2.1.设置上下文状态
    [[UIColor redColor] set];
    
    // 2.2.对上下文进行矩阵操作（注意：矩阵操作必须要放在添加路径之前）
    // 位移操作：x移动到100，y移动到100
    CGContextTranslateCTM(context, 100, 100);
    
    // 缩放操作:宽缩小0.5倍，高放大1.3倍
    CGContextScaleCTM(context, 0.5, 1.3);
    
    // 旋转操作:45度角
    CGContextRotateCTM(context, M_PI_4);
    
    // 3.将路径添加到当前上下文中
    CGContextAddPath(context, bezierPath.CGPath);
    
    // 4.渲染上下文
    CGContextFillPath(context);
}


@end
