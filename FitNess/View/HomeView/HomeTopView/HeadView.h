//
//  HeadView.h
//  FitNess
//
//  Created by xuqq on 2017/3/17.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "FunctionView.h"
#import "ZYJHeadLineView.h"
#import "ZYJHeadLineModel.h"

@interface HeadView : UIView<SDCycleScrollViewDelegate>{
    SDCycleScrollView *scrollView1;//广告滚动
    NSArray *_imageArray;
    
}
@property(nonatomic,strong)NSMutableArray*dataArr;
@property (nonatomic,strong) ZYJHeadLineView *TopLineView;
@end
