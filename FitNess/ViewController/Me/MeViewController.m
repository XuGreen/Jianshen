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

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的";
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(50, 100, 200, 50)];
    [button setTitle:@"去登录" forState: UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(loginRegister:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
