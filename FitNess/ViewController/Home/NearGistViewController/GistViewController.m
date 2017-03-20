//
//  GistViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/20.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "GistViewController.h"

@interface GistViewController ()

@end

@implementation GistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
}
-(void)setNav{
    self.navigationItem.title=@"手艺人";
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
