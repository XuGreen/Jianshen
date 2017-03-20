//
//  CraftsmanFootView.m
//  FitNess
//
//  Created by xuqq on 2017/3/20.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "CraftsmanFootView.h"

static NSString *kheaderIdentifier = @"headerIdentifier";

@implementation CraftsmanFootView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.collectView registerClass:[CollectionReusableHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kheaderIdentifier];
    }
    return self;
}
#pragma mark UICollectionViewDelegate UICollectionViewDataSource


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableView;
    
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]){
        CollectionReusableHeadView *reusableHeadView =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:kheaderIdentifier   forIndexPath:indexPath];
        reusableView = reusableHeadView;
    }
    return reusableView;
    
}
//返回头headerView的大小

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={SCREENWIDTH,hight(100)};
    return size;
}
@end
