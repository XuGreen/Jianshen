//
//  RegisterViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/14.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>{
     NSMutableArray *TextFiledArray;
    
}
@property(nonatomic,strong) UITextField *textField;
@property(nonatomic,strong)UIButton *RegisterBtn;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TextFiledArray = [[NSMutableArray alloc]init];
    [self setNav];
    [self CreateView];
    [self CreateBottomView];
    [self.view addSubview:self.RegisterBtn];
}
- (void)setNav{
    self.view.backgroundColor=COMMONRBGCOLOR;
    self.navigationItem.title=@"注册";
    [self backVC];
}
-(void)CreateView{
    NSArray *titleArray=[NSArray arrayWithObjects:@"请输入手机号码",@"请输入密码(6-16个字符)",@"请输入验证码", nil];
    NSArray *imageArray=[NSArray arrayWithObjects:@"phone",@"password",@"verification", nil];
    for (int i=0; i<3; i++) {
        TouchUIView *view=[[TouchUIView alloc]initWithFrame:CGRectMake(0, 66+i*60, SCREENWIDTH, 60)];
        view.backgroundColor=[UIColor whiteColor];
        [self.view addSubview:view];
        _textField=[[UITextField alloc]initWithFrame:CGRectMake(60, 10, SCREENWIDTH-100, 30.0f)];
        [_textField setBorderStyle:UITextBorderStyleNone];
        _textField.backgroundColor=[UIColor whiteColor];
        _textField.layer.cornerRadius=3.0f;
        _textField.placeholder=titleArray[i];
        _textField.delegate=self;
        _textField.textAlignment=NSTextAlignmentLeft;
        _textField.font=[UIFont fontWithName:@"Avenir-Book" size:14.0f];
        //        _textField.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
        [view addSubview:_textField];
        
        UIImageView *logoImage=[[UIImageView alloc]init];
        if (i==0) {
            logoImage.frame=CGRectMake(15, 10, 20, 35);
        }else if (i==1){
            logoImage.frame=CGRectMake(15, 10, 22, 28);
            [_textField setSecureTextEntry:YES];
        }else{
              logoImage.frame=CGRectMake(15, 10, 22, 28);
            UIButton *VerificationBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH - 120, 15, 100,30)];
            [VerificationBtn setTitle:@"获取验证码" forState: UIControlStateNormal];
            [VerificationBtn setTitleColor:[UIColor colorWithRed:255/255.0 green:184/255.0 blue:31/255.0 alpha:1.0]forState:UIControlStateNormal];
            VerificationBtn.layer.borderColor=[[UIColor colorWithRed:255/255.0 green:184/255.0 blue:31/255.0 alpha:1.0] CGColor];
            VerificationBtn.layer.borderWidth=1;
            VerificationBtn.layer.cornerRadius=2.0f;
            VerificationBtn.layer.masksToBounds=YES;
            VerificationBtn.titleLabel.font=[UIFont fontWithName:@"Avenir-Book" size:14.0f];
            [VerificationBtn addTarget:self action:@selector(verificationClick:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:VerificationBtn];
        }
        logoImage.image=[UIImage imageNamed:imageArray[i]];
        [view addSubview:logoImage];
        [view addSubview:[self addLineView:CGRectMake(i==2?0:CGRectGetMinX(_textField.frame), 59, SCREENWIDTH, 1) color:LINECOLOR]];
        [TextFiledArray addObject:_textField];
    }
}
- (void)CreateBottomView{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, _RegisterBtn.xmg_bottom+400, SCREENWIDTH, 40)];
    view.backgroundColor=[UIColor clearColor];
    [self.view addSubview:view];
    [view addSubview:[self addLineView:CGRectMake(15, 20, 100, 1) color:[UIColor darkGrayColor]]];
    UILabel *Loginlabel=[[UILabel alloc]initWithFrame:CGRectMake(view.xmg_width/3+10,0, 300, 40)];
    Loginlabel.text=@"第三方快捷登录";
    Loginlabel.tintColor=[UIColor darkGrayColor];
    Loginlabel.font=[UIFont fontWithName:@"Avenir-Book" size:16.0f];
    [view addSubview:Loginlabel];
    [view addSubview:[self addLineView:CGRectMake(view.xmg_width-115, 20, 100, 1) color:[UIColor darkGrayColor]]];
    
    NSArray *imageArray=[[NSArray alloc]initWithObjects:@"WeChat",@"QQ",@"weibo", nil];
    NSArray *titleArray=[NSArray arrayWithObjects:@"微信",@"QQ",@"微博", nil];
    for (int i=0; i<3; i++) {
        UIButton *imageViewBtn=[[UIButton alloc]initWithFrame:CGRectMake(60+(100*i), SCREENHEIGHT-150, 50,50)];
        [imageViewBtn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [imageViewBtn setTitle:titleArray[i] forState:UIControlStateNormal];
        [imageViewBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        imageViewBtn.titleLabel.font=[UIFont systemFontOfSize:15];
        imageViewBtn.tag=i;
        CGFloat space = 20.0;
        [imageViewBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                                      imageTitleSpace:space];
        [self.view addSubview:imageViewBtn];
        
    }
}
- (UIView *)addLineView : (CGRect)frame color : (UIColor *)color{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}
-(void)RegisterClick:(UIButton *)sender{
    NSString *PhoneNumber=[TextFiledArray[0] text];
    XQQLog(@"%@",PhoneNumber);
    NSString *Password=[TextFiledArray[1] text];
    NSString *Code=[TextFiledArray[2] text];
    
    
    if ([tools isValidateMobile:PhoneNumber]) {
            if (Password.length >= 6) {
                NSMutableDictionary *mutabelDictionary=[[NSMutableDictionary alloc]init];
                [mutabelDictionary setObject:PhoneNumber forKey:@"mobile"];
                [mutabelDictionary setObject:Password forKey:@"password"];
                [mutabelDictionary setObject:Code forKey:@"verify"];
                SA=[[ServiceAPI alloc]initWithFrame:self.view.frame];
                SA.url=@"/register/add_user";
                SA.delegate=self;
                [SA SetPostRequest:mutabelDictionary];
                [self.view addSubview:SA];
            }else{
                UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入大于6个字符的密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil,nil];
                [alter show];
                Password=@"";
            }
    }else{
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入正确的电话号码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil,nil];
        [alter show];
        PhoneNumber=@"";
        Password=@"";
    }

}
-(void)verificationClick:(UIButton *)sender{
    XQQLogFunc
}

#pragma mark -懒加载
- (UIButton *)RegisterBtn{
    if (!_RegisterBtn) {
        _RegisterBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, 205+64, SCREENWIDTH-20, 50)];
        [_RegisterBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_RegisterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _RegisterBtn.layer.masksToBounds=YES;
        _RegisterBtn.layer.cornerRadius=2.0;
        _RegisterBtn.titleLabel.font=[UIFont systemFontOfSize:14];
        _RegisterBtn.backgroundColor=[UIColor colorWithRed:255/255.0 green:184/255.0 blue:31/255.0 alpha:1.0];
        [_RegisterBtn addTarget:self action:@selector(RegisterClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _RegisterBtn;
}

@end
