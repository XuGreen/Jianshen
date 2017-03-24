//
//  CollectionHotProjectViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/24.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionHotProjectViewCell : UICollectionViewCell
@property(nonatomic,strong)UIImageView *projectImageView;
@property(nonatomic,strong)UILabel          *youhuiLabel;
@property(nonatomic,strong)UILabel          *jianLabel;
@property(nonatomic,strong)UILabel          *projectLabel;
@property(nonatomic,strong)UIView           *starView;
@property(nonatomic,strong)UIImageView   *personImage;
@property(nonatomic,strong)UILabel          *personName;
@property(nonatomic,strong)UILabel          *likeNumber;
@property(nonatomic,strong)UILabel          *projectPrice;
@end
