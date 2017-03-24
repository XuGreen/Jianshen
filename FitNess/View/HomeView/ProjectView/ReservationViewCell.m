//
//  ReservationViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/24.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ReservationViewCell.h"
#import "LXMRulerView.h"
@interface ReservationViewCell(){
    UIView *backView;
    UIView *ReservationView;
    UIImageView *timeImage;
    UILabel *ReservationLabel;
    UILabel *dayLabel;
    UIView *timeView1;
    UIView *timeView2;
    UIView *timeView3;
}
@end

@implementation ReservationViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    backView=[MyView uiview:0 bColor:COMMONRBGCOLOR rect:CGRectMake(0, 0, SCREENWIDTH, hight(420))];
    [self addSubview:backView];
    ReservationView =[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, 10, SCREENWIDTH, backView.xmg_height-10)];
    [backView addSubview:ReservationView];
   ReservationLabel=[MyView label:@"可预约时间" tColor: [tools colorWithHex:0x3333333] font:    [UIFont systemFontOfSize:15] rect:CGRectMake(15, hight(32), wight(200), hight(34))];
    [ReservationView addSubview:ReservationLabel];
    UIView *keyueView=[MyView addLineView:CGRectMake(ReservationLabel.xmg_right, hight(32), wight(30), hight(30)) color:[tools colorWithHex:0xFFB81F]];
    keyueView.layer.masksToBounds=YES;
    keyueView.layer.cornerRadius=3;
    [ReservationView addSubview:keyueView];
    UILabel *keyueLabel=[MyView label:@"可约" tColor: [tools colorWithHex:0x3333333] font:  [UIFont systemFontOfSize:12] rect:CGRectMake( keyueView.xmg_right+5, hight(34), wight(60), hight(34))];
    [ReservationView addSubview:keyueLabel];
    
    UIView *bukeyueView=[MyView addLineView:CGRectMake(keyueLabel.xmg_right+10, hight(34), wight(30), hight(30)) color:[tools colorWithHex:0xE6E6E6]];
    bukeyueView.layer.masksToBounds=YES;
    bukeyueView.layer.cornerRadius=3;
    [ReservationView addSubview:bukeyueView];
    UILabel *bukeyueLabel=[MyView label:@" 不可约" tColor: [tools colorWithHex:0x3333333] font:  [UIFont systemFontOfSize:12] rect:CGRectMake( bukeyueView.xmg_right+5, hight(32), wight(120), hight(34))];
    [ReservationView addSubview:bukeyueLabel];
  
    UIButton *timeBtn=[MyView TextButton:@"30天内" bColor:[UIColor clearColor] tColor: [tools colorWithHex:0x666666] corner:0 rect:  CGRectMake(SCREENWIDTH-wight(230), hight(34), wight(200), hight(34))];
    timeBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    [ReservationView addSubview:timeBtn];
    UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH - wight(18)-20, hight(34), wight(18), hight(30))];
    arrow.image = [UIImage imageNamed:@"right"];
    [ReservationView addSubview:arrow];
 
    [self CreateTimeView];
}
- (void)CreateTimeView{
    
    UILabel *timeLabel=[MyView label:@"时间" tColor: [tools colorWithHex:0x999999] font:  [UIFont systemFontOfSize:15] rect:CGRectMake( 15,ReservationLabel.xmg_bottom+20, wight(80), hight(34))];
    [ReservationView addSubview:timeLabel];
    timeImage=[MyView Image:@"time" corner:0 rect:CGRectMake(0, ReservationLabel.xmg_bottom+15, SCREENWIDTH, hight(40))];
    [ReservationView addSubview:timeImage];
    NSArray *dayArray=[NSArray arrayWithObjects:@"今日",@"明日",@"后日", nil];
    NSArray *timeArray1=[NSArray arrayWithObjects:@"1",@"1", @"1",@"0",@"0",@"0",@"0",@"1",@"1",@"1",@"1",@"1",@"1",@"0",@"0",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"0",@"0",@"0",@"0",@"0",@"0",@"0",nil];
    
    NSArray *timeArray2=[NSArray arrayWithObjects:@"1",@"1", @"1",@"1",@"1",@"0",@"0",@"1",@"1",@"1",@"1",@"1",@"1",@"0",@"0",@"0",@"0",@"0",@"0",@"1",@"1",@"1",@"1",@"1",@"1",@"0",@"0",@"0",@"0",@"0",@"0",@"0",nil];
    NSArray *timeArray3=[NSArray arrayWithObjects:@"1",@"1", @"1",@"0",@"0",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"0",@"0",@"0",@"0",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"0",@"0",@"0",@"0",@"0",@"0",@"0",nil];
    for (int i=0; i<3; i++) {
        dayLabel=[MyView label:dayArray[i] tColor:[tools colorWithHex:0x999999] font:[UIFont systemFontOfSize:15] rect:CGRectMake(15,timeLabel.xmg_bottom+20+40*i, wight(80), hight(34))];
        [ReservationView addSubview:dayLabel];
        for (int j=0; j<timeArray1.count; j++) {
            NSString *timeStr1=[timeArray1 objectAtIndex:j];
            timeView1=[MyView uiview:0 bColor:[tools colorWithHex:0xE6E6E6] rect:CGRectMake(dayLabel.xmg_right+wight(52)+(wight(485)/32)*j, timeImage.xmg_bottom+24, wight(485)/32, hight(30))];
            timeView1.tag=j;
            [ReservationView addSubview:timeView1];
            if ([timeStr1 isEqualToString:@"1"]) {
                
                timeView1.backgroundColor=[tools colorWithHex:0xFFB81F];
            }else{
                 timeView1.backgroundColor=[tools colorWithHex:0xE6E6E6];
            }
        
        }
        for (int a=0; a<timeArray2.count; a++) {
            NSString *timeStr2=[timeArray2 objectAtIndex:a];
            timeView2=[MyView uiview:0 bColor:[tools colorWithHex:0xE6E6E6] rect:CGRectMake(dayLabel.xmg_right+wight(52)+(wight(485)/32)*a, timeView1.xmg_bottom+24, wight(485)/32, hight(30))];
            timeView2.tag=a;
            [ReservationView addSubview:timeView2];
            if ([timeStr2 isEqualToString:@"1"]) {
                
                timeView2.backgroundColor=[tools colorWithHex:0xFFB81F];
            }else{
                timeView2.backgroundColor=[tools colorWithHex:0xE6E6E6];
            }
        }
        for (int b=0; b<timeArray3.count; b++) {
            NSString *timeStr3=[timeArray3 objectAtIndex:b];
            timeView3=[MyView uiview:0 bColor:[tools colorWithHex:0xE6E6E6] rect:CGRectMake(dayLabel.xmg_right+wight(52)+(wight(485)/32)*b, timeView2.xmg_bottom+24, wight(485)/32, hight(30))];
            timeView3.tag=b;
            [ReservationView addSubview:timeView3];
            if ([timeStr3 isEqualToString:@"1"]) {
                
                timeView3.backgroundColor=[tools colorWithHex:0xFFB81F];
            }else{
                timeView3.backgroundColor=[tools colorWithHex:0xE6E6E6];
            }
        }
 
    }
   
   
}
+(instancetype)ReservationViewCell:(UITableView *)tableView{
    NSString *identifer=NSStringFromClass([self class]);
    [tableView registerClass:[ReservationViewCell class] forCellReuseIdentifier:identifer];
    return [tableView dequeueReusableCellWithIdentifier:identifer];
}
@end
