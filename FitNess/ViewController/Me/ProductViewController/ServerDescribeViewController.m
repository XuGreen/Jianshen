//
//  ServerDescribeViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/28.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ServerDescribeViewController.h"
#import "HourNumerButton.h"

@interface ServerDescribeViewController ()<UITextFieldDelegate>{
    NSString *number;
    NSString *personType;
}
@property (nonatomic, strong) UIView        *customView;
@property (nonatomic, strong) UIView        *customView1;
@property (nonatomic, strong) UIView        *customView2;
@property (nonatomic, strong) UITextField    *inputView;
@property(nonatomic,strong)HourNumerButton *numberButton;//添加数量


@end

@implementation ServerDescribeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self CreateInputView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldEditChanged:)  name:@"UITextFieldTextDidChangeNotification" object:_inputView];
}

-(void)setNav{
    self.view.backgroundColor=COMMONRBGCOLOR;
    self.navigationItem.title=@"服务描述";
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 20.0 / 2.0, 35.0 / 2.0);
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(action_onBackButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
    UIButton *CompleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CompleteButton.frame = CGRectMake(0, 0, 50, 35);
    [CompleteButton setTitle:@"完成" forState: UIControlStateNormal];
    [CompleteButton setTitleColor:[tools colorWithHex:0x333333] forState:UIControlStateNormal];
    [CompleteButton addTarget:self action:@selector(CompleteButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *CompleteItem = [[UIBarButtonItem alloc]initWithCustomView:CompleteButton];
    self.navigationItem.rightBarButtonItem = CompleteItem;
}
- (void)CreateInputView{
    _customView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, 10, SCREENWIDTH, hight(100))];
    [containerView addSubview:self.customView];
    UIImageView *addImage=[[UIImageView alloc]initWithFrame:CGRectMake(15, hight(27), wight(50), hight(50))];
    addImage.image=[UIImage imageNamed:@"general"];
    [self.customView addSubview:addImage];
    
    _inputView=[MyView Textfile:@"自定义" corner:0 rect:CGRectMake(addImage.xmg_right+5, hight(34), wight(400), hight(34))];
    _inputView.font=[UIFont systemFontOfSize:15];
    _inputView.textColor=[tools colorWithHex:0x999999];
    _inputView.text=_name;
    [self.customView addSubview:self.inputView];
    
    
    _customView1=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, _customView.xmg_bottom+10, SCREENWIDTH, hight(100))];
    [containerView addSubview:self.customView1];
    UIImageView *hourImage=[[UIImageView alloc]initWithFrame:CGRectMake(15, hight(27), wight(50), hight(50))];
    hourImage.image=[UIImage imageNamed:@"time4"];
    [self.customView1 addSubview:hourImage];
    
    UILabel *hourLabel=[MyView label:@"耗时" tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(hourImage.xmg_right+5, hight(34), wight(100), hight(34))];
    [self.customView1 addSubview:hourLabel];
    _numberButton=[HourNumerButton numberButtonWithFrame:CGRectMake(SCREENWIDTH-wight(260)-15, hight(34), wight(260), hight(66))];
    _numberButton.shakeAnimation=YES;
    _numberButton.borderColor=[UIColor whiteColor];
    _numberButton.increaseImage=[UIImage imageNamed:@"plus4"];
    _numberButton.decreaseImage=[UIImage imageNamed:@"less4"];
    if (_hour) {
        _numberButton.currentNumber=_hour;
    }
   [self.customView1 addSubview:self.numberButton];
    _numberButton.numberBlock=^(NSString *num){
        number=num;
    };
    [self.customView1 addSubview:[MyView addLineView:CGRectMake(15, _customView1.xmg_height-1, SCREENWIDTH-30, 1) color:LINECOLOR]];
    
    
    _customView2=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, _customView1.xmg_bottom, SCREENWIDTH, hight(200))];
    [containerView addSubview:self.customView2];
    UIImageView *personImage=[[UIImageView alloc]initWithFrame:CGRectMake(15, hight(27), wight(50), hight(50))];
    personImage.image=[UIImage imageNamed:@"people"];
    [self.customView2 addSubview:personImage];
    
    
    
    UILabel *personLabel=[MyView label:@"预约人" tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(personImage.xmg_right+5, hight(34), wight(100), hight(34))];
    [self.customView2 addSubview:personLabel];
    NSArray *title=[NSArray arrayWithObjects:@"女士",@"男士",@"不限", nil];
    for (int i=0; i<title.count; i++) {
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(personImage.xmg_right+wight(240)*i, personLabel.xmg_bottom+hight(50), wight(150), hight(60))];
        button.tag=10+i;
        [button setTitle:title[i] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"cancel3"] forState:UIControlStateNormal];
        [button setTitleColor:[tools colorWithHex:0x666666] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:15];
        [self.customView2 addSubview:button];
        CGFloat space=10;
        [button layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:space];
        [button addTarget:self action:@selector(choosePerson:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)action_onBackButton:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)CompleteButton:(UIButton *)sender{
    [self.delegate ServerDescribeWithName:_inputView.text hour:number person:personType];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)choosePerson:(UIButton *)sender{
    for (int i=10; i<13; i++) {
        UIButton *button=(UIButton *)[self.view viewWithTag:i];
        if (button==sender) {
            button.selected=YES;
            [button setImage:[UIImage imageNamed:@"select3"] forState:UIControlStateNormal];
            if (button.tag==10 ) {
                personType=@"女士";
            } else if (button.tag==11){
                personType=@"男士";
            } else{
                  personType=@"不限";
            }
        }else
        {
             button.selected  = NO;
             [button setImage:[UIImage imageNamed:@"cancel3"] forState:UIControlStateNormal];
        }
    }
}
-(void)textFieldEditChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
    NSString *toBeString = textField.text;
    
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position)
    {
        if (toBeString.length > 8)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:8];
            if (rangeIndex.length == 1)
            {
                textField.text = [toBeString substringToIndex:8];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, 8)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}
@end
