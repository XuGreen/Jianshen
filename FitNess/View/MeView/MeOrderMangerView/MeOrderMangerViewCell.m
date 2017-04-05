//
//  MeOrderMangerViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/30.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "MeOrderMangerViewCell.h"
@interface MeOrderMangerViewCell(){
    UIView *backView;
    UIView *OrderMangerView;
    UIView *serverView;
}

@end
@implementation MeOrderMangerViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    backView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(408))];
    backView.backgroundColor=COMMONRBGCOLOR;
    [self addSubview:backView];
    OrderMangerView=[[UIView alloc]initWithFrame:CGRectMake(0, hight(20), SCREENWIDTH, hight(298))];
    OrderMangerView.backgroundColor=[UIColor whiteColor];
    [backView addSubview:OrderMangerView];
    [OrderMangerView addSubview:self.userName];
    [OrderMangerView addSubview:self.statusLabel];
    [OrderMangerView addSubview:self.orderImage];
    [OrderMangerView addSubview:self.OrderLabel];
    [OrderMangerView addSubview:self.OrderMoney];
    [OrderMangerView addSubview:self.OrderZheMoney];
    [OrderMangerView addSubview:self.OrderNumber];
    [OrderMangerView addSubview:self.maiNumber];
    [OrderMangerView addSubview:self.ServerNumber];
    [OrderMangerView addSubview:self.AllMoney];
    [OrderMangerView addSubview:self.DeleteBtn];
    [OrderMangerView addSubview:[MyView addLineView:CGRectMake(15,self.statusLabel.xmg_bottom+hight(20), SCREENWIDTH-30, 1) color:LINECOLOR]];
    [OrderMangerView addSubview:[MyView addLineView:CGRectMake(15,OrderMangerView.xmg_height-1, SCREENWIDTH-30, 1) color:LINECOLOR]];
    serverView =[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, OrderMangerView.xmg_bottom, SCREENWIDTH, hight(90))];
    [backView addSubview:serverView];
    [serverView addSubview:self.OrderBtn1];
    [serverView addSubview:self.OrderBtn2];
    
}

- (UILabel *)userName{
    if (!_userName) {
        
        UIImageView *userImage=[MyView Image:@"shop5" corner:0 rect:   CGRectMake(15, hight(24), wight(33), hight(33))];
        [OrderMangerView addSubview:userImage];
        
        _userName=[MyView label:@"三百勇士健身会所" tColor: [tools colorWithHex:0x333333]font: [UIFont systemFontOfSize:15] rect: CGRectMake( userImage.xmg_right+wight(16), hight(24), wight(300), hight(40))];
    }
    return _userName;
}
- (UILabel *)statusLabel{
    if (!_statusLabel) {
        
        _statusLabel=[MyView label:@"待付款" tColor: [tools colorWithHex:0xFFB81F]font: [UIFont systemFontOfSize:14] rect: CGRectMake(SCREENWIDTH-wight(160)-15, hight(24), wight(100), hight(40))];
        
    }
    return _statusLabel;
}
- (UIButton *)DeleteBtn{
    if (!_DeleteBtn) {
        _DeleteBtn=[MyView ImageButton:@"删除" text:@"" tColor:[UIColor clearColor] cornet:0 rect:CGRectMake( SCREENWIDTH-wight(50)-15, hight(15), wight(50), hight(55))];
    }
    return _DeleteBtn;
}

