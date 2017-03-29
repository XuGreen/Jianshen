//
//  ChooseTimeView.h
//  CPP_MUSIC
//
//  Created by 徐青清 on 2017/2/21.
//  Copyright © 2017年 liujiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseTimeView : UIView
@property (copy, nonatomic) void (^done)(NSString *selectedhourStr1,NSString *selectminStr1,NSString *selectedhourStr2,NSString *selectminStr2);

-(instancetype)initWithFrame:(CGRect)frame hourdatas1:(NSArray *)hourdatas1 mindatas1:(NSArray *)mindatas1 hourdatas2:(NSArray *)hourdatas2 mindatas2:(NSArray *)mindatas2 hourtitle:(NSString *)hourtitle mintitle:(NSString *)mintitle;
@end
