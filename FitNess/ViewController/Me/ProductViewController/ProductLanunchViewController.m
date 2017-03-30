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
    NSArray *_Datasouce;
    NSInteger titleNumber;
    NSInteger FutitleNumber;
    UILabel *TitleLabel;
    UILabel *TitleFuLabel;
    TouchUIView *Headview;
}
@property(nonatomic,strong) UIView    *TopView;
@property(nonatomic, strong) UITextView *TitleText;
@property(nonatomic, strong) UITextView *TitleFuText;
@property(nonatomic,strong) UITableView    *tableView;
@property(nonatomic,strong) UIButton    *Button1;
@property(nonatomic,strong) UIButton    *SubmitBtn;
@property (nonatomic, strong) UILabel  *dateButton;//截止时间选择
@property(nonatomic,strong) NSString    *ProductType;//产品类型
@property(nonatomic,strong) NSString    *ProductDetail;//产品详情
@property(nonatomic,strong) NSString    *ServerDescription;//服务描述
@property(nonatomic,strong) NSString    *ServerHour;//服务描述
@property(nonatomic,strong) NSString    *ServerPerson;//服务描述
@property(nonatomic,strong) NSString    *ServerEnsure;//服务保障
@property(nonatomic,strong) NSString    *ReservationTime;//预约时间
@property(nonatomic,strong) NSString    *ApplyPerson;//适用人群
@property(nonatomic,strong) NSString    *AttentionString;// 注意事项

@property (nonatomic, strong) UILabel       *showTipsLabel1;
@property (nonatomic, strong) UILabel       *showTipsLabel2;
@property (nonatomic, strong) UILabel       *showTipsLabel3;
@end

