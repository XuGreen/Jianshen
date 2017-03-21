//
//  MeTopView.h
//  FitNess
//
//  Created by xuqq on 2017/3/21.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeTopView : UIView
@property(nonatomic,strong)UIImageView *personImage;
@property(nonatomic,strong)UILabel          *personName;
@property(nonatomic,strong)UILabel          *gradeLabel;
@property(nonatomic,strong)UIView            *levelView;
@property(nonatomic,strong)UILabel          *levelLabel;
@property (nonatomic, strong)  UIView        *TopView;//头部视图
@property (nonatomic,strong)   UIView        *starsView;//星星视图
@end
