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
#import "ChoseAreaViewController.h"//选择地区
#import "MessageViewController.h"//消息
#import "SaoViewController.h"//扫一扫
#import "GiftViewController.h"//精品项目
#import "NearViewController.h"//附近场馆
#import "CouponViewController.h"//优惠活动
#import "ShopViewController.h"//推荐店铺
#import "GistViewController.h"//附近手艺人
#import "CityListViewController.h"

@interface HomeViewController : UIViewController<UIScrollViewDelegate,UITextFieldDelegate,UITableViewDataSource, UITableViewDelegate,CityListViewDelegate>{
  
    UIScrollView *containerView;//滚动视图
}


@end
