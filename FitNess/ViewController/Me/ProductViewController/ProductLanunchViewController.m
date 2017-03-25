//
//  ProductLanunchViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/25.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ProductLanunchViewController.h"

@interface ProductLanunchViewController (){
    UIButton * _referBtn;
}
@property(nonatomic,strong) UIView    *TopView;
@property(nonatomic,strong) UIView    *backgroundView;
@property(nonatomic,strong) UIButton *ChoosePhotoBtn;
@property(nonatomic,strong) UILabel   *ChoosrLabel;
@property(nonatomic, strong) UITextField *TitleFiled;
@property(nonatomic, strong) UITextField *TitleFuFiled;
@property(nonatomic,strong) UITableView    *tableView;
@property(nonatomic,strong) UIButton    *Button1;
@end

@implementation ProductLanunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self.view addSubview:self.tableView];
    [self CreateTopView];
    _Button1=[UIButton buttonWithType:UIButtonTypeCustom];
    _Button1.frame=CGRectMake(0, 0, 320, 30);
    _Button1.backgroundColor=[UIColor redColor];
    _Button1.tag=100;
    [_Button1 setTitle:@"未打开" forState: UIControlStateNormal];
      [_Button1 setTitle:@"未打开" forState: UIControlStateSelected];
    [_Button1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
  
}
- (void)buttonClick:(UIButton *)sender{
    sender.selected=!sender.selected;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag-100] withRowAnimation:UITableViewRowAnimationTop];
}
- (void)setNav{
    self.navigationItem.title=@"发布产品";
    [self backVC];
    [self CreateTopView];
}
- (void)CreateTopView{
    _TopView=[MyView uiview:0 bColor:COMMONRBGCOLOR rect:CGRectMake(0, 64, SCREENWIDTH, hight(650))];
    [self.view addSubview:_TopView];
    
    _backgroundView=[MyView uiview:0 bColor:COMMONRBGCOLOR rect:CGRectMake(0, 0, SCREENWIDTH, hight(400))];
    [_TopView addSubview:self.backgroundView];
    
    _ChoosePhotoBtn = [[UIButton alloc] initWithFrame:_backgroundView.bounds];
    _ChoosePhotoBtn.hidden=NO;
    _ChoosePhotoBtn.tag=20;
    [_ChoosePhotoBtn setImage:[UIImage imageNamed:@"upload"] forState:UIControlStateNormal];
    _ChoosePhotoBtn.imageEdgeInsets = UIEdgeInsetsMake(1.0, 1.0, 0.0, 1.0);
    [_ChoosePhotoBtn addTarget:self action:@selector(addImage:) forControlEvents:UIControlEventTouchUpInside];
    [_backgroundView addSubview:_ChoosePhotoBtn];
    
    _ChoosrLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, _backgroundView.bounds.size.height / 2.0 + 50.0, _backgroundView.bounds.size.width, 20.0)];
    _ChoosrLabel.text = @"(可多张)";
    _ChoosrLabel.hidden=NO;
    _ChoosrLabel.font = [UIFont systemFontOfSize:13.0];
    _ChoosrLabel.textAlignment = NSTextAlignmentCenter;
    _ChoosrLabel.textColor = [tools colorWithHex:0x999999];
    [_backgroundView addSubview:_ChoosrLabel];
    
    NSArray *titleArray=[NSArray arrayWithObjects:@"输入产品标题",@"输入产品副标题", nil];
    for (int i=0; i<titleArray.count; i++) {
        TouchUIView *view=[[TouchUIView alloc]init];
        if (i==0) {
            view.frame=CGRectMake(0, _backgroundView.xmg_bottom, SCREENWIDTH, hight(100));
        }else{
            view.frame=CGRectMake(0, _backgroundView.xmg_bottom+hight(100), SCREENWIDTH, hight(150));
        }
        view.backgroundColor=[UIColor whiteColor];
        view.dragEnable=YES;
        view.tag=i;
        view.userInteractionEnabled=YES;
        [_TopView addSubview:view];
        if (i==0) {
            _TitleFiled=[MyView Textfile:titleArray[i] corner:0 rect:CGRectMake(wight(30), 0, SCREENWIDTH-100, hight(100))];
            [view addSubview:_TitleFiled];
            UILabel *TitleLabel=[MyView label:@"0/30字" tColor:[tools colorWithHex:0x999999] font:[UIFont systemFontOfSize:14] rect:CGRectMake(SCREENWIDTH-wight(100)-15, hight(37), wight(100), 20)];
            [view addSubview:TitleLabel];

        }else{
            _TitleFuFiled=[MyView Textfile:titleArray[i] corner:0 rect:CGRectMake(wight(30), 0, SCREENWIDTH-100, hight(150))];
            [view addSubview:_TitleFuFiled];
            UILabel *TitleFuLabel=[MyView label:@"0/50字" tColor:[tools colorWithHex:0x999999] font:[UIFont systemFontOfSize:14] rect:CGRectMake(SCREENWIDTH-wight(100)-15, hight(100), wight(100), 20)];
            [view addSubview:TitleFuLabel];
        }
        [view addSubview:[MyView addLineView:CGRectMake(10,view.xmg_height-1, SCREENWIDTH-10, 2) color:LINECOLOR]];
          }
    self.tableView.tableHeaderView=_TopView;
}
- (void)addImage:(UIButton *)sender{
    XQQLogFunc
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 10;
    }else{
         return 1;
    }
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        static NSString *identifer=@"Cell";
         UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        }
        NSArray *titleArray=[NSArray arrayWithObjects:@"产品类型",@"价格",@"市场价",@"服务次数", @"服务描述",@"服务保障",@"可预约时间段",@"适用人群",@"注意事项",@"商品详情",nil];
         cell.selectionStyle =UITableViewCellSelectionStyleNone;
        cell.textLabel.text=[titleArray objectAtIndex:indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(cell.contentView.xmg_right-wight(320),hight(30), wight(400), hight(50))];
        field.font = [UIFont systemFontOfSize:15];
        field.enabled = YES;
        field.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:field];
        field.textColor = [UIColor blackColor];
        field.borderStyle = UITextBorderStyleNone;
        
        switch (indexPath.row) {
            case 1:{
                field.placeholder=@"￥";
                field.textColor=[tools colorWithHex:0x333333];
                field.font=[UIFont boldSystemFontOfSize:15];
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
                break;
            case 2:{
                field.placeholder=@"￥";
                field.textColor=[tools colorWithHex:0x333333];
                field.font=[UIFont boldSystemFontOfSize:15];
                 cell.accessoryType = UITableViewCellAccessoryNone;
            }
                break;
            case 3:{
                field.placeholder=@"默认次数为1";
                field.textColor=[tools colorWithHex:0x333333];
                field.font=[UIFont systemFontOfSize:15];
                 cell.accessoryType = UITableViewCellAccessoryNone;
            }
                break;
            case 6:{
                field.frame=CGRectMake(cell.contentView.xmg_right-wight(360),hight(28), wight(400), hight(50));
                field.enabled=NO;
                field.placeholder=@"默认早8:00-晚24:00";
                field.textColor=[tools colorWithHex:0x333333];
                field.font=[UIFont systemFontOfSize:15];
            }
                break;
            default:
                break;
        }
        
        return cell;
    }else{
        
        static NSString *identifer=@"Cell2";
         UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        }
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        cell.textLabel.text=@"是否限购";
        cell.accessoryType = UITableViewCellAccessoryNone;
        UISwitch *cellswitch=[[UISwitch alloc]initWithFrame:CGRectMake(SCREENWIDTH-wight(120), hight(20), wight(100), hight(60))];
        cellswitch.onTintColor=[tools colorWithHex:0xFFB81F];
        [cell.contentView addSubview:cellswitch];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return hight(100);
}
#pragma marl -懒加载
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-49) style:UITableViewStylePlain];
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
