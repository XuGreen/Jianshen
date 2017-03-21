//
//  MeTopView.m
//  FitNess
//
//  Created by xuqq on 2017/3/21.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "MeTopView.h"

@implementation MeTopView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self CreateTopView];
    }
    return self;
}
#pragma mark -构建顶部视图
- (void)CreateTopView{
    _TopView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(480))];
    [_TopView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"banner-1"]]];
    [self addSubview:_TopView];
      
    [self.TopView addSubview:self.personImage];
    [self.TopView addSubview:self.personName];
    [self.TopView addSubview:self.starsView];
    [self.TopView addSubview:self.levelView];
    [self.TopView addSubview:self.levelLabel];
    UIImageView *rightImage=[[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH-30, self.starsView.xmg_y+10, wight(22), hight(40))];
    rightImage.image=[UIImage imageNamed:@"right-1"];
    [self.TopView addSubview:rightImage];
    UIView *shadowView=[[UIView alloc]initWithFrame:CGRectMake(0, self.TopView.xmg_height-hight(120), SCREENWIDTH, hight(120))];
    shadowView.backgroundColor=[UIColor clearColor];
    [shadowView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"dynamic"]]];
    [self.TopView addSubview:shadowView];
    NSArray *numArray=[NSArray arrayWithObjects:@"99+",@"50",@"23", nil];
    NSArray *meArray=[NSArray arrayWithObjects:@"我的动态",@"我的粉丝",@"我的关注",nil];
    for (int i=0; i<3; i++) {
        UIView *meView=[[UIView alloc]initWithFrame:CGRectMake((SCREENWIDTH/3)*i, 0, SCREENWIDTH/3, hight(120))];
        meView.backgroundColor=[UIColor clearColor];
        [shadowView addSubview:meView];
        UILabel *numLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, SCREENWIDTH/3, hight(28))];
        numLabel.text=numArray[i];
        numLabel.textAlignment=NSTextAlignmentCenter;
        numLabel.textColor=[UIColor whiteColor];
        numLabel.font=[UIFont systemFontOfSize:15];
        [meView addSubview:numLabel];
        UILabel *meLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, numLabel.xmg_bottom+8, SCREENWIDTH/3, hight(28))];
        meLabel.text=meArray[i];
        meLabel.textColor=[UIColor whiteColor];
        meLabel.textAlignment=NSTextAlignmentCenter;
        meLabel.font=[UIFont systemFontOfSize:15];
        [meView addSubview:meLabel];
        UIImageView *LineImage=[[UIImageView alloc]initWithFrame:CGRectMake((SCREENWIDTH/3), 10, 1, hight(80))];
        LineImage.image=[UIImage imageNamed:@"line"];
        [meView addSubview:LineImage];
        
    }
    
}

- (UIImageView *)personImage{
    if (!_personImage) {
        _personImage=[[UIImageView alloc]initWithFrame:CGRectMake(15,80, wight(136), hight(136))];
        _personImage.image=[UIImage imageNamed:@"avatar"];
        _personImage.layer.borderColor=[MAINCOLOR CGColor];
        _personImage.layer.borderWidth=2;
        _personImage.layer.cornerRadius=_personImage.xmg_width/2;
        
    }
    return _personImage;
}
-(UILabel *)personName{
    if (!_personName) {
        _personName=[[UILabel alloc]initWithFrame:CGRectMake(_personImage.xmg_right+5, _personImage.xmg_y+10, wight(206), hight(33))];
        _personName.text=@"吃草的兔子";
        _personName.textColor=[UIColor whiteColor];
        _personName.font=[UIFont systemFontOfSize:18];
    }
    return _personName;
}
-(UIView *)starsView{
    if (!_starsView) {
        _starsView = ({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(_personName.xmg_right,_personImage.xmg_y+13 , wight(135), hight(24))];
            //布置星星
            for (int index = 0; index < 5; ++index) {
                UIImageView *starImg = [[UIImageView alloc]initWithFrame:CGRectMake(index*wight(30), 0, wight(30), hight(24))];
                starImg.image = [UIImage imageNamed:@"score"];
                starImg.tag = index+1000;
                [view addSubview:starImg];
            }
            view;
        });
    }
    return _starsView;
}
- (UIView *)levelView{
    if (!_levelView) {
        _levelView=[[UIView alloc]initWithFrame:CGRectMake(_personImage.xmg_right+5, _personName.xmg_bottom+5, wight(50), hight(50))];
        _levelView.backgroundColor=[UIColor whiteColor];
        _levelView.layer.masksToBounds=YES;
        _levelView.layer.cornerRadius=_levelView.xmg_width/2;
        
        UIImageView *levelImage=[[UIImageView alloc]initWithFrame:CGRectMake(1, 1, wight(45), hight(45))];
        levelImage.image=[UIImage imageNamed:@"v1"];
        [_levelView addSubview:levelImage];
    }
    return _levelView;
}
-(UILabel *)levelLabel{
    if (!_levelLabel) {
        _levelLabel=[[UILabel alloc]initWithFrame:CGRectMake(_levelView.xmg_right+5, _levelView.xmg_y+5, wight(100), hight(23))];
        _levelLabel.text=@"帮主";
        _levelLabel.textColor=[UIColor whiteColor];
        _levelLabel.font=[UIFont systemFontOfSize:14];
    }
    return _levelLabel;
}
@end
