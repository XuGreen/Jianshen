//
//  headView.h
//  testDemo
//
//  Created by xuqq on 16/4/29.
//  Copyright © 2016年 xuqq. All rights reserved.
//

#import "XMGSqaureButton.h"


@implementation XMGSqaureButton

- (void)setup
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:[UIColor groupTableViewBackgroundColor] forState:UIControlStateNormal];
     self.titleLabel.font = [UIFont systemFontOfSize:14];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 调整图片
    self.imageView.xmg_y=self.xmg_height*0.15;
    self.imageView.xmg_width=self.xmg_width*0.7;
//    self.imageView.xmg_width=self.xmg_width*0.45;
    self.imageView.xmg_height=self.imageView.xmg_width;
    self.imageView.xmg_centerX=self.xmg_width*0.5;
    
    // 调整文字
    self.titleLabel.xmg_x = 0;
    self.titleLabel.xmg_y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.xmg_width = self.xmg_width;
    self.titleLabel.xmg_height = self.xmg_height - self.titleLabel.xmg_y;
}
@end
