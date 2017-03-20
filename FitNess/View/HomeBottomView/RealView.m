//
//  RealView.m
//  JmhShipper
//
//  Created by dingwei on 2017/3/17.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "RealView.h"

@implementation RealView
{
    UIView* popView;
    CGFloat popViewHeight;

}

-(instancetype)init{
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    self = [super initWithFrame:window.bounds];
    [window addSubview:self];
    [self setUI];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    }
    return self;
}

- (void)setUI{
    popView = [[NSBundle mainBundle]loadNibNamed:@"RealView" owner:self options:nil][0];
    popViewHeight = 140;
    popView.alpha = 0;
    popView.frame = CGRectMake(40, SCREENHEIGHT, SCREENWIDTH - 80, popViewHeight);
    popView.layer.cornerRadius = 5;
    popView.layer.masksToBounds = YES;
    [self addSubview:popView];
    UITapGestureRecognizer *ranameTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(realNameClick:)];
    [_renameView addGestureRecognizer:ranameTap];
    UITapGestureRecognizer *zizhiTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ziZhiClick:)];
    [_zizhiView addGestureRecognizer:zizhiTap];
}
- (void)realNameClick:(UITapGestureRecognizer *)sender {
    
    if (_realTypeActionBlock) {
        _realTypeActionBlock(RealTypeName);
        [self dismiss];
    }
    
}

- (void)ziZhiClick:(UITapGestureRecognizer *)sender {
  
    if (_realTypeActionBlock) {
        _realTypeActionBlock(RealTypeZiZhi);
         [self dismiss];
     
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}
-(void)show{
    [UIView animateWithDuration:.4f animations:^{
        popView.alpha = 1;
        popView.frame = CGRectMake(40,(SCREENWIDTH - popViewHeight)/2, SCREENWIDTH - 80, popViewHeight);
    }];
    [self.superview layoutIfNeeded];
}
-(void)dismiss{
    [UIView animateWithDuration:0.4f animations:^{
        popView.alpha = 0;
        popView.frame = CGRectMake(40, SCREENWIDTH, SCREENHEIGHT - 80, popViewHeight);
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
