//
//  ProjectHeadView.m
//  FitNess
//
//  Created by xuqq on 2017/3/23.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ProjectHeadView.h"
@interface ProjectHeadView()
@property(nonatomic,strong) UIView *headView;
@property(nonatomic,strong) UIView *TwoView;
@end
@implementation ProjectHeadView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    _headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(1000))];
    _headView.backgroundColor=[UIColor whiteColor];
    [self addSubview:_headView];
    //构建广告视图
    _imageArray=@[@"img1",@"img1",@"img1",@"img1"];
    //设置顶部轮播器
    SDCycleScrollView *scrollView=[[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(600))];
    scrollView.delegate=self;
    scrollView1=  scrollView;
    //设置分页位置
    scrollView1.pageControlAliment=SDCycleScrollViewPageContolAlimentCenter;
    //设置时间间隔
    scrollView1.autoScrollTimeInterval=3.0;
    //设置当前分页圆点颜色
    scrollView1.currentPageDotColor=[UIColor colorWithRed:255/255.0 green:184/255.0 blue:31/255.0 alpha:1.0] ;
    //设置其他分页圆点颜色
    scrollView1.pageDotColor=[UIColor lightGrayColor];
    //设置动画样式
    scrollView1.pageControlStyle=SDCycleScrollViewPageContolStyleClassic; scrollView1.localizationImageNamesGroup=_imageArray;
    [_headView addSubview:scrollView1];
    [self CreateDetail];
}
- (void)CreateDetail{
    _TwoView=[[UIView alloc]initWithFrame:CGRectMake(0, scrollView1.xmg_bottom, SCREENWIDTH, hight(400))];
    _TwoView.backgroundColor=[UIColor whiteColor];
    [_headView addSubview:self.TwoView];
    [_TwoView addSubview:self.courseName];
    [_TwoView addSubview:self.courseDetail];
    [_TwoView addSubview:self.courseCollect];
    [_TwoView addSubview:self.courseTime];
    [_TwoView addSubview:self.courseAstrict];
    [_TwoView addSubview:self.courseStick];
    [_TwoView addSubview:self.courseDetailBtn];
    [_TwoView addSubview:self.priceAfter];
    [_TwoView addSubview:self.priceBefore];
    [_TwoView addSubview:self.likeNumber];
    [_TwoView addSubview:self.buyNumber];
    
    [_TwoView addSubview:[self addLineView:CGRectMake(0, self.priceAfter.xmg_bottom+10, SCREENWIDTH, 1) color:LINECOLOR]];
    _numberButton=[PPNumberButton numberButtonWithFrame:CGRectMake(SCREENWIDTH-wight(210)-15, _priceAfter.xmg_bottom+20, wight(210), hight(66))];
    _numberButton.shakeAnimation=YES;
    _numberButton.borderColor=LINECOLOR;
    _numberButton.increaseImage=[UIImage imageNamed:@"plus2"];
    _numberButton.decreaseImage=[UIImage imageNamed:@"less3"];
    [_TwoView addSubview:self.numberButton];
    _numberButton.numberBlock=^(NSString *num){
        
        XQQLog(@"%@",num);
    };
    
    
}
- (UIView *)addLineView : (CGRect)frame color : (UIColor *)color{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}
#pragma mark -懒加载
- (UILabel *)courseName{
    if (!_courseName) {
        NSString * str=@"健康减脂超值套课";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(34)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
        _courseName=[[UILabel alloc]initWithFrame:CGRectMake(15, 10,tempRect.size.width , tempRect.size.height)];
        _courseName.text=str;
        _courseName.textColor=[tools colorWithHex:0x333333];
        _courseName.font=[UIFont systemFontOfSize:17];
    }
    return _courseName;
}
- (UIButton *)courseCollect{
    if (!_courseCollect) {
      
        _courseCollect=[[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH-wight(43)-10, 10, wight(43), hight(38))];
        [_courseCollect setImage:[UIImage imageNamed:@"like1"] forState:UIControlStateNormal];
        [_courseCollect setImage:[UIImage imageNamed:@"like"] forState:UIControlStateHighlighted];
    }
    return _courseCollect;
}
-(UILabel *)courseDetail{
    if (!_courseDetail) {
        NSString * str=@"哈他瑜伽最适合初学者，是通过身体的姿势、呼吸和放松的技巧。";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(wight(620), hight(120)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil];
        _courseDetail=[[UILabel alloc]initWithFrame:CGRectMake(15, _courseName.xmg_bottom+5,tempRect.size.width , tempRect.size.height)];
        _courseDetail.text=str;
        _courseDetail.numberOfLines=0;
        _courseDetail.textColor=[tools colorWithHex:0x666666];
        _courseDetail.font=[UIFont systemFontOfSize:13];
    }
    return _courseDetail;
}
- (UIButton *)courseTime{
    if (!_courseTime) {
        _courseTime=[[UIButton alloc]initWithFrame:CGRectMake(15, _courseDetail.xmg_bottom+5, wight(178), hight(38))];
        [_courseTime setImage:[UIImage imageNamed:@"time1"] forState:UIControlStateNormal];
        [_courseTime setTitle:@"耗时60分钟" forState: UIControlStateNormal];
        [_courseTime setTitleColor:[tools colorWithHex:0x999999] forState:UIControlStateNormal];
          _courseTime.titleLabel.font=[UIFont systemFontOfSize:12];
        CGFloat space=8.0;
        [_courseTime layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:space];
    }
    return _courseTime;
}
- (UIButton *)courseAstrict{
    if (!_courseAstrict) {
        _courseAstrict=[[UIButton alloc]initWithFrame:CGRectMake(_courseTime.xmg_right+25, _courseDetail.xmg_bottom+5, wight(178), hight(38))];
        [_courseAstrict setImage:[UIImage imageNamed:@"lady"] forState:UIControlStateNormal];
        [_courseAstrict setTitle:@"仅限女士预约" forState: UIControlStateNormal];
        [_courseAstrict setTitleColor:[tools colorWithHex:0x999999] forState:UIControlStateNormal];
        _courseAstrict.titleLabel.font=[UIFont systemFontOfSize:12];
        CGFloat space=8.0;
        [_courseAstrict layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:space];
    }
    return _courseAstrict;
}
- (UIButton *)courseStick{
    if (!_courseStick) {
        _courseStick=[[UIButton alloc]initWithFrame:CGRectMake(_courseAstrict.xmg_right+25, _courseDetail.xmg_bottom+5, wight(178), hight(38))];
        [_courseStick setImage:[UIImage imageNamed:@"persist"] forState:UIControlStateNormal];
        [_courseStick setTitle:@"需要坚持" forState: UIControlStateNormal];
        [_courseStick setTitleColor:[tools colorWithHex:0x999999] forState:UIControlStateNormal];
           _courseStick.titleLabel.font=[UIFont systemFontOfSize:12];
        CGFloat space=8.0;
        [_courseStick layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:space];
    }
    return _courseStick;
}
- (UIButton *)courseDetailBtn{
    if (!_courseDetailBtn) {
        _courseDetailBtn=[[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH-wight(26)-10, _courseDetail.xmg_bottom+5, wight(26), hight(35))];
        [_courseDetailBtn setImage:[UIImage imageNamed:@"more4"] forState:UIControlStateNormal];
        CGFloat space=10.0;
        [_courseDetailBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:space];
    }
    return _courseDetailBtn;
}
- (UILabel *)priceAfter{
    if (!_priceAfter) {
        NSString * str=@"￥";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];

        UILabel *money=[MyView label:str tColor:[tools colorWithHex:0xFF5a00] font:[UIFont systemFontOfSize:14] rect:CGRectMake(15, _courseTime.xmg_bottom+20,tempRect.size.width , tempRect.size.height)];
        [_TwoView addSubview:money];
        NSString * str1=@"888";
        CGRect tempRect1=[str1 boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(60)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25]} context:nil];
        _priceAfter=[[UILabel alloc]initWithFrame:CGRectMake(money.xmg_right, _courseTime.xmg_bottom+10,tempRect1.size.width , tempRect1.size.height)];
        _priceAfter.text=str1;
        _priceAfter.textColor=[tools colorWithHex:0xFF5a00];
        _priceAfter.font=[UIFont systemFontOfSize:25];
    }
    return _priceAfter;
}
- (UILabel *)priceBefore{
    if (!_priceBefore) {
        NSString * str=@"￥1299";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(60)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:str attributes:attribtDic];
        _priceBefore=[[UILabel alloc]initWithFrame:CGRectMake(_priceAfter.xmg_right+5, _courseTime.xmg_bottom+20,tempRect.size.width , tempRect.size.height)];
        _priceBefore.attributedText=attribtStr;
        _priceBefore.textColor=[tools colorWithHex:0x999999];
        _priceBefore.font=[UIFont systemFontOfSize:15];
    }
    return _priceBefore;
}
- (UILabel *)likeNumber{
    if (!_likeNumber) {
        NSString * str=@"102人喜欢";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(60)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        _likeNumber=[[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-tempRect.size.width-15, _courseTime.xmg_bottom+20,tempRect.size.width , tempRect.size.height)];
        _likeNumber.text=str;
        _likeNumber.textColor=[tools colorWithHex:0x666666];
        _likeNumber.font=[UIFont systemFontOfSize:15];
    }
    return _likeNumber;
}
- (UILabel *)buyNumber{
    if (!_buyNumber) {
        NSString * str=@"购买数量" ;
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(30)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        UILabel *BuyLabel=[MyView label:str tColor:[tools colorWithHex:0x666666] font:[UIFont systemFontOfSize:15] rect:CGRectMake(15,  _priceAfter.xmg_bottom+30,tempRect.size.width , tempRect.size.height)];
        [_TwoView addSubview:BuyLabel];
        NSString * str1=@"限购1份" ;
        CGRect tempRect1=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(30)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
        _buyNumber=[MyView label:str1 tColor:[tools colorWithHex:0xFFB81F] font:[UIFont systemFontOfSize:14] rect:CGRectMake(BuyLabel.xmg_right+10,  _priceAfter.xmg_bottom+30,tempRect1.size.width , tempRect1.size.height)];
    }
    return _buyNumber;
}
@end
