//
//  RealView.h
//  JmhShipper
//
//  Created by dingwei on 2017/3/17.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>



//选择类型
typedef NS_ENUM (NSInteger, RealType){
    RealTypeName                = 0, //实名
    RealTypeZiZhi               = 1 //资质认证
};
@interface RealView : UIView
/**
 * 选择认证类型
 */
typedef void(^RealTypeActionBlock)(RealType realType);

@property (nonatomic ,strong) RealTypeActionBlock  realTypeActionBlock;

@property (weak, nonatomic) IBOutlet UIImageView *realNameImg;
@property (weak, nonatomic) IBOutlet UILabel *realNameStatusLable;

@property (weak, nonatomic) IBOutlet UIImageView *ziZhiImg;
@property (weak, nonatomic) IBOutlet UILabel *ziZhiStatusLable;

@property (weak, nonatomic) IBOutlet UIView *renameView;
@property (weak, nonatomic) IBOutlet UIView *zizhiView;


-(void)show;

-(void)dismiss;

@end

