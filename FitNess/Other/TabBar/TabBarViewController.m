//
//  TabBarViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/14.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "MeViewController.h"
#import "OtherViewController.h"
#import "ClassViewController.h"
#import "NavViewController.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self TabBars];
}
- (void)TabBars{
    HomeViewController *home=[[HomeViewController alloc]init];
    home.tabBarItem.image = [UIImage imageNamed:@"xc_main_normal"];
    home.tabBarItem.selectedImage = [UIImage imageNamed:@"xc_main_pressed"];
    home.tabBarItem.title=@"首页";
    NavViewController *homeNav=[[NavViewController alloc]initWithRootViewController:home];
    
    ClassViewController *class=[[ClassViewController alloc]init];
    class.tabBarItem.image = [UIImage imageNamed:@"xc_main_normal"];
    class.tabBarItem.selectedImage = [UIImage imageNamed:@"xc_main_pressed"];
    class.tabBarItem.title=@"分类";
    NavViewController *classNav=[[NavViewController alloc]initWithRootViewController:class];
    
    OtherViewController *other=[[OtherViewController alloc]init];
    other.tabBarItem.image = [UIImage imageNamed:@"xc_main_normal"];
    other.tabBarItem.selectedImage = [UIImage imageNamed:@"xc_main_pressed"];
    other.tabBarItem.title=@"订单";
    NavViewController *otherNav=[[NavViewController alloc]initWithRootViewController:other];
    
    MeViewController *me=[[MeViewController alloc]init];
    me.tabBarItem.image = [UIImage imageNamed:@"xc_main_normal"];
    me.tabBarItem.selectedImage = [UIImage imageNamed:@"xc_main_pressed"];
    me.tabBarItem.title=@"我的";
    NavViewController *meNav=[[NavViewController alloc]initWithRootViewController:me];
    
    self.viewControllers=@[homeNav,classNav,otherNav,meNav];
    
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
