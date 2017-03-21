//
//  MySortViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/21.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "MySortViewCell.h"
@interface MySortViewCell (){
    UIView *backView;
}
@end
@implementation MySortViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
   backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(396))];
    backView.backgroundColor=COMMONRBGCOLOR;
    [self addSubview:backView];
    [self CreateSortView];
    
}
- (void)CreateSortView{
    UIView *shopView1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(188))];
    shopView1.backgroundColor=[UIColor whiteColor];
    [backView addSubview:shopView1];
    NSArray *title1Array=[NSArray arrayWithObjects:@"我的健身卡",@"我的收藏",@"浏览历史",@"联系客服", nil];
    NSArray *image1Array=[NSArray arrayWithObjects:@"attention", @"collection",@"history",@"service", nil];
    for (int i=0; i<4; i++) {
        UIButton *serverBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREENWIDTH/4)*i, 0, SCREENWIDTH/4, hight(188))];
        [serverBtn setTitle:title1Array[i] forState:UIControlStateNormal];
        [serverBtn setImage:[UIImage imageNamed:image1Array[i]] forState:UIControlStateNormal];
        serverBtn.titleLabel.font=[UIFont systemFontOfSize:14];
        [serverBtn setTitleColor:[tools colorWithHex:0x333333] forState:UIControlStateNormal];
        serverBtn.layer.borderWidth=0.5;
        serverBtn.layer.borderColor=[[tools colorWithHex:0xe5e5e5] CGColor];
        CGFloat space = 15.0;
        [serverBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                                   imageTitleSpace:space];
        [shopView1 addSubview:serverBtn];
    }
    UIView *shopView2=[[UIView alloc]initWithFrame:CGRectMake(0, shopView1.xmg_bottom, SCREENWIDTH, hight(188))];
    shopView2.backgroundColor=[UIColor whiteColor];
    [backView addSubview:shopView2];
    NSArray *title2Array=[NSArray arrayWithObjects:@"常用地址",@"我的银行卡",@"找工作",@"用户反馈", nil];
    NSArray *image2Array=[NSArray arrayWithObjects:@"address",@"bank-card",@"job-search",@"feedback",nil];
    for (int i=0; i<4; i++) {
        UIButton *serverBtn1=[[UIButton alloc]initWithFrame:CGRectMake((SCREENWIDTH/4)*i, 0, SCREENWIDTH/4, hight(188))];
        [serverBtn1 setTitle:title2Array[i] forState:UIControlStateNormal];
        [serverBtn1 setImage:[UIImage imageNamed:image2Array[i]] forState:UIControlStateNormal];
        serverBtn1.titleLabel.font=[UIFont systemFontOfSize:14];
        [serverBtn1 setTitleColor:[tools colorWithHex:0x333333] forState:UIControlStateNormal];
        serverBtn1.layer.borderWidth=0.5;
        serverBtn1.layer.borderColor=[[tools colorWithHex:0xe5e5e5] CGColor];
        CGFloat space = 15.0;
        [serverBtn1 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                                    imageTitleSpace:space];
        [shopView2 addSubview:serverBtn1];
    }
}
+ (instancetype)MySortViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[MySortViewCell class] forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
