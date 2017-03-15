//
//  UIViewController+FirstMode.m
//  BlackDogFood
//
//  Created by Yang Joe on 12/23/14.
//  Copyright (c) 2014 Yang Joe. All rights reserved.
//

#import "ColorFont.h"

@implementation UIFont (ColorFont)

+(id)boldFontName:(CGFloat)size
{
    return [UIFont fontWithName:@"Avenir-Black" size:size];
}

+(id)fontBook:(CGFloat)size
{
    return [UIFont fontWithName:@"Avenir-Book" size:size];
}

+(id)fontName:(CGFloat)size
{
    return [UIFont fontWithName:@"Avenir-Book" size:size];
}

+(id)titleFont
{
    return [UIFont fontWithName:@"Avenir-Book" size:18];
}

+(id)MainColor{
    return [UIColor colorWithRed:47.0/255 green:195.0/255 blue:249.0/255 alpha:1.0f];
}

+(id)backGroundColor{
    return [UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1.0f];
}

+(id)GrayTextColor{
    return [UIColor colorWithRed:142.0/255 green:142.0/255 blue:142.0/255 alpha:1.0f];
}

@end
