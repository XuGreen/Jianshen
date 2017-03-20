//
//  MeViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/14.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "MeViewController.h"
#import "LoginViewController.h"

@interface MeViewController ()
@property (nonatomic, strong)  UIView        *TopView;//头部视图
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self CreateTopView];
}
- (void)setNav{
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor=COMMONRBGCOLOR;

}
#pragma mark -构建广告视图
- (void)CreateTopView{
    _TopView=[[UIView alloc]initWithFrame:CGRectMake(0, -20, SCREENWIDTH, hight(480))];
    _TopView.backgroundColor=XQQColorA(240, 147, 38);
    [containerView addSubview:_TopView];
    UIButton *SettingButton=[UIButton buttonWithType:UIButtonTypeCustom];
    SettingButton.frame=CGRectMake(SCREENWIDTH-wight(150), 30, wight(44), hight(44));
    [SettingButton setImage:[UIImage imageNamed:@"install"] forState:UIControlStateNormal];
    [SettingButton addTarget:self action:@selector(settingClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.TopView addSubview:SettingButton];
    UIButton *MsgButton=[UIButton buttonWithType:UIButtonTypeCustom];
    MsgButton.frame=CGRectMake(SCREENWIDTH-wight(68), 30, wight(44), hight(44));
    [MsgButton setImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
    [MsgButton addTarget:self action:@selector(MsgClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.TopView addSubview:MsgButton];
   
}
//设置
- (void)settingClick:(UIButton *)sender{
    XQQLogFunc
}
//消息
- (void)MsgClick:(UIButton *)sender{
    XQQLogFunc
}
- (void)loginRegister:(UIButton *)sender{
    LoginViewController *login=[[LoginViewController alloc ]init];
    NavViewController *nav=[[NavViewController alloc]initWithRootViewController:login];
    [self presentViewController:nav animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
