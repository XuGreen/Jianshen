//
//  PersonDetailViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/24.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "PersonDetailViewCell.h"
@interface PersonDetailViewCell(){
    UIView *backView;
    UIView *PersonViews;
}
@end
@implementation PersonDetailViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return  self;
}
- (void)initUI{
    backView=[MyView uiview:0 bColor:COMMONRBGCOLOR rect:CGRectMake(0, 0, SCREENWIDTH, hight(170))];
    [self addSubview:backView];
    PersonViews=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, 10, SCREENWIDTH, backView.xmg_height-10)];
    [backView addSubview:PersonViews];
    [PersonViews addSubview:self.personImage];
    [PersonViews addSubview:self.personName];
    [PersonViews addSubview:self.starView];
    [PersonViews addSubview:self.personView];
    UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH - wight(18)-15, hight(60), wight(18), hight(30))];
    arrow.image = [UIImage imageNamed:@"right"];
    [PersonViews addSubview:arrow];
}
- (UIImageView *)personImage{
    if (!_personImage) {
        _personImage=[MyView Image:@"background" corner:wight(100)/2 rect:CGRectMake(15, hight(25), wight(100), hight(100))];
    }
    return _personImage;
}
- (UILabel *)personName{
    if (!_personName) {
        NSString *str=@"明太";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
        _personName=[MyView label:str tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:16] rect:CGRectMake(_personImage.xmg_right+10, 20, tempRect.size.width, tempRect.size.height)];
    }
    return _personName;
}
- (UIView *)starView{
    if (!_starView) {
        _starView=[MyView uiview:0 bColor:[UIColor clearColor] rect:CGRectMake(_personName.xmg_right+10, 22, wight(200), hight(28))];
        //布置星星
        for (int index = 0; index < 5; ++index) {
            UIImageView *starImg = [[UIImageView alloc]initWithFrame:CGRectMake(index*wight(30), 0, wight(30), hight(24))];
            starImg.image = [UIImage imageNamed:@"star-rating-1"];
            starImg.tag = index+1000;
            [_starView addSubview:starImg];
        }

    }
    return _starView;
}
- (UIView *)personView{
    if (!_personView) {
        _personView=[MyView uiview:0 bColor:[UIColor clearColor] rect:CGRectMake(_personImage.xmg_right+10, _personName.xmg_bottom+5, wight(200), hight(40))];
        NSArray *imageArray=[NSArray arrayWithObjects:@"icon1", @"icon2",@"icon3",@"icon4",@"icon5",nil];
        //布置图片
        for (int index = 0; index < 5; ++index) {
            UIImageView *starImg = [[UIImageView alloc]initWithFrame:CGRectMake(index*wight(45), 0, wight(40), hight(40))];
            starImg.image = [UIImage imageNamed:imageArray[index]];
            starImg.tag = index+1000;
            [_personView addSubview:starImg];
        }
    }
    return _personView;
}
+(instancetype)PersonDetailViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[PersonDetailViewCell class] forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
