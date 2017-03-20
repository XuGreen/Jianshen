//
//  NearbyViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/17.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NearbyViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *NearImageView;
@property(nonatomic,strong)UILabel          *NearName;
@property(nonatomic,strong)UILabel          *NearStar;
@property(nonatomic,strong)UILabel          *NearDetail;
@property(nonatomic,strong)UILabel          *NearDistance;
@property(nonatomic,strong)UIButton          *NearPriceBtn;

+ (instancetype)NearbyViewCell:(UITableView *)tableView;
@end
