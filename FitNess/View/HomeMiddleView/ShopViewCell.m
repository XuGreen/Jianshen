//
//  ShopViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/17.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ShopViewCell.h"
@interface ShopViewCell (){
    UIView *shopView;
    UIButton *moreBtn;
}
@end
@implementation ShopViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    UIView *backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, wight(580))];
    backView.backgroundColor=COMMONRBGCOLOR;
    [self addSubview:backView];
    shopView= [[UIView alloc]initWithFrame:CGRectMake(0, 15, SCREENWIDTH, backView.xmg_height-15)];
    shopView.backgroundColor=[UIColor whiteColor];
    [backView addSubview:shopView];
    UIImageView *praiseimageView=[[UIImageView alloc]initWithFrame:CGRectMake(15, 13, wight(22), hight(34))];
    praiseimageView.image=[UIImage imageNamed:@"recommend"];
    [shopView addSubview:praiseimageView];
    UILabel *gistLabel=[[UILabel alloc]initWithFrame:CGRectMake(praiseimageView.xmg_width+20, praiseimageView.xmg_x-10, 130, 32)];
    gistLabel.textColor=[tools colorWithHex:0x333333];
    gistLabel.text=@"推荐店铺";
    gistLabel.font=[UIFont systemFontOfSize:17];
    [shopView addSubview:gistLabel];
    
    moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    moreBtn.frame = CGRectMake(SCREENWIDTH-80, 5, 80, 40);
    [moreBtn setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    [moreBtn setTitleColor:[tools colorWithHex:0x666666] forState:UIControlStateNormal];
    moreBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    CGFloat space =10.0;
    [moreBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight
                             imageTitleSpace:space];
    [shopView addSubview:moreBtn];
    NSArray *imageArray=[NSArray arrayWithObjects:@"background",@"background", nil];
    for (int i=0; i<imageArray.count; i++) {
        UIView *ShopViews=[[UIView alloc]initWithFrame:CGRectMake(15+((SCREENWIDTH-40)/2+10)*i, moreBtn.xmg_bottom, (SCREENWIDTH-40)/2, wight(434))];
        ShopViews.backgroundColor=[UIColor clearColor];
        [shopView addSubview:ShopViews];
        _ShopImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ShopViews.xmg_width,wight(351))];
        _ShopImageView.image=[UIImage imageNamed:imageArray[i]];
        [ShopViews addSubview:_ShopImageView];
        //店铺图片
        _ShopName=[[UILabel alloc]initWithFrame:CGRectMake(0, _ShopImageView.xmg_bottom+10, hight(300), wight(30))];
        _ShopName .text=@"香蕉健身会馆";
        _ShopName.textColor=[tools colorWithHex:0x333333];
        _ShopName.textAlignment=NSTextAlignmentLeft;
        _ShopName.font=[UIFont systemFontOfSize:17];
        //消费人数
        _ShopPriceNum=[[UILabel alloc]initWithFrame:CGRectMake(ShopViews.xmg_width-hight(150), _ShopImageView.xmg_bottom+10, hight(150), wight(30))];
        _ShopPriceNum .text=@"211消费";
        _ShopPriceNum.textColor=[tools colorWithHex:0x999999];
        _ShopPriceNum.textAlignment=NSTextAlignmentRight;
        _ShopPriceNum.font=[UIFont systemFontOfSize:15];
        
        //健身类型
        _ShopType=[[UILabel alloc]initWithFrame:CGRectMake(0, _ShopName.xmg_bottom+10, hight(351), wight(30))];
        _ShopType .text=@"瑜伽 器械 游泳 舞蹈";
        _ShopType.textColor=MAINCOLOR;
        _ShopType.textAlignment=NSTextAlignmentLeft;
        _ShopType.font=[UIFont systemFontOfSize:15];
        
        [_ShopImageView addSubview:self.ShopName];
        [_ShopImageView addSubview:self.ShopType];
        [_ShopImageView addSubview:self.ShopPriceNum];
    }

    
}
+ (instancetype)ShopViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[ShopViewCell class] forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}
@end
