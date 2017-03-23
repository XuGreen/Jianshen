//
//  JobsViewCell.m
//  FitNess
//
//  Created by xuqq on 2017/3/22.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "JobsViewCell.h"
#import "HZPhotoBrowser.h"
#import "PhotoModel.h"
@interface JobsViewCell()<HZPhotoBrowserDelegate>{
    UIView *backView;

}

@end

@implementation JobsViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 清除图片缓存，便于测试
        [[SDWebImageManager sharedManager].imageCache clearDisk];

        [self initUI];
    }
    return self;
}
- (void)initUI{
    backView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(520))];
    backView.backgroundColor=COMMONRBGCOLOR;
    [self addSubview:backView];
    _JobView=[[UIView alloc]initWithFrame:CGRectMake(0, 15, SCREENWIDTH, backView.xmg_height-15)];
    _JobView.backgroundColor=[UIColor whiteColor];
    [backView addSubview:self.JobView];
    [_JobView addSubview:self.Position];
    [_JobView addSubview:self.workingAge];
    [_JobView addSubview:self.jobNature];
    [_JobView addSubview:self.pubDate];
    [_JobView addSubview:self.Pay];
    [_JobView addSubview:self.area];
    _photoItemArray=[NSArray arrayWithObjects:@"background",@"background",@"background", nil];
    for (int i=0; i<_photoItemArray.count; i++) {
        _PositionImage=[[UIImageView alloc]initWithFrame:CGRectMake(15+((hight(225)+5)*i), _Pay.xmg_bottom+10, hight(224),wight(224))];
        _PositionImage.image=[UIImage imageNamed:_photoItemArray[i]];
        _PositionImage.userInteractionEnabled=YES;
        _PositionImage.maskView.contentMode = UIViewContentModeScaleAspectFill;
        _PositionImage.clipsToBounds = YES;
        
        [_JobView addSubview:self.PositionImage];
    }
    if (_photoItemArray.lastObject) {
        UIView *mengView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, _PositionImage.xmg_width, _PositionImage.xmg_height)];
        mengView.backgroundColor=[tools colorWithHex:0x000000];
        mengView.alpha=0.6;
        [_PositionImage addSubview:mengView];
        UILabel *addLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, _PositionImage.xmg_width, _PositionImage.xmg_height)];
        addLabel.text=@"+5";
        addLabel.textAlignment=NSTextAlignmentCenter;
        addLabel.textColor=[UIColor whiteColor];
        [_PositionImage addSubview:addLabel];
    }
    [_JobView addSubview:self.userImage];
    [_JobView addSubview:self.userName];
    [_JobView addSubview:self.userCompany];
    [_JobView addSubview:self.ChatBtn];
}
//职位
- (UILabel *)Position
{
    if (!_Position) {
        NSString * str=@"收银员大概";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        _Position=[[UILabel alloc]initWithFrame:CGRectMake(15, 10, tempRect.size.width, tempRect.size.height)];
        _Position.text=str;
        _Position.textColor=[tools colorWithHex:0x333333];
        _Position.font=[UIFont systemFontOfSize:15];
    }
    return _Position;
}
//工作经验
-(UILabel *)workingAge{
    if (!_workingAge) {
        NSString * str=@"2-3年";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        _workingAge=[[UILabel alloc]initWithFrame:CGRectMake(_Position.xmg_right+5, 10, tempRect.size.width, tempRect.size.height)];
        _workingAge.text= str;
        _workingAge.textColor=[tools colorWithHex:0x333333];
        _workingAge.font=[UIFont systemFontOfSize:15];
    }
    return _workingAge;
}
//工作性质
- (UILabel *)jobNature{
    if (!_jobNature) {
        _jobNature=[[UILabel alloc]initWithFrame:CGRectMake(_workingAge.xmg_right+5, 8, wight(80), hight(40))];
        _jobNature.backgroundColor=[tools colorWithHex:0xFF5a00];
        _jobNature.layer.cornerRadius=5;
        _jobNature.layer.masksToBounds=YES;
        _jobNature.textAlignment=NSTextAlignmentCenter;
        _jobNature.text=@"全职";
        _jobNature.textColor=[tools colorWithHex:0xffffff];
        _jobNature.font=[UIFont systemFontOfSize:14];
    }
    return _jobNature;
}
//发布时间
-(UILabel *)pubDate{
    if (!_pubDate) {
        NSString * str=@"2小时前";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil];
        _pubDate=[[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-tempRect.size.width-10, 10, tempRect.size.width, tempRect.size.height)];
        _pubDate.text=str;
        _pubDate.textColor=[tools colorWithHex:0x999999];
        _pubDate.font=[UIFont systemFontOfSize:13];

    }
    return _pubDate;
}
//薪资
- (UILabel *)Pay{
    if (!_Pay) {
        NSString * str=@"2000-3500";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(35)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} context:nil];
        _Pay=[[UILabel alloc]initWithFrame:CGRectMake(15, _Position.xmg_bottom+5,  tempRect.size.width, tempRect.size.height)];
        _Pay.text=str;
        _Pay.textColor=[tools colorWithHex:0xFF5A00];
    }
    return _Pay;
}
//工作地区
- (UILabel *)area{
    if (!_area) {
        NSString * str=@"成都市-锦江区";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
        _area=[[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-tempRect.size.width-10, _pubDate.xmg_bottom+10, tempRect.size.width, tempRect.size.height)];
        _area.text=str;
        _area.textColor=[tools colorWithHex:0x333333];
        _area.font=[UIFont systemFontOfSize:14];
    }
    return _area;
}

