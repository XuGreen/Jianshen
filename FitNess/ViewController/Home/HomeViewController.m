//
//  HomeViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/14.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=COMMONRBGCOLOR;
    [self initsdcycleScrollView];
}
#pragma mark-构建广告滚动视图
- (void)initsdcycleScrollView{
    _imageArray=@[@"banner1",@"banner1",@"banner1",@"banner1"];
    UIView *Headview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200)];
    Headview.backgroundColor=COMMONRBGCOLOR;
    [self.view addSubview:Headview];
    //设置顶部轮播器
    SDCycleScrollView *scrollView=[[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200)];
    scrollView.delegate=self;
    scrollView1=  scrollView;
    //设置分页位置
    scrollView1.pageControlAliment=SDCycleScrollViewPageContolAlimentCenter;
    //设置时间间隔
    scrollView1.autoScrollTimeInterval=3.0;
    //设置当前分页圆点颜色
    scrollView1.currentPageDotColor=[UIColor colorWithRed:255/255.0 green:184/255.0 blue:31/255.0 alpha:1.0] ;
    //设置其他分页圆点颜色
    scrollView1.pageDotColor=[UIColor lightGrayColor];
    //设置动画样式
    scrollView1.pageControlStyle=SDCycleScrollViewPageContolStyleClassic;
    [self.view addSubview:scrollView1];
    scrollView1.localizationImageNamesGroup=_imageArray;
}
//功能分类模块
- (void)CreateFunctionView{
    
}
#pragma mark - 轮播器代理方法
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了图片%ld",(long)index);
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
