//
//  HotProjectView.h
//  FitNess
//
//  Created by xuqq on 2017/3/24.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionHeadReusableView.h"
#import "CollectionFootViewReusableView.h"
#import "CollectionHotProjectViewCell.h"
@interface HotProjectView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) UICollectionView *collectView;

@property(nonatomic,strong) NSArray *data;

@end
