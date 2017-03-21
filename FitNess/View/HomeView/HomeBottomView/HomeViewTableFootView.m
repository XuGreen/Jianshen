//
//  HomeViewTableFootView.m
//  FitNess
//
//  Created by xuqq on 2017/3/20.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "HomeViewTableFootView.h"

@implementation HomeViewTableFootView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.craftsmanFootView];
    }
    return self;
}
- (CraftsmanFootView *)craftsmanFootView{
    if (!_craftsmanFootView) {
        _craftsmanFootView=[[CraftsmanFootView alloc]initWithFrame:CGRectMake(0.0, 0.0, SCREENWIDTH, hight(1380))];
        _craftsmanFootView.backgroundColor=COMMONRBGCOLOR;
    }
    return _craftsmanFootView;
}
@end
