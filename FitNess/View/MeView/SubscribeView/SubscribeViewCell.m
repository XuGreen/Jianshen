//
//  SubscribeViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/25.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "SubscribeViewCell.h"
@interface SubscribeViewCell()
@property(nonatomic,strong)UIView *backView;
@property(nonatomic,strong)UIView *MyEvuateViews;
@property(nonatomic,strong)UIView *MyEvuateView;
@end
@implementation SubscribeViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self CreateEvuateView];
    }
    return self;
}

- (void)CreateEvuateView{
    _backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(300))];
    _backView.backgroundColor=COMMONRBGCOLOR;
    [self addSubview:self.backView];
    _MyEvuateViews=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, 0, SCREENHEIGHT,hight(100))];
    [self.backView addSubview:self.MyEvuateViews];
    UILabel *descriptionLabel=[MyView label:@"我的预约单" tColor: [tools colorWithHex:0x3333333] font:    [UIFont systemFontOfSize:17] rect:CGRectMake(15, hight(34), SCREENWIDTH-60, hight(34))];
    [_MyEvuateViews addSubview:descriptionLabel];
    [_MyEvuateViews addSubview:[self addLineView:CGRectMake(15, descriptionLabel.xmg_bottom+20, SCREENWIDTH, 1) color:LINECOLOR]];
    UIButton *timeBtn=[MyView TextButton:@"全部订单" bColor:[UIColor clearColor] tColor: [tools colorWithHex:0x999999] corner:0 rect:  CGRectMake(SCREENWIDTH-wight(230), hight(36), wight(200), hight(34))];
    timeBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [_MyEvuateViews addSubview:timeBtn];
    UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH - wight(50), hight(38), wight(18), hight(30))];
    arrow.image = [UIImage imageNamed:@"right"];
    [_MyEvuateViews addSubview:arrow];
    [_MyEvuateViews addSubview:[self addLineView:CGRectMake(0, _MyEvuateViews.xmg_height-1, SCREENHEIGHT, 1) color:LINECOLOR]];
    //预约单详情
    _MyEvuateView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, _MyEvuateViews.xmg_bottom, SCREENHEIGHT,hight(180))];
    [self.backView addSubview:self.MyEvuateView];
    [self.MyEvuateView addSubview:self.personImage];
    [self.MyEvuateView addSubview:self.personImage];
    [self.MyEvuateView addSubview:self.personName];
    [self.MyEvuateView addSubview:self.personAddress];
    [self.MyEvuateView addSubview:self.serverNumber];
    [self.MyEvuateView addSubview:self.orderDetail];
    [self.MyEvuateView addSubview:self.stopServer];
}

#pragma mark -懒加载
-(UIImageView *)personImage{
    if (!_personImage) {
        _personImage=[MyView Image:@"background" corner:wight(80)/2 rect:CGRectMake(15, hight(25), wight(80), hight(80))];
    }
    return _personImage;
}
-(UILabel *)personName{
    if (!_personName) {
        NSString * str=@"明太";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        
        _personName=[MyView label:str tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(_personImage.xmg_right+wight(16), hight(20), tempRect.size.width, tempRect.size.height)];
    }
    return  _personName;
}
-(UILabel *)personAddress{
    if (!_personAddress) {
        NSString * str=@"成都市高新区天府长城一栋一单元1804一单元";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(wight(440), hight(100)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil];
        
        _personAddress=[MyView label:str tColor:[tools colorWithHex:0x999999] font:[UIFont systemFontOfSize:12] rect:CGRectMake(_personImage.xmg_right+wight(16), _personName.xmg_bottom, tempRect.size.width, tempRect.size.height)];
        _personAddress.numberOfLines=0;
    }
    return  _personAddress;
}
- (UILabel *)serverNumber{
    if (!_serverNumber) {
        NSString * str=@"2";
        NSString *str1=@"3";
        NSString *strJTGZ = [NSString stringWithFormat:@"已服务%d次，待服务%d次 ",[str intValue],[str1 intValue]];
        
        CGRect tempRect=[strJTGZ boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        
        _serverNumber=[MyView label:strJTGZ tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(_personImage.xmg_right+wight(20), _personAddress.xmg_bottom+hight(10), tempRect.size.width, tempRect.size.height)];
    }
    return  _serverNumber;
}
- (UILabel *)orderDetail{
    if (!_orderDetail) {
        _orderDetail =[MyView label:@"订单详情" tColor:[tools colorWithHex:0x666666]  font:[UIFont systemFontOfSize:13] rect:  CGRectMake(SCREENWIDTH-wight(120)-15, hight(20), wight(120), hight(28))];
    }
    return _orderDetail;
}
-(UIButton *)stopServer{
    if (!_stopServer) {
        _stopServer=[[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH-wight(140)-15, _orderDetail.xmg_bottom+hight(60), wight(140), hight(50))];
        [_stopServer setTitleColor:[tools colorWithHex:0x333333] forState:UIControlStateNormal];
        [_stopServer setTitle:@"服务完成" forState: UIControlStateNormal];
        [_stopServer setBackgroundImage:[UIImage imageNamed:@"bg"] forState:UIControlStateNormal];
        _stopServer.titleLabel.font=[UIFont systemFontOfSize:13];
        _stopServer.layer.masksToBounds=YES;
        _stopServer.layer.cornerRadius=wight(20);
    }
    return _stopServer;
}
- (UIView *)addLineView : (CGRect)frame color : (UIColor *)color{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}
+ (instancetype)SubscribeViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[SubscribeViewCell class] forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
