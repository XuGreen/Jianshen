//
//  HomeViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/14.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "HomeViewController.h"

#define NAVBAR_CHANGE_POINT hight(150.0)

@interface HomeViewController ()
@property(nonatomic,strong)  UIView           *HeadView;//首页顶部视图
@property(nonatomic,strong) UILabel            *titleLable;//地区
@property(nonatomic,strong) UITableView    *tableView;
@property(nonatomic,strong) UITextField     *SearchtextFiled;
@property(nonatomic,strong) UIImageView  *SearchimageView;
@property(nonatomic ,strong) UIButton       * clickBtn;//回到顶部按钮
@end
@implementation HomeViewController{
    UIColor *_navBackGroundColor;
    UIColor *_navLineColor;
    NavViewController *_nav;
}
- (void)loadView{
    [super loadView];
    self.view.backgroundColor = COMMONRBGCOLOR;
    self.automaticallyAdjustsScrollViewInsets=NO;
    _navBackGroundColor = [UIColor clearColor];
    _navLineColor = [UIColor clearColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _nav = (NavViewController *)self.navigationController;
    [_nav setLineColor:[UIColor clearColor]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.view addSubview:self.tableView];
    [self setNav];
    [self CreateHeadView];
    [self CreateFootView];
    [self SetNotifiCation];
    
}
- (void)SetNotifiCation{
    
    //精品项目
       [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(MoreGiftClick)  name:MOREGIFTNOTIFICATION object:nil];
    //附近场馆
       [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(MoreNearClick)  name:MORENEARNOTIFICATION object:nil];
    //优惠活动
       [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(MoreConponClick)  name:MORECOUPONNOTIFICATION object:nil];
    //推荐店铺
       [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(MoreShopClick)  name:MORESHOPNOTIFICATION object:nil];
    //附近手艺人
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(MoreGistClick)  name:MOREGISTNOTIFICATION object:nil];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.navigationController.navigationBar lt_setBackgroundColor:_navBackGroundColor];
    [_nav setLineColor:_navLineColor];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    [self.navigationController.navigationBar lt_reset];
    [_nav setLineColor:[UIColor groupTableViewBackgroundColor]];
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
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(5.0, 0.0, self.view.bounds.size.width * 0.55 , 30)];
    titleView.backgroundColor = [UIColor clearColor];
    _SearchtextFiled = [[UITextField alloc] initWithFrame:titleView.bounds];
    _SearchtextFiled.font = [UIFont systemFontOfSize:13.0];
    _SearchtextFiled.textColor = [UIColor whiteColor];
    _SearchtextFiled.text=@"输入商家名、 地点、或课程";
    _SearchtextFiled.userInteractionEnabled = NO;
    _SearchtextFiled.backgroundColor =[UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:0.7F];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,30.0 , _SearchtextFiled.bounds.size.height)];
    _SearchimageView= [[UIImageView alloc] initWithFrame:CGRectMake(10.0, view.bounds.size.height / 2.0 - 15.0 / 2.0 , 15.0 , 15.0)];
    [view addSubview:_SearchimageView];
    _SearchtextFiled.delegate  =self;
    _SearchtextFiled.layer.masksToBounds = YES;
    _SearchtextFiled.layer.cornerRadius = 16.0;
    _SearchtextFiled.layer.borderWidth = 1.0;
    _SearchtextFiled.layer.borderColor = [UIColor clearColor].CGColor;
    _SearchimageView.image = [UIImage imageNamed:@"search"];
    _SearchtextFiled.leftView = view;
    _SearchtextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    _SearchtextFiled.leftViewMode = UITextFieldViewModeAlways;
    [titleView addSubview:_SearchtextFiled];
    UIButton *Searchbutton = [[UIButton alloc] initWithFrame:titleView.bounds];
    [Searchbutton addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:Searchbutton];
    Searchbutton.backgroundColor = [UIColor clearColor];
    
    self.navigationItem.titleView = titleView;
}
#pragma mark- 构建顶部视图
- (void)CreateHeadView{
    HeadView *headview=[[HeadView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(900))];
    self.tableView.tableHeaderView=headview;
}
#pragma mark- 构建底部视图
- (void)CreateFootView{
    HomeViewTableFootView *footview=[[HomeViewTableFootView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(1380))];
    footview.backgroundColor=COMMONRBGCOLOR;
    self.tableView.tableFooterView=footview;
}
#pragma mark UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        GiftwareViewCell *giftwareCell=[GiftwareViewCell GiftViewCell:tableView];
        giftwareCell.selectionStyle =UITableViewCellSelectionStyleNone;
        return giftwareCell;
    }else if(indexPath.section==1){
        NearbyViewCell *nearbyCell=[NearbyViewCell NearbyViewCell:tableView];
         nearbyCell.selectionStyle =UITableViewCellSelectionStyleNone;
        return nearbyCell;
    }else if(indexPath.section==2){
        CouponViewCell *couponCell=[CouponViewCell CouponViewCell:tableView];
        couponCell.selectionStyle =UITableViewCellSelectionStyleNone;
        return  couponCell;
    }else if(indexPath.section==3){
        ShopViewCell *shopCell=[ShopViewCell ShopViewCell:tableView];
        shopCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return shopCell;
    }else{
        EveryDayViewCell *everyCell=[EveryDayViewCell EveryDayViewCell:tableView];
        everyCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return everyCell;
    }
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return hight(378);
    }else if (indexPath.section==1){
         return hight(368);
    }else if(indexPath.section==2){
        return hight(454);
    }else if(indexPath.section==3){
        return hight(580);
    }else{
        return hight(270);
    }
}
- (UIView *)addLineView : (CGRect)frame color : (UIColor *)color{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}
//选择地区

