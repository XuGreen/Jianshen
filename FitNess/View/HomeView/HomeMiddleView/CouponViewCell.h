//
//  CouponViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/17.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CouponViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *CouponImageView;
@property(nonatomic,strong)UILabel          *CouponName;
@property(nonatomic,strong)UILabel          *CouponZhe;
+ (instancetype)CouponViewCell:(UITableView *)tableView;
@end
