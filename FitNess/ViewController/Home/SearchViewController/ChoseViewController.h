//
//  ChoseViewController.h
//  FitNess
//
//  Created by xuqq on 2017/3/20.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoseViewController : UIViewController
/**实名认证状态**/
@property (nonatomic ,assign) NSInteger   realNameStatus;
/**资质认证状态**/
@property (nonatomic ,assign) NSInteger   realZiZhiStatus;

@property (strong, nonatomic)  UILabel *realNameStatusLable;

@property (strong, nonatomic)  UILabel *ziZhiStatusLable;
-(void)show;

-(void)dismiss;
@end
