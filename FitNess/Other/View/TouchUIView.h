//
//  HSCButton.h
//  AAAA
//
//  Created by zhangmh on 12-7-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
/*
其实,
 */
#import <UIKit/UIKit.h>

@interface TouchUIView : UIView
{
    CGPoint beginPoint;
}

@property (nonatomic) BOOL dragEnable;
-(void)AddLine:(int)lineType;
@end
