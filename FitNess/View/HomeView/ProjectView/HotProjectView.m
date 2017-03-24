//
//  HotProjectView.m
//  FitNess
//
//  Created by xuqq on 2017/3/24.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "HotProjectView.h"
static NSString *kheaderIdentifier = @"headerIdentifier";
static NSString *kfootIdentifier = @"footIdentifier";

@implementation HotProjectView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
          [self.collectView registerClass:[CollectionHeadReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kheaderIdentifier];
        [self.collectView registerClass:[CollectionFootViewReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kfootIdentifier];
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.collectView];
}
#pragma mark  设置CollectionView每组所包含的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //    return self.data.count;
    return 4;
    
}
#pragma mark  设置CollectionCell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"ProjectCell";
    CollectionHotProjectViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    return cell;
}
#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake(wight(362),hight(564));
}
#pragma mark  定义整个CollectionViewCell与整个View的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(wight(8), wight(8), wight(8), wight(8));
}

#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return wight(8);
}
#pragma mark  定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return wight(8);
}

#pragma mark UICollectionViewDelegate UICollectionViewDataSource


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableView=nil;
    
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]){
        CollectionHeadReusableView *reusableHeadView =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:kheaderIdentifier   forIndexPath:indexPath];
        reusableView = reusableHeadView;
    }
    if ([kind isEqualToString: UICollectionElementKindSectionFooter]){
        CollectionFootViewReusableView *reusablefootView =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:kfootIdentifier   forIndexPath:indexPath];

        reusableView = reusablefootView;
    }
    return reusableView;
    
}
//返回头headerView的大小

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={SCREENWIDTH,hight(110)};
    return size;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    CGSize size={SCREENWIDTH,hight(120)};
    return size;
}
#pragma mark -collectionview
-(UICollectionView *)collectView{
    if (!_collectView) {
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing=0;
        layout.minimumLineSpacing=0;
        _collectView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectView.backgroundColor = COMMONRBGCOLOR;
        _collectView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _collectView.delegate = self;
        _collectView.dataSource = self;
        [_collectView setShowsHorizontalScrollIndicator:NO];
        [_collectView setShowsVerticalScrollIndicator:NO];
        _collectView.scrollEnabled=NO;
        [self.collectView registerClass:[CollectionHotProjectViewCell class] forCellWithReuseIdentifier:@"ProjectCell"];
    }
    return _collectView;
}
-(void)setData:(NSArray *)data{
    _data = data;
    [self.collectView reloadData];
}
@end