@implementation ProductLanunchViewController
{
    NSInteger numberRow;//行数
    UISwitch * switchOn ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _Datasouce=[NSArray arrayWithObjects:@"产品类型",@"价格",@"市场价",@"服务次数", @"服务描述",@"服务保障",@"可预约时间段",@"适用人群",@"注意事项",@"是否限购",@"",@"",nil];
    numberRow = 10;
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
    _TopView=[MyView uiview:0 bColor:COMMONRBGCOLOR rect:CGRectMake(0, 64, SCREENWIDTH, hight(580)+10)];
    [self.view addSubview:_TopView];
    ChoosePhotoView *choosePhoto=[[ChoosePhotoView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(210))];
    choosePhoto.vc=self;
    [_TopView addSubview:choosePhoto];
    NSArray *titleArray=[NSArray arrayWithObjects:@"输入产品标题",@"输入产品副标题", @"产品详情",nil];
    for (int i=0; i<titleArray.count; i++) {
       Headview=[[TouchUIView alloc]init];
        if (i==0) {
            Headview.frame=CGRectMake(0, choosePhoto.xmg_bottom+10, SCREENWIDTH, hight(100));
        }else if(i==1){
            Headview.frame=CGRectMake(0, choosePhoto.xmg_bottom+hight(100)+10, SCREENWIDTH, hight(150));
        }else{
             Headview.frame=CGRectMake(0, choosePhoto.xmg_bottom+hight(250)+10, SCREENWIDTH, hight(100));
        }
        Headview.backgroundColor=[UIColor whiteColor];
        Headview.dragEnable=YES;
        Headview.tag=i;
        Headview.userInteractionEnabled=YES;
        [_TopView addSubview:Headview];
        if (i==0) {
            _TitleText= [[UITextView alloc]initWithFrame:CGRectMake(wight(30), 10, SCREENWIDTH-100, hight(100))];
            _TitleText.textColor = [tools colorWithHex:0x333333];
            _TitleText.font = [UIFont systemFontOfSize:15];
            _TitleText.delegate = self;
            _TitleText.tag=100;
            [Headview addSubview:_TitleText];
            _showTipsLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(wight(40), 10, SCREENWIDTH-100, 30)];
            _showTipsLabel1.textColor = [tools colorWithHex:0x999999];
            _showTipsLabel1.font = [UIFont systemFontOfSize:15];
            _showTipsLabel1.text = titleArray[i];
            [Headview addSubview:_showTipsLabel1];
            NSString *title1=[NSString stringWithFormat:@"%ld/30字",titleNumber];
            TitleLabel=[MyView label:title1 tColor:[tools colorWithHex:0x999999] font:[UIFont systemFontOfSize:14] rect:CGRectMake(SCREENWIDTH-wight(100)-15, hight(37), wight(150), 20)];
            [Headview addSubview:TitleLabel];
        }else if(i==1){
            _TitleFuText= [[UITextView alloc]initWithFrame:CGRectMake(wight(30), 10, SCREENWIDTH-100, hight(150))];
            _TitleFuText.textColor =  [tools colorWithHex:0x333333];
            _TitleFuText.font = [UIFont systemFontOfSize:15];
            _TitleFuText.delegate = self;
            _TitleFuText.tag=200;
            [Headview addSubview:_TitleFuText];
            _showTipsLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(wight(40), 10, SCREENWIDTH-100, 30)];
            _showTipsLabel2.textColor = [tools colorWithHex:0x999999];
            _showTipsLabel2.font = [UIFont systemFontOfSize:15];
            _showTipsLabel2.text = titleArray[i];
            [Headview addSubview:_showTipsLabel2];
            NSString *title2=[NSString stringWithFormat:@"%ld/50字",FutitleNumber];
            TitleFuLabel=[MyView label:title2 tColor:[tools colorWithHex:0x999999] font:[UIFont systemFontOfSize:14] rect:CGRectMake(SCREENWIDTH-wight(100)-15, hight(100), wight(150), 20)];
            [Headview addSubview:TitleFuLabel];
        }else{
            UILabel *ProductDetail=[MyView label:@"产品详情" tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(wight(30), 0, wight(150), hight(100))];
            [Headview addSubview:ProductDetail];
            UILabel *productdetailLabel = [[UILabel alloc]initWithFrame:CGRectMake(ProductDetail.xmg_right+10,0, wight(400), hight(100))];
            productdetailLabel.font = [UIFont systemFontOfSize:15];
            productdetailLabel.textAlignment = NSTextAlignmentLeft;
            productdetailLabel.text=_ProductDetail;
            productdetailLabel.tag=1001;
            [Headview addSubview:productdetailLabel];
            UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH - wight(50), hight(38), wight(18), hight(30))];
            arrow.image = [UIImage imageNamed:@"right"];
            arrow.userInteractionEnabled=YES;
            UITapGestureRecognizer *tap1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ProductDetailClick:)];
            [arrow addGestureRecognizer:tap1];
            [Headview addSubview:arrow];
        }
        [Headview addSubview:[MyView addLineView:CGRectMake(10,Headview.xmg_height-1, SCREENWIDTH-10, 1) color:LINECOLOR]];
          }
    self.tableView.tableHeaderView=_TopView;
}
#pragma mark - <UITextViewDelegate>
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    switch (textView.tag) {
        case 100:{
            if (text.length==0) {
                return YES;
            }
            if ([textView.text length]+range.length>=30) {
                return NO;
            }
        }
            break;
        case 200:{
            if (text.length==0) {
                return YES;
            }
            if ([textView.text length]+range.length>=50) {
                return NO;
            }
        }
            break;
        default:
            break;
    }
    return YES;
}
-(void)textViewDidChange:(UITextView *)textView{
    switch (textView.tag) {
        case 100:{
         
            if ([textView.text isEqualToString:@""]) {
                self.showTipsLabel1.hidden=NO;
            }else{
             
                self.showTipsLabel1.hidden=YES;
            }
            TitleLabel.text=[NSString stringWithFormat:@"%lu/30字",[textView.text length]];
        }
            break;
           
        case 200:{
            if ([textView.text isEqualToString:@""]) {
                self.showTipsLabel2.hidden=NO;
            }else{
                self.showTipsLabel2.hidden=YES;
            }
            TitleFuLabel.text=[NSString stringWithFormat:@"%lu/50字",[textView.text length]];
        }
            break;
        case 300:{
            if ([textView.text isEqualToString:@""]) {
                self.showTipsLabel3.hidden=NO;
            }else{
                self.showTipsLabel3.hidden=YES;
            }
        }
            break;
        default:
            break;
    }
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
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return numberRow;
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        static NSString *identifer=@"Cell";
         UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifer];
        }
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        cell.textLabel.text=[_Datasouce objectAtIndex:indexPath.row];
        cell.textLabel.textColor=[tools colorWithHex:0x333333];
        cell.textLabel.font=[UIFont systemFontOfSize:15];
        UIView *lineView=[MyView addLineView:CGRectMake(15, cell.contentView.xmg_height-1, SCREENWIDTH-30, 1) color:LINECOLOR];
         lineView.hidden=NO;
        [cell.contentView addSubview:lineView];
        UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH - wight(50), hight(38), wight(18), hight(30))];
       arrow.hidden=NO;
       arrow.image = [UIImage imageNamed:@"right"];
       [cell.contentView addSubview:arrow];
        UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(cell.contentView.xmg_right-wight(320),hight(30), wight(400), hight(50))];
        field.delegate=self;
        field.font = [UIFont systemFontOfSize:15];
       field.textColor=[tools colorWithHex:0x333333];
        field.enabled = YES;
        field.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:field];
        switch (indexPath.row) {
            case 0:{
                field.enabled=NO;
                field.frame=CGRectMake(cell.contentView.xmg_right-wight(350), 0, wight(400), hight(100));
                field.text=_ProductType;
            }
                break;
            case 1:{
                field.placeholder=@"￥";
                field.font=[UIFont boldSystemFontOfSize:15];
                field.tag=10;
                arrow.hidden=YES;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
                break;
            case 2:{
                field.placeholder=@"￥";
                field.textColor=[tools colorWithHex:0x333333];
                field.font=[UIFont boldSystemFontOfSize:15];
                field.tag=20;
                arrow.hidden=YES;
            }
                break;
            case 3:{
                field.placeholder=@"默认次数为1";
                arrow.hidden=YES;
            }
                break;
            case 4:{
                field.enabled=NO;
                if (_ServerPerson || _ServerDescription || _ServerHour) {
                   UIView *serverView=[MyView uiview:0 bColor:[UIColor clearColor] rect:CGRectMake(cell.contentView.xmg_right-wight(490), 0, wight(500), hight(100))];
                   [cell.contentView addSubview:serverView];
                    CGFloat space=5;
                    //耗时
                    UIButton *button1=[[UIButton alloc]initWithFrame:CGRectMake(0, hight(30), wight(180), hight(40))];
                    [button1 setTitleColor:[tools colorWithHex:0x999999] forState:UIControlStateNormal];
                    button1.titleLabel.font=[UIFont systemFontOfSize:10];
                    if (_ServerHour) {
                        [button1 setImage:[UIImage imageNamed:@"time4"] forState:UIControlStateNormal];
                        [button1 setTitle:[NSString stringWithFormat:@"耗时%@",_ServerHour] forState:UIControlStateNormal];
                    }
                    [button1 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:space];
                   
                    //自定义
                    UIButton *button2=[[UIButton alloc]initWithFrame:CGRectMake(button1.xmg_right+5, hight(26), wight(100), hight(50))];
                    [button2 setTitleColor:[tools colorWithHex:0x999999] forState:UIControlStateNormal];
                    button2.titleLabel.font=[UIFont systemFontOfSize:10];
                    if ([_ServerPerson isEqualToString:@"女士"]) {
                        [button2 setImage:[UIImage imageNamed:@"girl"] forState:UIControlStateNormal];
                        [button2 setTitle:[NSString stringWithFormat:@"%@",_ServerPerson] forState:UIControlStateNormal];
                    }else if ([_ServerPerson isEqualToString:@"男士"]){
                        [button2 setImage:[UIImage imageNamed:@"boy"] forState:UIControlStateNormal];
                        [button2 setTitle:[NSString stringWithFormat:@"%@",_ServerPerson] forState:UIControlStateNormal];
                    }
                    [button2 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:space];
                    
                    //自定义
                    UIButton *button3=[[UIButton alloc]init];
                    if ([_ServerPerson isEqualToString:@"不限"]) {
                        button3.frame=CGRectMake(button1.xmg_right+5, hight(30), wight(220), hight(40));
                    }else{
                        button3.frame=CGRectMake(button2.xmg_right+5, hight(30), wight(220), hight(40));
                    }
                    [button3 setTitleColor:[tools colorWithHex:0x999999] forState:UIControlStateNormal];
                    button3.titleLabel.font=[UIFont systemFontOfSize:10];
                    
                    if (_ServerDescription){
                        [button3 setImage:[UIImage imageNamed:@"general4"] forState:UIControlStateNormal];
                        [button3 setTitle:[NSString stringWithFormat:@"%@",_ServerDescription] forState:UIControlStateNormal];
                        
                    }
                    [button3 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:space];
                    [serverView addSubview:button1];
                    [serverView addSubview:button2];
                    [serverView addSubview:button3];
            }

            }
                break;
            case 5:{
                field.enabled=NO;
            }
                break;
            case 6:{
                field.frame=CGRectMake(cell.contentView.xmg_right-wight(360),hight(28), wight(400), hight(50));
                field.enabled=NO;
                field.placeholder=@"默认早8:00-晚22:00";
                field.textColor=[tools colorWithHex:0x333333];
                field.font=[UIFont systemFontOfSize:15];
            }
                break;
            case 7:{
                field.enabled=NO;
                field.frame=CGRectMake(cell.contentView.xmg_right-wight(350), 0, wight(400), hight(100));
                field.text=_ApplyPerson;
            }
                break;
            case 8:{
                field.enabled=NO;
                field.frame=CGRectMake(cell.contentView.xmg_right-wight(350), 0, wight(400), hight(100));
                field.text=_AttentionString;
            }
                break;
            case 9:{
                if (!switchOn) {
                    switchOn =  [[UISwitch alloc]initWithFrame:CGRectMake(SCREENWIDTH-wight(120), hight(20), wight(100), hight(60))];
                    switchOn.onTintColor=[tools colorWithHex:0xFFB81F];
                    [switchOn setOn:NO];
                    [switchOn addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
                    [cell.contentView addSubview:switchOn];
                }
                cell.accessoryType = UITableViewCellAccessoryNone;
                [cell.contentView addSubview:switchOn];
                lineView.hidden=YES;
                arrow.hidden=YES;
                field.enabled=NO;
            }
                break;
            case 10:{
                UIView *layerView1=[MyView uiview:10 bColor:[UIColor whiteColor] rect:CGRectMake(15, 0, wight(690), hight(80))];
                layerView1.layer.borderColor=[LINECOLOR CGColor];
                layerView1.layer.borderWidth=1;
                UILabel  *xiangouNumber=[MyView label:@"限购数量" tColor:     [tools colorWithHex:0x666666] font: [UIFont systemFontOfSize:15] rect: CGRectMake(15, hight(25), wight(150), hight(34))];
                UITextView *ChoseNumberText=[MyView textView:@"" hintColor:   [UIColor clearColor] bColor:   [UIColor clearColor] tColor:[tools colorWithHex:0x999999]  corner:0 rect:CGRectMake(xiangouNumber.xmg_right, hight(25), wight(180), hight(34)) ];
                ChoseNumberText.delegate = self;
                ChoseNumberText.tag=300;
                ChoseNumberText.font=[UIFont systemFontOfSize:15];
                ChoseNumberText.textAlignment=NSTextAlignmentLeft;
                _showTipsLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(xiangouNumber.xmg_right+20, hight(25), wight(180), hight(34))];
                _showTipsLabel3.textColor = [tools colorWithHex:0x999999];
                _showTipsLabel3.font = [UIFont systemFontOfSize:15];
                _showTipsLabel3.text =@"默认为10份";
               
                [layerView1 addSubview:xiangouNumber];
                [layerView1 addSubview:ChoseNumberText];
                [cell.contentView addSubview:layerView1];
                [cell.contentView addSubview:_showTipsLabel3];
                lineView.hidden=YES;
                arrow.hidden=YES;
                field.enabled=NO;
            }
                break;
            case 11:{
                UIView *layerView2=[MyView uiview:10 bColor:[UIColor whiteColor] rect:CGRectMake(15, 0, wight(690), hight(80))];
                layerView2.layer.borderColor=[LINECOLOR CGColor];
                layerView2.layer.borderWidth=1;
                UILabel  *xiangouTime=[MyView label:@"限购时间" tColor:     [tools colorWithHex:0x666666] font: [UIFont systemFontOfSize:15] rect: CGRectMake(15, hight(25), wight(150), hight(34))];
                UILabel *ChoseTimeLabel=[MyView label:@"请选择限购截止时间" tColor:[tools colorWithHex:0x999999] font: [UIFont systemFontOfSize:15] rect:CGRectMake(xiangouTime.xmg_right, hight(25), wight(400), hight(34))];
                self.dateButton=ChoseTimeLabel;
                ChoseTimeLabel.textAlignment=NSTextAlignmentLeft;
                UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPickViewerAction)];
                [ChoseTimeLabel addGestureRecognizer:labelTapGestureRecognizer];
                ChoseTimeLabel.userInteractionEnabled = YES; // 可以理解为设置label可被点击
                [layerView2 addSubview:xiangouTime];
                [layerView2 addSubview:ChoseTimeLabel];
                [cell.contentView addSubview:layerView2];
                lineView.hidden=YES;
                arrow.hidden=YES;
                field.enabled=NO;
            }
                break;
            default:
                break;
        }
        return cell;

}
- (void)showPickViewerAction{
    ZHDatePickerView *pickerView = [[ZHDatePickerView alloc] initDatePickerWithDefaultDate:nil andDatePickerMode:UIDatePickerModeDate];
    pickerView.delegate = self;
    [pickerView show];

}
- (void)pickerView:(ZHDatePickerView *)pickerView didSelectDateString:(NSString *)dateString
{
    NSString *dateStr=[NSString stringWithFormat:@"%@ 24:00前截止",dateString];
    self.dateButton.text=dateStr;
}

