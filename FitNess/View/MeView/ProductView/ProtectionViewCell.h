//
//  ProtectionViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/29.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProtectionViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *imageViews;
@property(nonatomic,strong)UILabel          *titleLabel;
@property(nonatomic,strong)UILabel          *detailLabel;
@property(nonatomic,strong)UIView           *backView;
+ (instancetype)ProtectionViewCell:(UITableView *)tableView;
@end
