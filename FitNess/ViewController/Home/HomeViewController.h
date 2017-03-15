//
//  HomeViewController.h
//  FitNess
//
//  Created by xuqq on 2017/3/14.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"

@interface HomeViewController : UIViewController<SDCycleScrollViewDelegate>{
    SDCycleScrollView *scrollView1;//滚动视图
    NSArray *_imageArray;
}


@end
