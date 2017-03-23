//
//  JobsViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/15.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "JobsViewController.h"
#import "ImageGroupView.h"

@interface JobsViewController ()<UITableViewDelegate,UITableViewDataSource>{
}
@property(nonatomic,strong) UITableView    *tableView;
@property(nonatomic,strong) UIImageView    *AddImageView;
@property (nonatomic,strong) NSMutableArray *modelArray;
@end

@implementation JobsViewController

- (NSMutableArray *)modelArray
{
    if (!_modelArray) {
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    JobsModel *model=[[JobsModel alloc]init];
    model.PositionName=@"健身教练";
    model.workingAge=@"1-3年";
    model.PhotoArray=@[@"https://a-ssl.duitang.com/uploads/item/201601/14/20160114210833_eyNhF.jpeg",
                       @"https://a-ssl.duitang.com/uploads/item/201511/01/20151101005547_WB3Ar.jpeg",
                       @"https://a-ssl.duitang.com/uploads/item/201407/14/20140714145226_uGc3r.gif",
                       @"https://a-ssl.duitang.com/uploads/item/201601/14/20160114210513_Hysej.jpeg"];
    [self.modelArray addObject:model];
    [self setNav];
    [self.view addSubview:self.tableView];
    [self CreateTopView];
}
-(void)setNav{
    self.navigationItem.title=@"招聘";
    self.view.backgroundColor=COMMONRBGCOLOR;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg"] forBarMetrics:UIBarMetricsDefault];
    
    UIButton *MapBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, wight(40), hight(40))];
    [MapBtn addTarget:self action:@selector(MapClick:) forControlEvents:UIControlEventTouchUpInside];//设置按钮点击事件
    [MapBtn setBackgroundImage:[UIImage imageNamed:@"stereotaxis3"] forState:UIControlStateNormal ];//设置按钮正常状态图片
    UIBarButtonItem *MapBarButon = [[UIBarButtonItem alloc]initWithCustomView:MapBtn];
    self.navigationItem.leftBarButtonItem=MapBarButon;
    
    UIButton *addBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, wight(40), hight(40))];
    [addBtn addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];//设置按钮点击事件
    [addBtn setBackgroundImage:[UIImage imageNamed:@"more3"] forState:UIControlStateNormal ];//设置按钮正常状态图片
    UIBarButtonItem *addBarButon = [[UIBarButtonItem alloc]initWithCustomView:addBtn];
    self.navigationItem.rightBarButtonItem=addBarButon;
}
#pragma mark -招聘顶部
- (void)CreateTopView{
    JobsHeadView *headView=[[JobsHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(100))];
    self.tableView.tableHeaderView=headView;
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
    JobsViewCell *jobsCell=[JobsViewCell JobsViewCell:tableView];
    jobsCell.selectionStyle =UITableViewCellSelectionStyleNone;
    return jobsCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return hight(520);
}
//地图
- (void)MapClick:(UIButton *)sender{
    XQQLogFunc
}
//招聘
- (void)addClick:(UIButton *)sender{
    PopoverView *popoverView = [PopoverView popoverView];
    popoverView.showShade = NO; // 显示阴影背景
    [popoverView showToView:sender withActions:[self AddActions]];
}
- (NSArray<PopoverAction *> *)AddActions {
    NSMutableAttributedString * string3 = [[NSMutableAttributedString alloc] initWithString:@"我要找工作"];
    
    NSString *str3 = [string3 string];
    
    [string3 setAttributes:@{NSForegroundColorAttributeName: [tools colorWithHex:0x333333],NSFontAttributeName:[UIFont systemFontOfSize:17]}range:[str3 rangeOfString:@"我要找工作"]];
    UILabel *searchLabel=[[UILabel alloc]init];
    [searchLabel setAttributedText:string3];
    // 我要找工作 action
    PopoverAction *searchAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"search2"] title:searchLabel.text handler:^(PopoverAction *action) {
        XQQLog(@"我要找工作");
    }];
    // 我要招人 action
    PopoverAction *guestAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"guest"] title:@"我要找人" handler:^(PopoverAction *action) {
          XQQLog(@"我要找人");
    }];
    // 职位管理 action
    PopoverAction *releaseAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"release2"] title:@"职位管理" handler:^(PopoverAction *action) {
          XQQLog(@"职位管理");
    }];
    
    return @[searchAction, guestAction, releaseAction];
}

-(void)dismissDialog{
    [_AddImageView removeFromSuperview];
    _AddImageView = nil;
}
//找工作
- (void)searchResponser:(UIButton *)sender{
    XQQLogFunc
}
//招人
- (void)guestResponser:(UIButton *)sender{
    XQQLogFunc
}
//职位管理
- (void)releaseResponser:(UIButton *)sender{
    XQQLogFunc
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
