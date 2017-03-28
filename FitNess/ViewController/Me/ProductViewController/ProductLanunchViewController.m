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

@property(nonatomic, strong) UITextField *TitleFiled;
@property(nonatomic, strong) UITextField *TitleFuFiled;
@property(nonatomic,strong) UITableView    *tableView;
@property(nonatomic,strong) UIButton    *Button1;
@property(nonatomic,strong) UIButton    *SubmitBtn;
@property(nonatomic,strong) NSString    *ProductString;
@end

@implementation ProductLanunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNav];
    [self.view addSubview:self.tableView];
    [self CreateTopView];
    [self creataBottomView];

}
- (void)setNav{
    self.navigationItem.title=@"发布产品";
    [self backVC];
    [self CreateTopView];
}
- (void)CreateTopView{
    _TopView=[MyView uiview:0 bColor:COMMONRBGCOLOR rect:CGRectMake(0, 64, SCREENWIDTH, hight(560)+10)];
    [self.view addSubview:_TopView];
    ChoosePhotoView *choosePhoto=[[ChoosePhotoView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(210))];
    choosePhoto.vc=self;
    [_TopView addSubview:choosePhoto];
    NSArray *titleArray=[NSArray arrayWithObjects:@"输入产品标题",@"输入产品副标题", @"产品详情",nil];
    for (int i=0; i<titleArray.count; i++) {
        TouchUIView *view=[[TouchUIView alloc]init];
        if (i==0) {
               view.frame=CGRectMake(0, choosePhoto.xmg_bottom+10, SCREENWIDTH, hight(100));
        }else if(i==1){
            view.frame=CGRectMake(0, choosePhoto.xmg_bottom+hight(100), SCREENWIDTH, hight(150));
        }else{
             view.frame=CGRectMake(0, choosePhoto.xmg_bottom+hight(250), SCREENWIDTH, hight(100));
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
        }else if(i==1){
            _TitleFuFiled=[MyView Textfile:titleArray[i] corner:0 rect:CGRectMake(wight(30), 0, SCREENWIDTH-100, hight(150))];
            [view addSubview:_TitleFuFiled];
            UILabel *TitleFuLabel=[MyView label:@"0/50字" tColor:[tools colorWithHex:0x999999] font:[UIFont systemFontOfSize:14] rect:CGRectMake(SCREENWIDTH-wight(100)-15, hight(100), wight(100), 20)];
            [view addSubview:TitleFuLabel];
        }else{
            _TitleFuFiled=[MyView Textfile:titleArray[i] corner:0 rect:CGRectMake(wight(30), 0, SCREENWIDTH-100, hight(100))];
            [view addSubview:_TitleFuFiled];
            UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH - wight(50), hight(38), wight(18), hight(30))];
            arrow.image = [UIImage imageNamed:@"right"];
            [view addSubview:arrow];
        }
        [view addSubview:[MyView addLineView:CGRectMake(10,view.xmg_height-1, SCREENWIDTH-10, 1) color:LINECOLOR]];
          }
    self.tableView.tableHeaderView=_TopView;
}
#pragma mark-Bottom
- (void)creataBottomView{
    UIView *bottomView=[MyView uiview:0 bColor:[tools colorWithHex:0xFFB81F] rect:CGRectMake(0, SCREENHEIGHT-hight(98), SCREENWIDTH, hight(98))];
    [self.view addSubview:bottomView];
    _SubmitBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, bottomView.xmg_width, hight(98))];
    [_SubmitBtn setTitle:@"提交" forState:UIControlStateNormal];
    _SubmitBtn.titleLabel.font=[UIFont systemFontOfSize:19];
    [_SubmitBtn setTitleColor:[tools colorWithHex:0xFFFFFF] forState:UIControlStateNormal];
    [bottomView addSubview:self.SubmitBtn];

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
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifer];
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
            case 0:{
                field.enabled=NO;
                cell.detailTextLabel.text=_ProductString;
                cell.detailTextLabel.textColor=[tools colorWithHex:0x333333];
                cell.detailTextLabel.font=[UIFont boldSystemFontOfSize:15];
            }
                break;
            case 1:{
                field.placeholder=@"￥";
                field.textColor=[tools colorWithHex:0x333333];
                field.font=[UIFont boldSystemFontOfSize:15];
                cell.accessoryType = UITableViewCellAccessoryNone;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
        [cellswitch setOn:NO];
        [cellswitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
        [cell.contentView addSubview:cellswitch];
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            ProductTypeViewController *type=[[ProductTypeViewController alloc]init];
            type.delegate=self;
            [self.navigationController pushViewController:type animated:YES];
        }
            break;
        default:
            break;
    }
    
}
-(void)switchAction:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        XQQLog(@"是");
    }else {
        XQQLog(@"否");
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return hight(100);
}
#pragma mark -selectTypeWithName
- (void)selectTypeWithName:(NSString *)name{
    _ProductString=name;
    [self.tableView reloadData];
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
