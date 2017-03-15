//
//  UIView+EXTention.h
//  百思不得姐
//
//  Created by 徐青清 on 16/8/8.
//  Copyright © 2016年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView (EXTention)
@property (nonatomic, assign) CGFloat xmg_width;
@property (nonatomic, assign) CGFloat xmg_height;
@property (nonatomic, assign) CGFloat xmg_x;
@property (nonatomic, assign) CGFloat xmg_y;
@property (nonatomic, assign) CGFloat xmg_centerX;
@property (nonatomic, assign) CGFloat xmg_centerY;

@property (nonatomic, assign) CGFloat xmg_right;
@property (nonatomic, assign) CGFloat xmg_bottom;
+ (instancetype)viewFromXib;
@end
