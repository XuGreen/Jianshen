//
//  PrefixHeader.h
//  FitNess
//
//  Created by xuqq on 2017/3/14.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#ifndef PrefixHeader_h
#define PrefixHeader_h


#import "UIViewController+BackVC.h"
#import "TouchUIView.h"
#import "UIView+EXTention.h"
#import "UIButton+ImageTitleSpacing.h"
#import "ServiceAPI.h"
#import "tools.h"
#import "NavViewController.h"
#import "MBProgressHUD+Show.h"
#import "MBProgressHUD.h"
#import "HttpUnits.h"
#import <Masonry/Masonry.h>

/**获取设备屏幕的宽高***/
#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
/*** 日志 ***/
#ifdef DEBUG
#define XQQLog(...) NSLog(__VA_ARGS__)
#else
#define XQQLog(...)
#endif

#define XQQLogFunc XQQLog(@"%s", __func__);
/*** 颜色 ***/
#define XQQColorA(_R, _G, _B) [UIColor colorWithRed:_R/255.0 green:_G/255.0 blue:_B/255.0 alpha:1.0F]
#define  NavColor [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0]
#define  COMMONRBGCOLOR [UIColor colorWithRed:0.941 green:0.945 blue:0.945 alpha:1.000]
#define  LINECOLOR [UIColor colorWithRed:222.0/255 green:223.0/255 blue:224.0/255 alpha:0.5f]

#endif /* PrefixHeader_h */