-(void)switchAction:(UISwitch *)swith
{
    [UIView animateWithDuration:0.3 animations:^{
        if([swith isOn])
        {
            numberRow = 12;
        }else{
            numberRow = 10;
        }
       
    } completion:^(BOOL finished) {
        [self.tableView setContentOffset:CGPointMake(0, CGFLOAT_MAX)];
        [self.tableView reloadData];
    }];
    

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            ProductTypeViewController *type=[[ProductTypeViewController alloc]init];
            type.delegate=self;
            [self.navigationController pushViewController:type animated:YES];
        }
            break;
        case 4:{
            ServerDescribeViewController *ServerDescribe=[[ServerDescribeViewController alloc]init];
            ServerDescribe.delegate=self;
            [self.navigationController pushViewController:ServerDescribe animated:YES];
        }
            break;
        case 5:{
            ProtectionViewController *Protection=[[ProtectionViewController alloc]init];
            [self.navigationController pushViewController:Protection animated:YES];
        }
            break;
        case 6:{
            ReservationViewController *Reservation=[[ReservationViewController alloc]init];
            [self.navigationController pushViewController:Reservation animated:YES];
        }
            break;
        case 7:{
            ApplyPersonViewController *ApplyPerson=[[ApplyPersonViewController alloc]init];
            ApplyPerson.delegate=self;
            [self.navigationController pushViewController:ApplyPerson animated:YES];
        }
            break;
        case 8:{
            AttentionStringViewController *Attention=[[AttentionStringViewController alloc]init];
            Attention.delegate=self;
            [self.navigationController pushViewController:Attention animated:YES];
        }
            break;
        default:
            break;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return hight(100);
  
}
//产品详情
-(void)ProductDetailClick:(UITapGestureRecognizer *)tap{
    [self.view endEditing:YES];
    ProductDetailViewController *detail=[[ProductDetailViewController alloc]init];
    detail.delegate=self;
    [self.navigationController pushViewController:detail animated:YES];
}
 #pragma mark - <UITextFieldDelegate>
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag==10 || textField.tag==20) {
        textField.text=[NSString stringWithFormat:@"￥%@",textField.text];
    }
}

