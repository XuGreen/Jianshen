//
//  MyShopViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/21.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "MyShopViewCell.h"

@interface MyShopViewCell(){
    UIView *backView;
    UIView *joinView;
}
@end
@implementation MyShopViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
                [self initUI];
    }
    return self;
}
- (void)initUI{
    backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(476))];
    backView.backgroundColor=COMMONRBGCOLOR;
    [self addSubview:backView];
    //加入健身帮
    joinView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(80))];
    joinView.backgroundColor=[UIColor whiteColor];
    [backView addSubview:joinView];
    UILabel *shopLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, hight(24), SCREENWIDTH-40, hight(34))];
    shopLabel.text=@"我的店铺";
    shopLabel.textColor=[tools colorWithHex:0x333333];
    shopLabel.font=[UIFont systemFontOfSize:17];
    [joinView addSubview:shopLabel];
    [joinView addSubview:[self addLineView:CGRectMake(0, joinView.xmg_height-1.5, SCREENWIDTH, 1.5) color:LINECOLOR]];
    [self CreateShopView];

}
- (void)CreateShopView{
    UIView *shopView1=[[UIView alloc]initWithFrame:CGRectMake(0, joinView.xmg_bottom, SCREENWIDTH, hight(188))];
    shopView1.backgroundColor=[UIColor whiteColor];
    [backView addSubview:shopView1];
    NSArray *title1Array=[NSArray arrayWithObjects:@"发布产品",@"产品管理",@"订单管理",@"员工", nil];
    NSArray *image1Array=[NSArray arrayWithObjects:@"project", @"product",@"order",@"staff", nil];
    for (int i=0; i<4; i++) {
        UIButton *serverBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREENWIDTH/4)*i, 0, SCREENWIDTH/4, hight(188))];
        [serverBtn setTitle:title1Array[i] forState:UIControlStateNormal];
        [serverBtn setImage:[UIImage imageNamed:image1Array[i]] forState:UIControlStateNormal];
        serverBtn.titleLabel.font=[UIFont systemFontOfSize:14];
        [serverBtn setTitleColor:[tools colorWithHex:0x333333] forState:UIControlStateNormal];
        serverBtn.layer.borderWidth=0.5;
        serverBtn.tag=1000+i;
        serverBtn.layer.borderColor=[[tools colorWithHex:0xe5e5e5] CGColor];
        CGFloat space = 15.0;
        [serverBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                                   imageTitleSpace:space];
        [serverBtn addTarget:self action:@selector(serverClick:) forControlEvents:UIControlEventTouchUpInside];
        [shopView1 addSubview:serverBtn];
    }
    UIView *shopView2=[[UIView alloc]initWithFrame:CGRectMake(0, shopView1.xmg_bottom, SCREENWIDTH, hight(188))];
    shopView2.backgroundColor=[UIColor whiteColor];
    [backView addSubview:shopView2];
    NSArray *title2Array=[NSArray arrayWithObjects:@"卡型管理",@"优惠券管理",@"店铺管理",@"认证管理", nil];
    NSArray *image2Array=[NSArray arrayWithObjects:@"card-1",@"manage",@"shop",@"certification",nil];
    for (int i=0; i<4; i++) {
        UIButton *serverBtn1=[[UIButton alloc]initWithFrame:CGRectMake((SCREENWIDTH/4)*i, 0, SCREENWIDTH/4, hight(188))];
        [serverBtn1 setTitle:title2Array[i] forState:UIControlStateNormal];
        [serverBtn1 setImage:[UIImage imageNamed:image2Array[i]] forState:UIControlStateNormal];
        serverBtn1.titleLabel.font=[UIFont systemFontOfSize:14];
        [serverBtn1 setTitleColor:[tools colorWithHex:0x333333] forState:UIControlStateNormal];
        serverBtn1.layer.borderWidth=0.5;
        serverBtn1.tag=2000+i;
        [serverBtn1 addTarget:self action:@selector(server1Click:) forControlEvents:UIControlEventTouchUpInside];
        serverBtn1.layer.borderColor=[[tools colorWithHex:0xe5e5e5] CGColor];
        CGFloat space = 15.0;
        [serverBtn1 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                                   imageTitleSpace:space];
        [shopView2 addSubview:serverBtn1];
    }
}
- (UIView *)addLineView : (CGRect)frame color : (UIColor *)color{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}
#pragma mark -发布产品
- (void)serverClick:(UIButton *)sender{
    switch (sender.tag) {
        case 1000:{
               [[NSNotificationCenter defaultCenter]postNotificationName:ProductLaunch object:self];
                 }
            break;
        case 1001:{
             [[NSNotificationCenter defaultCenter]postNotificationName:ProductManger object:self];
        }
          break;
        case 1002:{
            [[NSNotificationCenter defaultCenter]postNotificationName:OrderManger object:self];
        }
            break;
        case 1003:{
            [[NSNotificationCenter defaultCenter]postNotificationName:Personnel object:self];
        }
            break;
        default:
            break;
    }
}
- (void)server1Click:(UIButton *)sender{
    switch (sender.tag) {
        case 2000:{
            [[NSNotificationCenter defaultCenter]postNotificationName:CardManger object:self];
        }
            break;
        case 2001:{
            [[NSNotificationCenter defaultCenter]postNotificationName:CouponManger object:self];
        }
            break;
        case 2002:{
            [[NSNotificationCenter defaultCenter]postNotificationName:ShopManger object:self];
        }
            break;
        case 2003:{
            [[NSNotificationCenter defaultCenter]postNotificationName:CertificateManger object:self];
        }
            break;
        default:
            break;
    }
}
+ (instancetype)MyShopViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[MyShopViewCell class] forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
