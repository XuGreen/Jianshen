//
//  HomeViewController.h
//  FitNess
//
//  Created by xuqq on 2017/3/14.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UINavigationBar+Awesome.h"
#import "HeadView.h"
#import "GiftwareViewCell.h"
#import "NearbyViewCell.h"
#import "CouponViewCell.h"
#import "ShopViewCell.h"
#import "EveryDayViewCell.h"
#import "HomeViewTableFootView.h"
#import "SearchViewController.h"//搜索

@interface HomeViewController : UIViewController<UIScrollViewDelegate,UITextFieldDelegate,UITableViewDataSource, UITableViewDelegate>{
  
    UIScrollView *containerView;//滚动视图
}


@end
