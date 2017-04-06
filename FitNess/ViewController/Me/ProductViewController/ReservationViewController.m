//
//  ReservationViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/29.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ReservationViewController.h"
#import "ReservationTimeViewCell.h"
#import "ServerView.h"
#import "AppDelegate.h"
#import "ChooseTimeView.h"
#import "UpdateTimeView.h"


@interface ReservationViewController ()<UITableViewDelegate,UITableViewDataSource,ReservationTimeDelegate>{
    ServerView *header;
    NSString *timeStr;
}
@property(nonatomic,strong) UITableView    *tableView;
@property(nonatomic, strong)NSMutableArray   *hourArray1;
@property(nonatomic, strong)NSMutableArray   *minArray1;
@property(nonatomic, strong)NSMutableArray   *hourArray2;
@property(nonatomic, strong)NSMutableArray   *minArray2;
@property (strong, nonatomic) NSArray *dataSourceForWeek;
@property (strong, nonatomic) NSArray *dataSourceForDay;
@property (strong, nonatomic) NSArray *dataSourceForDate;
@property (strong, nonatomic) NSMutableArray *timeArray1;
@property (strong, nonatomic) NSMutableArray *timeArray2;
@property (strong, nonatomic) NSMutableArray *timeArray3;
@property (strong, nonatomic) NSMutableArray *timeArray4;
@property (strong, nonatomic) NSMutableArray *timeArray5;
@property (strong, nonatomic) NSMutableArray *timeArray6;
@property (strong, nonatomic) NSMutableArray *timeArray7;
@property (strong, nonatomic) NSMutableArray *AllTimeArray;


@end

