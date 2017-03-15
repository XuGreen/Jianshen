//
//  UIViewController+BackVC.m
//  XiangChou
//
//  Created by 徐青清 on 2016/11/23.
//  Copyright © 2016年 Yang Joe. All rights reserved.
//

#import "UIViewController+BackVC.h"

@implementation UIViewController (BackVC)
-(void)backVC{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 20.0 / 2.0, 35.0 / 2.0);
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(action_onBackButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)action_onBackButton : (UIButton *) sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
