//
//  PrefixHeader.h
//  FitNess
//
//  Created by xuqq on 2017/3/14.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#ifndef PrefixHeader_h
#define PrefixHeader_h

#import "Notification.h"
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
#import "NSString+MD5.h"
#import <AFNetworking.h>
#import "BaseResponse.h"
#import "NetWorkManager.h"
#import "MyView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "TMMuiLazyScrollView.h"

/**获取设备屏幕的宽高***/
#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define wight(w) ((w *[UIScreen mainScreen].bounds.size.width)/750.0f)
#define hight(h) ((h* [UIScreen mainScreen].bounds.size.height)/1334.0f)


/*** 日志 ***/
#ifdef DEBUG
#define XQQLog(...) NSLog(__VA_ARGS__)
#else
#define XQQLog(...)
#endif

#define XQQLogFunc XQQLog(@"%s", __func__);
/*** 颜色 ***/
#define XQQColorA(_R, _G, _B) [UIColor colorWithRed:_R/255.0 green:_G/255.0 blue:_B/255.0 alpha:1.0F]
#define XQQColorRGB(_R, _G, _B,_A) [UIColor colorWithRed:_R/255.0 green:_G/255.0 blue:_B/255.0 alpha:_A]
#define  NavColor [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0]
#define  COMMONRBGCOLOR [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0]
#define  LINECOLOR [UIColor colorWithRed:222.0/255 green:223.0/255 blue:224.0/255 alpha:0.5f]
#define  MAINCOLOR [UIColor colorWithRed:255/255.0 green:184/255.0 blue:31/255.0 alpha:1.0]

#define weakSelf(type) __weak typeof(type) weak##type = self

#endif /* PrefixHeader_h */
