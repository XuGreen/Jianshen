//
//  HSCButton.m
//  AAAA
//
//  Created by zhangmh on 12-7-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TouchUIView.h"
#import "ColorFont.h"
@implementation TouchUIView

@synthesize dragEnable;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!dragEnable) {
        return;
    }
    self.alpha = 0.2;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!dragEnable) {
        return;
    }

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    self.alpha = 1.0;
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    self.alpha = 1.0;
}

-(void)AddLine:(int)lineType{
    switch (lineType) {
        case 0:{
            UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0,0, 1, self.frame.size.height)];
            line.backgroundColor = [UIFont backGroundColor];
            [self addSubview:line];
        }
            break;
        case 1:{
            UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0,0, self.frame.size.width, 1)];
            line.backgroundColor = [UIFont backGroundColor];
            [self addSubview:line];
        }
            break;
        case 2:{
            UIView *line=[[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width-1,0, 1, self.frame.size.height)];
            line.backgroundColor = [UIFont backGroundColor];
            [self addSubview:line];
        }
            break;
        case 3:{
            UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0,self.frame.size.height-1,self.frame.size.width, 1)];
            line.backgroundColor = [UIFont backGroundColor];
            [self addSubview:line];
        }
            break;
        default:
            break;
    }
   
}

@end
