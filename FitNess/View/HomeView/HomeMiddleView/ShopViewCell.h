//
//  ShopViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/17.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *ShopImageView;
@property(nonatomic,strong)UILabel          *ShopName;
@property(nonatomic,strong)UILabel          *ShopPriceNum;
@property(nonatomic,strong)UILabel          *ShopType;
+ (instancetype)ShopViewCell:(UITableView *)tableView;
@end
