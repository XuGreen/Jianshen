//
//  UpdateTimeView.m
//  FitNess
//
//  Created by xuqq on 2017/3/29.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "UpdateTimeView.h"
@interface UpdateTimeView()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong) UIView *bottomView;
@property(nonatomic,strong) NSArray *hourdatas1;
@property(nonatomic,strong) NSArray *mindatas1;
@property(nonatomic,strong) NSArray *hourdatas2;
@property(nonatomic,strong) NSArray *mindatas2;
@property(nonatomic,copy) NSString *seletedhourStr1;
@property(nonatomic,copy) NSString *seletedminStr1;
@property(nonatomic,copy) NSString *seletedhourStr2;
@property(nonatomic,copy) NSString *seletedminStr2;
@property (nonatomic, assign) BOOL isChooseClicked;
@property (nonatomic, assign) BOOL isSelectClicked;
@end
@implementation UpdateTimeView

- (instancetype)initWithFrame:(CGRect)frame hourdatas1:(NSArray *)hourdatas1 mindatas1:(NSArray *)mindatas1 hourdatas2:(NSArray *)hourdatas2 mindatas2:(NSArray *)mindatas2 hourtitle:(NSString *)hourtitle mintitle:(NSString *)mintitle{
    if (self=[super initWithFrame:frame]) {
        _hourdatas1=hourdatas1;
        _mindatas1=mindatas1;
        _hourdatas2=hourdatas2;
        _mindatas2=mindatas2;
        self.backgroundColor=[UIColor colorWithWhite:0.0 alpha:0.6];
        [self initUI:hourtitle minTitle:mintitle];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
}
- (void)initUI:(NSString *)hourTitle minTitle:(NSString *)minTitle{
    UITapGestureRecognizer *tapGestur=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidView:)];
    [self addGestureRecognizer:tapGestur];
    UIView *bottomView=[[UIView alloc]initWithFrame:CGRectMake(0.0, self.bounds.size.height, self.bounds.size.width, hight(540.0))];
    self.bottomView=bottomView;
    bottomView.backgroundColor=[UIColor whiteColor];
    [self addSubview:bottomView];
    UIView *topView=[[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, bottomView.bounds.size.width, hight(100))];
    topView.backgroundColor=MAINCOLOR;
    [bottomView addSubview:topView];
    
    UIView *xiuxiView=[[UIView alloc]initWithFrame:CGRectMake(0.0, 50.0, bottomView.bounds.size.width, hight(100))];
    xiuxiView.backgroundColor=[UIColor whiteColor];
    [bottomView addSubview:xiuxiView];
    [xiuxiView addSubview:[MyView addLineView:CGRectMake(0, xiuxiView.xmg_height-1, SCREENWIDTH, 1) color:LINECOLOR]];
    UIImageView *xiuxiImage=[MyView Image:@"rest" corner:0 rect:CGRectMake(15, 10, wight(60), hight(60))];
    [xiuxiView addSubview:xiuxiImage];
    
    UILabel *xiuxiLabel=[MyView label:@"全天休息" tColor:[tools colorWithHex:0x333333] font: [UIFont systemFontOfSize:15] rect:CGRectMake(xiuxiImage.xmg_right+10, 15, wight(200), hight(40))];
    [xiuxiView addSubview:xiuxiLabel];
    
    _Restbutton=[[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH-wight(60)-15, 10, wight(60), hight(60))];
    _Restbutton.tag=300;
    [_Restbutton setImage:[UIImage imageNamed:@"cancel3"] forState:UIControlStateNormal];
   [_Restbutton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [xiuxiView addSubview:_Restbutton];
    
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(topView.bounds.size.width / 2.0 - 150.0 / 2.0, 0.0, 150.0, topView.bounds.size.height)];
    titleLable.text = hourTitle;
    titleLable.font = [UIFont systemFontOfSize:14.0];
    titleLable.textColor = [UIColor whiteColor];
    titleLable.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:titleLable];

    [self addButton:CGRectMake(0.0, 0.0, 60, topView.bounds.size.height)image:@"" text:@"取消" tag:100 superView:topView];
    [self addButton:CGRectMake(topView.bounds.size.width-60.0, 0.0, 60, topView.bounds.size.height) image:@"" text:@"确定" tag:200 superView:topView];
    
    UIPickerView *pickerView=[[UIPickerView alloc]initWithFrame:CGRectMake(0.0, xiuxiView.xmg_bottom+hight(20), self.bounds.size.width,hight(320))];
    pickerView.delegate=self;
    pickerView.dataSource=self;
    [pickerView selectRow:8 inComponent:1 animated:YES];
    [pickerView selectRow:0 inComponent:3 animated:YES];
    [pickerView selectRow:22 inComponent:5 animated:YES];
    [pickerView selectRow:0 inComponent:7 animated:YES];
    [bottomView addSubview:pickerView];
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect frame=bottomView.frame;
        frame.origin.y=self.bounds.size.height-frame.size.height;
        bottomView.frame=frame;
    } completion:^(BOOL finished){
    }];
}


