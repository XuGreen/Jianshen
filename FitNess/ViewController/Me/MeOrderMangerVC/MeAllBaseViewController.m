//
//  MeAllBaseViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/31.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "MeAllBaseViewController.h"
#import "MeOrderMangerViewCell.h"

@interface MeAllBaseViewController ()

@end

@implementation MeAllBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
}

#pragma mark -创建 tableview
- (void)createTableView{
    self.tableView.backgroundColor=COMMONRBGCOLOR;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.tableFooterView = [[UIView alloc] init];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MeOrderMangerViewCell * OrderCell=[MeOrderMangerViewCell MeOrderMangerViewCell:tableView];
    OrderCell.selectionStyle =UITableViewCellSelectionStyleNone;
    return OrderCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return hight(398);
}

@end
