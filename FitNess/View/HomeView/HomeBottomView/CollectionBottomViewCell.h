//
//  CollectionBottomViewCell.h
//  FitNess
//
//  Created by xuqq on 2017/3/17.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionBottomViewCell : UICollectionViewCell
@property(nonatomic,strong)UIImageView *ShouImageView;
@property(nonatomic,strong)UILabel          *ShouName;
@property(nonatomic,strong)UILabel          *ShouType;
@property(nonatomic,strong)UILabel          *ShouStar;
@property(nonatomic,strong)UILabel          *ShouStrong;
@property(nonatomic,strong)UILabel          *ShouFans;
@property(nonatomic,strong)UIButton        *YueBtn;

@end