#pragma mark -selectTypeWithName
- (void)selectTypeWithName:(NSString *)name{
    _ProductType=name;
    [self.tableView reloadData];
}
#pragma mark -InputProductDetailDelegate
- (void)InputProductDetailWithName:(NSString *)name{
    UILabel *nameLabel = (UILabel *)[Headview viewWithTag:1001];
    nameLabel.text = name;
    _ProductDetail=name;
}
#pragma mark -ServerDescribeDelegate
-(void)ServerDescribeWithName:(NSString *)name hour:(NSString *)hour person:(NSString *)person{
    _ServerDescription=name;
    _ServerHour=hour;
    _ServerPerson=person;
    XQQLog(@"%@   %@   %@",_ServerDescription,_ServerHour,_ServerPerson);
    [self.tableView reloadData];
}
#pragma mark -ApplyPersonDelegate
-(void)ApplyPersonWithName:(NSString *)name{
    _ApplyPerson=name;
    [self.tableView reloadData];
}
#pragma mark -AttentionStringDelegate
- (void)AttentionStringWithName:(NSString *)name{
    _AttentionString=name;
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
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.separatorInset=UIEdgeInsetsMake(hight(98), 15, 1, 15);
        _tableView.backgroundColor=COMMONRBGCOLOR;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}
@end
