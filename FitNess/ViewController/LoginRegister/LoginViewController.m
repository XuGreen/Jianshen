//
//  LoginViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/14.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ForgetViewController.h"
#import "ShortcutViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>{
   NSMutableArray *TextFiledArray;
    MBProgressHUD *hud;
}
@property(nonatomic,strong)UIButton *LoginButton;
@property(nonatomic,strong)UIButton *ForgetBtn;
@property(nonatomic,strong)UIButton *RegisterBtn;
@property(nonatomic,strong) UITextField *textField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TextFiledArray=[[NSMutableArray alloc]init];
    [self setNav];
    [self CreateView];
    [self.view addSubview:self.LoginButton];
    [self.view addSubview:self.RegisterBtn];
    [self.view addSubview:self.ForgetBtn];
    [self CreateBottomView];

}
- (void)setNav{
    self.view.backgroundColor=COMMONRBGCOLOR;
    self.navigationItem.title=@"登录";
    [self backVC];
}

-(void)CreateView{
    NSArray *titleArray=[NSArray arrayWithObjects:@"请输入手机号码",@"请输入密码", nil];
    NSArray *imageArray=[NSArray arrayWithObjects:@"phone",@"password", nil];
    for (int i=0; i<2; i++) {
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
            UIButton *loginBtn=[[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH -110, 10, 100, 30)];
            [loginBtn setTitle:@"短信快捷登录" forState:UIControlStateNormal];
            [loginBtn setTitleColor:[UIColor colorWithRed:255/255.0 green:184/255.0 blue:31/255.0 alpha:1.0] forState:UIControlStateNormal];
            loginBtn.titleLabel.font=[UIFont systemFontOfSize:14];
            [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:loginBtn];
            
        }else{
            logoImage.frame=CGRectMake(15, 10, 22, 28);
            [_textField setSecureTextEntry:YES];
            UIButton *arrow = [[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH - 32, 20, 20, 12)];
            [arrow setImage: [UIImage imageNamed:@"eyes"] forState:UIControlStateNormal];
            [arrow addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:arrow];
        }
        logoImage.image=[UIImage imageNamed:imageArray[i]];
        [view addSubview:logoImage];
        [view addSubview:[self addLineView:CGRectMake(i==1?0:CGRectGetMinX(_textField.frame), 59, SCREENWIDTH, 1) color:LINECOLOR]];
        
        [TextFiledArray addObject:_textField];
        
    }
}
//第三方登录
- (void)CreateBottomView{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, _LoginButton.xmg_bottom+180, SCREENWIDTH, 40)];
    view.backgroundColor=[UIColor clearColor];
    [self.view addSubview:view];
    [view addSubview:[self addLineView:CGRectMake(15, 20, 100, 1) color:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0]]];
    UILabel *Loginlabel=[[UILabel alloc]initWithFrame:CGRectMake(view.xmg_width/3+10,0, 300, 40)];
    Loginlabel.text=@"第三方快捷登录";
    Loginlabel.tintColor=[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
    Loginlabel.font=[UIFont systemFontOfSize:16];
    [view addSubview:Loginlabel];
    [view addSubview:[self addLineView:CGRectMake(view.xmg_width-115, 20, 100, 1) color:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0]]];
    
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

