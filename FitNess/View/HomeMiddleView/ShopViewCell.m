//
//  ShopViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/17.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ShopViewCell.h"

@implementation ShopViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)ShopViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    UINib *nib=[UINib nibWithNibName:identifier bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}
@end
