//
//  ProductLanunchViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/25.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ProductLanunchViewController.h"
#import "SBJson.h"


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
@property(nonatomic, strong) UITextView *ChoseNumberText;
@property(nonatomic,strong) UITableView    *tableView;
@property(nonatomic,strong) UIButton    *Button1;
@property(nonatomic,strong) UIButton    *SubmitBtn;
@property (nonatomic, strong) UILabel  *dateButton;//截止时间选择
@property(nonatomic,strong) NSString    *ProductType;//产品类型
@property(nonatomic,strong) NSString    *ProductTypeID;//产品类型ID
@property(nonatomic,strong) NSString    *ProductDetail;//产品详情
@property(nonatomic,strong) NSString    *ProductPrice;//产品价格
@property(nonatomic,strong) NSString    *ProductshichangPrice;//产品市场价
@property(nonatomic,strong) NSString    *serverNumber;//服务次数
@property(nonatomic,strong) NSMutableArray    *ServerDescription;//服务描述
@property(nonatomic,strong) NSString    *ServerHour;//耗时时间
@property(nonatomic,strong) NSString    *ServerPerson;//服务描述
@property(nonatomic,assign) NSInteger   btnTag;//服务描述
@property(nonatomic,strong) NSString    *ReservationTime;//预约时间
@property(nonatomic,strong) NSString    *ApplyPerson;//适用人群
@property(nonatomic,strong) NSString    *AttentionString;// 注意事项
@property(nonatomic,strong) NSArray     *ImageArrayID;//适用人群
@property(nonatomic,strong) NSString    *DescriptionString;// 注意事项
@property(nonatomic,strong) NSString    *ReservationString;//  预约时间
@property(nonatomic,strong) NSString    *ServerTime;//  预约时间
@property(nonatomic,strong) NSString    *DateString;//  预约时间
@property(nonatomic,strong) NSMutableArray    *ReservationArray;//  预约时间
@property(nonatomic,strong) NSMutableString      *ImageString;

@property (nonatomic, strong) UILabel       *showTipsLabel1;
@property (nonatomic, strong) UILabel       *showTipsLabel2;
@property (nonatomic, strong) UILabel       *showTipsLabel3;

@property (nonatomic, strong)UILabel *productdetailLabel;
@property (nonatomic, strong)UILabel *productTypeLabel;
@property (nonatomic, strong)UITextField *Pricefield;
@property (nonatomic, strong)UITextField *Pricefield2;
@property (nonatomic, strong)UITextField *Serverfield;
@end

