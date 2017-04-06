//
//  ProductTypeViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/27.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ProductTypeViewController.h"
#import "PrductTypeModel.h"

@interface ProductTypeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView    *tableView;
@property(nonatomic,strong)NSMutableArray    *productType;
@property(nonatomic,strong)UIButton        *selectBtn;
@property( nonatomic,assign)NSIndexPath *selIndex;
@end

@implementation ProductTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _productType=[NSMutableArray array];
    [self setNav];
    [self.view addSubview:self.tableView];
    [self RequestTypeData];
 
}
-(void)setNav{
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"产品类型";
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 20.0 / 2.0, 35.0 / 2.0);
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(action_onBackButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
}
- (void)RequestTypeData{
    [NetWorkManager getProductArraysuccess:^(BaseResponse *response) {
        
        NSMutableDictionary *dict=(NSMutableDictionary *)response.data;
        NSMutableArray *array=[NSMutableArray array];
        for (NSMutableDictionary *typeDic in dict) {
            PrductTypeModel *model=[[PrductTypeModel alloc]init];
            model.typeId=[typeDic objectForKey:@"id"];
            model.name=[typeDic objectForKey:@"name"];
            [array addObject:model];
        }
        _productType=array;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        XQQLog(@"%@",error);
    }];
}
-(void)action_onBackButton:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.productType.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer=@"Cell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    PrductTypeModel *model=[_productType objectAtIndex:indexPath.row];
    cell.textLabel.text=model.name;
    UIButton *ClickBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH-wight(50)-15, hight(25), wight(50), hight(50))];
    [ClickBtn setImage:[UIImage imageNamed:@"select3"] forState:UIControlStateNormal];
    self.selectBtn=ClickBtn;
    [cell.contentView addSubview:ClickBtn];
    if (_selIndex==indexPath) {
        self.selectBtn.hidden=NO;
    }else{
        self.selectBtn.hidden=YES;
    }
  
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row) {
        self.selectBtn.hidden=NO;
    }
    //之前选中的，取消选择
    UITableViewCell *celled = [tableView cellForRowAtIndexPath:_selIndex];
    self.selectBtn.hidden=YES;
    [celled.contentView addSubview:self.selectBtn];
    //记录当前选中的位置索引
    _selIndex = indexPath;
    //当前选择的打勾
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    // 记录当前选中的位置索引
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    self.selectBtn.hidden=NO;
    [cell.contentView addSubview:self.selectBtn];
    PrductTypeModel *model=[_productType objectAtIndex:indexPath.row];
    [self.delegate selectTypeWithName:model.name typeID:model.typeId];
    [self.navigationController popViewControllerAnimated:YES];
 
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return hight(100);
}
#pragma marl -懒加载
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 15, SCREENWIDTH, SCREENHEIGHT-49) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_tableView   setSeparatorColor:LINECOLOR];
        _tableView.separatorInset=UIEdgeInsetsMake(hight(98), 15, 1, 15);
        _tableView.backgroundColor=COMMONRBGCOLOR;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}



@end
