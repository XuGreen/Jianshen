//
//  UpdateTimeView.h
//  FitNess
//
//  Created by xuqq on 2017/3/29.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol UpdateTimeDelegate <NSObject>

@optional
- (void)UpdateTimeWithName:(NSString *)name;
@end
@interface UpdateTimeView : UIView
@property(nonatomic,strong)  UIButton *Restbutton;
@property (copy, nonatomic) void (^done)(NSString *selectedhourStr1,NSString *selectminStr1,NSString *selectedhourStr2,NSString *selectminStr2);
@property (copy, nonatomic) void (^done2)(NSString *RestString);

-(instancetype)initWithFrame:(CGRect)frame hourdatas1:(NSArray *)hourdatas1 mindatas1:(NSArray *)mindatas1 hourdatas2:(NSArray *)hourdatas2 mindatas2:(NSArray *)mindatas2 hourtitle:(NSString *)hourtitle mintitle:(NSString *)mintitle;

@property(nonatomic,weak)id <UpdateTimeDelegate>delegate;
@end
