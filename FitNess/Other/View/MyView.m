//
//  MyView.m
//  FitNess
//
//  Created by xuqq on 2017/3/22.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "MyView.h"

@implementation MyView
#pragma mark -label
+(UILabel*)label:(NSString*)str tColor:(UIColor*)tcolor font:(UIFont*)font rect:(CGRect)rect{
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.textColor = tcolor;
    label.text = str;
    label.font = font;
    label.backgroundColor = [UIColor clearColor];
    return label;
}

#pragma mark -UIView
+(UIView*)uiview:(double)corner bColor:(UIColor*)bcolor rect:(CGRect)rect{
    UIView *View = [[UIView alloc]initWithFrame:rect];
    [View.layer setCornerRadius:corner];
    View.backgroundColor = bcolor;
    return View;
}

#pragma mark -TextButton
+(UIButton*)TextButton:(NSString*)Str bColor:(UIColor*)bcolor tColor:(UIColor*)tcolor corner:(double)corner rect:(CGRect)rect{
    UIButton *button =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=rect;
    button.backgroundColor = bcolor;
    [button.layer setCornerRadius:corner];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:Str forState:UIControlStateNormal];
    [button setTitleColor:tcolor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    return button;
}

#pragma mark -ImageButton
+(UIButton*)ImageButton:(NSString*)imageStr text:(NSString*)Str tColor:(UIColor*)tcolor cornet:(double)corner rect:(CGRect)rect{
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=rect;
    [button.layer setCornerRadius:corner];
    [button setBackgroundImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    [button setTitle:Str forState:UIControlStateNormal];
    [button setTitleColor:tcolor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    return button;
}

#pragma mark -Imageview
+(UIImageView*)Image:(NSString*)imageStr corner:(double)corner rect:(CGRect)rect{
    UIImageView *image=[[UIImageView alloc] initWithFrame:rect];
    [image setImage:[UIImage imageNamed:imageStr]];
    image.layer.masksToBounds = YES;
    image.layer.cornerRadius = corner;
    image.userInteractionEnabled = YES;
    return image;
}


#pragma mark -textfiled
+(UITextField*)Textfile:(NSString*)hint corner:(double)corner rect:(CGRect)rect{
    UITextField *textfiled = [[UITextField alloc] initWithFrame:rect];
    [textfiled setBorderStyle:UITextBorderStyleNone];
    textfiled.backgroundColor = [UIColor whiteColor];
    textfiled.layer.cornerRadius = 0.0f;
    textfiled.placeholder = hint;
    textfiled.font = [UIFont fontWithName:@"Avenir-Book" size:15];
    textfiled.autocorrectionType = UITextAutocorrectionTypeNo;
    textfiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textfiled.returnKeyType = UIReturnKeyDone;
    textfiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    textfiled.leftView = view;
    textfiled.leftViewMode = UITextFieldViewModeAlways;
    return textfiled;
}

#pragma mark -textView
+(UITextView*)textView:(NSString*)hint hintColor:(UIColor*)hColor bColor:(UIColor*)bcolor tColor:(UIColor*)tcolor corner:(double)corner rect:(CGRect)rect{
    UITextView *TextView = [[UITextView alloc] initWithFrame:rect];
    TextView.backgroundColor = bcolor;
    TextView.textColor = tcolor;
    TextView.font = [UIFont fontWithName:@"Avenir-Black" size:14];
    [[TextView layer]setCornerRadius:corner];
    TextView.returnKeyType = UIReturnKeyDefault;
    TextView.keyboardType = UIKeyboardTypeDefault;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 9, TextView.frame.size.width-10, 100)];
    label.textColor = [UIColor redColor];
    label.text = hint;
    label.font = [UIFont fontWithName:@"Avenir-Black" size:14];
    label.numberOfLines = 0;
    [label sizeToFit];
    label.backgroundColor = [UIColor clearColor];
    [TextView addSubview:label];
    
    return TextView;
}

#pragma mark -tableVie
+(UITableView*)table:(UIColor*)bColor rect:(CGRect)rect{
    UITableView *tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStyleGrouped];
    tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, 0.01)];
    tableView.backgroundColor = bColor;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return tableView;
}

#pragma mark-line
+ (UIView *)addLineView : (CGRect)frame color : (UIColor *)color{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}
@end
