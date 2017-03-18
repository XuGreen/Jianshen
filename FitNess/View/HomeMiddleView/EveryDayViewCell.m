//
//  EveryDayViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/17.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "EveryDayViewCell.h"

@implementation EveryDayViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    UIView *backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, wight(270))];
    backView.backgroundColor=COMMONRBGCOLOR;
    [self addSubview:backView];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 15, SCREENWIDTH, wight(200))];
    imageView.image=[UIImage imageNamed:@"banner"];
    [backView addSubview:imageView];
    
}
+ (instancetype)EveryDayViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[EveryDayViewCell class] forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}
@end
