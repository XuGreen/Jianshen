//
//  NearbyViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/15.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "NearbyViewController.h"

@interface NearbyViewController ()

@end

@implementation NearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"附近";
    self.view.backgroundColor=[UIColor whiteColor];
   [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg"] forBarMetrics:UIBarMetricsDefault];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
