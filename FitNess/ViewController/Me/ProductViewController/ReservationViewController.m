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

@interface ReservationViewController ()<UITableViewDelegate,UITableViewDataSource>{
    ServerView *header;
    NSString *timeStr;
}
@property(nonatomic,strong) UITableView    *tableView;
@property(nonatomic, strong)NSArray   *hourArray1;
@property(nonatomic, strong)NSArray   *minArray1;
@property(nonatomic, strong)NSArray   *hourArray2;
@property(nonatomic, strong)NSArray   *minArray2;
@property (strong, nonatomic) NSArray *dataSourceForWeek;
@property (strong, nonatomic) NSArray *dataSourceForDay;

@end

@implementation ReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _hourArray1 = [NSArray arrayWithObjects:@"08",@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22", nil];
    _minArray1 = [NSArray arrayWithObjects:@"00",@"30" ,@"00",nil];
    _hourArray2=  [NSArray arrayWithObjects:@"08",@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22", nil];
    _minArray2 = [NSArray arrayWithObjects:@"00",@"30" ,@"00",nil];
    _dataSourceForDay=[[NSArray alloc]init];
    _dataSourceForWeek=[[NSArray alloc]init];
    [self setNav];
    [self.view addSubview:self.tableView];
    [self setHeaderView];
    [self setWeek];
    [self setDate];
    
    
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
- (void)setHeaderView{
    header=[[ServerView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(140))];
    UITapGestureRecognizer *tap1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(updateTimeTap:)];
    [header.UpdateImageView addGestureRecognizer:tap1];
    self.tableView.tableHeaderView=header;
}
-(void)action_onBackButton:(UIButton *)sender{
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
          XQQLog(@"%@:%@-%@:%@",selectedhourStr1,selectedminStr1,selectedhourStr2,selectedminStr2);
       
    };
    [appdelegate.window addSubview:chooseView];
    
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
