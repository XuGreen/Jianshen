//
//  ProductDetailViewController.h
//  FitNess
//
//  Created by xuqq on 2017/3/28.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InputProductDetailDelegate <NSObject>

@optional
- (void)InputProductDetailWithName : (NSString *)name;
@end
@interface ProductDetailViewController : BaseViewController
@property(nonatomic,weak)id <InputProductDetailDelegate>delegate;
@property(nonatomic,strong) NSString    *Detail;//  预约时间
@end
