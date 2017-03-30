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
@property(nonatomic,strong)UIView *OrederDetailView;

@property(nonatomic,strong)UIButton        *startServer;
@end
@implementation MeOrderViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
-(void)initUI{
    _backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(420))];
    _backView.backgroundColor=COMMONRBGCOLOR;
    [self addSubview:self.backView];
    //我的订单
    _MyOrderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(120))];
    _MyOrderView.backgroundColor=[UIColor whiteColor];
    UITapGestureRecognizer *tap1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(MyOrderClick:)];
    [self.MyOrderView addGestureRecognizer:tap1];
    [self.backView addSubview:self.MyOrderView];
    UILabel *OrderLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, hight(50), wight(220), hight(40))];
    OrderLabel.text=@"我的订单";
    OrderLabel.textColor=[tools colorWithHex:0x333333];
    OrderLabel.font=[UIFont systemFontOfSize:17];
    [self.MyOrderView addSubview:OrderLabel];
    UILabel *rightNow = [[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-90,hight(54), 80, hight(40))];
    rightNow.text = @"全部订单";
    rightNow.textAlignment=NSTextAlignmentLeft;
    rightNow.textColor = [tools colorWithHex:0x999999];
    rightNow.font =[UIFont systemFontOfSize:14];
    [self.MyOrderView addSubview:rightNow];
    UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH - wight(50), hight(58), wight(18), hight(30))];
    arrow.image = [UIImage imageNamed:@"right"];
    [self.MyOrderView addSubview:arrow];
    
    [self.MyOrderView addSubview:[self addLineView:CGRectMake(0, _MyOrderView.xmg_height-1.5, SCREENWIDTH, 1.5) color:LINECOLOR]];
    
    [self CreateMyServer];
    [self CreateServer];
  
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
    [_MyServerView addSubview:[self addLineView:CGRectMake(0, _MyServerView.xmg_height-1, SCREENHEIGHT, 1) color:LINECOLOR]];
}
- (void)CreateServer{
    _OrederDetailView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, _MyServerView.xmg_bottom, SCREENHEIGHT, hight(140))];
    [self.backView addSubview:self.OrederDetailView];
    [self.OrederDetailView addSubview:self.personImage];
    [self.OrederDetailView addSubview:self.personName];
    [self.OrederDetailView addSubview:self.personType];
    [self.OrederDetailView addSubview:self.serverNumber];
    [self.OrederDetailView addSubview:self.orderDetail];
    [self.OrederDetailView addSubview:self.startServer];
}
- (void)MyOrderClick:(UITapGestureRecognizer *)sender{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"MyOrderManger" object:self];
}
#pragma mark-我的订单
#pragma mark -懒加载
-(UIImageView *)personImage{
    if (!_personImage) {
        _personImage=[MyView Image:@"background" corner:wight(80)/2 rect:CGRectMake(15, hight(25), wight(80), hight(80))];
    }
    return _personImage;
}
- (UILabel *)personName{
    if (!_personName) {
        NSString * str=@"Joker";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];

        _personName=[MyView label:str tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(_personImage.xmg_right+wight(20), hight(20), tempRect.size.width, tempRect.size.height)];
    }
    return  _personName;
}
- (UILabel *)personType{
    if (!_personType) {
        NSString * str=@"健身教练";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        
        _personType=[MyView label:str tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(_personName.xmg_right+wight(16), hight(20), tempRect.size.width, tempRect.size.height)];
    }
    return  _personType;
}
- (UILabel *)serverNumber{
    if (!_serverNumber) {
        NSString * str=@"2";
        NSString *str1=@"3";
        NSString *strJTGZ = [NSString stringWithFormat:@"已服务%d次，待服务%d次 ",[str intValue],[str1 intValue]];
        
        CGRect tempRect=[strJTGZ boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        
        _serverNumber=[MyView label:strJTGZ tColor:[tools colorWithHex:0x666666] font:[UIFont systemFontOfSize:15] rect:CGRectMake(_personImage.xmg_right+wight(20), _personName.xmg_bottom+hight(25), tempRect.size.width, tempRect.size.height)];
    }
    return  _serverNumber;
}
- (UILabel *)orderDetail{
    if (!_orderDetail) {
        _orderDetail =[MyView label:@"订单详情" tColor:[tools colorWithHex:0x666666]  font:[UIFont systemFontOfSize:13] rect:  CGRectMake(SCREENWIDTH-wight(120)-15, hight(20), wight(120), hight(28))];
    }
    return _orderDetail;
}
-(UIButton *)startServer{
    if (!_startServer) {
        _startServer=[[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH-wight(140)-15, _orderDetail.xmg_bottom+hight(18), wight(140), hight(50))];
        [_startServer setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_startServer setTitle:@"开始服务" forState: UIControlStateNormal];
        [_startServer setBackgroundImage:[UIImage imageNamed:@"bg"] forState:UIControlStateNormal];
        _startServer.titleLabel.font=[UIFont systemFontOfSize:13];
        _startServer.layer.masksToBounds=YES;
        _startServer.layer.cornerRadius=wight(20);
    }
    return _startServer;
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
