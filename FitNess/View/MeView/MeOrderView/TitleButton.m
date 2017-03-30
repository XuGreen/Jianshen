//
//  TitleButton.m
//  百思不得姐
//
//  Created by 徐青清 on 16/8/18.
//  Copyright © 2016年 xuqq. All rights reserved.
//

#import "TitleButton.h"

@implementation TitleButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        //设置按钮颜色
        [self setTitleColor:[tools colorWithHex:0x333333] forState:UIControlStateNormal];
        [self setTitleColor:MAINCOLOR forState:UIControlStateSelected];
        self.titleLabel.font=[UIFont systemFontOfSize:14];
    }
    return self;
}
- (void)setHighlighted:(BOOL)highlighted{}
@end
