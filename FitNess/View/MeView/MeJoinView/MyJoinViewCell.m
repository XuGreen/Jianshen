//
//  MyJoinViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/21.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "MyJoinViewCell.h"

@implementation MyJoinViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    UIView *backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(120))];
    backView.backgroundColor=COMMONRBGCOLOR;
    [self addSubview:backView];
    //加入健身帮
    UIView *joinView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(100))];
    joinView.backgroundColor=[UIColor whiteColor];
    [backView addSubview:joinView];
    UILabel *OrderLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, hight(34), SCREENWIDTH-40, hight(34))];
    OrderLabel.text=@"我是场馆/手艺人,我要加入健身帮！";
    OrderLabel.textColor=[tools colorWithHex:0x333333];
    OrderLabel.font=[UIFont systemFontOfSize:17];
    [joinView addSubview:OrderLabel];

    UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH - wight(50), hight(38), wight(18), hight(30))];
    arrow.image = [UIImage imageNamed:@"right"];
    [joinView addSubview:arrow];
}
+ (instancetype)MyJoinViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[MyJoinViewCell class] forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
