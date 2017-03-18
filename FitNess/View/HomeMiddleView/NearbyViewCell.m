//
//  NearbyViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/17.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "NearbyViewCell.h"
@interface NearbyViewCell (){
    UIView *NearbyView;
    UIButton *moreBtn;
}
@end
@implementation NearbyViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
   
    }
    return self;
}
- (void)initUI{
    UIView *backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, wight(368))];
    backView.backgroundColor=COMMONRBGCOLOR;
    [self addSubview:backView];
    NearbyView= [[UIView alloc]initWithFrame:CGRectMake(0, 15, SCREENWIDTH, backView.xmg_height-15)];
    NearbyView.backgroundColor=[UIColor whiteColor];
    [backView addSubview:NearbyView];
    UIImageView *praiseimageView=[[UIImageView alloc]initWithFrame:CGRectMake(15, 12, 20, 18)];
    praiseimageView.image=[UIImage imageNamed:@"nearby-1"];
    [NearbyView addSubview:praiseimageView];
    UILabel *gistLabel=[[UILabel alloc]initWithFrame:CGRectMake(praiseimageView.xmg_width+20, praiseimageView.xmg_x-10, 130, 32)];
    gistLabel.textColor=[tools colorWithHex:0x333333];
    gistLabel.text=@"附近场馆";
    gistLabel.font=[UIFont systemFontOfSize:17];
    [NearbyView addSubview:gistLabel];
    
    moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    moreBtn.frame = CGRectMake(SCREENWIDTH-80, 5, 80, 40);
    [moreBtn setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    [moreBtn setTitleColor:[tools colorWithHex:0x666666] forState:UIControlStateNormal];
    moreBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    CGFloat space = 20.0;
    [moreBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight
                             imageTitleSpace:space];
    [NearbyView addSubview:moreBtn];
    //图片
    [NearbyView addSubview:self.NearImageView];
    [NearbyView addSubview:self.NearName];
    [NearbyView addSubview:self.NearDistance];
    [NearbyView addSubview:self.NearStar];
    [NearbyView addSubview:self.NearDetail];
    [NearbyView addSubview:self.NearPrice];

}
#pragma mark -懒加载
//场馆图片
- (UIImageView *)NearImageView{
    if (!_NearImageView) {
        _NearImageView=[[UIImageView alloc]initWithFrame:CGRectMake(15, moreBtn.xmg_bottom, hight(225),wight(224))];
        _NearImageView.image=[UIImage imageNamed:@"background"];
    }
    return _NearImageView;
}
//场馆名称
-(UILabel *)NearName{
    if (!_NearName) {
        _NearName=[[UILabel alloc]initWithFrame:CGRectMake(_NearImageView.xmg_right+10, moreBtn.xmg_bottom, hight(333), wight(32))];
        _NearName.text=@"三百勇士健身会所";
        _NearName.textColor=[tools colorWithHex:0x333333];
        _NearName.font=[UIFont systemFontOfSize:17];
    }
    return _NearName;
}
//场馆距离
-(UILabel *)NearDistance{
    if (!_NearDistance) {
        _NearDistance=[[UILabel alloc]initWithFrame:CGRectMake(_NearName.xmg_right, moreBtn.xmg_bottom, hight(140), wight(22))];
        _NearDistance.text=@"<500m";
        _NearDistance.textColor=[tools colorWithHex:0x999999];
        _NearDistance.font=[UIFont systemFontOfSize:14];
    }
    return _NearDistance;
}
//场馆评分
-(UILabel *)NearStar{
    if (!_NearStar) {
        _NearStar=[[UILabel alloc]initWithFrame:CGRectMake(_NearImageView.xmg_right+10, _NearName.xmg_bottom+10, hight(160), wight(22))];
        _NearStar.text=@"⭐️⭐️⭐️⭐️⭐️";
        _NearStar.textColor=MAINCOLOR;
        _NearStar.font=[UIFont systemFontOfSize:10];
    }
    return _NearStar;
}
//场馆介绍
-(UILabel *)NearDetail{
    if (!_NearDetail) {
        _NearDetail=[[UILabel alloc]initWithFrame:CGRectMake(_NearImageView.xmg_right+10, _NearStar.xmg_bottom, hight(455), wight(103))];
        _NearDetail.text=@"本店拥有游泳、普拉提、瑜伽、动感单车等各种项目";
        _NearDetail.numberOfLines=0;
        _NearDetail.textColor=[tools colorWithHex:0x999999];
        _NearDetail.font=[UIFont systemFontOfSize:14];
    }
    return _NearDetail;
}
//场馆消费人数
-(UILabel *)NearPrice{
    if (!_NearPrice) {
        UIImageView *PraiseView=[[UIImageView alloc]initWithFrame:CGRectMake(_NearImageView.xmg_right+150, _NearDetail.xmg_bottom, hight(32), wight(32))];
        PraiseView.image=[UIImage imageNamed:@"nopraise"];
        [NearbyView addSubview:PraiseView];
        _NearPrice=[[UILabel alloc]initWithFrame:CGRectMake(PraiseView.xmg_right+5, _NearDetail.xmg_bottom, hight(154), wight(28))];
        _NearPrice.text=@"861消费";
        _NearPrice.textColor=[tools colorWithHex:0x666666];
        _NearPrice.font=[UIFont systemFontOfSize:15];
    }
    return _NearPrice;
}
+(instancetype)NearbyViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[NearbyViewCell class] forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
