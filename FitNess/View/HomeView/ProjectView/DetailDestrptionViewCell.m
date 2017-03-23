//
//  DetailDestrptionViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/23.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "DetailDestrptionViewCell.h"
@interface DetailDestrptionViewCell()
{
    UIView *backView;
    UIView *descriptionView;
    
}
@end
@implementation DetailDestrptionViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    backView=[MyView uiview:0 bColor:COMMONRBGCOLOR rect:CGRectMake(0, 0, SCREENWIDTH, hight(280))];
    [self addSubview:backView];
    descriptionView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, 15, SCREENWIDTH, hight(260))];
    [backView addSubview:descriptionView];
    UIView *deView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, 0, SCREENWIDTH, hight(100))];
    [descriptionView addSubview:deView];
    UILabel *descriptionLabel=[MyView label:@"详情描述" tColor: [tools colorWithHex:0x3333333] font:    [UIFont systemFontOfSize:17] rect:CGRectMake(15, hight(34), SCREENWIDTH-60, hight(34))];
    [deView addSubview:descriptionLabel];
    [descriptionView addSubview:[self addLineView:CGRectMake(15, deView.xmg_bottom-1, SCREENWIDTH-30, 1) color:LINECOLOR]];
    
    UIView *deView2=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, deView.xmg_bottom, SCREENWIDTH, hight(160))];
    [descriptionView addSubview:deView2];
    _destrptionStr=@"每节课针对不同的身体区域进行局部特训：主要针对上肢，下肢，腰，背，臀，腿，腹部等几大区域训练！针对某个需要改善的区域训练达到燃脂塑性。";
    CGRect tempRect=[_destrptionStr boundingRectWithSize:CGSizeMake(SCREENWIDTH-30, hight(140)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
    UILabel *descriptionLabel2=[MyView label:_destrptionStr tColor: [tools colorWithHex:0x666666] font:    [UIFont systemFontOfSize:14] rect:CGRectMake(15, hight(34),tempRect.size.width , tempRect.size.height)];
    descriptionLabel2.numberOfLines=0;
    [deView2 addSubview:descriptionLabel2];
}

- (UIView *)addLineView : (CGRect)frame color : (UIColor *)color{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}
+(instancetype)DetailDestrptionViewCell:(UITableView *)tableView{
    NSString *Identifer=NSStringFromClass([self class]);
    [tableView registerClass:[DetailDestrptionViewCell class] forCellReuseIdentifier:Identifer];
    return [tableView dequeueReusableCellWithIdentifier:Identifer];
}

@end
