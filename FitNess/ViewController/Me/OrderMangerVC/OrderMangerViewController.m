//
//  OrderMangerViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/30.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "OrderMangerViewController.h"
#import "AllOrderViewController.h"
#import "StayPayViewController.h"
#import "StayServerViewController.h"
#import "UnderWayViewController.h"
#import "StayEvaluateViewController.h"
#import "CancelViewController.h"
#import "TitleButton.h"

@interface OrderMangerViewController ()<UIScrollViewDelegate>
//当前选中的标题按钮
@property(nonatomic,weak)TitleButton *selectedTitleButton;
//标题按钮底部的指示器
@property(nonatomic,weak)UIView *indicatorView;
//UIScrollView
@property(nonatomic,weak)UIScrollView *scrollView;
//标题栏
@property(nonatomic,weak)UIView *titlesView;


@end

@implementation OrderMangerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setupChildViewControllers];
    [self setupScrollView];
    [self setupTitlesView];
    [self addChildVcView];
}

- (void)setNav{
    self.navigationItem.title=@"订单管理";
    [self backVC];
}
- (void)setupChildViewControllers{
    AllOrderViewController *all=[[AllOrderViewController alloc]init];
    [self addChildViewController:all];
    
    StayPayViewController *NoPay=[[StayPayViewController alloc]init];
    [self addChildViewController:NoPay];
    
    StayServerViewController *StayServer=[[StayServerViewController alloc]init];
    [self addChildViewController:StayServer];
    
    UnderWayViewController *UnderWay=[[UnderWayViewController alloc]init];
    [self addChildViewController:UnderWay];
    
    StayEvaluateViewController *Evaluate=[[StayEvaluateViewController alloc]init];
    [self addChildViewController:Evaluate];
    
    CancelViewController *cancel=[[CancelViewController alloc]init];
    [self addChildViewController:cancel];
    
}
- (void)setupScrollView{
    //不允许自动调整 scrollView 的内边距
    self.automaticallyAdjustsScrollViewInsets=NO;
    UIScrollView *scrollView=[[UIScrollView alloc]init];
    scrollView.backgroundColor=COMMONRBGCOLOR;
    scrollView.frame=self.view.bounds;
    scrollView.pagingEnabled=YES;
    scrollView.showsVerticalScrollIndicator=NO;
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.delegate=self;
    [self.view addSubview:scrollView];
    //添加所有子控制器的 view 到 scrollView 中
    scrollView.contentSize=CGSizeMake(self.childViewControllers.count * scrollView.xmg_width, 0);
    [self.view addSubview:scrollView];
    self.scrollView=scrollView;
}
- (void)setupTitlesView{
    //标题栏
    UIView *titlesView=[[UIView alloc]init];
    titlesView.backgroundColor=[UIColor whiteColor];
    titlesView.frame=CGRectMake(0, 64, self.view.xmg_width, 35);
    [self.view addSubview:titlesView];
    //添加标题
    NSArray *titles=@[@"全部",@"待付款",@"待服务",@"进行中",@"待评价",@"已取消"];
    NSUInteger count=titles.count;
    CGFloat titleButtonW=titlesView.xmg_width / count;
    CGFloat titleButtonH=titlesView.xmg_height;
    for (NSUInteger i = 0; i < count; i++) {
        //创建
        TitleButton *titleButton =[TitleButton buttonWithType:UIButtonTypeCustom];
        titleButton.tag=i;
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:titleButton];
        //设置数据
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        //设置 frame
        titleButton.frame=CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
    }
    //按钮选中颜色
    TitleButton *firstTitleButton =titlesView.subviews.firstObject;
    //底部的指示器
    UIView *indicatorView=[[UIView alloc]init];
    indicatorView.backgroundColor=[firstTitleButton titleColorForState:UIControlStateSelected];
    indicatorView.xmg_height=2;
    indicatorView.xmg_y=titlesView.xmg_height-indicatorView.xmg_height;
    [titlesView addSubview:indicatorView];
    self.indicatorView=indicatorView;
    //立刻根据文字内容计算 label 的宽度
    [firstTitleButton.titleLabel sizeToFit];
    indicatorView.xmg_width=firstTitleButton.xmg_width;
    indicatorView.xmg_centerX=firstTitleButton.xmg_centerX;
    //默认情况:选中最前面的标题按钮
    firstTitleButton.selected=YES;
    self.selectedTitleButton=firstTitleButton;
    
}
#pragma mark -监听点击
- (void)titleClick:(TitleButton *)titleButton{
    //控制按钮
    self.selectedTitleButton.selected=NO;
    titleButton.selected=YES;
    self.selectedTitleButton=titleButton;
    //指示器
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.xmg_width=titleButton.xmg_width;
        self.indicatorView.xmg_centerX=titleButton.xmg_centerX;
    }];
    //让 UIScrollView 滚动到对应位置
    CGPoint offset=self.scrollView.contentOffset;
    offset.x=titleButton.tag * self.scrollView.xmg_width;
    [self.scrollView setContentOffset:offset animated:YES];
}
-(void)tagClick{
    XQQLogFunc
}
#pragma mark -添加控制器的 View
- (void)addChildVcView{
    //子控制器的索引
    NSUInteger index=self.scrollView.contentOffset.x / self.scrollView.xmg_width;
    //取出子控制器
    UIViewController *childVc=self.childViewControllers[index];
    if ([childVc isViewLoaded])  return;
    childVc.view.frame=self.scrollView.bounds;
    [self.scrollView addSubview:childVc.view];
}
#pragma mark -<UIScrollViewDelegate>
/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 使用setContentOffset:animated:或者scrollRectVisible:animated:方法让scrollView产生滚动动画
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self addChildVcView];
}
/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 人为拖拽scrollView产生的滚动动画
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //选中/点击对应的按钮
    NSUInteger index=scrollView.contentOffset.x / scrollView.xmg_width;
    TitleButton *titleButton=self.titlesView.subviews[index];
    [self titleClick:titleButton];
    //添加子控制器的View
    [self addChildVcView];
}


@end
