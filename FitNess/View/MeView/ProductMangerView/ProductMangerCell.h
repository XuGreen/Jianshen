//
//  ProductMangerCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/30.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductMangerCell : UITableViewCell
@property(nonatomic,strong)UIImageView *ProductImage;
@property(nonatomic,strong)UILabel *ProductTitle;
@property(nonatomic,strong)UILabel *ProductMoney;
@property(nonatomic,strong)UILabel *ProductShouchu;
@property(nonatomic,strong)UIButton *EditBtn;
@property(nonatomic,strong)UIButton *DeleteBtn;
@property(nonatomic, strong) UIButton *XianguanBtn;
@property(nonatomic,strong)NSArray *conponArray;
@property(nonatomic,strong)NSArray  *conponArray1;
+ (instancetype)ProductMangerCell:(UITableView *)tableView;
@end
