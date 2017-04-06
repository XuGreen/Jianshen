//
//  AttentionStringViewController.m
//  FitNess
//
//  Created by xuqq on 2017/3/28.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "AttentionStringViewController.h"

@interface AttentionStringViewController ()<UITextViewDelegate>
@property (nonatomic, strong) UIView        *dynamicInfoView;
@property (nonatomic, strong) UITextView    *inputView;
@property (nonatomic, strong) UILabel       *showTipsLabel;

@end

@implementation AttentionStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self CreateInputView];
}


-(void)setNav{
    self.view.backgroundColor=COMMONRBGCOLOR;
    self.navigationItem.title=@"注意事项";
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
-(void)action_onBackButton:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)CompleteButton:(UIButton *)sender{
    [self.delegate AttentionStringWithName:_inputView.text];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)CreateInputView{
    [containerView addSubview:self.dynamicInfoView];
    _inputView = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, SCREENWIDTH - 15, SCREENHEIGHT-49)];
    _inputView.backgroundColor=[UIColor clearColor];
    _inputView.textColor = [tools colorWithHex:0x333333];
    _inputView.font = [UIFont systemFontOfSize:15];
    _inputView.delegate = self;
    _inputView.text=_Detail;
    [self.dynamicInfoView addSubview:_inputView];
    [self.dynamicInfoView addSubview:self.showTipsLabel];
}
#pragma mark - <UITextViewDelegate>
- (void)textViewDidChange:(UITextView *)textView {
    if ([textView.text isEqualToString:@""]) {
        self.showTipsLabel.hidden = NO;
    } else {
        self.showTipsLabel.hidden = YES;
    }
}
#pragma mark -懒加载
- (UIView *)dynamicInfoView {
    if (!_dynamicInfoView) {
        _dynamicInfoView = ({
            UIView  *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-49)];
            view.backgroundColor =COMMONRBGCOLOR;
            view;
        });
    }
    return _dynamicInfoView;
}
- (UILabel *)showTipsLabel {
    if (!_showTipsLabel) {
        _showTipsLabel = [[UILabel alloc]initWithFrame:CGRectMake(13, 13, SCREENWIDTH, 20)];
        _showTipsLabel.textColor = [tools colorWithHex:0x999999];
        _showTipsLabel.font = [UIFont systemFontOfSize:15];
        if (!_Detail) {
               _showTipsLabel.text = @"添加文字来对你的产品进行描述吧...";
        }
    }
    return _showTipsLabel;
}
@end
