//
//  ServerDescribeViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/28.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ServerDescribeViewController.h"
#import "HourNumerButton.h"
#import "ServerDescrptionViewCell.h"
#import "ServerDescribeModel.h"

@interface ServerDescribeViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>{
    UIView *Addview;
}
@property (nonatomic, strong) UIView        *customView;
@property (nonatomic, strong) UIView        *customView1;
@property (nonatomic, strong) UIView        *customView2;
@property (nonatomic, strong) UITextField    *inputView;
@property(nonatomic,strong)HourNumerButton *numberButton;//添加数量
@property(nonatomic,strong)UIButton *Addbutton;
@property(nonatomic,strong)NSMutableArray *AddArray;
@property(nonatomic,strong) UITableView    *tableView;

@end

@implementation ServerDescribeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _AddArray=[NSMutableArray array];
    ServerDescribeModel *requestModel = [[ServerDescribeModel alloc]init];
    [_nameArray addObject:requestModel];
   
    
    [self setNav];
    [self CreateInputView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldEditChanged:)  name:@"UITextFieldTextDidChangeNotification" object:_inputView];
    [self.view addSubview:self.tableView];
    [self addView];
   XQQLog(@"%ld",_btnTag);
}

-(void)setNav{
    self.view.backgroundColor=COMMONRBGCOLOR;
    self.navigationItem.title=@"服务描述";
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 20.0 / 2.0, 35.0 / 2.0);
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(action_onBackButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
    UIButton *CompleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CompleteButton.frame = CGRectMake(0, 0, 50, 35);
    [CompleteButton setTitle:@"完成" forState: UIControlStateNormal];
    [CompleteButton setTitleColor:[tools colorWithHex:0x333333] forState:UIControlStateNormal];
    [CompleteButton addTarget:self action:@selector(CompleteButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *CompleteItem = [[UIBarButtonItem alloc]initWithCustomView:CompleteButton];
    self.navigationItem.rightBarButtonItem = CompleteItem;
}
- (void)CreateInputView{
    UIView *topView=[MyView uiview:0 bColor:COMMONRBGCOLOR rect:CGRectMake(0, 0, SCREENWIDTH, hight(340))];
    _customView1=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, _customView.xmg_bottom+10, SCREENWIDTH, hight(100))];
    [topView addSubview:_customView1];
    UIImageView *hourImage=[[UIImageView alloc]initWithFrame:CGRectMake(15, hight(27), wight(50), hight(50))];
    hourImage.image=[UIImage imageNamed:@"time4"];
    [self.customView1 addSubview:hourImage];
    UILabel *hourLabel=[MyView label:@"耗时" tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(hourImage.xmg_right+5, hight(34), wight(100), hight(34))];
    [self.customView1 addSubview:hourLabel];
    _numberButton=[HourNumerButton numberButtonWithFrame:CGRectMake(SCREENWIDTH-wight(260)-15, hight(34), wight(260), hight(66))];
    _numberButton.shakeAnimation=YES;
    _numberButton.borderColor=[UIColor whiteColor];
    _numberButton.increaseImage=[UIImage imageNamed:@"plus4"];
    _numberButton.decreaseImage=[UIImage imageNamed:@"less4"];
    if (_hour) {
        _numberButton.currentNumber=_hour;
    }
   [self.customView1 addSubview:self.numberButton];
    _numberButton.numberBlock=^(NSString *num){
        _hour=num;
    };
    [self.customView1 addSubview:[MyView addLineView:CGRectMake(15, _customView1.xmg_height-1, SCREENWIDTH-30, 1) color:LINECOLOR]];
    
    _customView2=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, _customView1.xmg_bottom, SCREENWIDTH, hight(200))];
    [topView addSubview:self.customView2];
    UIImageView *personImage=[[UIImageView alloc]initWithFrame:CGRectMake(15, hight(27), wight(50), hight(50))];
    personImage.image=[UIImage imageNamed:@"people"];
    [self.customView2 addSubview:personImage];
    UILabel *personLabel=[MyView label:@"预约人" tColor:[tools colorWithHex:0x333333] font:[UIFont systemFontOfSize:15] rect:CGRectMake(personImage.xmg_right+5, hight(34), wight(100), hight(34))];
    [self.customView2 addSubview:personLabel];
    NSArray *title=[NSArray arrayWithObjects:@"女士",@"男士",@"不限", nil];
    for (int i=0; i<title.count; i++) {
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(personImage.xmg_right+wight(240)*i, personLabel.xmg_bottom+hight(50), wight(150), hight(60))];
        button.tag=10+i;
        [button setTitle:title[i] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"cancel3"] forState:UIControlStateNormal];
        [button setTitleColor:[tools colorWithHex:0x666666] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:15];
        [self.customView2 addSubview:button];
        CGFloat space=10;
        [button layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:space];
        [button addTarget:self action:@selector(choosePerson:) forControlEvents:UIControlEventTouchUpInside];
    }
    self.tableView.tableHeaderView=topView;
}
- (void)addView{
    Addview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(100))];
    Addview.backgroundColor=[UIColor  whiteColor];
    self.tableView.tableFooterView=Addview;
    UIButton *addButton=[[UIButton alloc]initWithFrame:CGRectMake(0,0,Addview.xmg_width,hight(100))];
    [addButton setTitle:@"继续添加服务描述(最多4条)" forState:UIControlStateNormal];
    [addButton setTitleColor:MAINCOLOR forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addButton:) forControlEvents:UIControlEventTouchUpInside];
    addButton.titleLabel.font=[UIFont systemFontOfSize:15];
    [Addview addSubview:addButton];
}
- (void)addButton:(UIButton *)sender{
    // 插入单行(插入了一行cell)
    ServerDescribeModel *model=[[ServerDescribeModel alloc]init];
    if (![model.name isEqualToString:@""]) {
           [_nameArray addObject:model];
    }
    if(_nameArray.count>3){
        [Addview removeFromSuperview];
    }
    [self.tableView reloadData];
  
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_nameArray.count==0) {
        return 1;
    }else{
        return _nameArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ServerDescrptionViewCell *ServerCell=[ServerDescrptionViewCell ServerDescrptionViewCell:tableView];
    ServerCell.selectionStyle =UITableViewCellSelectionStyleNone;
    ServerCell.model=[_nameArray objectAtIndex:indexPath.row];
    [ServerCell.deleatebutton addTarget:self action:@selector(DeleteClick:) forControlEvents:UIControlEventTouchUpInside];
    ServerCell.deleatebutton.tag=indexPath.row;
    return ServerCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return hight(120);
}
- (void)DeleteClick:(UIButton *)sender{
    if (self.nameArray.count>1) {
        [self.nameArray removeObjectAtIndex:sender.tag];
        [self.tableView reloadData];
    }
}
-(void)action_onBackButton:(UIButton *)sender{
      [self.navigationController popViewControllerAnimated:YES];
}
-(void)CompleteButton:(UIButton *)sender{
    NSMutableArray *descArray=[NSMutableArray array];
    for (int i=0; i<_nameArray.count; i++) {
        ServerDescribeModel *model=[_nameArray objectAtIndex:i];
        NSMutableDictionary *ProductDic=[[NSMutableDictionary alloc]init];
        [ProductDic setObject:model.name forKey:@"name"];
        [ProductDic setObject:@"自定义" forKey:@"value"];
        [descArray addObject:ProductDic];
    }
    NSMutableDictionary *ServerHour=[NSMutableDictionary dictionary];
    [ServerHour setObject:@"耗时" forKey:@"name"];
    [ServerHour setObject:_hour forKey:@"value"];
     [descArray addObject:ServerHour];
    
    NSMutableDictionary *ServerPerson=[NSMutableDictionary dictionary];
    [ServerPerson setObject:_person forKey:@"name"];
    [ServerPerson setObject:@"预约" forKey:@"value"];
   [descArray addObject:ServerPerson];
    
    [self.delegate ServerDescribeWithName:descArray hour:_hour person:_person nameArray:_nameArray btnTag:_btnTag];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)choosePerson:(UIButton *)sender{
    for (int i=10; i<13; i++) {
        UIButton *button=(UIButton *)[self.view viewWithTag:i];
        
        if (button==sender) {
            button.selected=YES;
            [button setImage:[UIImage imageNamed:@"select3"] forState:UIControlStateNormal];
      
            if (button.tag==10 ) {
                _person=@"女士";
                _btnTag=10;
            } else if (button.tag==11){
                _person=@"男士";
                _btnTag=11;
            } else{
                _person=@"不限";
                _btnTag=12;
            }
        }else
        {
             button.selected  = NO;
             [button setImage:[UIImage imageNamed:@"cancel3"] forState:UIControlStateNormal];
        }
    }
}
-(void)textFieldEditChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
    NSString *toBeString = textField.text;
    
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position)
    {
        if (toBeString.length > 8)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:8];
            if (rangeIndex.length == 1)
            {
                textField.text = [toBeString substringToIndex:8];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, 8)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
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
        _tableView.separatorInset=UIEdgeInsetsMake(hight(98), 15, 1, 15);
        _tableView.backgroundColor=COMMONRBGCOLOR;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}
@end
