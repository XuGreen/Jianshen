//
//  EvaluateViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/24.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "EvaluateViewCell.h"
@interface EvaluateViewCell(){
    UIView *backView;
    UIView  *personView;
    UIView *EvaluateView;

}

@end
@implementation EvaluateViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    backView=[MyView uiview:0 bColor:COMMONRBGCOLOR rect:CGRectMake(0, 0, SCREENWIDTH, hight(600)+_ReplyView.xmg_height)];
    [self addSubview:backView];
    personView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, 10, SCREENWIDTH,hight(100))];
    [backView addSubview:personView];
    UILabel *descriptionLabel=[MyView label:@"用户评价(999+)" tColor: [tools colorWithHex:0x3333333] font:    [UIFont systemFontOfSize:17] rect:CGRectMake(15, hight(34), SCREENWIDTH-60, hight(34))];
    [personView addSubview:descriptionLabel];
    [personView addSubview:[MyView addLineView:CGRectMake(15, personView.xmg_height-1, SCREENWIDTH-30, 1) color:LINECOLOR]];
    //用户评价详细内容
    EvaluateView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, personView.xmg_bottom, SCREENWIDTH,backView.xmg_height-hight(100)-10)];
    [backView addSubview:EvaluateView];
    
     [EvaluateView addSubview:self.personImage];
     [EvaluateView addSubview:self.personName];
     [EvaluateView addSubview:self.evaluateTime];
     [EvaluateView addSubview:self.startView];
     [EvaluateView addSubview:self.evaluateDetail];
    
    _evaluateImage=[NSArray arrayWithObjects:@"background",@"background",@"background", nil];
    UIImageView *evalute;
    for (int i=0; i<_evaluateImage.count; i++) {
        evalute=[[UIImageView alloc]initWithFrame:CGRectMake(15+((hight(225)+5)*i), _evaluateDetail.xmg_bottom+10, hight(224),wight(224))];
        evalute.image=[UIImage imageNamed:_evaluateImage[i]];
        evalute.userInteractionEnabled=YES;
        evalute.maskView.contentMode = UIViewContentModeScaleAspectFill;
        evalute.clipsToBounds = YES;
        
        [EvaluateView addSubview:evalute];
    }
    if (_evaluateImage.lastObject) {
        UIView *mengView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, evalute.xmg_width, evalute.xmg_height)];
        mengView.backgroundColor=[tools colorWithHex:0x000000];
        mengView.alpha=0.6;
        [evalute addSubview:mengView];
        UILabel *addLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, evalute.xmg_width, evalute.xmg_height)];
        addLabel.text=@"+5";
        addLabel.textAlignment=NSTextAlignmentCenter;
        addLabel.textColor=[UIColor whiteColor];
        [evalute addSubview:addLabel];
    }
    NSString * str=@"掌柜回复:感谢你的评价，希望在以后得日子里能够继续一起练习。感谢你的评价，希望在以后得日子里能够继续一起练习。感谢你的评价，希望在以后得日子里能够继续一起练习.";
    CGRect tempRect=[str boundingRectWithSize:CGSizeMake(wight(640), SCREENHEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
    _ReplyView=[MyView Image:@"dialog" corner:0 rect:CGRectMake(15, evalute.xmg_bottom+5, wight(690), tempRect.size.height+50)];
    [EvaluateView addSubview:self.ReplyView];
    _evaluateReply=[MyView label:str tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:14] rect:CGRectMake(10, 30, tempRect.size.width, tempRect.size.height)];
    _evaluateReply.numberOfLines=0;
    [_ReplyView addSubview:self.evaluateReply];

}
-(UIImageView *)personImage
{
    if (!_personImage) {
        _personImage=[MyView Image:@"background" corner:wight(60)/2 rect:CGRectMake(15, 10, wight(60), hight(60))];
    }
    return _personImage;
}
- (UILabel *)personName{
    if (!_personName) {
        _personName=[MyView label:@"吃草的兔子" tColor: [tools colorWithHex:0x666666] font: [UIFont systemFontOfSize:14] rect:  CGRectMake(_personImage.xmg_right+wight(20), 10, wight(300), hight(28))];
    }
    return _personName;
}
- (UILabel *)evaluateTime{
    if (!_evaluateTime) {
        NSString * str=@"2017-01-15 19:19";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(34)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil];

        _evaluateTime=[MyView label:str tColor:[tools colorWithHex:0x999999] font:[UIFont systemFontOfSize:12] rect:CGRectMake(SCREENWIDTH-tempRect.size.width-15, 10, tempRect.size.width, tempRect.size.height)];
    }
    return _evaluateTime;
}
- (UIView *)startView{
    if (!_startView) {
        _startView=[MyView uiview:0 bColor:[UIColor clearColor] rect:CGRectMake(_personImage.xmg_right+wight(20), _personName.xmg_bottom+hight(6), wight(300), hight(28))];
        //布置星星
        UIImageView *starImg;
        for (int index = 0; index < 5; ++index) {
            starImg= [[UIImageView alloc]initWithFrame:CGRectMake(index*wight(30), 0, wight(30), hight(24))];
            starImg.image = [UIImage imageNamed:@"star-rating-1"];
            starImg.tag = index+1000;
            [_startView addSubview:starImg];
        }
       
        UILabel *manyiLabel=[MyView label:@"(非常满意)" tColor:[tools colorWithHex:0xFFB81F] font:[UIFont systemFontOfSize:12] rect: CGRectMake(starImg.xmg_right+5, 0, wight(200), hight(28))];
        [_startView addSubview:manyiLabel];
    }
    return _startView;
}
- (UILabel *)evaluateDetail{
    if (!_evaluateDetail) {
        NSString * str=@"已经多次预约了，每次都超出期待，为专业的教练点赞！下次继续。";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, SCREENHEIGHT-40) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];

        _evaluateDetail=[MyView label:str tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(15, _personImage.xmg_bottom+20, tempRect.size.width, tempRect.size.height)];
        _evaluateDetail.numberOfLines=0;
    }
    return _evaluateDetail;
}
+ (instancetype)EvaluateViewCell:(UITableView *)tableView{
    NSString *identifer=NSStringFromClass([self class]);
    [tableView registerClass:[EvaluateViewCell class] forCellReuseIdentifier:identifer];
    return [tableView dequeueReusableCellWithIdentifier:identifer];
}
@end
