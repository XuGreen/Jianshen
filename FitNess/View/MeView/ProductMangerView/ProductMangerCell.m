//
//  ProductMangerCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/30.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ProductMangerCell.h"
@interface ProductMangerCell(){
    UIView *backView;
    UIView *MangerView;
}

@end

@implementation ProductMangerCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self initUI];
    }
    return self;
}
- (void)initUI{
    backView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(380))];
    backView.backgroundColor=COMMONRBGCOLOR;
    [self addSubview:backView];
    MangerView=[[UIView alloc]initWithFrame:CGRectMake(0, hight(20), SCREENWIDTH, hight(180))];
    MangerView.backgroundColor=[UIColor whiteColor];
    [backView addSubview:MangerView];
    [MangerView addSubview:self.ProductImage];
    [MangerView addSubview:self.ProductTitle];
     [MangerView addSubview:self.ProductMoney];
    [MangerView addSubview:self.ProductShouchu];
    [MangerView addSubview:self.EditBtn];
    [MangerView addSubview:self.DeleteBtn];
    [MangerView addSubview:self.XianguanBtn];
    [MangerView addSubview:[MyView addLineView:CGRectMake(15,MangerView.xmg_height-1, SCREENWIDTH-30, 1) color:LINECOLOR]];
    
    UIView *conponView1=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, MangerView.xmg_bottom, SCREENWIDTH, hight(90))];
    [backView addSubview:conponView1];
    UIButton *conponBtn=[MyView TextButton:@"劵" bColor:[tools colorWithHex:0xFFB81F] tColor:[tools colorWithHex:0xFFFFFF] corner:0 rect:CGRectMake(15, hight(30), wight(40), hight(40))];
    [conponView1 addSubview:conponBtn];
    _conponArray=[NSArray arrayWithObjects:@"20元通用卷",@"10元优惠券" ,nil];
    for (int i=0; i<_conponArray.count; i++) {
        UIButton *conponBtn2=[MyView TextButton:_conponArray[i] bColor:[UIColor whiteColor] tColor:[tools colorWithHex:0xFFB81F] corner:4 rect:CGRectMake((conponBtn.xmg_right+12)+wight(184)*i, hight(30), wight(160), hight(40))];
        conponBtn2.layer.borderColor=[[tools colorWithHex:0xFFB81F] CGColor];
        conponBtn2.layer.borderWidth=1;
        conponBtn2.titleLabel.font=[UIFont systemFontOfSize:13];
        [conponView1 addSubview:conponBtn2];
    }
    UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH - wight(18)-15, hight(38), wight(18), hight(30))];
    arrow.image = [UIImage imageNamed:@"right"];
    [conponView1 addSubview:arrow];
    [conponView1 addSubview:[MyView addLineView:CGRectMake(15, conponView1.xmg_height-1, SCREENWIDTH-30, 1) color:LINECOLOR]];
    
    //惠
    UIView *conponView2=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, conponView1.xmg_bottom, SCREENWIDTH, hight(90))];
    [backView addSubview:conponView2];
    UIButton *huiBtn=[MyView TextButton:@"惠" bColor:[tools colorWithHex:0xFF0000] tColor:[tools colorWithHex:0xFFFFFF] corner:0 rect:CGRectMake(15, hight(30), wight(40), hight(40))];
    [conponView2 addSubview:huiBtn];
    _conponArray1=[NSArray arrayWithObjects:@"首单立减",@"全店8折",@"买三送一",nil];
    for (int i=0; i<_conponArray1.count; i++) {
        UIButton *huiBtn2=[MyView TextButton:_conponArray1[i] bColor:[UIColor whiteColor] tColor:[tools colorWithHex:0xFF0000] corner:4 rect:CGRectMake((conponBtn.xmg_right+12)+wight(154)*i, hight(30), wight(130), hight(40))];
        huiBtn2.layer.borderColor=[[tools colorWithHex:0xFF0000] CGColor];
        huiBtn2.layer.borderWidth=1;
        huiBtn2.titleLabel.font=[UIFont systemFontOfSize:13];
        [conponView2 addSubview:huiBtn2];
    }
    UIImageView *arrow2 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH - wight(18)-15, hight(38), wight(18), hight(30))];
    arrow2.image = [UIImage imageNamed:@"right"];
    [conponView2 addSubview:arrow2];
    

}
- (UIImageView *)ProductImage{
    if (!_ProductImage) {
        _ProductImage=[MyView Image:@"background" corner:0 rect:CGRectMake(15, hight(20), wight(140), hight(140))];
    }
    return _ProductImage;
}
- (UILabel *)ProductTitle{
    if (!_ProductTitle) {
        
        _ProductTitle=[MyView label:@"局部健身塑性" tColor:[tools colorWithHex:0x333333] font: [UIFont systemFontOfSize:15] rect:CGRectMake(_ProductImage.xmg_right+wight(28), hight(20), wight(300), hight(40))];
       _ProductTitle.textAlignment=NSTextAlignmentLeft;
    }
    return _ProductTitle;
}
- (UILabel *)ProductMoney{
    if (!_ProductMoney) {
        
        _ProductMoney=[MyView label:@"￥899.0" tColor:[tools colorWithHex:0xFF0000] font: [UIFont systemFontOfSize:15] rect:CGRectMake(_ProductImage.xmg_right+wight(28), _ProductTitle.xmg_bottom+hight(10), wight(300), hight(40))];
        _ProductMoney.textAlignment=NSTextAlignmentLeft;
    }
    return _ProductMoney;
}
- (UILabel *)ProductShouchu{
    if (!_ProductShouchu) {
        
        _ProductShouchu=[MyView label:@"已售24" tColor:[tools colorWithHex:0x666666] font: [UIFont systemFontOfSize:15] rect:CGRectMake(_ProductImage.xmg_right+wight(28), _ProductMoney.xmg_bottom+hight(15), wight(300), hight(40))];
        _ProductShouchu.textAlignment=NSTextAlignmentLeft;
    }
    return _ProductShouchu;
}
- (UIButton *)EditBtn{
    if (!_EditBtn) {
      
        _EditBtn=[MyView TextButton:@"编辑" bColor:[UIColor clearColor] tColor:[tools colorWithHex:0x333333] corner:0 rect:  CGRectMake(SCREENWIDTH-wight(180)-15, hight(25), wight(60), hight(40))];
       _EditBtn .titleLabel.font=[UIFont systemFontOfSize:12];
    }
    return _EditBtn;
}
- (UIButton *)DeleteBtn{
    if (!_DeleteBtn) {
        
        _DeleteBtn=[MyView TextButton:@"删除" bColor:[UIColor clearColor] tColor:[tools colorWithHex:0x333333] corner:0 rect:  CGRectMake(SCREENWIDTH-wight(60)-15, hight(25), wight(60), hight(40))];
        _DeleteBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    }
    return _DeleteBtn;
}
- (UIButton *)XianguanBtn{
    if (!_XianguanBtn) {
        
        _XianguanBtn=[MyView TextButton:@"相关订单" bColor:[UIColor clearColor] tColor:[tools colorWithHex:0x333333] corner:0 rect:  CGRectMake(SCREENWIDTH-wight(100)-15, _ProductShouchu.xmg_y, wight(100), hight(40))];
        _XianguanBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    }
    return _XianguanBtn;
}
+ (instancetype)ProductMangerCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[ProductMangerCell class] forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}
@end

