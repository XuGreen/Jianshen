//
//  JobsViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/22.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobsViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *Position;
@property(nonatomic,strong)UILabel *workingAge ;
@property(nonatomic,strong)UILabel *jobNature;
@property(nonatomic,strong)UILabel *pubDate;
@property(nonatomic,strong)UILabel *Pay;
@property(nonatomic,strong)UILabel *area;
@property(nonatomic,strong)UIImageView *PositionImage;
@property(nonatomic,strong)UIImageView *userImage;
@property(nonatomic,strong)UILabel *userName;
@property(nonatomic,strong)UILabel *userCompany;
@property(nonatomic,strong)UIButton *ChatBtn;
@property(nonatomic, strong) NSArray *photoItemArray;
@property (nonatomic, strong)   UIView *JobView;
+ (instancetype)JobsViewCell:(UITableView *)tableView;
@end
