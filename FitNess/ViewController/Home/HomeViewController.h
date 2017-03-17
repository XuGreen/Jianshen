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
#import "BoutiqueViewCell.h"
#import "NearbyViewCell.h"
#import "CouponViewCell.h"
#import "ShopViewCell.h"
#import "EveryDayViewCell.h"
#import "CollectionReusableHeadView.h"
#import "CollectionBottomViewCell.h"

@interface HomeViewController : UIViewController<UIScrollViewDelegate,UITextFieldDelegate,UITableViewDataSource, UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>{
  
    UIScrollView *containerView;//滚动视图
}


@end
