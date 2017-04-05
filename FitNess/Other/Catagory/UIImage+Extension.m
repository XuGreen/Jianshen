//
//  UIImage+Extension.m
//  FitNess
//
//  Created by xuqq on 2017/3/31.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
#pragma mark -按照你想要的比例去缩放图片
- (UIImage *)scaleToWidth:(CGFloat)width{
    // 如果传入的宽度比当前宽度还要大,就直接返回
    
    if (width > self.size.width) {
        
        return  self;
        
    }
    // 计算缩放之后的高度
    
    CGFloat height = (width / self.size.width) * self.size.height;
    
    // 初始化要画的大小
    
    CGRect  rect = CGRectMake(0, 0, width, height);
    
    // 1. 开启图形上下文
    
    UIGraphicsBeginImageContext(rect.size);
    
    // 2. 画到上下文中 (会把当前image里面的所有内容都画到上下文)
    
    [self drawInRect:rect];
    
    // 3. 取到图片
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4. 关闭上下文
    
    UIGraphicsEndImageContext();
    
    // 5. 返回
    
    return image;
}

+ (UIImage *)getScreenImage{
    
    //获取主窗口
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    
    // 1. 开启图形上下文
    
    UIGraphicsBeginImageContext(window.frame.size);
    
    // 2. 将 window 里面的内容画到上下文中
    
    [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:NO];
    
    // 3. 取出图片
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4. 关闭上下文
    
    UIGraphicsEndImageContext();
    
    // 5. 返回数据
    
    return image;
    
}


@end
