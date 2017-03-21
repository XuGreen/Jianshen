//
//  MeOrderViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/21.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "MeOrderViewCell.h"
@interface MeOrderViewCell()
@property(nonatomic,strong)UIView *backView;
@property(nonatomic,strong)UIView *MyOrderView;
@property(nonatomic,strong)UIView *MyServerView;
@end
@implementation MeOrderViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
-(void)initUI{
    _backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(280))];
    _backView.backgroundColor=COMMONRBGCOLOR;
    [self addSubview:self.backView];
    //我的订单
    _MyOrderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(120))];
    _MyOrderView.backgroundColor=[UIColor whiteColor];
    [self.backView addSubview:self.MyOrderView];
    UILabel *OrderLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, hight(44), wight(220), hight(32))];
    OrderLabel.text=@"我的订单";
    OrderLabel.textColor=[tools colorWithHex:0x333333];
    OrderLabel.font=[UIFont systemFontOfSize:17];
    [self.MyOrderView addSubview:OrderLabel];
    UILabel *rightNow = [[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-90,hight(24), 80, 30)];
    rightNow.text = @"全部订单";
    rightNow.textAlignment=NSTextAlignmentLeft;
    rightNow.textColor = [tools colorWithHex:0x999999];
    rightNow.font =[UIFont systemFontOfSize:14];
    [self.MyOrderView addSubview:rightNow];
    UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH - wight(50), hight(38), wight(18), hight(30))];
    arrow.image = [UIImage imageNamed:@"right"];
    [self.MyOrderView addSubview:arrow];
    
    [self.MyOrderView addSubview:[self addLineView:CGRectMake(0, _MyOrderView.xmg_height-1.5, SCREENWIDTH, 1.5) color:LINECOLOR]];
    
    [self CreateMyServer];
}

-(void)CreateMyServer{
    _MyServerView=[[UIView alloc]initWithFrame:CGRectMake(0, self.MyOrderView.xmg_bottom, SCREENWIDTH, hight(140))];
    _MyServerView.backgroundColor=[UIColor whiteColor];
    [self.backView addSubview:self.MyServerView];
    NSArray *titleArray=[NSArray arrayWithObjects:@"待付款", @"待服务",@"进行中",@"待评价",@"已取消",nil];
    NSArray  *ImageArray=[NSArray arrayWithObjects:@"payment", @"service-1", @"processing", @"evaluation", @"cancel", nil];
    for (int i=0; i<5; i++) {
        UIButton *serverBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREENWIDTH/5)*i, 0, SCREENWIDTH/5, hight(140))];
        [serverBtn setTitle:titleArray[i] forState:UIControlStateNormal];
        [serverBtn setImage:[UIImage imageNamed:ImageArray[i]] forState:UIControlStateNormal];
        serverBtn.titleLabel.font=[UIFont systemFontOfSize:14];
        [serverBtn setTitleColor:[tools colorWithHex:0x333333] forState:UIControlStateNormal];
        CGFloat space = 15.0;
        [serverBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                                  imageTitleSpace:space];
        [self.MyServerView addSubview:serverBtn];
    }
}
- (UIView *)addLineView : (CGRect)frame color : (UIColor *)color{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}
+ (instancetype)MeOrderViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[MeOrderViewCell class] forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}
@end
