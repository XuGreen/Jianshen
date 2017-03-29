//
//  ServerView.m
//  FitNess
//
//  Created by xuqq on 2017/3/29.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ServerView.h"
#import "AppDelegate.h"

@implementation ServerView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    UIView *view=[MyView uiview:0 bColor:COMMONRBGCOLOR rect:CGRectMake(0, 0, SCREENWIDTH, hight(140))];
    [self addSubview:view];
    _backView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, hight(20), SCREENWIDTH, hight(100))];
    [view addSubview:self.backView];
    [self.backView addSubview:[MyView addLineView:CGRectMake(15, self.backView.xmg_height-1, SCREENWIDTH-30, 1) color:LINECOLOR]];
    [self.backView addSubview:self.ServerLabel];
    [self.backView addSubview:self.TimeLabel];
    [self.backView addSubview:self.UpdateImageView];
}
-(UILabel *)ServerLabel{
    if (!_ServerLabel) {
        _ServerLabel=[MyView label:@"服务时间" tColor: [tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(15, 15, wight(160), hight(40))];
    }
    return _ServerLabel;
}
- (UILabel *)TimeLabel{
    if (!_TimeLabel) {
        _TimeLabel=[MyView label:@"08:00-22:00" tColor: [tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:14] rect:CGRectMake(_ServerLabel.xmg_right+5, 15, wight(300), hight(40))];
    }
    return _TimeLabel;
}
- (UIImageView *)UpdateImageView{
    if (!_UpdateImageView) {
        _UpdateImageView=[MyView Image:@"modify" corner:0 rect:CGRectMake(SCREENWIDTH-wight(60)-15, 10, wight(60), hight(60))];
       
    }
    return _UpdateImageView;
}

@end

