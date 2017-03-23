//
//  JobsHeadView.m
//  FitNess
//
//  Created by xuqq on 2017/3/22.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "JobsHeadView.h"

@implementation JobsHeadView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    UIView *backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(100))];
    backView.backgroundColor=[UIColor whiteColor];
    [self addSubview:backView];
    NSArray *titleArray=[NSArray arrayWithObjects:@"区域",@"职位",@"全职",@"待遇", nil];
    for (int i=0; i<4; i++) {
        UIButton *titleButton=[[UIButton alloc]initWithFrame:CGRectMake((SCREENWIDTH/4)*i, 0, SCREENWIDTH/4, hight(100))];
        [titleButton setTitle:titleArray[i] forState:UIControlStateNormal];
        [titleButton setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        [titleButton setTitleColor:[tools colorWithHex:0x333333] forState:UIControlStateNormal];
        titleButton.titleLabel.font=[UIFont systemFontOfSize:15];
        CGFloat space=5;
        [titleButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:space];
        [backView addSubview:titleButton];
    }
}
@end
