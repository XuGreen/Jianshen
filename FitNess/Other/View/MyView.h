//
//  MyView.h
//  FitNess
//
//  Created by xuqq on 2017/3/22.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyView : NSObject

#pragma mark -label
+(UILabel*)label:(NSString*)str tColor:(UIColor*)tcolor font:(UIFont*)font rect:(CGRect)rect;

#pragma mark -UIView
+(UIView*)uiview:(double)corner bColor:(UIColor*)bcolor rect:(CGRect)rect;

#pragma mark -TextButton
+(UIButton*)TextButton:(NSString*)Str bColor:(UIColor*)bcolor tColor:(UIColor*)tcolor corner:(double)corner rect:(CGRect)rect;

#pragma mark -ImageButton
+(UIButton*)ImageButton:(NSString*)imageStr text:(NSString*)Str tColor:(UIColor*)tcolor cornet:(double)corner rect:(CGRect)rect;

#pragma mark -Image
+(UIImageView*)Image:(NSString*)imageStr corner:(double)corner rect:(CGRect)rect;

#pragma mark -textfiled
+(UITextField*)Textfile:(NSString*)hint corner:(double)corner rect:(CGRect)rect;

#pragma mark -textView
+(UITextView*)textView:(NSString*)hint hintColor:(UIColor*)hColor bColor:(UIColor*)bcolor tColor:(UIColor*)tcolor corner:(double)corner rect:(CGRect)rect;

//#pragma mark -tableVie
//+(UITableView*)table:(UIColor*)bColor x:(double)x y:(double)y w:(double)w h:(double)h;
#pragma mark-line
+ (UIView *)addLineView : (CGRect)frame color : (UIColor *)color;
@end
