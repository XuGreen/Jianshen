//
//  EvaluateViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/24.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluateViewCell : UITableViewCell
@property(nonatomic,strong)NSArray *evaluateArray;
@property(nonatomic,strong)UIImageView *personImage;
@property(nonatomic,strong)UILabel *personName;
@property(nonatomic,strong)UILabel *evaluateTime;
@property(nonatomic,strong)UIView  *startView;
@property(nonatomic,strong)UILabel *evaluateDetail;
@property(nonatomic,strong)UILabel *evaluateReply;
@property(nonatomic,strong)NSArray         *evaluateImage;
  @property(nonatomic,strong) UIImageView *ReplyView;
+ (instancetype)EvaluateViewCell:(UITableView *)tableView;
@end
