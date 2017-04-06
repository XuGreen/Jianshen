//
//  ReservationTimeViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/29.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ReservationTimeDelegate <NSObject>

@optional
- (void)ReservationTimeWithArray1:(NSMutableArray *)starTime1 endTime1:(NSMutableArray *)endTime1;
- (void)ReservationTimeWithArray2:(NSMutableArray *)starTime2 endTime1:(NSMutableArray *)endTime2;
- (void)ReservationTimeWithArray3:(NSMutableArray *)starTime3 endTime1:(NSMutableArray *)endTime3;
- (void)ReservationTimeWithArray4:(NSMutableArray *)starTime4 endTime1:(NSMutableArray *)endTime4;
- (void)ReservationTimeWithArray5:(NSMutableArray *)starTime5 endTime1:(NSMutableArray *)endTime5;
- (void)ReservationTimeWithArray6:(NSMutableArray *)starTime6 endTime1:(NSMutableArray *)endTime6;
- (void)ReservationTimeWithArray7:(NSMutableArray *)starTime7 endTime1:(NSMutableArray *)endTime7;
@end

@interface ReservationTimeViewCell : UITableViewCell
@property(nonatomic,strong)UIButton *AddImageView;
@property(nonatomic,strong)UILabel          *dayLabel;
@property(nonatomic,strong)UILabel          *dateLabel;
@property(nonatomic,strong)UIView           *backView;
@property(nonatomic,strong)UILabel          *timeLabel1;
@property(nonatomic,strong)UILabel          *restLabel1;
@property(nonatomic,strong)NSString        *timeStr;
@property(nonatomic,strong)NSString        *RestStr;
//开始时间 -结束时间
@property(nonatomic,strong)NSString        *StartimeStr;
@property(nonatomic,strong)NSString        *EndtimeStr;

@property(nonatomic, strong)NSMutableArray   *hourArray1;
@property(nonatomic, strong)NSMutableArray   *minArray1;
@property(nonatomic, strong)NSMutableArray   *hourArray2;
@property(nonatomic, strong)NSMutableArray   *minArray2;

@property(nonatomic, strong)NSMutableArray *labelarray1;
@property(nonatomic, strong)NSMutableArray *labelarray2;
@property(nonatomic, strong)NSMutableArray *labelarray3;
@property(nonatomic, strong)NSMutableArray *labelarray4;
@property(nonatomic, strong)NSMutableArray *labelarray5;
@property(nonatomic, strong)NSMutableArray *labelarray6;
@property(nonatomic, strong)NSMutableArray *labelarray7;

@property(nonatomic, strong)NSMutableArray *Restarray1;
@property(nonatomic,weak)id <ReservationTimeDelegate>delegate;

+ (instancetype)ReservationTimeViewCell:(UITableView *)tableView;
@end
