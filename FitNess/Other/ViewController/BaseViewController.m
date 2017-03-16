//
//  BaseViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/16.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreateScrollView];
}
-(void)CreateScrollView{
    containerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-40)];
    containerView.delegate = self;
    containerView.showsVerticalScrollIndicator = FALSE;
    containerView.backgroundColor = COMMONRBGCOLOR;
    containerView.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    [self.view addSubview:containerView];
    
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
