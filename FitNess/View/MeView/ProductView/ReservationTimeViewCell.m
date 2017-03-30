//
//  ReservationTimeViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/29.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ReservationTimeViewCell.h"
#import "UpdateTimeView.h"
#import "AppDelegate.h"
@interface ReservationTimeViewCell(){
    int count;
}
@end
@implementation ReservationTimeViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _hourArray1 = [NSMutableArray arrayWithCapacity:24];
        _minArray1 = [NSMutableArray arrayWithCapacity:60];
        _hourArray2 = [NSMutableArray arrayWithCapacity:24];
        _minArray2 = [NSMutableArray arrayWithCapacity:60];
        for (int i=0; i<24; i++) {
            if (i<10) {
                [_hourArray1 addObject:[NSString stringWithFormat:@"0%d",i]];
                
            }else{
                [_hourArray1 addObject:[NSString stringWithFormat:@"%d",i]];
            }
        }
        for (int i=0; i<60; i++) {
            if (i<10) {
                [_minArray1 addObject:[NSString stringWithFormat:@"0%d",i]];
            }else{
                [_minArray1 addObject:[NSString stringWithFormat:@"%d",i]];
            }
        }
        for (int i=0; i<24; i++) {
            if (i<10) {
                [_hourArray2 addObject:[NSString stringWithFormat:@"0%d",i]];
            }else{
                [_hourArray2 addObject:[NSString stringWithFormat:@"%d",i]];
            }
            
        }
        for (int i=0; i<60; i++) {
            if (i<10) {
                [_minArray2 addObject:[NSString stringWithFormat:@"0%d",i]];
            }else{
                [_minArray2 addObject:[NSString stringWithFormat:@"%d",i]];
            }
            
        }
        _labelarray=[NSMutableArray array];
        [self initUI];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(QuanTianClick)  name:@"QUANTIANXIUXI" object:nil];
    }
    return self;
}
- (void)initUI{
    _backView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, 0, SCREENWIDTH, hight(100))];
    [self addSubview:self.backView];
    [self.backView addSubview:[MyView addLineView:CGRectMake(15, self.backView.xmg_height-1, SCREENWIDTH-30, 1) color:LINECOLOR]];
    [self.backView addSubview:self.dayLabel];
    [self.backView addSubview:self.dateLabel];
    _AddImageView=[MyView Image:@"Add3" corner:0 rect:CGRectMake(SCREENWIDTH-wight(60)-15, 10, wight(60), hight(60))];
    _AddImageView.hidden=NO;
    UITapGestureRecognizer *tap2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(updateTimeTap1:)];
    [_AddImageView addGestureRecognizer:tap2];
    [self.backView addSubview:self.AddImageView];
//    [self.backView addSubview:self.restLabel1];

}
-(UILabel *)dayLabel{
    if (!_dayLabel) {
        _dayLabel=[MyView label:@"今天" tColor: [tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(15, 15, wight(70), hight(40))];
    }
    return _dayLabel;
}
- (UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel=[MyView label:@"03/17" tColor: [tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:12] rect:CGRectMake(_dayLabel.xmg_right, 15, wight(100), hight(40))];
    }
    return _dateLabel;
}
- (UILabel *)restLabel1{
    if (!_restLabel1) {
        _restLabel1=[MyView label:@"全天休息" tColor: [tools colorWithHex:0xFFB81F] font:[UIFont systemFontOfSize:12] rect:CGRectMake(_dateLabel.xmg_right, 10, wight(160), hight(60))];
        _restLabel1.textAlignment=NSTextAlignmentCenter;
        _restLabel1.backgroundColor=[UIColor clearColor];
        _restLabel1.layer.masksToBounds=YES;
        _restLabel1.layer.cornerRadius=8.0f;
        _restLabel1.layer.borderColor=[[tools colorWithHex:0xFFB81F] CGColor];
        _restLabel1.layer.borderWidth=1;

    }
    return _restLabel1;
}
- (void)QuanTianClick{
    
    [self.backView addSubview:self.restLabel1];
    [self.timeLabel1 removeFromSuperview];
}
- (void)updateTimeTap1:(UITapGestureRecognizer *)sender{

    [self selectedUpdateTimeTypes:_hourArray1 mindata1:_minArray1 hourdata2:_hourArray2 mindata2:_minArray2 hourTitle:@"" mintitle:@"" success:^(NSString *hourstr1,NSString *minstr1,NSString *hourstr2,NSString *minstr2){
        _timeStr=[NSString stringWithFormat:@"%@:%@-%@:%@",hourstr1,minstr1,hourstr2,minstr2];
  
        [_labelarray addObject:_timeStr];
        
        [self.delegate ReservationTimeWithArray:_labelarray];
        
        [self addLableView];
    
    }];
}
- (void)addLableView{
    
   count=(int)_labelarray.count;
    if (count>2) {
        count=2;
    }
    for (int i=0; i<count; i++) {
        _timeLabel1=[MyView label:[_labelarray objectAtIndex:i] tColor: [tools colorWithHex:0xFFB81F] font:[UIFont systemFontOfSize:12] rect:CGRectMake(_dateLabel.xmg_right+ wight(180)*i, 10, wight(160), hight(60))];
        _timeLabel1.textAlignment=NSTextAlignmentCenter;
        _timeLabel1.backgroundColor=[UIColor clearColor];
        _timeLabel1.layer.masksToBounds=YES;
        _timeLabel1.layer.cornerRadius=8.0f;
        _timeLabel1.layer.borderColor=[[tools colorWithHex:0xFFB81F] CGColor];
        _timeLabel1.layer.borderWidth=1;
        [self addSubview:self.timeLabel1];
    }
    if (count<2) {
        _AddImageView.hidden=NO;
    }else{
        _AddImageView.hidden=YES;
    }
}
/**
 *  修改自定义时间
 */
- (void)selectedUpdateTimeTypes:(NSArray *)hourdata1 mindata1:(NSArray *)mindata1 hourdata2:(NSArray *)hourdata2  mindata2:(NSArray *)mindata2 hourTitle:(NSString *)hourtitle mintitle:(NSString *)mintitle success:(void(^)(NSString *hourStr1, NSString *minStr1,NSString *hourStr2, NSString *minStr2))success{
    [self endEditing:YES];
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    UpdateTimeView *chooseView=[[UpdateTimeView alloc]initWithFrame:appdelegate.window.bounds hourdatas1:hourdata1 mindatas1:mindata1 hourdatas2:hourdata2 mindatas2:mindata2 hourtitle:hourtitle mintitle:mintitle];
    chooseView.done=^(NSString *selectedhourStr1,NSString *selectedminStr1,NSString *selectedhourStr2,NSString *selectedminStr2){
        success(selectedhourStr1,selectedminStr1,selectedhourStr2,selectedminStr2);
        XQQLog(@"%@:%@-%@:%@",selectedhourStr1,selectedminStr1,selectedhourStr2,selectedminStr2);
    };
    [appdelegate.window addSubview:chooseView];
    
}

+ (instancetype)ReservationTimeViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[ReservationTimeViewCell class] forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}
@end
