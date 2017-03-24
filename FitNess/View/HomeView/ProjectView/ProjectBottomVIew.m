//
//  ProjectBottomVIew.m
//  FitNess
//
//  Created by xuqq on 2017/3/24.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ProjectBottomVIew.h"
#import "HotProjectView.h"
@implementation ProjectBottomVIew

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    HotProjectView *hotProjectView=[[HotProjectView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(564)*2+hight(260))];
    [self addSubview:hotProjectView];
}

@end
