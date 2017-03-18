//
//  HeadView.m
//  FitNess
//
//  Created by xuqq on 2017/3/17.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "HeadView.h"
//顶部 UIView视图
@interface HeadView()
@property(nonatomic,strong) UIView *headView;
@end
@implementation HeadView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _dataArr=[[NSMutableArray alloc]init];
        [self initUI];
        [self getData];
    
    }
    return self;
}
-(void)initUI{
    _headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, wight(900))];
    _headView.backgroundColor=[UIColor whiteColor];
    [self addSubview:_headView];
    //构建广告视图
    _imageArray=@[@"banner1",@"banner1",@"banner1",@"banner1"];
    //设置顶部轮播器
    SDCycleScrollView *scrollView=[[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, wight(400))];
    scrollView.delegate=self;
    scrollView1=  scrollView;
    //设置分页位置
    scrollView1.pageControlAliment=SDCycleScrollViewPageContolAlimentCenter;
    //设置时间间隔
    scrollView1.autoScrollTimeInterval=3.0;
    //设置当前分页圆点颜色
    scrollView1.currentPageDotColor=[UIColor colorWithRed:255/255.0 green:184/255.0 blue:31/255.0 alpha:1.0] ;
    //设置其他分页圆点颜色
    scrollView1.pageDotColor=[UIColor lightGrayColor];
    //设置动画样式
    scrollView1.pageControlStyle=SDCycleScrollViewPageContolStyleClassic;
    [_headView addSubview:scrollView1];
    scrollView1.localizationImageNamesGroup=_imageArray;
    
    UIImage *bgImage = [UIImage imageNamed:@"inner_bg_tou.png"];
    UIImageView *bg_tou_ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0,scrollView1.frame.size.width, scrollView1.frame.size.height)];
    bg_tou_ImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    bg_tou_ImageView.image = bgImage;
    [scrollView1 addSubview:bg_tou_ImageView];
    //功能分类模块
    FunctionView *functionView=[[FunctionView alloc]initWithFrame:CGRectMake(0, scrollView1.xmg_bottom, SCREENWIDTH, wight(350))];
    [_headView addSubview:functionView];
    
    [_headView addSubview:[self addLineView:CGRectMake(10, functionView.xmg_bottom+10, SCREENWIDTH-25, 1) color:LINECOLOR]];
    //热门咨询
    UIView *remenView=[[UIView alloc]initWithFrame:CGRectMake(0, functionView.xmg_bottom+20, SCREENWIDTH, wight(120))];
    remenView.backgroundColor=[UIColor clearColor];
    [_headView addSubview:remenView];
    
    UIImageView *remenImage=[[UIImageView alloc]initWithFrame:CGRectMake(15, 0, 50, 50)];
    remenImage.image=[UIImage imageNamed:@"Information"];
    [remenView addSubview:remenImage];
    [remenView addSubview:[self addLineView:CGRectMake(remenImage.xmg_width+35, 0, 1, 50) color:LINECOLOR]];
    //滚动字体
    _TopLineView = [[ZYJHeadLineView alloc]initWithFrame:CGRectMake(remenImage.xmg_width+50, 0, SCREENHEIGHT-300, wight(100))];
    _TopLineView.backgroundColor = [UIColor whiteColor];
    __weak __typeof(self)weakSelf = self;
    _TopLineView.clickBlock = ^(NSInteger index){
        ZYJHeadLineModel *model = weakSelf.dataArr[index];
        NSLog(@"%@,%@",model.type,model.title);
    };
    [remenView addSubview:_TopLineView];
}
- (UIView *)addLineView : (CGRect)frame color : (UIColor *)color{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}
#pragma mark-获取数据
- (void)getData
{
    NSArray *arr1 = @[@"火热",@"头条"];
    NSArray *arr2 = @[@"想要获得更有效的训练",@"如何锻炼出性感的马甲线"];
    for (int i=0; i<arr2.count; i++) {
        ZYJHeadLineModel *model = [[ZYJHeadLineModel alloc]init];
        model.type = arr1[i];
        model.title = arr2[i];
        [_dataArr addObject:model];
    }
    [_TopLineView setVerticalShowDataArr:_dataArr];
}
#pragma mark - 轮播器代理方法
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了图片%ld",(long)index);
}

@end