- (void)chooseCity:(UIButton *)sender{
    ChoseAreaViewController *choseAreaVC=[[ChoseAreaViewController alloc]init];
    NavViewController *nav=[[NavViewController alloc]initWithRootViewController:choseAreaVC];
    [self presentViewController:nav animated:YES completion:nil];

}
//搜索商家
- (void)search:(UIButton *)sender{
    SearchViewController *searchVC=[[SearchViewController alloc]init];
    NavViewController *nav=[[NavViewController alloc]initWithRootViewController:searchVC];
    [self presentViewController:nav animated:YES completion:nil];
}
//扫一扫
- (void)SweepBar:(UIButton *)sender{
    SaoViewController *saoVC=[[SaoViewController alloc]init];
    NavViewController *nav=[[NavViewController alloc]initWithRootViewController:saoVC];
    [self presentViewController:nav animated:YES completion:nil];
    
}

//消息
- (void)MessageBar:(UIButton *)sender{
    MessageViewController *messageVC=[[MessageViewController alloc]init];
    NavViewController *nav=[[NavViewController alloc]initWithRootViewController:messageVC];
    [self presentViewController:nav animated:YES completion:nil];
}
//附近手艺人
-(void)MoreGistClick{
    GistViewController *gistVC=[[GistViewController alloc]init];
    NavViewController *nav=[[NavViewController alloc]initWithRootViewController:gistVC];
    [self presentViewController:nav animated:YES completion:nil];
}
//精品项目
-(void)MoreGiftClick{
    GiftViewController *giftVC=[[GiftViewController alloc]init];
    NavViewController *nav=[[NavViewController alloc]initWithRootViewController:giftVC];
    [self presentViewController:nav animated:YES completion:nil];
}
//附近场馆
-(void)MoreNearClick{
    NearViewController *nearVC=[[NearViewController alloc]init];
    NavViewController *nav=[[NavViewController alloc]initWithRootViewController:nearVC];
    [self presentViewController:nav animated:YES completion:nil];
}
//优惠活动
-(void)MoreConponClick{
    CouponViewController *couponVC=[[CouponViewController alloc]init];
    NavViewController *nav=[[NavViewController alloc]initWithRootViewController:couponVC];
    [self presentViewController:nav animated:YES completion:nil];
}
//附近手艺人
-(void)MoreShopClick{
    ShopViewController *shopVC=[[ShopViewController alloc]init];
    NavViewController *nav=[[NavViewController alloc]initWithRootViewController:shopVC];
    [self presentViewController:nav animated:YES completion:nil];
}
#pragma mark -UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = -scrollView.contentOffset.y;
//    NSLog(@"yy:%lf",y);
    if (y <= -1440) {
        [self.view addSubview:self.clickBtn];
    }else{
        [self.clickBtn removeFromSuperview];
    }
    if (y <= -hight(230.0)){
        [_nav setLineColor:[UIColor clearColor]];
        _navLineColor = [UIColor clearColor];
  
    }else{
        [_nav setLineColor:[UIColor clearColor]];
        _navLineColor = [UIColor clearColor];
    }
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT - offsetY) / 64));
      [self.navigationController.navigationBar lt_setBackgroundColor:[[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]] colorWithAlphaComponent:alpha]];
        _navBackGroundColor = [MAINCOLOR colorWithAlphaComponent:alpha];
        _SearchtextFiled.textColor=[tools colorWithHex:0x666666];
        _SearchtextFiled.backgroundColor=[UIColor whiteColor];
        _SearchimageView.image=[UIImage imageNamed:@"search1"];
    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0]];
        _navBackGroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        _SearchtextFiled.textColor=[UIColor whiteColor];
        _SearchtextFiled.backgroundColor=[UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:0.7F];
         _SearchimageView.image=[UIImage imageNamed:@"search"];
    }
}
-(float)getTableViewHeight
{
    [self.tableView layoutIfNeeded];
    return self.tableView.contentSize.height;
}

#pragma mark get

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-49) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor=COMMONRBGCOLOR;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}

-(UIButton *)clickBtn{
    if (!_clickBtn) {
        _clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_clickBtn setImage:[UIImage imageNamed:@"top"] forState:UIControlStateNormal];
        _clickBtn.frame = CGRectMake(SCREENWIDTH-50,SCREENHEIGHT-99, 40, 40);
        _clickBtn.layer.cornerRadius = _clickBtn.xmg_width/2;
        [_clickBtn addTarget:self action:@selector(backToTop) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clickBtn;
}
-(void)backToTop{
    [UIView animateWithDuration:2.0f animations:^{
        [self.tableView setContentOffset:CGPointMake(0,0) animated:YES];
    }];
}

@end