-(void)Click:(UIButton *)sender{
    sender.selected=sender.selected? NO:YES;
    if (sender.selected==YES) {
           [sender setImage:[UIImage imageNamed:@"eyes-Open"]  forState:UIControlStateNormal];
    }else{
        [sender setImage:[UIImage imageNamed:@"eyes"]  forState:UIControlStateNormal];
    }
    [_textField setSecureTextEntry:!sender.selected];
}
- (void)loginBtnClick:(UIButton *)sender{
    ShortcutViewController *shortVC=[[ShortcutViewController alloc]init];
    NavViewController *nav=[[NavViewController alloc]initWithRootViewController:shortVC];
    [self presentViewController:nav animated:YES completion:nil];
}
//登录
-(void)LoginClick:(UIButton *)sender{
    
    NSString *phonenumber = [TextFiledArray[0] text];
    NSString *password = [TextFiledArray[1]text];
    if (phonenumber.length>0) {
        if (password.length>0) {
            NSMutableDictionary *mutableDictionary=[[NSMutableDictionary alloc]init];
            [mutableDictionary setObject:phonenumber forKey:@"mobile"];
            [mutableDictionary setObject:password forKey:@"password"];
            SA=[[ServiceAPI alloc]init];
            SA.url=@"/login/login";
            SA.delegate=self;
            [SA SetPostRequest:mutableDictionary];
         
            [self.view addSubview:SA];
           
        }else{
            [MBProgressHUD showSucessNoImageText:@"请输入密码"];
        }
    }else{
            [MBProgressHUD showSucessNoImageText:@"请输入手机号"];
    }
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"正在登录...";
  
}
-(void)RequestFaild:(NSString *)url{
    XQQLog(@"faild");
    [SA removeFromSuperview];
}
- (void)RequestSuccess:(NSMutableDictionary *)ResultString{
    [SA removeFromSuperview];
    XQQLog(@"%@",ResultString);
    NSMutableDictionary *codeDic=[ResultString objectForKey:@"response"];
    NSNumber *stateCode=[codeDic objectForKey:@"code"];
    if ([stateCode integerValue] == 1000) {
        hud.labelText = @"登录成功"; 
        [hud hide:YES afterDelay:1.0];
    }else{
        NSMutableDictionary *Content = [ResultString objectForKey:@"response"];
        NSString *result = [Content objectForKey:@"msg"];
        
        [MBProgressHUD showSucessNoImageText: result];
    }
    
}
-(void)RegisteClick:(UIButton *)sender{
    RegisterViewController *registerVC=[[RegisterViewController alloc]init];
    NavViewController *nav=[[NavViewController alloc]initWithRootViewController:registerVC];
    [self presentViewController:nav animated:YES completion:nil];

}
-(void)ForgetClick:(UIButton *)sender{
    ForgetViewController *forgetVC=[[ForgetViewController alloc]init];
    NavViewController *nav=[[NavViewController alloc]initWithRootViewController:forgetVC];
    [self presentViewController:nav animated:YES completion:nil];
}
#pragma mark -懒加载
- (UIButton *)LoginButton{
    if (!_LoginButton) {
        _LoginButton=[[UIButton alloc]initWithFrame:CGRectMake(10, 135+64, SCREENWIDTH-20, 50)];
        [_LoginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_LoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _LoginButton.layer.masksToBounds=YES;
        _LoginButton.layer.cornerRadius=2.0;
        _LoginButton.titleLabel.font=[UIFont systemFontOfSize:14];
        _LoginButton.backgroundColor=[UIColor colorWithRed:255/255.0 green:184/255.0 blue:31/255.0 alpha:1.0];
        [_LoginButton addTarget:self action:@selector(LoginClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _LoginButton;
}
- (UIButton *)RegisterBtn{
    if (!_RegisterBtn) {
        _RegisterBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, _LoginButton.xmg_y+50, 60, 40)];
        [_RegisterBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_RegisterBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
         _RegisterBtn.backgroundColor=[UIColor clearColor];
        _RegisterBtn.titleLabel.font=[UIFont systemFontOfSize:15];
        [_RegisterBtn addTarget:self action:@selector(RegisteClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _RegisterBtn;
}
- (UIButton *)ForgetBtn{
    if (!_ForgetBtn) {
        _ForgetBtn=[[UIButton alloc]initWithFrame:CGRectMake(_LoginButton.xmg_width-70, _LoginButton.xmg_y+50, 80, 40)];
        [_ForgetBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
        [_ForgetBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _ForgetBtn.backgroundColor=[UIColor clearColor];
        _ForgetBtn.titleLabel.font=[UIFont systemFontOfSize:15];
        [_ForgetBtn addTarget:self action:@selector(ForgetClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ForgetBtn;
}
@end
