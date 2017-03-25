//
//  NavViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/14.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "NavViewController.h"

@interface NavViewController ()<UIGestureRecognizerDelegate>{
    CALayer *_lineLayer;
}

@end

@implementation NavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *border = [CALayer layer];
    border.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    border.borderWidth = 0.5;
    CALayer *layer = self.navigationBar.layer;
    border.frame = CGRectMake(0, layer.bounds.size.height, layer.bounds.size.width, 0.5);
    _lineLayer = border;
    [layer addSublayer:border];
    
    NSArray *arry = [self.navigationBar subviews];
    for (UIView *view in arry) {
        NSString *viewName = NSStringFromClass([view class]);
        if ([viewName isEqualToString:@"_UINavigationBarBackground"]) {
            UIImageView *line = [view valueForKey:@"_shadowView"];
            line.hidden = YES;
        }
    }
    
    self.interactivePopGestureRecognizer.enabled = YES;
    __weak typeof (self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
    [self setNav];
}
- (void)setNav{
    self.interactivePopGestureRecognizer.delegate=self;
    self.view.backgroundColor=COMMONRBGCOLOR;
    
    //定义全局的导航栏
    UINavigationBar *navBar = [UINavigationBar appearance];
    //改变背景颜色
    navBar.barTintColor =NavColor;
    //修改导航栏标题颜色,文字大小,文字种类
    [navBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor blackColor]}];
    //修改文字
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    [barItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
}
-(void)setLineColor:(UIColor *)color{
    _lineLayer.borderColor = color.CGColor;
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
