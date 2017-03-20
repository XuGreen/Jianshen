//
//  ChoseViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/20.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ChoseViewController.h"
#import "LoginViewController.h"

@interface ChoseViewController (){
     CGFloat popViewHeight;
      UIView    *popView;
}
@end

@implementation ChoseViewController
- (instancetype)init {
    self = [super init];
    if (self) {
        [self configNavigationController];
    }
    return self;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}
#pragma mark - 私有方法
- (void)configNavigationController {
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreatPopView];
}
- (void)CreatPopView{
    popView=[[UIView alloc]initWithFrame:CGRectMake(40, SCREENWIDTH/2, SCREENWIDTH-80, 120)];
    popView.backgroundColor=[UIColor clearColor];
    popView.layer.cornerRadius = 5;
    popView.layer.masksToBounds = YES;
    [self.view addSubview:popView];
    NSArray *titleArray=[NSArray arrayWithObjects:@"实名认证",@"资质认证", nil];
    NSArray *imageArray=[NSArray arrayWithObjects:@"phone",@"password", nil];
    for (int i=0; i<2; i++) {
         UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, i*60, popView.xmg_width, 60)];
        view.backgroundColor=[UIColor whiteColor];
        view.tag = i;
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextButtonAction:)];
        [view addGestureRecognizer:singleTap];
        [popView addSubview:view];
        UIImageView *logoImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, 20, 30, 30)];
        logoImage.image = [UIImage imageNamed:imageArray[i]];
        [view addSubview:logoImage];

        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(60, 0, SCREENWIDTH-100, 30.0f)];
        label.text=titleArray[i];
        label.textAlignment=NSTextAlignmentLeft;
        label.font=[UIFont fontWithName:@"Avenir-Book" size:14.0f];
        [view addSubview:label];
        if (i==0) {
            _realNameStatusLable=[[UILabel alloc]initWithFrame:CGRectMake(60, label.xmg_bottom, SCREENWIDTH-100, 30.0f)];
            _realNameStatusLable.text=@"你还未认证";
            _realNameStatusLable.textAlignment=NSTextAlignmentLeft;
            _realNameStatusLable.font=[UIFont fontWithName:@"Avenir-Book" size:14.0f];
            [view addSubview:_realNameStatusLable];
        }else{
            _ziZhiStatusLable=[[UILabel alloc]initWithFrame:CGRectMake(60, label.xmg_bottom, SCREENWIDTH-100, 30.0f)];
            _ziZhiStatusLable.text=@"你还未认证";
            _ziZhiStatusLable.textAlignment=NSTextAlignmentLeft;
            _ziZhiStatusLable.font=[UIFont fontWithName:@"Avenir-Book" size:14.0f];
            [view addSubview:_ziZhiStatusLable];
        }
        UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENWIDTH - 22, 30, 8, 12)];
        arrow.image = [UIImage imageNamed:@"right"];
        [view addSubview:arrow];
        
        [view addSubview:[self addLineView:CGRectMake(i == 2 ? 0 : 0, 69, SCREENWIDTH-80, 1) color:LINECOLOR]];
        
    }
}
-(void)setRealNameStatus:(NSInteger)realNameStatus{
    _realNameStatus = realNameStatus;
    //实名认证
    switch (_realNameStatus) {
        case 1: //未认证

            self.realNameStatusLable.text = @"未实名认证,请认证";
            
            break;
        case 2: //认证中

            self.realNameStatusLable.text = @"实名认证中,请等待";
            break;
        case 3: //认证通过

            self.realNameStatusLable.text = @"实名认证已通过";
            break;
        case 4: //认证未通过
            self.realNameStatusLable.text = @"实名认证未通过，请重新认证";
            break;
            
        default:
            break;
    }

}
- (void)setRealZiZhiStatus:(NSInteger)realZiZhiStatus{
    _realZiZhiStatus=realZiZhiStatus;
    //实名认证
    switch (_realZiZhiStatus) {
        case 1: //未认
   
            self.ziZhiStatusLable.text = @"未进行资质认证,请认证";
            break;
        case 2: //认证中
     
            self.ziZhiStatusLable.text = @"资质认证中,请等待";
            break;
        case 3: //认证通过

            self.ziZhiStatusLable.text = @"资质认证已通过";
            break;
        case 4: //认证未通过
            self.ziZhiStatusLable.text = @"资质认证未通过，请重新认证";
            break;
        default:
            break;
    }

}
- (UIView *)addLineView : (CGRect)frame color : (UIColor *)color{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}
- (void)nextButtonAction: (id)sender {
    UITapGestureRecognizer *singleTap = (UITapGestureRecognizer *)sender;
    int index = (int)[singleTap view].tag;
    if (index==0) {
        XQQLog(@"实名认证");
        LoginViewController *login=[[LoginViewController alloc]init];
        [self.navigationController pushViewController:login animated:YES];
    }else{
        XQQLog(@"资质认证");
 
    }
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}
-(void)show{
    [UIView animateWithDuration:.4f animations:^{
        popView.alpha = 1;
        popView.frame = CGRectMake(40,(SCREENHEIGHT - popViewHeight)/2, SCREENWIDTH - 80, popViewHeight);
    }];
    [self.view.superview layoutIfNeeded];
    
}
-(void)dismiss{
    [UIView animateWithDuration:0.4f animations:^{
        popView.alpha = 0;
        popView.frame = CGRectMake(40, SCREENHEIGHT, SCREENWIDTH - 80, popViewHeight);
    }completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        
    }];
}


@end
