//
//  MeOrderViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/21.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeOrderViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *personImage;
@property(nonatomic,strong)UILabel          *personName;
@property(nonatomic,strong)UILabel          *personType;
@property(nonatomic,strong)UILabel          *serverNumber;
@property(nonatomic,strong) UILabel         *orderDetail;

+ (instancetype)MeOrderViewCell:(UITableView *)tableView;
@end
