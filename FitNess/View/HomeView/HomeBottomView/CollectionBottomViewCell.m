//
//  CollectionBottomViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/17.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "CollectionBottomViewCell.h"
@interface CollectionBottomViewCell(){
    UIView *backView;
}
@end
@implementation CollectionBottomViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initUI];
    }
    return self;
}
- (void)initUI{
   backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, wight(375), hight(620))];
    backView.backgroundColor=[UIColor whiteColor];
    backView.layer.borderColor=[LINECOLOR CGColor];
    backView.layer.borderWidth=0.5;
    [self addSubview:backView];
    [backView addSubview:self.ShouImageView];
    [backView addSubview:self.ShouName];
    [backView addSubview:self.ShouType];
    [backView addSubview:self.ShouStar];
    [backView addSubview:self.ShouStrong];
    [backView addSubview:self.ShouFans];
     [backView addSubview:self.YueBtn];
}
- (UIImageView *)ShouImageView{
    if (!_ShouImageView) {
        _ShouImageView=[[UIImageView alloc]initWithFrame:CGRectMake(8, 8, backView.xmg_width-16,hight(346))];
        _ShouImageView.image=[UIImage imageNamed:@"image"];
    }
    return _ShouImageView;
}
- (UILabel *)ShouName{
    if (!_ShouName) {
        NSString * str=@"Joker";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18]} context:nil];
        _ShouName=[[UILabel alloc]initWithFrame:CGRectMake(10, _ShouImageView.xmg_bottom+10, tempRect.size.width, tempRect.size.height)];
        _ShouName.text=str;
        _ShouName.textColor=[tools colorWithHex:0x333333];
        _ShouName.font=[UIFont boldSystemFontOfSize:18];
    }
    return _ShouName;
}
- (UILabel *)ShouType{
    if (!_ShouType) {
        NSString * str=@"健身教练";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(26)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
        _ShouType=[[UILabel alloc]initWithFrame:CGRectMake(_ShouName.xmg_right+8, _ShouImageView.xmg_bottom+13, tempRect.size.width, tempRect.size.height)];
        _ShouType.text=str;
        _ShouType.textColor=[tools colorWithHex:0x333333];
        _ShouType.font=[UIFont systemFontOfSize:14];
    }
    return _ShouType;
}
- (UILabel *)ShouStar{
    if (!_ShouStar) {
        _ShouStar=[[UILabel alloc]initWithFrame:CGRectMake(10, _ShouName.xmg_bottom+10, wight(160), hight(22))];
        _ShouStar.text=@"⭐️⭐️⭐️⭐️⭐️";
        _ShouStar.textColor=MAINCOLOR;
        _ShouStar.font=[UIFont systemFontOfSize:10];
    }
    return _ShouStar;
}
- (UILabel *)ShouStrong{
    if (!_ShouStrong) {
        _ShouStrong=[[UILabel alloc]initWithFrame:CGRectMake(10, _ShouStar.xmg_bottom+10, wight(345), hight(23))];
        _ShouStrong.text=@"擅长:瘦腿、提臀、马甲线、增肌等等";
        _ShouStrong.textColor=[tools colorWithHex:0x666666];
        _ShouStrong.font=[UIFont systemFontOfSize:12];
    }
    return _ShouStrong;
}
- (UILabel *)ShouFans{
    if (!_ShouFans) {
        NSString * str=@"541人关注";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        _ShouFans=[[UILabel alloc]initWithFrame:CGRectMake(15, _ShouStrong.xmg_bottom+30, tempRect.size.width, tempRect.size.height)];
        _ShouFans.text=str;
        _ShouFans.textColor=[tools colorWithHex:0x999999];
        _ShouFans.font=[UIFont systemFontOfSize:15];
    }
    return _ShouFans;
}
- (UIButton *)YueBtn{
    if (!_YueBtn) {
        _YueBtn=[[UIButton alloc]initWithFrame:CGRectMake(backView.xmg_width-40, _ShouStrong.xmg_bottom+20, hight(61), wight(60))];
        [_YueBtn setTitle:@"约" forState:UIControlStateNormal];
        [_YueBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _YueBtn.backgroundColor=MAINCOLOR;
        _YueBtn.layer.masksToBounds=YES;
        _YueBtn.layer.cornerRadius=5;
        _YueBtn.titleLabel.font=[UIFont boldSystemFontOfSize:20];
    }
    return _YueBtn;
}
@end
