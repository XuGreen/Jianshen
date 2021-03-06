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
#import "NearbyViewController.h"
#import "JobsViewController.h"
#import "NavViewController.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self TabBars];
    //设置 TabBar 的背景颜色为白色
    CGRect frame = CGRectMake(0.0, 1, SCREENHEIGHT, 48);
    UIView *v = [[UIView alloc] initWithFrame:frame];
    [v setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar insertSubview:v atIndex:0];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [tools colorWithHex:0x333333],NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
    //隐藏 tabbar 黑线
//    UITabBar *tabbar = [UITabBar appearance];
//    [tabbar setBackgroundImage:[UIImage new]];
//    [tabbar setShadowImage:[UIImage new]];
}
- (void)TabBars{
    HomeViewController *home=[[HomeViewController alloc]init];
    home.tabBarItem.image = [UIImage imageNamed:@"home"];
    home.tabBarItem.selectedImage = [UIImage imageNamed:@"click-home"];
    home.tabBarItem.title=@"首页";
    NavViewController *homeNav=[[NavViewController alloc]initWithRootViewController:home];
    
    NearbyViewController *nearby=[[NearbyViewController alloc]init];
    nearby.tabBarItem.image = [UIImage imageNamed:@"nearby1"];
    nearby.tabBarItem.selectedImage = [UIImage imageNamed:@"click-nearby"];
    nearby.tabBarItem.title=@"附近";
    NavViewController *NearNav=[[NavViewController alloc]initWithRootViewController:nearby];
    
    JobsViewController *jobs=[[JobsViewController alloc]init];
    jobs.tabBarItem.image = [UIImage imageNamed:@"recruitment"];
    jobs.tabBarItem.selectedImage = [UIImage imageNamed:@"click-recruitment"];
    jobs.tabBarItem.title=@"招聘";
    NavViewController *jobsNav=[[NavViewController alloc]initWithRootViewController:jobs];
    
    MeViewController *me=[[MeViewController alloc]init];
    me.tabBarItem.image = [UIImage imageNamed:@"my"];
    me.tabBarItem.selectedImage = [UIImage imageNamed:@"click-my"];
    me.tabBarItem.title=@"我的";
    NavViewController *meNav=[[NavViewController alloc]initWithRootViewController:me];
    
    self.viewControllers=@[homeNav,NearNav,jobsNav,meNav];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