//发布者头像
-(UIImageView *)userImage{
    if (!_userImage) {
        _userImage=[[UIImageView alloc]initWithFrame:CGRectMake(15, _PositionImage.xmg_bottom+15, wight(80), hight(80))];
        _userImage.image=[UIImage imageNamed:@"bg"];
        _userImage.layer.masksToBounds=YES;
        _userImage.layer.cornerRadius=_userImage.xmg_width/2;
    }
    return _userImage;
}
//发布者姓名
- (UILabel *)userName{
    if (!_userName) {
        NSString * str=@"王女士";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
        _userName=[[UILabel alloc]initWithFrame:CGRectMake(_userImage.xmg_right+5, _userImage.xmg_y+2, tempRect.size.width, tempRect.size.height)];
        _userName.text=@"王女士";
        _userName.textColor=[tools colorWithHex:0x333333];
        _userName.font=[UIFont systemFontOfSize:16];
    }
    return _userName;
}
//发布公司
- (UILabel *)userCompany{
    if (!_userCompany) {
        NSString * str=@"三百勇士国际健身会所";
        CGRect tempRect=[str boundingRectWithSize:CGSizeMake(SCREENWIDTH-40, hight(28)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} context:nil];
        _userCompany=[[UILabel alloc]initWithFrame:CGRectMake(_userImage.xmg_right+5, _userName.xmg_bottom+5, tempRect.size.width, tempRect.size.height)];
        _userCompany.text=str;
        _userCompany.textColor=[tools colorWithHex:0x666666];
        _userCompany.font=[UIFont systemFontOfSize:11];
    }
    return _userCompany;

}
//私聊
- (UIButton *)ChatBtn{
    if (!_ChatBtn) {
        _ChatBtn=[[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH-wight(200), _PositionImage.xmg_bottom+27, wight(180), hight(50))];
        _ChatBtn.layer.cornerRadius=12.5;
        _ChatBtn.layer.borderColor=[[tools colorWithHex:0xff5a00] CGColor];
        _ChatBtn.layer.borderWidth=1.0;
        [_ChatBtn setTitle:@"私聊" forState: UIControlStateNormal];
        _ChatBtn.titleLabel.font=[UIFont systemFontOfSize:14];
        [_ChatBtn setTitleColor:[tools colorWithHex:0xff5a00] forState:UIControlStateNormal];
    }
    return _ChatBtn;
}

+ (instancetype)JobsViewCell:(UITableView *)tableView{
    NSString *identifier=NSStringFromClass([self class]);
    [tableView registerClass:[JobsViewCell class] forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}
@end
