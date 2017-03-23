//
//  SaverViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/23.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaverViewCell : UITableViewCell
@property(nonatomic,strong)NSArray *conponArray;
@property(nonatomic,strong)NSArray  *conponArray1;
+ (instancetype)SaverViewCell:(UITableView *)tableView;
@end