-(void)chooseClick:(UIButton *)sender{
    [UIView animateWithDuration:0.3 animations:^{
        sender.selected = !_isChooseClicked ? NO : YES;
        [_Restbutton setImage:[UIImage imageNamed:(!_isChooseClicked ? @"select3" : @"cancel3")]  forState:UIControlStateNormal];
        if (_isChooseClicked==NO) {
        XQQLogFunc
        }else{
      
            XQQLogFunc
        }
    } completion:^(BOOL finished) {
        _isChooseClicked = !_isChooseClicked;
    }];
}
-(void)addButton:(CGRect)frame image:(NSString *)imageStr text:(NSString *)text tag:(NSInteger)tag superView:(UIView *)superView{
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14.0];
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    [superView addSubview:button];
}
#pragma mark UIPickerViewDelegate, UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    [pickerView.subviews enumerateObjectsUsingBlock:^(UIView *subview,NSUInteger idx,BOOL *stop){
        if (subview.bounds.size.height<2.0f) {
            subview.backgroundColor=[UIColor groupTableViewBackgroundColor];
        }
    }];
    return 8;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component==0) {
        return 1;
    }else if (component==1){
        return self.hourdatas1.count;
    }else if (component==2){
        return 1;
    }else if(component==3){
        return self.mindatas1.count;
    }else if (component==4){
        return 1;
    }else if (component==5){
        return self.hourdatas2.count;
    }else if (component==6){
        return 1;
    }else{
        return self.mindatas2.count;
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component==0) {
        return @"开始";
    }else if (component==1){
        return [self.hourdatas1 objectAtIndex:row];
    }else if (component==2){
        return @":";
    }else if(component==3){
        return  [self.mindatas1 objectAtIndex:row];
    }else if (component==4){
        return @"结束";
    }else if (component==5){
        return  [self.hourdatas2 objectAtIndex:row];
    }else if (component==6){
        return @":";
    }else{
        return [self.mindatas2 objectAtIndex:row];
    }
}
//每列的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if (component==0) {
        return 80;
    }else if (component==1){
        return 30;
    }else if (component==2){
        return 10;
    }else if(component==3){
        return 30;
    }else if (component==4){
        return 80;
    }else if (component==5){
        return 30;
    }else if (component==6){
        return 10;
    }else{
        return 30;
    }
    
    
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 50.0;
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:15]];
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    
    return pickerLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component==1) {
        NSString *hourStr=[self.hourdatas1 objectAtIndex:row];
        self.seletedhourStr1=hourStr;
    }else if(component==3){
        NSString *minStr=[self.mindatas1 objectAtIndex:row];
        self.seletedminStr1=minStr;
    }else if(component==5){
        NSString *minStr=[self.hourdatas2 objectAtIndex:row];
        self.seletedhourStr2=minStr;
    }else if(component==7){
        NSString *minStr=[self.mindatas2 objectAtIndex:row];
        self.seletedminStr2=minStr;
    }else{
        XQQLogFunc
    }
}

#pragma mark 点击事件
-(void)hidView:(UITapGestureRecognizer *)tapGesture{
    if (tapGesture.state == UIGestureRecognizerStateEnded) {
        CGPoint p=[tapGesture locationInView:self];
        CGRect frame=self.bottomView.frame;
        if (!CGRectContainsPoint(frame, p)) {
            [self removeFromSuperview];
        }
    }
}
- (void)onClick:(UIButton *)sender{
    if (sender.tag==100) {
        _btnTag=100;
        [self removeFromSuperview];
    }else if(sender.tag==200){
        if (self.done) {
            if (!self.seletedhourStr1) {
                self.seletedhourStr1=[self.hourdatas1 objectAtIndex:8];
            }
            if(!self.seletedminStr1){
                self.seletedminStr1=[self.mindatas1 firstObject];
            }
            if(!self.seletedhourStr2){
                self.seletedhourStr2=[self.hourdatas2 objectAtIndex:22];
            }
            if(!self.seletedminStr2){
                self.seletedminStr2=[self.mindatas2 firstObject];
            }
            self.done(self.seletedhourStr1,self.seletedminStr1,self.seletedhourStr2,self.seletedminStr2);
            [self removeFromSuperview];
        }
    }else{
        _btnTag=300;
        [UIView animateWithDuration:0.3 animations:^{
            sender.selected = !_isChooseClicked ? NO : YES;
            [_Restbutton setImage:[UIImage imageNamed:(!_isChooseClicked ? @"select3" : @"cancel3")]  forState:UIControlStateNormal];
            if (_isChooseClicked==NO) {
                if (self.done) {
                    NSString *one=@"全";
                    NSString *two=@"天";
                    NSString *three=@"休";
                    NSString *four=@"息";
                    self.done(one,two,three,four);
                    [self removeFromSuperview];
                    
                }
            }else{
                
                XQQLogFunc
            }
        } completion:^(BOOL finished) {
            _isChooseClicked = !_isChooseClicked;
        }];
    }
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:nil object:self];
}
@end
