//
//  SearchViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/19.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
}
-(void)setNav{
    self.navigationItem.title=@"搜索";
    self.view.backgroundColor=COMMONRBGCOLOR;
    [self backVC];
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
