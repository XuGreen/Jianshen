//
//  CouponViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/17.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "CouponViewCell.h"
@interface CouponViewCell ()<UIScrollViewDelegate>{
    UIView *CouponView;
    UIButton *moreBtn;
    UIScrollView *scrollview;
}
@end
@implementation CouponViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    UIView *backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, wight(444))];
    backView.backgroundColor=COMMONRBGCOLOR;
    [self addSubview:backView];
    CouponView= [[UIView alloc]initWithFrame:CGRectMake(0, 15, SCREENWIDTH, backView.xmg_height-15)];
    CouponView.backgroundColor=[UIColor whiteColor];
    [backView addSubview:CouponView];
    UIImageView *praiseimageView=[[UIImageView alloc]initWithFrame:CGRectMake(15, 13, wight(34), hight(34))];
    praiseimageView.image=[UIImage imageNamed:@"promotions"];
    [CouponView addSubview:praiseimageView];
    UILabel *gistLabel=[[UILabel alloc]initWithFrame:CGRectMake(praiseimageView.xmg_width+20, praiseimageView.xmg_x-10, 130, 32)];
    gistLabel.textColor=[tools colorWithHex:0x333333];
    gistLabel.text=@"优惠活动";
    gistLabel.font=[UIFont systemFontOfSize:17];
    [CouponView addSubview:gistLabel];
    
    moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    moreBtn.frame = CGRectMake(SCREENWIDTH-80, 5, 80, 40);
    [moreBtn setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    [moreBtn setTitleColor:[tools colorWithHex:0x666666] forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(moreGiftClick:) forControlEvents:UIControlEventTouchUpInside];
    moreBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    CGFloat space = 10.0;
    [moreBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight
                             imageTitleSpace:space];
    [CouponView addSubview:moreBtn];
    
    NSArray *imageArray=[NSArray arrayWithObjects:@"background",@"background",@"background",@"background",@"background",@"background",@"background", nil];
    //滚动视图
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, moreBtn.xmg_bottom, SCREENWIDTH, wight(300))];
    scrollview.backgroundColor=[UIColor clearColor];
    scrollview.delegate=self;
    scrollview.showsVerticalScrollIndicator=NO;
    scrollview.showsHorizontalScrollIndicator=NO;
    scrollview.contentSize=CGSizeMake(hight(271)*imageArray.count+50, 0);
    [scrollview setContentOffset:CGPointMake(0, 0)];
    [CouponView addSubview:scrollview];

    for (int i=0; i<imageArray.count; i++) {
        UIView *ImageView=[[UIView alloc]initWithFrame:CGRectMake(15+((hight(271)+5)*i), 0, wight(271),hight(300))];
        ImageView.backgroundColor=[UIColor clearColor];
                                                                  
        _CouponImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, hight(271),wight(212))];
        _CouponImageView.image=[UIImage imageNamed:imageArray[i]];
        [ImageView addSubview:_CouponImageView];

        _CouponName=[[UILabel alloc]initWithFrame:CGRectMake(0, _CouponImageView.xmg_bottom+10, hight(270), wight(30))];
        _CouponName .text=@"健美操大放送";
        _CouponName.textAlignment=NSTextAlignmentLeft;
        _CouponName.textColor=[tools colorWithHex:0x333333];
        _CouponName.font=[UIFont systemFontOfSize:15];
        _CouponZhe=[[UILabel alloc]initWithFrame:CGRectMake(0, _CouponName.xmg_bottom+5, hight(150), wight(30))];
        _CouponZhe .text=@"低至6折";
        _CouponZhe.textColor=[UIColor whiteColor];
        _CouponZhe.backgroundColor=MAINCOLOR;
        _CouponZhe.textAlignment=NSTextAlignmentCenter;
        _CouponZhe.font=[UIFont systemFontOfSize:14];
        [ImageView addSubview:self.CouponName];
        [ImageView addSubview:self.CouponZhe];
        
        [scrollview addSubview:ImageView];
    }

    
}
-(void)moreGiftClick:(id)sender{
    [[NSNotificationCenter defaultCenter]postNotificationName:MORECOUPONNOTIFICATION object:self];
}
+ (instancetype)CouponViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[CouponViewCell class] forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}
@end
