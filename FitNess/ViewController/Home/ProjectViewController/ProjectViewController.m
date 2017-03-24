//
//  ProjectViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/23.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ProjectViewController.h"
#define NAVBAR_CHANGE_POINT hight(150.0)

@interface ProjectViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UIButton *backButton;
    UIButton *shareButton;
}
@property(nonatomic,strong) UITableView    *tableView;
@property(nonatomic,strong) UIButton          *ShopBtn;
@property(nonatomic,strong) UIButton          *PhoneBtn;
@property(nonatomic,strong) UIButton          *BuyBtn;
@property(nonatomic ,strong) UIButton       * clickBtn;//回到顶部按钮
@end

@implementation ProjectViewController{
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
    [self setNav];
    [self.view addSubview:self.tableView];
    [self CreateHeadView];
    [self createFootView];
    [self creataBottomView];
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
- (void)setNav{
    self.view.backgroundColor=COMMONRBGCOLOR;
    //返回按钮
    backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, wight(50), hight(50));
    [backButton setImage:[UIImage imageNamed:@"back3"] forState:UIControlStateNormal];
    backButton.backgroundColor=XQQColorRGB(0, 0, 0, 0.6);
    backButton.layer.cornerRadius=backButton.xmg_width/2;
    backButton.layer.masksToBounds=YES;
    [backButton addTarget:self action:@selector(action_onBackButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
    //分享按钮
    shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    shareButton.frame = CGRectMake(0, 0, wight(50), hight(50));
    [shareButton setImage:[UIImage imageNamed:@"share2"] forState:UIControlStateNormal];
    shareButton.backgroundColor=XQQColorRGB(0, 0, 0, 0.6);
    shareButton.layer.cornerRadius=backButton.xmg_width/2;
    shareButton.layer.masksToBounds=YES;
    [shareButton addTarget:self action:@selector(action_onShareButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc]initWithCustomView:shareButton];
    self.navigationItem.rightBarButtonItem = shareItem;
}
#pragma mark-Bottom
- (void)creataBottomView{
    UIView *bottomView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, SCREENHEIGHT-hight(98), SCREENWIDTH, hight(98))];
    [self.view addSubview:bottomView];
    //店铺
    _ShopBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, (SCREENWIDTH/2)/2, hight(98))];
    [_ShopBtn setTitle:@"店铺" forState:UIControlStateNormal];
    [_ShopBtn setImage:[UIImage imageNamed:@"shop3"] forState:UIControlStateNormal];
    _ShopBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    [_ShopBtn setTitleColor:[tools colorWithHex:0x999999] forState:UIControlStateNormal];
    CGFloat space=10.0;
    [_ShopBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:space];
    [bottomView addSubview:self.ShopBtn];
    //电话
    _PhoneBtn=[[UIButton alloc]initWithFrame:CGRectMake(_ShopBtn.xmg_right, 0, (SCREENWIDTH/2)/2, hight(98))];
    [_PhoneBtn setTitle:@"电话" forState:UIControlStateNormal];
    [_PhoneBtn setImage:[UIImage imageNamed:@"phone3"] forState:UIControlStateNormal];
    _PhoneBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    [_PhoneBtn setTitleColor:[tools colorWithHex:0x999999] forState:UIControlStateNormal];
    CGFloat space1=10.0;
    [_PhoneBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:space1];
    [bottomView addSubview:self.PhoneBtn];
    //立即购买
    _BuyBtn=[[UIButton alloc]initWithFrame:CGRectMake(_PhoneBtn.xmg_right, 0, SCREENWIDTH/2, hight(98))];
    [_BuyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    _BuyBtn.titleLabel.font=[UIFont systemFontOfSize:19];
    [_BuyBtn setTitleColor:[tools colorWithHex:0xFFFFFF] forState:UIControlStateNormal];
    _BuyBtn.backgroundColor=[tools colorWithHex:0xFFB81F];
    [bottomView addSubview:self.BuyBtn];
    [bottomView addSubview:[self addLineView:CGRectMake(0, 0, SCREENWIDTH, 1) color:LINECOLOR]];
     [bottomView addSubview:[self addLineView:CGRectMake(_ShopBtn.xmg_right-1.5, 0, 1.5, _ShopBtn.xmg_height) color:LINECOLOR]];
}
- (UIView *)addLineView : (CGRect)frame color : (UIColor *)color{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}
#pragma mark-构建顶部视图
- (void)CreateHeadView{
    ProjectHeadView *headView=[[ProjectHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(1000))];
    self.tableView.tableHeaderView=headView;
}
#pragma mark-构建底部视图
- (void)createFootView{
    ProjectBottomVIew *footView=[[ProjectBottomVIew alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(564)*2+hight(260))];
    self.tableView.tableFooterView=footView;
}
#pragma mark-构建TableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        SaverViewCell *saverCell=[SaverViewCell SaverViewCell:tableView];
        saverCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return saverCell;
    }else if (indexPath.section==1){
        DetailDestrptionViewCell *DetailDestrptionCell=[DetailDestrptionViewCell DetailDestrptionViewCell:tableView];
        DetailDestrptionCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return DetailDestrptionCell;
    }else if (indexPath.section==2){
        ReservationViewCell * ReservationCell=[ReservationViewCell ReservationViewCell:tableView];
        ReservationCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return ReservationCell;
     
    }else if (indexPath.section==3){
        ProjectdescriptionViewCell *ProjectdescriptionCell=[ProjectdescriptionViewCell ProjectdescriptionViewCell:tableView];
        ProjectdescriptionCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return ProjectdescriptionCell;
    }else if (indexPath.section==4){
        EvaluateViewCell *EvaluateCell=[EvaluateViewCell EvaluateViewCell:tableView];
        EvaluateCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return EvaluateCell;
    }else{
        PersonDetailViewCell *PersonDetailCell=[PersonDetailViewCell PersonDetailViewCell:tableView];
        PersonDetailCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return PersonDetailCell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    EvaluateViewCell *evaluate=[[EvaluateViewCell alloc]init];
    if (indexPath.section==0) {
        return hight(326);
    }else if (indexPath.section==1){
        return hight(280);
    }else if (indexPath.section==2){
        return hight(420);
    }else if (indexPath.section==3){
        return hight(310);
    }else if (indexPath.section==4){
        return hight(600)+evaluate.ReplyView.xmg_height;
    }else{
        return hight(170);
    }
}
#pragma mark -UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = -scrollView.contentOffset.y;
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
        self.navigationItem.title=@"首页详情";
        [backButton setImage:[UIImage imageNamed:@"back2"] forState:UIControlStateNormal];
        backButton.backgroundColor=[UIColor clearColor];
        [shareButton setImage:[UIImage imageNamed:@"share1"] forState:UIControlStateNormal];
        shareButton.backgroundColor=[UIColor clearColor];
    } else {
        self.navigationItem.title=@"";
        [self.navigationController.navigationBar lt_setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0]];
        _navBackGroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];\
        [backButton setImage:[UIImage imageNamed:@"back3"] forState:UIControlStateNormal];
        backButton.backgroundColor=XQQColorRGB(0, 0, 0, 0.6);
         [shareButton setImage:[UIImage imageNamed:@"share2"] forState:UIControlStateNormal];
        shareButton.backgroundColor=XQQColorRGB(0, 0, 0, 0.6);
    }
}
//返回按钮
- (void)action_onBackButton : (UIButton *) sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
//分享按钮
- (void)action_onShareButton : (UIButton *) sender {
  XQQLogFunc
}

#pragma mark tableview

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
-(float)getTableViewHeight
{
    [self.tableView layoutIfNeeded];
    return self.tableView.contentSize.height;
}
@end
