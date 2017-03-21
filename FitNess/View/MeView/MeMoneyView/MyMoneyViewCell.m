//
//  MyMoneyViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/21.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "MyMoneyViewCell.h"
@interface MyMoneyViewCell()
@property(nonatomic,strong)UIView *backView;
@property(nonatomic,strong)UIView *MyMoneyView;
@end
@implementation MyMoneyViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    _backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(400))];
    _backView.backgroundColor=COMMONRBGCOLOR;
    [self addSubview:self.backView];
    //我的钱包
    _MyMoneyView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(80))];
    _MyMoneyView.backgroundColor=[UIColor whiteColor];
    [self.backView addSubview:self.MyMoneyView];
    UILabel *MoneyLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, hight(24), wight(220), hight(32))];
    MoneyLabel.text=@"我的钱包";
    MoneyLabel.textColor=[tools colorWithHex:0x333333];
    MoneyLabel.font=[UIFont systemFontOfSize:17];
    [self.MyMoneyView addSubview:MoneyLabel];
    [self.MyMoneyView addSubview:[self addLineView:CGRectMake(0, _MyMoneyView.xmg_height-1.5, SCREENWIDTH, 1.5) color:LINECOLOR]];
    NSArray *titleArray=[NSArray arrayWithObjects:@"余额", @"优惠券",@"帮贡",nil];
    NSArray  *ImageArray=[NSArray arrayWithObjects:@"overage", @"coupon", @"contribution", nil];
    for (int i=0; i<3; i++) {
        UIView *myView=[[UIView alloc]initWithFrame:CGRectMake(0, self.MyMoneyView.xmg_bottom+hight(100)*i, SCREENWIDTH, hight(100))];
        myView.backgroundColor=[UIColor whiteColor];
        [self.backView addSubview:myView];
        UIImageView *logoImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, wight(60), hight(60))];
        logoImage.image = [UIImage imageNamed:ImageArray[i]];
        [myView addSubview:logoImage];
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(logoImage.xmg_right+10, hight(24), 70, 30)];
        title.text = titleArray[i];
        title.textAlignment=NSTextAlignmentLeft;
        title.textColor = [tools colorWithHex:0x333333];
        title.font =[UIFont systemFontOfSize:15];
        [myView addSubview:title];
        if (i==0) {
            UILabel *number = [[UILabel alloc]initWithFrame:CGRectMake(title.xmg_right, hight(24), 80, 30)];
            number.text = @"500.00";
            number.textAlignment=NSTextAlignmentLeft;
            number.textColor = [tools colorWithHex:0xFF0000];
            number.font =[UIFont systemFontOfSize:15];
            [myView addSubview:number];
            
            UILabel *rightNow = [[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-90,hight(24), 80, 30)];
            rightNow.text = @"立即充值";
            rightNow.textAlignment=NSTextAlignmentLeft;
            rightNow.textColor = [tools colorWithHex:0x999999];
            rightNow.font =[UIFont systemFontOfSize:14];
            [myView addSubview:rightNow];
        }else if (i==1){
            UILabel *number = [[UILabel alloc]initWithFrame:CGRectMake(title.xmg_right, hight(24), 80, 30)];
            number.text = @"3";
            number.textAlignment=NSTextAlignmentLeft;
            number.textColor = [tools colorWithHex:0xFF0000];
            number.font =[UIFont systemFontOfSize:15];
            [myView addSubview:number];
            
        }else{
            UILabel *number = [[UILabel alloc]initWithFrame:CGRectMake(title.xmg_right, hight(24), 80, 30)];
            number.text = @"200点";
            number.textAlignment=NSTextAlignmentLeft;
            number.textColor = [tools colorWithHex:0xFF0000];
            number.font =[UIFont systemFontOfSize:15];
            [myView addSubview:number];
            
        }
        UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH - wight(50), hight(38), wight(18), hight(30))];
        arrow.image = [UIImage imageNamed:@"right"];
        [myView addSubview:arrow];
        if (i==0 || i==1) {
              [myView addSubview:[self addLineView:CGRectMake(CGRectGetMinX(logoImage.frame), myView.xmg_height-1.5, SCREENWIDTH-30, 1) color:LINECOLOR]];
        }
    
        
    }
}
- (UIView *)addLineView : (CGRect)frame color : (UIColor *)color{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}
+ (instancetype)MyMoneyViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[MyMoneyViewCell class] forCellReuseIdentifier:identifier];
    return  [tableView dequeueReusableCellWithIdentifier:identifier];
}
@end
