//
//  CollectionHeadReusableView.m
//  FitNess
//
//  Created by xuqq on 2017/3/24.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "CollectionHeadReusableView.h"

@implementation CollectionHeadReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self initUI];
    }
    return self;
}
- (void)initUI{
    UIView *backView=[MyView uiview:0 bColor:[UIColor clearColor] rect:CGRectMake(0, 0, SCREENWIDTH, hight(110))];
    [self addSubview:backView];
    [backView addSubview:[MyView addLineView:CGRectMake(15, hight(59), (SCREENWIDTH-30)/3, 1) color:[tools colorWithHex:0xcccccc]]];
    UIButton *hotBtn=[[UIButton alloc]initWithFrame:CGRectMake(15+(SCREENWIDTH-30)/3, hight(41),( SCREENWIDTH-30)/3, hight(38))];
    [hotBtn setImage:[UIImage imageNamed:@"popular"] forState:UIControlStateNormal];
    [hotBtn setTitle:@"热门项目" forState:UIControlStateNormal];
    hotBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [hotBtn setTitleColor:[tools colorWithHex:0x999999] forState:UIControlStateNormal];
    CGFloat space=10;
    [hotBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:space];
    [backView addSubview:hotBtn];
    [backView addSubview:[MyView addLineView:CGRectMake(SCREENWIDTH-((SCREENWIDTH-30)/3)-15, hight(59), (SCREENWIDTH-30)/3, 1) color:[tools colorWithHex:0xcccccc]]];
}
@end
