//
//  ProtectionViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/29.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ProtectionViewCell.h"

@implementation ProtectionViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    _backView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, 0, SCREENWIDTH, hight(190))];
    [self addSubview:self.backView];
    [self.backView addSubview:[MyView addLineView:CGRectMake(15, self.backView.xmg_height-1, SCREENWIDTH-30, 1) color:LINECOLOR]];
    [self.backView addSubview:self.imageViews];
     [self.backView addSubview:self.titleLabel];
     [self.backView addSubview:self.detailLabel];
}
-(UIImageView *)imageViews{
    if (!_imageViews) {
        _imageViews=[MyView Image:@"time4" corner:0 rect:CGRectMake(15, 10, wight(60), hight(60))];
    }
    return _imageViews;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {

        _titleLabel=[MyView label:@"迟到升级" tColor: [tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(_imageViews.xmg_right+5, 15, SCREENWIDTH-100, hight(40))];
    }
    return _titleLabel;
}
- (UILabel *)detailLabel{
    if (!_detailLabel) {
        NSString * str=@"手艺人迟到30分钟，按档次服务实付金额的150%免费升级项目";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(100)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
        _detailLabel=[MyView label:str tColor: [tools colorWithHex:0x666666] font:[UIFont systemFontOfSize:13] rect:CGRectMake(_imageViews.xmg_right+5, _titleLabel.xmg_bottom+5, tempRect.size.width, tempRect.size.height)];
        _detailLabel.numberOfLines=0;
    }
    
    return _detailLabel;
}
+ (instancetype)ProtectionViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[ProtectionViewCell class] forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
