//
//  MeViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/14.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "MeViewController.h"
#import "LoginViewController.h"
#define NAVBAR_CHANGE_POINT hight(150.0)

@interface MeViewController ()<UITableViewDelegate ,UITableViewDataSource>{
    MeTopView *HeadView;
}

@property(nonatomic,strong) UITableView    *tableView;
@property(nonatomic,strong) UIImageView *barImageView;
@end
@implementation MeViewController{
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
    [self SetTopView];
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
    UIButton *SettingButton=[UIButton buttonWithType:UIButtonTypeCustom];
    SettingButton.frame=CGRectMake(0, 0, wight(44), hight(44));
    [SettingButton setImage:[UIImage imageNamed:@"install"] forState:UIControlStateNormal];
    [SettingButton addTarget:self action:@selector(settingClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *settingBarButon = [[UIBarButtonItem alloc]initWithCustomView:SettingButton];
   
    UIButton *MsgButton=[UIButton buttonWithType:UIButtonTypeCustom];
    MsgButton.frame=CGRectMake(0, 0, wight(44), hight(44));
    [MsgButton setImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
    [MsgButton addTarget:self action:@selector(MsgClick:) forControlEvents:UIControlEventTouchUpInside];
     UIBarButtonItem *msgBarButon = [[UIBarButtonItem alloc]initWithCustomView:MsgButton];
        self.navigationItem.rightBarButtonItems=@[msgBarButon,settingBarButon];
}
//设置
- (void)settingClick:(UIButton *)sender{
    LoginViewController *login=[[LoginViewController alloc]init];
    NavViewController *nav=[[NavViewController alloc]initWithRootViewController:login];
    [self presentViewController:nav animated:YES completion:nil];
}
//消息
- (void)MsgClick:(UIButton *)sender{
    XQQLogFunc
}
#pragma mark -顶部视图
- (void)SetTopView{
    HeadView=[[MeTopView alloc]initWithFrame:CGRectMake(0, -64, SCREENWIDTH, hight(460))];
    self.tableView.tableHeaderView=HeadView;
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
        MeOrderViewCell *orderCell=[MeOrderViewCell MeOrderViewCell:tableView];
        orderCell.selectionStyle =UITableViewCellSelectionStyleNone;
        return orderCell;
    }else if(indexPath.section==1){
        MyMoneyViewCell *moneyCell=[MyMoneyViewCell MyMoneyViewCell:tableView];
        moneyCell.selectionStyle =UITableViewCellSelectionStyleNone;
        return moneyCell;
    }else if(indexPath.section==2){
        MySortViewCell *sortCell=[MySortViewCell MySortViewCell:tableView];
        sortCell.selectionStyle =UITableViewCellSelectionStyleNone;
        return sortCell;
    }else if(indexPath.section==3){
        MyJoinViewCell *joinCell=[MyJoinViewCell MyJoinViewCell:tableView];
        joinCell.selectionStyle =UITableViewCellSelectionStyleNone;
        return joinCell;
    }else{
        MyShopViewCell *shopCell=[MyShopViewCell MyShopViewCell:tableView];
        shopCell.selectionStyle =UITableViewCellSelectionStyleNone;
        return shopCell;
    }
   
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return hight(280);
    }else if(indexPath.section==1){
        return hight(400);
    }else if(indexPath.section==2){
        return hight(396);
    }else if(indexPath.section==3){
        return hight(120);
    }else{
         return hight(476);
    }
}

- (void)loginRegister:(UIButton *)sender{
    LoginViewController *login=[[LoginViewController alloc ]init];
    NavViewController *nav=[[NavViewController alloc]initWithRootViewController:login];
    [self presentViewController:nav animated:YES completion:nil];
}
#pragma mark -UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = -scrollView.contentOffset.y;
    
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
        self.navigationItem.title=@"我的";
        
        _navBackGroundColor = [MAINCOLOR colorWithAlphaComponent:alpha];
    } else {
          self.navigationItem.title=@"";
        [self.navigationController.navigationBar lt_setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0]];
        _navBackGroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    }
}
#pragma marl -懒加载
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


@end
