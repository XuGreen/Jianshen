//
//  GiftwareViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/18.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GiftwareViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *GiftImageView;
@property(nonatomic,strong)UILabel          *GiftDetail;
@property(nonatomic,strong)UILabel          *GiftPrice;

+ (instancetype)GiftViewCell:(UITableView *)tableView;
@end