@implementation ReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    _dataSourceForDay=[[NSArray alloc]init];
    _dataSourceForWeek=[[NSArray alloc]init];
     _dataSourceForDate=[[NSArray alloc]init];
    _timeArray1=[NSMutableArray array];
    _timeArray2=[NSMutableArray array];
    _timeArray3=[NSMutableArray array];
    _timeArray4=[NSMutableArray array];
    _timeArray5=[NSMutableArray array];
    _timeArray6=[NSMutableArray array];
    _timeArray7=[NSMutableArray array];
    _AllTimeArray=[NSMutableArray array];
    
    [self setNav];
    [self.view addSubview:self.tableView];
    [self setHeaderView];
    [self setWeek];
    [self setDate];
    [self setDates];
    
}
-(void)setNav{
    self.view.backgroundColor=COMMONRBGCOLOR;
    self.navigationItem.title=@"可预约时间段";
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 20.0 / 2.0, 35.0 / 2.0);
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(action_onBackButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UIButton *CompleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CompleteButton.frame = CGRectMake(0, 0, 50, 35);
    [CompleteButton setTitle:@"完成" forState: UIControlStateNormal];
    [CompleteButton setTitleColor:[tools colorWithHex:0x333333] forState:UIControlStateNormal];
    [CompleteButton addTarget:self action:@selector(CompleteButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *CompleteItem = [[UIBarButtonItem alloc]initWithCustomView:CompleteButton];
    self.navigationItem.rightBarButtonItem = CompleteItem;
    
}

- (void)setWeek{
    NSMutableArray *arr = [NSMutableArray array];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *str = [NSString stringWithFormat:@"%@ 00:00:00",[formatter stringFromDate:[NSDate date]]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *baseDate = [formatter dateFromString:str];
    NSLog(@" %@",str);
    for (NSInteger i = 0; i < 7; i++) {
        if(i > 2){
            NSDate *date = [NSDate dateWithTimeInterval:24*60*60*i sinceDate:baseDate];
            [formatter setDateFormat:@"EE"];
            NSMutableString *dateStr = [[formatter stringFromDate:date] mutableCopy];
            [arr addObject:dateStr];
        }else if(i == 0){
            [arr addObject:@"今天"];
        }else if (i == 1){
            [arr addObject:@"明天"];
        }
        else if (i == 2){
            [arr addObject:@"后天"];
        }
        else if (i==3){
            
        }
    }
    _dataSourceForWeek = [arr copy];
}
- (void)setDate{
    NSMutableArray *arr = [NSMutableArray array];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *str = [NSString stringWithFormat:@"%@ 00:00:00",[formatter stringFromDate:[NSDate date]]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *baseDate = [formatter dateFromString:str];
    for (NSInteger i = 0; i < 7; i++) {
        NSDate *date = [NSDate dateWithTimeInterval:24*60*60*i sinceDate:baseDate];
        [formatter setDateFormat:@"M/dd"];
        NSMutableString *dateStr = [[formatter stringFromDate:date] mutableCopy];
        [arr addObject:dateStr];
    }
    _dataSourceForDay = [arr copy];
}
- (void)setDates{
    NSMutableArray *arr = [NSMutableArray array];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *str = [NSString stringWithFormat:@"%@ 00:00:00",[formatter stringFromDate:[NSDate date]]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *baseDate = [formatter dateFromString:str];
    for (NSInteger i = 0; i < 7; i++) {
        NSDate *date = [NSDate dateWithTimeInterval:24*60*60*i sinceDate:baseDate];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSMutableString *dateStr = [[formatter stringFromDate:date] mutableCopy];
        [arr addObject:dateStr];
    }
    _dataSourceForDate = [arr copy];
}
- (void)setHeaderView{
    header=[[ServerView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(140))];
    UITapGestureRecognizer *tap1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(updateTimeTap:)];
    [header.UpdateImageView addGestureRecognizer:tap1];
    self.tableView.tableHeaderView=header;
}
-(void)action_onBackButton:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)CompleteButton:(UIButton *)sender{
    [self.delegate ReservationWithArray:_AllTimeArray];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)updateTimeTap:(UITapGestureRecognizer *)sender{
    [self selectedTimeTypes:_hourArray1 mindata1:_minArray1 hourdata2:_hourArray2 mindata2:_minArray2 hourTitle:@"" mintitle:@"" success:^(NSString *hourstr1,NSString *minstr1,NSString *hourstr2,NSString *minstr2){
        header.TimeLabel.text=[NSString stringWithFormat:@"%@:%@-%@:%@",hourstr1,minstr1,hourstr2,minstr2];
    }];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSourceForWeek.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
       ReservationTimeViewCell * ReservationCell=[ReservationTimeViewCell ReservationTimeViewCell:tableView];
       ReservationCell.delegate=self;
       ReservationCell.AddImageView.tag=indexPath.row;
       ReservationCell.selectionStyle =UITableViewCellSelectionStyleNone;
       ReservationCell.dayLabel.text=[_dataSourceForWeek objectAtIndex:indexPath.row];
       ReservationCell.dateLabel.text=[_dataSourceForDay objectAtIndex:indexPath.row];

        return ReservationCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return hight(100);
}

/**
 *  选择自定义时间
*/
- (void)selectedTimeTypes:(NSArray *)hourdata1 mindata1:(NSArray *)mindata1 hourdata2:(NSArray *)hourdata2  mindata2:(NSArray *)mindata2 hourTitle:(NSString *)hourtitle mintitle:(NSString *)mintitle success:(void(^)(NSString *hourStr1, NSString *minStr1,NSString *hourStr2, NSString *minStr2))success{
    [self.view endEditing:YES];
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    ChooseTimeView *chooseView=[[ChooseTimeView alloc]initWithFrame:appdelegate.window.bounds hourdatas1:hourdata1 mindatas1:mindata1 hourdatas2:hourdata2 mindatas2:mindata2 hourtitle:hourtitle mintitle:mintitle];
    chooseView.done=^(NSString *selectedhourStr1,NSString *selectedminStr1,NSString *selectedhourStr2,NSString *selectedminStr2){
        success(selectedhourStr1,selectedminStr1,selectedhourStr2,selectedminStr2);
       
    };
    [appdelegate.window addSubview:chooseView];
}
#pragma mark -ReservationTimeDelegate
- (void)ReservationTimeWithArray1:(NSMutableArray *)starTime1 endTime1:(NSMutableArray *)endTime1{
        for (int i=0; i<starTime1.count; i++) {
            NSMutableDictionary *timeDic=[[NSMutableDictionary alloc]init];
            [timeDic setObject:[_dataSourceForDate objectAtIndex:0] forKey:@"date"];
            [timeDic setObject:[endTime1 objectAtIndex:i] forKey:@"end_time"];
            [timeDic setObject:[starTime1 objectAtIndex:i] forKey:@"start_time"];
            [_AllTimeArray addObject:timeDic];
        }
     [self.tableView reloadData];
}
- (void)ReservationTimeWithArray2:(NSMutableArray *)starTime2 endTime1:(NSMutableArray *)endTime2{
    for (int i=0; i<starTime2.count; i++) {
        NSMutableDictionary *timeDic=[[NSMutableDictionary alloc]init];
         [timeDic setObject:[_dataSourceForDate objectAtIndex:1] forKey:@"date"];
         [timeDic setObject:[endTime2 objectAtIndex:i] forKey:@"end_time"];
        [timeDic setObject:[starTime2 objectAtIndex:i] forKey:@"start_time"];
      [_AllTimeArray addObject:timeDic];
    }
    [self.tableView reloadData];
}
- (void)ReservationTimeWithArray3:(NSMutableArray *)starTime3 endTime1:(NSMutableArray *)endTime3{
    for (int i=0; i<starTime3.count; i++) {
        NSMutableDictionary *timeDic=[[NSMutableDictionary alloc]init];
        [timeDic setObject:[_dataSourceForDate objectAtIndex:2] forKey:@"date"];
        [timeDic setObject:[endTime3 objectAtIndex:i] forKey:@"end_time"];
        [timeDic setObject:[starTime3 objectAtIndex:i] forKey:@"start_time"];
   
          [_AllTimeArray addObject:timeDic];
    }
    [self.tableView reloadData];
}
- (void)ReservationTimeWithArray4:(NSMutableArray *)starTime4 endTime1:(NSMutableArray *)endTime4{
    for (int i=0; i<starTime4.count; i++) {
        NSMutableDictionary *timeDic=[[NSMutableDictionary alloc]init];
        [timeDic setObject:[_dataSourceForDate objectAtIndex:3] forKey:@"date"];
        [timeDic setObject:[endTime4 objectAtIndex:i] forKey:@"end_time"];
        [timeDic setObject:[starTime4 objectAtIndex:i] forKey:@"start_time"];
        
         [_AllTimeArray addObject:timeDic];
    }
    [self.tableView reloadData];
}
- (void)ReservationTimeWithArray5:(NSMutableArray *)starTime5 endTime1:(NSMutableArray *)endTime5{
    for (int i=0; i<starTime5.count; i++) {
        NSMutableDictionary *timeDic=[[NSMutableDictionary alloc]init];
         [timeDic setObject:[_dataSourceForDate objectAtIndex:4] forKey:@"date"];
        [timeDic setObject:[endTime5 objectAtIndex:i] forKey:@"end_time"];
        [timeDic setObject:[starTime5 objectAtIndex:i] forKey:@"start_time"];
        [_AllTimeArray addObject:timeDic];
    }
    [self.tableView reloadData];
}
- (void)ReservationTimeWithArray6:(NSMutableArray *)starTime6 endTime1:(NSMutableArray *)endTime6{
    for (int i=0; i<starTime6.count; i++) {
        NSMutableDictionary *timeDic=[[NSMutableDictionary alloc]init];
        [timeDic setObject:[starTime6 objectAtIndex:i] forKey:@"start_time"];
        [timeDic setObject:[endTime6 objectAtIndex:i] forKey:@"end_time"];
        [timeDic setObject:[_dataSourceForDate objectAtIndex:5] forKey:@"date"];
          [_AllTimeArray addObject:timeDic];
    }
    [self.tableView reloadData];
}
- (void)ReservationTimeWithArray7:(NSMutableArray *)starTime7 endTime1:(NSMutableArray *)endTime7{
    for (int i=0; i<starTime7.count; i++) {
        NSMutableDictionary *timeDic=[[NSMutableDictionary alloc]init];
        [timeDic setObject:[_dataSourceForDate objectAtIndex:6] forKey:@"date"];
         [timeDic setObject:[endTime7 objectAtIndex:i] forKey:@"end_time"];
         [timeDic setObject:[starTime7 objectAtIndex:i] forKey:@"start_time"];
          [_AllTimeArray addObject:timeDic];
    }
    [self.tableView reloadData];
}
#pragma marl -懒加载
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-49) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.separatorInset=UIEdgeInsetsMake(hight(98), 15, 1, 15);
        _tableView.backgroundColor=COMMONRBGCOLOR;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}

@end
