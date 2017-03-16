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
}
- (void)TabBars{
    HomeViewController *home=[[HomeViewController alloc]init];
    home.tabBarItem.image = [UIImage imageNamed:@"home"];
    home.tabBarItem.selectedImage = [UIImage imageNamed:@"click-home"];
    home.tabBarItem.title=@"首页";
    NavViewController *homeNav=[[NavViewController alloc]initWithRootViewController:home];
    
    NearbyViewController *nearby=[[NearbyViewController alloc]init];
    nearby.tabBarItem.image = [UIImage imageNamed:@"nearby"];
    nearby.tabBarItem.selectedImage = [UIImage imageNamed:@"click-nearby"];
    nearby.tabBarItem.title=@"附近";
    NavViewController *classNav=[[NavViewController alloc]initWithRootViewController:nearby];
    
    JobsViewController *jobs=[[JobsViewController alloc]init];
    jobs.tabBarItem.image = [UIImage imageNamed:@"recruitment"];
    jobs.tabBarItem.selectedImage = [UIImage imageNamed:@"click-recruitment"];
    jobs.tabBarItem.title=@"招聘";
    NavViewController *otherNav=[[NavViewController alloc]initWithRootViewController:jobs];
    
    MeViewController *me=[[MeViewController alloc]init];
    me.tabBarItem.image = [UIImage imageNamed:@"my"];
    me.tabBarItem.selectedImage = [UIImage imageNamed:@"click-my"];
    me.tabBarItem.title=@"我的";
    NavViewController *meNav=[[NavViewController alloc]initWithRootViewController:me];
    
    self.viewControllers=@[homeNav,classNav,otherNav,meNav];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
