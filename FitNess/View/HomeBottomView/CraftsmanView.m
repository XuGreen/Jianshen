//
//  CraftsmanView.m
//  FitNess
//
//  Created by xuqq on 2017/3/20.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "CraftsmanView.h"

@implementation CraftsmanView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}
-(void)initUI{
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
    static NSString *identify = @"BottomCell";
    CollectionBottomViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    return cell;
}
#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake(wight(375),hight(620));
}
#pragma mark  定义整个CollectionViewCell与整个View的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0;
}
#pragma mark  定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0;
}
-(UICollectionView *)collectView{
    if (!_collectView) {
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing=0;
        layout.minimumLineSpacing=0;
        _collectView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectView.backgroundColor = [UIColor whiteColor];
        _collectView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _collectView.delegate = self;
        _collectView.dataSource = self;
        [_collectView setShowsHorizontalScrollIndicator:NO];
        [_collectView setShowsVerticalScrollIndicator:NO];
        _collectView.scrollEnabled=NO;
        [self.collectView registerClass:[CollectionBottomViewCell class] forCellWithReuseIdentifier:@"BottomCell"];
    }
    return _collectView;
}

-(void)setData:(NSArray *)data{
    _data = data;
    [self.collectView reloadData];
}
@end