- (UIImageView *)orderImage{
    if (!_orderImage) {
        
        _orderImage=[MyView Image:@"background" corner:0 rect:  CGRectMake(15,  _userName.xmg_bottom+hight(40), wight(170), hight(170))];
    }
    return _orderImage;
}
- (UILabel *)OrderLabel{
    if (!_OrderLabel) {
        
        _OrderLabel=[MyView label:@"健康减脂超值套课" tColor: [tools colorWithHex:0x333333]font: [UIFont systemFontOfSize:17] rect: CGRectMake(_orderImage.xmg_right+wight(16), _userName.xmg_bottom+hight(40), wight(300), hight(40))];
    }
    return _OrderLabel;
}
- (UILabel *)OrderMoney{
    if (!_OrderMoney) {
        NSString * str=@"￥899.00";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(40)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        _OrderMoney=[MyView label:str tColor: [tools colorWithHex:0x333333]font: [UIFont systemFontOfSize:15] rect: CGRectMake(SCREENWIDTH-tempRect.size.width-15, _userName.xmg_bottom+hight(39), tempRect.size.width , tempRect.size.height)];
    }
    return _OrderMoney;
}
- (UILabel *)OrderNumber{
    if (!_OrderNumber) {
        
        _OrderNumber=[MyView label:@"订单号:451245345" tColor: [tools colorWithHex:0x333333]font: [UIFont systemFontOfSize:11] rect: CGRectMake(_orderImage.xmg_right+wight(16), _OrderLabel.xmg_bottom, wight(300), hight(40))];
    }
    return _OrderNumber;
}
- (UILabel *)OrderZheMoney{
    if (!_OrderZheMoney) {
        NSString * str=@"￥1299.00";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(40)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil];
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:str attributes:attribtDic];
        _OrderZheMoney=[[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-tempRect.size.width-15,  _OrderLabel.xmg_bottom+5,tempRect.size.width , tempRect.size.height)];
        _OrderZheMoney.attributedText=attribtStr;
        _OrderZheMoney.textColor=[tools colorWithHex:0x999999];
        _OrderZheMoney.font=[UIFont systemFontOfSize:12];
    }
    return _OrderZheMoney;
}
- (UILabel *)maiNumber{
    if (!_maiNumber) {
        
        _maiNumber=[MyView label:@"购买次数: x5" tColor: [tools colorWithHex:0x666666]font: [UIFont systemFontOfSize:11] rect: CGRectMake(_orderImage.xmg_right+wight(16), _OrderNumber.xmg_bottom+hight(20), wight(200), hight(40))];
    }
    return _maiNumber;
}
-(UILabel *)ServerNumber{
    if (!_ServerNumber) {
        
        _ServerNumber=[MyView label:@"已服务次数: 0" tColor: [tools colorWithHex:0x666666] font: [UIFont systemFontOfSize:11] rect: CGRectMake(_orderImage.xmg_right+wight(16), _maiNumber.xmg_bottom, wight(200), hight(40))];
    }
    return _ServerNumber;
}
-(UILabel *)AllMoney{
    if (!_AllMoney) {
        UILabel *heji=[MyView label:@"合计: ￥" tColor: [tools colorWithHex:0x666666] font:[UIFont systemFontOfSize:11] rect:CGRectMake(_ServerNumber.xmg_right+wight(85),  _maiNumber.xmg_bottom, wight(90), hight(40))];
        [OrderMangerView addSubview:heji];
        _AllMoney=[MyView label:@"899.00" tColor: [tools colorWithHex:0xCF2020]font: [UIFont systemFontOfSize:20] rect: CGRectMake(heji.xmg_right-2, _maiNumber.xmg_bottom-2, wight(200), hight(40))];
    }
    return _AllMoney;
}
- (UIButton *)OrderBtn1{
    if (!_OrderBtn1) {

        _OrderBtn1=[MyView TextButton:@"再次购买" bColor:[UIColor whiteColor] tColor:[tools colorWithHex:0xFFB81F] corner:0 rect:CGRectMake(SCREENWIDTH-wight(300)-15, hight(20), wight(140), hight(50))];
         _OrderBtn1.titleLabel.font=[UIFont systemFontOfSize:13];
         _OrderBtn1.layer.borderColor=[MAINCOLOR CGColor];
        _OrderBtn1.layer.borderWidth=1;
        _OrderBtn1.layer.cornerRadius=10.0f;
        _OrderBtn1.layer.masksToBounds=YES;
    }
    return _OrderBtn1;
}
- (UIButton *)OrderBtn2{
    if (!_OrderBtn2) {
        
        _OrderBtn2=[MyView ImageButton:@"button-bg" text:@"付款" tColor: [UIColor whiteColor] cornet:20 rect:CGRectMake(SCREENWIDTH-wight(140)-15, hight(20), wight(140), hight(50))];
        _OrderBtn2.titleLabel.font=[UIFont systemFontOfSize:13];
    }
    return _OrderBtn2;
}
+ (instancetype)MeOrderMangerViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[MeOrderMangerViewCell class] forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
