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
    NSMutableArray *StarArray1;
    NSMutableArray *endArray1;
    
    NSMutableArray *StarArray2;
    NSMutableArray *endArray2;
    
    NSMutableArray *StarArray3;
    NSMutableArray *endArray3;
    
    NSMutableArray *StarArray4;
    NSMutableArray *endArray4;
    
    NSMutableArray *StarArray5;
    NSMutableArray *endArray5;
    
    NSMutableArray *StarArray6;
    NSMutableArray *endArray6;
    
    NSMutableArray *StarArray7;
    NSMutableArray *endArray7;
    
    NSInteger  btnTag;
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
      _labelarray1=[NSMutableArray array];
      _labelarray2=[NSMutableArray array];
      _labelarray3=[NSMutableArray array];
      _labelarray4=[NSMutableArray array];
      _labelarray5=[NSMutableArray array];
      _labelarray6=[NSMutableArray array];
      _labelarray7=[NSMutableArray array];
        
        _Restarray1=[NSMutableArray array];
        StarArray1=[NSMutableArray array];
        endArray1=[NSMutableArray array];
        
        StarArray2=[NSMutableArray array];
        endArray2=[NSMutableArray array];
        
        StarArray3=[NSMutableArray array];
        endArray3=[NSMutableArray array];
        
        StarArray4=[NSMutableArray array];
        endArray4=[NSMutableArray array];
        
        StarArray5=[NSMutableArray array];
        endArray5=[NSMutableArray array];
        
        StarArray6=[NSMutableArray array];
        endArray6=[NSMutableArray array];
        
        StarArray7=[NSMutableArray array];
        endArray7=[NSMutableArray array];
        [self initUI];
    }
    return self;
}
- (void)initUI{
    _backView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, 0, SCREENWIDTH, hight(100))];
    [self addSubview:self.backView];
    [self.backView addSubview:[MyView addLineView:CGRectMake(15, self.backView.xmg_height-1, SCREENWIDTH-30, 1) color:LINECOLOR]];
    [self.backView addSubview:self.dayLabel];
    [self.backView addSubview:self.dateLabel];
    _AddImageView=[MyView ImageButton:@"Add3" text:@"" tColor:[UIColor clearColor] cornet:0 rect:CGRectMake(SCREENWIDTH-wight(60)-15, 10, wight(60), hight(60))];
    _AddImageView.hidden=NO;
    [_AddImageView addTarget:self action:@selector(updateTimeTap1:) forControlEvents:UIControlEventTouchUpInside];
    [self.backView addSubview:self.AddImageView];

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
- (void)updateTimeTap1:(UIButton *)sender{
    [self selectedUpdateTimeTypes:_hourArray1 mindata1:_minArray1 hourdata2:_hourArray2 mindata2:_minArray2 hourTitle:@"" mintitle:@"" success:^(NSString *hourstr1,NSString *minstr1,NSString *hourstr2,NSString *minstr2){
       
        _timeStr=[NSString stringWithFormat:@"%@:%@-%@:%@",hourstr1,minstr1,hourstr2,minstr2];
        _StartimeStr=[NSString stringWithFormat:@"%@:%@",hourstr1,minstr1];
        _EndtimeStr=[NSString stringWithFormat:@"%@:%@",hourstr2,minstr2];
        switch (sender.tag) {
            case 0:{
                [_labelarray1 addObject:_timeStr];
                [self addLableView:_labelarray1];
                [StarArray1 addObject:_StartimeStr];
                [endArray1 addObject:_EndtimeStr];
                [self.delegate ReservationTimeWithArray1:StarArray1 endTime1:endArray1];
            }
                break;
            case 1:{
                [_labelarray2 addObject:_timeStr];
                [self addLableView:_labelarray2];
                [StarArray2 addObject:_StartimeStr];
                [endArray2 addObject:_EndtimeStr];
                [self.delegate ReservationTimeWithArray2:StarArray2 endTime1:endArray2];
            }
                break;
            case 2:{
                [_labelarray3 addObject:_timeStr];
                [self addLableView:_labelarray3];
                [StarArray3 addObject:_StartimeStr];
                [endArray3 addObject:_EndtimeStr];
                [self.delegate ReservationTimeWithArray2:StarArray3 endTime1:endArray3];
            }
                break;
            case 3:{
                [_labelarray4 addObject:_timeStr];
                [self addLableView:_labelarray4];
                [StarArray4 addObject:_StartimeStr];
                [endArray4 addObject:_EndtimeStr];
                [self.delegate ReservationTimeWithArray2:StarArray4 endTime1:endArray4];
            }
                break;
            case 4:{
                [_labelarray5 addObject:_timeStr];
                [self addLableView:_labelarray5];
                [StarArray5 addObject:_StartimeStr];
                [endArray5 addObject:_EndtimeStr];
                [self.delegate ReservationTimeWithArray5:StarArray5 endTime1:endArray5];
            }
                break;
            case 5:{
                [_labelarray6 addObject:_timeStr];
                [self addLableView:_labelarray6];
                [StarArray6 addObject:_StartimeStr];
                [endArray6 addObject:_EndtimeStr];
                [self.delegate ReservationTimeWithArray6:StarArray6 endTime1:endArray6];
            }
                break;
            case 6:{
                [_labelarray7 addObject:_timeStr];
                [self addLableView:_labelarray7];
                [StarArray7 addObject:_StartimeStr];
                [endArray7 addObject:_EndtimeStr];
                [self.delegate ReservationTimeWithArray7:StarArray7 endTime1:endArray7];
            }
                break;
            default:
                break;
        }

    }];
}
-(void)updateTimeTap:(UITapGestureRecognizer *)sender{
    [self selectedUpdateTimeTypes:_hourArray1 mindata1:_minArray1 hourdata2:_hourArray2 mindata2:_minArray2 hourTitle:@"" mintitle:@"" success:^(NSString *hourstr1,NSString *minstr1,NSString *hourstr2,NSString *minstr2){
        
        _timeStr=[NSString stringWithFormat:@"%@:%@-%@:%@",hourstr1,minstr1,hourstr2,minstr2];
        _StartimeStr=[NSString stringWithFormat:@"%@:%@",hourstr1,minstr1];
        _EndtimeStr=[NSString stringWithFormat:@"%@:%@",hourstr2,minstr2];
        [_labelarray1 addObject:_timeStr];
        [self addLableView:_labelarray1];
        [StarArray1 addObject:_StartimeStr];
        [endArray1 addObject:_EndtimeStr];
        [self.delegate ReservationTimeWithArray1:StarArray1 endTime1:endArray1];
        
    }];
}
- (void)addLableView:(NSMutableArray *)timeArray{
    
   count=(int)timeArray.count;
    if (count>2) {
        count=2;
    }
    for (int i=0; i<count; i++) {
        UIView *view=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(_dateLabel.xmg_right+ wight(200)*i, 10, wight(180), hight(100))];
        [self.backView addSubview:view];
        _timeLabel1=[MyView label:[timeArray objectAtIndex:i] tColor: [tools colorWithHex:0xFFB81F] font:[UIFont systemFontOfSize:12] rect:CGRectMake(0, 10, wight(160), hight(60))];
        _timeLabel1.textAlignment=NSTextAlignmentCenter;
        _timeLabel1.backgroundColor=[UIColor clearColor];
        _timeLabel1.layer.masksToBounds=YES;
        _timeLabel1.layer.cornerRadius=8.0f;
        _timeLabel1.layer.borderColor=[[tools colorWithHex:0xFFB81F] CGColor];
        _timeLabel1.layer.borderWidth=1;
        _timeLabel1.userInteractionEnabled=YES;
        UIImageView *deleImage=[[UIImageView alloc]initWithFrame:CGRectMake(_timeLabel1.xmg_width-wight(20), 5, wight(30), hight(30))];
        deleImage.tag=i;
        deleImage.image=[UIImage imageNamed:@"delete5"];
        [view addSubview:deleImage];
        UITapGestureRecognizer *tap1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DeleteTime:)];
        [deleImage addGestureRecognizer:tap1];
        [view addSubview:self.timeLabel1];
    }
    if (count<2) {
        _AddImageView.hidden=NO;
    }else{
        _AddImageView.hidden=YES;
    }
}
- (void)DeleteTime:(UITapGestureRecognizer *)sender{
    
}
- (void)addRestView:(NSMutableArray *)restArray{
    
     int counts=(int)restArray.count;
    if (counts>1) {
        counts=1;
    }
    for (int i=0; i<counts; i++) {
        _restLabel1=[MyView label:_RestStr tColor: [tools colorWithHex:0xFFB81F] font:[UIFont systemFontOfSize:12] rect:CGRectMake(_dateLabel.xmg_right, 10, wight(160), hight(60))];
        _restLabel1.textAlignment=NSTextAlignmentCenter;
        _restLabel1.backgroundColor=[UIColor clearColor];
        _restLabel1.layer.masksToBounds=YES;
        _restLabel1.layer.cornerRadius=8.0f;
        _restLabel1.layer.borderColor=[[tools colorWithHex:0xFFB81F] CGColor];
        _restLabel1.layer.borderWidth=1;
        [self.backView addSubview:self.restLabel1];
    }
    if (counts<1) {
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
    };
    [appdelegate.window addSubview:chooseView];
}


+ (instancetype)ReservationTimeViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[ReservationTimeViewCell class] forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}
@end
