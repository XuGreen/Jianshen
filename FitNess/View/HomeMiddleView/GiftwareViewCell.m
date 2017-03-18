//
//  GiftwareViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/18.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "GiftwareViewCell.h"
@interface GiftwareViewCell (){
    UIView *GistView;
}
@end
@implementation GiftwareViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    UIView *backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, wight(378))];
    backView.backgroundColor=COMMONRBGCOLOR;
    [self addSubview:backView];
    GistView= [[UIView alloc]initWithFrame:CGRectMake(0, 15, SCREENWIDTH, backView.xmg_height-15)];
    GistView.backgroundColor=[UIColor whiteColor];
    [backView addSubview:GistView];
    UIImageView *praiseimageView=[[UIImageView alloc]initWithFrame:CGRectMake(15, 12, 20, 18)];
    praiseimageView.image=[UIImage imageNamed:@"nopraise"];
    [GistView addSubview:praiseimageView];
    UILabel *gistLabel=[[UILabel alloc]initWithFrame:CGRectMake(praiseimageView.xmg_width+20, praiseimageView.xmg_x-10, 130, 32)];
    gistLabel.textColor=[tools colorWithHex:0x333333];
    gistLabel.text=@"精品项目";
    gistLabel.font=[UIFont systemFontOfSize:17];
    [GistView addSubview:gistLabel];
    
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    moreBtn.frame = CGRectMake(SCREENWIDTH-80, 5, 80, 40);
    [moreBtn setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    [moreBtn setTitleColor:[tools colorWithHex:0x666666] forState:UIControlStateNormal];
    moreBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    CGFloat space = 20.0;
    [moreBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight
                                  imageTitleSpace:space];
    [GistView addSubview:moreBtn];
    NSArray *imageArray=[NSArray arrayWithObjects:@"background",@"background",@"background", nil];
    for (int i=0; i<imageArray.count; i++) {
        _GiftImageView=[[UIImageView alloc]initWithFrame:CGRectMake(15+((hight(225)+5)*i), moreBtn.xmg_bottom, hight(225),wight(224))];
        _GiftImageView.image=[UIImage imageNamed:imageArray[i]];
        [GistView addSubview:_GiftImageView];
        UIView *mengView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, _GiftImageView.xmg_width, _GiftImageView.xmg_height)];
        mengView.backgroundColor=[tools colorWithHex:0x000000];
        mengView.alpha=0.6;

        _GiftDetail=[[UILabel alloc]initWithFrame:CGRectMake(10, _GiftImageView.xmg_height/2, hight(200), wight(30))];
        _GiftDetail .text=@"腹部肌肉训练";
        _GiftDetail.textColor=[UIColor whiteColor];
        _GiftDetail.textAlignment=NSTextAlignmentCenter;
        _GiftDetail.font=[UIFont systemFontOfSize:15];
        _GiftPrice=[[UILabel alloc]initWithFrame:CGRectMake(10, _GiftDetail.xmg_bottom, hight(190), wight(30))];
        _GiftPrice .text=@"￥999.99";
        _GiftPrice.textColor=MAINCOLOR;
        _GiftPrice.textAlignment=NSTextAlignmentCenter;
        _GiftPrice.font=[UIFont systemFontOfSize:14];

        [_GiftImageView addSubview:mengView];
        [_GiftImageView addSubview:self.GiftDetail];
        [_GiftImageView addSubview:self.GiftPrice];

    }
}
+ (instancetype)GiftViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[GiftwareViewCell class] forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}
@end
