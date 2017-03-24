//
//  SaverViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/23.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "SaverViewCell.h"
@interface SaverViewCell(){
    UIView *backView;
    UIView *SaverView;
}
@end
@implementation SaverViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    backView=[MyView uiview:0 bColor:COMMONRBGCOLOR rect:CGRectMake(0, 0, SCREENWIDTH, hight(326))];
    [self addSubview:backView];
    SaverView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, 10, SCREENWIDTH, backView.xmg_height-10)];
    [backView addSubview:SaverView];
    UIImageView *saverImage=[MyView Image:@"ensure" corner:0 rect:CGRectMake(0, 0, SCREENWIDTH, SaverView.xmg_height/3)];
    [SaverView addSubview:saverImage];
    [SaverView addSubview:[self addLineView:CGRectMake(15, saverImage.xmg_height-1, SCREENWIDTH-30, 1) color:LINECOLOR]];
    UIView *conponView1=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, saverImage.xmg_bottom, SCREENWIDTH, SaverView.xmg_height/3)];
    [SaverView addSubview:conponView1];
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
    [conponView1 addSubview:[self addLineView:CGRectMake(15, conponView1.xmg_height-1, SCREENWIDTH-30, 1) color:LINECOLOR]];
    
    //惠
    UIView *conponView2=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, conponView1.xmg_bottom, SCREENWIDTH, SaverView.xmg_height/3)];
    [SaverView addSubview:conponView2];
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

- (UIView *)addLineView : (CGRect)frame color : (UIColor *)color{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}
+ (instancetype)SaverViewCell:(UITableView *)tableView{
    NSString *Identifer=NSStringFromClass([self class]);
    [tableView registerClass:[SaverViewCell class] forCellReuseIdentifier:Identifer];
    return [tableView dequeueReusableCellWithIdentifier:Identifer];
}

@end
