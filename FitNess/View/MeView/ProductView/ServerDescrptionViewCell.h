//
//  ServerDescrptionViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/4/5.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerDescribeModel.h"
@interface ServerDescrptionViewCell: UITableViewCell
@property(nonatomic,strong)UITextField *titleName;
@property(nonatomic,strong)   UIButton *deleatebutton;
@property(nonatomic,strong) ServerDescribeModel *model;
+ (instancetype)ServerDescrptionViewCell:(UITableView *)tableView;

@end
