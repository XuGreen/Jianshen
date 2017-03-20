//
//  CollectionReusableHeadView.m
//  FitNess
//
//  Created by xuqq on 2017/3/17.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "CollectionReusableHeadView.h"

@implementation CollectionReusableHeadView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}
-(void)initUI{
    UIView *backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(100))];
    backView.backgroundColor=[UIColor whiteColor];
    [self addSubview:backView];
    UIImageView *praiseimageView=[[UIImageView alloc]initWithFrame:CGRectMake(15, 15, wight(31), hight(27))];
    praiseimageView.image=[UIImage imageNamed:@"craftsman"];
    [backView addSubview:praiseimageView];
    UILabel *gistLabel=[[UILabel alloc]initWithFrame:CGRectMake(praiseimageView.xmg_width+20, praiseimageView.xmg_x-10, 130, 32)];
    gistLabel.textColor=[tools colorWithHex:0x333333];
    gistLabel.text=@"附近手艺人";
    gistLabel.font=[UIFont systemFontOfSize:17];
    [backView addSubview:gistLabel];
    
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    moreBtn.frame = CGRectMake(SCREENWIDTH-80, 5, 80, 40);
    [moreBtn setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    [moreBtn setTitleColor:[tools colorWithHex:0x666666] forState:UIControlStateNormal];
    moreBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    CGFloat space = 10.0;
    [moreBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight
                             imageTitleSpace:space];
    [backView addSubview:moreBtn];
}
@end
