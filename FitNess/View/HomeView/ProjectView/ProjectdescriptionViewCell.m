//
//  ProjectdescriptionViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/23.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ProjectdescriptionViewCell.h"

@interface ProjectdescriptionViewCell()
{
    UIView *backView;
    UIView *descriptionView;
    
}
@end
@implementation ProjectdescriptionViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    backView=[MyView uiview:0 bColor:COMMONRBGCOLOR rect:CGRectMake(0, 0, SCREENWIDTH, hight(310))];
    [self addSubview:backView];
    descriptionView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, 15, SCREENWIDTH, hight(290))];
    [backView addSubview:descriptionView];
    UIView *deView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, 0, SCREENWIDTH, hight(100))];
    [descriptionView addSubview:deView];
    UILabel *descriptionLabel=[MyView label:@"项目说明" tColor: [tools colorWithHex:0x3333333] font:    [UIFont systemFontOfSize:17] rect:CGRectMake(15, hight(34), SCREENWIDTH-60, hight(34))];
    [deView addSubview:descriptionLabel];
    [descriptionView addSubview:[self addLineView:CGRectMake(15, deView.xmg_bottom-1, SCREENWIDTH-30, 1) color:LINECOLOR]];
    
    UIView *deView2=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, deView.xmg_bottom, SCREENWIDTH, hight(190))];
    [descriptionView addSubview:deView2];
    
    NSString * shiyongstr=@"适用人群:";
    CGRect shiyongRect=[shiyongstr boundingRectWithSize:CGSizeMake(SCREENWIDTH-100, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    UILabel *shiyong=[MyView label:shiyongstr tColor: [tools colorWithHex:0x999999] font:  [UIFont systemFontOfSize:15] rect:  CGRectMake(15, hight(34), shiyongRect.size.width, shiyongRect.size.height)];
    [deView2 addSubview:shiyong];
    NSString * str=@"适用于各种体质人群";
    CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-100, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    UILabel *descriptionLabel2=[MyView label:str tColor: [tools colorWithHex:0x666666] font: [UIFont systemFontOfSize:15] rect:CGRectMake(shiyong.xmg_right+5, hight(34),tempRect.size.width , tempRect.size.height)];
    [deView2 addSubview:descriptionLabel2];
    
    NSString *zhuyistr=@"注意事项:";
    CGRect zhuyiRect=[zhuyistr boundingRectWithSize:CGSizeMake(SCREENWIDTH-100, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
   
    UILabel *zhuyi=[MyView label:zhuyistr tColor: [tools colorWithHex:0x999999] font:  [UIFont systemFontOfSize:15] rect:  CGRectMake(15,  shiyong.xmg_bottom+10, zhuyiRect.size.width, zhuyiRect.size.height)];
    [deView2 addSubview:zhuyi];
    NSString * str1=@"健身前不要进食太多，尽量穿宽松运动服或者膝盖以上有弹性短裤";
    CGRect tempRect1=[str1 boundingRectWithSize:CGSizeMake(SCREENWIDTH-zhuyiRect.size.width-30, hight(134)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    UILabel *descriptionLabel3=[MyView label:str1 tColor: [tools colorWithHex:0x666666] font: [UIFont systemFontOfSize:15] rect:CGRectMake(zhuyi.xmg_right+5, shiyong.xmg_bottom+10,tempRect1.size.width , tempRect1.size.height)];
    descriptionLabel3.numberOfLines=0;
    [deView2 addSubview:descriptionLabel3];
}

- (UIView *)addLineView : (CGRect)frame color : (UIColor *)color{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}
+(instancetype)ProjectdescriptionViewCell:(UITableView *)tableView{
    NSString *Identifer=NSStringFromClass([self class]);
    [tableView registerClass:[ProjectdescriptionViewCell class] forCellReuseIdentifier:Identifer];
    return [tableView dequeueReusableCellWithIdentifier:Identifer];
}


@end
