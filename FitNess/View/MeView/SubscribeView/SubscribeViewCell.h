//
//  SubscribeViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/25.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubscribeViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *personImage;
@property(nonatomic,strong)UILabel          *personName;
@property(nonatomic,strong)UILabel          *personAddress;
@property(nonatomic,strong)UILabel          *serverNumber;
@property(nonatomic,strong)UILabel          *orderDetail;
@property(nonatomic,strong)UIButton        *stopServer;
@property(nonatomic,strong)UIButton        *AllOrderBtn;
+ (instancetype)SubscribeViewCell:(UITableView *)tableView;
@end
