//
//  PersonDetailViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/24.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonDetailViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView  *personImage;
@property(nonatomic,strong)UILabel           *personName;
@property(nonatomic,strong)UIView            *starView;
@property(nonatomic,strong)UIView            *personView;
+ (instancetype)PersonDetailViewCell:(UITableView *)tableView;
@end
