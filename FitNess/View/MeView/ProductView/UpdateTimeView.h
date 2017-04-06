//
//  UpdateTimeView.h
//  FitNess
//
//  Created by xuqq on 2017/3/29.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UpdateTimeView : UIView
@property(nonatomic,strong)  UIButton *Restbutton;
@property (copy, nonatomic) void (^done)(NSString *selectedhourStr1,NSString *selectminStr1,NSString *selectedhourStr2,NSString *selectminStr2);

-(instancetype)initWithFrame:(CGRect)frame hourdatas1:(NSArray *)hourdatas1 mindatas1:(NSArray *)mindatas1 hourdatas2:(NSArray *)hourdatas2 mindatas2:(NSArray *)mindatas2 hourtitle:(NSString *)hourtitle mintitle:(NSString *)mintitle;
@property(nonatomic,assign)NSInteger btnTag;
@end
