//
//  OrderMangerViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/30.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderMangerViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *userName;
@property(nonatomic,strong)UILabel *statusLabel;
@property(nonatomic,strong)UIImageView *orderImage;
@property(nonatomic,strong)UILabel *OrderLabel;
@property(nonatomic,strong)UILabel *OrderMoney;
@property(nonatomic,strong)UILabel *OrderZheMoney;
@property(nonatomic,strong)UILabel *OrderNumber;
@property(nonatomic,strong)UILabel *maiNumber;
@property(nonatomic,strong)UILabel *ServerNumber;
@property(nonatomic,strong)UILabel *AllMoney;
@property(nonatomic,strong)UIButton *OrderBtn;

+ (instancetype)OrderMangerViewCell:(UITableView *)tableView;
@end
