//
//  ReservationTimeViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/29.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReservationTimeViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *AddImageView;
@property(nonatomic,strong)UILabel          *dayLabel;
@property(nonatomic,strong)UILabel          *dateLabel;
@property(nonatomic,strong)UIView           *backView;
@property(nonatomic,strong)UILabel          *timeLabel1;
@property(nonatomic,strong)NSString        *timeStr;
@property(nonatomic, strong)NSArray   *hourArray1;
@property(nonatomic, strong)NSArray   *minArray1;
@property(nonatomic, strong)NSArray   *hourArray2;
@property(nonatomic, strong)NSArray   *minArray2;
@property(nonatomic, strong)NSMutableArray *labelarray;
+ (instancetype)ReservationTimeViewCell:(UITableView *)tableView;
@end
