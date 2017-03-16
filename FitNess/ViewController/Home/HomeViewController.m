//
//  HomeViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/14.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "HomeViewController.h"
#import "FunctionView.h"
#import "MXNavigationBarManager.h"
#define kScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)


@interface HomeViewController ()<UITextFieldDelegate,UITableViewDataSource, UITableViewDelegate>{
    //定义一个imageview来等同于这个黑线
    UIImageView *navBarHairlineImageView;
}
@property(nonatomic,strong)   UIView *HeadView;//首页顶部视图
@property(nonatomic,strong)   UICollectionView *CollectionView;
@property(nonatomic,strong) UILabel *titleLable;//地区
@property (nonatomic) CGFloat halfHeight;//滑动高度
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBarManager];
    [self.view addSubview:self.tableView];
    [self setNav];
    [self CreateHeadView];
    navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
     navBarHairlineImageView.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    [MXNavigationBarManager reStoreToSystemNavigationBar];
     navBarHairlineImageView.hidden = NO;
}
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;

}

- (void)initBarManager {
    [MXNavigationBarManager managerWithController:self];
    [MXNavigationBarManager setBarColor:MAINCOLOR];
    [MXNavigationBarManager setTintColor:[UIColor clearColor]];
    [MXNavigationBarManager setStatusBarStyle:UIStatusBarStyleDefault];
    [MXNavigationBarManager setZeroAlphaOffset:-64];
    [MXNavigationBarManager setFullAlphaOffset:200];
    [MXNavigationBarManager setFullAlphaTintColor:[UIColor clearColor]];
    [MXNavigationBarManager setFullAlphaBarStyle:UIStatusBarStyleLightContent];
}
-(void)setNav{
    //左边 选择地区
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 60.0, 44.0)];
    leftView.backgroundColor = [UIColor clearColor];
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 40.0, leftView.bounds.size.height)];
    titleLable.text = @"成都";
    self.titleLable = titleLable;
    titleLable.numberOfLines = 0;
    titleLable.adjustsFontSizeToFitWidth = YES;
    titleLable.font = [UIFont systemFontOfSize:16.0];
    titleLable.textColor = [UIColor whiteColor];
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.backgroundColor = [UIColor clearColor];
    [leftView addSubview:titleLable];
    //箭头
    UIImageView *arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(titleLable.frame.origin.x + titleLable.frame.size.width, leftView.bounds.size.height / 2.0 - 5.0, 18.0, 10.0)];
    arrowImageView.image = [UIImage imageNamed:@"enter"];
    [leftView addSubview:arrowImageView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:leftView.bounds];
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(chooseCity:) forControlEvents:UIControlEventTouchUpInside];
    [leftView addSubview:button];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    // 右边-扫一扫，消息
    UIButton *shareBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [shareBtn addTarget:self action:@selector(SweepBar:) forControlEvents:UIControlEventTouchUpInside];//设置按钮点击事件
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"scan"] forState:UIControlStateNormal ];//设置按钮正常状态图片
    UIBarButtonItem *sweepBarButon = [[UIBarButtonItem alloc]initWithCustomView:shareBtn];
    UIButton *messageBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 26, 22)];
    [messageBtn addTarget:self action:@selector(MessageBar:) forControlEvents:UIControlEventTouchUpInside];//设置按钮点击事件
    [messageBtn setBackgroundImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal ];//设置按钮正常状态图片
    UIBarButtonItem *messageBarButon = [[UIBarButtonItem alloc]initWithCustomView:messageBtn];
    self.navigationItem.rightBarButtonItems=@[messageBarButon,sweepBarButon];
    
    //自定义 titleview
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(5.0, 0.0, self.view.bounds.size.width * 0.55 , 40.0)];
    titleView.backgroundColor = [UIColor clearColor];
    UITextField *textFiled = [[UITextField alloc] initWithFrame:titleView.bounds];
    textFiled.font = [UIFont systemFontOfSize:13.0];
    textFiled.textColor = [UIColor whiteColor];
    textFiled.text=@"输入商家名、 地点、或课程";
    textFiled.userInteractionEnabled = NO;
    textFiled.backgroundColor =[UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:0.7F];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,30.0 , textFiled.bounds.size.height)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, view.bounds.size.height / 2.0 - 15.0 / 2.0 , 15.0 , 15.0)];
    [view addSubview:imageView];
    textFiled.delegate  =self;
    textFiled.layer.masksToBounds = YES;
    textFiled.layer.cornerRadius = 20.0;
    textFiled.layer.borderWidth = 1.0;
    textFiled.layer.borderColor = [UIColor clearColor].CGColor;
    imageView.image = [UIImage imageNamed:@"search"];
    textFiled.leftView = view;
    textFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    textFiled.leftViewMode = UITextFieldViewModeAlways;
    
    [titleView addSubview:textFiled];
    UIButton *Searchbutton = [[UIButton alloc] initWithFrame:titleView.bounds];
    [Searchbutton addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:Searchbutton];
    Searchbutton.backgroundColor = [UIColor clearColor];
    
    self.navigationItem.titleView = titleView;
}
#pragma mark -构建滚动视图
-(void)CreateScrollView{
    containerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-40)];
    containerView.delegate = self;
    containerView.showsVerticalScrollIndicator = FALSE;
    containerView.backgroundColor = COMMONRBGCOLOR;
    containerView.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    [self.view addSubview:containerView];
    
}
#pragma mark- 构建顶部视图
- (void)CreateHeadView{
    _HeadView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 500)];
    _HeadView.backgroundColor=[UIColor whiteColor];
    //构建广告视图
    _imageArray=@[@"banner1",@"banner1",@"banner1",@"banner1"];
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
    [_HeadView addSubview:scrollView1];
    scrollView1.localizationImageNamesGroup=_imageArray;
    
    UIImage *bgImage = [UIImage imageNamed:@"inner_bg_tou.png"];
    UIImageView *bg_tou_ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0,scrollView1.frame.size.width, scrollView1.frame.size.height)];
    bg_tou_ImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    bg_tou_ImageView.image = bgImage;
    [scrollView1 addSubview:bg_tou_ImageView];
    
    //功能分类模块
    FunctionView *functionView=[[FunctionView alloc]initWithFrame:CGRectMake(0, scrollView1.xmg_bottom, SCREENWIDTH, 320)];
    [_HeadView addSubview:functionView];
    [_HeadView addSubview:[self addLineView:CGRectMake(10, functionView.xmg_bottom+10, SCREENWIDTH-25, 2) color:LINECOLOR]];
    self.tableView.tableHeaderView=_HeadView;
    //热门资讯
}
#pragma mark UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = @"text";
    return cell;
}

#pragma mark - 轮播器代理方法
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了图片%ld",(long)index);
}

- (UIView *)addLineView : (CGRect)frame color : (UIColor *)color{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}
//选择地区

- (void)chooseCity:(UIButton *)sender{
    XQQLogFunc
}
//搜索商家
- (void)search:(UIButton *)sender{
     XQQLogFunc
}
//扫一扫
- (void)SweepBar:(UIButton *)sender{
    XQQLogFunc
}
//消息
- (void)MessageBar:(UIButton *)sender{
    XQQLogFunc
}
#pragma mark -UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [MXNavigationBarManager changeAlphaWithCurrentOffset:scrollView.contentOffset.y];
}

#pragma mark get

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -64, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}
@end
