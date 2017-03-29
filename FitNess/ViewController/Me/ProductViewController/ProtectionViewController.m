//
//  ProtectionViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/29.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ProtectionViewController.h"
#import "ProtectionViewCell.h"

@interface ProtectionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView    *tableView;
@property(nonatomic,strong) NSArray          *imageArray;
@property(nonatomic,strong) NSArray          *titleArray;
@property(nonatomic,strong) NSArray          *detailArray;

@end

@implementation ProtectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self.view addSubview:self.tableView];
    UIView *headerView = [MyView uiview:0 bColor:[UIColor clearColor] rect:CGRectMake(0, 0, SCREENWIDTH, hight(20))];
    self.tableView.tableHeaderView = headerView;
    _imageArray=[NSArray arrayWithObjects:@"remind", @"compensation",@"claimant",@"truth",@"Insurance",nil];
    _titleArray=[NSArray arrayWithObjects:@"迟到升级", @"爽约赔偿",@"先行赔付",@"如实描述",@"赠送保险",nil];
    _detailArray=[NSArray arrayWithObjects:@"手艺人迟到30分钟，按当次服务实付金额的150%免费升级项目", @"服务开始前60分钟，手艺人临时爽约，全额退款，额外获赔实付100%",@"平台提供先行赔付:如果手艺人跳过平台与你私下交易,额外获赔3000元奖励",@"说到做到，服务实际市场、产品品质低于平台上发布的作品描述，当场服务免单，额外获赔100%",@"每单赠送保障险，用户因服务受到人身或财产意外损害，享高额保险赔偿，地板磕坏我都赔！",nil];
}
-(void)setNav{
    self.view.backgroundColor=COMMONRBGCOLOR;
    self.navigationItem.title=@"服务保障";
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 20.0 / 2.0, 35.0 / 2.0);
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(action_onBackButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;

}
-(void)action_onBackButton:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProtectionViewCell *protectCell=[ProtectionViewCell ProtectionViewCell:tableView];
    protectCell.selectionStyle =UITableViewCellSelectionStyleNone;
    protectCell.imageViews.image=[UIImage imageNamed:_imageArray[indexPath.row]];
    protectCell.titleLabel.text=_titleArray[indexPath.row];
    protectCell.detailLabel.text=_detailArray[indexPath.row];
    
    return protectCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return hight(190);
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
        _tableView.separatorInset=UIEdgeInsetsMake(hight(98), 15, 1, 15);
        _tableView.backgroundColor=COMMONRBGCOLOR;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}
@end
