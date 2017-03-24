//
//  CollectionFootViewReusableView.m
//  FitNess
//
//  Created by xuqq on 2017/3/24.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "CollectionFootViewReusableView.h"

@implementation CollectionFootViewReusableView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self initUI];
    }
    return self;
}
- (void)initUI{
    UIView *backView=[MyView uiview:0 bColor:[UIColor clearColor] rect:CGRectMake(0, 0, SCREENWIDTH, hight(120))];
    [self addSubview:backView];
    [backView addSubview:[MyView addLineView:CGRectMake(15, hight(59), (SCREENWIDTH-30)/3, 1) color:[tools colorWithHex:0xcccccc] ]];
    UIButton *BottomBtn=[MyView TextButton:@"已经到底了" bColor:[UIColor clearColor]  tColor:[tools colorWithHex:0x999999] corner:0 rect:CGRectMake(15+(SCREENWIDTH-30)/3, hight(41),( SCREENWIDTH-30)/3, hight(38))];
    [backView addSubview:BottomBtn];
    [backView addSubview:[MyView addLineView:CGRectMake(SCREENWIDTH-((SCREENWIDTH-30)/3)-15, hight(59), (SCREENWIDTH-30)/3, 1) color:[tools colorWithHex:0xcccccc] ]];
}

@end
