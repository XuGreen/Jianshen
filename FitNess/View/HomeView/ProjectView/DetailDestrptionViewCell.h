//
//  DetailDestrptionViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/23.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailDestrptionViewCell : UITableViewCell
@property(nonatomic,strong)NSString *destrptionStr;
+ (instancetype)DetailDestrptionViewCell:(UITableView *)tableView;
@end
