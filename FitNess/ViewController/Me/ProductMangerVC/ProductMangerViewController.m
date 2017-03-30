//
//  ProductMangerViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/30.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ProductMangerViewController.h"
#import "ProductMangerCell.h"

@interface ProductMangerViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView    *tableView;
@property(nonatomic,strong) UIButton    *addProductBtn;
@end

@implementation ProductMangerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self.view addSubview:self.tableView];
    [self creataBottomView];
}
- (void)setNav{
    self.navigationItem.title=@"产品管理";
    [self backVC];
}
#pragma mark-Bottom
- (void)creataBottomView{
    UIView *bottomView=[MyView uiview:0 bColor:[tools colorWithHex:0xFFB81F] rect:CGRectMake(0, SCREENHEIGHT-hight(98), SCREENWIDTH, hight(98))];
    [self.view addSubview:bottomView];
    _addProductBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, bottomView.xmg_width, hight(98))];
    [_addProductBtn setTitle:@"添加产品" forState:UIControlStateNormal];
    _addProductBtn.titleLabel.font=[UIFont systemFontOfSize:19];
    [_addProductBtn setTitleColor:[tools colorWithHex:0xFFFFFF] forState:UIControlStateNormal];
    [bottomView addSubview:self.addProductBtn];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductMangerCell *  ProductCell=[ProductMangerCell ProductMangerCell:tableView];
    ProductCell.selectionStyle =UITableViewCellSelectionStyleNone;
    return ProductCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return hight(380);
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
