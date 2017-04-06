//
//  ServerDescrptionViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/4/5.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ServerDescrptionViewCell.h"
@interface ServerDescrptionViewCell()<UITextFieldDelegate>
@end
@implementation ServerDescrptionViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    UIView *backView=[MyView uiview:0 bColor:COMMONRBGCOLOR rect:CGRectMake(0, 0, SCREENWIDTH, hight(120))];
    [self addSubview:backView];
    UIView *customView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, 0, SCREENWIDTH, hight(100))];
    [backView addSubview:customView];
     _titleName=[MyView Textfile:@"请输入自定义服务描述 (最多可输入8个字)" corner:0 rect:CGRectMake(5, hight(34), SCREENWIDTH-50, hight(34))];
    _titleName.font=[UIFont systemFontOfSize:15];
    _titleName.textColor=[tools colorWithHex:0x999999];
    _titleName.delegate=self;
    [customView addSubview:_titleName];
    _deleatebutton=[MyView ImageButton:@"删除" text:@"" tColor:[UIColor clearColor] cornet:0 rect:CGRectMake(SCREENWIDTH-wight(60)-15, hight(20), wight(60), hight(65))];
    [customView addSubview:_deleatebutton];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == _titleName) {
        self.model.name = textField.text;
    }
}
- (void)setModel:(ServerDescribeModel *)model{
    _model=model;
    _titleName.text=model.name;
}
+ (instancetype)ServerDescrptionViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[ServerDescrptionViewCell class] forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}
@end
