//
//  CollectionHotProjectViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/24.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "CollectionHotProjectViewCell.h"
@interface CollectionHotProjectViewCell(){
    UIView *backView;
}
@end
@implementation CollectionHotProjectViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    backView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, 0, wight(362), hight(564))];
    [self addSubview:backView];
    [backView addSubview:self.projectImageView];
    [backView addSubview:self.projectLabel];
    [backView addSubview:self.starView];
    [backView addSubview:self.personImage];
    [backView addSubview:self.projectPrice];
    [backView addSubview:self.personName];
    [backView addSubview:self.likeNumber];
    //优惠
    UIImageView *youhuiImage=[MyView Image:@"offer-bg" corner:0 rect:CGRectMake(0, hight(24), wight(160), hight(40))];
    [backView addSubview:youhuiImage];
    _youhuiLabel=[MyView label:@"8折优惠" tColor:[tools colorWithHex:0xFFFFFF] font:[UIFont systemFontOfSize:13] rect:CGRectMake(0, 0, wight(160), hight(40))];
    _youhuiLabel.textAlignment=NSTextAlignmentCenter;
    [youhuiImage addSubview:self.youhuiLabel];
    //首单立减
    UIImageView * jianImage=[MyView Image:@"less-bg" corner:0 rect:CGRectMake(0, youhuiImage.xmg_bottom+5, wight(160), hight(40))];
    [backView addSubview:jianImage];
    _jianLabel=[MyView label:@"首单减100" tColor:[tools colorWithHex:0xFFFFFF] font:[UIFont systemFontOfSize:13] rect:CGRectMake(0, 0, wight(160), hight(40))];
    _jianLabel.textAlignment=NSTextAlignmentCenter;
    [jianImage addSubview:self.jianLabel];
}
#pragma mark -懒加载
- (UIImageView *)projectImageView{
    if (!_projectImageView) {
        _projectImageView=[MyView Image:@"img1" corner:0 rect:CGRectMake(0, 0, wight(362), hight(362))];
    }
    return _projectImageView;
}

- (UILabel *)projectLabel{
    if (!_projectLabel) {
        _projectLabel=[MyView label:@"健康减脂超值套课" tColor: [tools colorWithHex:0x3333333] font: [UIFont systemFontOfSize:17] rect:CGRectMake(11, _projectImageView.xmg_bottom+hight(16), wight(360), hight(34))];
    }
    return _projectLabel;
}
- (UIView *)starView{
    if (!_starView) {
        _starView=[MyView uiview:0 bColor:[UIColor clearColor] rect:CGRectMake(11, _projectLabel.xmg_bottom+(hight(12)), wight(200), hight(28))];
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

- (UILabel *)projectPrice{
    if (!_projectPrice) {
        NSString * str=@"￥";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} context:nil];
        UILabel *money=[MyView label:str tColor:[tools colorWithHex:0xFF0000] font:[UIFont systemFontOfSize:20] rect:CGRectMake(backView.xmg_width-tempRect.size.width-55, _starView.xmg_bottom+8,tempRect.size.width , tempRect.size.height)];
        [backView addSubview:money];
        NSString * str1=@"888";
        CGRect tempRect1=[str1 boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(60)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25]} context:nil];
        _projectPrice=[MyView label:str1 tColor: [tools colorWithHex:0xFF0000] font: [UIFont systemFontOfSize:25] rect:CGRectMake(money.xmg_right, _starView.xmg_bottom+3, tempRect1.size.width, tempRect1.size.height)];
    }
    return _projectPrice;
}
- (UIImageView *)personImage{
    if (!_personImage) {
        _personImage=[MyView Image:@"background" corner:wight(66)/2 rect:CGRectMake(10, _starView.xmg_bottom+15, wight(66), hight(66))];
    }
    return _personImage;
}
- (UILabel *)personName{
    if (!_personName) {
        NSString *namestr=@"Joker";
        CGRect nameRect=[namestr boundingRectWithSize:CGSizeMake(SCREENWIDTH-100, hight(32)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
        _personName=[MyView label:namestr tColor:[tools colorWithHex:0x999999] font:[UIFont systemFontOfSize:16] rect:CGRectMake(_personImage.xmg_right+5, _personImage.xmg_y+hight(30), nameRect.size.width, nameRect.size.height)];
    }
    return _personName;
}
- (UILabel *)likeNumber{
    if (!_likeNumber) {
        NSString * str=@"21人喜欢";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(60)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
        _likeNumber=[MyView label:str tColor:[tools colorWithHex:0x999999] font:[UIFont systemFontOfSize:14] rect:CGRectMake(backView.xmg_width-tempRect.size.width-10,  _personImage.xmg_y+hight(31), tempRect.size.width, tempRect.size.height)];
    }
    return _likeNumber;
}
@end
