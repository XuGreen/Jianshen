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
- (void)ReservationTimeWithArray : (NSMutableArray *)timeArray;

@end

@interface ReservationTimeViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *AddImageView;
@property(nonatomic,strong)UILabel          *dayLabel;
@property(nonatomic,strong)UILabel          *dateLabel;
@property(nonatomic,strong)UIView           *backView;
@property(nonatomic,strong)UILabel          *timeLabel1;
@property(nonatomic,strong)UILabel          *restLabel1;
@property(nonatomic,strong)NSString        *timeStr;
@property(nonatomic, strong)NSMutableArray   *hourArray1;
@property(nonatomic, strong)NSMutableArray   *minArray1;
@property(nonatomic, strong)NSMutableArray   *hourArray2;
@property(nonatomic, strong)NSMutableArray   *minArray2;
@property(nonatomic, strong)NSMutableArray *labelarray;

@property(nonatomic,weak)id <ReservationTimeDelegate>delegate;

+ (instancetype)ReservationTimeViewCell:(UITableView *)tableView;
@end
