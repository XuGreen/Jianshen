//
//  HomeViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/14.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "HomeViewController.h"
#define NAVBAR_CHANGE_POINT hight(530.0)


@interface HomeViewController ()
@property(nonatomic,strong)   UIView *HeadView;//首页顶部视图
@property(nonatomic,strong)   UICollectionView *CollectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *CollectionviewLayout;
@property(nonatomic,strong) UILabel *titleLable;//地区
@property(nonatomic,strong) UITableView *tableView;
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
    [self CreateScrollView];
    [self setNav];
    [self CreateHeadView];
    //2.从xib中加载
    [self.CollectionView registerNib:[UINib nibWithNibName:@"CollectionBottomViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CollectionCell"];
    [self.CollectionView registerNib:[UINib nibWithNibName:@"CollectionReusableHeadView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"collectionheadCell"];
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
    [containerView addSubview:self.tableView];
//    [containerView addSubview:self.CollectionView];
    
}
#pragma mark- 构建顶部视图
- (void)CreateHeadView{
    HeadView *headview=[[HeadView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 450)];
    self.tableView.tableHeaderView=headview;
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
        BoutiqueViewCell *boutiqueCell=[BoutiqueViewCell BoutiViewCell:tableView];
        boutiqueCell.selectionStyle =UITableViewCellSelectionStyleNone;
        return boutiqueCell;
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
        return 200;
    }else if (indexPath.section==1){
         return 190;
    }else if(indexPath.section==2){
        return 220;
    }else if(indexPath.section==3){
        return 250;
    }else{
        return 150;
    }
}
//#pragma mark -collectionviewdelegate  
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    static NSString *kheaderIdentifier = @"headerIdentifier";
//    UICollectionReusableView *reusableView;
//    
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        CollectionReusableHeadView *reusableHeadView=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kheaderIdentifier forIndexPath:indexPath];
//          reusableView = reusableHeadView;
//    }
//    return reusableView;
//}
////返回头headerView的大小
//
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    CGSize size={self.view.bounds.size.width,150};
//    return size;
//}

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
    CGFloat y = -scrollView.contentOffset.y;
    
    if (y <= -hight(530.0)){
        [_nav setLineColor:[UIColor groupTableViewBackgroundColor]];
        _navLineColor = [UIColor groupTableViewBackgroundColor];
    }else{
        self.title = @"";
        [_nav setLineColor:[UIColor clearColor]];
        _navLineColor = [UIColor clearColor];
    }
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT - offsetY) / 64));
        [self.navigationController.navigationBar lt_setBackgroundColor:[MAINCOLOR colorWithAlphaComponent:alpha]];
        _navBackGroundColor = [MAINCOLOR colorWithAlphaComponent:alpha];
    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0]];
        _navBackGroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    }
}

#pragma mark get

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor=COMMONRBGCOLOR;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}
#pragma mark collectionview
- (UICollectionViewFlowLayout *)CollectionviewLayout{
    if (!_CollectionviewLayout) {
        _CollectionviewLayout = [[UICollectionViewFlowLayout alloc] init];
        _CollectionviewLayout.itemSize = CGSizeMake(0, 0);
        _CollectionviewLayout.sectionInset = UIEdgeInsetsZero;
        _CollectionviewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _CollectionviewLayout.minimumLineSpacing = 0;
        _CollectionviewLayout.minimumInteritemSpacing = 0;
    }
    return _CollectionviewLayout;
}
-(UICollectionView *)CollectionView{
    if (!_CollectionView) {
        _CollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.tableView.xmg_bottom, SCREENWIDTH, 600) collectionViewLayout:self.CollectionviewLayout];
        _CollectionView.backgroundColor = [UIColor whiteColor];
        _CollectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _CollectionView.delegate = self;
        _CollectionView.dataSource = self;
        [_CollectionView setShowsHorizontalScrollIndicator:NO];
        [_CollectionView setShowsVerticalScrollIndicator:NO];
    }
    return _CollectionView;
}
@end
