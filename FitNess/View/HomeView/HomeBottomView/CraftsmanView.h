//
//  CraftsmanView.h
//  FitNess
//
//  Created by xuqq on 2017/3/20.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionBottomViewCell.h"

@interface CraftsmanView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) UICollectionView *collectView;

@property(nonatomic,strong) NSArray *data;
@end