@implementation ProductLanunchViewController
{
    NSInteger numberRow;//行数
    UISwitch * switchOn ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _Datasouce=[NSArray arrayWithObjects:@"服务描述",@"服务保障",@"可预约时间段",@"适用人群",@"注意事项",@"是否限购",@"",@"",nil];
    _ReservationArray=[NSMutableArray array];
    _ImageString=[[NSMutableString alloc]init];
    _ServerDescription=[NSMutableArray array];
    numberRow = 6;
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
    _TopView=[MyView uiview:0 bColor:COMMONRBGCOLOR rect:CGRectMake(0, 64, SCREENWIDTH, hight(980)+10)];
    [self.view addSubview:_TopView];
    ChoosePhotoView *choosePhoto=[[ChoosePhotoView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(230))];
    choosePhoto.delegate=self;
    choosePhoto.vc=self;
    [_TopView addSubview:choosePhoto];
    NSArray *titleArray=[NSArray arrayWithObjects:@"输入产品标题",@"输入产品副标题", @"产品详情",@"产品类型",@"价格",@"市场价",@"默认次数",nil];
    for (int i=0; i<titleArray.count; i++) {
       Headview=[[TouchUIView alloc]init];
        if (i==0) {
            Headview.frame=CGRectMake(0, choosePhoto.xmg_bottom, SCREENWIDTH, hight(100));
        }else if(i==1){
            Headview.frame=CGRectMake(0, choosePhoto.xmg_bottom+hight(100), SCREENWIDTH, hight(150));
        }else if(i==2){
             Headview.frame=CGRectMake(0, choosePhoto.xmg_bottom+hight(250), SCREENWIDTH, hight(100));
        }else if (i==3){
            Headview.frame=CGRectMake(0, choosePhoto.xmg_bottom+hight(370), SCREENWIDTH, hight(100));
        }else if (i==4){
               Headview.frame=CGRectMake(0, choosePhoto.xmg_bottom+hight(470), SCREENWIDTH, hight(100));
        }else if (i==5){
             Headview.frame=CGRectMake(0, choosePhoto.xmg_bottom+hight(570), SCREENWIDTH, hight(100));
        }else{
             Headview.frame=CGRectMake(0, choosePhoto.xmg_bottom+hight(670), SCREENWIDTH, hight(100));
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
        }else if(i==2){
            UILabel *ProductDetail=[MyView label:@"产品详情" tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(wight(30), 0, wight(150), hight(100))];
            [Headview addSubview:ProductDetail];
            _productdetailLabel = [[UILabel alloc]initWithFrame:CGRectMake(ProductDetail.xmg_right+10,0, wight(480), hight(100))];
            _productdetailLabel.font = [UIFont systemFontOfSize:15];
            _productdetailLabel.textAlignment = NSTextAlignmentRight;
            [Headview addSubview:_productdetailLabel];
            UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH - wight(50), hight(38), wight(18), hight(30))];
            arrow.image = [UIImage imageNamed:@"right"];
            arrow.userInteractionEnabled=YES;
            UITapGestureRecognizer *tap1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ProductDetailClick:)];
            [arrow addGestureRecognizer:tap1];
            [Headview addSubview:arrow];
            
        }else if (i==3){
            UILabel *ProductType=[MyView label:@"产品类型" tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(wight(30), 0, wight(150), hight(100))];
            [Headview addSubview:ProductType];
            _productTypeLabel = [[UILabel alloc]initWithFrame:CGRectMake(ProductType.xmg_right+10,0, wight(480), hight(100))];
            _productTypeLabel.font = [UIFont systemFontOfSize:15];
            _productTypeLabel.textAlignment = NSTextAlignmentRight;
            [Headview addSubview:_productTypeLabel];
            UIImageView *arrow1 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH - wight(50), hight(38), wight(18), hight(30))];
            arrow1.image = [UIImage imageNamed:@"right"];
            arrow1.userInteractionEnabled=YES;
            UITapGestureRecognizer *tap2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ProductTypeClick:)];
            [arrow1 addGestureRecognizer:tap2];
            [Headview addSubview:arrow1];
        }else if(i==4){
            UILabel *PriceLabel1=[MyView label:@"价格" tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(wight(30), 0, wight(150), hight(100))];
            [Headview addSubview:PriceLabel1];
            _Pricefield = [[UITextField alloc]initWithFrame:CGRectMake(SCREENWIDTH-wight(200)-15,hight(30), wight(200), hight(50))];
            _Pricefield.delegate=self;
            _Pricefield.placeholder=@"￥";
            _Pricefield.font = [UIFont systemFontOfSize:15];
            _Pricefield.textColor=[tools colorWithHex:0x333333];
            _Pricefield.textAlignment = NSTextAlignmentRight;
            [Headview addSubview:_Pricefield];
            
        }else if(i==5){
            UILabel *PriceLabel2=[MyView label:@"市场价" tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(wight(30), 0, wight(150), hight(100))];
            [Headview addSubview:PriceLabel2];
            _Pricefield2 = [[UITextField alloc]initWithFrame:CGRectMake(SCREENWIDTH-wight(200)-15,hight(30), wight(200), hight(50))];
            _Pricefield2.delegate=self;
            _Pricefield2.placeholder=@"￥";
            _Pricefield2.font = [UIFont systemFontOfSize:15];
            _Pricefield2.textColor=[tools colorWithHex:0x333333];
            _Pricefield2.textAlignment = NSTextAlignmentRight;
            [Headview addSubview:_Pricefield2];
        }else{
             UILabel *ServerLabel=[MyView label:@"服务次数" tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(wight(30), 0, wight(150), hight(100))];
             [Headview addSubview:ServerLabel];
            _Serverfield = [[UITextField alloc]initWithFrame:CGRectMake( SCREENWIDTH-wight(200)-15,hight(30), wight(200), hight(50))];
            _Serverfield.delegate=self;
            _Serverfield.placeholder=@"默认次数为1次";
            _Serverfield.font = [UIFont systemFontOfSize:15];
            _Serverfield.textColor=[tools colorWithHex:0x333333];
            _Serverfield.textAlignment = NSTextAlignmentRight;
            [Headview addSubview:_Serverfield];
        }
        [Headview addSubview:[MyView addLineView:CGRectMake(10,Headview.xmg_height-1, SCREENWIDTH-10, 1) color:LINECOLOR]];
    }
    self.tableView.tableHeaderView=_TopView;
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
                field.frame=CGRectMake(cell.contentView.xmg_right-wight(360),hight(28), wight(400), hight(50));
                if (_ServerPerson  || _ServerHour || (_ServerDescription != nil && ![_ServerDescription isKindOfClass:[NSNull class]] && _ServerDescription.count != 0)) {
                    field.text=@"已编辑";
                }
                break;
            case 1:{
                field.enabled=NO;
            }
                break;
            case 2:{
                field.frame=CGRectMake(cell.contentView.xmg_right-wight(360),hight(28), wight(400), hight(50));
                field.enabled=NO;
                field.placeholder=@"默认早8:00-晚22:00";
                field.textColor=[tools colorWithHex:0x333333];
                field.font=[UIFont systemFontOfSize:15];
                if (_ReservationArray != nil && ![_ReservationArray isKindOfClass:[NSNull class]] && _ReservationArray.count != 0) {
                    field.text=@"已修改";
                }

            }
                break;
            case 3:{
                field.enabled=NO;
                field.frame=CGRectMake(cell.contentView.xmg_right-wight(350), 0, wight(400), hight(100));
                field.text=_ApplyPerson;
                
            }
                break;
            case 4:{
                field.enabled=NO;
                field.frame=CGRectMake(cell.contentView.xmg_right-wight(350), 0, wight(400), hight(100));
                field.text=_AttentionString;
               
            }
                break;
            case 5:{
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
            case 6:{
                UIView *layerView1=[MyView uiview:10 bColor:[UIColor whiteColor] rect:CGRectMake(15, 0, wight(690), hight(80))];
                layerView1.layer.borderColor=[LINECOLOR CGColor];
                layerView1.layer.borderWidth=1;
                UILabel  *xiangouNumber=[MyView label:@"限购数量" tColor:     [tools colorWithHex:0x666666] font: [UIFont systemFontOfSize:15] rect: CGRectMake(15, hight(25), wight(150), hight(34))];
                _ChoseNumberText=[MyView textView:@"" hintColor:   [UIColor clearColor] bColor:   [UIColor clearColor] tColor:[tools colorWithHex:0x999999]  corner:0 rect:CGRectMake(xiangouNumber.xmg_right, hight(25), wight(180), hight(34)) ];
                _ChoseNumberText.delegate = self;
                _ChoseNumberText.tag=300;
                _ChoseNumberText.font=[UIFont systemFontOfSize:15];
                _ChoseNumberText.textAlignment=NSTextAlignmentLeft;
                _showTipsLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(xiangouNumber.xmg_right+20, hight(25), wight(180), hight(34))];
                _showTipsLabel3.textColor = [tools colorWithHex:0x999999];
                _showTipsLabel3.font = [UIFont systemFontOfSize:15];
                _showTipsLabel3.text =@"默认为10份";
                
                [layerView1 addSubview:xiangouNumber];
                [layerView1 addSubview:_ChoseNumberText];
                [cell.contentView addSubview:layerView1];
                [cell.contentView addSubview:_showTipsLabel3];
                lineView.hidden=YES;
                arrow.hidden=YES;
                field.enabled=NO;
            }
                break;
            case 7:{
                UIView *layerView2=[MyView uiview:10 bColor:[UIColor whiteColor] rect:CGRectMake(15, 0, wight(690), hight(80))];
                layerView2.layer.borderColor=[LINECOLOR CGColor];
                layerView2.layer.borderWidth=1;
                UILabel  *xiangouTime=[MyView label:@"限购时间" tColor:     [tools colorWithHex:0x666666] font: [UIFont systemFontOfSize:15] rect: CGRectMake(15, hight(25), wight(150), hight(34))];
                UILabel *ChoseTimeLabel=[MyView label:@"请选择限购截止时间" tColor:[tools colorWithHex:0x999999] font: [UIFont systemFontOfSize:15] rect:CGRectMake(xiangouTime.xmg_right, hight(25), wight(400), hight(34))];
                self.dateButton=ChoseTimeLabel;
                ChoseTimeLabel.textAlignment=NSTextAlignmentLeft;
                UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPickViewerAction)];
                [ChoseTimeLabel addGestureRecognizer:labelTapGestureRecognizer];
                ChoseTimeLabel.userInteractionEnabled = YES;
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
    }
    return cell;

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            ServerDescribeViewController *ServerDescribe=[[ServerDescribeViewController alloc]init];
            ServerDescribe.delegate=self;
            ServerDescribe.nameArray=_ServerDescription;
            ServerDescribe.hour=_ServerHour;
            ServerDescribe.person=_ServerPerson;
            ServerDescribe.btnTag=_btnTag;
            [self.navigationController pushViewController:ServerDescribe animated:YES];
        }
            break;
        case 1:{
            ProtectionViewController *Protection=[[ProtectionViewController alloc]init];
            [self.navigationController pushViewController:Protection animated:YES];
        }
            break;
        case 2:{
            ReservationViewController *Reservation=[[ReservationViewController alloc]init];
            Reservation.AllTimeArray=_ReservationArray;
            Reservation.delegate=self;
            [self.navigationController pushViewController:Reservation animated:YES];
        }
            break;
        case 3:{
            ApplyPersonViewController *ApplyPerson=[[ApplyPersonViewController alloc]init];
            ApplyPerson.Detail=_ApplyPerson;
            ApplyPerson.delegate=self;
            [self.navigationController pushViewController:ApplyPerson animated:YES];
        }
            break;
        case 4:{
            AttentionStringViewController *Attention=[[AttentionStringViewController alloc]init];
            Attention.Detail=_AttentionString;
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
- (void)pickerView:(ZHDatePickerView *)pickerView didSelectDateString:(NSString *)dateString
{
    NSString *dateStr=[NSString stringWithFormat:@"%@ 24:00前截止",dateString];
    _DateString=dateString;
    self.dateButton.text=dateStr;
}
- (void)showPickViewerAction{
    ZHDatePickerView *pickerView = [[ZHDatePickerView alloc] initDatePickerWithDefaultDate:nil andDatePickerMode:UIDatePickerModeDate];
    pickerView.delegate = self;
    [pickerView show];
    
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
    [_SubmitBtn addTarget:self action:@selector(SubmitClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:self.SubmitBtn];
    
}
-(void)switchAction:(UISwitch *)swith{
    [UIView animateWithDuration:0.3 animations:^{
        if([swith isOn])
        {
            numberRow = 8;
        }else{
            numberRow = 6;
        }
    } completion:^(BOOL finished) {
        [self.tableView setContentOffset:CGPointMake(0, CGFLOAT_MAX)];
        [self.tableView reloadData];
    }];
}

//产品详情
-(void)ProductDetailClick:(UITapGestureRecognizer *)tap1{
    ProductDetailViewController *detail=[[ProductDetailViewController alloc]init];
    detail.Detail=_productdetailLabel.text;
    detail.delegate=self;
    [self.navigationController pushViewController:detail animated:YES];
}
//产品类型
-(void)ProductTypeClick:(UITapGestureRecognizer *)tap2{
    ProductTypeViewController *type=[[ProductTypeViewController alloc]init];
    type.delegate=self;
    [self.navigationController pushViewController:type animated:YES];
}

#pragma mark -choosePhoto
- (void)ChoosePhotoDelegateWithName:(NSArray *)DataArray{
    _ImageArrayID=DataArray;
    for (int i=0; i<_ImageArrayID.count; i++) {
        if (i < _ImageArrayID.count-1) {
            [_ImageString appendFormat:@"%@,",_ImageArrayID[i]];
        }
        else{
            [_ImageString appendFormat:@"%@",_ImageArrayID[i]];
        }
    }
    [self.tableView reloadData];
    
}
#pragma mark -selectTypeWithName
- (void)selectTypeWithName:(NSString *)name typeID:(NSString *)typeId{
    _productTypeLabel.text=name;
    _ProductTypeID=typeId;
    
}
#pragma mark -InputProductDetailDelegate
- (void)InputProductDetailWithName:(NSString *)name{
    _productdetailLabel.text=name;
}
#pragma mark -ServerDescribeDelegate
-(void)ServerDescribeWithName:(NSMutableArray *)serverArray hour:(NSString *)hour person:(NSString *)person nameArray:(NSMutableArray *)nameArray btnTag:(NSInteger)btnTag{
    
    SBJsonWriter *sbjson=[[SBJsonWriter alloc]init];
    NSString *str=[sbjson stringWithObject:serverArray];
    _DescriptionString=str;
    _ServerHour=hour;
    _ServerDescription=nameArray;
    _ServerPerson=person;
    _btnTag=btnTag;
    [self.tableView reloadData];
}
#pragma marl-
- (void)ReservationWithArray:(NSMutableArray *)DateTimeArray serverTime:(NSString *)serverTime{
    SBJsonWriter *sbjson=[[SBJsonWriter alloc]init];
    NSString *str=[sbjson stringWithObject:DateTimeArray];
    _ReservationString=str;
    _ReservationArray=DateTimeArray;
    _ServerTime=serverTime;
    
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

#pragma mark -发布产品
- (void)SubmitClick:(UIButton *)sender{
      MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
     hud.labelText = @"正在发布产品信息...";
    NSInteger productID=[_ProductTypeID integerValue];
     NSInteger limited=[_ChoseNumberText.text integerValue];
    [NetWorkManager IssueProduct:10
                       productID:productID
                    productTitle:_TitleText.text
                  productFuTitle:_TitleFuText.text
                    productPrice:_Pricefield.text
                   shichangPrice:_Pricefield2.text
                    serverNumber:_Serverfield.text
                   shiyongPerson:_ApplyPerson
                     precautions:_AttentionString
                  productContent:_productdetailLabel.text
                     productDesc:_DescriptionString
                         ImageID:_ImageString
                         limited:limited
                      limit_date:_DateString
                    service_time:_ServerTime
                     appointment:_ReservationString
                         success:^(BaseResponse *response) {
                             hud.labelText = @"产品发布成功";
                             [hud hide:YES afterDelay:1.0];
                             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                 [self dismissViewControllerAnimated:YES completion:nil];
                             });
                         } failure:^(NSError *error) {
                             hud.labelText = [NSString stringWithFormat:@"%@",error];
                            [hud hide:YES afterDelay:1.0];
                         }];
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
