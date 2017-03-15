//
//  FunctionView.m
//  FitNess
//
//  Created by xuqq on 2017/3/15.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "FunctionView.h"
#import "XMGSqaureButton.h"
@interface FunctionView ()
@property (strong,nonatomic)NSArray *imageArray;
@property (copy,nonatomic)NSArray *titleArray;
@end

@implementation FunctionView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 创建方块
        self.titleArray=@[@"妇产科",@"皮肤科",@"内科",@"外科",@"耳鼻喉科",@"骨科",@"消化内科",@"全部"];
        [self createSquares:self.titleArray];
    }
    return self;
}
/**
 * 创建方块
 */
- (void)createSquares :(NSArray *)sqaures
{
    // 一行最多4列
    int maxCols = 4;
    // 宽度和高度
    CGFloat buttonW = SCREENWIDTH / maxCols;
    CGFloat buttonH = buttonW;
    for (int i = 0; i<sqaures.count; i++) {
        // 创建按钮
        XMGSqaureButton *button = [XMGSqaureButton buttonWithType:UIButtonTypeCustom];
        // 监听点击
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:sqaures[i] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"publish-video"] forState:UIControlStateNormal];
        [self addSubview:button];
        
        // 计算frame
        int col = i % maxCols;
        int row = i/ maxCols;
        
        button.xmg_x = col * buttonW;
        button.xmg_y = row * buttonH;
        button.xmg_width = buttonW;
        button.xmg_height = buttonH;
        
    }
    NSUInteger rows = (sqaures.count + maxCols - 1) / maxCols;
    // 计算head的高度
    self.xmg_height = rows * buttonH;
    // 重绘
    [self setNeedsDisplay];
}
- (void)buttonClick:(XMGSqaureButton *)button
{
    
    NSLog(@"---------%@",button.titleLabel);
    
}


@end
