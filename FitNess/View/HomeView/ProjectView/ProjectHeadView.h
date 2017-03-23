//
//  ProjectHeadView.h
//  FitNess
//
//  Created by xuqq on 2017/3/23.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "PPNumberButton.h"
@interface ProjectHeadView : UIView<SDCycleScrollViewDelegate>{
    SDCycleScrollView *scrollView1;//广告滚动
    NSArray *_imageArray;
}
@property(nonatomic,strong)UILabel *courseName;//课程名称
@property(nonatomic,strong)UILabel *courseDetail;//课程介绍
@property(nonatomic,strong)UIButton *courseCollect;//收藏按钮
@property(nonatomic,strong)UIButton *courseTime;//花费时间
@property(nonatomic,strong)UIButton *courseAstrict;//限制
@property(nonatomic,strong)UIButton *courseStick;//需要限制
@property(nonatomic,strong)UIButton *courseDetailBtn;//查看详情
@property(nonatomic,strong)UILabel   *priceAfter;//打折后价格
@property(nonatomic,strong)UILabel   *priceBefore;//打折后价格
@property(nonatomic,strong)UILabel   *likeNumber;//喜欢人数
@property(nonatomic,strong)UILabel   *buyNumber;//可购买份数
@property(nonatomic,strong)PPNumberButton *numberButton;//添加数量

@end
